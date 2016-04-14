----------------------------------------
--$Id: croservermgr.lua 108897 2016-03-12 08:25:32Z xiongyunkun $
----------------------------------------
--[[
-- 跨服管理
--
--]]

function CroServerList(self)
	CroServerInfo = CroServerData:GetCroServer()
	--将涉及到的平台转换为平台名称
	local Platforms = PlatformData:GetPlatform()
	local PlatformMap = {}
	--构造map值
	for _, Platform in ipairs(Platforms) do
		PlatformMap[Platform.PlatformID] = Platform.PlatformName
	end
	--获得跨服服务名
	local ServiceList = CroServerData:GetCroService()
	ServiceMap = {}
	for _, Service in ipairs(ServiceList) do
		ServiceMap[Service.ID] = Service.ServiceName
	end
	for _, CroServer in ipairs(CroServerInfo) do
		local Platforms = CroServer.Platforms
		Platforms = string.split(Platforms,",")
		local PlatformNames = {}
		for _, Platform in ipairs(Platforms) do
			if PlatformMap[Platform] then
				table.insert(PlatformNames,PlatformMap[Platform] or Platform)
			end
		end
		local NameStr = table.concat(PlatformNames,",")
		CroServer.PlatformNames = NameStr	
	end
	Viewer:View("template/server/croserverlist.html")
end

function DoEdit(self)
	ID = tonumber(GetQueryArg("ID")) or ""
	local CroServerList = CroServerData:GetCroServer()
	local Platforms = PlatformData:GetPlatform()
	PlatformMap = {}
	RestPlatforms = {}
	--构造map值
	for _, Platform in ipairs(Platforms) do
		PlatformMap[Platform.PlatformID] = Platform.PlatformName
	end
	--先找到该ID对应的跨服服务
	CroServerInfo = {}
	for _, CroServer in ipairs(CroServerList) do
		-- 找到当前编辑的跨服信息
		if CroServer.ID == ID then
			CroServerInfo = CroServer
			CroServerInfo.PlatformIDs = {}
			local Platforms = CroServerInfo.Platforms
			Platforms = string.split(Platforms,",")
			for _, Platform in ipairs(Platforms) do
				CroServerInfo.PlatformIDs[Platform] = true
				RestPlatforms[Platform] = PlatformMap[Platform]
			end
			break
		end
	end
	--过滤筛选出可供选择的平台
	local SelectedPlatforms = {}
	for _, CroServer in ipairs(CroServerList) do
		--凡是绑定了相同跨服服务的都不要
		local ServiceID = CroServer.ServiceID
		if CroServerInfo.ServiceID == ServiceID then
			local Platforms = CroServer.Platforms
			Platforms = string.split(Platforms,",")
			for _, Platform in ipairs(Platforms) do
				SelectedPlatforms[Platform] = true
			end
		end
	end
	for PlatformID, PlatformName in pairs(PlatformMap) do
		if not SelectedPlatforms[PlatformID] then
			RestPlatforms[PlatformID] = PlatformName
		end
	end
	-- 获得跨服服务列表
	local ServiceList = CroServerData:GetCroService()
	ServiceMap = {}
	for _, Service in ipairs(ServiceList) do
		ServiceMap[Service.ID] = Service.ServiceName
	end
	Viewer:View("template/server/croserveredit.html")
end

function GetPlatformList(self)
	local Platforms = PlatformData:GetPlatform()
	local PlatformMap = {}
	--构造map值
	for _, Platform in ipairs(Platforms) do
		PlatformMap[Platform.PlatformID] = Platform.PlatformName
	end
	local Args = GetPostArgs()
	local ServiceID = Args.serviceID
	local CroServerList = CroServerData:GetCroServer()
	--过滤筛选出可供选择的平台
	local SelectedPlatforms = {}
	local RestPlatforms = {}
	for _, CroServer in ipairs(CroServerList) do
		--凡是绑定了相同跨服服务的都不要
		if CroServer.ServiceID == tonumber(ServiceID) then
			local Platforms = CroServer.Platforms
			Platforms = string.split(Platforms,",")
			for _, Platform in ipairs(Platforms) do
				SelectedPlatforms[Platform] = true
			end
		end
	end
	for PlatformID, PlatformName in pairs(PlatformMap) do
		if not SelectedPlatforms[PlatformID] then
			RestPlatforms[PlatformID] = PlatformName
		end
	end
	local JsonStr = json.encode(RestPlatforms)
	ngx.say(JsonStr)
