---------------------------------------
-- $Id:
---------------------------------------

function ReqServerListInfo(self, Msg, ExtOptions )
	Options = GetQueryArgs()

	if ExtOptions then
		Options = ExtOptions
	end
	
	PlatformID = Options.platformid
	Servers = MixServerData:Get({})
	LeftServers = MixServerData:Get({})
	--过滤筛选平台
	if PlatformID and PlatformID ~= "" then
		local NewServers = {}
		for _, Server in ipairs(LeftServers) do
			if Server.platformid == PlatformID then
				table.insert(NewServers,Server)
			end
		end
		LeftServers = NewServers
	end
	
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {} 
	for _, Platform in ipairs(PlatformList) do 
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	
	IsWhite = {
		[2] = "内部",
		[1] = "是",
		[0] = "否",
	}
	
	-- sdk的值，白名单的值，channelid, subchannelid
	SDKList = {}
	Filename = ""
	
	local sdkid = Options.sdkid
	local iswhite = Options.iswhite
	local channelid = Options.channelid
	local subchannelid = Options.subchannelid

	if channelid and subchannelid and channelid ~= "" and subchannelid ~= "" then
		Filename = sdkid .. "_" .. channelid .. "_" .. subchannelid .. "_" .. iswhite

		local InListServer = {}
		local ServerInList = ServerData:GetServerSDKInfo(Filename)
		for _, Svrinlist in pairs(ServerInList) do
			InListServer[Svrinlist.serverid] = true
		end

		for id, Server in ipairs(Servers) do
			if InListServer[Server.HostID] then
				table.insert(SDKList, Server)
			end
		end
		
		local NowServers = {}
		for id, Server in ipairs(LeftServers) do
			if not InListServer[Server.HostID] then
				table.insert(NowServers, Server)
			end
		end
		LeftServers = NowServers
		-- 选择的Url
		local Ret, Err = ServerData:GetEnvUrl2SDK(Filename)
		
		for _, envs in pairs(Ret) do
			Options.envname = envs.envname
		end
	end
	--获得各个服务器HostID和name的映射关系
	local ServerInfoList = ServerData:GetAllServers()
	ServerInfoMap = {}
	for _, Info in ipairs(ServerInfoList) do
		ServerInfoMap[Info.hostid] = Info.name
	end
	
	ExtMsg = Msg
	Viewer:View("template/server/servergenlist.html")
end

function ReqSDK2SvrList(self, Msg)
	Options = GetQueryArgs()
	
	if not Options.channelid or Options.channelid == "" then
		Msg = "没有必填项 channelid"
	end

	if not Options.subchannelid or Options.subchannelid == "" then
		Msg = "没有必填项 subchannelid"
	end

	
	ExtMsg = Msg
	self:ReqServerListInfo(Msg)
end

function DoModSDKSvrList(self)
	local GetMod = GetQueryArg("mod")
	local Args
	if GetMod and GetMod == "get" then
		Args = GetQueryArgs()
	else
		Args = GetPostArgs()
	end
	
	Options = Args
	
	if not Options.channelid or Options.channelid == "" then
		Msg = "没有必填项 channelid"
	end

	if not Options.subchannelid or Options.subchannelid == "" then
		Msg = "没有必填项 subchannelid"
	end
	
	if not Options.sdkid and Options.filename then
		local Str = string.split(Options.filename, "_")
		Options.sdkid = Str[1]
		Options.channelid = Str[2]
		Options.subchannelid = Str[3]
		Options.iswhite = Str[4]
	end

	if not (Options.filename and Options.filename ~= "") then
		local sdkid = Options.sdkid
		local iswhite = Options.iswhite
		local channelid = Options.channelid
		local subchannelid = Options.subchannelid
		
		local Filename = sdkid .. "_" .. channelid .. "_" .. subchannelid .. "_" .. iswhite
		
		local NeedAddServers = {}
		for ArgName, Val in pairs(Options) do
			local Gid = string.match(ArgName, "^cb_(.-)$")
			if Gid then
				local SvrId = tonumber(Val)
				NeedAddServers[SvrId] = true
			end
		end
    
		for SvrId, _ in pairs(NeedAddServers) do
			local Ret, Err = ServerData:AddServer2SDK(SvrId, Filename)
			if Err then
				self:ReqServerListInfo(Err, Options)
				return
			end
		end
	else
		local NeedDel = {}
		for ArgName, Val in pairs(Options) do
			local Gid = string.match(ArgName, "^cb_(.-)$")
			if Gid then
				local SvrId = tonumber(Val)
				NeedDel[SvrId] = true
			end
		end
		
		for SvrId, _ in pairs(NeedDel) do
			local Ret, Err = ServerData:DelServerFromSDK(SvrId, Options.filename)
			if Err then
				self:ReqServerListInfo(Err, Options)
				return
			end
		end
	end

	self:ReqServerListInfo(Msg, Options)
