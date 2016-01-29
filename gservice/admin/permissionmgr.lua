-------------------------------------------------
--$Id: permissionmgr.lua 3697 2014-05-13 03:51:38Z zork $
-------------------------------------------------
--[[
--	Permission mgr
--]]
local MsgList = {
"分组名[%s]已经存在",
"账号[%s]的角色已修改",
}

function ReqGroups(self, Msg)
	Groups = PermissionData:GetAllGroup()
	ExtMsg = Msg
	Viewer:View("template/groupmgr.html")	
end

function DoAddGroup(self)
	local Args = GetPostArgs()
	local GroupName = Args.grpname
	local Groups = PermissionData:GetAllGroup()
	for _, Group in pairs(Groups) do
		if Group.name == GroupName then
			self:ReqGroups(string.format(MsgList[1],GroupName))
			return
		end
	end
	local Ret, Msg = PermissionData:AddGroup(GroupName)
	self:ReqGroups(Msg)
end

function DoDelGroup(self)
	local GroupId = GetQueryArg("grpid")
	local Ret, Msg = PermissionData:DelGroup(GroupId)
	self:ReqGroups(Msg)
end

--account and group mgr
function ReqListAccountGroups(self, Msg)
	local Users = UserData:GetAllUsers()
	local AllGroupInfo = PermissionData:GetAllGroupInfo()
	Groups = PermissionData:GetAllGroup()
	UserGroupInfo = {}
	for _, User in ipairs(Users) do
		local UserInfo = {User=User,Groups={}}
		for _, GroupInfo in ipairs(AllGroupInfo) do
			if GroupInfo.userid == User.id then
				UserInfo.Groups[GroupInfo.groupid] = true
			end
		end
		table.insert(UserGroupInfo, UserInfo)
	end
	ExtMsg = Msg
	Viewer:View("template/usergroups.html")
end

function AddUserToGroups(self)
	local Args = GetPostArgs()
	local UserId = Args.uid
	local UserName = Args.name
	local Groups = PermissionData:GetAllGroup()
	local CheckedGroups = {}
	for _, Groups in ipairs(Groups) do
		if Args["gid"..Groups.id] then
			CheckedGroups[Groups.id] = true
		end
	end
	local AllGroupInfo = PermissionData:GetAllGroupInfo()
	local OldGroupInfo = {}
	for _, GroupInfo in ipairs(AllGroupInfo) do
		if GroupInfo.userid == tonumber(UserId) then
			if not CheckedGroups[GroupInfo.groupid] then
				-- delete from group
				local Ret, Err = PermissionData:DelUserFromGroup(UserId, GroupInfo.groupid)
			end
			OldGroupInfo[GroupInfo.groupid] = true
		end
	end
	-- do add to group
	for grpid, _ in pairs(CheckedGroups) do
		if not OldGroupInfo[grpid] then
			PermissionData:AddUserToGroup(UserId, grpid)
		end
	end
	
	self:ReqListAccountGroups(string.format(MsgList[2],UserName))
end

-- manage the group permission
function ReqListGroupPermission(self,Msg, Gid)
	local GroupId = GetQueryArg("grpid") or Gid
	local Groups = PermissionData:GetAllGroup()
	local GroupName = ""
	for _, GroupInfo in pairs(Groups) do
		if GroupInfo.id == tonumber(GroupId) then
			GroupName = GroupInfo.name
			break
		end
	end
	Modules = ModulesData:GetAllModules()
	local PermInfo = PermissionData:GetPermissionByGroup(GroupId)
	GroupPermissionInfo = {Id=GroupId, Name=GroupName, Perms={}}
	for _, Perm in pairs(PermInfo) do
		GroupPermissionInfo.Perms[Perm.module] = true
	end
	Viewer:View("template/grouppermission.html")
end

function DoSetGroupPermission(self)
	local Args = GetPostArgs()
	local GroupId = Args.gid
	local MaxPermCount = tonumber(Args.maxcount)
	local CheckedPerm = {}
	for i=1, MaxPermCount do
		if Args["perm"..i] then
			CheckedPerm[Args["perm"..i]] = true
		end
	end
	local PermInfo = PermissionData:GetPermissionByGroup(GroupId)
	local OldPerm = {}
	for _, Perm in ipairs(PermInfo) do
		if not CheckedPerm[Perm.module] then
			-- delete permission
			local Ret, Err = PermissionData:DelGroupPermission(GroupId, Perm.module)
		end
		OldPerm[Perm.module] = true
	end
	-- add permission
	for ModuleName, _ in pairs(CheckedPerm) do
		if not OldPerm[ModuleName] then
			local Ret, Err = PermissionData:AddGroupPermission(GroupId, ModuleName)
		end
	end
	self:ReqListGroupPermission(nil,GroupId)
end

DoRequest()
