----------------------------------------
--$Id: itemmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 道具发放
--]]

OperationTypes = {"道具发送", "道具群发", "道具扣除"}
local SendItemID = 11 --GM 指令ID
local SendAllItemID = 17
local DelItemID = 12 --删除道具GM指令ID
local MessageID = 1113 --对应到消息配置表中消息ID
local ReplaceArray = {[";"]="^^" ,[","] = "@@"} --标题和内容中需要替换的字符串



--道具操作
function ItemShow(self, PlatformID, Results)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	Options.PlatformID = Options.PlatformID or PlatformID
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	ServerTypes = CommonFunc.GetMulServerTypes()
	ItemStrList = {}
	for ItemID, ItemName in pairs(ItemDataMap or {}) do
		table.insert(ItemStrList, "'" .. ItemName .. "_" .. ItemID .. "'")
	end
	DeductItemTypes = {Translate("背包"),Translate("身上")}
	--展示数据
	Titles = {Translate("平台"), Translate("服"), Translate("账号"), Translate("角色"), Translate("执行结果"), }
	local PlatformStr = PlatformID and Platforms[PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	for _, Result in ipairs(Results or {}) do
		local CTable = {PlatformStr, SeverMap[Result.HostID] or "", Result.Uid or "", Result.Name or "", Result.Result or "执行失败"}
		table.insert(TableData, CTable)
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	JsonMail = json.encode(CommonData.MAIL_LANGUAGES)
	Viewer:View("template/player/itemShow.html")
end

--道具操作提交
function DoItem(self)
	local Results = {}
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local OperationType = tonumber(Args.OperationType)
		if OperationTypes[OperationType] == "道具发送" then
			self:SendItem(Args)
		elseif OperationTypes[OperationType] == "道具群发" then
			self:SendAllItem(Args)
		elseif OperationTypes[OperationType] == "道具扣除" then
			self:DelItem(Args)
		end
	end
end

--道具发送
function SendItem(self, Options)
	local RoleName = Options.RoleName
	local UserList = {}
	if RoleName and RoleName ~= "" then
		local RoleNames = string.split(RoleName, ";")
		--先查tblUserInfo表获得玩家对应的HostID
		local ServerType = Options.ServerType
		local HostIDs = Options.HostID
		local HostList = ServerData:GetServerList(ServerType, HostIDs, Options.PlatformID)
		local UserOptions = {
			PlatformID = Options.PlatformID,
			Names = table.concat(RoleNames, "','"),
			HostIDs = table.concat(HostList, "','"),
		}
		UserList = UserInfoData:Get(UserOptions)
		self:ExecuteGM(SendItemID, Options, UserList)
	end
	self:ItemShow(Options.PlatformID, UserList)
end

--群发道具
--20150316:改成调用道具群发补偿模块
function SendAllItem(self, Options)
	local LimitOptions = {}
	if Options.MinLevel and Options.MinLevel ~= "" then
		LimitOptions["MinLevel"] = Options.MinLevel
	end
	if Options.CreateTime and Options.CreateTime ~= "" then
		LimitOptions["MinBornTime"] = GetTimeStamp(Options.CreateTime .. " 00:00:00")
	end
	local OptionStr = Serialize(LimitOptions)
	OptionStr = string.gsub(OptionStr, '"', "'")
	--获得奖励列表
	local Items = self:GetItems4SendAllItem(Options)
	--加上钻石
	if Options.Gold and tonumber(Options.Gold) then
		local GoldInfo = {Type=CommonData.mBONUS_GOLD, SubType=0, Amount=tonumber(Options.Gold)}
		table.insert(Items, GoldInfo)
	end
	--绑钻
	if Options.CreditGold and tonumber(Options.CreditGold)then
		local CreditGoldInfo = {Type=CommonData.mBONUS_CREDITGOLD, SubType=0, Amount=tonumber(Options.CreditGold)}
		table.insert(Items, CreditGoldInfo)
	end
	--金币
	if Options.Money and tonumber(Options.Money) then
		local MoneyInfo = {Type=CommonData.mBONUS_MONEY, SubType=0, Amount=tonumber(Options.Money)}
		table.insert(Items, MoneyInfo)
	end
	local ItemStr = Serialize(Items)
	ItemStr = string.gsub(ItemStr, '"', "'")
	--执行GM指令,先获得服列表
	Options.HostID = type(Options.HostID) == "table" and table.concat(Options.HostID, ",") or Options.HostID
	Options.HostID = Options.HostID or ""
	local HostIDs = string.split(Options.HostID, ",")
	local HostList = ServerData:GetServerList(Options.ServerType, HostIDs, Options.PlatformID)
	local HostResults = {} --初始化结果
	for _, HostID in ipairs(HostList) do
		local HostInfo = {HostID = HostID}
		table.insert(HostResults, HostInfo)
	end
	--发送邮件
	local OperationInfo = GMRuleData:Get({ID = SendAllItemID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local Title = self:ReplaceStr(Options.Title)
	local Content = self:ReplaceStr(Options.Content)
	--验证参数
	local GMParams = {MessageID, Title, Content, ItemStr, OptionStr} 
	local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
	if not Flag then
		ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
		self:ItemShow(Options.PlatformID, HostResults) --展示结果
		return
	else
		for _, HostInfo in ipairs(HostResults) do
			Options.HostID = HostInfo.HostID
			local Flag, Result = CommonFunc.ExecuteGM(Options, SendAllItemID, GMCMD, OperationTime)
			HostInfo.Result = Result
		end
	end 
	self:ItemShow(Options.PlatformID, HostResults)
end

--道具扣除
function DelItem(self, Options)
	local RoleName = Options.MinusRoleName
	local DeductType = Options.DeductItemType
	local UserList = {}
	if RoleName and RoleName ~= "" then
		local RoleNames = string.split(RoleName, ";")
		--先查tblUserInfo表获得玩家对应的HostID
		local ServerType = Options.ServerType
		local HostIDs = Options.HostID
		local HostList = ServerData:GetServerList(ServerType, HostIDs, Options.PlatformID)
		local UserOptions = {
			PlatformID = Options.PlatformID,
			Names = table.concat(RoleNames, "','"),
			HostIDs = table.concat(HostList, "','"),
		}
		UserList = UserInfoData:Get(UserOptions)
		self:ExecteDelGM(Options, UserList)
	end
	self:ItemShow(Options.PlatformID, UserList)
end

function ExecteDelGM(self, Options, UserList)
	--获得GM指令
	local OperationInfo = GMRuleData:Get({ID = DelItemID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local DeductItemType = Options.DeductItemType
	local ItemID = Options.MinusItem
	ItemID = self:GetItemID(ItemID)
	if ItemID ~= "" and tonumber(ItemID) then
		local Number = Options.MinusNumbers
		for _, UidInfo in ipairs(UserList) do
			--验证参数
			local GMParams = {UidInfo.Uid, DeductItemType, ItemID, Number, "smcs_GM删除"} 
			local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
			if not Flag then
				ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
				return UserList
			else
				--执行GM指令
				Options.HostID = UidInfo.HostID
				local Flag, Result = CommonFunc.ExecuteGM(Options, DelItemID, GMCMD, OperationTime)
				UidInfo.Result = Result
			end
		end
	end
	return UserList
end

--执行GM指令
function ExecuteGM(self, GMID, Options, UserList)
	--获得GM指令
	local OperationInfo = GMRuleData:Get({ID = GMID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local Title = Options.Title
	local Content = Options.Content
	Title = string.gsub(Title, ",", "，")
	Content = string.gsub(Content, ",", "，")
	local ItemStr = self:GetItems(Options)
	local Gold = Options.Gold and tonumber(Options.Gold) or 0
	local CreditGold = Options.CreditGold and tonumber(Options.CreditGold) or 0
	local Money = Options.Money and tonumber(Options.Money) or 0 
	ItemStr = Money .. "," .. Gold .. "," .. CreditGold .. "," .. ItemStr
	for _, UidInfo in ipairs(UserList) do
		--验证参数
		local GMParams = {UidInfo.Uid, MessageID, Title, Content, ItemStr}
		local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
		if not Flag then
			ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
			return UserList
		else
			--执行GM指令
			Options.HostID = UidInfo.HostID
			local Flag, Result = CommonFunc.ExecuteGM(Options, GMID, GMCMD, OperationTime)
			UidInfo.Result = Result
		end 
	end
	return UserList
end

--获得道具并且组装成字符串,ItemID,Num,ItemID,Num
function GetItems(self, Options)
	--获得道具
	local Items = Options.Item
	local Numbers = Options.Numbers
	--拼接成字符串
	local ItemList = {}
	if type(Items) == "table" then
		for Idx, ItemID in ipairs(Items) do
			ItemID = self:GetItemID(ItemID)
			if ItemID ~= "" and tonumber(ItemID) then
				ItemID = tonumber(ItemID)
				local Number = tonumber(Numbers[Idx]) or 1
				table.insert(ItemList, ItemID)
				table.insert(ItemList, Number)
			end
		end
	else
		local Items = self:GetItemID(Items)
		table.insert(ItemList, Items)
		table.insert(ItemList, Numbers or 1)
	end
	local ItemStr = table.concat(ItemList, ",")
	return ItemStr
end

--封装群发道具操作时的道具列表
function GetItems4SendAllItem(self, Options)
	--获得道具
	local Items = Options.Item
	local Numbers = Options.Numbers
	--拼接成字符串
	local ItemList = {}
	if type(Items) == "table" then
		for Idx, ItemID in ipairs(Items) do
			ItemID = self:GetItemID(ItemID)
			if ItemID ~= "" and tonumber(ItemID) then
				ItemID = tonumber(ItemID)
				local Number = tonumber(Numbers[Idx]) or 1
				local ItemInfo = {Type=CommonData.mBONUS_ITEM, SubType=ItemID, Amount=Number}
				table.insert(ItemList, ItemInfo)
			end
		end
	else
		local Items = self:GetItemID(Items)
		if Items ~= "" and tonumber(Items) then 
			local ItemInfo = {Type=CommonData.mBONUS_ITEM, SubType=tonumber(Items), Amount=tonumber(Numbers) or 1}
			table.insert(ItemList, ItemInfo)
		end
	end
	return ItemList
end


--过滤掉逗号和分号字符串
function ReplaceStr(self, Str)
	for Old, New  in pairs(ReplaceArray) do
		Str = string.gsub(Str, Old, New)
	end
	return Str
end

--获得ItemID
function GetItemID(self, ItemStr)
	local Array = string.split(ItemStr, "_")
	if #Array >= 2 then
		return Array[2]
	else
		return Array[1]
	end
end

DoRequest()