end

function FormatEnvList(EnvList)
	local Str = "ASSET_URL = \"" .. EnvList.ASSET_URL .. "\"\nFILE_URL = \"" .. EnvList.FILE_URL .. "\"\nSERVER_LIST_URL = \"" .. EnvList.SERVER_LIST_URL .. "\"\nBROADCAST_URL = \"" .. EnvList.BROADCAST_URL .. "\"\n"

	return Str
end


function GenServerList()
	local Options = GetPostArgs()
	
	local FileName = Options.filename
	ServList = { ServerList = {} }
	EnvList = {}
	Servers = ServerData:GetAllServers()
	if FileName and FileName ~= "" then
		ServList = CommonFunc.GetServerListByFileName(FileName) 
		
		if not next(ServList.ServerList) then
			ExtMsg = "服务器列表为空"
			Viewer:View("template/server/serversdklist.html")
			return
		end

		EnvList = CommonFunc.GetEnvListByEnvName(Options.envname, FileName) 
		ServerData:AddEnvUrl2SDK(FileName, Options)
	end
	
	local ServListStr = "return " .. Serialize(ServList)
	--将配置写入文件
	Filename = FileName
	FileName = FileName .. ".txt"
	local Writer = io.open(GetBasePath().."/../gservice/interfacedata/serverinfo/serverlist/"..FileName,"w")
	assert(Writer,"/../gservice/interfacedata/serverinfo/serverlist/"..FileName)
	Writer:write(ServListStr)
	Writer:flush()
	Writer:close()
		
--	local ServerListUrl = SDKCfg.UrlList[Options.envname].ServerListUrl .. "/env_mgr.php?func=WriteServerList"
--	ReqOutUrl(ServerListUrl, {filename=FileName, filecontent=ServListStr})
	
	local EnvListStr = FormatEnvList(EnvList)
	local Writer = io.open(GetBasePath().."/../gservice/interfacedata/serverinfo/envlist/"..FileName,"w")
	assert(Writer,"/../gservice/interfacedata/serverinfo/envlist/"..FileName)
	Writer:write(EnvListStr)
	Writer:flush()
	Writer:close()
	
--	local EnvListUrl = SDKCfg.UrlList[Options.envname].ServerListUrl .. "/env_mgr.php?func=WriteEnvList"
--	ReqOutUrl(EnvListUrl, {filename=FileName, filecontent=EnvListStr})
	
	envname = Options.envname
	PlatformID = Options.platformid

	Viewer:View("template/server/serversdklist.html")
end

function PreViewServList()
	Options = GetQueryArgs()
	local FileName = Options.filename
	ServList = { ServerList = {} }
	Servers = ServerData:GetAllServers()
	
	if FileName and FileName ~= "" then
		ServList = CommonFunc.GetServerListByFileName(FileName) 
		
		if not next(ServList.ServerList) then
			ExtMsg = "服务器列表为空"
			Viewer:View("template/server/serversdklist.html")
			return
		end
	end
	
	EnvList = CommonFunc.GetEnvListByEnvName(Options.envname, FileName)

	Filename = Options.filename
	
	envname = Options.envname
	PlatformID = Options.platformid

	Viewer:View("template/server/serversdklist.html")
end

function UpdateEnv(self)
	local Options = GetPostArgs()
	local Sql = "select * from smcs.sdkurlinfo ";
	if Options and Options.envname and Options.envname ~= "" then
		Sql = Sql .. "where envname = '" .. Options.envname .. "'"
	end
	
	local Res, Err = DB:ExeSql(Sql)

	for _, SDKNENV in pairs(Res) do
		local sdkname = SDKNENV.sdkname
		local envname = SDKNENV.envname
	
		local EnvList = CommonFunc.GetEnvListByEnvName(envname, sdkname) 
		if EnvList then
			local EnvListStr = FormatEnvList(EnvList)
		--	local EnvListUrl = SDKCfg.UrlList[Options.envname].ServerListUrl .. "/env_mgr.php?func=WriteEnvList"
		--	ReqOutUrl(EnvListUrl, {filename=sdkname .. ".txt", filecontent=EnvListStr})
			
			local FileName = sdkname .. ".txt"
			local Writer = io.open(GetBasePath().."/../gservice/interfacedata/serverinfo/envlist/"..FileName,"w")
			assert(Writer,"/../gservice/interfacedata/serverinfo/envlist/"..FileName)
			Writer:write(EnvListStr)
			Writer:flush()
			Writer:close()
		end

	end
		
	self:ReqServerListInfo(Msg)
end

DoRequest()

