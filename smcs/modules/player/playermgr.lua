----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- platform list manager
--
--]]

--玩家查询
function PlayerInfo(self)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	ServerTypes = CommonFunc.GetMulServerTypes()
	Radios = {Translate("根据游戏帐号"), Translate("根据游戏角色名"), Translate("根据平台帐号名"),}
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Select",["Label"] = "选择大区",["Name"] = "ServerType", ["Values"] = ServerTypes},
		{["Type"] = "<br>",},
		{["Type"] = "Host",["Multiple"] = true,},
		{["Type"] = "<br>",},
		{["Type"] = "radio",["Values"] = Radios, ["Name"] = "AccountType",},
		{["Type"] = "<br>",},
		{["Type"] = "text", ["Name"] = "Account", ["Placeholder"] = Translate("此处输入角色名或帐号..."),},
	}
	FilterStyles = {
        ["hostID"] = {["width"] = "600px",}
    }
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local Sexes = {"男","女"}
	--获得提交过来的值
	--展示数据
	Titles = {Translate("平台"), Translate("服"), Translate("游戏账号"), Translate("平台账号"), 
			Translate("角色"), Translate("性别"), Translate("等级"), Translate("VIP等级"),
			Translate("钻石"), Translate("金币"), Translate("封号"),Translate("禁言"),
			Translate("最后登录"),Translate("总在线时长")}
	local UserData = self:GetUserInfo(Options)
	--封装成表格展示的格式
	TableData = {}
	local BanWord = '<font color="red">是</font>'
	for _, Data in ipairs(UserData) do
		local VipLevel = Data.VipMgrObj.__init_args__.VipLevel or 0
		local LoginTime = os.date("%Y-%m-%d %H:%M:%S", tonumber(Data.LoginTime))
		local Hours, Minutes = self:GetTotalOnlineTime(Data.TotalGameTime)
		local BanChat, BanLogin = self:CheckIfBan(Options.PlatformID, tonumber(Data.Uid))
		local CTable = {Translate(PlatformStr), Translate(Servers[Data.HostID] or ""), Data.Uid, Data.URS, Data.Name,Translate(Sexes[Data.Sex]),
		Data.Level, VipLevel, Data.Gold, Data.Money, Translate(BanLogin and BanWord or "否"), Translate(BanChat and BanWord or "否"), 
		LoginTime, Hours .. Translate("小时") .. Minutes .. Translate("分")}
		table.insert(TableData, CTable)
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
		["NoResult"] = Translate("没有该角色或者账号"),
	}
	Viewer:View("template/player/playerInfo.html")
end

function GetUserInfo(self, Options)
	local TableData = {}
	local AccountTypes = {"Uid", "Name", "Urs"}
	if Options.Account and Options.Account ~= "" then
		--先查tblUserInfo表获得玩家对应的HostID
		local ServerType = Options.ServerType
		local HostIDs = Options.HostID
		local HostList = ServerData:GetServerList(ServerType, HostIDs, Options.PlatformID)
		local AccountType = tonumber(Options.AccountType) or 1
		AccountType = AccountTypes[AccountType]
		local UserOptions = {
			PlatformID = Options.PlatformID,
			HostIDs = table.concat(HostList, "','"),
			[AccountType] = Options.Account,
			RawQuery = true,
		}
		local Res = UserInfoData:Get(UserOptions)
		if #Res ~= 0 then
			for _, Info in ipairs(Res) do
				local HostID = Info.HostID
				local Uid = Info.Uid
				local Response = self:RequestUserInfo(HostID, Uid)
				if Response.__init_args__ then
					local Table = Response.__init_args__ 
					Table.HostID = HostID --把HostID也记录进去
					table.insert(TableData, Table)
				end
			end
		end
	end
	return TableData
end

function RequestUserInfo(self, HostID, Uid)
	local RequestType = "getgamefile"
	local FilePath = self:GenerateFilePath(Uid)
	Params = {
		HostID = HostID,
		FilePaths = FilePath,
	}
	local Response = nil
	for X = 1, 3 do --默认调用三次，只要有一次成功则跳出循环
		Flag, Response = ReqCmcsByServerId(tonumber(HostID), RequestType, Params)
		if Flag then
			break
		end
	end
	if Response then
		Response  = UnSerialize(Response) 
		if Response and Response[FilePath] then
			local Content = Response[FilePath]
			return self:ExtractUserInfo(Content)
		end
	end
	return {}	--否则返回为空
end

--生成Uid对应的文件路径
function GenerateFilePath(self, Uid)
	local Uid = tonumber(Uid)
	local UserDir = math.floor(Uid/1000000%100)
	UserDir = string.format("%02d",UserDir)
	local Path = "logic/dat/user/" .. UserDir .."/" .. Uid .. ".dat"
	return Path
end

function ExtractUserInfo(self, Content)
	if not Content then
		return {} --直接返回为空
	end
	local Begin, End = string.find(Content, "\n@\n")
	if not End then
		return {} --没有匹配到，也返回空
	end
	local Data = string.sub(Content, End+1)
	Data  = loadstring("return " .. Data)()
	return Data
end

--返回总在线时长中的小时和分钟
function GetTotalOnlineTime(self, TotalOnlineTime)
	TotalOnlineTime = tonumber(TotalOnlineTime)
	local Hours = 0
	local Minutes = 0
	Hours = math.floor(TotalOnlineTime/3600)
	Minutes = math.ceil((TotalOnlineTime-Hours*3600)/60)
	return Hours, Minutes
end

--通过查询封禁日志来判断该玩家是否被封禁
function CheckIfBan(self, PlatformID, Uid)
	local BanChatEndTime = nil
	local BanLoginEndTime = nil
	local EndlessTime = "2030-01-01 00:00:00"
	--先获得该玩家的所有封禁日志
	local BanRes = BanLogData:Get(PlatformID, {Uid = Uid})
	if BanRes and #BanRes > 0 then
		for _, BanInfo in ipairs(BanRes) do
			if BanInfo.OperationType == 1 then --禁言
				if BanInfo.BanStartTime == BanInfo.BanEndTime then --永久封禁
					BanChatEndTime = EndlessTime
				else
					BanChatEndTime = BanInfo.BanEndTime
				end
			elseif BanInfo.OperationType == 2 then --解除禁言
				BanChatEndTime = nil --清空
			elseif BanInfo.OperationType == 3 then --封号
				if BanInfo.BanStartTime == BanInfo.BanEndTime then --永久封禁
					BanLoginEndTime = EndlessTime
				else
					BanLoginEndTime = BanInfo.BanEndTime
				end
			elseif BanInfo.OperationType == 4 then --解除封号
				BanLoginEndTime = nil --清空
			end
		end
	end
	local BanChat = false
	local BanLogin = false
	local NowTime = os.time()
	if BanChatEndTime then
		BanChatEndTime = GetTimeStamp(BanChatEndTime)
		if NowTime < BanChatEndTime then
			BanChat = true
		end
	end
	if BanLoginEndTime then
		BanLoginEndTime = GetTimeStamp(BanLoginEndTime)
		if NowTime < BanLoginEndTime then
			BanLogin = true
		end
	end
	return BanChat, BanLogin
end

DoRequest()
