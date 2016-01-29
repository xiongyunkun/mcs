-----------------------------------------
--$Id: usermgr.lua 3697 2014-05-13 03:51:38Z zork $
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
	UserList = UserData:GetAllUsers()  
	ExtMsg = Msg	
	Viewer:View("template/viewuser.html")
end

function DoAddUser(self)
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
	local Ret, Msg = UserData:AddUser(args)
	self:ListUsers(Msg)
end

function DoDelUser(self)
	local Aid = GetQueryArg("id")
	local Ret, Msg = UserData:DelUserById(Aid)	
	self:ListUsers(Msg)
end

function ReqModifyUser(self)
	local Aid = GetQueryArg("id")
	User = UserData:GetUserById(tonumber(Aid))  
	if not User then
		self:ListUsers(string.format(MsgList[2],Aid))
		return
	end
	Viewer:View("template/modifyuser.html")
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
	local Ret, Msg = UserData:ModifyUser(args)
	self:ListUsers(Msg)
end

DoRequest()
