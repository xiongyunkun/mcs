----------------------------------------
--$Id: flush_table_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 清档操作处理
--
--]]

--日志表
local LogTables = {"tblActLog", "tblAddPlayerLog", "tblChatLog", "tblClientLoadLog", "tblExpLog",
	"tblGodDoorLog", "tblGoldLog", "tblInstanceLog", "tblItemLog", "tblLevelUpLog", "tblLoginLog", 
	"tblLogoutLog", "tblMessageLog", "tblMoneyLog", "tblRenameLog", "tblShopBuyLog",
	"tblTaskLog", "tblPetLog", "tblPetDayStatics", "tblPetEquipLog", "tblPetBrandLog"}
--统计表
local StaticsTables = {"tblAddPlayer", "tblFigtingRank", "tblGold", "tblHistoryOnline", "tblHistoryReg",
	"tblInstanceStatics", "tblLevelStatics", "tblLoginStatics", "tblMountLevel", "tblOnline", "tblOnlineTime",
	"tblPayActualTime", "tblPayDayFrequencyStatics", "tblPayDayStatics", "tblPayOrder", "tblPayRetention",
	"tblPayZone", "tblPlayWayStatics", "tblRetention", "tblUserInfo", "tblUserPayDayStatics", "tblUserPayStatics",
	"tblVIP"}


--后台清档逻辑
function FlushTable(self)
	--if ngx.var.request_method == "POST" then
		local HostID = GetQueryArg("hostid")
		if not HostID or HostID == "" then
			ngx.print(-1) --服务器不能为空
			return
		end
		--判断开服时间，如果开服时间小于今天表示已经开服了，不允许再清档
		local Server = ServerData:GetServer({hostid = HostID})
		if not Server or not Server[1] then
			ngx.print(-1) --没有该服务器
			return
		end
		Server = Server[1]
		local PlatformID = Server.platformid
		local StartServerTime = Server.startservertime
		StartServerTime = GetTimeStamp(StartServerTime)
		local NowTime = ngx.time()
		local Today = os.date("%Y-%m-%d 00:00:00", NowTime)
		local TodayTimeStamp = GetTimeStamp(Today)
		if StartServerTime < TodayTimeStamp then
			ngx.print(-2) -- 开服时间不满足要求
			return
		end
		--先把redis中的数据都获取过来
		ReqOutUrl("http://127.0.0.1:8081/cron/cron_log_redis_statics")
		--先删除日志表数据,删除提前7天的数据
		local Days = {}
		for X = 0, 7 do
			table.insert(Days, os.date("%Y%m%d", NowTime - 86400 * X))
		end
		for _, LogTable in ipairs(LogTables) do
			for _, Day in ipairs(Days) do
				local Sqls = {"delete from ", PlatformID, "_log.", LogTable, "_", Day,
				" where HostID = '", HostID, "'"}
				--ngx.say(table.concat( Sqls, ""))
				local Sql = table.concat( Sqls, "")
				DB:ExeSql(Sql)
			end
		end
		--再删除统计表
		for _, StaticsTable in ipairs(StaticsTables) do
			local Sqls = {"delete from ", PlatformID, "_statics.", StaticsTable,
				" where HostID = '", HostID, "'"}
			--ngx.say(table.concat( Sqls, ""))
			local Sql = table.concat( Sqls, "")
			DB:ExeSql(Sql)
		end
	--end
	ngx.print(1)
end

DoRequest(true)