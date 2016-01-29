----------------------------------------
--$Id: cron_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计
--
--]]

-- 需要统计的指标以及对应的处理文件都放在这里
local CronModule = {
	["Retention"] = "modules.cron.statics.retention",
	["OnlineTime"] = "modules.cron.statics.online_time",
	["Gold"] = "modules.cron.statics.gold",
	["Money"] = "modules.cron.statics.money",
	["HistoryOnline"] = "modules.cron.statics.history_online",
	["HistoryReg"] = "modules.cron.statics.history_reg",
	["LevelStatics"] = "modules.cron.statics.level_statics",
	["LoginStatics"] = "modules.cron.statics.login_statics",-- 登录分析
	["PhoneStatics"] = "modules.cron.statics.phone_statics",
	["VIP"] = "modules.cron.statics.vip",
	["PhoneRetention"] = "modules.cron.statics.phone_retention",
	["UserPayDayStatics"] = "modules.cron.pay.user_pay_day_statics",
	["PayDayStatics"] = "modules.cron.pay.pay_day_statics",
	["PayZoneStatics"] = "modules.cron.pay.pay_zone_statics",
	["Challenge"] = "modules.cron.statics.playways.challenge", --极限挑战
	["Instance"] = "modules.cron.statics.playways.instance", --关卡统计
}
local Env = getfenv()
for Name, File in pairs(CronModule) do
	Env[Name] = require(File)
end

local pairs = pairs
local ipairs = ipairs

--获得服务器状态列表
function GetServerStatusMap(self)
	local AllServers = ServerData:GetAllServers()
	local StatusMap = {}
	for _, ServerInfo in ipairs(AllServers) do
		StatusMap[ServerInfo.hostid] = ServerInfo.status
	end
	return StatusMap
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

--获得HostID列表
function GetPlatformHostIDs(self, PlatformIDs)
	local PlatformIDs = string.split(PlatformIDs, ",")
	local HostRes = MixServerData:Get({PlatformIDs = table.concat(PlatformIDs, "','")})
	local HostIDs = {}
	for _, Info in ipairs(HostRes) do
		HostIDs[Info.HostID] = Info.PlatformID
	end
	return HostIDs
end

function CronExecute(self)
	local Args = GetPostArgs()
	local PlatformIDs = Args.PlatformID or ""
	local HostIDs = self:GetPlatformHostIDs(PlatformIDs)
	local StaticsServers = ServerData:GetStaticsServers()
	local ServerStatusMap = self:GetServerStatusMap()
	for Name, File in pairs(CronModule) do
		local Module = self[Name]
		if Module then
			--if self:IsTimeUp(Module.IndexName) then --执行时间到了
				local Frequency = self:GetFrequency(Module.IndexName)
				local ExecuteTime = CommonFunc.GetCorrectTime(Frequency)
				ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
				self:UpdateExecuteTime(Module.IndexName, ExecuteTime) --更新时间
				local PlatformIDs = {} --记录下哪些平台需要统计
				for HostID, _ in pairs(StaticsServers) do
					local PlatformID = HostIDs[HostID]
					if PlatformID and ServerStatusMap[HostID] ~= 0 and ServerStatusMap[HostID] ~= 5 then
						Module:CronStatics(PlatformID, HostID)
						PlatformIDs[PlatformID] = true
					end
				end
				-- 判断如果需要全平台统计执行的函数则执行
				if Module.CronTotalStatics then
					for PlatformID, _ in pairs(PlatformIDs) do
						Module:CronTotalStatics(PlatformID)
					end
				end
			--end
		end
	end
	ngx.say("ok")
end

DoRequest(true) --不需要进行权限验证
