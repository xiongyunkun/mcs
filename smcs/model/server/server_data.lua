------------------------------------------
--$Id: serverdata.lua 18771 2014-09-27 12:21:22Z zork $
------------------------------------------

module(...,package.seeall)

local AllServers = {}
function GetAllServers(self)
	local Sql = "select * from servers order by hostid"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--SvrCol = {"name","address","ports","descinfo"}
SvrCol = {"name","address","ports","descinfo","version","hostid","status","servmark","platformid",
	"crossport","startservertime","mergeservertime","cmcsip","cmcsport","gsnum", "cname"}
function AddServer(self, ServerInfo)
	local Sql = "insert into servers set "
	local SetTbl = {}
	for _, Col in pairs(SvrCol) do
		if ServerInfo[Col] then
			table.insert(SetTbl, Col.."='"..ServerInfo[Col].."'")
		end
	end
	Sql = Sql .. table.concat(SetTbl, ",")
	local Res, Err = DB:ExeSql(Sql)
	--判断是否需要更新platformid对应IP的数据库
	local HostIP = CommonFunc.GetHostIP(ServerInfo["platformid"])
	if HostIP and HostIP ~= "127.0.0.1" then
		Res, Err = DB:ExeSql(Sql, HostIP)
	end
	AllServers = {}
	return Res, Err
end

function DelServer(self, ServerId)
	local Sql = "select * from srvgroupinfo where serverid="..ServerId
	local Res, Err = DB:ExeSql(Sql)
	if Res and #Res > 0 then
		return false
	end
	Sql = "delete from servers where hostid="..ServerId
	Res, Err = DB:ExeSql(Sql)
	AllServers = {}
	return Res, Err
end

function ModifyServer(self, ServerId, ServerInfo)
	local SqlFrm = "update servers set %s where hostid="..ServerId
	local SetTbl = {}
	for _, Col in pairs(SvrCol) do
		if ServerInfo[Col] then
			table.insert(SetTbl, Col.."='"..ServerInfo[Col].."'")
		end
	end
	local Sql = string.format(SqlFrm, table.concat(SetTbl,","))	
	local Res, Err = DB:ExeSql(Sql)
	--判断是否需要更新platformid对应IP的数据库
	local HostIP = CommonFunc.GetHostIP(ServerInfo["platformid"])
	if HostIP and HostIP ~= "127.0.0.1" then
		Res, Err = DB:ExeSql(Sql, HostIP)
	end
	AllServers = {}
	return (Err == nil), Err
end

local AllGroups = {}
function GetAllGroups(self)
	if #AllGroups > 0 then
		return AllGroups
	end
	local Sql = "select * from servergroup order by weight"
	local Res, Err = DB:ExeSql(Sql)
	if Res then
		AllGroups = Res
	end
	return Res, Err
end

function GetAllServerGroupInfo(self, PlatformID)
	local Where = ""
	if PlatformID and PlatformID ~= "" then 
		Where = " and b.platformid = '"..PlatformID.."'"
	end

	local Sql = "select a.* from srvgroupinfo a, servers b where a.serverid = b.hostid "..Where.."order by weight"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end
--返回标签的所有服务器信息
function GetServerGroup(self, TagID)
	local Where = " "
	if TagID and TagID ~= "" then
		Where = Where .. " where tagid = '" .. TagID .. "'"
	end
	local Sql = "select * from groupclassinfo " .. Where
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function AddGroup(self, GroupName, Weight, Flag)
	local Sql = "insert into servergroup set name='"..GroupName.."',weight="..(Weight or 100) ..",flag=" .. (Flag or 2)
	local Res, Err = DB:ExeSql(Sql)
	AllGroups = {}
	return Res, Err
end

function ModifyGroup(self, GroupId, GroupName, Weight, Flag)
	local Sql = "update servergroup set name='"..GroupName.."',weight="..(Weight or 100) .. ",flag=" .. Flag .. " where id="..GroupId

	local Res, Err = DB:ExeSql(Sql)
	AllGroups = {}
	return Res, Sql--true, Err
end

