------------------------------------------
--$Id: interface_key_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblInterfaceKey` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `IndexName` varchar(32) NOT NULL DEFAULT '' COMMENT '索引简称', 
  `KeyName` varchar(32) NOT NULL DEFAULT '' COMMENT '名称', 
  `Sign` varchar(32) NOT NULL DEFAULT '' COMMENT '密钥', 
  `OperationTime` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`IndexName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台接口密钥表'

--]]
module(...,package.seeall)

function Get( self, Options )
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.IndexName and Options.IndexName ~= "" then
		Where = Where .. " and IndexName = '" .. Options.IndexName .. "'"
	end
	if Options.KeyName and Options.KeyName ~= "" then
		Where = Where .. " and KeyName like'%" .. Options.KeyName .. "%'"
	end
	local Sql = "select * from smcs.tblInterfaceKey " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end
local Cols = {"PlatformID", "IndexName", "KeyName", "Sign", "OperationTime", "Operator"}
local UpdateCols = {"IndexName", "KeyName", "Sign", "OperationTime", "Operator"}

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

	local Sql = "insert into smcs.tblInterfaceKey (" .. table.concat( Cols, ",") .. ") values("
		.. table.concat( Values, ",") .. ") on duplicate key update " ..table.concat( UpdateValues, ", ") .. ", Flag = 'true'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function Delete(Self, PlatformID, IndexName)
	local Sql = "update smcs.tblInterfaceKey set Flag = 'false' where PlatformID = '" .. PlatformID 
		.. "' and IndexName = '" .. IndexName .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