end

--获得服运营数据（7日平均在线、开服时间等信息）
function GetServerData(self)
	ID = GetQueryArg("id") or ""
	PlatformName = GetQueryArg("name") or ""
	ServerData = CroServerData:GetServerData(ID)
	Viewer:View("template/server/serverdata.html")
end

function DeleteCroServer(self)
	local Args = GetPostArgs()
	local ID = Args.ID
	local Res,Err = CroServerData:DeleteCroServer(ID)
	--TODO:还要删除跨服文件
	if Err then
		ngx.say("2")
	else
		ngx.say("1")
	end
end

function GenerateCroFile(self)
	local Args = GetPostArgs()
	local PlatformIDs = Args.platformids or {}
	if type(PlatformIDs) == "string" then
		PlatformIDs = {PlatformIDs}
	end
	local ServerNum = tonumber(Args.serverNum) or 1
	local Memo = Args.memo or ""
	local ServiceID = Args.serviceID or ""
	local Values = {
		["ID"] = Args.id or "",
		["Name"] = Args.name or "", 
		["Platforms"] = PlatformIDs,
		["ServerNum"] = ServerNum,
		["Memo"] = Memo,
		["ServiceID"] = ServiceID,
	}
	--先把配置记录入库
	local CroID = CroServerData:UpdateCroServer(Values)
	--再看看这个跨服服务是否是共享战区配置的
	local CroServiceInfo = CroServerData:GetCroService(ServiceID)
	if CroServiceInfo and CroServiceInfo[1] and CroServiceInfo[1].ShareServiceID ~= 0 then
		local Flag = self:ShareService(CroID, ServiceID, CroServiceInfo[1].ShareServiceID)
		if Flag then --直接复制了战区配置的这里就直接返回
			self:ShowCroZone(CroID)
			return 
		end
	end
	local IsBindCroZone = CroServiceInfo and CroServiceInfo[1] and CroServiceInfo[1].BindCroZone or 1
	local CroZoneList, TotalServerMap = self:DoGenerate(CroID, PlatformIDs, ServiceID, Values, IsBindCroZone)
	if not CroZoneList then
		--ExtMsg = "没有服或者跨服配置不正确"
		self:ShowCroZone(CroID)
		return
	end
	CroZoneList, MergeFlag = self:GetTargetServer(PlatformIDs, CroZoneList, IsBindCroZone, TotalServerMap) --指定目标服
	--ngx.say(Serialize(CroZoneList))
	self:UpdateCroZone(CroID, CroZoneList, Values)
	--还要更新与之共享战区的跨服服务
	self:UpdateRelatedShareService(ServiceID)
	if MergeFlag then
		ExtMsg = "目标服数量不足，战区内服务器数量超过限制!"
	end
	self:ShowCroZone(CroID,true, ExtMsg)
end

--生成跨服战区
function DoGenerate(self, CroID, PlatformIDs, ServiceID, Values, IsBindCroZone)
	--获得所选平台的服务器
	local CroService = CroServerData:GetCroService(ServiceID)
	if not CroService or not CroService[1] then
		return
	end
	CroService = CroService[1]
	local TotalServers = {}
	local TotalServerMap = {}
	local NowTime = os.time()
	for _, PlatformID in ipairs(PlatformIDs) do
		local Servers = CroServerData:GetServerData(PlatformID)
		for _,Server in ipairs(Servers) do
			--只对没有合服的服进行划分战区
			if Server.mergeto == 0 or Server.mergeto == Server.hostid then
				--先剔除掉开服时间不满足要求的服
				local StartServerTime = Server.m_startservertime
				StartServerTime = StartServerTime ~= "0000-00-00 00:00:00" and StartServerTime or Server.startservertime
				StartServerTime = GetTimeStamp(StartServerTime)

				if NowTime - StartServerTime >= CroService.StartServerDays * 86400 then
					TotalServers[Server.platformid] = TotalServers[Server.platformid] or {}
					table.insert(TotalServers[Server.platformid], Server)
					TotalServerMap[Server.hostid] = Server
				end
			end
		end
	end
	if table.size(TotalServers) == 0 then
		return
	end
	local CroZoneList = self:GenerateCroZone(Values, TotalServerMap)
	return CroZoneList, TotalServerMap
end

