----------------------------------------
--$Id: croservermgr.lua 70642 2015-06-11 08:55:51Z xiongyunkun $
----------------------------------------
--[[
-- 跨服管理
--
--]]

function CroServerList(self)
	CroServerInfo = ServerData:GetCroServer()
	--将涉及到的平台转换为平台名称
	local Platforms = PlatformData:GetPlatform()
	local PlatformMap = {}
	--构造map值
	for _, Platform in ipairs(Platforms) do
		PlatformMap[Platform.PlatformID] = Platform.PlatformName
	end
	--获得跨服服务名
	local ServiceList = ServerData:GetCroService()
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
				table.insert(PlatformNames,PlatformMap[Platform]) --有则使用平台名
			else
				table.insert(PlatformNames,Platform) -- 没有则使用平台编号
			end
		end
		local NameStr = table.concat(PlatformNames,",")
		CroServer.PlatformNames = NameStr	
	end
	Viewer:View("template/server/croserverlist.html")
end

function DoEdit(self)
	ID = tonumber(GetQueryArg("ID")) or ""
	local CroServerList = ServerData:GetCroServer()
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
	local ServiceList = ServerData:GetCroService()
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
	local CroServerList = ServerData:GetCroServer()
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

--获得服运营数据（7日留存、开服时间等信息）
function GetServerData(self)
	ID = GetQueryArg("id") or ""
	PlatformName = GetQueryArg("name") or ""
	ServerData = ServerData:GetServerData(ID)
	Viewer:View("template/server/serverdata.html")
end

function DeleteCroServer(self)
	local Args = GetPostArgs()
	local ID = Args.ID
	local Res,Err = ServerData:DeleteCroServer(ID)
	--TODO:还要删除跨服文件
	if Err then
		ngx.say("2")
	else
		ngx.say("1")
	end
end

function GenerateCroFile(self)
	local Now = ngx.time()
	local DefaultNum = 1000
	local Args = GetPostArgs()
	local PlatformIDs = Args.platformids or {}
	if type(PlatformIDs) == "string" then
		PlatformIDs = {PlatformIDs}
	end
	local NormalNum = tonumber(Args.normalNum) or 0
	local MinNum = tonumber(Args.minNum) or 0
	local Memo = Args.memo or ""
	local ServiceID = Args.serviceID or ""
	local Values = {
		["ID"] = Args.id or "",
		["Name"] = Args.name or "", 
		["Platforms"] = PlatformIDs,
		["NormalNum"] = NormalNum,
		["MinNum"] = MinNum,
		["Memo"] = Memo,
		["ServiceID"] = ServiceID,
	}
	--先把配置记录入库
	local CroID = ServerData:UpdateCroServer(Values)
	--把平台的服按照开服时间进行混合排序
	local TotalServers = {}
	for _, PlatformID in ipairs(PlatformIDs) do
		local Servers = ServerData:GetServerData(PlatformID)
		for _,Server in ipairs(Servers) do
			table.insert(TotalServers, Server)
		end
	end
	table.sort(TotalServers,function (A,B) return ((A.StartTime or Now) < (B.StartTime or Now)) and ((A.tagid or 0) < (B.tagid or 0)) end)	
	--再按照人数分战区
	Zones = {} --记录总战区
	local Zone = {} --记录各个分战区
	local Num = 0
	local LastTagId = -1
	for _, Server in ipairs(TotalServers) do
		-- 标签一致的才可以在同一战区
		if LastTagId == -1 then LastTagId = (Server.tagid or 0) end
		local CurTagId = (Server.tagid or 0)
		Num = Num + (Server.Avg7Num or DefaultNum) 
		if LastTagId == CurTagId then
			table.insert(Zone,Server)
			Zone.TagID = CurTagId
			if Num >= NormalNum then
				--战区已满，记录下该战区数据
				table.insert(Zones,Zone)
				Zone = {} --重新置为空，记录下一个战区
				Num = 0
			end
		else
			if #Zone > 0 then
				table.insert(Zones, Zone)
			end
			Zone = {}
			Num = 0
			Num = Num + (Server.Avg7Num or DefaultNum)
			table.insert(Zone, Server)
			Zone.TagID = CurTagId
		end
		LastTagId = CurTagId
	end
	--判断最后一个战区是否大于最小人数,如果大于则是一个独立战区，否则并入到前面一个战区去
	if Num >= MinNum then
		table.insert(Zones,Zone)
	else
		--否则并入到前面那个战区去
		local Size = #Zones
		local TZone = Zones[Size]
		local PreTagId = -1 
		if TZone and TZone[1] then
			PreTagId = (TZone.TagID or 0)
		end
		if PreTagId ~= LastTagId then
			-- 标签不一致的，不能合并
			table.insert(Zones, Zone)
		else
			for _, Server in ipairs(Zone) do
				table.insert(TZone,Server)
			end
		end
	end
	-- 划分目标服务器
	Zones = self:GetTargetServer(PlatformIDs,Zones)
	for ZoneID ,Zone in ipairs(Zones) do
		if (not Zone.TargetServer) then
			-- 必须有目标服
			ExtMsg = "没有目标服 "..Serialize(Zone)
			self:ShowCroZone(CroID, false)
			return
		end
		for _, Server in ipairs(Zone) do
			local Values = {
				['HostID'] = Server.hostid,
				['ServiceID'] = CroID,
				['RealServiceID'] = ServiceID, 
				['ZoneName'] = "战区"..ZoneID,
				['TargetServer'] = Zone.TargetServer
			}
			ServerData:UpdateCroZone(Values)
		end
	end
	self:ShowCroZone(CroID,true)
