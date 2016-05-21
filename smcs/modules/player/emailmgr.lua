----------------------------------------
--$Id: emailmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 邮件发送管理
--
--]]

local MessageID = 1112 --对应到消息配置表中消息ID
local EmailRuleID = 7 --GM指令中发送邮件ID
local NewEmailRuleID = 16
local ReplaceArray = {[";"]="^^" ,[","] = "@@"} --标题和内容中需要替换的字符串

--邮件发送展示
function EmailShow(self, PlatformID, Results)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	ServerTypes = CommonFunc.GetMulServerTypes()
	OperationTypes = {"单独发送", "群发邮件"}
	--展示数据
	Titles = {"平台", "服", "执行结果", }
	local PlatformStr = PlatformID and Platforms[PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	for _, Result in ipairs(Results or {}) do
		local CTable = {PlatformStr, SeverMap[Result.HostID] or "", Result.Result or "执行失败"}
		table.insert(TableData, CTable)
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	JsonMail = json.encode(CommonData.MAIL_LANGUAGES)
	Viewer:View("template/player/emailShow.html")
end

function DoSendEmail(self)
	local Results = {}
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local OperationType = tonumber(Args.OperationType)
		local LimitOptions = {}
		if OperationType == 1 then --单独发送
			if Args.RoleName and Args.RoleName ~= "" then
				local RoleName = Args.RoleName
				local RoleNames = string.split(RoleName, ";")
				LimitOptions["InNames"] = table.concat(RoleNames, ",")
			end
		else
			if Args.MinLevel and Args.MinLevel ~= "" then
				LimitOptions["MinLevel"] = Args.MinLevel
			end
			if Args.CreateTime and Args.CreateTime ~= "" then
				LimitOptions["MinBornTime"] = GetTimeStamp(Args.CreateTime .. " 00:00:00")
			end
		end
		local OptionStr = Serialize(LimitOptions)
		OptionStr = string.gsub(OptionStr, '"', "'")
		--执行GM指令,先获得服列表
		Args.HostIDs = type(Args.HostIDs) == "table" and table.concat(Args.HostIDs, ",") or Args.HostIDs
		Args.HostIDs = Args.HostIDs or ""
		local HostIDs = string.split(Args.HostIDs, ",")
		local HostList = ServerData:GetServerList(Args.ServerType, HostIDs, Args.PlatformID)
		local HostResults = {} --初始化结果
		for _, HostID in ipairs(HostList) do
			local HostInfo = {HostID = HostID}
			table.insert(HostResults, HostInfo)
		end
		--发送邮件
		local OperationInfo = GMRuleData:Get({ID = NewEmailRuleID})
		local Rule = OperationInfo[1].Rule
		local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
		--验证参数
		local Title = self:ReplaceStr(Args.Title)
		local Content = self:ReplaceStr(Args.Content)
		local GMParams = {MessageID, Title, Content, OptionStr}
		local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
		if not Flag then
			ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
			self:EmailShow(Args.PlatformID, HostResults) --展示结果
			return
		else
			for _, HostInfo in ipairs(HostResults) do
				Args.HostID = HostInfo.HostID
				local Flag, Result = CommonFunc.ExecuteGM(Args, NewEmailRuleID, GMCMD, OperationTime)
				HostInfo.Result = Result
			end
		end 
		self:EmailShow(Args.PlatformID, HostResults) --展示结果
	end
end 

--过滤掉逗号和分号字符串
function ReplaceStr(self, Str)
	for Old, New  in pairs(ReplaceArray) do
		Str = string.gsub(Str, Old, New)
	end
	return Str
end

DoRequest()
