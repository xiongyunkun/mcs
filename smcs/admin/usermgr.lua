-----------------------------------------
--$Id: usermgr.lua 82744 2015-08-14 02:48:14Z xiongyunkun $
----------------------------------------
--[[
-- manage the users
-- list user
-- add user
-- del user
--]]

local MsgList = {
"账号\"%s\"已经存在",
"Id为:%s的账号信息不存在",
"账号\"%s\"不存在",
}

function ListUsers(self, Msg)
	Account = GetQueryArg("account") or ""
	Name = GetQueryArg("name") or ""
	UserList = UserData:Get({Account = Account, Name = Name,})
	System = ngx.var.system or ""
	for _, User in pairs(UserList) do
		if User.system == "" then
			User.SystemName = "全部"
		else
			local Systems = string.split(User.system, ",")
			local SystemNames = {}
			for _, System in ipairs(Systems) do
				if CommonData.SystemMap[System] then
					table.insert(SystemNames, CommonData.SystemMap[System])
				end
			end
			User.SystemName = table.concat(SystemNames, ",")
		end
	end
	ExtMsg = Msg
	Viewer:View("template/user/viewuser.html")
end

function DoAddUser(self)
	if ngx.var.request_method == "POST" then
		local args = GetPostArgs() 
		local User = UserData:GetUserByAccount(args.account)
		if User then
			self:ListUsers(string.format(MsgList[1],args.account))
			return
		end
		local Password = args.password
		if Password and Password ~= "" then
			args.password = ngx.md5(Password)
		end
		--适用系统
		if args.system then
			if type(args.system) == "table" then
				args.system = table.concat(args.system, ",")
			end
		else
			args.system = ngx.var.system or ""
		end
		local Ret, Msg = UserData:AddUser(args)
		self:ListUsers(Msg)
	else
		SystemMap = {} --让'全部'选项排第一
		System = ngx.var.system or ""
		if System == "" then
			SystemMap[""] = "全部"
			for SystemID, SystemName in pairs(CommonData.SystemMap) do
				SystemMap[SystemID] = SystemName
			end
		end
		
		Viewer:View("template/user/adduser.html")
	end
end

function DoDelUser(self)
	local Args = GetPostArgs()
	local Aid = Args.ID
	local Ret, Msg = UserData:DelUserById(Aid)	
	ngx.say("1")
end

function ReqModifyUser(self)
	local Aid = GetQueryArg("id")
	User = UserData:GetUserById(tonumber(Aid))  
	if not User then
		self:ListUsers(string.format(MsgList[2],Aid))
		return
	end
	local Systems = string.split(User.system, ",")
	local NewSystems = {}
	if #Systems > 0 then 
		for _, SystemID in ipairs(Systems) do
			NewSystems[SystemID] = true
		end
	else
		NewSystems[""] = true
	end
	User.system = NewSystems
	SystemMap = {} --让'全部'选项排第一
	System = ngx.var.system or ""
	if System == "" then
		SystemMap[""] = "全部"
		for SystemID, SystemName in pairs(CommonData.SystemMap) do
			SystemMap[SystemID] = SystemName
		end
	end
	Viewer:View("template/user/modifyuser.html")
end

function DoModifyUser(self)
	local args = GetPostArgs() 
	local User = UserData:GetUserByAccount(args.account)
	if not User then
		self:ListUsers(string.format(MsgList[3],args.account))
		return
	end
	local Password = args.password
	if Password and Password ~= "" then
		args.password = ngx.md5(Password)
	else
		args.password = User.password
	end
	--适用系统
	if args.system then
		if type(args.system) == "table" then
			args.system = table.concat(args.system, ",")
		end
	else
		args.system = ngx.var.system or ""
	end
	local Ret, Msg = UserData:ModifyUser(args)
	self:ListUsers(Msg)
end

--设置用户权限
function DoSetPerm(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		--设置角色组
		PermissionData:DelGroupInfo(Args.UserID)
		PermissionData:AddUserToGroup(Args.UserID, Args.roleID)
		--先设置平台权限
		UserPlatformData:Delete({UserID = Args.UserID})
		UserPlatformData:Insert(Args.UserID, Args.PlatformID)
		--再设置菜单权限
		UserModuleData:Delete({UserID = Args.UserID})
		UserModuleData:Insert(Args.UserID, Args.MenuID)
		self:ListUsers("设置成功！")
	else
		UserID = GetQueryArg("id")
		if not UserID then
			return
		end
		UserInfo = UserData:Get({id = UserID})
		if UserInfo and UserInfo[1] then
			UserInfo = UserInfo[1]
		end
		--获得用户的角色ID
		SelectedRoleID = nil
		local GroupInfo = PermissionData:GetGroupInfo({userid = UserID})
		if GroupInfo and GroupInfo[1] then
			SelectedRoleID = GroupInfo[1].groupid
		end
		--获得角色列表
		local RoleList = PermissionData:Get()
		RoleMap = {}
		for _, RoleInfo in ipairs(RoleList) do
			RoleMap[RoleInfo.id] = RoleInfo.name
		end
		--获得平台列表
		PlatformList = CommonFunc.GetPlatformList(true)
		local SelectedPlatformList = UserPlatformData:Get({UserID = UserID})
		SelectedPlatformMap = {}
		for _, PlatformInfo in ipairs(SelectedPlatformList) do
			SelectedPlatformMap[PlatformInfo.PlatfromID] = true
		end
		--获得菜单列表
		TreeMap = ModulesData:GetModulesTree()
		local SelectedModuleList = UserModuleData:Get({UserID = UserID})
		SelectedModuleMap = {}
		for _, ModuleInfo in ipairs(SelectedModuleList) do
			SelectedModuleMap[ModuleInfo.Module] = true
		end
		Viewer:View("template/permission/user_permission.html")
	end
end

--获得组内成员列表
function GetGroupMembers(self)
	GroupID = GetQueryArg("id")
	GroupName = GetQueryArg("name")
	UserList = UserData:GetGroupMembers(GroupID)
	Viewer:View("template/user/group_members.html")
end

--个人信息页面
function PersonalInfo(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local UserID = GetSession("UserId")
		local OldPassword = Args.OldPassword
		local NewPassword = Args.NewPassword
		--验证旧密码是否正确
		OldPassword = ngx.md5(OldPassword)
		local OldFlag = UserData:VerifyPassword(UserID, OldPassword)
		if not OldFlag then
			ExtMsg = "修改失败,旧密码不正确！"
		else
			NewPassword = ngx.md5(NewPassword)
			UserData:UpdatePassword(UserID, NewPassword)
			ExtMsg = "修改成功！"
		end
		User = UserData:GetUserById(UserID)
		Viewer:View("template/user/personal_info.html")
	else
		local UserID = GetSession("UserId")
		User = UserData:GetUserById(UserID)
		Viewer:View("template/user/personal_info.html")
	end
end

DoRequest()
