------------------------------------------
--$Id: item_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblInstanceLog_20160322` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `InstanceID` varchar(32) NOT NULL DEFAULT '' COMMENT '副本ID',
  `InstanceName` varchar(32) NOT NULL DEFAULT '' COMMENT '副本名称',
  `OperationType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作类型,1:挑战,2:扫荡',
  `Num` int(11) NOT NULL DEFAULT '0' COMMENT '次数',
  `Result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '结果,1:成功,0:失败',
  `Reward` varchar(128) NOT NULL DEFAULT '' COMMENT '奖励',
  `Star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '星级评定',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `InstanceType` int(11) NOT NULL DEFAULT '0' COMMENT '副本类型ID',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`),
  KEY `index2` (`Uid`),
  KEY `index3` (`Name`),
  KEY `index4` (`HostID`,`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='副本日志表'

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
	if Options.InstanceID and Options.InstanceID ~= "" then
		Where = Where .. " and InstanceID like '%" .. Options.InstanceID .. "%'"
	end
	if Options.InstanceType and Options.InstanceType ~= "" then
		Where = Where .. " and InstanceType = '" .. Options.InstanceType .. "'"
	end
	if Options.InstanceName and Options.InstanceName ~= "" then
		Where = Where .. " and InstanceName like '%" .. Options.InstanceName .. "%'"
	end
	--计算所跨天数
    local DateList = CommonFunc.GetMySqlTableDateList(StartDate, EndDate)
    local Sqls = {}
    for _, Date in ipairs(DateList) do
		local Sql = "select * from " .. PlatformID .. "_log.tblInstanceLog_" .. Date .. Where
		table.insert(Sqls, Sql)
    end
	Sqls = table.concat( Sqls, " union ")
	local Res, Err = DB:ExeSql(Sqls)
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

local Cols = {"HostID", "Uid", "Name", "InstanceType", "InstanceID", "InstanceName", "OperationType", 
	"Num", "Result", "Reward", "Star", "Time"}

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
	--插入数据库
	for Date, DateResults in pairs(StrResults) do
		local Sql = "insert into " .. PlatformID .. "_log.tblInstanceLog_" .. Date .. "(" 
			.. table.concat(Cols, ",") .. ") values(" .. table.concat(DateResults, "),(") .. ")"
		DB:ExeSql(Sql)
	end
	return true
end

