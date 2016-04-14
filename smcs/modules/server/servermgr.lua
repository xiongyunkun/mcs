----------------------------------------
--$Id: servermgr.lua 111809 2016-03-31 11:40:48Z xiongyunkun $
----------------------------------------
--[[
-- server list manager
--
--]]
local MsgList = {
[1] = "服务器地址已经在[%s]中使用",
[2] = "服务器名字重复",
[3] = "参数不对",
[4] = "服务器[%d]在分区[%s]中",
[5] = "分区中还有服务器",
[6] = "没有服务器列表数据",
[7] = "服务器列表文件生成成功",
[8] = "服务器列表文件生成失败",
[9] = "请先选择服务器，再进行服务器列表文件的生成",
[10] = "服ID不满足平台服ID范围配置",
}
--1-良好、2-繁忙、3-爆满、0-维护
Status = {
	[0] = "维护",
	[1] = "预开",
	[2] = "良好", 
	[3] = "繁忙",
	[4] = "爆满",
	[5] = "异常",
}

function ReqServerList(self, Msg)
	Options = GetQueryArgs()
	local NewOptions = {
		["platformid"] = Options.PlatformID,
		["hostid"] = Options.HostID,
		["min_start_server_time"] = Options.StartTime,
		["max_start_server_time"] = Options.EndTime,
	}
	ServerInfoList = ServerData:GetServer(NewOptions)
	local NowTime = os.time()
	Options.StartTime = Options.StartTime or ""
	Options.EndTime = Options.EndTime or ""
	
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss",["Label"] = "起始开服时间",},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss", ["Label"] = "截止开服时间",},
		{["Type"] = "Export",},
	}
	
	ServerMap = {}
	for _, Server in ipairs(ServerInfoList) do
		ServerMap[Server.hostid] = Server.name
	end
	if Options.Submit == "导出" then
		local Titles = {"区服代号","域名","RS IP:PORT","类型","备注"}
		local TableData = {}
		for _, Server in ipairs(ServerInfoList) do
			local Data1 = {}
			table.insert(Data1, Server.name)
			table.insert(Data1, Server.cmcsip or "")
			table.insert(Data1, Server.address .. ":" .. Server.ports)
			table.insert(Data1, "tcp")
			table.insert(Data1, Server.name)
			local Data2 = {}
			table.insert(Data2, Server.name)
			table.insert(Data2, Server.cmcsip or "")
			table.insert(Data2, Server.address .. ":7633")
			table.insert(Data2, "http")
			table.insert(Data2, Server.name)
			table.insert(TableData, Data1)
			table.insert(TableData, Data2)
		end
		local ExcelStr = CommonFunc.ExportExcel("服务器列表.xls", Titles, TableData)
		ngx.say(ExcelStr)
		return
	end
	ExtMsg = Msg
	Viewer:View("template/server/serverlist.html")
end

function DoAddServer(self)
	local Args = GetPostArgs()
	local Servers = ServerData:GetAllServers()
	-- 不允许为空的字段
	local SvrCol = {"hostid","name","address","ports","version","crossport","startservertime","gsnum"}
	for _, ArgName in ipairs(SvrCol) do
		if not Args[ArgName] or Args[ArgName] == "" then
			self:ReqServerList(MsgList[3])
			return
		end
	end
	for _, Server in pairs(Servers) do
		if Server.name == Args.name then
			self:ReqServerList(MsgList[2])
			return
		end
		--[[
		if Server.address == Args.address then
			self:ReqServerList(string.format(MsgList[1],Server.name))	
			return
		end
		]]
	end
	local CheckFlag = CheckServerID(Args.platformid,Args.hostid)
	if not CheckFlag then
		self:ReqServerList(MsgList[10])
		return
	end
	local Ret, Err = ServerData:AddServer(Args)
	self:UpdateServerConfFile(Args.hostid)
	CommonFunc.ExportCroZone() --生成跨服文件
	--self:NoticeYY(Args)
	self:ReqServerList(Err)
end

