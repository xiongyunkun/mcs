------------------------------------------
--$Id: serverdata.lua 45634 2015-02-11 06:15:24Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE IF NOT EXISTS servers (
	id int(8) AUTO_INCREMENT KEY,
	name varchar(20),
	address varchar(20),
	ports varchar(32),
	descinfo varchar(120)
) CHARACTER SET gbk;

CREATE TABLE IF NOT EXISTS servergroup (
	id int(8) AUTO_INCREMENT KEY,
	name varchar(20),
	weight int(8)
) CHARACTER SET gbk;

CREATE TABLE IF NOT EXISTS srvgroupinfo (
	serverid int(8),
	groupid int(8),
	weight int(8),
	INDEX (serverid, groupid)
) CHARACTER SET gbk;

server data operator
--]]
module(...,package.seeall)

function GetAllServers(self, PlatformID)
	local Where = " where 1=1 "
	if PlatformID and PlatformID ~= "" then
		Where = Where .. " and platformid = '" .. PlatformID .. "'"
	end
	local Sql = "select * from servers ".. Where .." order by hostid"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--根据ServerID获得HostID
function GetHostID(self, PlatformID, ServerID)
	local HostID = nil
	local AllServers = self:GetAllServers(PlatformID)
	for _, Server in ipairs(AllServers) do
		if Server.servmark == ServerID then
			HostID = Server.hostid
			break
		end
	end
	return HostID
end

-- 获得该服务器的配置文件
function GetHostPlatform(self,HostID)
	local Confs = {}
	-- 先获得平台ID
	local Sql = "select platformid from smcs.servers where hostid = '"..HostID.."'"
	local Res,Err = DB:ExeSql(Sql)
	if not Res or #Res == 0 then return end
	local PlatformID = nil
	PlatformID = Res[1].platformid
	if not PlatformID or PlatformID == "" then return end
	return PlatformID
end

-- 返回服与平台的对应的关系
function GetServerPlatformMap(self)
	local Servers = self:GetAllServers()
	local ServerMap = {}
	for _, Server in ipairs(Servers) do
		ServerMap[Server.hostid] = Server.platformid
	end
	return ServerMap
end

--获得所需查找的服列表(针对除去某些服和包含某些服的情况)
function GetServerList(self, ServerType, HostIDs)
	local ServerPlatformMap = self:GetServerPlatformMap()
	local HostIDList = {}
	if tonumber(ServerType) == 1 then --除这些服之外
		for HostID, PlatformID in pairs(ServerPlatformMap) do
			if type(HostIDs) == "table" then
				if not table.member_key(HostIDs, HostID) then
					table.insert(HostIDList, HostID)
				end
			elseif type(HostIDs) == "string" then
				if HostID ~= HostIDs then
					table.insert(HostIDList, HostID)
				end
			end
		end
	else --只包含下面这些服
		for HostID, PlatformID in pairs(ServerPlatformMap) do
			if type(HostIDs) == "table" then
				if table.member_key(HostIDs, HostID) then
					table.insert(HostIDList, HostID)
				end
			elseif type(HostIDs) == "string" then
				if HostID == HostIDs then
					table.insert(HostIDList, HostID)
					break
				end
			end
		end
	end
	return HostIDList
end

-- 库表，条件（[字段]=值），值（[字段]=值）
function UpCol(self, TbName, Condition, SetVal)
	if not Condition then
		ngx.say("-1 条件不能为空")
		return
	end

	if not SetVal then
		ngx.say("-1 字段值不能为空")
		return
	end

	local Sql = "update " .. TbName .. " set " 
	local Set = ""
	for Col, Value in pairs(SetVal) do
		if Set~="" then
			Set = Set .. ","
		end
		Set = Set .. Col .. "=" .. Value 
	end

	Sql = Sql .. Set .. " where 1=1 "
	for Col,Value in pairs(Condition) do
		Sql = Sql .. " and " .. Col .. "=" .. Value
	end

	if not Set then
		ngx.say("没有条件")
		return
	end
	if TbName=="servers" then
		AllServers = {}
	end
	return DB:ExeSql(Sql)
end

-- 库表，条件（[字段]=值）
function GetData(self, TbName, Condition)
	local Sql = "select * from " .. TbName .. " where 1=1 "
	for Col,Value in pairs(Condition) do
		Sql = Sql .. " and " .. Col .. " = " .. Value
	end

	return DB:ExeSql(Sql)
end

function GetServerTagInfo(self,PlatformID)
	local Where = ""
	if PlatformID and PlatformID ~= "" then
		Where = " and b.platformid = '"..PlatformID.."'"
	end
	local Sql = "select a.* from groupclassinfo a, servers b where a.svrid = b.hostid ".. Where
	local Res,Err = DB:ExeSql(Sql)
	return Res, Err
end

function GetGroupClass(self)
	local Sql = "select g1.id, g1.name, g1.descinfo from groupclass g1 where 1=1 "

	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

--获得服相关信息
function GetServerInfo(self, PlatformID, HostID)
	local ServerInfo = {}
	local AllServers = self:GetAllServers(PlatformID)
	for _, Server in ipairs(AllServers) do
		if Server.hostid == HostID then
			ServerInfo = Server
			break
		end
	end
	return ServerInfo
end



