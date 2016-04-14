----------------------------------------
--$Id: cron_platform_send_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计
--
--]]

-- 需要发送数据的各个平台的的处理文件都放在这里
local CronModule = {
	{"360", "modules.cron.platform.360"}, --360平台
	--{"kugou", "modules.cron.platform.kugou"}, --酷狗平台
	{"baidu", "modules.cron.platform.baidu"}, --百度平台
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

--获得统计时间
--目前这里的统计规则是获得上一个小时的准点时间，到这个小时的准点时间，
--例如当前时间为2015-08-17 20:04:00，则统计开始时间为2015-08-17 19:00:00，结束时间为2015-08-17 20:00:00
function GetStaticsTime(self)
	local LastHourTime = os.time() - 3600
	local StartTime = os.date("%Y-%m-%d %H:00:00", LastHourTime)
	local EndTime = os.date("%Y-%m-%d %H:59:59", LastHourTime)
	return StartTime, EndTime
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
	local StartTime, EndTime = self:GetStaticsTime()
	for _, Conf in ipairs(CronModule) do
		local Name, File = unpack(Conf)
		local Module = self[Name]
		if Module then
			if self:IsTimeUp(Module.IndexName) then --执行时间到了
				local Frequency = self:GetFrequency(Module.IndexName)
				local ExecuteTime = CommonFunc.GetCorrectTime(Frequency)
				ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
				self:UpdateExecuteTime(Module.IndexName, ExecuteTime) --更新时间
				for HostID, PlatformID in pairs(ServerPlatformMap) do
					Module:CronSend(PlatformID, HostID, StartTime, EndTime)
				end
			end
		end
	end
	ngx.say("ok")
end

DoRequest(true) --不需要进行权限验证
