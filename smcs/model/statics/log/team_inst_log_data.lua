------------------------------------------
--$Id: task_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblTeamInstLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `StageId` int(11) NOT NULL DEFAULT '0' COMMENT '副本等级',
  `SubStageId` tinyint(4) NOT NULL DEFAULT '1' COMMENT '副本难度',
  `Rewards` varchar(128) NOT NULL DEFAULT '' COMMENT '奖励列表',
  `Type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型（1:进入副本,2:通关,3:基本奖励,4:附加奖励）',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间'
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`),
  KEY `index2` (`HostID`,`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='诸神黄昏日志表'


--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where 1=1 "
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
	--计算所跨天数
    local DateList = CommonFunc.GetMySqlTableDateList(StartDate, EndDate)
    local Sqls = {}
    for _, Date in ipairs(DateList) do
		local Sql = "select * from " .. PlatformID .. "_log.tblTeamInstLog_" .. Date .. Where
		table.insert(Sqls, Sql)
    end
	Sqls = table.concat( Sqls, " union ")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sqls, HostIP)
	if not Res then return {}, Err end
	return Res
end

local Cols = {"HostID", "Uid", "Urs", "Name", "Type", "StageId", "SubStageId", "Rewards", "Time"}

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
		local Sql = "insert into " .. PlatformID .. "_log.tblTeamInstLog_" .. Date .. "(" 
			.. table.concat(Cols, ",") .. ") values(" .. table.concat(DateResults, "),(") .. ")"
		DB:ExeSql(Sql, HostIP)
	end
	return true
end

