----------------------------------------
--$Id: cron_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计
--
--]]

-- 需要统计的指标以及对应的处理文件都放在这里
local CronModule = {
	{"Retention", "modules.cron.statics.retention"},
	{"OnlineTime", "modules.cron.statics.online_time"},
	{"Gold", "modules.cron.statics.gold"},
	{"VIP", "modules.cron.statics.vip"},
	{"FigtingRank", "modules.cron.statics.fighting_rank"},
	{"HistoryOnline", "modules.cron.statics.history_online"},
	{"HistoryReg", "modules.cron.statics.history_reg"},
	{"LevelStatics", "modules.cron.statics.level_statics"},
	{"LoginStatics", "modules.cron.statics.login_statics"},
	--{"MountLevelStatics", "modules.cron.statics.playways.mount_level_statics"},
	{"UserPayDayStatics", "modules.cron.pay.user_pay_day_statics"},
	{"PayDayStatics", "modules.cron.pay.pay_day_statics"},
	{"PayZoneStatics", "modules.cron.pay.pay_zone_statics"},
	{"InstanceStatics", "modules.cron.statics.playways.instance_statics"},
	--{"PetStatics", "modules.cron.statics.pet_statics"},
}
local Env = getfenv()
for _, Conf in ipairs(CronModule) do
	local Name, File = unpack(Conf)
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


function CronExecute(self)
	local ServerPlatformMap = ServerData:GetStaticsServers()
	for _, Conf in ipairs(CronModule) do
		local Name, File = unpack(Conf)
		local Module = self[Name]
		if Module then
			--if self:IsTimeUp(Module.IndexName) then --执行时间到了
				local Frequency = self:GetFrequency(Module.IndexName)
				local ExecuteTime = CommonFunc.GetCorrectTime(Frequency)
				ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
				self:UpdateExecuteTime(Module.IndexName, ExecuteTime) --更新时间
				for HostID, PlatformID in pairs(ServerPlatformMap) do
					Module:CronStatics(PlatformID, HostID)
				end
				-- 判断如果需要全平台统计执行的函数则执行
				--[[if Module.CronTotalStatics then
					Module:CronTotalStatics(ServerPlatformMap)
				end]]
			--end
		end
	end
	collectgarbage("collect")
	ngx.say("ok")
end

DoRequest(true) --不需要进行权限验证
