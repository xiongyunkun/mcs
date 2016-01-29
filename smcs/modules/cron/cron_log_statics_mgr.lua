----------------------------------------
--$Id: cron_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计
--
--]]

-- 需要统计的指标以及对应的处理文件都放在这里
local CronModule = {
	{"GoldLog", "modules.cron.log.gold_log"},
	{"MoneyLog", "modules.cron.log.money_log"},
	{"AddPlayerLog", "modules.cron.log.add_player_log"},
	{"Online", "modules.cron.gm_get.online"},
	{"LoginLog", "modules.cron.log.login_log"},
	{"LogoutLog", "modules.cron.log.logout_log"},
	{"LevelUpLog", "modules.cron.log.level_up_log"},
	{"RenameLog", "modules.cron.log.rename_log"},
	{"ItemLog", "modules.cron.log.item_log"},
	{"MessageLog", "modules.cron.log.message_log"},		-- 邮件
	{"InstanceLog", "modules.cron.log.instance_log"},	-- 副本关卡
	{"CardLevelLog", "modules.cron.log.card_level"},
	{"TaskLog", "modules.cron.log.task_log"}, 
	{"ClientLoadLog", "modules.cron.log.clientload_log"},
	{"ClientErrorLog", "modules.cron.log.clienterror_log"}, -- 客户端错误日志
	{"ChatLog", "modules.cron.log.chat_log"},
	{"PowerLog", "modules.cron.log.power_log"},
	{"ShopBuyLog", "modules.cron.log.shop_buy_log"},
	{"ArenaLog", "modules.cron.log.arena_log"},

--[[
	{"ActLog", "modules.cron.log.act_log"},
	{"PayActualTime", "modules.cron.pay.pay_actual_time"}
--]]
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
					if Module.IndexName == "PayActualTime" then --实时充值统计的不需要发送http请求
						Module:CronExecute(PlatformID, HostID)
					else
						local Params = Module:GenerateReqParams(PlatformID, HostID)
						local Flag = nil
						local Response = nil
						local RequestType = Module.RequestType
						for X = 1, 3 do --默认调用2次，只要有一次成功则跳出循环
							Flag, Response = ReqCmcsByServerId(tonumber(HostID), RequestType, Params)
							if Flag then
								break
							end
						end
						ngx.say(Response)
						--封装文件与统计时间的对应关系，便于去重
						local StartTimes = self:GetStartTimes(Params)
						-- 交给对应模块处理入库
						Response  = UnSerialize(Response) 
						if Response then
							Module:HandleResponse(PlatformID, HostID, Response, ExecuteTime, StartTimes)
						end
					end
				end
			--end
		end
	end
	ngx.say("ok")
end

DoRequest(true) --不需要进行权限验证
