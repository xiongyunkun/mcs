----------------------------------------
--$Id: cron_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计
--
--]]

-- 需要统计的指标以及对应的处理文件都放在这里
local CronModule = {
	{"GoldLog", "modules.cron.log.gold_log"}, --钻石日志
	{"MoneyLog", "modules.cron.log.money_log"}, --金钱日志
	{"Online", "modules.cron.gm_get.online"}, --在线拉取数据
	{"AddPlayerLog", "modules.cron.log.add_player_log"}, --创角日志
	{"LoginLog", "modules.cron.log.login_log"}, --登录日志
	{"LogoutLog", "modules.cron.log.logout_log"}, --退出日志
	{"LevelUpLog", "modules.cron.log.level_up_log"}, --升级日志
	{"ClientLoadLog", "modules.cron.log.clientload_log"}, --客户端登录过程日志
	{"ChatLog", "modules.cron.log.chat_log"}, --聊天日志
	{"TaskLog", "modules.cron.log.task_log"}, -- 任务日志
	{"ActLog", "modules.cron.log.act_log"}, --活动日志
	{"ShopBuyLog", "modules.cron.log.shop_buy_log"}, -- 商店日志
	{"RenameLog", "modules.cron.log.rename_log"}, -- 重命名日志
	{"MountLevelLog", "modules.cron.log.mount_level"}, -- 坐骑等阶日志
	{"ItemLog", "modules.cron.log.item_log"}, --物品日志
	{"InstanceLog", "modules.cron.log.instance_log"}, -- 副本日志
	{"MessageLog", "modules.cron.log.message_log"}, -- 消息日志
	{"PayActualTime", "modules.cron.pay.pay_actual_time"}, --充值实时统计
	{"ExpLog", "modules.cron.log.exp_log"}, --经验日志
	{"GodDoorLog", "modules.cron.log.god_door_log"}, --众神之门日志
	{"PetLog", "modules.cron.log.pet_log"}, --魔神日志
	{"BanLog", "modules.cron.log.ban_log"}, --封禁日志
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
					--只统计服务器状态不为维护或者异常的服
					if ServerStatusMap[HostID] ~= 0 and ServerStatusMap[HostID] ~= 5 then
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
							--[[if Module.VerifyResponse then --如果模块需要验证返回结果在这里验证一下
								Response = Module:VerifyResponse(HostID, Params, Response)
							end]]
							if Response then
								Module:HandleResponse(PlatformID, HostID, Response, ExecuteTime, StartTimes)
							end
						end
					end
				end
			end
		end
	end
	ngx.say("ok")
end

DoRequest(true) --不需要进行权限验证
