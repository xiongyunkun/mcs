----------------------------------------
--$Id: cron_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时从redis中拉取日志数据放入数据库中
--
--]]

-- 需要统计的指标以及对应的处理文件都放在这里
local CronModule = {
	{"addgold", "modules.cron.log_redis.gold_log"}, --加钻石日志
	{"subgold", "modules.cron.log_redis.gold_log"}, --减钻石日志
	{"addcreditgold", "modules.cron.log_redis.gold_log"}, --加绑钻日志
	{"subcreditgold", "modules.cron.log_redis.gold_log"}, --减绑钻日志
	{"addmoney", "modules.cron.log_redis.money_log"}, --加金钱日志
	{"submoney", "modules.cron.log_redis.money_log"}, --减金钱日志
	{"online", "modules.cron.log_redis.online"}, --在线拉取数据
	{"addplayer", "modules.cron.log_redis.add_player_log"}, --创角日志
	{"login", "modules.cron.log_redis.login_log"}, --登录日志
	{"logout", "modules.cron.log_redis.logout_log"}, --退出日志
	{"userlevelup", "modules.cron.log_redis.level_up_log"}, --升级日志
	{"clientload", "modules.cron.log_redis.clientload_log"}, --客户端登录过程日志
	{"chat", "modules.cron.log_redis.chat_log"}, --聊天日志
	{"task", "modules.cron.log_redis.task_log"}, -- 任务日志
	{"act", "modules.cron.log_redis.act_log"}, --活动日志
	{"shopbuy", "modules.cron.log_redis.shop_buy_log"}, -- 商店日志
	{"rename", "modules.cron.log_redis.rename_log"}, -- 重命名日志
	{"mountlevel", "modules.cron.log_redis.mount_level"}, -- 坐骑等阶日志
	{"additem", "modules.cron.log_redis.item_log"}, --物品日志
	{"subitem", "modules.cron.log_redis.item_log"}, --物品日志
	{"instance", "modules.cron.log_redis.instance_log"}, -- 副本日志
	{"message", "modules.cron.log_redis.message_log"}, -- 消息日志
	{"PayActualTime", "modules.cron.pay.pay_actual_time"}, --充值实时统计
	{"exp", "modules.cron.log_redis.exp_log"}, --经验日志
	{"goddoor", "modules.cron.log_redis.god_door_log"}, --众神之门日志
	{"pet", "modules.cron.log_redis.pet_log"}, --魔神日志
	{"ban", "modules.cron.log_redis.ban_log"}, --封禁日志
	{"petequip", "modules.cron.log_redis.pet_equip_log"}, --魔神装备日志
	{"petbrand", "modules.cron.log_redis.pet_brand_log"}, --魔神辉印日志
	{"teaminst", "modules.cron.log_redis.team_inst_log"}, --诸神黄昏日志
	{"petsoul", "modules.cron.log_redis.pet_soul_log"}, --宝石日志
	{"endlessbattle", "modules.cron.log_redis.endless_battle_log"}, --方舟之战日志
}

local Env = getfenv()
for _, Conf in ipairs(CronModule) do
	local Name, File = unpack(Conf)
	Env[Name] = require(File)
end

local GET_STR = [[
local Result = {}
local Length = redis.call('LLEN',KEYS[1])
for Index = 0, Length-1 do
	local Value = redis.call('LPOP',KEYS[1])
	if Value then
		table.insert(Result, Value)
	end
end
return Result
]]

function CronExecute(self)
	local ServerPlatformMap = ServerData:GetStaticsServers() --统计服列表
	for _, Conf in ipairs(CronModule) do
		local Name, File = unpack(Conf)
		local Module = self[Name]
		if Module then
			if Name == "PayActualTime" then --实时充值统计的不需要发送http请求
				for HostID, PlatformID in pairs(ServerPlatformMap) do
					if CommonFunc.GetHostIP(PlatformID) == "127.0.0.1" then
						Module:CronExecute(PlatformID, HostID)
					end
				end
			else
				local LogList = RedisDB:GetLog(GET_STR, Name) --获得对应的日志数据
				local LogStr = "[" .. table.concat(LogList, ",") .. "]"
				local JsonList = json_decoder:decode(LogStr)
				if JsonList and #JsonList > 0 then
					local NewJsonList = {}
					for _, Json in ipairs(JsonList) do
						local HostID = Json.hostid and tonumber(Json.hostid)
						--过滤筛选仅仅是统计服的log日志
						if HostID and ServerPlatformMap[HostID] then 
							table.insert(NewJsonList, Json)
						end
					end
					Module:HandleResponse(NewJsonList, ServerPlatformMap)
				end
			end
		end
	end
	ngx.say("ok")
end

DoRequest(true) --不需要进行权限验证
