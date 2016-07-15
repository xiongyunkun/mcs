function DoUpServStaus(self)
	--[[
	local St = GetQueryArg("status")
	local HostId = GetQueryArg("hostid")
	if not St then
		ngx.say("-1 StatusNull")
		return
	end

	if not HostId then
		ngx.say("-1 HostIdNull")
		return
	end
ngx.say(St)
ngx.say(HostId)
	local Ret = ServerData:GetData("servers", {["hostid"] = HostId})
	if #Ret == 0 then
		ngx.say(string.format("-1 没有host[%d]对应的服务器", HostId))
	end

	local Ret = ServerData:UpCol("servers",{["hostid"]=HostId},{["status"]=St})
	ngx.say(Ret)
	]]
end

function DoUploadServList(self)
	local ServListFile = io.open("/home/mcs/mcs/./gservice/serv_list.lua","r")
	local ServListStr = ServListFile:read("*a")
	ngx.say(ServListStr)
	ServListFile:close()
end

local SIGN = "AwCKRqWX"
-- 供发布服的发布脚本使用
function DoGetHostList(self)
	local Args = GetQueryArgs()
	--先验证参数
	if Args.sign ~= SIGN then
		ngx.print("auth_fail")
		return
	end
	local ServerList = ServerData:GetAllServers() 
	local ServerMap = {}
	for _, ServerInfo in pairs(ServerList) do
		ServerMap[ServerInfo.hostid] = ServerInfo
	end
	local TagId2Name = {}
	local TagInfos = ServerData:GetGroupClass()
	for _, TagInfo in pairs(TagInfos) do
		TagId2Name[TagInfo.id] = TagInfo.name
	end
	local TagList = ServerData:GetServerTagInfo()
	local OutTbl = {}
	for _, TagInfo in pairs(TagList) do
		if not OutTbl[TagInfo.tagid] then
			OutTbl[TagInfo.tagid] = {}
		end			
		local SvrInfo = ServerMap[TagInfo.svrid]
		if SvrInfo then
			table.insert(OutTbl[TagInfo.tagid],string.format("{'ip':'%s','name':'%s','hostid':%d}",SvrInfo.address,SvrInfo.name,SvrInfo.hostid))
		end
	end
	local OutTbl2 = {}
	for Tag, SvrList in pairs(OutTbl) do
		table.insert(OutTbl2,string.format("'%s':[\n%s\n]",TagId2Name[Tag],table.concat(SvrList,",\n")))
	end
	ngx.say(string.format("# -*- coding: utf8 -*-\nsynctaginfo={\n%s\n}",table.concat(OutTbl2,",\n")))		
end

-- 供客户端web服务提取服务器列表使用
function DoGetHostListPhp(self)
	local Args = GetQueryArgs()
	--先验证参数
	if Args.sign ~= SIGN then
		ngx.print("auth_fail")
		return
	end
	local ServerList = ServerData:GetAllServers() 
	local ServerMap = {}
	for _, ServerInfo in pairs(ServerList) do
		ServerMap[ServerInfo.hostid] = ServerInfo
	end
	local TagId2Info = {}
	local TagInfos = ServerData:GetGroupClass()
	for _, TagInfo in pairs(TagInfos) do
		TagId2Info[TagInfo.id] = (TagInfo.cdn or "")
	end
	local TagList = ServerData:GetServerTagInfo()
	local OutTbl = {}
	for _, TagInfo in pairs(TagList) do
		local SvrInfo = ServerMap[TagInfo.svrid]
		if SvrInfo then
			local TmpOutTbl = OutTbl[SvrInfo.platformid] or {}
			--如果已经合服的IP和port需要指向合服后的服务器地址
			local Address = SvrInfo.address
			local Port = SvrInfo.ports
			local CmcsIP = SvrInfo.cmcsip
			local CmcsPort = SvrInfo.cmcsport
			if SvrInfo.mergeto ~= 0 then
				local MergeServerInfo = ServerMap[SvrInfo.mergeto]
				if MergeServerInfo then
					Address = MergeServerInfo.address
					Port = MergeServerInfo.ports
					CmcsIP = MergeServerInfo.cmcsip
					CmcsPort = MergeServerInfo.cmcsport
				end
			end
			if CmcsIP and CmcsIP ~= "" then
				table.insert(TmpOutTbl,string.format("\"%s\":{\"ip\":\"%s\",\"port\":\"%s\",\"mapaddress\":\"%s\",\"mapport\":\"%s\",\"cdn\":\"%s\"}",
						SvrInfo.servmark,Address,Port,CmcsIP,CmcsPort,(TagId2Info[(TagInfo.tagid or "")] or "")))
			else
				table.insert(TmpOutTbl,string.format("\"%s\":{\"ip\":\"%s\",\"port\":\"%s\",\"cdn\":\"%s\"}",SvrInfo.servmark,Address,Port,(TagId2Info[(TagInfo.tagid or "")] or "")))
			end
			OutTbl[SvrInfo.platformid] = TmpOutTbl
		end
	end
	local FormatOut = {}
	for PlatformId, HostList in pairs(OutTbl) do
		table.insert(FormatOut, string.format("\"%s\":{\n%s\n}",PlatformId, table.concat(HostList,",\n")))
	end
	ngx.say(string.format("<?php\n$serverlist='{\n%s\n}';\n?>",table.concat(FormatOut,",\n")))		
