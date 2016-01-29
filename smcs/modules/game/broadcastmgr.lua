----------------------------------------
--$Id: broadcastmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 公告管理
--
--]]
local GMID = 15 --公告GMID
--公告管理
function BroadcastShow(self)
	local Options = GetQueryArgs()
	local NowTime = ngx.time()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",NowTime-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",NowTime)
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local ServerTypes = CommonFunc.GetMulServerTypes()
	local BroadTypes = CommonFunc.GetBroadcastTypes()
	local OperationTypes = CommonFunc.GetOperationType()
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
	local Titles = {"ID", "平台", "服类型", "服", "操作类型", "开始时间", "结束时间", "时间间隔", "最大次数", 
	"公告类型", "公告内容", "操作"}
	--数据库中获取数据
	local TableData = {}
	local Results = BroadcastData:Get(Options) or {}
	for _, Result in ipairs(Results) do
		--按行重新封装数据
		local Data = {} 
		table.insert(Data, Result.ID)
		table.insert(Data, Platforms[Result.PlatformID] or "all")
		table.insert(Data, ServerTypes[Result.ServerType] or "")
		local ServerIDs = string.split(Result.HostIDs, ",")
		local ServerNames = {}
		for _, ServerID in ipairs(ServerIDs) do
			table.insert(ServerNames, ServerList[tonumber(ServerID)])
		end
		ServerNames = #ServerNames == 0 and "all" or table.concat(ServerNames, ",")
		table.insert(Data, ServerNames)
		table.insert(Data, OperationTypes[Result.OperateType] or "立即执行")
		table.insert(Data, Result.StartTime or "")
		table.insert(Data, Result.EndTime or "")
		table.insert(Data, Result.SendInterval)
		table.insert(Data, Result.SendNum)
		table.insert(Data, BroadTypes[Result.BroadType])
		table.insert(Data, Result.Content)
		if not self:IsOver(Result) then
			table.insert(Data, '<a href="/gamemgr/broadcastedit?ID='..Result.ID..'">编辑</a>&nbsp;&nbsp;<a onclick="deleteBroadcast('..Result.ID..')" href="#">删除</a>')
		else
			table.insert(Data, '<a href="/gamemgr/broadcastresult?ID='..Result.ID..'" class="fancybox fancybox.iframe">已执行</a>')
		end
		
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
	Viewer:View("template/game/broadcast_show.html", Params)
end

function BroadcastEdit(self)
	ID = GetQueryArg("ID")
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		Args.HostIDs = type(Args.HostIDs) == "table" and table.concat(Args.HostIDs, ",") or Args.HostIDs
		Args.HostIDs = Args.HostIDs or ""
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		if Args.ID and Args.ID ~= "" then
			BroadcastData:Update(Args)
		else
			--开始时间和结束时间取当前时间
			Args.StartTime = Args.StartTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time())
			Args.EndTime = Args.EndTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time())
			Args.ID = BroadcastData:Insert(Args)
		end
		--如果是立即执行则开始执行GM指令
		if Args.OperateType == "1" then
			local HostIDs = string.split(Args.HostIDs, ",")
			local NHostIDs = {}
			for _, HostID in ipairs(HostIDs) do
				table.insert(NHostIDs, tonumber(HostID))
			end
			local HostList = ServerData:GetServerList(Args.ServerType, NHostIDs, Args.PlatformID)
			local Results = self:ExecuteGM(Args.PlatformID, HostList, GMID, Args.BroadType, Args.Content)
			BroadcastData:UpdateResult(Args.ID, Serialize(Results))
		end
		self:BroadcastShow()
		return
	end
	BroadcastInfo = {}
	if ID and ID ~= "" then
		BroadcastInfo = BroadcastData:Get({ID = ID})
		if BroadcastInfo then
			BroadcastInfo = BroadcastInfo[1]
			local HostIDs = string.split(BroadcastInfo.HostIDs, ",")
			BroadcastInfo.HostIDs = HostIDs
		end
	end
	
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(BroadcastInfo.PlatformID or "")
	ServerTypes = CommonFunc.GetMulServerTypes()
	BroadTypes = CommonFunc.GetBroadcastTypes()
	OperationTypes = CommonFunc.GetOperationType()
	local Params = {
		ID = ID,
		Platforms = Platforms,
		Servers = Servers,
		BroadcastInfo = BroadcastInfo,
		ServerTypes = ServerTypes,
		BroadTypes = BroadTypes,
		OperationTypes = OperationTypes,
	}
	Viewer:View("template/game/broadcast_edit.html", Params)
end

function BroadcastDelete(self)
	local Result = "0"
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local ID = Args.ID
		if ID and ID ~= "" then
			BroadcastData:Delete(ID)
			Result = "1"
		end
	end
	ngx.say(Result)
end

-- 执行GM指令发送公告
function ExecuteGM(self, PlatformID, HostList, GMID, BroadType, Content)
	local Results = {}
	--获得GM指令
	local OperationInfo = GMRuleData:Get({ID = GMID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	local BroadcastID = CommonData.BroadcastList[tonumber(BroadType)]
	if not BroadcastID then
		return
	end
	--验证参数
	local GMParams = {BroadcastID, Content}
	local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
	if not Flag then
		ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
		return
	else
		local Options = {PlatformID = PlatformID}
		for _, HostID in ipairs(HostList) do
			--执行GM指令
			Options.HostID = HostID
			local Flag, Result = CommonFunc.ExecuteGM(Options, GMID, GMCMD, OperationTime)
			Results[HostID] = Result
		end
	end
	return Results
end

--判断该公告是否过期
function IsOver(self, Result)
	local NowTime = ngx.time()
	if Result.OperateType == 2 then
		if GetTimeStamp(Result.EndTime) > NowTime then --结束时间必须大于当前时间
			if Result.SendNum == 0 then
				return false --没有次数限制的话都没有过期
			end
			if Result.SendNum ~= 0 and Result.SendNum > Result.NowOperationNum then
				return false --有次数限制并且没有达到次数上限的话也没有过期
			else
				return true
			end
		else
			return true
		end
	else
		return true
	end
end

function BroadcastResult(self)
	ID = GetQueryArg("ID") or ""
	local BroadcastInfo = BroadcastData:Get({ID = ID})
	if not BroadcastInfo or not BroadcastInfo[1] then
		return 
	end
	BroadcastInfo = BroadcastInfo[1]
	Result = BroadcastInfo["Result"]
	-- 将换行符替换成<br>
	Result = string.gsub(Result,"\n","<br>")
	Result = string.gsub(Result,"\r","<br>")
	local Params = {
		ID = ID,
		Platforms = Platforms,
		Servers = Servers,
		Result = Result,
	}
	Viewer:View("template/gm/operation_result.html", Params)
end


DoRequest()
