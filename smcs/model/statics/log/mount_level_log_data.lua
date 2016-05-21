------------------------------------------
--$Id: task_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblMountLevelLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家角色ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `MountID` int(11) NOT NULL DEFAULT '0' COMMENT '坐骑ID',
  `TransID` int(11) NOT NULL DEFAULT '0' COMMENT '幻化ID',
  `OrgEvoLevel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '原有幻化等阶',
  `NewEvoLevel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '新幻化等阶',
  `OrgExp` int(11) NOT NULL DEFAULT '0' COMMENT '原有培养值',
  `NewExp` int(11) NOT NULL DEFAULT '0' COMMENT '现培养值',
  `Consumes` varchar(128) NOT NULL DEFAULT '' COMMENT '消耗列表',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`),
  KEY `index2` (`HostID`,`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='坐骑升阶日志表'

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
		local Sql = "select * from " .. PlatformID .. "_log.tblMountLevelLog_" .. Date .. Where
		table.insert(Sqls, Sql)
    end
	Sqls = table.concat( Sqls, " union ")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sqls, HostIP)
	if not Res then return {}, Err end
	return Res
end

local Cols = {"HostID", "Uid", "Name", "MountID", "TransID", "OrgEvoLevel", "NewEvoLevel", "OrgExp",
	"NewExp", "Consumes", "Time"}

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
		local Sql = "insert into " .. PlatformID .. "_log.tblMountLevelLog_" .. Date .. "(" 
			.. table.concat(Cols, ",") .. ") values(" .. table.concat(DateResults, "),(") .. ")"
		DB:ExeSql(Sql, HostIP)
	end
	return true
end

