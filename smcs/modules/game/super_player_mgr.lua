----------------------------------------
--$Id: activitymgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 超级会员管理的相关逻辑
--
--]]

function PlayerManageShow(self)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "label", ["Text"] = "角色ID:",},
		{["Type"] = "text", ["Name"] = "Uid", ["Placeholder"] = "请输入角色ID"},
		{["Type"] = "label", ["Text"] = "角色名:",},
		{["Type"] = "text", ["Name"] = "RoleName", ["Placeholder"] = "请输入角色名"},
		{["Type"] = "label", ["Text"] = "QQ:",},
		{["Type"] = "text", ["Name"] = "QQ", ["Placeholder"] = "请输入QQ"},
	}
	--操作人员列表
	local UserInfo = UserData:Get()
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	--展示数据
	Titles = {"平台", "角色ID", "角色账号", "QQ", "状态", "操作人", "提交时间", "操作"}
	TableData = {}
	local PlayerInfoList = SuperPlayerData:Get(Options)
	for _, PlayerInfo in ipairs(PlayerInfoList) do
		local Data = {}
		table.insert(Data, Platforms[PlayerInfo.PlatformID] or "all")
		table.insert(Data, PlayerInfo.Uid)
		table.insert(Data, PlayerInfo.RoleName)
		table.insert(Data, PlayerInfo.QQ)
		local Status = PlayerInfo.Status
		local StatusStr = "已设置"
		if tonumber(Status) == 1 then --未设置
			StatusStr = '<a onclick="setGift(\''..PlayerInfo.Uid .. "','" .. PlayerInfo.PlatformID..'\')" href="#">设置他可领取礼包</a>'
		end
		table.insert(Data, StatusStr)
		table.insert(Data, Users[PlayerInfo.Operator] or "")
		table.insert(Data, PlayerInfo.SubmitTime)
		local Href = '<a href="/gamemgr/super_player_edit?Uid='..PlayerInfo.Uid .. '&PlatformID=' .. PlayerInfo.PlatformID
			..'">编辑</a>&nbsp;&nbsp;<a onclick="deletePlayer(\''..PlayerInfo.Uid .."','".. PlayerInfo.PlatformID..'\')" href="#">删除</a>'
		table.insert(Data, Href)
		table.insert(TableData, Data)
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/game/player_manage_show.html")
end

function PlayerManageEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		SuperPlayerData:Update(Args)
		self:PlayerManageShow()
		return
	end
	Uid = GetQueryArg("Uid")
	PlatformID = GetQueryArg("PlatformID")
	PlayerInfo = {}
	if Uid and Uid ~= "" then
		PlayerInfo = SuperPlayerData:Get({Uid = Uid, PlatformID = PlatformID,})
		if PlayerInfo then
			PlayerInfo = PlayerInfo[1]
		end
	end
	Platforms = CommonFunc.GetPlatformList()
	Viewer:View("template/game/player_manage_edit.html")
end

