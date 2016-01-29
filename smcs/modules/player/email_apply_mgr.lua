----------------------------------------
--$Id: item_apply_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 邮件发送申请相关逻辑
--
--]]
OperationTypes = {"单独发送", "群发邮件"}
ServerTypes = CommonFunc.GetMulServerTypes()
local StatusMap = {
	[1] = "未审核",
	[2] = "已审核",
	[3] = "审核未通过",
	[4] = "邮件已发送",
	[5] = "不发送邮件",
}
local EmailRuleID = 7
local NewEmailRuleID = 16

function ApplyList(self, ErrMsg)
	local ExtMsg = ErrMsg
	local Options = GetQueryArgs()
	Options.RoleName = Options.RoleName or ""
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local ServerTypes = CommonFunc.GetMulServerTypes()

	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	ServerList = NewServers
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
	}
	--展示数据
	local Titles = {"申请时间", "平台", "大区类型", "服", "操作方式", "角色列表", "最低等级", "创角时间",
		"标题", "内容"}
	local User = UserData:GetUserById(GetSession("UserId"))
	local UserAccount = User and User["account"]
	if not UserAccount then 
		return
	end
	Options.Applicant = UserAccount
	local ApplyList = EmailApplyData:Get(Options)
	local TableData = {}
	local AuditingList = {}
	local AuditedList = {}
	local ApplyInfo = {}
	--用户列表
	local UserList = UserData:GetAllUsers()
	local UserMap = {}
	for _, UserInfo in ipairs(UserList) do
		UserMap[UserInfo.account] = UserInfo.name
	end
	
	for _, ApplyInfo in ipairs(ApplyList or {}) do
		local Data = {}
		Data.ID = ApplyInfo.ID
		table.insert(Data, ApplyInfo.SubmitTime)
		table.insert(Data, ApplyInfo.PlatformID and Platforms[ApplyInfo.PlatformID] or "all") --平台
		Data.ApplyInfo = ApplyInfo
		table.insert(Data, ServerTypes[ApplyInfo.ServerType])
		local HostIDs = string.split(ApplyInfo.HostIDs, ",")
		local HostNames = {}
		for _, HostID in ipairs(HostIDs) do
			if ServerList[tonumber(HostID)] then
				table.insert(HostNames, ServerList[tonumber(HostID)])
			end
		end
		table.insert(Data, table.concat(HostNames, ","))
		table.insert(Data, OperationTypes[ApplyInfo.OperationType])
		table.insert(Data, ApplyInfo.RoleNames)
		table.insert(Data, ApplyInfo.MinLevel ~= 0 and ApplyInfo.MinLevel or "")
		table.insert(Data, ApplyInfo.CreateRoleTime ~= "0000-00-00 00:00:00" and ApplyInfo.CreateRoleTime or "")
		table.insert(Data, ApplyInfo.Title)
		table.insert(Data, ApplyInfo.Content)

		if ApplyInfo.Status == 1 then
			local Url = '<a href="#" class="apply_delete">删除</a>'
			table.insert(Data, Url)
			table.insert(AuditingList, Data)
		else
			table.insert(Data, ApplyInfo.AuditTime)
			table.insert(Data, UserMap[ApplyInfo.Auditor] or ApplyInfo.Auditor)
			local Status = StatusMap[ApplyInfo.Status]
			table.insert(Data, ApplyInfo.Status%2 == 0 and '<font color="blue">'.. Status.. '<font>' or '<font color="red">'..Status..'<font>')
			table.insert(AuditedList, Data)
		end
	end
	local DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	local Params = {
		ExtMsg = ExtMsg,
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		ServerTypes = ServerTypes,
		Titles = Titles,
		Filters = Filters,
		TableData = TableData,
		AuditingList = AuditingList,
		AuditedList = AuditedList,
		ApplyInfo = ApplyInfo,
		DataTable = DataTable,
		OperationTypes = OperationTypes,
	}
	Viewer:View("template/player/email_apply_list.html", Params)
end

function ApplyEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		--先判断这个表单是否已经被审核了
		if Args.ID and Args.ID ~= "" then
			local AuditFlag, Status = EmailApplyData:CheckIsAudited(Args.ID)
			if AuditFlag then
				local Msg = "该表单已被"
				if Status == 2 then
					Msg = Msg .. '<font color="blue">通过</font>,不能修改！' 
				else
					Msg = Msg .. '<font color="red">拒绝</font>,不能修改！' 
				end
				self:ApplyList(Msg)
				return
			end
		end
		Args.HostIDs = type(Args.HostIDs) == "table" and table.concat(Args.HostIDs, ",") or Args.HostIDs
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Applicant = User and User["account"] or ""
		local NowTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
		Args.SubmitTime = NowTime
		Args.LastUpdateTime = NowTime
		EmailApplyData:Insert(Args)
		self:ApplyList()
	end
