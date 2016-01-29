----------------------------------------
--$Id: cron_log_www_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询获取登陆服务器上面的登陆过程日志
--
--]]

local MAX_THREAD_NUM = 30 --最多并发的线程数量
local INDEX_NAME = "PhpLog" --统计指标
--前面的HostID和后面的时间都不要在这里填
local Cols = {"IMEI", "HostID", "Step", "PhoneInfo"}
--区别判断重复的数据，用于统计时间点的数据比对
local UniqueKey = "IMEI"
local StepMap = { --登陆状态转换
	["Open"] = 1, --点击游戏图标
	["ShowLogin"] = 2, --账号登陆界面
	["Web"] = 3, --点击系统公告
	["ServerList"] = 4, -- 达到选服界面
}

--获得服务器状态列表
function GetServerStatusMap(self)
	local AllServers = ServerData:GetAllServers() 
	local StatusMap = {}
	for _, ServerInfo in ipairs(AllServers) do
		StatusMap[ServerInfo.hostid] = ServerInfo.status
	end
	return StatusMap
end

--获得该模块的执行周期
function GetFrequency(self, IndexName)
	local IndexInfo = StaticsIndexData:Get({IndexName = IndexName})
	if not IndexInfo or not IndexInfo[1] then
		return 300 --默认是5分钟
	end
	local Frequency = IndexInfo[1].Frequency
	Frequency = Frequency * 60 --折算成秒
	return Frequency
end

--获得该平台下面需要统计的日志文件名以及从哪个开始时间开始拉取数据
function GetFileInfo(self, PlatformID)
	local FileNames = {}
	local FileMap = {}
	local StartTimes = {}
	local StartTimeMap = {}
	local StartDate = os.date("%Y-%m-%d",ngx.time()) 
	local DefaultTime = os.date("%Y-%m-%d %H:%M:%S",GetTimeStamp(StartDate .. " 00:00:00"))  --默认是当天的0点
	local SDKInfo = ServerData:GetServerSDKInfo(nil, PlatformID)
	for _, Info in ipairs(SDKInfo) do
		local SDKName = Info.sdkname
		local SDKNames = string.split(SDKName, "_")
		if #SDKNames >= 3 then
			local FileName =  table.concat({SDKNames[1], SDKNames[2], SDKNames[3]}, "_") .. ".log"
			--获得开始时间
			local TFileName = PlatformID .. "_" .. FileName --统计指标中的文件名
			local Res = StaticsModuleData:Get({HostID = CommonData.W3_HOSTID, FileName = TFileName, IndexName = INDEX_NAME})
			local StartTime = DefaultTime
			if Res and Res[1] then
				StartTime = Res[1]["StaticsTime"]
			end
			StartTimeMap[FileName] = StartTime
			FileMap[FileName] = true
		end
	end
	for FileName, _ in pairs(FileMap) do
		table.insert(FileNames, FileName)
		table.insert(StartTimes, StartTimeMap[FileName])
	end
	return FileNames, StartTimes, StartTimeMap
end


function CronExecute(self)
	local ServerPlatformMap = ServerData:GetStaticsServers()
	local ServerStatusMap = self:GetServerStatusMap()
	local ThreadList = {} -- 线程列表
	local PlatformList = {}
	for HostID, _ in pairs(ServerPlatformMap) do
		--只统计服务器状态不为维护或者异常的服
		if ServerStatusMap[HostID] ~= 0 and ServerStatusMap[HostID] ~= 5 then
			local TPlatformIDList = CommonFunc.GetPlatformListByHostID(HostID)
			for _, PlatformID in ipairs(TPlatformIDList) do
				PlatformList[PlatformID] = true
			end
		end
	end
	--请求这些平台的登陆服务器的登陆过程日志
	local Frequency = self:GetFrequency(INDEX_NAME)
	ExecuteTime = CommonFunc.GetCorrectTime(Frequency)
	ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
	for PlatformID, _ in pairs(PlatformList) do
		local PlatformInfo = PlatformData:GetPlatform(PlatformID)
		local FileNames, StartTimes, StartTimeMap = self:GetFileInfo(PlatformID)
		if PlatformInfo and PlatformInfo[1] and #FileNames >= 0 then
			local W3Url = PlatformInfo[1].W3Url
			--获得文件名
			if W3Url and W3Url ~= "" then 
				local ThreadParams = {
					W3Url = W3Url,
					PlatformID = PlatformID, 
					HostID = CommonData.W3_HOSTID,
					FileNames = table.concat( FileNames, ","),
					StartTimes = table.concat( StartTimes, ","),
					StartTimeMap = StartTimeMap,
					ExecuteTime = ExecuteTime
				}
				table.insert(ThreadList, ThreadParams)
			end
			
		end
	end
	local X = 0
	local SubThreadList = {}
	for _, ThreadParams in ipairs(ThreadList) do
		if X >= MAX_THREAD_NUM then --已经达到MAX_THREAD_NUM，等待结果
			for _, Thread in ipairs(SubThreadList) do
				local Flag, Res = ngx.thread.wait(Thread)
			end
			SubThreadList = {} --清空
			X = 0 --置为0
		end
		local Thread, Err = ngx.thread.spawn(ThreadExecute, self, ThreadParams)
		if Thread then
			table.insert(SubThreadList, Thread)
			X = X + 1
		end
	end
	for _, Thread in ipairs(SubThreadList) do
		local Flag, Res = ngx.thread.wait(Thread)
	end
	ngx.say("ok")
