----------------------------------------
--$Id: item_apply_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 返利道具申请相关逻辑
--
--]]

local SendAllItemID = 17
local MessageID = 1113 --对应到消息配置表中消息ID
local ReplaceArray = {[";"]="^^" ,[","] = "@@"} --标题和内容中需要替换的字符串
local EmailTitle = "GM奖励邮件"
local EmailContent = "感谢您的支持，本邮件为GM发送的奖励邮件！"

function ApplyList(self, ErrMsg)
	local ExtMsg = ErrMsg
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	Options.RoleName = Options.RoleName or ""
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)

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
	local Titles = {"申请时间", "平台", "服", "角色列表", "道具列表", "申请原因"}
	local User = UserData:GetUserById(GetSession("UserId"))
	local UserAccount = User and User["account"]
	if not UserAccount then 
		return
	end
	Options.Applicant = UserAccount
	local ApplyList = ItemApplyData:Get(Options)
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
	--物品列表
	local ItemStrList = {}
	for ItemID, ItemName in pairs(ItemDataMap or {}) do
		table.insert(ItemStrList, "'" .. ItemName .. "_" .. ItemID .. "'")
	end
	--钻石、绑钻、金钱都加入到物品列表里面来
	for BonusName, _ in pairs(CommonData.mBONUS_MAP) do
		table.insert(ItemStrList, "'" .. BonusName .. "'")
	end
	
	for _, ApplyInfo in ipairs(ApplyList or {}) do
		local Data = {}
		Data.ID = ApplyInfo.ID
		table.insert(Data, ApplyInfo.SubmitTime)
		table.insert(Data, ApplyInfo.PlatformID and Platforms[ApplyInfo.PlatformID] or "all") --平台
		Data.PlatformID = ApplyInfo.PlatformID
		local HostIDs = string.split(ApplyInfo.HostIDs, ",")
		local HostNames = {}
		for _, HostID in ipairs(HostIDs) do
			if ServerList[tonumber(HostID)] then
				table.insert(HostNames, ServerList[tonumber(HostID)])
			end
		end
		table.insert(Data, table.concat(HostNames, ","))
		table.insert(Data, ApplyInfo.RoleNames)
		
		local Rewards = self:GetRewards4Show(ApplyInfo)
		table.insert(Data, Rewards)
		table.insert(Data, ApplyInfo.Reason)
		
		if ApplyInfo.Status == 1 then
			local Url = '<a href="#" class="apply_delete">删除</a>'
			table.insert(Data, Url)
			table.insert(AuditingList, Data)
		else
			table.insert(Data, ApplyInfo.AuditTime)
			table.insert(Data, UserMap[ApplyInfo.Auditor] or ApplyInfo.Auditor)
			table.insert(Data, ApplyInfo.Status == 2 and '<font color="blue">同意<font>' or '<font color="red">拒绝<font>')
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
		Filters = Filters,
		TableData = TableData,
		Titles = Titles,
		DataTable = DataTable,
		Users = Users,
		ExtMsg = ExtMsg,
		AuditingList = AuditingList,
		AuditedList = AuditedList,
		ApplyInfo = ApplyInfo,
		ItemStrList = ItemStrList,
	}
	Viewer:View("template/game/item_apply_list.html", Params)
end

function ApplyEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		--先判断这个表单是否已经被审核了
		if Args.ID and Args.ID ~= "" then
			local AuditFlag, Status = ItemApplyData:CheckIsAudited(Args.ID)
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
		local Item= Args.Item
		local Numbers = Args.Numbers
		local Items = {}
		if type(Item) == "table" then
			for ID, ItemName in ipairs(Item) do
				local Number = tonumber(Numbers[ID]) or 1
				Items[ItemName] = Number
			end
		else
			Items[Item] = tonumber(Numbers) or 1
		end
		Args.Items = Serialize(Items)
		local NowTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
		Args.SubmitTime = NowTime
		Args.LastUpdateTime = NowTime
		ItemApplyData:Insert(Args)
		self:ApplyList()
	end
end

