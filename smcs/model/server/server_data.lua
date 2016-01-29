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
SvrCol = {"name","address","ports","descinfo","version","hostid","status","crossport","startservertime","mergeservertime","priority","tips"}
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
	return (Err == nil), Err
end

function ModifyServerGroupInfo(self, ServerId, GroupId, Weight)
	local Sql = "update srvgroupinfo set weight="..(Weight or 100).." where serverid="..ServerId.." and groupid="..GroupId
	local Res, Err = DB:ExeSql(Sql)
	AllServerGroupInfo = {}
	return (Err == nil), Err
end

function DelServerFromGroup(self, ServerId, GroupId)
	local Sql = "delete from srvgroupinfo where serverid="..ServerId.." and groupid="..GroupId
	local Res, Err = DB:ExeSql(Sql)
	AllServerGroupInfo = {}
	return (Err == nil), Err
end

function GetServerSelectCode(self, ArgName, CurSvrId)
	local Servers = self:GetAllServers()
	local OpFormat = "<option value='%d' %s>%s</option>\n"
	local OpTbl = {}
	for _, Svr in ipairs(Servers) do
		table.insert(OpTbl, string.format(OpFormat,Svr.hostid, ((CurSvrId or -1)==Svr.hostid and "selected" or ""),Svr.name))
	end
	local RetStr = "<select name='"..ArgName.."'>\n"..table.concat(OpTbl,"").."</select>"
	return RetStr
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
		.."',clienturl='"..(Args.clienturl or "") .."' where id="..Args.id
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

------------------------------------------
-- 服务器SDK列表
function GetServerSDKInfo(self, FileName, PlatformID)
	local Where = ""
	
	if FileName and FileName ~= "" then
		Where = " and a.sdkname = '" .. FileName .. "'"
	end
	if PlatformID and PlatformID ~= "" then
		Where = " and b.platformid = '" .. PlatformID .. "'"
	end

	local Sql = "select a.* from srvsdkinfo a, servers b where a.serverid = b.hostid " .. Where
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

-- 服务器SDK列表
function GetServerSDKInfoById(self, ServerId)
	local Sql = "select * from srvsdkinfo Where serverid = " .. ServerId
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function DelServerFromSDK(self, SvrId, FileName)
	local Sql = "delete from srvsdkinfo where serverid=" .. SvrId .. " and sdkname='" .. FileName .. "'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function AddServer2SDK(self, SvrId, FileName)
	local Sql = "insert into srvsdkinfo set serverid=" .. SvrId .. ",sdkname='" .. FileName .. "'"
	
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function GetEnvUrl2SDK(self, FileName)
	local Where = " where 1=1 "
	if FileName and FileName ~= "" then
		Where = Where .. " and sdkname = '" .. FileName .. "'"
	end
	local Sql = "select * from sdkurlinfo " .. Where
	
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function AddEnvUrl2SDK(self, FileName, EnvList)
--	local Str = "asseturl='" .. EnvList.asseturl .. "',fileurl='" .. EnvList.fileurl .."',serverlisturl='" .. EnvList.serverlisturl .. "',broadcasturl='" .. EnvList.broadcasturl .. "'"
	
	local Str = "envname='" .. EnvList.envname .. "'"

	local Sql = "insert into sdkurlinfo set sdkname='" .. FileName .. "'," .. Str .. " on duplicate key update " .. Str 
	
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

------------------------------------------



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
		Where = Where .. " and " .. Key .. " = '" .. Value .. "' "
	end
	local Sql = "select * from servers " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 获得跨服信息表
function GetCroServer(self, ID)
	local Where = " Where Flag = 'true' "
	if ID and ID ~= "" then
		Where = Where .. " and ID = '"..ID.."'"
	end
	local Sql = "select * from smcs.tblCroServiceInfo ".. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 更新跨服数据表
function UpdateCroServer(self,Values)
	DB:ExeSql("delete a from tblCroZone a left join servers b on a.HostID = b.hostid where b.hostid is NULL")
	local Platforms = table.concat(Values.Platforms,",")
	local Sql = ""
	local Res,Err
	local ID = Values.ID
	if Values.ID and Values.ID ~= "" then
		Sql = "update smcs.tblCroServiceInfo set Name = '"..Values.Name.."',Platforms = '"..Platforms.."',MinNum='"..Values.MinNum.."',NormalNum='"..Values.NormalNum.."',Memo='"..Values.Memo.."',ServiceID='"..Values.ServiceID.."',Flag = 'true' where ID='"..Values.ID.."'"
		Res, Err = DB:ExeSql(Sql)
	else
		Sql = "insert into smcs.tblCroServiceInfo(Name,Platforms,MinNum,NormalNum,Memo,ServiceID) values('"..Values.Name.."','"..Platforms.."','"..Values.MinNum.."','"..Values.NormalNum.."','"..Values.Memo.."','"..Values.ServiceID.."')"
		Res, Err = DB:ExeSql(Sql)
		--这里获得最大的ID为当前的ID，暂时不用考虑多线程的情况
		local GetSql = "select max(ID) as MaxID from smcs.tblCroServiceInfo where Flag = 'true'"
		Res, Err = DB:ExeSql(GetSql)
		if Res then
			ID = Res[1].MaxID
		end
	end
	return ID
end

--删除跨服配置
function DeleteCroServer(self,ID)
	local Sql = "update smcs.tblCroServiceInfo set Flag = 'false' where ID = '"..ID.."'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

