----------------------------------------
--$Id: server_merge_mgr.lua 21449 2014-10-22 06:46:41Z xiongyunkun $
----------------------------------------
--[[
-- 合服管理
--
--]]

function OperationList(self)
	Options = GetQueryArgs()
	Options.StartTime = os.date("%Y-%m-%d",os.time()-7*24*3600)
	Options.EndTime = os.date("%Y-%m-%d",os.time())
	OperationInfoList = ServerMergeData:Get(Options)
	Platforms = CommonFunc.GetPlatformList()
	Servers = ServerData:GetMergedServers({PlatformID = Options.PlatformID})
	--操作人员列表
	local UserInfo = UserData:Get()
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local ServerList = ServerData:GetAllServers()
	local NewServers = {}
	for _, Server in ipairs(ServerList) do
		NewServers[Server.hostid] = Server.name
	end
	--新增相关展示值
	for _, OperationInfo in ipairs(OperationInfoList) do
		local SrcHostIDs = string.split(OperationInfo["SrcHostIDs"], ",")
		local SrcServerNames = {}
		for _, HostID in ipairs(SrcHostIDs) do
			local ServerName = NewServers[tonumber(HostID)] or HostID
			table.insert(SrcServerNames, ServerName)
		end
		OperationInfo.SrcServerNames = table.concat(SrcServerNames, ",")
		OperationInfo.ToServerName = NewServers[OperationInfo["ToHostID"]]
	end
	Viewer:View("template/server/server_merge_list.html")
end

function EditPost(self)
	local Args = GetPostArgs()
	if type(Args.SrcHostIDs) ~= "string" then
		Args.SrcHostIDs = table.concat(Args.SrcHostIDs, ",")
	end
	local User = UserData:GetUserById(GetSession("UserId"))
	Args.Operator = User and User["account"] or ""
	ServerMergeData:Insert(Args)
	self:OperationList()
end

function Delete(self)
	local Args = GetPostArgs()
	if Args.ID and Args.ID ~= "" then
		ServerMergeData:Delete(Args.ID)
	end
	ngx.say("1")
end

--发布合服配置
function Release(self)
	local MergeRes = ServerMergeData:Get({Status = 0, ASC = true}) --获取所有未发布的配置
	if MergeRes and #MergeRes > 0 then
		--每条记录都需要同步到对应servers表中的mergeto字段去
		for _, Info in ipairs(MergeRes) do
			local SrcHostIDs = Info.SrcHostIDs
			SrcHostIDs = string.split(SrcHostIDs, ",")
			for _, SrcHostID in ipairs(SrcHostIDs) do
				ServerData:UpdateMergeTo(SrcHostID, Info.ToHostID)
			end
			ServerMergeData:UpdateStatus(Info.ID, 1) --更新发布状态
		end
		CommonFunc:ExportCroZone()
		--这里还要通知gservice更新缓存
		local Url = "127.0.0.1:7666/update_merge_host_map"
		ReqOutUrl(Url)
		--如果是多玩独代平台传递过来的合服配置还需要通知独代平台那边
		for _, Info in ipairs(MergeRes) do
			if Info.OrderID ~= "" then
				local YY_URL = "http://config.gop.yy.com/api/combinedService/agentFinish.do"
				local Params = {
					id = Info.OrderID,
					status = 9,
					ts = ngx.time(),
				}
				local Key = CommonFunc.GetInterfaceKey("dw", "merge_server_key") --开服信息key 
				local Sign = ngx.md5(Params.id .. Params.status .. Params.ts .. Key)
				Params.sign = Sign
				local Flag, Res = ReqOutUrl(YY_URL, Params)
				ngx.say(Flag, Res)
			end
		end
	end
	ngx.say("1")
end

DoRequest()
