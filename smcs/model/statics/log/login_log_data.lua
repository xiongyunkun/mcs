------------------------------------------
--$Id: goldlogdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblLoginLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` varchar(32) NOT NULL DEFAULT '' COMMENT '玩家ID',
  `Urs` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家账号',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT '登录IP',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `Lv` int(11) NOT NULL DEFAULT '0' COMMENT '玩家等级',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家登录日志表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
	local StartDate = os.date("%Y-%m-%d", os.time()) --按日期分表,默认是当天
	local EndDate = StartDate --默认与StartDate相等
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time = '" .. Options.Time .. "'"
		StartDate = CommonFunc.GetDate(Options.Time)
		EndDate = StartDate
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
		StartDate = CommonFunc.GetDate(Options.StartTime)
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
		EndDate = CommonFunc.GetDate(Options.EndTime)
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
    if Options.Name and Options.Name ~= "" then
        Where = Where .. " and Name = '" .. Options.Name .. "'"
    end
    if Options.Ip and Options.Ip ~= "" then
        Where = Where .. " and Ip = '" .. Options.Ip .. "'"
    end
    --计算所跨天数
    local DateList = CommonFunc.GetMySqlTableDateList(StartDate, EndDate)
    local Sqls = {}
    for _, Date in ipairs(DateList) do
    	local Sql = "select * from " .. PlatformID .. "_log.tblLoginLog_" .. Date .. Where
    	table.insert(Sqls, Sql)
    end
	Sqls = table.concat( Sqls, " union ")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sqls, HostIP)
	if not Res then return {}, Err end
	return Res
end

--获得某一时间点的数据，并且组装成{Uid=Time}格式
function GetSameTimeStatics(self, PlatformID, Options)
	local Res = self:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[tonumber(Info.Uid)] = Info.Time
	end
	return Results
end

local Cols = {"HostID", "Uid", "Urs", "Ip", "Name", "Time", "Lv"}

function BatchInsert(self, PlatformID, Results)
	local StrResults = {}
	for _, Result  in ipairs(Results) do
		local List = {}
		local Date = nil
		for _, Col in ipairs(Cols) do
			local Value = Result[Col] or ""
			table.insert(List, "'" .. Value .. "'")
			if Col == "Time" then
				Date = CommonFunc.GetMySqlTableDate(Result[Col])
			end
		end
		if Date then
			StrResults[Date] = StrResults[Date] or {}
			local StrValue = table.concat(List, ",")
			table.insert(StrResults[Date], StrValue)
		end
		
	end
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	--插入数据库
	for Date, DateResults in pairs(StrResults) do
		local Sql = "insert into " .. PlatformID .. "_log.tblLoginLog_" .. Date .."(" .. table.concat(Cols, ",") 
			.. ") values(" .. table.concat(DateResults, "),(") .. ")"
		DB:ExeSql(Sql, HostIP)
	end
	return true
end