end

function DoGetHostConfParam(self)
	local HostId = GetQueryArg("hostid")
	local ConfFile = io.open(GetBasePath().."/interfacedata/conf"..HostId..".conf","r")
	if not ConfFile then
		ngx.say("-1,not found")
		return
	end
	local ConfStr = ConfFile:read("*a")
	ConfFile:close()
	ngx.say(ConfStr)
end

-- 获得该服的配置文件
function DoGetCrossConf(self)
	local ConfFile = io.open(GetBasePath().."/interfacedata/croserver/cross_server_cfg.lua","r")
	if not ConfFile then
		ngx.say("-1,no file")
		return
	end
	local ConfStr = ConfFile:read("*a")
	ConfFile:close()
	ngx.say(ConfStr)
end

-- 更新服务器状态
function DoUpServStaus(self)
	local St = GetQueryArg("status")
	local HostId = GetQueryArg("hostid")
	if not St then
		ngx.say("-1 StatusNull")
		return
	end

	if not HostId then
		ngx.say("-1 HostIdNull")
		return
	end
	
	local Ret = ServerData:GetData("servers", {["hostid"] = HostId})
	if #Ret == 0 then
		ngx.say(string.format("-1 没有host[%d]对应的服务器", HostId))
	end

	local Ret = ServerData:UpCol("servers",{["hostid"]=HostId},{["status"]=St})
	ngx.say("ok")
end

--获得该服的玩家充值情况
local Key = "09psq0WfSfmxO8cX"
function GetHostPay(self)
	local PlatformID = GetQueryArg("pf")
	local HostIDs = GetQueryArg("hostids")
	local Time = GetQueryArg("time")
	local Sign = GetQueryArg("sign")
	--验证密钥
	if Sign ~= Key then
		ngx.print(-1) --验证失败
		return
	end
	if not HostIDs or HostIDs == ""  or not PlatformID or PlatformID == "" then
		ngx.print(-2) -- 服参数不对
		return
	end
	local Results = {}
	HostIDs = string.split(HostIDs, ",")
	local Res = UserPayStaticsData:Get(PlatformID, {HostIDs = HostIDs})
	for _, Info in ipairs(Res) do
		Results[Info.HostID] = Results[Info.HostID] or {}
		Results[Info.HostID][Info.Uid] = Info.TotalCashNum
	end
	ngx.print(Serialize(Results))
end

--更新合服配置缓存
function UpdateMergeHostMap(self)
	InitServerMergeMap()
end

