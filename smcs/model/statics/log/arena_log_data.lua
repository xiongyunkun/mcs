------------------------------------------
--$Id: arena_log_data.lua 87328 2016-01-14 02:56:59Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblArenaLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服<8d>ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `TargetUid` int(11) NOT NULL DEFAULT '0' COMMENT '目标玩家账号ID',
  `TargetUrs` varchar(32) NOT NULL DEFAULT '' COMMENT '目标平台账号',
  `TargetName` varchar(32) NOT NULL DEFAULT '' COMMENT '目标角色名',
  `Rank` int(11) NOT NULL DEFAULT '0' COMMENT '现在排名',
  `TRank` int(11) NOT NULL DEFAULT '0' COMMENT '原来排名',
  `FightGroup` varchar(32) NOT NULL DEFAULT '' COMMENT '挑战队伍',
  `DefendGroup` varchar(32) NOT NULL DEFAULT '' COMMENT '防守队伍',
  `FightName` varchar(32) NOT NULL DEFAULT '' COMMENT '挑战队伍',
  `DefendName` varchar(32) NOT NULL DEFAULT '' COMMENT '防守队伍',
  `Time` datetime DEFAULT NULL COMMENT '时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='竞技场记录表'

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
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from " .. PlatformID .. "_log.tblArenaLog " .. Where
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

local Cols = {"HostID", "Uid", "Urs", "Name", "TargetUid", "TargetUrs", "TargetName", "Rank", "TRank", "FightGroup", "DefendGroup" ,"FightName", "DefendName", "Time"}
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
	local Sql = "insert into " .. PlatformID .. "_log.tblArenaLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