--生成战区
function GenerateCroZone(self, Values, TotalServerMap)
	local CroZoneList = {}
	--先把这些服按平台和标签排序
	local PlatformServers = {}
	for _, Server in pairs(TotalServerMap) do
		PlatformServers[Server.platformid] = PlatformServers[Server.platformid] or {}
		if Server.tagid then --有标签的才添加
			PlatformServers[Server.platformid][Server.tagid] = PlatformServers[Server.platformid][Server.tagid]  or {}
			table.insert(PlatformServers[Server.platformid][Server.tagid], Server)
		end
	end
	--按开服时间排序
	for PlatformID, PlatformInfo in pairs(PlatformServers) do
		for TagID, Servers in pairs(PlatformInfo) do
			table.sort( Servers, function(A, B)
				return GetTimeStamp(A.startservertime) < GetTimeStamp(B.startservertime)
			end )
		end
	end
	
	local Zone = {}
	local ZoneTag = nil --上一个战区的标签
	local ZonePlatformID = nil --上一个战区所在的平台
	for PlatformID, PlatformInfo in pairs(PlatformServers) do
		for TagID, Servers in pairs(PlatformInfo) do
			for _, Server in ipairs(Servers) do
				if ZonePlatformID == PlatformID and TagID == ZoneTag then
					if #Zone <= Values.ServerNum - 1 then
						--小于标准人数，加入该战区
						table.insert(Zone, {HostID = Server.hostid})
					else --大于标准人数了，应该独立一个战区
						table.insert(CroZoneList, Zone)
						Zone = {{HostID = Server.hostid}}
						ZoneTag = Server.tagid
						ZonePlatformID = Server.platformid
					end
				else --标签不一致
					if ZoneTag then --有服标签，战区里面有服
						table.insert(CroZoneList, Zone)
					end
					Zone = {{HostID = Server.hostid}}
					ZoneTag = Server.tagid
					ZonePlatformID = Server.platformid
				end
			end
		end
	end
	table.insert(CroZoneList, Zone) --添加最后的战区
	return CroZoneList
end

--将跨服配置记录入库
function UpdateCroZone(self, CroID, CroZoneList, Values)
	--将跨服分区记录入库
	--local MaxZoneID = self:GetMaxZoneID(CroID)
	CroServerData:DeleteCroZone(CroID) --先把之前的跨服战区配置删除
	for ZoneID ,Zone in ipairs(CroZoneList) do
		if (not Zone.TargetServer) then
			-- 必须有目标服
			ExtMsg = "没有目标服 "..Serialize(Zone)
			--self:ShowCroZone(CroID, false)
			--return
		else
		--ZoneID = MaxZoneID + ZoneID
			for _, Server in ipairs(Zone) do
				local Values = {
					['HostID'] = Server.HostID,
					['ServiceID'] = CroID,
					['RealServiceID'] = Values.ServiceID, 
					['ZoneName'] = ZoneID,
					['TargetServer'] = Zone.TargetServer
				}
				CroServerData:UpdateCroZone(Values)
			end
		end
	end
end

--共享战区，复制其共享跨服服务的所有战区配置
function ShareService(self, ServiceID, RealServiceID, ShareServiceID)
	--先判断共享战区的服务之前是否有生成过战区配置
	local CroZoneList = CroServerData:GetCroZone({RealServiceID = ShareServiceID,})
	if CroZoneList and #CroZoneList > 0 then
		for _, Info in ipairs(CroZoneList) do
			Info.RealServiceID = RealServiceID
			Info.ServiceID = ServiceID
			CroServerData:UpdateCroZone(Info)
		end
		return true
	else
		return false
	end
end

--更新绑定与ServiceID共享跨服服务的的跨服分区
function UpdateRelatedShareService(self, ServiceID)
	ServiceID = tonumber(ServiceID)
	local ServiceList = CroServerData:GetCroService()
	for _, Service in ipairs(ServiceList) do
		if Service.ShareServiceID == ServiceID then
			--更新这个服的跨服分区
			local CroServerList = CroServerData:GetCroServer(nil, Service.ID)
			for _, CroServer in ipairs(CroServerList) do
				self:ShareService(CroServer.ID, Service.ID, ServiceID)
			end
		end
	end
end

