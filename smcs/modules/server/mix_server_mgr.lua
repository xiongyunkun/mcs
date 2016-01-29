----------------------------------------
--$Id: mix_server_mgr.lua 70642 2015-06-11 08:55:51Z xiongyunkun $
----------------------------------------
--[[
-- 跨服管理
--
--]]

function MixServerList(self, IsAll)
	Options = GetQueryArgs()
	if IsAll then
		Options = {} --选全平台
	end
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
	}
	
	Titles = {"平台", "HostID", "服编号", "操作"}
	TableData = {}
	local MixServers = MixServerData:Get(Options)
	for _, Info in ipairs(MixServers) do
		local Data = {}
		local PlatformName = Info.PlatformID and Platforms[Info.PlatformID] or "all"
		table.insert(Data, PlatformName)
		table.insert(Data, Info.HostID)
		table.insert(Data, Info.ServerID)
		local Href = '<a href="/servermgr/mix_server_edit?PlatformID=' .. Info.PlatformID 
			.. '&ServerID=' .. Info.ServerID .. '" title="编辑">编辑</a>'
			.. '&nbsp&nbsp<a href="#" onclick="deleteServer(\''..Info.PlatformID .. "','" .. Info.ServerID 
			.. "','" .. PlatformName .. '\')">删除</a>'
		table.insert(Data, Href)
		table.insert(TableData, Data)
	end
	DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
		["SortCol"] = 1,
		["SortBy"] = "asc",
	}
	Viewer:View("template/server/mix_server_list.html")
end

function Edit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		MixServerData:Insert(Args)
		self:MixServerList(true)
	else
		local Options = GetQueryArgs()
		local PlatformID = Options.PlatformID
		local ServerID = Options.ServerID
		ServerInfo = {}
		if PlatformID and ServerID then
			ServerInfo = MixServerData:Get({PlatformID = PlatformID, ServerID = ServerID})
			if ServerInfo and ServerInfo[1] then
				ServerInfo = ServerInfo[1]
			end
		end
		Platforms = CommonFunc.GetPlatformList()
		Viewer:View("template/server/mix_server_edit.html")
	end
end

function Delete(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		MixServerData:Delete(Args.PlatformID, Args.ServerID)
		ngx.print("1")
	end
end

DoRequest()
