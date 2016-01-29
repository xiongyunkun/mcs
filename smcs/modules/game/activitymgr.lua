----------------------------------------
--$Id: activitymgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 活动管理的相关逻辑
--
--]]
local PublishTypes = {
	["Saved"] = 1,
	["Published"] = 2,
}

local StatusTypes = {
	["NoPublished"] = "未发布",
	["NoStart"] = "未到活动期",
	["GoingOn"] = "活动进行中" ,
	["TheEnd"] = "活动已结束",
}

--先暂时写死几个活动，后面再删除
local ActivityList = {"丰财聚宝", "星语心愿", "幸运转盘"}

function ActivityShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	
	local ServerTypes = CommonFunc.GetMulServerTypes()
	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	ServerList = NewServers
	--操作人员列表
	local UserInfo = UserData:Get()
	local Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host"},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
	}
	--展示数据
	local Titles = {"ID", "平台", "服类型", "服", "开始时间", "结束时间",  "操作人", "状态", "操作"}
	--数据库中获取数据
	local TableData = {}
	local Results = ActivityData:Get(Options) or {}
	for _, Result in ipairs(Results) do
		--按行重新封装数据
		local Data = {} 
		table.insert(Data, Result.ID)
		table.insert(Data, Platforms[Result.PlatformID] or "all")
		table.insert(Data, ServerTypes[Result.ServerType])
		local ServerIDs = string.split(Result.HostIDs, ",")
		local ServerNames = {}
		for _, ServerID in ipairs(ServerIDs) do
			table.insert(ServerNames, ServerList[tonumber(ServerID)])
		end
		ServerNames = #ServerNames == 0 and "all" or table.concat(ServerNames, ",")
		table.insert(Data, ServerNames)
		table.insert(Data, Result.StartTime)
		table.insert(Data, Result.EndTime)
		table.insert(Data, Users[Result.Operator] or "")
		local Status = self:GetStatus(Result.StartTime, Result.EndTime, Result.Status)
		table.insert(Data, Status)
		local Href = '<a href="/gamemgr/activityedit?ID='..Result.ID
			..'">编辑</a>&nbsp;&nbsp;<a onclick="publishActivity(\''..Result.ID .. '\',\'' .. Status
			..'\')" href="#">发布</a>&nbsp;&nbsp;<a onclick="deleteActivity('..Result.ID..')" href="#">删除</a>'
		table.insert(Data, Href)
		table.insert(TableData, Data)
	end
	local DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		Filters = Filters,
		TableData = TableData,
		Titles = Titles,
		DataTable = DataTable,
		Users = Users,
	}
	Viewer:View("template/game/activity_show.html", Params)
end

--根据活动开始时间和结束时间判断活动状态
function GetStatus(self, StartTime, EndTime, Status)
	if tonumber(Status) == PublishTypes.Saved then
		return StatusTypes.NoPublished
	end
	local NowTime = ngx.time()
	local StartTime = GetTimeStamp(StartTime)
	local EndTime = GetTimeStamp(EndTime)
	if NowTime < StartTime then
		return StatusTypes.NoStart
	elseif NowTime >= StartTime and NowTime <= EndTime then
		return StatusTypes.GoingOn
	else
		return StatusTypes.TheEnd
	end
end

function ActivityEdit(self)
	local ID = GetQueryArg("ID")
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		Args.HostIDs = type(Args.HostIDs) == "table" and table.concat(Args.HostIDs, ",") or Args.HostIDs
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		if Args.ID and Args.ID ~= "" then
			ActivityData:Update(Args)
		else
			ActivityData:Insert(Args)
		end
		self:ActivityShow()
		return
	end
	local ActivityInfo = {}
	if ID and ID ~= "" then
		ActivityInfo = ActivityData:Get({ID = ID})
		if ActivityInfo then
			ActivityInfo = ActivityInfo[1]
			local HostIDs = string.split(ActivityInfo.HostIDs, ",")
			ActivityInfo.HostIDs = HostIDs
		end
	end
	local ActivityMap = ActivityList
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(ActivityInfo.PlatformID or "")
	local ServerTypes = CommonFunc.GetMulServerTypes()
	local Params = {
		ID = ID,
		ActivityInfo = ActivityInfo,
		Platforms = Platforms,
		Servers = Servers,
		ActivityMap = ActivityMap,
		TableData = TableData,
		ServerTypes = ServerTypes,
	}
	Viewer:View("template/game/activity_edit.html", Params)
end

--活动发布
function ActivityPbulish(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local ID = Args.ID
		--TODO:后面对接活动发布
		Result = "1"
	end
	ngx.say(Result)
end

--活动删除
function ActivityDelete(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local ID = Args.ID
		if ID and ID ~= "" then
			ActivityData:Delete(ID)
			Result = "1"
		end
	end
	ngx.say(Result)
end

DoRequest()
