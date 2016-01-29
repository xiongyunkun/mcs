------------------------------------
--$Id: login.lua 56211 2015-04-08 09:05:48Z xiongyunkun $
------------------------------------
--[[
--for user login
--]]

local MsgList = {
"账号或密码不正确",
"该账号还不能登录",
}

function ReqLogin(self)
	if GetSession("UserId") then
		local System = ngx.var.system or ""
		if System == "oss" then
			Viewer:View("mainframe_oss.html")
		else
			Viewer:View("mainframe.html")
		end
		return
	end
	Viewer:View("template/login.html")
end

function DoLogin(self)
	local Args = GetPostArgs()
	local Account = Args.account
	local Pass = Args.pass
	local User = UserData:GetUserByAccount(Account)
	if not User then
		ngx.say(MsgList[1])
		return
	end
	if not User.password or User.password == "" then
		ngx.say(MsgList[2])
		return
	end
	if not Pass or Pass == "" or ngx.md5(Pass) ~= User.password then
		ngx.say(MsgList[1])
		return
	end

	--把用户的权限列表也设置在session中
	local ModulePermissions = UserModuleData:Get({UserID=User.id})
	local ModulePermissionList = {}
	for _, Permission in ipairs(ModulePermissions) do
		ModulePermissionList[Permission.Module] = true
	end
	--把用户的平台权限列表也设置在session中
	local PlatformPerms = UserPlatformData:Get({UserID=User.id})
	local PlatformPermList = {}
	for _, PlatformPerm in ipairs(PlatformPerms) do
		PlatformPermList[PlatformPerm.PlatfromID] = true
	end
	local SessionTable = {
		UserId = User.id,
		ModulePermissions = ModulePermissionList,
		PlatformPermissions = PlatformPermList,
	}
	BatchSetSession(SessionTable)
	ngx.redirect("/")
end

function DoLogout(self)
	if GetSession("UserId") then
		DelSession()		
	end
	ngx.redirect("/")
end

DoRequest(true)
