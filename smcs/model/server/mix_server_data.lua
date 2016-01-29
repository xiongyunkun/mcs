-------------------------------------------------------
--$Id: server_info_data.lua 50924 2015-03-16 12:37:54Z zork $
-------------------------------------------------------
--[[
CREATE TABLE `tblMixServers` (
  `PlatformID` varchar(16) NOT NULL DEFAULT '' COMMENT '平台ID',
  `ServerID` varchar(16) NOT NULL DEFAULT '' COMMENT '服编号',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服HostID',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`ServerID`),
  KEY `index1` (`HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='混服配置表'
--]]

module(...,package.seeall)

function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.PlatformIDs and Options.PlatformIDs ~= "" then
		Where = Where .. " and PlatformID in ('" .. Options.PlatformIDs .. "')"
	end
	if Options.ServerID and Options.ServerID ~= "" then
		Where = Where .. " and ServerID = '" .. Options.ServerID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	local Sql = "select * from smcs.tblMixServers " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--根据平台获得服务器信息
function GetServers(self, PlatformID)
	local Sql = "select a.* from smcs.servers a, smcs.tblMixServers b " 
		.. "where a.hostid = b.HostID and b.PlatformID = '" .. PlatformID .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"PlatformID", "ServerID", "HostID"}
local UpdateCols = {"HostID"}

function Insert(self, Args)
	local Values = {}
	local UpdateValues = {}
	for _, ColName in ipairs(Cols) do
		local Value = Args[ColName] and "'".. Args[ColName].."'" or "''"
		table.insert(Values, Value)
	end
	for _, ColName in ipairs(UpdateCols) do
		local Value = Args[ColName] and "'".. Args[ColName].."'" or "''"
		Value = ColName .. "=" ..Value
		table.insert(UpdateValues, Value)
	end

	local Sql = "insert into smcs.tblMixServers (" .. table.concat( Cols, ",") .. ") values("
		.. table.concat( Values, ",") .. ") on duplicate key update " ..table.concat( UpdateValues, ", ") .. ", Flag = 'true'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function Delete(Self, PlatformID, ServerID)
	local Sql = "update smcs.tblMixServers set Flag = 'false' where PlatformID = '" .. PlatformID 
		.. "' and ServerID = '" .. ServerID .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end
