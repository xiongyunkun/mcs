-------------------------------------------------
--$Id: userdata.lua 3697 2014-05-13 03:51:38Z zork $
-------------------------------------------------
--[[
-- UserData Operator
--]]
module(...,package.seeall)

local AllUsers = {}
function GetAllUsers(self)
	if #AllUsers > 0 then
		return AllUsers
	end
	local Sql = "select * from users"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	-- id account name mail rtx mobile qq
	for i, row in ipairs(Res) do
		local User = {}
		for col, val in pairs(row) do
			User[col] = val
		end
		table.insert(AllUsers, User)
	end
	return AllUsers
end

function GetUserByAccount(self, Account)
	local Users = self:GetAllUsers()
	for _, User in pairs(Users) do
		if User.account == Account then
			return User
		end
	end
	return nil
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

UserCol = {"account","password","name","mail","rtx","mobile","qq"}
function AddUser(self, UserInfo)
	-- check col
	local Sql = "insert into users set "
	local SetTbl = {}
	for _, Col in pairs(UserCol) do
		if not UserInfo[Col] then
			return false
		end
		table.insert(SetTbl, Col.."='"..UserInfo[Col].."'")
	end
	Sql = Sql .. table.concat(SetTbl,",")
	local Res, Err = DB:ExeSql(Sql)
	AllUsers = {}
	if not Res then return nil, Err end
	return true, Err
end

function DelUserById(self, Id)
	local Sql = "delete from users where id="..Id
	local Res,Err = DB:ExeSql(Sql)
	AllUsers = {}
	if not Res then return nil, Err end
	return true
end

function ModifyUser(self, UserInfo)
	local Sql = "update users set "
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

