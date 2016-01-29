-------------------------------------------------
--$Id: user_platform_perm_data.lua 3691 2014-05-13 03:37:42Z zork $
-------------------------------------------------
--[[
-- smcs.tblUserMenuPerm表相关操作
--[[ CREATE TABLE `tblUserPlatformPerm` (
  `UserID` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `PlatfromID`  varchar(16) NOT NULL DEFAULT '' COMMENT '平台ID',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`UserID`,`PlatfromID`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户平台权限表']]

--]]
module(...,package.seeall)

function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.UserID and Options.UserID ~= "" then
		Where = Where .. " and UserID = '" .. Options.UserID .. "'"
	end
	if Options.PlatfromID and Options.PlatfromID ~= "" then
		Where = Where .. " and PlatfromID = '" .. Options.PlatfromID .. "'"
	end
	local Sql = "select * from smcs.tblUserPlatformPerm " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function Delete(self, Options)
	local Where = " where Flag = 'true' "
	if Options.UserID and Options.UserID ~= "" then
		Where = Where .. " and UserID = '" .. Options.UserID .. "'"
	end
	local Sql = "update smcs.tblUserPlatformPerm set Flag = 'false' " .. Where
	DB:ExeSql(Sql)
end

function Insert(self, UserID, PlatfromIDs)
	local Values = {}
	if not UserID or UserID == "" then --UserID为空则直接返回
		return
	end
	if type(PlatfromIDs) == "string" then
		PlatfromIDs = {PlatfromIDs}
	end
	if not PlatfromIDs or #PlatfromIDs == 0 then
		return
	end
	for _, PlatfromID in ipairs(PlatfromIDs) do
		if PlatfromID and PlatfromID ~= "" then
			local Str = "('".. UserID .."','" .. PlatfromID .. "')"
			table.insert(Values, Str)
		end
	end
	local Sql = "insert into smcs.tblUserPlatformPerm(UserID,PlatfromID) values" .. table.concat(Values, ",")
		.. " on duplicate key update Flag = 'true'"
	DB:ExeSql(Sql)
end

