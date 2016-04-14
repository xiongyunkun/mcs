----------------------------------------
--$Id: cron_run_erro_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计各个服务器的运行错误
--
--]]

local RunTimeLogFile = "engine/runtime.log" --文件名
local RequestType = "getlog"
local StaticsIndex = "RunErroStatics"
local ErroLogResultPath = "game_logs/game_erro_result.log" --外网服务器日志存放路径
local ErroLogPath = "game_logs/game_erro.log" --98服务器拖回来的日志存放路径
local RTXReciever = "0083,0012,0013,0030,0088,0099" --如果有多个请用逗号隔开
local TimeInterval = 15 --15分钟执行一次

--获得上一次的统计时间
function GetStartTimeMap(self)
	local Results = {}
	local TimeList = StaticsRunErrTimeData:Get({})
	for _, TimeInfo in ipairs(TimeList) do
		local LastStaticsTime = TimeInfo.LastStaticsTime
		--下次的统计时间往后推1秒
		LastStaticsTime = GetTimeStamp(LastStaticsTime)
		LastStaticsTime = os.date("%Y-%m-%d %H:%M:%S", LastStaticsTime + 1)
		Results[TimeInfo.HostID] = LastStaticsTime
	end
	return Results
end

--外网服错误日志统计接口
function CronExecute(self)
	local ServerPlatformMap = ServerData:GetStaticsServers()
	local NowTime = os.time()
	
	local NowTimeStr = os.date("%Y-%m-%d %H:%M:%S", NowTime)
	local DefaultStartTime = os.date("%Y-%m-%d 00:00:00", NowTime)  --默认是当天的0点
	local StartTimeMap = self:GetStartTimeMap()
	local Results = {}
	for HostID, PlatformID in pairs(ServerPlatformMap) do
		--构建请求参数
		local Params = {
			FileNames = RunTimeLogFile,
			HostID = HostID,
			StartTimes = StartTimeMap[HostID] or DefaultStartTime
		}
		local Flag = nil
		local Response = nil
		for X = 1, 3 do --默认调用2次，只要有一次成功则跳出循环
			Flag, Response = ReqCmcsByServerId(tonumber(HostID), RequestType, Params)
			if Flag then
				break
			end
		end
		Response  = UnSerialize(Response)
		local LastStaticsTime = nil
		if Response and table.size(Response) > 0 then
			Results, LastStaticsTime = self:AnalysisLog(HostID, Response, Results)
			if LastStaticsTime then
				--更新统计时间
				local TimeInfo = {
					HostID = HostID,
					LastStaticsTime = LastStaticsTime,
					UpdateTime = NowTimeStr,
				}
				StaticsRunErrTimeData:Insert(TimeInfo)
			end
		end
	end
	if table.size(Results) ~= 0 then
		--加上该次的统计时间，以便区别出来是否新生成的
		local NewResults = {Content = Results, StaticsTime = NowTimeStr}
		local ResultStr = Serialize(NewResults)
		local LogFile = assert(io.open(ErroLogResultPath, 'w')) --覆盖写
		--写入文件
		LogFile:write(ResultStr)
		LogFile:close()
	end
	ngx.say("ok")
end

--重命名日志文件，如果时间没到则不需要重命名
function RenameLogFile(self, NowTime)
	local LastTime = NowTime - 60 * TimeInterval --往前推
	local LastDate = os.date("%Y%m%d", LastTime)
	local NowDate = os.date("%Y%m%d", NowTime)
	if LastDate ~= NowDate then
		--需要重命名
		local NewLogFileName = ErroLogPath .. LastDate
		os.execute("mv " .. ErroLogPath .. " " .. NewLogFileName) 
	end
end

--分析日志
function AnalysisLog(self, HostID, Response, Results)
	local LastStaticsTime = nil
	if not CommonFunc.CheckLogErr(HostID, StaticsIndex, Response) then
		return Results, LastStaticsTime
	end
	
	for FileName, LogContent in pairs(Response) do
		if LogContent ~= "" or LogContent ~= " " then
			local ErroResults, LastTime = self:ExtractErro(LogContent)
			for ErroKey, ErroInfo in pairs(ErroResults) do
				if not Results[ErroKey] then
					Results[ErroKey] = {
						HostIDs = {[HostID] = ErroInfo.ErroNum, TotalNum = ErroInfo.ErroNum},
						Content = ErroInfo.Content,
						Time = ErroInfo.Time,
						Reason = ErroInfo.Reason,
					}
				else
					--否则只对服的错误数+1和总错误数+1
					Results[ErroKey]["HostIDs"][HostID] = (Results[ErroKey]["HostIDs"][HostID] or 0) + ErroInfo.ErroNum
					Results[ErroKey]["HostIDs"]["TotalNum"] = Results[ErroKey]["HostIDs"]["TotalNum"] + ErroInfo.ErroNum
				end
			end
			LastStaticsTime = LastTime
		end
	end 
	return Results, LastStaticsTime
end

