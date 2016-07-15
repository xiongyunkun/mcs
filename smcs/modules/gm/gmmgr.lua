----------------------------------------
--$Id: gmmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- gm manager
--
--]]


--GM指令列表
function ReqRuleList(self)
	Name = GetQueryArg("Name") or ""
	RuleList = GMRuleData:Get({Name = Name})
	Viewer:View("template/gm/rulelist.html")
end

function TasLost()
	local Sql = "select Uid,Name,Urs,Level,TotalOnlineTime,LastLoginTime,LastLogoutTime from test_statics.tblUserInfo where HostID = '1002' and LastLogoutTime <= '2016-06-01 00:00:00' and Level <= '35'"
	local Res, Err = DB:ExeSql(Sql)
	local Results = {}
	for _, Info in ipairs(Res) do
		local Uid = Info.Uid
		local LastLogoutTimes = string.split(Info.LastLogoutTime, " ")
		local LastLogoutDate = LastLogoutTimes[1]
		LastLogoutDate = string.gsub(LastLogoutDate, "-", "")
		local Where = " where TaskType = '1' and Uid = '" .. Uid .. "' order by ID desc limit 1"
		local TaskSql = "select Task,TaskType from test_log.tblTaskLog_" .. LastLogoutDate .. Where
		local TaskRes, TaskErr = DB:ExeSql(TaskSql)
		if TaskRes and TaskRes[1] then
			Info.TaskID = TaskRes[1].Task
			Info.TaskType = TaskRes[1].TaskType == 1 and "接受任务" or "完成任务"
		end
		local Result = {Info.Uid, Info.Name, Info.Urs, Info.Level, Info.TotalOnlineTime, 
			Info.LastLogoutTime, Info.TaskID, Info.TaskType}
		table.insert(Results, Result)
	end
	local Titles = {"Uid", "角色名", "Urs", "等级", "总在线时长(秒)","最后退出时间", "最后任务ID","任务类型"}
	local ExcelStr = CommonFunc.ExportExcel("任务流失.xls", Titles, Results)
	ngx.print(ExcelStr)
	
end

--GM指令编辑
function RuleEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		if not Args.ID or Args.ID == "" then
			GMRuleData:Insert(Args)
			ExtMsg = "添加成功！"
		else
			GMRuleData:Update(Args)
			ExtMsg = "更新成功！"
		end
		
		self:ReqRuleList()
	else
		ID = GetQueryArg("ID")
		RuleInfo = {}
		if ID and ID ~= "" then
			local Res = GMRuleData:Get({ID = ID})
			if Res and Res[1] then
				RuleInfo = Res[1]
			end
		end
		Viewer:View("template/gm/ruleedit.html")
	end
end

--GM指令删除
function RuleDelete(self)
	local Args = GetPostArgs()
	local ID = Args.ID
	if ngx.var.request_method == "POST" then
		local Res, Err = GMRuleData:Delete(ID)
		if not Err then
			ngx.say("1")
		else
			ngx.say("0")
		end
	end
end

