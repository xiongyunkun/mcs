----------------------------------------
--$Id: divide_table_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 分库分表操作管理，针对log日志数据表按天分表
--
--]]

--按日期生成log表
function CreateTable(self)
	Options = GetQueryArgs(true)
	local PlatformID = Options.pf
	local StartDate = Options.startdate 
	local EndDate = Options.enddate
	local TableName = Options.table
	--到对应的数据库中按天生成表
	local StartTime = GetTimeStamp(StartDate .. " 00:00:00")
	local EndTime = GetTimeStamp(EndDate .. " 23:59:59")
	while(StartTime<EndTime) do
		local Date = os.date("%Y%m%d", StartTime)
		if TableName and CreateTableSqlCfg[TableName] then
			local Sql = CreateTableSqlCfg[TableName]
			Sql = "create table " .. PlatformID .. "_log." .. TableName .. "_" .. Date .. Sql
			local Res, Err = DB:ExeSql(Sql)
			if not Res then
				ngx.say(Err)
			end
		else
			for TableName, Sql in pairs(CreateTableSqlCfg) do
				Sql = "create table " .. PlatformID .. "_log." .. TableName .. "_" .. Date .. Sql
				local Res, Err = DB:ExeSql(Sql)
				if not Res then
					ngx.say(Err)
				end
			end
		end
		StartTime = StartTime + 86400
	end
	ngx.say("ok")
end

--删表操作，千万不要在线上配置，只供测试环境使用
function DeleteTable(self)
	Options = GetQueryArgs(true)
	local PlatformID = Options.pf
	local StartDate = Options.startdate 
	local EndDate = Options.enddate
	--到对应的数据库中按天生成表
	local StartTime = GetTimeStamp(StartDate .. " 00:00:00")
	local EndTime = GetTimeStamp(EndDate .. " 23:59:59")
	while(StartTime<EndTime) do
		local Date = os.date("%Y%m%d", StartTime)
		for TableName, _ in pairs(CreateTableSqlCfg) do
			local DeleteSql = "drop table " .. PlatformID .. "_log." .. TableName .. "_" .. Date 
			local Res, Err = DB:ExeSql(DeleteSql)
			if not Res then
				ngx.say(Err)
			end
		end
		StartTime = StartTime + 86400
	end
	ngx.say("ok")
end

--每月27号自动创建下个月的日志表，同时删除上上个月的日志表
function AutoCreateTable(self)
	local ServerPlatformMap = ServerData:GetStaticsServers(true)
	local PlatformIDMap = {}
	for _, PlatformID in pairs(ServerPlatformMap) do
		PlatformIDMap[PlatformID] = true
	end
	local NowTime = ngx.time()
	local ThisMonth = os.date("%Y-%m", NowTime)
	--10天之后的月份，也就是下个月
	local NextMonth = os.date("%Y-%m", NowTime + 864000)
	if ThisMonth == NextMonth then
		return --如果与本月相等则直接退出循环
	end
	--再往后推40天， 也就是下下个月 
	local Next2Month = os.date("%Y-%m", NowTime + 86400 * 40) 
	local StartDate = NextMonth .. "-01"
	local EndDate = Next2Month .. "-01"
	local StartTime = GetTimeStamp(StartDate .. " 00:00:00")
	local EndTime = GetTimeStamp(EndDate .. " 00:00:00")
	while(StartTime < EndTime) do
		local Date = os.date("%Y%m%d", StartTime)
		for PlatformID, _ in pairs(PlatformIDMap) do
			for TableName, Sql in pairs(CreateTableSqlCfg) do
				Sql = "create table " .. PlatformID .. "_log." .. TableName .. "_" .. Date .. Sql
				local Res, Err = DB:ExeSql(Sql)
				if not Res then
					ngx.say(Err)
				end
			end
		end
		StartTime = StartTime + 86400
	end
	----------------------------------
	--同时要删除上上个月的日志表
	----------------------------------
	local LastMonth = os.date("%Y-%m", NowTime - 86400 * 30)
	local Last2Month = os.date("%Y-%m", NowTime - 86400 * 60)
	StartDate = Last2Month .. "-01"
	EndDate = LastMonth .. "-01"
	StartTime = GetTimeStamp(StartDate .. " 00:00:00")
	EndTime = GetTimeStamp(EndDate .. " 00:00:00")
	while(StartTime < EndTime) do
		local Date = os.date("%Y%m%d", StartTime)
		for PlatformID, _ in pairs(PlatformIDMap) do
			for TableName, _ in pairs(CreateTableSqlCfg) do
				local DeleteSql = "drop table " .. PlatformID .. "_log." .. TableName .. "_" .. Date 
				local Res, Err = DB:ExeSql(DeleteSql)
				if not Res then
					ngx.say(Err)
				end
			end
		end
		StartTime = StartTime + 86400
	end
	ngx.say("ok")
end

DoRequest(true)