------------------------------------------
--$Id: serverdata.lua 18771 2014-09-27 12:21:22Z zork $
------------------------------------------

module(...,package.seeall)

-- 获得跨服信息表
function GetCroServer(self, ID, ServiceID)
	local Where = " Where Flag = 'true' "
	if ID and ID ~= "" then
		Where = Where .. " and ID = '"..ID.."'"
	end
	if ServiceID then
		Where = Where .. " and ServiceID = '" .. ServiceID .. "'"
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
		Sql = "update smcs.tblCroServiceInfo set Name = '"..Values.Name.."',Platforms = '"..Platforms.."',ServerNum='"..Values.ServerNum.."',Memo='"..Values.Memo.."',ServiceID='"..Values.ServiceID.."',Flag = 'true' where ID='"..Values.ID.."'"
		Res, Err = DB:ExeSql(Sql)
	else
		Sql = "insert into smcs.tblCroServiceInfo(Name,Platforms,ServerNum,Memo,ServiceID) values('"..Values.Name.."','"..Platforms.."','"..Values.ServerNum.."','"..Values.Memo.."','"..Values.ServiceID.."')"
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

function GetServerByHostID(self, HostID)
	local Sql = "select a.hostid,a.name,a.platformid, a.startservertime, b.tagid from smcs.servers a left join groupclassinfo b on a.hostid=b.svrid where a.hostid='".. HostID .."'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

--获得服运营数据（开服时间,合服等信息）
function GetServerData(self,PlatformID)
	--获得该平台下面的服列表
	local Sql = "select a.hostid,a.name,a.platformid, a.startservertime, b.tagid, a.m_startservertime, a.mergeto from smcs.servers a left join groupclassinfo b on a.hostid=b.svrid where a.platformid='"..PlatformID.."'"
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
	local Sql = "insert into smcs.tblCroZone(HostID,ServiceID,ZoneName,TargetServer,RealServiceID) values('"
			..Values.HostID.."','"..Values.ServiceID.."','"..Values.ZoneName.."','"..Values.TargetServer
			.."','"..Values.RealServiceID.."') on duplicate key update Flag = 'true',ServiceID = '"..Values.ServiceID
			.."',ZoneName = '"..Values.ZoneName.."',TargetServer='"..Values.TargetServer.."',Flag='true'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

-- 获取跨服战区配置表
function GetCroZoneInfo(self, Option)
	local Where = {" a.Flag = 'true' "}
	if Option.HostID then
		table.insert(Where," a.HostID = '"..Option.HostID.."' ")
	end
	if Option.ServiceID then
		table.insert(Where," a.ServiceID = '"..Option.ServiceID .. "' ")
	end
	local Sql = "select a.*, c.name,c.platformid,c.ports,c.crossport,"
				.."c.startservertime,d.tagid from smcs.tblCroZone a "
				.." left join smcs.servers c on a.HostID=c.hostid left join "
				.."smcs.groupclassinfo d on c.hostid=d.svrid where".. table.concat(Where, "and")
	local Res,Err = DB:ExeSql(Sql)
	if not Res or #Res == 0 then
		return {}
	end
	local PlatformIDs = {}
	for _, Info in ipairs(Res or {}) do
		PlatformIDs[Info.platformid] = true
	end
	--再获得服运营数据
	local ServerDatas = {}
	for PlatformID, _ in pairs(PlatformIDs) do
		local ServerData = self:GetServerData(PlatformID)
		for _, Info in ipairs(ServerData) do
			ServerDatas[Info.hostid] = Info
		end
	end
	return Res,Err
end

--查询获得tblCroZone表内容
function GetCroZone(self, Option)
	local Where = " where Flag = 'true' "
	if Option.HostID then
		Where = Where .. " and HostID = '"..Option.HostID.."' "
	end
	if Option.ServiceID then
		Where = Where .. " and ServiceID = '"..Option.ServiceID .. "' "
	end
	if Option.RealServiceID then
		Where = Where .. " and RealServiceID = '" .. Option.RealServiceID .. "'"
	end
	if Option.TargetServer then
		Where = Where .. " and TargetServer = '" .. Option.TargetServer .. "'"
	end
	local Sql = "select * from smcs.tblCroZone " .. Where
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end
-- 更新跨服目标服和战区
function UpdateTargetServer(self, HostID, ServiceID, ZoneName,TargetServer)
	local Sql = "update smcs.tblCroZone set TargetServer ='"..TargetServer.."', ZoneName ='"
		..ZoneName.."' where HostID = '" .. HostID .. "' and ServiceID = '" .. ServiceID .. "'"
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
		Sql = "update smcs.tblCroService set ServiceName = '"..Values.Name.."',NeedSelfGroup = '"
			..Values.NeedSelfGroup.."',Module = '"..Values.Module.."',Memo = '"..Values.Memo
			.."',BindCroZone = '"..Values.BindCroZone .."',StartServerDays = '"..Values.StartServerDays
			.."',ShareServiceID = '"..Values.ShareServiceID .."' where ID = '"..Values.ID.."'"
	else
		Sql = "insert into tblCroService(ServiceName,NeedSelfGroup,Module,Memo,BindCroZone,StartServerDays,ShareServiceID) values('"
			..Values.Name.."','"..Values.NeedSelfGroup.."','"..Values.Module.."','"..Values.Memo
			.. "','"..Values.BindCroZone .. "','"..Values.StartServerDays 
			.. "','"..Values.ShareServiceID .."')"
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

--删除跨服战区配置
function DeleteCroZone(self, CroID)
	local Sql = "update smcs.tblCroZone set Flag = 'false' where ServiceID = '" .. CroID .. "'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err
end

--删除跨服战区配置中的服
function DeleteCronZoneHost(self, ServiceID, HostID)
	local Sql = "update smcs.tblCroZone set Flag = 'false' where ServiceID = '" .. ServiceID
		.. "' and HostID = '" .. HostID .. "'"
	local Res,Err = DB:ExeSql(Sql)
	return Res,Err 
end



