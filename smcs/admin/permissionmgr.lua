-------------------------------------------------
--$Id: permissionmgr.lua 56005 2015-04-08 02:18:36Z xiongyunkun $
-------------------------------------------------
--[[
--	Permission mgr
--]]
local MsgList = {
"分组名[%s]已经存在",
"账号[%s]的角色已修改",
}

function ReqGroups(self, Msg)
	Groups = PermissionData:Get()
	System = ngx.var.system or ""
	for _, Group in pairs(Groups) do
		if Group.system == "" then
			Group.SystemName = "全部"
		else
			local Systems = string.split(Group.system, ",")
			local SystemNames = {}
			for _, System in ipairs(Systems) do
				if CommonData.SystemMap[System] then
					table.insert(SystemNames, CommonData.SystemMap[System])
				end
			end
			Group.SystemName = table.concat(SystemNames, ",")
		end
	end
	ExtMsg = Msg
	Viewer:View("template/permission/groupmgr.html")	
end

function DoAddGroup(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local GroupName = Args.grpname
		local Groups = PermissionData:GetAllGroup()
		for _, Group in pairs(Groups) do
			if Group.name == GroupName then
				self:ReqGroups(string.format(MsgList[1],GroupName))
				return
			end
		end
		--适用系统
		if Args.system then
			if type(Args.system) == "table" then
				Args.system = table.concat(Args.system, ",")
			end
		else
			Args.system = ngx.var.system or ""
		end
		local Params = {Name = GroupName, System = Args.system}
		local Ret, Msg = PermissionData:AddGroup(Params)
		self:ReqGroups(Msg)
	else
		SystemMap = {} --让'全部'选项排第一
		System = ngx.var.system or ""
		if System == "" then
			SystemMap[""] = "全部"
			for SystemID, SystemName in pairs(CommonData.SystemMap) do
				SystemMap[SystemID] = SystemName
			end
		end
		
		Viewer:View("template/permission/addgroup.html")
	end
end

function DoEditGroup(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		--适用系统
		if Args.system then
			if type(Args.system) == "table" then
				Args.system = table.concat(Args.system, ",")
			end
		else
			Args.system = ngx.var.system or ""
		end
		PermissionData:UpdateGroup(Args)
		self:ReqGroups()
	else
		local ID = GetQueryArg("id")
		Group = PermissionData:Get({ID = ID})
		if Group then
			Group = Group[1]
		end
		local Systems = string.split(Group.system, ",")
		local NewSystems = {}
		if #Systems > 0 then 
			for _, SystemID in ipairs(Systems) do
				NewSystems[SystemID] = true
			end
		else
			NewSystems[""] = true
		end
		Group.system = NewSystems
		SystemMap = {} --让'全部'选项排第一
		System = ngx.var.system or ""
		if System == "" then
			SystemMap[""] = "全部"
			for SystemID, SystemName in pairs(CommonData.SystemMap) do
				SystemMap[SystemID] = SystemName
			end
		end
		Viewer:View("template/permission/editgroup.html")
	end
end

function DoDelGroup(self)
	local GroupId = GetQueryArg("grpid")
	local Ret, Msg = PermissionData:DelGroup(GroupId)
	self:ReqGroups(Msg)
end

--account and group mgr
function ReqListAccountGroups(self, Msg)
	local Users = UserData:Get()
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
	Viewer:View("template/permission/usergroups.html")
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
	GroupId = GetQueryArg("grpid") or Gid
	local Groups = PermissionData:GetAllGroup()
	local GroupName = ""
	for _, GroupInfo in pairs(Groups) do
		if GroupInfo.id == tonumber(GroupId) then
			GroupName = GroupInfo.name
			break
		end
	end
	--Modules = ModulesData:GetAllModules()
	TreeMap = ModulesData:GetModulesTree()
	local PermInfo = PermissionData:GetPermissionByGroup(GroupId)
	GroupPermissionInfo = {Id=GroupId, Name=GroupName, Perms={}}
	PermMap = {}
	for _, Perm in pairs(PermInfo) do
		PermMap[Perm.module] = true
	end
	Viewer:View("template/permission/group_permission.html")
end

function DoSetGroupPermission(self)
	local Args = GetPostArgs()
	local GroupId = Args.gid
	local MenuIDs = Args.MenuID
	if not GroupId then
		self:ReqGroups()
	end
	-- 先把旧的权限数据删除
	PermissionData:DelGroupPermission(GroupId)
	-- 再加上新的
	
	if type(MenuIDs) == "table" then
		for _, MenuID in ipairs(MenuIDs) do
			PermissionData:AddGroupPermission(GroupId, MenuID)
		end
	else
		PermissionData:AddGroupPermission(GroupId, MenuIDs)
	end
	--self:ReqListGroupPermission(nil,GroupId)
	self:ReqGroups("设置成功！")
end


--返回角色权限列表
function GetGroupPerm(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local RoleID = Args.roleID
		local PermRes = PermissionData:GetPermissionByGroup(RoleID)
		local PermList = {}
		for _, PermInfo in ipairs(PermRes) do
			table.insert(PermList, PermInfo.module)
		end
		ngx.say(table.concat(PermList, ","))
	end
end

DoRequest()
