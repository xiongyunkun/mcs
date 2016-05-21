----------------------------------------
--$Id: cron_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计
--
--]]

local REQUEST_URL = "/cron/cron_sub_statics?HostID="
local MAX_THREAD_NUM = 1 --最多并发的子请求数量

-- 需要统计的指标以及对应的处理文件都放在这里
local CronModule = {
	["Retention"] = "modules.cron.statics.retention",
	["OnlineTime"] = "modules.cron.statics.online_time",
	["Gold"] = "modules.cron.statics.gold",
	["VIP"] = "modules.cron.statics.vip",
	["FigtingRank"] = "modules.cron.statics.fighting_rank",
	["HistoryOnline"] = "modules.cron.statics.history_online",
	["HistoryReg"] = "modules.cron.statics.history_reg",
	["LevelStatics"] = "modules.cron.statics.level_statics",
	["LoginStatics"] = "modules.cron.statics.login_statics",
	--["MountLevelStatics"] = "modules.cron.statics.playways.mount_level_statics",
	["UserPayDayStatics"] = "modules.cron.pay.user_pay_day_statics",
	["PayDayStatics"] = "modules.cron.pay.pay_day_statics",
	["PayZoneStatics"] = "modules.cron.pay.pay_zone_statics",
	["InstanceStatics"] = "modules.cron.statics.playways.instance_statics",
	--["PetStatics"] = "modules.cron.statics.pet_statics",
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
	local NowTime = os.time()
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
	for HostID, PlatformID in pairs(ServerPlatformMap) do
		--只统计服务器状态不为维护或者异常的服
		if ServerStatusMap[HostID] ~= 0 and ServerStatusMap[HostID] ~= 5 
			and CommonFunc.GetHostIP(PlatformID) == "127.0.0.1" then
			for Name, File in pairs(CronModule) do
				local Module = self[Name]
				if Module then
				--if self:IsTimeUp(Module.IndexName) then --执行时间到了
					local Frequency = self:GetFrequency(Module.IndexName)
					local ExecuteTime = CommonFunc.GetCorrectTime(Frequency)
					ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
					if not ExecuteTimeMap[Module.IndexName] then
						ExecuteTimeMap[Module.IndexName] = ExecuteTime
					end
					local ThreadParams = {
						PlatformID = PlatformID,
						HostID = HostID,
						ModuleName = Name,
						ExecuteTime = ExecuteTime,
					}
					table.insert(ThreadList, ThreadParams)
				end
			--end
			end
		end
	end
	for IndexName, ExecuteTime in pairs(ExecuteTimeMap) do
		self:UpdateExecuteTime(IndexName, ExecuteTime) --更新时间
	end
	local X = 0
	local SubThreadList = {}
	for _, ThreadParams in ipairs(ThreadList) do
		local Thread, Err = ngx.thread.spawn(ThreadExecute, self, ThreadParams["PlatformID"], ThreadParams["HostID"], ThreadParams["ModuleName"], ThreadParams["ExecuteTime"])
		local Flag, Res = ngx.thread.wait(Thread)
	end
	ngx.say("ok")
end

--线程执行
function ThreadExecute(self, PlatformID, HostID, ModuleName, ExecuteTime)
	if CommonFunc.IsStrEmpty(HostID) or CommonFunc.IsStrEmpty(PlatformID) or CommonFunc.IsStrEmpty(ModuleName)
		or CommonFunc.IsStrEmpty(ExecuteTime) then
		ngx.say(ModuleName,ExecuteTime,HostID,PlatformID)
		ngx.say("params empty!")
		return
	end
	HostID = tonumber(HostID)
	local Module = self[ModuleName]
	if Module then
		Module:CronStatics(PlatformID, HostID)
	end
	--ngx.log(ngx.ERR, string.format("before,ModuleName:%s,HostID:%d,memory:%s",ModuleName, HostID, collectgarbage("count")))
	--collectgarbage("collect")
	--ngx.log(ngx.ERR, string.format("after,ModuleName:%s,HostID:%d,memory:%s",ModuleName, HostID, collectgarbage("count")))
	
	ngx.say("done")
end

DoRequest(true) --不需要进行权限验证