end

--删除申请
function ApplyDelete(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		if Args.ID and Args.ID ~= "" then
			EmailApplyData:Delete(Args.ID)
		end
		ngx.say("1")
	end
end

--道具申请审核列表
function JuniorAuditList(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	Options.RoleName = Options.RoleName or ""
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--用户列表
	local UserList = UserData:GetAllUsers()
	local UserMap = {}
	for _, UserInfo in ipairs(UserList) do
		UserMap[UserInfo.account] = UserInfo.name
	end

	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	ServerList = NewServers
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
	}
	--展示数据
	local Titles = {"申请时间", "平台", "大区类型", "服", "操作方式", "角色列表", "最低等级", "创角时间",
		"标题", "内容", "申请人"}
	local ApplyList = EmailApplyData:Get(Options)
	local TableData = {}
	local AuditingList = {}
	local AuditedList = {}
	for _, ApplyInfo in ipairs(ApplyList or {}) do
		local Data = {}
		table.insert(Data, ApplyInfo.SubmitTime)
		Data.ID = ApplyInfo.ID
		Data.LastUpdateTime = ApplyInfo.LastUpdateTime
		table.insert(Data, ApplyInfo.PlatformID and Platforms[ApplyInfo.PlatformID] or "all") --平台
		table.insert(Data, ServerTypes[ApplyInfo.ServerType])
		local HostIDs = string.split(ApplyInfo.HostIDs, ",")
		local HostNames = {}
		for _, HostID in ipairs(HostIDs) do
			if ServerList[tonumber(HostID)] then
				table.insert(HostNames, ServerList[tonumber(HostID)])
			end
		end
		table.insert(Data, table.concat(HostNames, ","))
		table.insert(Data, OperationTypes[ApplyInfo.OperationType])
		table.insert(Data, ApplyInfo.RoleNames)
		table.insert(Data, ApplyInfo.MinLevel ~= 0 and ApplyInfo.MinLevel or "")
		table.insert(Data, ApplyInfo.CreateRoleTime ~= "0000-00-00 00:00:00" and ApplyInfo.CreateRoleTime or "")
		table.insert(Data, ApplyInfo.Title)
		table.insert(Data, ApplyInfo.Content)
		table.insert(Data, UserMap[ApplyInfo.Applicant] or "")
		
		if ApplyInfo.Status == 1 then
			local Url = '<input class="submit_btn" type="button" value="同意" onclick="acceptApply(\''
				..ApplyInfo.ID .. '\',\'' .. (UserMap[ApplyInfo.Applicant] or ApplyInfo.Applicant) .. '\')">'
				..'&nbsp;&nbsp;<input class="erro_btn" type="button" value="否决" onclick="rejectApply(\''
				..ApplyInfo.ID .. '\',\'' .. (UserMap[ApplyInfo.Applicant] or ApplyInfo.Applicant) .. '\')">'
			table.insert(Data, Url)
			table.insert(AuditingList, Data)
		else
			table.insert(Data, ApplyInfo.AuditTime)
			table.insert(Data, UserMap[ApplyInfo.Auditor] or ApplyInfo.Auditor)
			local Status = StatusMap[ApplyInfo.Status]
			table.insert(Data, ApplyInfo.Status%2 == 0 and '<font color="blue">'.. Status.. '<font>' or '<font color="red">'..Status..'<font>')
			table.insert(AuditedList, Data)
		end
	end
	local DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		ServerTypes = ServerTypes,
		Titles = Titles,
		Filters = Filters,
		TableData = TableData,
		AuditingList = AuditingList,
		AuditedList = AuditedList,
		DataTable = DataTable,
		OperationTypes = OperationTypes,
	}
	Viewer:View("template/player/email_junior_audit_list.html", Params)
end