function DoModifyServer(self)
	local Args = GetPostArgs()
	local Servers = ServerData:GetAllServers()
	local ServerId = tonumber(Args.svrid)
	for _, Server in pairs(Servers) do
		if ServerId ~= Server.hostid then
			if Server.name == Args.name then
				self:ReqServerList(MsgList[2])
				return
			end
			--[[
			if Server.address == Args.address then
				self:ReqServerList(string.format(MsgList[1],Server.name))	
				return
			end		
			]]
		end
	end
	local CheckFlag = CheckServerID(Args.platformid,ServerId)
	if not CheckFlag then
		self:ReqServerList(MsgList[10])
		return
	end
	local Ret, Err = ServerData:ModifyServer(ServerId, Args)
	self:UpdateServerConfFile(ServerId)
	CommonFunc.ExportCroZone() --生成跨服文件
	--判断是否是更新还是第一次推送
	local IsUpdate = false --默认不是更新
	for _, Server in pairs(Servers) do
		if Server.hostid == ServerId then
			if Server.address and Server.address ~= "" then
				IsUpdate = true
			end
		end
	end
	self:NoticeYY(Args, IsUpdate)
	self:ReqServerList(Err)
end

--判断服ID是否符合平台属性中服ID设置
function CheckServerID(PlatformID,ServerID)
	local PlatformList = PlatformData:GetPlatform()
	for _, Platform in ipairs(PlatformList) do
		if Platform.PlatformID == PlatformID then
			local IDRange = Platform.ServerIDRange
			local Pos = string.find(IDRange,",")
			if Pos then
				local Start = string.sub(IDRange,0,Pos-1)
				local End = string.sub(IDRange,Pos+1)
				Start = tonumber(Start)
				End = tonumber(End)
				local ServerID = tonumber(ServerID)
				if ServerID >= Start and ServerID <= End then
					return true
				else
					return false
				end
			end
		end
	end
	return false
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

function DoDelServer(self)
	local SvrId = tonumber(GetQueryArg("svrid"))
	local Groups = ServerData:GetAllGroups()
	local GroupInfos = ServerData:GetAllServerGroupInfo()
	local GroupMap = {}
	for _, Group in pairs(Groups) do
		GroupMap[Group.id] = Group
	end
	local NameTbl = {}
	for _, GroupInfo in pairs(GroupInfos) do
		if GroupInfo.serverid == SvrId then
			table.insert(NameTbl, GroupMap[GroupInfo.groupid].name or "未知")
		end
	end
	if #NameTbl > 0 then
		local Str = table.concat(NameTbl,", ")
		self:ReqServerList(string.format(MsgList[4],SvrId,Str))
		return
	end
	local Ret, Err = ServerData:DelServer(SvrId)
	self:ReqServerList(Err)
end

-- Server Group Manage
function ReqGroupList(self, Msg)
	Groups = ServerData:GetAllGroups()
	ExtMsg = Msg
	Viewer:View("template/server/grouplist.html")
end

