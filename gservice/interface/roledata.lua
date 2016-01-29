------------------------------------
--$Id: roledata.lua 3697 2014-05-13 03:51:38Z zork $
------------------------------------
--[[
--	角色信息数据操作
--
--| account  | varchar(255) | YES  | MUL | NULL              |                             |
--| name     | varchar(32)  | YES  |     | NULL              |                             |
--| hostid   | int(8)       | NO   | PRI | 0                 |                             |
--| userid   | int(64)      | NO   | PRI | 0                 |                             |
--| lasttime | timestamp    | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
--]]
module(...,package.seeall)

function AddRole(self, Account, Name, HostId, UserId)
	local sql = "insert into roleinfo values('%s','%s',%d,%d,now(),1)"
	ngx.say(sql)
	local res, err = DB:ExeSql(string.format(sql,Account,Name,HostId,UserId))
	return res, err
end

function UpdateRole(self, HostId, UserId)
	Sql = "update roleinfo set lasttime=NOW() where hostid=%d and userid=%d"
	local Res,Err = DB:ExeSql(string.format(Sql,HostId,UserId))
	Res = tonumber(string.match(Err,".*Changed: (%d+).*"))
	return Res
end

function GetRoleInfo(self, Account)
	local Sql = "select hostid,userid,UNIX_TIMESTAMP(lasttime) as time,isdel from roleinfo where account='%s'"
	local Res, Err = DB:ExeSql(string.format(Sql,Account))
	return Res, Err
end

local Tbl = {"account", "name", "hostid", "userid", "lasttime"}
function GetRoleCnt(self, Params)
	local Sql = "select count(1) as cnt from roleinfo where 1=1 "
	for _,Col in ipairs(Tbl) do
		if Params[Col] then
			Sql = Sql .. " and " .. Col .. " = " .. Params[Col]
		end
	end
	return DB:ExeSql(Sql)
end

function DelRol(self, HostId, UserId)
	local Sql = "Update roleinfo set isdel=1 where hostid=%d and userid=%d"
	local Res = DB:ExeSql(string.format(Sql, HostId, UserId))
	return Res 
end

