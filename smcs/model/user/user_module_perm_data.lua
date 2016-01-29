-------------------------------------------------
--$Id: user_module_perm_data.lua 3691 2014-05-13 03:37:42Z zork $
-------------------------------------------------
--[[
-- smcs.tblUserMenuPerm表相关操作
--[[ CREATE TABLE `tblUserMenuPerm` (
  `UserID` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `Module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`UserID`,`Module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户菜单权限表']]

--]]
module(...,package.seeall)

function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.UserID and Options.UserID ~= "" then
		Where = Where .. " and UserID = '" .. Options.UserID .. "'"
	end
	if Options.Module and Options.Module ~= "" then
		Where = Where .. " and Module = '" .. Options.Module .. "'"
	end
	local Sql = "select * from smcs.tblUserMenuPerm " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function Delete(self, Options)
	local Where = " where Flag = 'true' "
	if Options.UserID and Options.UserID ~= "" then
		Where = Where .. " and UserID = '" .. Options.UserID .. "'"
	end
	local Sql = "update smcs.tblUserMenuPerm set Flag = 'false' " .. Where
	DB:ExeSql(Sql)
end

function Insert(self, UserID, Modules)
	local Values = {}
	if not UserID or UserID == "" then --UserID为空则直接返回
		return
	end
	if type(Modules) == "string" then
		Modules = {Modules}
	end
	for _, Module in ipairs(Modules) do
		if Module and Module ~= "" then
			local Str = "('".. UserID .."','" .. Module .. "')"
			table.insert(Values, Str)
		end
	end
	local Sql = "insert into smcs.tblUserMenuPerm(UserID,Module) values" .. table.concat(Values, ",")
		.. " on duplicate key update Flag = 'true'"
	DB:ExeSql(Sql)
end

