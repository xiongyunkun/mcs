-----------------------------------
--$Id: role_mgr.lua 3697 2014-05-13 03:51:38Z zork $
-----------------------------------
--[[
-- 角色信息管理
-- 1.新建角色时添加记录
-- 2.玩家退出游戏时更新上次游戏时间，没有记录的新加记录
-- 3.获取账号数量信息
--
-- 对外接口
--获取角色数据
--http://192.168.30.132:9993/rolecount?ac=账号
--退出时更新时间
--http://192.168.30.132:9993/updaterole?ac=账号&name=名字&hid=703&uid=1000703
--添加角色
--http://192.168.30.132:9993/newrole?ac=账号&name=名字&hid=703&uid=1000703
--删除角色
--http://172.16.10.200:9993/delrole?ac=账号&name=名字&hid=703&uid=1000703
--]]

-- 新建角色时登记记录
function DoNewRole(self)
	local Account = GetQueryArg("ac")
	local Name = GetQueryArg("name",true)
	local HostId = GetQueryArg("hid")
	local UserId = GetQueryArg("uid")
	if not Account or not Name or not HostId or not UserId or not string.match(HostId,"^%d+$") or not string.match(UserId,"^%d+$") then
		ngx.say("-1 paramerror!")
		return
	end
	ngx.say(Account)
	ngx.say(Name)
	ngx.say(HostId)
	ngx.say(UserId)
	local Ret, Err = RoleData:AddRole(Account, Name, tonumber(HostId), tonumber(UserId))
	if not Err or not string.match(Err,".*%d+.*") then
		ngx.say("OK")
	else
		ngx.say(Err)
	end
	ngx.say(tostring(Ret))
end

-- 退出游戏时更新游戏时间，没有记录的增加记录
function DoUpdateRole(self)
	local Account = GetQueryArg("ac")
	local Name = GetQueryArg("name",true)
	local HostId = GetQueryArg("hid")
	local UserId = GetQueryArg("uid")
	if not Account or not Name or not HostId or not UserId or not string.match(HostId,"^%d+$") or not string.match(UserId,"^%d+$") then
		ngx.say("-1 paramerror!")
		return
	end

	local Cnt = 0
	local Ret = RoleData:GetRoleCnt({["account"]=Account,["name"]=Name,["hostid"]=HostId,["userid"]=UserId}) 
	if Ret then
		for _,v in pairs(Ret) do
			Cnt = v.cnt
			ngx.say(Cnt)
			break
		end
	end

	if Cnt>0 then
		local Ret = RoleData:UpdateRole(tonumber(HostId), tonumber(UserId))
		ngx.say("OK")
		ngx.say("Update")
	else
		local Ret, Err = RoleData:AddRole(Account, Name, tonumber(HostId), tonumber(UserId))
		ngx.say("OK")
		ngx.say("Add")
		return
	end
end

-- 供登录服务器使用，获取账号在各服的所有角色数量
function ReqRoleCount(self)
	local Account = GetQueryArg("ac")
	if not Account then
		ngx.say("-1 paramerror!")
		return
	end
	local Ret, Err = RoleData:GetRoleInfo(Account)
	local HostInfo = {}
	local LastHost = 0
	local LastTime = 0
	if Ret then
		for _, v in pairs(Ret) do
			if v.isdel==0 then 
				HostInfo[v.hostid] = (HostInfo[v.hostid] or 0) + 1
				if tonumber(v.time) > LastTime then
					LastTime = tonumber(v.time)
					LastHost = v.hostid
				end
			end
		end
	end
	ngx.say("OK")
	local RetHostInfo = "{"
	for hid, count in pairs(HostInfo) do
		RetHostInfo =  RetHostInfo .. "[" ..hid.."] = "..count..","
	end
	if LastHost~=0 then
		RetHostInfo = RetHostInfo .. "LastHost = " .. LastHost .. ","
	end
	RetHostInfo = RetHostInfo.."}"
	ngx.say(RetHostInfo)
end

function DoDelRole(self)
	local Account = GetQueryArg("ac")
	local Name = GetQueryArg("name",true)
	local HostId = GetQueryArg("hid")
	local UserId = GetQueryArg("uid")
	if not Account or not Name or not HostId or not UserId or not string.match(HostId,"^%d+$") or not string.match(UserId,"^%d+$") then
		ngx.say("-1 paramerror!")
		return
	end

	local Cnt = 0
	local Ret = RoleData:GetRoleCnt({["account"]=Account,["name"]=Name,["hostid"]=HostId,["userid"]=UserId}) 
	if Ret then
		for _,v in pairs(Ret) do
			Cnt = v.cnt
			ngx.say(Cnt)
			break
		end
	end

	if Cnt>0 then
		local Ret = RoleData:DelRole(tonumber(HostId), tonumber(UserId))
		ngx.say("OK")
		ngx.say("Update")
	end
end

DoRequest(true)