function DelGroup(self, GroupId)
	local Sql = "select * from srvgroupinfo where groupid="..GroupId
	local Res, Err = DB:ExeSql(Sql)
	if Res and #Res > 0 then
		return false
	end
	Sql = "delete from servergroup where id="..GroupId
	Res, Err = DB:ExeSql(Sql)
	AllGroups = {}
	return true, Err
end

function AddServerToGroup(self, ServerId, GroupId, Weight)
	local Sql = "insert into srvgroupinfo set serverid="..ServerId..",groupid="..GroupId..",weight="..(Weight or 100)
	local Res, Err = DB:ExeSql(Sql)
	AllServerGroupInfo = {}
	--判断是否需要更新该服所在平台对应IP数据库
	local PSql = "select a.hostid, a.platformid, b.IP from servers a, tblPlatform b "
		.. "where a.platformid = b.PlatformID and a.hostid = '" .. ServerId .. "'"
	local PRes = DB:ExeSql(PSql)
	if PRes and PRes[1] then
		local IP = PRes[1].IP
		if IP ~= "127.0.0.1" then
			DB:ExeSql(Sql, IP)
		end
	end
	return (Err == nil), Err
end

function ModifyServerGroupInfo(self, ServerId, GroupId, Weight)
	local Sql = "update srvgroupinfo set weight="..(Weight or 100).." where serverid="..ServerId.." and groupid="..GroupId
	local Res, Err = DB:ExeSql(Sql)
	AllServerGroupInfo = {}
	--判断是否需要更新该服所在平台对应IP数据库
	local PSql = "select a.hostid, a.platformid, b.IP from servers a, tblPlatform b "
		.. "where a.platformid = b.PlatformID and a.hostid = '" .. ServerId .. "'"
	local PRes = DB:ExeSql(PSql)
	if PRes and PRes[1] then
		local IP = PRes[1].IP
		if IP ~= "127.0.0.1" then
			DB:ExeSql(Sql, IP)
		end
	end
	return (Err == nil), Err
end

function DelServerFromGroup(self, ServerId, GroupId)
	local Sql = "delete from srvgroupinfo where serverid="..ServerId.." and groupid="..GroupId
	local Res, Err = DB:ExeSql(Sql)
	AllServerGroupInfo = {}
	--判断是否需要更新该服所在平台对应IP数据库
	local PSql = "select a.hostid, a.platformid, b.IP from servers a, tblPlatform b "
		.. "where a.platformid = b.PlatformID and a.hostid = '" .. ServerId .. "'"
	local PRes = DB:ExeSql(PSql)
	if PRes and PRes[1] then
		local IP = PRes[1].IP
		if IP ~= "127.0.0.1" then
			DB:ExeSql(Sql, IP)
		end
	end
	return (Err == nil), Err
end

function GetServList(self, PlatformID)
	local Where = ""
	if PlatformID and PlatformID ~= "" then
		Where = " and s1.platformid = '"..PlatformID.."' "
	end
	local Sql = "select s1.hostid,s1.name,s1.address addr,s1.ports,s1.version,s1.status,s2.groupid from servers s1,srvgroupinfo s2 where s1.hostid=s2.serverid "..Where.." order by s1.hostid"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

function GetGroupClass(self)
	local Sql = "select * from groupclass "

	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function AddGrpCls(self, Args)
	if not Args.name then
		return nil, "姓名不能为空"
	end

	local Sql = "insert into groupclass set name='" .. Args.name .. "', descinfo='" .. (Args.descinfo or "") .. "'"
	local Res,Err = DB:ExeSql(Sql)
	return (Res==nil), Err
end

function ModGrpCls(self, Args)
	local Sql = "update groupclass set name='"..Args.name.."',descinfo='"..(Args.descinfo or "")
		.."',clienturl='"..(Args.clienturl or "") .."',cdn='"..(Args.cdn or "")
		.."' where id="..Args.id
	local Res, Err = DB:ExeSql(Sql)
	return (Res==nil),Err
end

function DelGrpClsById(self, Id)
	if Id then
		local Sql = "delete from groupclass where id = "..Id
		return DB:ExeSql(Sql)
	end
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

