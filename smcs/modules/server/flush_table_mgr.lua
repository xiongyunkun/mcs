----------------------------------------
--$Id: flush_table_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 清档操作处理
--
--]]

--日志表
local LogTables = {"tblAddPlayerLog", "tblArenaLog", "tblBanLog", "tblCardLog", "tblChallengeLog",
	"tblChatLog", "tblClientErrorLog", "tblClientLoadLog", "tblGoldLog", "tblInstanceLog", "tblItemLog", 
	"tblLevelUpLog", "tblLoginLog", "tblLogoutLog", "tblLuckyDrawLog", "tblMessageLog",
	"tblMoneyLog", "tblPayLog", "tblPowerLog", "tblRenameLog" ,"tblShopBuyLog", "tblTaskLog"}
--统计表
local StaticsTables = {"tblAddPlayer", "tblCardLevel", "tblCardStatics", "tblChallenge", "tblFigtingRank",
	"tblGold", "tblHistoryOnline", "tblHistoryReg", "tblInstance", "tblInstancePlayStatics", "tblLevel",
	"tblLevelStatics", "tblLoginStatics", "tblMoney", "tblOnline", "tblOnlineTime",
	"tblPayActualTime", "tblPayDayFrequencyStatics", "tblPayDayStatics", "tblPayOrder", "tblPayRetention", "tblUserPayStatics",
	"tblPayZone", "tblPhone", "tblPhoneRetention", "tblRetention", "tblStartNum", "tblUserInfo",
	"tblUserPayDayStatics", "tblUserPayStatics", "tblVIP"}


--后台清档逻辑
function FlushTable(self)
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
	--获得该服所在的平台列表
	local MixServerList = MixServerData:Get({HostID = HostID})
	local PlatformIDList = {}
	for _, Info in ipairs(MixServerList) do
		table.insert(PlatformIDList, Info.PlatformID)
	end
	--先删除日志表数据,目前没有按日期分表,后面再扩展
	for _, LogTable in ipairs(LogTables) do
		for _, PlatformID in ipairs(PlatformIDList) do
			local Sqls = {"delete from ", PlatformID, "_log.", LogTable, 
				" where HostID = '", HostID, "'"}
			--ngx.say(table.concat( Sqls, ""))
			local Sql = table.concat( Sqls, "")
			DB:ExeSql(Sql)
		end
	end
	--再删除统计表
	for _, StaticsTable in ipairs(StaticsTables) do
		for _, PlatformID in ipairs(PlatformIDList) do
			local Sqls = {"delete from ", PlatformID, "_statics.", StaticsTable,
				" where HostID = '", HostID, "'"}
			--ngx.say(table.concat( Sqls, ""))
			local Sql = table.concat( Sqls, "")
			DB:ExeSql(Sql)
		end
	end
	ngx.print(1)
end

DoRequest(true)