function PlayerManageDelete(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local Uid = Args.Uid
		local PlatformID = Args.PlatformID
		if Uid and Uid ~= "" and PlatformID and PlatformID ~= "" then
			SuperPlayerData:Delete(PlatformID, Uid)
			Result = "1"
		end
	end
	ngx.say(Result)
end

function PlayerManagePublish(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local Uid = Args.Uid
		local PlatformID = Args.PlatformID
		if Uid and Uid ~= "" and PlatformID and PlatformID ~= "" then
			--TODO:发布
			SuperPlayerData:UpdateStatus(PlatformID, Uid, 2) --修改发布状态
			Result = "1"
		end
	end
	ngx.say(Result)
end

--超级玩家区服设置
function PlayerServerShow(self)
	Options = GetQueryArgs()
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
		{["Type"] = "label", ["Text"] = "QQ:",},
		{["Type"] = "text", ["Name"] = "QQ", ["Placeholder"] = "请输入QQ"},
	}
	--操作人员列表
	local UserInfo = UserData:Get()
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	--展示数据
	Titles = {"平台", "服", "元宝额度", "QQ", "状态", "操作人", "提交时间", "操作"}
	TableData = {}
	local ServerInfoList = SuperPlayerServerData:Get(Options)
	for _, ServerInfo in ipairs(ServerInfoList) do
		local Data = {}
		table.insert(Data, Platforms[ServerInfo.PlatformID] or "all")
		table.insert(Data, ServerList[ServerInfo.HostID])
		table.insert(Data, ServerInfo.GoldLimit)
		table.insert(Data, ServerInfo.QQ)
		local Status = ServerInfo.Status
		local StatusStr = "已发布"
		if tonumber(Status) == 1 then --未发布
			StatusStr = '<a onclick="publish(\''..ServerInfo.HostID .. "','" .. ServerInfo.PlatformID..'\')" href="#">未发布</a>'
		end
		table.insert(Data, StatusStr)
		table.insert(Data, Users[ServerInfo.Operator] or "")
		table.insert(Data, ServerInfo.SubmitTime)
		local Href = '<a href="/gamemgr/player_server_edit?HostID='..ServerInfo.HostID .. '&PlatformID=' .. ServerInfo.PlatformID
			..'">编辑</a>&nbsp;&nbsp;<a onclick="deleteServer(\''..ServerInfo.HostID .."','".. ServerInfo.PlatformID..'\')" href="#">删除</a>'
		table.insert(Data, Href)
		table.insert(TableData, Data)
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/game/player_server_show.html")
end

function PlayerServerEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		SuperPlayerServerData:Update(Args)
		self:PlayerServerShow()
		return
	end
	HostID = GetQueryArg("HostID")
	PlatformID = GetQueryArg("PlatformID")
	ServerInfo = {}
	if HostID and HostID ~= "" then
		ServerInfo = SuperPlayerServerData:Get({HostID = HostID, PlatformID = PlatformID,})
		if ServerInfo then
			ServerInfo = ServerInfo[1]
		end
	end
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(PlatformID)
	Viewer:View("template/game/player_server_edit.html")
end

function PlayerServerDelete(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local HostID = Args.HostID
		local PlatformID = Args.PlatformID
		if HostID and HostID ~= "" and PlatformID and PlatformID ~= "" then
			SuperPlayerServerData:Delete(PlatformID, HostID)
			Result = "1"
		end
	end
	ngx.say(Result)
end

function PlayerServerPublish(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local HostID = Args.HostID
		local PlatformID = Args.PlatformID
		if HostID and HostID ~= "" and PlatformID and PlatformID ~= "" then
			--TODO:发布
			SuperPlayerServerData:UpdateStatus(PlatformID, HostID, 2) --修改发布状态
			Result = "1"
		end
	end
	ngx.say(Result)
end

function PlayerGMShow(self)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label", ["Text"] = "角色ID:",},
		{["Type"] = "text", ["Name"] = "Uid", ["Placeholder"] = "请输入角色ID"},
		{["Type"] = "label", ["Text"] = "角色名:",},
		{["Type"] = "text", ["Name"] = "RoleName", ["Placeholder"] = "请输入角色名"},
	}
	--操作人员列表
	local UserInfo = UserData:Get()
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	--展示数据
	Titles = {"平台", "服","角色ID", "角色账号", "状态", "操作人", "提交时间", "操作"}
	TableData = {}
	local PlayerInfoList = PlayerGMData:Get(Options)
	for _, PlayerInfo in ipairs(PlayerInfoList) do
		local Data = {}
		table.insert(Data, Platforms[PlayerInfo.PlatformID] or "all")
		table.insert(Data, PlayerInfo.HostID and NewServers[tonumber(PlayerInfo.HostID)] or "all")
		table.insert(Data, PlayerInfo.Uid)
		table.insert(Data, PlayerInfo.RoleName)
		local Status = PlayerInfo.Status
		local StatusStr = "已同步"
		if tonumber(Status) == 0 then --未同步
			StatusStr = '<a onclick="publish(\''..PlayerInfo.Uid .. "','" .. PlayerInfo.PlatformID..'\')" href="#">设置同步</a>'
		end
		table.insert(Data, StatusStr)
		table.insert(Data, Users[PlayerInfo.Operator] or "")
		table.insert(Data, PlayerInfo.SubmitTime)
		local Href = '<a onclick="deleteGM(\''..PlayerInfo.Uid .."','".. PlayerInfo.PlatformID..'\')" href="#">删除</a>'
		table.insert(Data, Href)
		table.insert(TableData, Data)
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/game/player_gm_show.html")
end

function PlayerGMEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local UserOptions = {
			PlatformID = Args.PlatformID,
			HostID = Args.HostID,
			RealName = Args.RoleName,
		}
		local UserList = UserInfoData:Get(UserOptions)
		if not UserList or #UserList == 0 then
			self:PlayerGMShow(-1)
			return
		end
		Args.Uid = UserList[1].Uid --获得玩家uid
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		PlayerGMData:Update(Args)
		self:PlayerGMShow()
		return
	end
	Options = GetQueryArgs()
	Uid = GetQueryArg("Uid")
	PlatformID = GetQueryArg("PlatformID")
	GMInfo = {}
	if Uid and Uid ~= "" then
		GMInfo = PlayerGMData:Get({Uid = Uid, PlatformID = PlatformID,})
		if GMInfo then
			GMInfo = GMInfo[1]
		end
	end
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(PlatformID)
	Viewer:View("template/game/player_gm_edit.html")
end

function PlayerGMDelete(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local Uid = Args.Uid
		local PlatformID = Args.PlatformID
		if Uid and Uid ~= "" then
			PlayerGMData:Delete(Uid)
			Result = "1"
		end
	end
	ngx.say(Result)
end

local GMID = 2
function PlayerGMPublish(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local Uid = Args.Uid
		if Uid and Uid ~= "" then
			local GMInfo = PlayerGMData:Get({Uid = Uid})
			GMInfo = GMInfo[1]
			local OperationInfo = GMRuleData:Get({ID = GMID})
			local Rule = OperationInfo[1].Rule
			local GMParams = {Uid, "NewPlayerGuide", 1} --加上玩家uid验证
			--验证参数
			local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
			Args.PlatformID = GMInfo.PlatformID
			Args.HostID = GMInfo.HostID
			local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
			local Flag, TResult = CommonFunc.ExecuteGM(Args, GMID, GMCMD, OperationTime)
			Result = TResult == "执行成功" and 1 or 0
			PlayerGMData:UpdateStatus(Uid, Result) --修改发布状态
		end
	end
	ngx.say(Result)
end

DoRequest()