end

--根据平台和战区数量划分服务器
function GetTargetServer(self,PlatformIDs,Zones)
	-- 获得目标服务器
	local TServers = ServerData:GetTargetServer(PlatformIDs)
	if not TServers or #TServers == 0 then
		return Zones --如果为空直接返回
	end
	
	local ServerMap = {} -- 记录下每个平台下面的目标服
	local Indexs = {} -- 记录下当前分配目标服的索引号（轮询分配）
	local TServerMap = {} -- 目标服信息表
	for _, Server in ipairs(TServers) do
		if not ServerMap[Server.platformid] then
			ServerMap[Server.platformid] = {}
		end
		Indexs[Server.platformid] = Indexs[Server.platformid] or {}
		Indexs[Server.platformid][(Server.tagid or 0)] = 0 
		table.insert(ServerMap[Server.platformid],Server.hostid)
		TServerMap[Server.hostid] = Server
	end

	for _, Zone in ipairs(Zones) do
		--判断这个战区是哪个平台的服最多，从最多的服的平台中分配一个目标服给该战区
		local Platforms = {}
		for _, Server in ipairs(Zone) do
			if not Platforms[Server.platformid] then
				Platforms[Server.platformid] = 1
			else
				Platforms[Server.platformid] = Platforms[Server.platformid] + 1
			end
		end
		local NPlatforms = {}
		for ID, Num in pairs(Platforms) do
			table.insert(NPlatforms,{PlatformID = ID,Num = Num})
		end
		table.sort(NPlatforms,function (A,B) return (A.Num > B.Num) end)
		--按服数量从高到低依次获取
		local ServerID = nil
		for _, Platform in ipairs(NPlatforms) do
			local _TmpServers = ServerMap[Platform.PlatformID]
			local Servers = {}
			for _, HostId in ipairs(_TmpServers) do
				if TServerMap[HostId] and (TServerMap[HostId].tagid or 0) == Zone.TagID then
					table.insert(Servers, HostId)
				end
			end
			local Count = Indexs[Platform.PlatformID][Zone.TagID]
			if #Servers > 0 then
				local Index = Count % #Servers	
				ServerID = Servers[Index + 1]
				Indexs[Platform.PlatformID][Zone.TagID] = Count + 1
				break
			end			
		end
		Zone.TargetServer = ServerID
	end
	return Zones
end

