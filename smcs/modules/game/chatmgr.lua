----------------------------------------
--$Id: chatmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 聊天管理的相关逻辑
--
--]]

function ChatShow(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	Options.RoleName = Options.RoleName or ""
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	
	local ServerTypes = CommonFunc.GetMulServerTypes()
	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	ServerList = NewServers
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host"},
		{["Type"] = "label", ["Text"] = "角色名:",},
		{["Type"] = "text", ["Name"] = "RoleName", ["Placeholder"] = "请输入角色名"},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
	}
	--展示数据
	Titles = {"平台", "服", "角色账号", "角色名", "聊天频道", "时间", "内容", "操作"}
	local Channels = CommonData.ChatChannels
	TableData = {}
	if Options.RoleName ~= "" then
		--先根据角色名获得对应的uid
		local UserList = UserInfoData:Get({Name=Options.RoleName,PlatformID=Options.PlatformID})
		for _, UserInfo in ipairs(UserList) do
			local ChatLogList = ChatLogData:Get(Options.PlatformID, {HostID = UserInfo.HostID, Uid = UserInfo.Uid})
			if #ChatLogList ~= 0 then
				for _, ChatLog in ipairs(ChatLogList) do
					--按行重新封装数据
					local Data = {}
					table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all") --平台
					table.insert(Data, Servers[tonumber(UserInfo.HostID)] or "all") -- 服
					table.insert(Data, UserInfo.Uid)
					table.insert(Data, UserInfo.Name)
					table.insert(Data, Channels[ChatLog.ChannelID])
					table.insert(Data, ChatLog.Time)
					table.insert(Data, ChatLog.Msg)
					local Url = '<a href="/playermgr/forbidden?OperationType=1&RoleName='..UserInfo.Name
						..'">禁言</a>&nbsp;&nbsp;<a href="/playermgr/forbidden?OperationType=3&RoleName='..UserInfo.Name..'">封号</a>'
					table.insert(Data, Url)
					table.insert(TableData, Data)
				end
			end
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/game/chat_show.html")
end

DoRequest()