--更新服务器配置
function UpdateServer(self)
	local Args = GetQueryArgs()
	local RequiredParams = {"hostid"}
	for _, Param in ipairs(RequiredParams) do
		if CommonFunc.IsStrEmpty(Args[Param]) then
			ngx.say("param err:" .. Param)
			return
		end
	end
	local CanUpdateParams = {"name", "address", "ports","servmark","startservertime",
		"cmcsip", "cmcsport"}
	local UpdateValues = {}
	for _, Param in ipairs(CanUpdateParams) do
		if Args[Param] then
			UpdateValues[Param] = Args[Param]
		end
	end
	local Condition = {hostid = Args.hostid}
	ServerData:UpCol("servers", Condition, UpdateValues)
	ngx.say("更新成功!")
end

function AddServer(self)
	local Args = GetQueryArgs()
	--先验证参数
	if Args.sign ~= SIGN then
		ngx.print("auth_fail")
		return
	end
	if CommonFunc.IsStrEmpty(Args["ports"]) and CommonFunc.IsStrEmpty(Args["crossport"]) then
		Args["ports"], Args["crossport"] = self:CreatePort(Args["address"])
	end
	--验证参数是否为空
	local RequiredParams = {"name","address","ports","version","hostid","status","servmark","platformid",
		"crossport","startservertime"}
	for _, Param in ipairs(RequiredParams) do
		if CommonFunc.IsStrEmpty(Args[Param]) then
			ngx.print("param err:" .. Param)
			return
		end
	end
	Args["mergeservertime"] = "1970-01-01 01:00:01"
	ServerData:AddServer(Args)
	self:UpdateServerConfFile(Args.hostid)
	self:ExportCroZone()
	self:NoticeYY(Args) --通知多玩独代平台
	ngx.print("ok")
end

function CreatePort(self, Address)
	if not Address then return end
	local Servers = ServerData:GetServer({["address"] = Address})
	-- 筛选出访问端口、redis端口、跨服端口的最大值
	local MaxServerPort = 1800; MaxCrossPort = 3000
	for _, Server in ipairs(Servers) do
		if Server.ports and tonumber(Server.ports) > MaxServerPort then
			MaxServerPort = tonumber(Server.ports)
		end
		if Server.crossport and tonumber(Server.crossport) > MaxCrossPort then
			MaxCrossPort = tonumber(Server.crossport)
		end
	end
	--生成端口号，访问端口步长为10，其他为1
	local ServerPort = (math.modf(MaxServerPort/10) + 1) * 10
	local CrossPort = MaxCrossPort + 1
	return ServerPort, CrossPort
end

function UpdateServerConfFile(self, svrid)
	local Servers = ServerData:GetAllServers()
	local ServerId = tonumber(svrid)
	for _, Server in pairs(Servers) do
		if ServerId == Server.hostid then
			local ConfTbl = {}
			table.insert(ConfTbl,"name="..Server.name)
			table.insert(ConfTbl,"hostid="..ServerId)
			table.insert(ConfTbl,"ip="..Server.address)
			table.insert(ConfTbl,"netdport="..string.gsub(Server.ports,"^(%d+).*","%1"))
			table.insert(ConfTbl,"newservertime="..GetTimeStamp(Server.startservertime))
			local MergeServerTime = math.max(GetTimeStamp(Server.mergeservertime), 0)
			MergeServerTime = MergeServerTime == 1 and 0 or MergeServerTime
			table.insert(ConfTbl,"mergeservertime="..MergeServerTime)
			table.insert(ConfTbl,"gsnum=".. Server.gsnum)
			local fo = io.open(GetBasePath().."/../gservice/interfacedata/conf"..ServerId..".conf","w")
			assert(fo,GetBasePath().."/../gservice/interfacedata/conf"..ServerId..".conf")
			fo:write(table.concat(ConfTbl,"\n"))
			fo:flush()
			fo:close()
			return
		end
	end		
end