-- 展示战区配置文件
function ShowCroZone(self, CroID, CanEdit)
	local CroInfos = ServerData:GetCroZone({["ServiceID"] = CroID})
	--整理成页面显示格式
	CroList = {}
	ZoneList = {}
	ServiceID = CroID
	for _, CroInfo in ipairs(CroInfos) do
		local ZoneName = CroInfo.ZoneName
		if not CroList[ZoneName] then
			CroList[ZoneName] = {}
			table.insert(ZoneList, ZoneName)
		end
		table.insert(CroList[ZoneName],CroInfo)
	end
	--获得所有可供选择的目标服
	TargetServers = ServerData:GetTargetServer()
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
	local Res,Err = ServerData:UpdateTargetServer(HostID, ZoneName, Server)
	if not Err then
		ngx.say("1")
	else
		ngx.say("2")
	end
end

function ExportZone(self)
	--获得跨服服务名列表
	local CroServerList = ServerData:GetCroServer()
	if #CroServerList == 0 then
		ngx.say("0")
		return 
	end
	--最终结果记录在这里面
	local TotalResults = {["HostCfg"] = {}}
	--先把服务器列表都获取出来
	local Servers = ServerData:GetAllServers()
	-- 构造serverMap
	local ServerMap = {}
	for _, Server in ipairs(Servers) do
		TotalResults["HostCfg"][Server.hostid] = {
			['CrossPort'] = tonumber(Server.crossport),
			['Ip'] = Server.address,
			['Name'] = Server.name,
			['NetPort'] = string.split(Server.ports),
			["Platform"] = Server.platformid,
		}
	end
	for _, CroServer in ipairs(CroServerList) do
		--获得跨服配置表
		local Service = ServerData:GetCroService(CroServer.ServiceID)
		if #Service ~= 0 then
			Service = Service[1]
			local ServiceName = Service.ServiceName
			TotalResults[ServiceName] = TotalResults[ServiceName] or {
				["Module"] = Service.Module,
				["NeedSelfGroup"] = Service.NeedSelfGroup and tonumber(Service.NeedSelfGroup),
				["SrcHosts"] = {},
				["DestHosts"] = {},
			}
			--获得战区配置
			local CroInfos = ServerData:GetCroZone({["ServiceID"] = CroServer.ID})
			--按照战区进行分类
			local ZoneData = {}
			for _, CroInfo in ipairs(CroInfos) do
				if not ZoneData[CroInfo.ZoneName] then
					ZoneData[CroInfo.ZoneName] = {["SrcHosts"] = {CroInfo.HostID},["DestHosts"] = CroInfo.TargetServer}
				else
					table.insert(ZoneData[CroInfo.ZoneName]["SrcHosts"], CroInfo.HostID)
				end
			end
			--再把战区的源服和目标服合并到导出结果中
			for _, ZoneInfo in pairs(ZoneData) do
				table.insert(TotalResults[ServiceName]["SrcHosts"], ZoneInfo["SrcHosts"])
				table.insert(TotalResults[ServiceName]["DestHosts"], ZoneInfo["DestHosts"])
			end
		end
	end
	local Str = "return " .. Serialize(TotalResults)
	--写文件
	local Writer = io.open(GetBasePath().."/../gservice/interfacedata/croserver/cross_server_cfg.lua","w")
	Writer:write(Str)
	Writer:flush()
	Writer:close()
	ngx.say("1")
end


function ZoneShow(self)
	local ID = tonumber(GetQueryArg("ID"))
	self:ShowCroZone(ID)
end

--跨服服务列表
function CroServiceShow(self, Msg)
	ServiceList = ServerData:GetCroService()
	ExtMsg = Msg
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
			['Memo'] = Args.Memo,
		}
		ServerData:UpdateCroService(Values)
		self:CroServiceShow()
		return
	end	
	Service = ServerData:GetCroService(ID)
	if #Service > 0 then
		Service = Service[1]
	end
	Viewer:View("template/server/croserviceedit.html")
end

-- 跨服服务删除
function CroServiceDelete(self)
	local Args = GetPostArgs() 
	local ID = Args.ID
	if ngx.var.request_method == "POST" then
		local Res, Err = ServerData:DeleteCroService(ID)
		if not Err then
			ngx.say("1")
		else
			ngx.say("0")
		end
	end
end

DoRequest()