--删除申请
function ApplyDelete(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		if Args.ID and Args.ID ~= "" then
			ItemApplyData:Delete(Args.ID)
		end
		ngx.say("1")
	end
end

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
	local Titles = {"申请时间", "平台", "服", "角色列表", "道具列表", "申请人", "申请原因"}
	local ApplyList = ItemApplyData:Get(Options)
	
	local TableData = {}
	local AuditingList = {}
	local AuditedList = {}
	for _, ApplyInfo in ipairs(ApplyList or {}) do
		local Data = {}
		table.insert(Data, ApplyInfo.SubmitTime)
		Data.ID = ApplyInfo.ID
		Data.LastUpdateTime = ApplyInfo.LastUpdateTime
		table.insert(Data, ApplyInfo.PlatformID and Platforms[ApplyInfo.PlatformID] or "all") --平台
		local HostIDs = string.split(ApplyInfo.HostIDs, ",")
		local HostNames = {}
		for _, HostID in ipairs(HostIDs) do
			if ServerList[tonumber(HostID)] then
				table.insert(HostNames, ServerList[tonumber(HostID)])
			end
		end
		table.insert(Data, table.concat(HostNames, ","))
		table.insert(Data, ApplyInfo.RoleNames)
		local Rewards = self:GetRewards4Show(ApplyInfo)
		table.insert(Data, Rewards)
		table.insert(Data, UserMap[ApplyInfo.Applicant] or ApplyInfo.Applicant)
		table.insert(Data, ApplyInfo.Reason)
		
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
			table.insert(Data, ApplyInfo.Status == 2 and '<font color="blue">同意<font>' or '<font color="red">拒绝<font>')
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
		Filters = Filters,
		TableData = TableData,
		Titles = Titles,
		DataTable = DataTable,
		Users = Users,
		ExtMsg = ExtMsg,
		AuditingList = AuditingList,
		AuditedList = AuditedList,
		ApplyInfo = ApplyInfo,
		ItemStrList = ItemStrList,
	}
	Viewer:View("template/game/item_audit_list.html", Params)
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
			local IDs = string.split(Args.ID, ",");
			local UpdateTimes = string.split(Args.updateTime, ",");
			for Index, ID in ipairs(IDs) do
				--先比对最近修改时间
				local LastUpdateTime = UpdateTimes[Index]
				if LastUpdateTime then
					local ModifyFlag = ItemApplyData:CheckIsModified(ID, LastUpdateTime)
					if ModifyFlag then
						ngx.say("2")
						return
					end
				end
				if tonumber(Args.Status) == 2 then --同意申请，需要发送奖励
					local ApplyInfo = ItemApplyData:Get({ID = ID})
					if ApplyInfo and ApplyInfo[1] then
						--需要判断是否重复发送2次，在发送前需要检查状态是否已经在发送或者审核完成了
						local Status = ApplyInfo[1].Status
						if Status == 1 or Status == 4 then --未审核状态或者审核中
							ItemApplyData:UpdateStatus(ID, 4) -- 修改状态为正在审核发送中
							local Flag = self:SendRewards(ApplyInfo[1])
							if Flag then
								ItemApplyData:VerifyApply(ID, UserAccount, NowTime, Args.Status)
							else
								ItemApplyData:UpdateStatus(ID, 1) --发放失败，重新修改回状态
							end
						end
					end
				else
					ItemApplyData:VerifyApply(ID, UserAccount, NowTime, Args.Status)
				end
			end
			ngx.say("1")
			return
		end
	end
	ngx.say("2")
end

function SendRewards(self, ApplyInfo)
	local HostIDs = string.split(ApplyInfo.HostIDs, ",")
	--发送邮件
	local OperationInfo = GMRuleData:Get({ID = SendAllItemID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	local Title = self:ReplaceStr(EmailTitle)
	local Content = self:ReplaceStr(EmailContent)
	--获得名单
	local RoleNames = ApplyInfo.RoleNames
	RoleNames = string.gsub(RoleNames, "；", ";") --替换中文的分号
	RoleNames = string.split(RoleNames, ";")
	local NewRoleNames = {}
	for _, RoleName in ipairs(RoleNames) do
		RoleName = string.strip(RoleName)
		table.insert(NewRoleNames, RoleName)
	end
	
	local LimitOptions = {["InNames"] = NewRoleNames}
	local OptionStr = Serialize(LimitOptions)
	OptionStr = string.gsub(OptionStr, '"', "'")
	local RewardStr = self:GetRewards(ApplyInfo)

	--验证参数
	local GMParams = {Title, Content, RewardStr, OptionStr} 
	local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
	if not Flag then
		ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
		return false, ExtMsg
	else
		for _, HostID in ipairs(HostIDs) do
			ApplyInfo.HostID = tonumber(HostID)
			local Flag, Result = CommonFunc.ExecuteGM(ApplyInfo, SendAllItemID, GMCMD, OperationTime)
			if not Flag then
				return Flag
			end
		end
	end 
	return true
end

function GetRewards(self, ApplyInfo)
	local Rewards = {}
	if ApplyInfo.Items and ApplyInfo.Items ~= "" then
		local Items = UnSerialize(ApplyInfo.Items)
		Rewards[1] = 0
		Rewards[2] = 0
		for ItemName, Amount in pairs(Items) do
			--判断是否是钻石绑钻之类
			if CommonData.mBONUS_MAP[ItemName] == "金币" then
				Rewards[1] = tonumber(Amount) or 1
			elseif CommonData.mBONUS_MAP[ItemName] == "钻石" then
				Rewards[2] = tonumber(Amount) or 1
			else --否则都是物品
				local ItemNames = string.split(ItemName, "_")
				if #ItemNames == 2 then
					local ItemInfo = {Type=CommonData.mBONUS_ITEM, SubType=tonumber(ItemNames[2]), Amount=tonumber(Amount) or 1}
					table.insert(Rewards, tonumber(ItemNames[2]))
					table.insert(Rewards, tonumber(Amount) or 1)
				end
			end
		end
	end
--	local RewardStr = Serialize(Rewards)
--	RewardStr = string.gsub(RewardStr, '"', "'")
	RewardStr = table.concat(Rewards, ",")
	return RewardStr
end

--过滤掉逗号和分号字符串
function ReplaceStr(self, Str)
	for Old, New  in pairs(ReplaceArray) do
		Str = string.gsub(Str, Old, New)
	end
	return Str
end

--生成表格中展示奖励列表的字符串样式
function GetRewards4Show(self, ApplyInfo)
	local Rewards = {}
	if ApplyInfo.Items ~= "" then
		local Items = UnSerialize(ApplyInfo.Items)
		for ItemName, Amount in pairs(Items) do
			Rewards[ItemName] = Amount
		end
	end
	local RewardStr = Serialize(Rewards)
	RewardStr = string.gsub(RewardStr, ",", "<br>")
	RewardStr = string.sub(RewardStr, 2, string.len(RewardStr) - 1)
	return RewardStr
end

DoRequest()