--根据平台和战区数量划分服务器
function GetTargetServer(self, PlatformIDs, Zones, IsBindCroZone, TotalServerMap)
	-- 获得目标服务器
	local THostIDs = self:GetCandidateTargetServer(PlatformIDs, Zones, IsBindCroZone, TotalServerMap)
	if #THostIDs == 0 then
		return Zones --如果为空直接返回
	end
	--ngx.say(Serialize(THostIDs))
	local ServerMap = {} -- 记录下每个平台下面的目标服
	local Indexs = {} -- 记录下当前分配目标服的索引号（轮询分配）
	local TServerMap = {} -- 目标服信息表
	for _, HostID in ipairs(THostIDs) do
		local Server = TotalServerMap[HostID]	 
		if Server then
			ServerMap[Server.platformid] = ServerMap[Server.platformid] or {}
			Indexs[Server.platformid] = Indexs[Server.platformid] or {}
			Indexs[Server.platformid][(Server.tagid or 0)] = (Indexs[Server.platformid][(Server.tagid or 0)] or 0) + 1
			if not TServerMap[Server.hostid] then --防止重复添加，因为指定目标服和划分目标服可能会有重复
				table.insert(ServerMap[Server.platformid],Server.hostid)
			end
			TServerMap[Server.hostid] = Server
		end
	end
	--ngx.say(Serialize(TotalServerMap))
	for _, Zone in ipairs(Zones) do
		--判断这个战区是哪个平台的服最多，从最多的服的平台中分配一个目标服给该战区
		local Platforms = {}
		--先判断各个战区是否已经有目标服了
		for _, HostInfo in ipairs(Zone) do
			--ngx.say(Serialize(TotalServerMap[HostInfo.HostID]))
			Zone.TagID = TotalServerMap[HostInfo.HostID].tagid
			Zone.PlatformID = TotalServerMap[HostInfo.HostID].platformid
			if HostInfo.TargetServer then
				Zone.TargetServer = HostInfo.TargetServer
				break
			end
		end
		for _, HostInfo in ipairs(Zone) do
			local Server = TotalServerMap[HostInfo.HostID]
			Platforms[Server.platformid] = (Platforms[Server.platformid] or 0) + 1
			--如果目标服在战区里面，则优先把目标服放入该战区
			if TServerMap[Server.hostid] and not Zone.TargetServer then
				Zone.TargetServer = Server.hostid
			end
		end
		--如果目标服没有在战区里面则从平台中的目标服选取一个
		if not Zone.TargetServer then
			local NPlatforms = {}
			for ID, Num in pairs(Platforms) do
				table.insert(NPlatforms,{PlatformID = ID,Num = Num})
			end
			table.sort(NPlatforms,function (A,B) return (A.Num > B.Num) end)
			local ServerID = nil
			local _TmpServers = ServerMap[Zone.PlatformID]
			
			if _TmpServers then
				local Servers = {}
				for _, HostId in ipairs(_TmpServers) do
					if TServerMap[HostId] and (TServerMap[HostId].tagid or 0) == Zone.TagID then
						table.insert(Servers, HostId)
					end
				end
				--ngx.say(Serialize(Servers))
				--ngx.say(Serialize(Zone))
				local Count = Indexs[Zone.PlatformID][Zone.TagID]
				if #Servers > 0 then
					--轮询获取
					local Index = Count % #Servers	
					ServerID = Servers[Index + 1]
					Indexs[Zone.PlatformID][Zone.TagID] = Count + 1
				end	
			end	
			Zone.TargetServer = ServerID
		end
	end
	--如果相同目标服的和需要合并战区
	Zones, MergeFlag = self:MergeTargetServer(Zones)
	return Zones, MergeFlag
end

--获得候选目标服列表
function GetCandidateTargetServer(self, PlatformIDs, Zones, IsBindCroZone, TotalServerMap)
	local THostIDs = {}
	if IsBindCroZone == 0 then --如果不需要制定目标分区的话，每个服都是目标服
		for _, Zone in ipairs(Zones) do
			for _, Server in ipairs(Zone) do
				table.insert(THostIDs, Server.HostID)
			end
		end
	else --否则只取跨服分区的服作为目标服
		local TServers = CroServerData:GetTargetServer(PlatformIDs)
		for _, Server in ipairs(TServers) do
			table.insert(THostIDs, Server.hostid)
			--目标服不能出现在战区里面
			for _, Zone in ipairs(Zones) do
				for Idx, HostInfo in ipairs(Zone) do
					if HostInfo.HostID == Server.hostid then
						table.remove(Zone, Idx)
						break
					end
				end
			end
			--如果没有的话另外添加
			if not TotalServerMap[Server.hostid] then 
				local TServer = CroServerData:GetServerByHostID(Server.hostid)
				if TServer and TServer[1] then 
					TotalServerMap[Server.hostid] = TServer[1]
				end
			end
		end
	end
	return THostIDs