--获得服所在的分类标签信息
function GetHostTagInfo(self, HostID)
	local Sql = "select a.* from groupclass a, groupclassinfo b where a.id = b.tagid and b.svrid = '" .. HostID .. "'"
	local Res,Err = DB:ExeSql(Sql)
	return Res, Err
end


function DelServerFromTag(self,SvrId,TagId)
	local Sql = "delete from groupclassinfo where svrid="..SvrId.." and tagid="..TagId
	local Res,Err = DB:ExeSql(Sql)
	return Res, Err
end

function AddServer2Tag(self, SvrId, TagId)
	local Sql = "insert into groupclassinfo set svrid="..SvrId..",tagid="..TagId
	local Res,Err = DB:ExeSql(Sql)
	return Res, Err
end

-- 库表，条件（[字段]=值）
function GetData(self, TbName, Condition)
	local Sql = "select * from " .. TbName .. " where 1=1 "
	for Col,Value in pairs(Condition) do
		Sql = Sql .. " and " .. Col .. " = " .. Value
	end

	return DB:ExeSql(Sql)
end

function GetServListInfo(self, PlatformID)
	local ServList = {AreaInfo={}, ServList={}}
	local AllGrp = ServerData:GetAllGroups()
	local ServGrps = ServerData:GetServList(PlatformID)
	for _,Grp in ipairs(AllGrp) do
		-- 不用显示隐藏分区,3为隐藏
		if Grp.flag ~= 3 then
			ServList.AreaInfo[Grp.id] = ServList.AreaInfo[Grp.id] or {}
			for Key,Value in pairs(Grp) do
				if Key~="id" then
					ServList.AreaInfo[Grp.id][Key] = Value
				end
			end
		end
	end

	for _,Server in ipairs(ServGrps) do
		ServList.ServList[Server.hostid] = ServList.ServList[Server.hostid] or {}
		for name,value in pairs(Server) do
			if name~="hostid" then
				if name~="groupid" then
					ServList.ServList[Server.hostid][name] = value		
				else
					ServList.ServList[Server.hostid][name] = ServList.ServList[Server.hostid][name] or {}
					table.insert(ServList.ServList[Server.hostid][name], value)
				end
			end
		end
	end
	return ServList
end

-- 根据筛选条件获得服务器
function GetServer(self,Options)
	local Where = " where 1 = 1 "
	for Key,Value in pairs(Options) do
		if Value ~= "" then
			if Key == "min_start_server_time" then
				Where = Where .. " and startservertime >= '" ..Value .. "'"
			elseif Key == "max_start_server_time" then
				Where = Where .. " and startservertime <= '" .. Value .. "'"
			else
				Where = Where .. " and " .. Key .. " = '" .. Value .. "' "
			end
		end
	end
	local Sql = "select * from servers " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 返回服与平台的对应的关系
function GetServerPlatformMap(self, IsLocal)
	local Servers = self:GetAllServers()
	local ServerMap = {}
	for _, Server in ipairs(Servers) do
		if IsLocal then
			local HostIP = CommonFunc.GetHostIP(Server.platformid)
			if HostIP == "127.0.0.1" then
				ServerMap[Server.hostid] = Server.platformid
			end
		else
			ServerMap[Server.hostid] = Server.platformid
		end
	end
	return ServerMap
end

--获取统计标签的服
function GetStaticsServers(self, IsLocal)
	local ServerPlatformMap = self:GetServerPlatformMap(IsLocal)
	--获得统计标签的服
	local Sql = "select a.serverid as HostID from smcs.srvgroupinfo a, smcs.servergroup b where a.groupid = b.id and b.name = '统计专区'"
	local Res, Err = DB:ExeSql(Sql)
	local ServerMap = {}
	if Res then
		for _, ServerInfo in ipairs(Res) do
			if ServerPlatformMap[ServerInfo.HostID] then
				local HostID = CommonFunc.GetToHostID(ServerInfo.HostID) --合服转换
				ServerMap[HostID] = ServerPlatformMap[HostID]
			end
		end
	end
	return ServerMap
end

