-------------------------------------------------
--$Id: userdata.lua 3691 2014-05-13 03:37:42Z zork $
-------------------------------------------------
--[[
-- UserData Operator
--]]
module(...,package.seeall)

function GetAllUsers(self)
	local Sql = "select * from tblUser"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function GetUserByAccount(self, Account)
	local Users = self:Get({},true)
	for _, User in pairs(Users) do
		if User.account == Account then
			return User
		end
	end
	return nil
end

function Get(self, Options, NoSystem)
	local Where = " where 1 = 1 "
	if Options and Options.id and Options.id ~= "" then
		Where = Where .. " and id = '" .. Options.id .. "'"
	end
	if Options and Options.Account and Options.Account ~= "" then
		Where = Where .. " and account like '%" .. Options.Account .. "%'"
	end
	if Options and Options.Name and Options.Name ~= "" then
		Where = Where .. " and name like '%" .. Options.Name .. "%'"
	end
	if not NoSystem and ngx.var.system and ngx.var.system ~= "" then
		Where = Where .. " and System like '%" .. ngx.var.system .. "%'"
	end
	local Sql = "select * from smcs.tblUser " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function GetUserById(self, Id)
	local Users = self:GetAllUsers()
	for _, User in pairs(Users) do
		if User.id == Id then
			return User
		end
	end
	return nil
end

UserCol = {"account","password","name","mail","rtx","mobile","qq", "system"}
function AddUser(self, UserInfo)
	-- check col
	local Sql = "insert into tblUser set "
	local SetTbl = {}
	for _, Col in pairs(UserCol) do
		if not UserInfo[Col] then
			return false
		end
		table.insert(SetTbl, Col.."='"..UserInfo[Col].."'")
	end
	Sql = Sql .. table.concat(SetTbl,",")
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return true, Err
end

function DelUserById(self, Id)
	local Sql = "delete from tblUser where id="..Id
	local Res,Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return true
end

function ModifyUser(self, UserInfo)
	local Sql = "update tblUser set "
	local SetTbl = {}
	for _, Col in pairs(UserCol) do
		if Col ~= "account" and UserInfo[Col] then
			table.insert(SetTbl, Col.."='"..UserInfo[Col].."'")
		end
	end
	Sql = Sql .. table.concat(SetTbl,",").." where account='"..UserInfo.account.."'"
	local Res, Err = DB:ExeSql(Sql)
	AllUsers = {}
	if not Res then return nil, Err end
	return true, Err
end

--获得组成员列表
function GetGroupMembers(self, GroupID)
	local Sql = "select a.* from smcs.tblUser as a,smcs.groupinfo as b where a.id = b.userid and b.groupid = '" .. GroupID .. "'"
	local Ret, Err = DB:ExeSql(Sql)
	return Ret
end

--验证密码是否正确
function VerifyPassword(self, ID, Password)
	local Sql = "select * from smcs.tblUser where id = '" .. ID .. "' and password = '" .. Password .. "'"
	local Ret, Err = DB:ExeSql(Sql)
	if Ret and Ret[1] then
		return true
	else
		return false
	end
end

--修改密码
function UpdatePassword(self, ID, Password)
	local Sql = "update smcs.tblUser set password = '" .. Password .. "' where id = '" .. ID .. "'"
	local Ret, Err = DB:ExeSql(Sql)
	return Ret
end