end

--线程执行
function ThreadExecute(self, Params)
	local Url = Params.W3Url .. ":7633/getlog"
	local NewParams = {
		PlatformID = Params.PlatformID, 
		HostID = CommonData.W3_HOSTID,
		FileNames = Params.FileNames,
		StartTimes = Params.StartTimes,
	}
	local Flag, Response = ReqOutUrl(Url, NewParams)
	ngx.say(Response)
	Response  = UnSerialize(Response) 
	if Flag then
		self:HandleResponse(Params.PlatformID, CommonData.W3_HOSTID, Response, Params.ExecuteTime, Params.StartTimeMap)
	end
	ngx.say("done")
end

--处理回调结果
function HandleResponse(self, PlatformID, HostID, Response, ExecuteTime, LastSaticsTimes)
	if not CommonFunc.CheckLogErr(HostID, INDEX_NAME, Response) then
		return false
	end

	for FileName, LogContent in pairs(Response) do
		if LogContent ~= "" or LogContent ~= " " then
			local LastSaticsTime = LastSaticsTimes[FileName]
			--需要把上一次统计时间点的记录拿出来对比下看有没有
			local SameTimeStatics = ClientLoadLogData:GetSameTimeStatics(PlatformID,{Time=LastSaticsTime}, "IMEI")
			
			local Results = {}
			local Lines = string.split(LogContent, "\n")
			local LastTime = nil
			for _, Line in ipairs(Lines) do
				if Line ~= "" and Line ~= " " then
					local IMEI = CommonFunc.GetLogValue(Line, "IMEI")
					local Operate = CommonFunc.GetLogValue(Line, "Operate")
					local Step = StepMap[Operate] or 1
					local PhoneInfo = CommonFunc.GetLogValue(Line, "PhoneInfo", "")
					local Result = {
						HostID = HostID,
						Vfd = 0,
						Uid = 0,
						Urs = "",
						Step = Step,
						IMEI = IMEI,
						PhoneInfo = PhoneInfo,
					}
					--再提取时间
					local RegTime = CommonFunc.GetLogTime(Line)
					if SameTimeStatics[IMEI] ~= RegTime then
						--没有重复数据的才添加
						Result["Time"] = RegTime
						table.insert(Results, Result)
						LastTime = RegTime -- 时间取最后一个
					end
				end
			end
			if #Results > 0 then
				--ngx.say(Serialize(Results))
				ClientLoadLogData:BatchInsert(PlatformID, Results)
			end
			-- 更新tblStaticsCfg表中统计时间记录
			if table.size(SameTimeStatics) ~= 0 and not LastTime then
				--如果此次获得数据都是与库里面的数据一样，将统计时间往后推后一秒
				LastSaticsTime = GetTimeStamp(LastSaticsTime)
				LastTime = os.date("%Y-%m-%d %H:%M:%S",LastSaticsTime + 1) --取下一秒
			end
			if LastTime then
				local TFileName = PlatformID .. "_" .. FileName --统计指标中的文件名
				local Params = {
					HostID = HostID,
					FileName = TFileName,
					IndexName = INDEX_NAME,
					StaticsTime = LastTime,
				}
				StaticsModuleData:Update(Params)
			end
		end
	end
	return true
end

DoRequest(true) --不需要进行权限验证