--生成跨服文件 
function ExportCroZone()
	--获得跨服服务名列表
	local CroServerList = CroServerData:GetCroServer()
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
		local MapAddress = (not CommonFunc.IsStrEmpty(Server.cmcsip)) and Server.cmcsip or nil
		local MapPort = (not CommonFunc.IsStrEmpty(Server.cmcsport)) and Server.cmcsport or nil
		local ServerMark = (not CommonFunc.IsStrEmpty(Server.servmark)) and Server.servmark or nil
		local MergeTo = Server.mergeto ~= 0 and Server.mergeto or nil
		TotalResults["HostCfg"][Server.hostid] = {
			['CrossPort'] = tonumber(Server.crossport),
			['Ip'] = Server.address,
			['Name'] = Server.name,
			['NetPort'] = string.split(Server.ports),
			["Platform"] = Server.platformid,
			["MapAddress"] = MapAddress,
			["MapPort"] = MapPort,
			["ServerMark"] = ServerMark,
			["MergeTo"] = MergeTo,
		}
	end
	for _, CroServer in ipairs(CroServerList) do
		--获得跨服配置表
		local Service = CroServerData:GetCroService(CroServer.ServiceID)
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
			local CroInfos = CroServerData:GetCroZoneInfo({["ServiceID"] = CroServer.ID})
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
	local CroFilePath = "/../gservice/interfacedata/croserver/cross_server_cfg.lua"
	local Writer = io.open(GetBasePath().. CroFilePath,"w")
	Writer:write(Str)
	Writer:flush()
	Writer:close()
end

--更新服分组信息
function UpdateGroupInfo(self)
	local Args = GetQueryArgs()
	--先验证参数
	if Args.sign ~= SIGN then
		ngx.print("auth_fail")
		return
	end
	local RequiredParams = {"hostid", "groupid"}
	for _, Param in ipairs(RequiredParams) do
		if CommonFunc.IsStrEmpty(Args[Param]) then
			ngx.print("param err:" .. Param)
			return
		end
	end
	ServerData:AddServerToGroup(Args["hostid"], Args["groupid"])
	ngx.print("ok")
end

function UpdateServerTag(self)
	local Args = GetQueryArgs()
	--先验证参数
	if Args.sign ~= SIGN then
		ngx.print("auth_fail")
		return
	end
	local RequiredParams = {"hostid", "tagid"}
	for _, Param in ipairs(RequiredParams) do
		if CommonFunc.IsStrEmpty(Args[Param]) then
			ngx.print("param err:" .. Param)
			return
		end
	end
	ServerData:AddServer2Tag(Args["hostid"], Args["tagid"])
	ngx.print("ok")
end

--获得服务器配置相关信息
function GetServerInfo(self)
	local Args = GetQueryArgs()
	--先验证参数
	if Args.sign ~= SIGN then
		ngx.print("auth_fail")
		return
	end
	local HostID = Args.hostid
	if not HostID or HostID == "" then
		ngx.print("")
		return
	end
	local ServerInfo = ServerData:GetData("smcs.servers", {hostid=HostID})
	if ServerInfo and ServerInfo[1] then
		ngx.say(json.encode(ServerInfo[1]))
	else
		ngx.say("")  --返回为空
	end
end

--通知多玩独代平台开服信息
function NoticeYY(self, Results)
	local Url = "config.gop.yy.com/api/openservice/index.do"
	--获得OrderID
	local OrderRes = StartServerInfoData:Get({HostID = Results.hostid})
	if not OrderRes or #OrderRes == 0 then
		return --没有的话就不通知
	end
	local OrderID = OrderRes[1].OrderID
	local Data = {
		isCloud = 1,
		domain = Results.ip,
		cname = Results.ip,
		isUpdate = 0,
		outerSn = Results.hostid,
		slaveType = 1,
	}
	local Args = {
		order_id = OrderID,
		ip = "10.21.186.156", --数据库IP
		port = "3306",
		encoding = "UTF-8",
		data = json.encode(Data),
	}
	--生成Sign
	local Key = CommonFunc.GetInterfaceKey("dw", "start_server_key") --开服信息key
	local Sign = libtools.md5(Args.order_id .. Args.ip .. Args.port .. Args.data .. Key)
	Args.sign = Sign
	--发送数据
	ReqOutUrl(Url, Args)
end

--更新HostIP dict
function UpdateHostIPMap(self)
	InitHostIPMap()
end

DoRequest(true)
