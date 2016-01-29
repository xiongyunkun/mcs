------------------------------------------
--$Id: permissiondata.lua 3691 2014-05-13 03:37:42Z zork $
------------------------------------------
--[[
-- permission data operator
-- addgroup
-- delgroup
-- add user to group
-- del user to group
-- add group permission
-- del group permission
-- check user permission
--]]

module(...,package.seeall)

--[[
-- {ModuleName={userid=true,...},...}
--]]
AllPermission = nil
function GetAllPermission(self)
	local Sql = [[select tblUser.id as userid, tblUser.account as account, groupinfo.groupid as groupid, 
		permission.module as module from tblUser left join (groupinfo, permission) on (tblUser.id=groupinfo.userid 
		and groupinfo.groupid=permission.groupid) where groupinfo.groupid is not null]]
	local Res,Err = DB:ExeSql(Sql)
	if AllPermission then
		return AllPermission --有就直接返回
	end
	AllPermission = {}
	for _, Perm in pairs(Res) do
		if not AllPermission[Perm.module] then
			AllPermission[Perm.module] = {}
		end
		AllPermission[Perm.module][Perm.userid] = true
	end
	return AllPermission, Err
end

function Get(self, Options)
	local Where = " where 1=1 "
	if Options and Options.ID and Options.ID ~= "" then
		Where = Where .. " and id = '" .. Options.ID .. "'"
	end
	if Options and Options.Name and Options.Name ~= "" then
		Where = Where .. " and name like '%" .. Options.Name .. "'"
	end
	if ngx.var.system and ngx.var.system ~= "" then
		Where = Where .. " and System like '%" .. ngx.var.system .. "%'"
	end
	local Sql = "select * from smcs.tblGroups " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function CheckUserPermission(self, UserId, ModuleName)
	if not ModuleName or ModuleName == "" then return true end
	local Permissions = UserModuleData:Get({UserID=UserId})
	if not Permissions or #Permissions == 0 then
		return false
	end
	for _, Permission in ipairs(Permissions) do
		if Permission.Module == ModuleName then
			return true
		end
	end
	return false
end

function GetAllGroup(self)
	local Sql = "select * from tblGroups order by id"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function GetAllGroupInfo(self)
	local Sql = "select userid, groupid, tblGroups.name as groupname from groupinfo left join (tblGroups) on (groupinfo.groupid=tblGroups.id)"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function AddGroup(self, Params)
	local Sql = "insert into smcs.tblGroups(name,system) values('" .. Params.Name .. "','" .. Params.System .. "')"
	local Ret, Err = DB:ExeSql(Sql)
	return true, Err
end

function UpdateGroup(self, Params)
	local Sql = "update smcs.tblGroups set name = '" ..Params.name .. "',system = '" .. Params.system .. "' where id = '" .. Params.id .. "'"
	local Ret, Err = DB:ExeSql(Sql)
end

function DelGroup(self, GroupId)
	local Sql = "delete from permission where groupid="..GroupId
	local Ret, Err = DB:ExeSql(Sql)
	Sql = "delete from groupinfo where groupid="..GroupId
	Ret, Err = DB:ExeSql(Sql)
	Sql = "delete from tblGroups where id="..GroupId
	Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil 
	return true, Err
end

--获得账号角色组信息
function GetGroupInfo(self, Options)
	local Where = " where 1=1 "
	if Options.userid and Options.userid ~= "" then
		Where = Where .. " and userid= '" .. Options.userid .. "'"
	end
	if Options.groupid and Options.groupid ~= "" then
		Where = Where .. " and groupid='" .. Options.groupid .. "'"
	end
	local Sql = "select * from smcs.groupinfo " .. Where
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function DelGroupInfo(self, UserID)
	local Sql = "delete from groupinfo where userid='"..UserID.."'"
	local Ret, Err = DB:ExeSql(Sql)
	return true, Err
end

function AddUserToGroup(self, UserId, GroupId)
	local Sql = "insert into groupinfo set userid="..UserId..",groupid="..GroupId
	local Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil 
	return true, Err
end

function DelUserFromGroup(self, UserId, GroupId)
	local Sql = "delete from groupinfo where userid="..UserId.." and groupid="..GroupId
	local Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil 
	return true, Err
end

function GetPermissionByGroup(self, GroupId)
	local Sql = "select * from permission where groupid="..GroupId
	local Res, Err = DB:ExeSql(Sql)
	return Res
end

function AddGroupPermission(self, GroupId, ModuleName)
	local Sql = "insert into permission set groupid="..GroupId..",module='"..ModuleName.."'"
	local Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil 
	return true, Err
end

function DelGroupPermission(self, GroupId, ModuleName)
	local Where = " where 1 = 1 "
	if GroupId then
		Where = Where .. " and groupid= '"..GroupId.."'"
	end
	if ModuleName then
		Where = Where .. " and module='"..ModuleName.."'"
	end
	local Sql = "delete from permission " .. Where
	local Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil
	return true, Err
end