end

--根据目标服合并战区
function MergeTargetServer(self, CroZoneList)
	local TargetServers = {}
	local MergeFlag = false
	local TargetServerMap = {}
	for _, Zone in ipairs(CroZoneList) do
		if Zone.TargetServer then
			TargetServers[Zone.TargetServer] = TargetServers[Zone.TargetServer] or {}
			for _, HostInfo in ipairs(Zone) do
				table.insert(TargetServers[Zone.TargetServer], HostInfo)
			end
			if TargetServerMap[Zone.TargetServer] then
				MergeFlag = true
			else
				TargetServerMap[Zone.TargetServer] = true
			end
		end
	end
	local NewCroZoneList = {}
	for TargetServer, HostInfos in pairs(TargetServers) do
		HostInfos.TargetServer = TargetServer
		table.insert(NewCroZoneList,HostInfos)
	end
	return NewCroZoneList, MergeFlag
end
-- 展示战区配置文件
function ShowCroZone(self, CroID, CanEdit, ExtMsg)
	local CroInfos = CroServerData:GetCroZoneInfo({["ServiceID"] = CroID})
	--整理成页面显示格式
	CroList = {}
	ZoneList = {}
	local HostIDMap = {}
	ServiceID = CroID
	for _, CroInfo in ipairs(CroInfos) do
		local ZoneName = CroInfo.ZoneName
		if not CroList[ZoneName] then
			CroList[ZoneName] = {}
			table.insert(ZoneList, ZoneName)
		end
		table.insert(CroList[ZoneName],CroInfo)
		HostIDMap[CroInfo.HostID] = true
	end
	ExtMsg = ExtMsg
	--获得所有可供选择的目标服
	TargetServers = CroServerData:GetTargetServer()
	--如果是不指定目标服的话则所有的源服都是目标服
	if CroInfos[1] and CroInfos[1].RealServiceID then
		local CroServicInfo = CroServerData:GetCroService(CroInfos[1].RealServiceID)
		if CroServicInfo and CroServicInfo[1] and CroServicInfo[1].BindCroZone == 0 then
			local AllServers = ServerData:GetAllServers()
			TargetServers = {}
			for _, Server in ipairs(AllServers) do
				if HostIDMap[Server.hostid] then
					table.insert(TargetServers, Server)
				end
			end
		end
	end
	-- 获得平台列表，构造平台键值对
	local Platforms = PlatformData:GetPlatform()
	PlatformMap = {}
	for _, Platform in ipairs(Platforms) do
		PlatformMap[Platform.PlatformID] = Platform.PlatformName
	end
	if CanEdit then
		Viewer:View("template/server/crozonelist.html")
	else
		Viewer:View("template/server/crozoneshow.html")
	end
end

-- 更新分区的目标服ID
function UpdateZone(self)
	local Args = GetPostArgs()
	local ZoneName = Args.zone
	local Server = Args.server
	local HostID = Args.hostID
	local ServiceID = Args.serviceid
	--判断有无战区的目标服与提交过来的目标服相同
	local TargetCroZones = CroServerData:GetCroZone({TargetServer = Server, ServiceID = ServiceID})
	if TargetCroZones and TargetCroZones[1] then
		ZoneName = TargetCroZones[1].ZoneName
	else
		--新生成一个战区名
		local MaxZoneID = self:GetMaxZoneID(ServiceID)
		ZoneName = (MaxZoneID + 1)
	end
	local Res,Err = CroServerData:UpdateTargetServer(HostID, ServiceID, ZoneName, Server)
	self:ShowCroZone(ServiceID, true)
end

--获得最大战区ID
function GetMaxZoneID(self, ServiceID)
	local CroZoneList = CroServerData:GetCroZone({ServiceID = ServiceID})
	local MaxZoneID = 1 --默认最大战区值
	local ZoneIDs = {}
	for _, Info in ipairs(CroZoneList or {}) do
		local ZoneName = Info.ZoneName
		local ZoneID = string.gsub(ZoneName, "战区", "")
		ZoneID = tonumber(ZoneID) or 0
		if ZoneID > MaxZoneID then
			MaxZoneID = ZoneID
		end
	end
	return MaxZoneID