--获得所需查找的服列表(针对除去某些服和包含某些服的情况)
function GetServerList(self, ServerType, HostIDs, PlatformID)
	local ServerPlatformMap = self:GetServerPlatformMap()
	local HostIDList = {}
	if tonumber(ServerType) == 1 then --只包含下面这些服
		for HostID, TPlatformID in pairs(ServerPlatformMap) do
			if PlatformID and PlatformID == TPlatformID then
				HostID = tostring(HostID)
				if type(HostIDs) == "table" then
					--选择全部（HostIDs为空数组）的也全部选择上
					if table.member_key(HostIDs, HostID) or #HostIDs == 0 then
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
	else --除这些服之外
		for HostID, TPlatformID in pairs(ServerPlatformMap) do
			HostID = tostring(HostID)
			if PlatformID and PlatformID == TPlatformID then
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
		end
	end
	return HostIDList
end

--根据开服时间获得开服数
function GetServersByServerTime(self, Options)
	local Where = " where 1=1 "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and platformid = '" .. Options.PlatformID .. "'"
	else
		local Platforms = CommonFunc.GetPlatformList()
		local PlatformIDs = {}
		for PlatformID, PlatformName in pairs(Platforms) do
			table.insert(PlatformIDs, PlatformID)
		end
		Where = Where .. " and platformid in ('" ..table.concat( PlatformIDs, "','") .. "')"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and startservertime >= '" .. Options.StartTime .." 00:00:00'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and startservertime <= '" .. Options.EndTime .." 23:59:59'"
	end
	local Sql = "select * from smcs.servers " .. Where
	local Res, Err = DB:ExeSql(Sql)
	local Results = {}
	return Res
end

 --获得合服目标服列表（包含合服目标服和未合服的服务器列表）
function GetMergedServers(self, Options)
	if not Options.PlatformID or Options.PlatformID == "" then
		return {} --没有选择平台就直接返回
	end
	local Servers = self:GetServer(Options)
	local NewServers = {}
	for _, Server in ipairs(Servers) do
		if Server.mergeto and Server.mergeto ~= 0 then
			if Server.hostid == Server.mergeto then --自身合并
				NewServers[Server.hostid] = Server.name
			else
				NewServers[Server.mergeto] = NewServers[Server.mergeto] or "" --如果没有就设定为空
			end
		else
			NewServers[Server.hostid] = Server.name
		end
	end
	return NewServers
end

--更新Servers表中的mergeto字段
function UpdateMergeTo(self, HostID, MergeTo)
	local Sql = "update smcs.servers set mergeto = '" .. MergeTo 
		.. "' where hostid = '" .. HostID .. "' or mergeto = '" .. HostID .. "'"
	DB:ExeSql(Sql)
	local NowTime = os.time()
	local MinStartServerTime = NowTime
	--再把所有合服目标服为MergeTo的服找出来
	Sql = "select * from smcs.servers where mergeto = '" .. MergeTo .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if Res and Res[1] then
		for _, Info in ipairs(Res) do
			local StartServerTime = GetTimeStamp(Info.startservertime)
			if MinStartServerTime > StartServerTime then
				MinStartServerTime = StartServerTime
			end
			--更新合服缓存配置
			CommonFunc.SetToHostID(Info.hostid, Info.mergeto)
		end
		if MinStartServerTime < NowTime then
			--更新合服后开服时间
			local UpdateSql = "update smcs.servers set m_startservertime = '" .. os.date("%Y-%m-%d %H:%M:%S", MinStartServerTime)
				.. "' where hostid = '" .. MergeTo .. "'"
			DB:ExeSql(UpdateSql)
		end
	end
	return true
end

--更新Servers表中相关的服对应的目标服
function UpdateRelatedMerge(self, HostIDs, MergeTo)
	Sql = "update smcs.servers set mergeto = '" .. MergeTo
		.. "' where hostid in ('" .. table.concat( HostIDs, "','") .. "')"
	local Res, Err = DB:ExeSql(Sql)
	--更新缓存配置
	for _, HostID in ipairs(HostIDs) do
		CommonFunc.SetToHostID(tonumber(HostID), tonumber(MergeTo))
	end
	return Res
end