--GM操作列表
function GMOperationList(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	OperationInfoList = GMOperationData:Get(Options)
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {}
	for _, Platform in ipairs(PlatformList) do
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	--获得服务器列表
	Servers = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(Servers) do
		NewServers[Server.hostid] = Server.name
	end
	Servers = NewServers
	-- 获得指令列表
	local RuleInfo = GMRuleData:Get()
	RuleList = {}
	for _, Rule in ipairs(RuleInfo) do
		RuleList[Rule.ID] = Rule.Name
	end
	--操作人员列表
	local UserInfo = UserData:Get()
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	--新增相关展示值
	for _, OperationInfo in ipairs(OperationInfoList) do
		local HostIDs = string.split(OperationInfo["HostIDs"], ",")
		local ServerNames = {}
		for _, HostID in ipairs(HostIDs) do
			local ServerName = Servers[tonumber(HostID)] or HostID
			table.insert(ServerNames, ServerName)
		end
		OperationInfo.ServerNames = table.concat(ServerNames, ",")
	end
	Viewer:View("template/gm/operationlist.html")
end
--GM操作编辑
function GMOperationEdit(self)
	ID = GetQueryArg("ID") or ""
	PlatformID = GetQueryArg("PlatformID") or ""
	OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	if ID and ID ~= "" then
		OperationInfo = GMOperationData:Get({ID = ID})
		if OperationInfo and OperationInfo[1] then
			OperationInfo = OperationInfo[1]
			--构造HostID数组
			if OperationInfo["HostIDs"] then
				local HostIDs = string.split(OperationInfo["HostIDs"], ",")
				local NewHosts = {}
				for _, HostID in ipairs(HostIDs) do
					NewHosts[HostID] = true
				end
				OperationInfo["HostIDs"] = NewHosts
			end
			PlatformID = OperationInfo.PlatformID -- PlatformID重新赋值
			OperationTime = OperationInfo.OperationTime
		end
	end
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {}
	for _, Platform in ipairs(PlatformList) do
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	-- 获得服务器列表
	local Options = {}
	if PlatformID and PlatformID ~= "" then
		Options["platformid"] = PlatformID
	end 
	-- 获得指令列表
	local RuleInfo = GMRuleData:Get()
	RuleList = {}
	for _, Rule in ipairs(RuleInfo) do
		RuleList[Rule.ID] = Rule
	end
	Servers = ServerData:GetServer(Options)
	
	Viewer:View("template/gm/operationedit.html")
end
--GM操作提交
function GMOperationPost(self)
	local Args = GetPostArgs()
	local User = UserData:GetUserById(GetSession("UserId"))
	Args.Operator = User and User["account"] or ""
	local ID = Args.ID
	if Args.ID and Args.ID ~= "" then
		GMOperationData:Update(Args)  --更新操作
	else
		ID = GMOperationData:Insert(Args)  --直接插入
	end
	self:GMPreviewView(ID)
end
--GM操作预览
function GMOperationPreview(self)
	ID = GetQueryArg("ID") or ""
	self:GMPreviewView(ID)
end

function GMPreviewView(self, ID)
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {}
	for _, Platform in ipairs(PlatformList) do
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	-- 获得服名称列表
	Servers = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(Servers) do
		NewServers[Server.hostid] = Server.name
	end
	Servers = NewServers
	-- 获得指令列表
	local RuleInfo = GMRuleData:Get()
	RuleList = {}
	for _, Rule in ipairs(RuleInfo) do
		RuleList[Rule.ID] = Rule
	end
	GMCMD = ""
	OperationInfo = GMOperationData:Get({ID = ID})
	if OperationInfo and OperationInfo[1] then
		OperationInfo = OperationInfo[1]
		--替换平台名称
		OperationInfo.PlatformName = Platforms[OperationInfo.PlatformID] or OperationInfo.PlatformID
		--把服名字也替换进去
		local HostIDs = string.split(OperationInfo["HostIDs"], ",")
		local ServerNames = {}
		for _, HostID in ipairs(HostIDs) do
			local ServerName = Servers[tonumber(HostID)] or HostID
			table.insert(ServerNames, ServerName)
		end
		OperationInfo.ServerNames = table.concat(ServerNames, ",")
		--GM命令
		if OperationInfo.RuleID and RuleList[OperationInfo.RuleID] and OperationInfo.GMValues then
			local GMValues = string.split(OperationInfo.GMValues)
			local Func = function() GMCMD = string.format(RuleList[OperationInfo.RuleID].Rule, unpack(GMValues)) end
			local Succed, Err = xpcall(Func, debug.traceback)
			if not Succed then
				ExtMsg = "GM参数错误，请重新填写,Err:"..tostring(Err)
			end
		end
		Viewer:View("template/gm/operation_preview.html")
	end

end

--处理预览提交的内容
function GMPreviewPost(self)
	local Args = GetPostArgs()
	
	local OperationInfo = GMOperationData:Get({ID = Args.ID})
	if not OperationInfo or not OperationInfo[1] then
		return 
	end
	OperationInfo = OperationInfo[1]
	--判断执行时间是不是比当前时间晚，如果晚则挂起等待执行结果
	local OperationTime = GetTimeStamp(OperationInfo.OperationTime)
	local IsPend = ""
	if OperationTime < os.time() then
		IsPend = "true"
	end
	local Results = {}
	local HostIDs = string.split(OperationInfo.HostIDs, ",")
	local Status = IsPend == "true" and 2 or 1 --执行状态，如果是立即执行默认是已执行，否则是未执行
	for _, HostID in ipairs(HostIDs) do
		local ShellValues = {HostID, OperationInfo.GsID, '"' .. Args.CmdValue .. '"', "'" .. OperationInfo.OperationTime .. "'", OperationInfo.TransID}
		ShellValues = table.concat(ShellValues, " ")
		local Params = {
			shellname = CommonData.ShellMap[4],
			shellparam = ShellValues,
			IsPend = IsPend,
		}
		local Flag = nil
		local Response = nil
		for X = 1, 3 do --默认调用三次，只要有一次成功则跳出循环
			Flag, Response = ReqCmcsByServerId(tonumber(HostID), "executegm", Params)
			if Flag then
				break
			end
		end
		Results[HostID] = Response
		if not Flag then
			Status = 0 --回退到已编辑状态
			break
		end
	end
	--提交对应的服务器
	GMOperationData:UpdateStatus(Args.ID,Status) --将状态更新为提交服务器
	--将结果记录入库
	GMOperationData:UpdateResult(Args.ID, Serialize(Results))
	self:GMOperationList()
end

function GMOperationResult(self)
	ID = GetQueryArg("ID") or ""
	local OperationInfo = GMOperationData:Get({ID = ID})
	if not OperationInfo or not OperationInfo[1] then
		return 
	end
	OperationInfo = OperationInfo[1]
	Result = OperationInfo["Result"]
	-- 将换行符替换成<br>
	Result = string.gsub(Result,"\n","<br>")
	Result = string.gsub(Result,"\r","<br>")
	Viewer:View("template/gm/operation_result.html")
end

function GMOperationDelete(self)
	local Args = GetPostArgs()
	if Args.ID and Args.ID ~= "" then
		GMOperationData:Delete(Args.ID)
	end
	ngx.say("1")
end

DoRequest()
