----------------------------------------
--$Id: cron_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计
--
--]]

local MAX_THREAD_NUM = 30 --最多并发的线程数量

-- 需要统计的指标以及对应的处理文件都放在这里
local CronModule = {
	["GoldLog"] = "modules.cron.log.gold_log", --钻石日志
	["MoneyLog"] = "modules.cron.log.money_log", --金币日志
	["AddPlayerLog"] = "modules.cron.log.add_player_log", --新增玩家日志
	["Online"] = "modules.cron.gm_get.online", --在线人数
	["LoginLog"] = "modules.cron.log.login_log", --登陆日志
	["LogoutLog"] = "modules.cron.log.logout_log", --退出日志
	["LevelUpLog"] = "modules.cron.log.level_up_log", --升级日志
	["RenameLog"] = "modules.cron.log.rename_log", --改名日志
	["ItemLog"] = "modules.cron.log.item_log", --物品日志
	["MessageLog"] = "modules.cron.log.message_log",		-- 邮件
	["InstanceLog"] = "modules.cron.log.instance_log",	-- 副本关卡
	["TaskLog"] = "modules.cron.log.task_log", --任务日志
	["ClientLoadLog"] = "modules.cron.log.clientload_log", --客户端登陆日志
	["PowerLog"] = "modules.cron.log.power_log", --体力日志
	["ShopBuyLog"] = "modules.cron.log.shop_buy_log", --商店购买日志
	["ArenaLog"] = "modules.cron.log.arena_log", --竞技场日志
	["PayActualTime"] = "modules.cron.pay.pay_actual_time", --充值实时统计
	["LuckyDrawLog"] = "modules.cron.log.lucky_draw_log", --酒馆日志
	["ChallengeLog"] = "modules.cron.log.challenge_log", --极限挑战
	["CardLog"] = "modules.cron.log.card_log", --英雄日志
	["ChatLog"] = "modules.cron.log.chat_log", --聊天日志
}
local Env = getfenv()
for Name, File in pairs(CronModule) do
	Env[Name] = require(File)
end

--根据上一次的执行时间和执行频率，判断该模块此时是否应该执行
function IsTimeUp(self, IndexName)
	local IndexInfo = StaticsIndexData:Get({IndexName = IndexName})
	if not IndexInfo or not IndexInfo[1] then
		return false
	end
	IndexInfo = IndexInfo[1]
	local LastTime = IndexInfo.LastTime
	LastTime = GetTimeStamp(LastTime)
	local Frequency = IndexInfo.Frequency * 60 --折算成秒
	local NowTime = ngx.time()
	if LastTime + Frequency <= NowTime then 
		--上一次执行时间加上执行频率已经小于现在时间了，表示可以执行
		return true
	else
		return false
	end
end

--更新统计指标配置表中的执行时间
function UpdateExecuteTime(self, IndexName, Time)
	StaticsIndexData:UpdateTime(IndexName, Time)
end

--构造文件名与上一次统计时间的对应关系
function GetStartTimes(self, Params)
	if not Params.StartTimes then
		return 
	end
	local StartTimes = string.split(Params.StartTimes, ",")
	local FileNames = string.split(Params.FileNames, ",") 
	local Results = {}
	for Index, FileName in ipairs(FileNames) do
		Results[FileName] = StartTimes[Index]
	end
	return Results
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

--获得服务器状态列表
function GetServerStatusMap(self)
	local AllServers = ServerData:GetAllServers()
	local StatusMap = {}
	for _, ServerInfo in ipairs(AllServers) do
		StatusMap[ServerInfo.hostid] = ServerInfo.status
	end
	return StatusMap
end


function CronExecute(self)
	local ServerPlatformMap = ServerData:GetStaticsServers()
	local ServerStatusMap = self:GetServerStatusMap()
	--local SubRequestList = {} --子请求列表
	local ThreadList = {} -- 线程列表
	local ExecuteTimeMap = {} --记录执行时间列表，用于更新上一次操作时间
	for HostID, _ in pairs(ServerPlatformMap) do
		--只统计服务器状态不为维护或者异常的服
		if ServerStatusMap[HostID] ~= 0 and ServerStatusMap[HostID] ~= 5 then
			for Name, File in pairs(CronModule) do
				local Module = self[Name]
				if Module then
					--if self:IsTimeUp(Module.IndexName) then --执行时间到了
						local Frequency = self:GetFrequency(Module.IndexName)
						ExecuteTime = CommonFunc.GetCorrectTime(Frequency)
						ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
						if not ExecuteTimeMap[Module.IndexName] then
							ExecuteTimeMap[Module.IndexName] = ExecuteTime
						end
						local ThreadParams = {
							HostID = HostID,
							ModuleName = Name,
							ExecuteTime = ExecuteTime,
						}
						table.insert(ThreadList, ThreadParams)
					--end
				end
			end
		end
	end
	for IndexName, ExecuteTime in pairs(ExecuteTimeMap) do
		self:UpdateExecuteTime(IndexName, ExecuteTime) --更新时间
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
		local Thread, Err = ngx.thread.spawn(ThreadExecute, self, ThreadParams["HostID"], ThreadParams["ModuleName"], ThreadParams["ExecuteTime"])
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
function ThreadExecute(self, HostID, ModuleName, ExecuteTime)
	if CommonFunc.IsStrEmpty(HostID) or CommonFunc.IsStrEmpty(ModuleName) or CommonFunc.IsStrEmpty(ExecuteTime) then
		ngx.say("params empty!")
		return
	end
	HostID = tonumber(HostID)
	local Module = self[ModuleName]
	if Module then 
		if Module.IndexName == "PayActualTime" then --实时充值统计的不需要发送http请求
			Module:CronExecute(HostID)
		else
			local Params = Module:GenerateReqParams(HostID)
			local Flag = nil
			local Response = nil
			local RequestType = Module.RequestType
			for X = 1, 2 do --默认调用2次，只要有一次成功则跳出循环
				Flag, Response = ReqCmcsByServerId(tonumber(HostID), RequestType, Params)
				if Flag then
					break
				end
			end
			ngx.say(ModuleName, HostID, Response)
			--封装文件与统计时间的对应关系，便于去重
			local StartTimes = self:GetStartTimes(Params)
			-- 交给对应模块处理入库
			Response  = UnSerialize(Response) 
			if Response then
				Module:HandleResponse(HostID, Response, ExecuteTime, StartTimes)
			end
		end
	end
	ngx.say("done")
end

DoRequest(true) --不需要进行权限验证