--邮件发送
function AuditList(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	Options.RoleName = Options.RoleName or ""
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--用户列表
	local UserList = UserData:GetAllUsers()
	local UserMap = {}
	for _, UserInfo in ipairs(UserList) do
		UserMap[UserInfo.account] = UserInfo.name
	end

	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	ServerList = NewServers
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
	}
	--展示数据
	local Titles = {"申请时间", "平台", "大区类型", "服", "操作方式", "角色列表", "最低等级", "创角时间",
		"标题", "内容", "申请人"}
	Options.Verify = true --只获得已通过初审的列表
	local ApplyList = EmailApplyData:Get(Options)
	local TableData = {}
	local AuditingList = {}
	local AuditedList = {}
	for _, ApplyInfo in ipairs(ApplyList or {}) do
		local Data = {}
		table.insert(Data, ApplyInfo.SubmitTime)
		Data.ID = ApplyInfo.ID
		Data.LastUpdateTime = ApplyInfo.LastUpdateTime
		table.insert(Data, ApplyInfo.PlatformID and Platforms[ApplyInfo.PlatformID] or "all") --平台
		table.insert(Data, ServerTypes[ApplyInfo.ServerType])
		local HostIDs = string.split(ApplyInfo.HostIDs, ",")
		local HostNames = {}
		for _, HostID in ipairs(HostIDs) do
			if ServerList[tonumber(HostID)] then
				table.insert(HostNames, ServerList[tonumber(HostID)])
			end
		end
		table.insert(Data, table.concat(HostNames, ","))
		table.insert(Data, OperationTypes[ApplyInfo.OperationType])
		table.insert(Data, ApplyInfo.RoleNames)
		table.insert(Data, ApplyInfo.MinLevel ~= 0 and ApplyInfo.MinLevel or "")
		table.insert(Data, ApplyInfo.CreateRoleTime ~= "0000-00-00 00:00:00" and ApplyInfo.CreateRoleTime or "")
		table.insert(Data, ApplyInfo.Title)
		table.insert(Data, ApplyInfo.Content)
		table.insert(Data, UserMap[ApplyInfo.Applicant] or "")
		
		if ApplyInfo.Status == 2 then
			local Url = '<input class="submit_btn" type="button" value="同意" onclick="acceptApply(\''
				..ApplyInfo.ID .. '\',\'' .. (UserMap[ApplyInfo.Applicant] or ApplyInfo.Applicant) .. '\')">'
				..'&nbsp;&nbsp;<input class="erro_btn" type="button" value="否决" onclick="rejectApply(\''
				..ApplyInfo.ID .. '\',\'' .. (UserMap[ApplyInfo.Applicant] or ApplyInfo.Applicant) .. '\')">'
			table.insert(Data, Url)
			table.insert(AuditingList, Data)
		else
			table.insert(Data, ApplyInfo.AuditTime)
			table.insert(Data, UserMap[ApplyInfo.Auditor] or ApplyInfo.Auditor)
			local Status = StatusMap[ApplyInfo.Status] or ""
			table.insert(Data, ApplyInfo.Status%2 == 0 and '<font color="blue">'.. Status.. '<font>' or '<font color="red">'..Status..'<font>')
			table.insert(AuditedList, Data)
		end
	end
	local DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		ServerTypes = ServerTypes,
		Filters = Filters,
		Titles = Titles,
		TableData = TableData,
		AuditingList = AuditingList,
		AuditedList = AuditedList,
		DataTable = DataTable,
		OperationTypes = OperationTypes,
	}
	Viewer:View("template/player/email_audit_list.html", Params)
end

function ApplyAudit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		if Args.ID and Args.ID ~= "" then
			local User = UserData:GetUserById(GetSession("UserId"))
			local UserAccount = User and User["account"]
			if not UserAccount then 
				ngx.say("2")
				return
			end
			local NowTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
			local IDs = string.split(Args.ID, ",")
			local UpdateTimes = string.split(Args.updateTime, ",")
			for Index, ID in ipairs(IDs) do
				--先比对最近修改时间
				local LastUpdateTime = UpdateTimes[Index]
				if LastUpdateTime then
					local ModifyFlag = EmailApplyData:CheckIsModified(ID, LastUpdateTime)
					if ModifyFlag then
						ngx.say("2")
						return
					end
				end
				if tonumber(Args.Status) == 4 then --同意申请，发送邮件
					local ApplyInfo = EmailApplyData:Get({ID = ID})
					if ApplyInfo and ApplyInfo[1] then
						--需要判断是否重复发送2次，在发送前需要检查状态是否已经在发送或者审核完成了
						local Status = ApplyInfo[1].Status
						if Status == 2 then --必须是已通过初审状态才可发送奖励
							EmailApplyData:UpdateStatus(ID, 0) -- 修改状态为正在审核发送中
							--发送邮件
							local Flag, ExeResults = self:SendEmail(ID)
							if Flag then
								EmailApplyData:VerifyApply(ID, UserAccount, NowTime, Args.Status)
							else
								EmailApplyData:UpdateStatus(ID, 2) --发放失败，重新修改回状态
							end
						end
					end
				else
					EmailApplyData:VerifyApply(ID, UserAccount, NowTime, Args.Status)
				end
			end
			ngx.say("1")
			return
		end
	end
	ngx.say("2")
