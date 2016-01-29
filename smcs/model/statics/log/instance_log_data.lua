------------------------------------------
--$Id: item_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblInstanceLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `StageId` varchar(32) NOT NULL DEFAULT '' COMMENT '副本ID',
  `StageType` varchar(32) NOT NULL DEFAULT '' COMMENT '副本名称',
  `Times` int(11) NOT NULL DEFAULT '0' COMMENT '次数',
  `NotPassEvent` varchar(32) NOT NULL DEFAULT '' COMMENT '未通过回合',
  `CardList` varchar(32) NOT NULL DEFAULT '' COMMENT '上阵阵型',
  `Bonus` varchar(256) NOT NULL DEFAULT '' COMMENT '奖励',
  `IsFinish` tinyint(4) NOT NULL DEFAULT '0' COMMENT '星级评定',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `IsFirstWin` tinyint(4) DEFAULT '0' COMMENT '是否第一次通关副本，1：是，0：否',
  `IsFirstEnter` tinyint(4) DEFAULT '0' COMMENT '是否第一次打副本，1：是，0：否',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`),
  KEY `index2` (`Uid`),
  KEY `index3` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='副本日志表'

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
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.StageId and Options.StageId ~= "" then
		Where = Where .. " and StageId like '%" .. Options.StageId .. "%'"
	end
	if Options.StageType and Options.StageType ~= "" then
		Where = Where .. " and StageType like '%" .. Options.StageType .. "%'"
	end
	if Options.IsFirstWin and Options.IsFirstWin ~= "" then
		Where = Where .. " and IsFirstWin = '" .. Options.IsFirstWin .. "'"
	end
	local Sql = "select * from " .. PlatformID .. "_log.tblInstanceLog " .. Where
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

local Cols = {"HostID", "Uid", "Name", "Urs", "StageId", "StageType", "Times","NotPassEvent", 
	"Bonus", "IsFinish", "CardList", "Time", "IsFirstWin", "IsFirstEnter"}

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
	local Sql = "insert into " .. PlatformID .. "_log.tblInstanceLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	ngx.say(Sql)
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

