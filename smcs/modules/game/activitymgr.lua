----------------------------------------
--$Id: activitymgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 活动管理的相关逻辑
--
--]]
local PublishTypes = {
	["Saved"] = 0,
	["Published"] = 1,
}

local StatusTypes = {
	["NoPublished"] = "未发布",
	["NoStart"] = "未到活动期",
	["GoingOn"] = "活动进行中" ,
	["TheEnd"] = "活动已结束",
}

local OPEN_GM_ID = 24 --开启活动GM的ID
local CLOSE_GM_ID = 25 --关闭活动GM的ID

function ActivityShow(self)
	ActivityMap = CommonData.ActivityList
	Platforms = CommonFunc.GetPlatformList()

	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	ServerList = NewServers
	ServerTypes = CommonFunc.GetMulServerTypes()
	--操作人员列表
	local UserInfo = UserData:Get()
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	--展示数据
	Titles = {"ID", "平台", "服类型", "服", "活动名称", "开始时间", "结束时间",  "操作人", 
		"状态", "操作"}
	--数据库中获取数据
	TableData = {}
	local Results = ActivityData:Get({}) or {}
	for _, Result in ipairs(Results) do
		--按行重新封装数据
		local Data = {} 
		Data["ID"] = Result.ID
		Data["PlatformID"] = Result.PlatformID
		Data["PlatformName"] = Platforms[Result.PlatformID] or "all"
		Data["ServerType"] = Result.ServerType
		local ServerIDs = string.split(Result.HostIDs, ",")
		local ServerNames = {}
		for _, ServerID in ipairs(ServerIDs) do
			table.insert(ServerNames, ServerList[tonumber(ServerID)])
		end
		ServerNames = #ServerNames == 0 and "all" or table.concat(ServerNames, ",")
		Data["HostIDs"] = Result.HostIDs
		Data["ServerNames"] = ServerNames
		Data["ActivityID"] = Result.ActivityID
		Data["StartTime"] = Result.StartTime
		Data["EndTime"] = Result.EndTime
		Data["Operator"] = Users[Result.Operator] or ""
		local Status = self:GetStatus(Result.StartTime, Result.EndTime, Result.Status)
		Data["Status"] = Status
		local Href = '<a onclick="deleteActivity('..Result.ID..')" href="#">删除</a>'
		Data["Href"] = Href
		table.insert(TableData, Data)
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/game/activity_show.html")
end

--根据活动开始时间和结束时间判断活动状态
function GetStatus(self, StartTime, EndTime, Status)
	if tonumber(Status) == PublishTypes.Saved then
		return StatusTypes.NoPublished
	end
	local NowTime = os.time()
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
	ID = GetQueryArg("ID")
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		Args.HostIDs = type(Args.HostIDs) == "table" and table.concat(Args.HostIDs, ",") or Args.HostIDs
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		if Args.ID and Args.ID ~= "" then
			ActivityData:Update(Args)
		else
			Args.ID = ActivityData:Insert(Args)
		end
		--发布活动
		local Results = self:SendGM("open", Args.ID)
		ActivityData:UpdateStatus(Args.ID, 1)
		self:ActivityShow()
		return
	end
	ActivityInfo = {}
	if ID and ID ~= "" then
		ActivityInfo = ActivityData:Get({ID = ID})
		if ActivityInfo then
			ActivityInfo = ActivityInfo[1]
			local HostIDs = string.split(ActivityInfo.HostIDs, ",")
			ActivityInfo.HostIDs = HostIDs
		end
	end
	ActivityMap = CommonData.ActivityList
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(ActivityInfo.PlatformID or "")
	ServerTypes = CommonFunc.GetMulServerTypes()
	Viewer:View("template/game/activity_edit.html")
end

--活动发布
function ActivityPbulish(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local ID = Args.ID
		local Results = self:SendGM("open", ID)
		ActivityData:UpdateStatus(ID, 1)
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
			local Results = self:SendGM("close", ID)
			ActivityData:Delete(ID)
			Result = "1"
		end
	end
	ngx.say(Result)
end

--发送GM指令
function SendGM(self, Type, ActivityID)
	local Results = {}
	local ActivityInfo = ActivityData:Get({ID = ActivityID})
	if not ActivityInfo or not ActivityInfo[1] then
		return Results
	end
	ActivityInfo = ActivityInfo[1]
	local ActivityName = CommonData.ActivityList[ActivityInfo.ActivityID] or ""
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local HostList = ServerData:GetServerList(ActivityInfo.ServerType, 
		string.split(ActivityInfo.HostIDs, ","), ActivityInfo.PlatformID)
	local Args = {
		PlatformID = ActivityInfo.PlatformID,
	}
	if Type == "open" then
		local GMInfo = GMRuleData:Get({ID = OPEN_GM_ID})
		local GMRule = GMInfo[1].Rule
		local StartTime = string.gsub(ActivityInfo.StartTime, " ", "+") -- +号需要做urlencode
		local EndTime = string.gsub(ActivityInfo.EndTime, " ", "+")
		local Flag, GMCMD = CommonFunc.VerifyGMParms(GMRule, {ActivityName, ActivityID,
			StartTime, EndTime})

		if Flag then
			for _, HostID in ipairs(HostList) do
				Args.HostID = HostID
				Results[HostID] = CommonFunc.ExecuteGM(Args, OPEN_GM_ID, GMCMD, OperationTime)
			end
		end
	elseif Type == "close" then
		local GMInfo = GMRuleData:Get({ID = CLOSE_GM_ID})
		local GMRule = GMInfo[1].Rule
		local Flag, GMCMD = CommonFunc.VerifyGMParms(GMRule, {ActivityName, ActivityID})
		if Flag then
			for _, HostID in ipairs(HostList) do
				Args.HostID = HostID
				Results[HostID] = CommonFunc.ExecuteGM(Args, OPEN_GM_ID, GMCMD, OperationTime)
			end
		end
	end
	return Results
end

DoRequest()
