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

-- 供发布服的发布脚本使用
function DoGetHostList(self)
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
		local SvrInfo = ServerMap[TagInfo.svrid]
		if SvrInfo then
			local TmpOutTbl = OutTbl[SvrInfo.platformid] or {}
			table.insert(TmpOutTbl,string.format("\"%s\":{\"ip\":\"%s\",\"port\":\"%s\"}",SvrInfo.servmark,SvrInfo.address,SvrInfo.ports))
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

function DoGetServerListConf(self)
	local FileName = GetQueryArg("filename")
	local Type = GetQueryArg("type")
	
	if not FileName then
		ngx.say("-1,no filename")
		return 
	end

	local ConfFilePath = GetBasePath() .. "/interfacedata/serverinfo/"
	if Type == "env" then
		ConfFilePath = ConfFilePath .. "envlist/" .. FileName .. ".txt"
	elseif Type == "serverlist" then
		ConfFilePath = ConfFilePath .. "serverlist/" .. FileName .. ".txt"
	elseif Type == "accountlist" then
		ConfFilePath = ConfFilePath .. "accountwhitelist/" .. FileName .. ".txt"
	elseif Type == "whitelist" then
		ConfFilePath = ConfFilePath .. "ipwhitelist/" .. FileName .. ".txt"
	else
		ngx.say("-1, type not correct")
		return
	end
	
	local ConfFile = io.open(ConfFilePath, "r")
	if not ConfFile then
		ngx.say("-1, no file")
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
ngx.say(St)
ngx.say(HostId)
	local Ret = ServerData:GetData("servers", {["hostid"] = HostId})
	if #Ret == 0 then
		ngx.say(string.format("-1 没有host[%d]对应的服务器", HostId))
	end

	local Ret = ServerData:UpCol("servers",{["hostid"]=HostId},{["status"]=St})
	ngx.say(Ret)
end

DoRequest(true)
