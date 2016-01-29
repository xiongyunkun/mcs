------------------------------------------
--$Id: task_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblTaskLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` int(11) NOT NULL DEFAULT '0'  COMMENT '玩家角色ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号', 
  `Task` int(11) NOT NULL DEFAULT '0'  COMMENT '任务ID', 
  `Type` tinyint NOT NULL DEFAULT '1' COMMENT '类型（1:接受任务；2:完成任务）',
  `TaskType` tinyint NOT NULL DEFAULT '1' COMMENT '任务类型（1:主线任务；2:其他任务）', 
  `Time` datetime  DEFAULT NULL  COMMENT '接受/完成时间',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表'


--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where 1=1 "
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time = '" .. Options.Time .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.AchieveId and Options.AchieveId ~= "" then
		Where = Where .. " and AchieveId = '" .. Options.AchieveId .. "'"
	end
	local Sql = "select * from " .. PlatformID .. "_log.tblTaskLog " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

--获得某一时间点的数据，并且组装成{Uid=Time}格式
function GetSameTimeStatics(self, PlatformID, Options)
	local Res = self:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[Info.Uid] = Info.Time
	end
	return Results
end

local Cols = {"HostID", "Uid", "Urs", "AchieveId", "FinishLevel", "Time"}

function BatchInsert(self, PlatformID, Results)
	local StrResults = {}
	for _, Result  in ipairs(Results) do
		local List = {}
		for _, Col in ipairs(Cols) do
			local Value = Result[Col] or ""
			table.insert(List, "'" .. Value .. "'")
		end
		local StrValue = table.concat(List, ",")
		table.insert(StrResults, StrValue)
	end
	--插入数据库
	local Sql = "insert into " .. PlatformID .. "_log.tblTaskLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

