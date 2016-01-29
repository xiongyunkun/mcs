------------------------------------
--$Id: login.lua 3697 2014-05-13 03:51:38Z zork $
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
		Viewer:View("mainfram.html")
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
	SetSession("UserId",User.id)
	ngx.redirect("/")
end

function DoLogout(self)
	if GetSession("UserId") then
		DelSession()		
	end
	ngx.redirect("/")
end

DoRequest(true)