end

--删除战区内的服
function DeleteServer(self)
	local Args = GetPostArgs()
	local HostID = Args.hostID
	local ServiceID = Args.serviceID
	CroServerData:DeleteCronZoneHost(ServiceID, HostID)
	ngx.say("1")
end

function ExportZone(self)
	CommonFunc.ExportCroZone()
	ngx.say("1")
end


function ZoneShow(self)
	local ID = tonumber(GetQueryArg("ID"))
	self:ShowCroZone(ID)
end

--跨服服务列表
function CroServiceShow(self, Msg)
	ServiceList = CroServerData:GetCroService()
	ExtMsg = Msg
	ServiceMap = {}
	for _, Info in ipairs(ServiceList) do
		ServiceMap[Info.ID] = Info.ServiceName 
	end
	Viewer:View("template/server/croserviceshow.html")
end
-- 跨服服务编辑
function CroServiceEdit(self)
	ID = GetQueryArg("ID") or ""
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local Values = {
			['ID'] = Args.ID,
			['Name'] = Args.Name,
			['NeedSelfGroup'] = Args.NeedSelfGroup or "1",
			['Module'] = Args.Module,
			['BindCroZone'] = Args.BindCroZone,
			['StartServerDays'] = Args.StartServerDays,
			['ShareServiceID'] = Args.ShareServiceID,
			['Memo'] = Args.Memo,
		}
		CroServerData:UpdateCroService(Values)
		self:CroServiceShow()
		return
	end	
	local ServiceList = CroServerData:GetCroService()
	Service = {}
	ServiceMap = {}
	for _, Info in ipairs(ServiceList) do
		if Info.ID == tonumber(ID) then
			Service = Info
		end
		ServiceMap[Info.ID] = Info.ServiceName
	end
	Viewer:View("template/server/croserviceedit.html")
end

-- 跨服服务删除
function CroServiceDelete(self)
	local Args = GetPostArgs() 
	local ID = Args.ID
	if ngx.var.request_method == "POST" then
		local Res, Err = CroServerData:DeleteCroService(ID)
		if not Err then
			ngx.say("1")
		else
			ngx.say("0")
		end
	end
end

function UpdateAllCroServer(self)
	local CroServerList = CroServerData:GetCroServer()
	local ExtMsgs = {}
	local Names = {}
	for _, CroServer in ipairs(CroServerList) do
		--再看看这个跨服服务是否是共享战区配置的
		local CroID = CroServer.ID
		table.insert(Names, CroServer.Name)
		local ServiceID = CroServer.ServiceID
		local CroServiceInfo = CroServerData:GetCroService(ServiceID)
		if CroServiceInfo and CroServiceInfo[1] and CroServiceInfo[1].ShareServiceID ~= 0 then
			self:ShareService(CroID, ServiceID, CroServiceInfo[1].ShareServiceID)
		else
			local IsBindCroZone = CroServiceInfo and CroServiceInfo[1] and CroServiceInfo[1].BindCroZone or 1
			local PlatformIDs = string.split(CroServer.Platforms, ",")
			local Values = {
				["ID"] = CroServer.ID,
				["Name"] = CroServer.Name, 
				["Platforms"] = PlatformIDs,
				["ServerNum"] = CroServer.ServerNum,
				["ServiceID"] = ServiceID,
			}
			local CroZoneList, TotalServerMap = self:DoGenerate(CroID, PlatformIDs, ServiceID, Values, IsBindCroZone)
			if CroZoneList then
				CroZoneList, MergeFlag = self:GetTargetServer(PlatformIDs, CroZoneList, IsBindCroZone, TotalServerMap) --指定目标服
				self:UpdateCroZone(CroID, CroZoneList, Values)
				--还要更新与之共享战区的跨服服务
				self:UpdateRelatedShareService(ServiceID)
				if MergeFlag then
					table.insert(ExtMsgs, CroServer.Name .."目标服数量不足，战区内服务器数量超过限制!")
				end
			end
		end
	end
	if #ExtMsgs == 0 then
		CommonFunc.ExportCroZone() --生成配置文件
		ngx.say(table.concat( Names, ",") .. " 生成成功!")
	else
		ngx.say(table.concat( ExtMsgs, ", "))
	end
end

DoRequest()