--获得服运营数据（7日留存、开服时间等信息）
function GetServerData(self,PlatformID)
	local Sql = "select a.hostid,a.name,a.platformid,c.tagid,b.* from smcs.servers a left join smcs.tblServerData b on a.hostid=b.HostID left join groupclassinfo c on a.hostid=c.svrid where a.platformid='"..PlatformID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

--获得跨服专区的服务器列表
function GetTargetServer(self,PlatformIDs)
	local Where = ""
	if PlatformIDs and type(PlatformIDs) == "table" then
		local PlatformStr = table.concat(PlatformIDs,"','")
		Where = Where .. "and a.platformid in ('"..PlatformStr.."')"
	end
	local Sql = "select a.*, c.tagid from smcs.servers a left join smcs.srvgroupinfo b on a.hostid=b.serverid left join smcs.groupclassinfo c on a.hostid=c.svrid where b.groupid = '5' " .. Where
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

-- 更新跨服战区配置表
function UpdateCroZone(self,Values)
	local Sql = "insert into smcs.tblCroZone(HostID,ServiceID,ZoneName,TargetServer,RealServiceID) values('"..Values.HostID.."','"..Values.ServiceID.."','"..Values.ZoneName.."','"..Values.TargetServer.."','"..Values.RealServiceID.."') on duplicate key update ServiceID = '"..Values.ServiceID.."',ZoneName = '"..Values.ZoneName.."',TargetServer='"..Values.TargetServer.."',Flag='true'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

-- 获取跨服战区配置表
function GetCroZone(self,Option)
	local Where = {}
	if Option.HostID then
		table.insert(Where," a.HostID = '"..Option.HostID.."' ")
	end
	if Option.ServiceID then
		table.insert(Where," a.ServiceID = '"..Option.ServiceID .. "' ")
	end
	local Sql = "select a.*, b.StartTime,b.Avg7Num,c.name,c.platformid,c.ports,c.crossport,d.tagid from smcs.tblCroZone a left join smcs.tblServerData b on a.HostID=b.HostID left join smcs.servers c on a.HostID=c.hostid left join smcs.groupclassinfo d on c.hostid=d.svrid where".. table.concat(Where, "and")
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end
-- 更新跨服目标服和战区
function UpdateTargetServer(self, HostID, ZoneName,TargetServer)
	local Sql = "update smcs.tblCroZone set TargetServer ='"..TargetServer.."', ZoneName ='"..ZoneName.."' where HostID = '" .. HostID .. "'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

-- 获得跨服服务
function GetCroService(self,ID)
	local Where = " where Flag = 'true'"
	if ID then
		Where = Where .. " and ID = '"..ID.."'"
	end
	local Sql = "select * from smcs.tblCroService ".. Where
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end
--更新跨服服务
function UpdateCroService(self,Values)
	local Sql = ""
	if Values.ID and Values.ID ~= "" then
		Sql = "update smcs.tblCroService set ServiceName = '"..Values.Name.."',NeedSelfGroup = '"..Values.NeedSelfGroup.."',Module = '"..Values.Module.."',Memo = '"..Values.Memo.."' where ID = '"..Values.ID.."'"
	else
		Sql = "insert into tblCroService(ServiceName,NeedSelfGroup,Module,Memo) values('"..Values.Name.."','"..Values.NeedSelfGroup.."','"..Values.Module.."','"..Values.Memo.."')"
	end
	local Res,Err = DB:ExeSql(Sql)
	return Res, Err
end
--删除跨服服务
function DeleteCroService(self,ID)
	local Sql = "update smcs.tblCroService set Flag = 'false' where ID = '"..ID.."'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

-- 更新文件名
function UpdateFileName(self, ID, FileName)
	local Sql = "update smcs.tblCroServiceInfo set FileName ='"..FileName.."' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

-- 返回服与平台的对应的关系
function GetServerPlatformMap(self)
	local Servers = MixServerData:Get({})
	local ServerMap = {}
	for _, Server in ipairs(Servers) do
		ServerMap[Server.HostID] = Server.PlatformID
	end
	return ServerMap
end

--获取统计标签的服
function GetStaticsServers(self)
	local Sql = "select a.serverid as HostID from smcs.srvgroupinfo a, smcs.servergroup b where a.groupid = b.id and b.name = '统计专区'"
	local Res, Err = DB:ExeSql(Sql)
	local ServerMap = {}
	if Res then
		for _, ServerInfo in ipairs(Res) do
			ServerMap[ServerInfo.HostID] = true
		end
	end
	return ServerMap
end

--获得所需查找的服列表(针对除去某些服和包含某些服的情况)
function GetServerList(self, ServerType, HostIDs, PlatformID)
	local ServerPlatformMap = self:GetServerPlatformMap()
	local HostIDList = {}
	if tonumber(ServerType) ~= 1 then --除这些服之外
		for HostID, TPlatformID in pairs(ServerPlatformMap) do
			if PlatformID and PlatformID == TPlatformID then
				if type(HostIDs) == "table" then
					if not table.member_key(HostIDs, HostID) then
						table.insert(HostIDList, HostID)
					end
				elseif type(HostIDs) == "string" then
					if tostring(HostID) ~= HostIDs then
						table.insert(HostIDList, HostID)
					end
				end
			end
		end
	else --只包含下面这些服
		for HostID, TPlatformID in pairs(ServerPlatformMap) do
			if PlatformID and PlatformID == TPlatformID then
				if type(HostIDs) == "table" then
					if table.member_key(HostIDs, HostID) then
						table.insert(HostIDList, HostID)
					end
				elseif type(HostIDs) == "string" then
					if tostring(HostID) == HostIDs then
						table.insert(HostIDList, HostID)
						break
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