end

--发送邮件
function SendEmail(self, ID)
	local ApplyInfo = EmailApplyData:Get({ID = ID})
	local HostResults = {} --初始化结果
	if ApplyInfo and ApplyInfo[1] then
		ApplyInfo = ApplyInfo[1]
		local HostIDs = string.split(ApplyInfo.HostIDs, ",")
		local NHostIDs = {}
		for _, HostID in ipairs(HostIDs) do
			table.insert(NHostIDs, tonumber(HostID))
		end
		local HostList = ServerData:GetServerList(ApplyInfo.ServerType, NHostIDs, ApplyInfo.PlatformID)
		
		for _, HostID in ipairs(HostList) do
			local HostInfo = {HostID = HostID}
			table.insert(HostResults, HostInfo)
		end

		local OperationType = tonumber(ApplyInfo.OperationType)
		local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())

		if OperationType == 1 then
			if ApplyInfo.RoleNames and ApplyInfo.RoleNames ~= "" then
			 	local OperationInfo = GMRuleData:Get({ID = EmailRuleID})
				local Rule = OperationInfo[1].Rule
				local UsersInfo = self:GetUserInfo(ApplyInfo, HostList)
				for _, UidInfo in ipairs(UsersInfo) do
					local GMParams = {UidInfo.Uid, ApplyInfo.Title, ApplyInfo.Content}
					local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
					if not Flag then
						ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
						return false, ExtMsg
					else
						ApplyInfo.HostID = UidInfo.HostID
						local Flag, Result = CommonFunc.ExecuteGM(ApplyInfo, EmailRuleID, GMCMD, OperationTime)
						for _, HostInfo in pairs(HostResults) do
							if ApplyInfo.HostID == HostInfo.HostID then
								HostInfo.Result = Result
								break
							end
						end
					end
				end
			end
		else
			local LimitOptions = {}
			if ApplyInfo.MinLevel and ApplyInfo.MinLevel ~= "" then
				LimitOptions["MinLevel"] = tonumber(ApplyInfo.MinLevel)
			end
			if ApplyInfo.CreateTime and ApplyInfo.CreateTime ~= "" then
				LimitOptions["MinBornTime"] = GetTimeStamp(ApplyInfo.CreateTime .. " 00:00:00")
			end
		
			local OptionStr = Serialize(LimitOptions)
			OptionStr = string.gsub(OptionStr, '"', "'")
		
			local OperationInfo = GMRuleData:Get({ID = NewEmailRuleID})
			local Rule = OperationInfo[1].Rule
			--验证参数
			local GMParams = {ApplyInfo.Title, ApplyInfo.Content, OptionStr}
			local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
			if not Flag then
				ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
				return false, ExtMsg
			else
				for _, HostInfo in ipairs(HostResults) do
					ApplyInfo.HostID = HostInfo.HostID
					local Flag, Result = CommonFunc.ExecuteGM(ApplyInfo, NewEmailRuleID, GMCMD, OperationTime)
					HostInfo.Result = Result
				end
			end 
		end
	end
	--检查发送的每个HostID的结果,同时替换服名称
	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	local Results = {}
	local Flag = true
	if #HostResults == 0 then
		return false, Results --如果为空就直接返回
	end
	for _, HostInfo in ipairs(HostResults) do
		if NewServers[HostInfo.HostID] then
			Results[NewServers[HostInfo.HostID]] = HostInfo.Result
			if HostInfo.Result == "执行失败" then
				Flag = false
			end
		end
	end
	return Flag, Results
end

--获得玩家uid列表
function GetUserInfo(self, Options, HostList)
	local Results = {}
	if Options.RoleNames and Options.RoleNames ~= "" then
		--先查tblUserInfo表获得玩家对应的HostID
		local RoleNames = Options.RoleNames
		RoleNames = string.split(RoleNames, ";")
		local ServerType = Options.ServerType
		local UserOptions = {
			PlatformID = Options.PlatformID,
			HostIDs = table.concat(HostList, "','"),
			Names = table.concat(RoleNames, "','")
		}
		Results = UserInfoData:Get(UserOptions)
	end
	return Results
end


DoRequest()
