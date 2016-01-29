------------------------------------------
--$Id: item_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblItemLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `OperationType` tinyint(4) NOT NULL DEFAULT '1' COMMENT ' 操作类型:1:获得，2:删除',
  `Type` varchar(20) NOT NULL DEFAULT '' COMMENT '变化类型',
  `Reason` varchar(64) NOT NULL DEFAULT '' COMMENT '变更原因',
  `Memo` varchar(32) NOT NULL DEFAULT '' COMMENT '备注',
  `ItemName` varchar(32) NOT NULL DEFAULT '' COMMENT '物品名称',
  `ItemType` int(11) NOT NULL DEFAULT '0' COMMENT '物品ID',
  `Amount` int(11) NOT NULL DEFAULT '0' COMMENT '物品数量',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '变更时间',
  `ItemUid` bigint(20) NOT NULL DEFAULT '-1' COMMENT '物品Uid',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品日志表'

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
	if Options.ItemType and Options.ItemType ~= "" then
		Where = Where .. " and ItemType = '" .. Options.ItemType .. "'"
	end
	local Sql = "select * from " .. PlatformID .. "_log.tblItemLog " .. Where
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

local Cols = {"HostID", "Uid", "Name", "OperationType", "Type", "Reason", "Memo", "ItemName", "ItemType", "Amount", "ItemUid", "Time"}

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
	local Sql = "insert into " .. PlatformID .. "_log.tblItemLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