--解析出错误日志出来
function ExtractErro(self, LogContent)
	local Results = {}
	local LastTime = nil
	local Lines = string.split(LogContent, "\n")
	local ErroKey = nil
	for _, Line in ipairs(Lines) do
		local StartIdx, EndIdx = string.find(Line, "%[%d+-%d+-%d+ %d+:%d+:%d+%]")
		if StartIdx then
			LastTime = string.sub(Line, StartIdx+1, EndIdx-1) --截取时间
			if string.find(Line, "traceback:") then --是错误日志，记录下来
				local ErroMsg = string.sub(Line, EndIdx+1)
				local Reason = nil
				ErroKey, Reason = self:ExtractErrKey(ErroMsg)
				Results[ErroKey] = Results[ErroKey] or {ErroNum = 0, Content = {},}
				Results[ErroKey].ErroNum = Results[ErroKey].ErroNum + 1
				Results[ErroKey].Time = LastTime
				Results[ErroKey].Reason = Reason
				table.insert(Results[ErroKey].Content, Line)
			end
		else --是错误日志的后面部分
			if ErroKey and Results[ErroKey] then
				table.insert(Results[ErroKey].Content, Line)
			end	
		end
	end
	--再统一合并成字符串
	for Key, Result in pairs(Results) do
		Results[Key].Content = table.concat( Result.Content, "\n")
	end
	return Results, LastTime
end

--提取出错误代码所在位置以及错误原因
function ExtractErrKey(self, ErrMsg)
	ErrMsg = string.gsub(ErrMsg, "(%(%d%d%))", "") --过滤掉进程号
	local SIdx, EIdx = string.find(ErrMsg, "[%s%S]-%.lua:%d+:") --匹配错误代码所在位置
	if not SIdx then
		SIdx, EIdx = string.find(ErrMsg, '%[string[%s%S]-%.lua"%]:%d+:')
	end
	if not EIdx then 
		return ErrMsg, "" --直接返回
	end
	local Reason = string.sub(ErrMsg, EIdx+1)
	local CodePosition = string.sub(ErrMsg, 1, EIdx)
	return CodePosition, Reason
end

--封装RTX消息
function GetRTXMsg(self, ErroKey, HostIDNums, ErroTime, Reason)
	local ServerList = ServerData:GetAllServers()
	local ServerMap = {}
	for _, ServerInfo in ipairs(ServerList) do
		ServerMap[ServerInfo.hostid] = ServerInfo.name
	end
	local Content = "(" .. ErroTime .. ")" .. ErroKey .. (Reason or "")
	local ServerErros = {}
	for HostID, Num in pairs(HostIDNums or {}) do
		if HostID == "TotalNum" then
			ServerErros["总数"] = Num
		elseif ServerMap[tonumber(HostID)] then
			ServerErros[ServerMap[tonumber(HostID)]] = Num
		else
			ServerErros[tonumber(HostID)] = Num
		end
	end
	local CmdStr = ',详情请执行命令查看: ./mcs/smcs/shell/cat_game_erro.sh'
	Content = Content .. ",错误数:" .. Serialize(ServerErros) .. CmdStr
	return Content
end

--请求获得日志统计文件(内网服务器请求统计)
function CronGetRunErroFile(self)
	local NowTime = os.time()
	self:RenameLogFile(NowTime) --重命名log文件
	local Url = CommonData.ERRO_LOG_STATICS_URL
	local Flag, Response = ReqOutUrl(Url)
	Response  = UnSerialize(Response)
	if Response and table.size(Response) > 0 then
		--对比时间看看是否需要更新日志文件
		local LastStaticsTime = nil
		local KeyValueInfo = KeyValueData:Get({Key = StaticsIndex})
		if KeyValueInfo and KeyValueInfo[1] then
			LastStaticsTime = KeyValueInfo[1].Value
		end
		if LastStaticsTime ~= Response.StaticsTime then	
			local LogFile = assert(io.open(ErroLogPath, 'a+')) --追加写
			for ErroKey, LogInfo in pairs(Response.Content) do
				--先记录文件
				local LogContent = "ErroNum:" .. Serialize(LogInfo["HostIDs"]) .. "\n"
				LogContent = LogContent .. LogInfo["Content"] .. "\n"
				--写入文件
				LogFile:write(LogContent)
				--然后RTX提醒
				local ErroMsg = self:GetRTXMsg(ErroKey, LogInfo["HostIDs"], LogInfo.Time, LogInfo.Reason) 
				CommonFunc.SendRTX(RTXReciever, "服务器错误提醒", ErroMsg)
			end
			LogFile:close()
			--同时还要更新统计时间
			KeyValueData:Insert({Key = StaticsIndex, Value = Response.StaticsTime})
		end
	end
	ngx.say("ok")
end

--返回错误统计日志文件（外网服务器接口）
function GetRunErroStaticsFile(self)
	local Data = nil
	local LogFile = io.open(ErroLogResultPath, 'r')
	if LogFile then
		Data = LogFile:read("*a") -- 读取所有内容
		LogFile:close()
	end
	ngx.say(Data or "")
end

DoRequest(true) --不需要进行权限验证
