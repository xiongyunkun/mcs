----------------------------------------
--$Id: croservermgr.lua 21449 2014-10-22 06:46:41Z xiongyunkun $
----------------------------------------
--[[
-- 服务器操作管理
--
--]]

--操作类型
OperationTypes = {
	"发布更新",
	"开服",
	"关服",
}

--执行结果
OperationResults = {
	[0] = "未执行",
	[1] = "已执行",
}

--时间类型
TimeTypes = {
	"定时执行",
	"立即执行",
}

function OperationList(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	OperationInfoList = ServerOperationData:Get(Options)
	--获得平台列表
	local PlatformList = PlatformData:GetPlatform()
	Platforms = {}
	for _, Platform in ipairs(PlatformList) do
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	--获得服务器列表
	local ServerOptions = {}
	if Options.PlatformID and Options.PlatformID ~= "" then
		ServerOptions = {PlatformID = Options.PlatformID}
	end
	Servers = ServerData:GetServer(ServerOptions)
	local NewServers = {}
	for _, Server in ipairs(Servers) do
		NewServers[Server.hostid] = Server.name
	end
	Servers = NewServers
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
	Viewer:View("template/server/operationlist.html")
end

function Edit(self)
	ID = GetQueryArg("ID") or ""
	PlatformID = GetQueryArg("PlatformID") or ""
	OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	if ID and ID ~= "" then
		OperationInfo = ServerOperationData:Get({ID = ID})
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
	Servers = ServerData:GetServer(Options)
	
	Viewer:View("template/server/operationedit.html")
	 
end

function EditPost(self)
	local Args = GetPostArgs()
	if type(Args.HostIDs) ~= "string" then
		Args.HostIDs = table.concat(Args.HostIDs, ",")
	end
	if Args.TimeType == "2" then
		--立即执行的话执行时间就是当前时间
		Args.OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	end
	local User = UserData:GetUserById(GetSession("UserId"))
	Args.Operator = User and User["account"] or ""
	Args.IsOperated = "0"
	local ID = ServerOperationData:Insert(Args)
	--如果是立即执行则调用接口
	if Args.TimeType == "2" then
		local Results = {}
		local HostIDs = string.split(Args.HostIDs, ",")
		for _, HostID in ipairs(HostIDs) do
			local Params = {
				shellname = CommonData.ShellMap[tonumber(Args.OperationType)],
				shellparam = HostID,
			}
			local Flag, Response = ReqCmcsByServerId(tonumber(HostID), "execute", Params)
			Results[HostID] = Response
		end
		--记录入库，更新执行状态
		ServerOperationData:UpdateLog(ID, Serialize(Results))
	end
	self:OperationList()
end

function ShowLog(self)
	Log = ""
	ID = GetQueryArg("ID") or ""
	local Res = ServerOperationData:Get({ID = ID})
	if Res and Res[1] then
		Log = Res[1]["Log"]
	end
	-- 将换行符替换成<br>
	Log = string.gsub(Log,"\n","<br>")
	Log = string.gsub(Log,"\r","<br>")
	Viewer:View("template/server/operationlog.html")
end

function Delete(self)
	local Args = GetPostArgs()
	if Args.ID and Args.ID ~= "" then
		ServerOperationData:Delete(Args.ID)
	end
	ngx.say("1")
end

DoRequest()