function DoAddGroup(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		if not Args.name or Args.name == "" then
			self:ReqGroupList(MsgList[3])
			return
		end
		if Args.weight and Args.weight == "" then
			Args.weight = 100
		end
		local Ret, Err = ServerData:AddGroup(Args.name, Args.weight, Args.flag)
		self:ReqGroupList(Err)
	else
		Viewer:View("template/server/addgroup.html")
	end
end

function DoModifyGroup(self)
	local Args = GetPostArgs()
	ngx.say(Serialize(Args))
	if not Args.gid or Args.gid == "" then
		self:ReqGroupList(MsgList[3])
		return
	end
	if not Args.name or Args.name == "" then
		self:ReqGroupList(MsgList[3])
		return
	end
	if Args.weight and Args.weight == "" then
		Args.weight = 100
	end
ngx.say(Args.flag)
	local Ret,Err = ServerData:ModifyGroup(Args.gid, Args.name, Args.weight, Args.flag)
	ngx.say(Err or "===")
	ngx.say(Ret)
	self:ReqGroupList(Err)
end

function DoDelGroup(self)
	local Gid = tonumber(GetQueryArg("gid"))
	local GroupInfos = ServerData:GetAllServerGroupInfo()
	for _, GroupInfo in pairs(GroupInfos) do
		if GroupInfo.groupid == Gid then
			self:ReqGroupList(MsgList[5])
			return
		end
	end
	local Ret, Err = ServerData:DelGroup(Gid)
	self:ReqGroupList(Err)
end

-- Server Group Info Manage
function ReqServerGroupInfo(self, Msg)
	PlatformID = GetQueryArg("platformid") or "" 
	Groups = ServerData:GetAllGroups()
	GroupMap = {}
	for _, Group in pairs(Groups) do
		GroupMap[Group.id] = Group
	end
	local GroupInfos = ServerData:GetAllServerGroupInfo(PlatformID)
	InGroupServers = {}
	GroupServers = {}
	for _, Group in pairs(GroupInfos) do
		if not InGroupServers[Group.serverid] then
			InGroupServers[Group.serverid] = {}
		end
		table.insert(InGroupServers[Group.serverid],Group.groupid)
		if not GroupServers[Group.groupid] then
			GroupServers[Group.groupid] = {}
		end
		table.insert(GroupServers[Group.groupid], Group.serverid)
	end
	Servers = ServerData:GetAllServers()
	--过滤筛选平台
	if PlatformID and PlatformID ~= "" then
		local NewServers = {}
		for _, Server in ipairs(Servers) do
			if Server.platformid == PlatformID then
				table.insert(NewServers,Server)
			end
		end
		Servers = NewServers
	end
	ServerMap = {}
	NoGroupServers = {}
	for _, Server in pairs(Servers) do
		ServerMap[Server.hostid] = Server
		if not InGroupServers[Server.hostid] then
			table.insert(NoGroupServers, Server.hostid)
		end
	end
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {} 
	for _, Platform in ipairs(PlatformList) do 
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end

	ExtMsg = Msg
	Viewer:View("template/server/servergroupmgr.html")
end

-- Remove from old group and add to new group
function DoModifyServerGroupInfo(self)
	local GetMod = GetQueryArg("mod")
	local Args
	if GetMod and GetMod == "get" then
		Args = ngx.req.get_uri_args()
	else
		Args = GetPostArgs()
	end
	local TargetGroup = tonumber(Args.gid)	
	local NeedAddServers = {}
	for ArgName, Val in pairs(Args) do
		local Gid = string.match(ArgName, "^cb_(.-)$")
		if Gid then
			Gid = tonumber(Gid)
			local SvrId = tonumber(Val)
			NeedAddServers[SvrId] = true
			if Gid ~= -1 and Gid ~= TargetGroup then
				local Ret, Err = ServerData:DelServerFromGroup(SvrId, Gid)
				if Err then
					self:ReqServerGroupInfo(Err)
					return
				end
			end
		end
	end
	if TargetGroup ~= -1 then
		local GroupInfos = ServerData:GetAllServerGroupInfo()
		local GroupServers = {}
		local MaxWeight = 0
		for _, GroupInfo in ipairs(GroupInfos) do
			if GroupInfo.groupid == TargetGroup then
				GroupServers[GroupInfo.serverid] = true
				MaxWeight = GroupInfo.weight
			end
		end
		for SvrId, _ in pairs(NeedAddServers) do
			if not GroupServers[SvrId] then
				MaxWeight = MaxWeight + 1
				local Ret, Err = ServerData:AddServerToGroup(SvrId, TargetGroup, MaxWeight)
				if Err then
					self:ReqServerGroupInfo(Err)
					return
				end
			end
		end
	end
	self:ReqServerGroupInfo()
end

function DoModifyServerIndex(self)
	local Gid = tonumber(GetQueryArg("gid"))
	local SvrId = tonumber(GetQueryArg("svrid"))
	local Direction = GetQueryArg("dir")
	local GroupInfos = ServerData:GetAllServerGroupInfo()
	local SelfGroupInfos = {}
	local CurIdx = 0
	for _, Group in ipairs(GroupInfos) do
		if Gid == Group.groupid then
			table.insert(SelfGroupInfos, Group)
			if Group.serverid == SvrId then
				CurIdx = #SelfGroupInfos 
			end
		end
	end
	if CurIdx > 0 then
		local ChangeIdx = (Direction == "up") and CurIdx-1 or CurIdx+1
		if ChangeIdx > 0 then
			local ChangeInfo = SelfGroupInfos[ChangeIdx]
			local SelfWeight = SelfGroupInfos[CurIdx].weight
			if ChangeInfo then
				ServerData:ModifyServerGroupInfo(SvrId, Gid, ChangeInfo.weight)
				ServerData:ModifyServerGroupInfo(ChangeInfo.serverid, Gid, SelfWeight)
			end
		end
	end
	self:ReqServerGroupInfo()
end


function PreViewServList(self, Msg)
	PlatformID = GetQueryArg("platformid")
	ServList = ServerData:GetServListInfo(PlatformID)
	Viewer:View("template/server/servergrplist.html")
end

function CreateServList(self)
	local Args = GetPostArgs()
	PlatformID = Args.platformid
	local FileName = ""
	if not PlatformID or PlatformID == "" then
		FileName = "all.conf"
	else
		FileName = PlatformID..".conf"
	end
	ServList = ServerData:GetServListInfo(PlatformID)
	local ServListStr = "return " .. Serialize(ServList)
	local Args = GetPostArgs() 
	--将配置写入文件
	local Writer = io.open(GetBasePath().."/../gservice/interfacedata/servergroup/"..FileName,"w")
	assert(Writer,"/../gservice/interfacedata/servergroup/"..FileName)
	Writer:write(ServListStr)
	Writer:flush()
	Writer:close()
	Servers = ServerData:GetAllServers()
	Viewer:View("template/server/servergrplist.html")
end

function DoShowServlist(self)
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {}
	for _, Platform in ipairs(PlatformList) do
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	Viewer:View("template/server/addserver.html")
end

function DoShowGrpClsList(self)
	GroupClass = ServerData:GetGroupClass()
	Viewer:View("template/server/grpclslist.html")
end

function DoShowAddGrpCls(self)
	Viewer:View("template/server/addgrpcls.html")
end

function DoModGrpCls(self)
	local Args = GetPostArgs()
	ServerData:ModGrpCls(Args)
	self:DoShowGrpClsList()
end

function DoAddGrpCls(self)
	local Args = GetPostArgs()

	ServerData:AddGrpCls(Args)
	self:DoShowGrpClsList()
end

function DoDelGrpCls(self)
	local id = tonumber(GetQueryArg("id"))
	ServerData:DelGrpClsById(id)
	self:DoShowGrpClsList()
end

-- Server Tag manage
function ShowSvrTagList(self)
	PlatformID = GetQueryArg("platformid")
	TagList = ServerData:GetGroupClass()
	local Servers = ServerData:GetAllServers()
	--过滤筛选平台
	if PlatformID and PlatformID ~= "" then
		local NewServers = {}
		for _, Server in ipairs(Servers) do
			if Server.platformid == PlatformID then
				table.insert(NewServers,Server)
			end
		end
		Servers = NewServers
	end
	ServerInTag = ServerData:GetServerTagInfo(PlatformID)
	local InTagServerMap = {}
	TagServers = {}
	for _, SvrInTag in pairs(ServerInTag) do
		InTagServerMap[SvrInTag.svrid] = SvrInTag.tagid
		if not TagServers[SvrInTag.tagid] then
			TagServers[SvrInTag.tagid] = {}
		end
		table.insert(TagServers[SvrInTag.tagid], SvrInTag.svrid)
	end
	ServerMap = {}
	NoTagServers = {}
	for _, Server in pairs(Servers) do
		ServerMap[Server.hostid] = Server
		if not InTagServerMap[Server.hostid] then
			table.insert(NoTagServers,Server)
		end		
	end
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {} 
	for _, Platform in ipairs(PlatformList) do 
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	Viewer:View("template/server/tagserverlist.html")
end

function ModSvr2Tag(self)
	local GetMod = GetQueryArg("mod")
	local Args
	if GetMod and GetMod == "get" then
		Args = ngx.req.get_uri_args()
	else
		Args = GetPostArgs()
	end
	local NeedAddServers = {}
	local TargetTagId = tonumber(Args.tagid)
	for ArgName, Val in pairs(Args) do
		local TagId = string.match(ArgName,"^cb_(.-)_.+$")
		if TagId then
			TagId = tonumber(TagId)
			local SvrId = tonumber(Val)
			NeedAddServers[SvrId] = true
			if TagId ~= -1 and TagId ~= TargetTagId then
				local Ret, Err = ServerData:DelServerFromTag(SvrId, TagId)
				if Err then
					self:ShowSvrTagList(Err)
					return
				end
			end	
		end 
	end
	if TargetTagId ~= -1 then
		local ServerInTag = ServerData:GetServerTagInfo()
		local InTagServerMap = {}
		for _, SvrInTag in pairs(ServerInTag) do
			InTagServerMap[SvrInTag.svrid] = SvrInTag.tagid
		end

		for SvrId, _ in pairs(NeedAddServers) do
			if not InTagServerMap[SvrId] then
				InTagServerMap[SvrId] = TargetTagId
				local Ret, Err = ServerData:AddServer2Tag(SvrId, TargetTagId)
				if Err then
					self:ShowSvrTagList(Err)
					return
				end
			end				
		end
	end
	self:ShowSvrTagList()
end

function CreatePort(self)
	local Args = GetPostArgs()
	local Address = Args.address
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
	--以逗号分隔
	ngx.say(tostring(ServerPort)..","..tostring(CrossPort))
end

--更新gservice 服务器ip白名单
local IPFile = "/../gservice/custom_conf/ip.conf"
local ShellPath = "/../gservice/gservice.sh"
function UpdateIPList(self)
	local Servers = ServerData:GetAllServers()
	local IPList = {}
	for _, Server in ipairs(Servers) do
		IPList[Server.address] = true
	end
	local IPStr = ""
	local Format = "allow %s; \r\n"
	for IP , _ in pairs(IPList) do
		IPStr = IPStr .. string.format(Format, IP)
	end
	-- 再加上deny all
	IPStr = IPStr .. "deny all;"
	local Cf, Err = io.open(GetBasePath()..IPFile, "w+")
	if not Cf then
		ngx.say(Err)
		return
	end
	Cf:write(IPStr)
	Cf:flush()
	Cf:close()
	--测试配置文件的正确性
	local Flag = os.execute(GetBasePath()..ShellPath.." test")
	if Flag == 0 then
		Flag = os.execute(GetBasePath()..ShellPath.." reload")
		ngx.say(Flag)
		return
	end
	ngx.say(1)
end

--通知多玩独代平台开服信息
function NoticeYY(self, Results, IsUpdate)
	local Url = "http://config.gop.yy.com/api/openservice/index.do"
	--获得OrderID
	local OrderRes = StartServerInfoData:Get({HostID = Results.hostid or Results.svrid})
	if not OrderRes or #OrderRes == 0 then
		return --没有的话就不通知
	end
	local OrderID = OrderRes[1].OrderID
	local Data = {
		isCloud = 1,
		domain = Results.cmcsip,
		cname = Results.cname,
		isUpdate = IsUpdate and 1 or 0,
		outerSn = Results.hostid or Results.svrid,
		slaveType = 1,
	}
	local Args = {
		order_id = OrderID,
		ip = "mysql2.zszs.game.yy.com", --数据库IP
		port = "10093",
		encoding = "UTF-8",
		data = json.encode(Data),
	}
	--生成Sign
	local Key = CommonFunc.GetInterfaceKey("dw", "start_server_key") --开服信息key
	local Sign = ngx.md5(Args.order_id .. Args.ip .. Args.port .. Args.data .. Key)
	Args.sign = Sign
	--发送数据
	local Flag, Res = ReqOutUrl(Url, Args)
	ngx.say(Res)
end

DoRequest()
