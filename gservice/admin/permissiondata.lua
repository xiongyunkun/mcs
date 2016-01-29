------------------------------------------
--$Id: permissiondata.lua 3697 2014-05-13 03:51:38Z zork $
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
local AllPermission = nil
function GetAllPermission(self)
	if AllPermission then
		return AllPermission
	end
	local Sql = "select users.id as userid, users.account as account, groupinfo.groupid as groupid, permission.module as module from users left join (groupinfo, permission) on (users.id=groupinfo.userid and groupinfo.groupid=permission.groupid) where groupinfo.groupid is not null"
	local Res,Err = DB:ExeSql(Sql)
	AllPermission = {}
	for _, Perm in pairs(Res) do
		if not AllPermission[Perm.module] then
			AllPermission[Perm.module] = {}
		end
		AllPermission[Perm.module][Perm.userid] = true
	end
	return AllPermission, Err
end

function CheckUserPermission(self, UserId, ModuleName)
	local Permissions = self:GetAllPermission()
	if not ModuleName or ModuleName == "" then return true end
	return Permissions[ModuleName] and Permissions[ModuleName][UserId] or false
end

local AllGroups = {}
function GetAllGroup(self)
	if #AllGroups > 0 then
		return AllGroups
	end
	local Sql = "select * from groups order by id"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	AllGroups = Res
	return AllGroups
end

local AllGroupInfo = {}
function GetAllGroupInfo(self)
	if #AllGroupInfo > 0 then
		return AllGroupInfo
	end
	local Sql = "select userid, groupid, groups.name as groupname from groupinfo left join (groups) on (groupinfo.groupid=groups.id)"
	local Res, Err = DB:ExeSql(Sql)
	AllGroupInfo = Res
	return AllGroupInfo, Err
end

function AddGroup(self, GroupName)
	local Sql = "insert into groups set name='"..GroupName.."'"
	local Ret, Err = DB:ExeSql(Sql)
	AllGroups = {}
	AllGroupInfo = {}
	return true, Err
end

function DelGroup(self, GroupId)
	local Sql = "delete from permission where groupid="..GroupId
	local Ret, Err = DB:ExeSql(Sql)
	Sql = "delete from groupinfo where groupid="..GroupId
	Ret, Err = DB:ExeSql(Sql)
	Sql = "delete from groups where id="..GroupId
	Ret, Err = DB:ExeSql(Sql)
	AllGroups = {}
	AllGroupInfo = {}
	AllPermission = nil 
	return true, Err
end

function GetGroupByUser(self,UserId)
	local Sql = "select groups.id as id, groups.name as name from groupinfo left join (groups) on (groupinfo.groupid=groups.id) where groupinfo.userid="..UserId
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function AddUserToGroup(self, UserId, GroupId)
	local Sql = "insert into groupinfo set userid="..UserId..",groupid="..GroupId
	local Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil 
	AllGroupInfo = {}
	return true, Err
end

function DelUserFromGroup(self, UserId, GroupId)
	local Sql = "delete from groupinfo where userid="..UserId.." and groupid="..GroupId
	local Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil 
	AllGroupInfo = {}
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
	local Sql = "delete from permission where groupid="..GroupId.." and module='"..ModuleName.."'"
	local Ret, Err = DB:ExeSql(Sql)
	AllPermission = nil
	return true, Err
end

