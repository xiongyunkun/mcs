----------------------------------------
--$Id: gmmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- GM操作
--
--]]

function MultiGMShow(self, PlatformID, Results)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local ServerTypes = CommonFunc.GetMulServerTypes()
	
	--展示数据
	local Titles = {"平台", "服", "GM指令", "GM参数", "执行结果", }
	local PlatformStr = PlatformID and Platforms[PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	local TableData = {}
	for _, Result in ipairs(Results or {}) do
		local CTable = {PlatformStr, SeverMap[Result.HostID] or "",  
		Result.RuleName or "", Result.GMParams or "", Result.Result or "执行失败"}
		table.insert(TableData, CTable)
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
		TableData = TableData,
		DataTable = DataTable,
		Titles = Titles,
	}
	Viewer:View("template/player/multigmExecute.html", Params)
end

function DoMultiGM(self)
	local Results = {} 
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local GMListStr = Args.GMListStr
		if not GMListStr or GMListStr == "" then
			ExtMsg = "没有GM指令"
			self:MultiGMShow(Args.PlatformID, Results)
			return
		end
		if not Args.HostID then
			ExtMsg = "没有选择服务器"
			self:MultiGMShow(Args.PlatformID, Results)
			return
		end

		GMListStr = string.gsub(GMListStr, "\n", "")
		GMListStr = string.gsub(GMListStr, "\r", "")
		local GmListTbl = string.split(GMListStr, ";")
		for _, GMStr in ipairs(GmListTbl) do
			if GMStr ~= "" then
				local GMTmp = string.split(GMStr, "|")
				
				local GMName = GMTmp[1]
				local GMParams = GMTmp[2]
				
				local OperationInfo = GMRuleData:Get({Name = GMName})
				if not OperationInfo or not OperationInfo[1] or not OperationInfo[1].Rule then
					ExtMsg = "GM名称错误" .. GMName
					self:MultiGMShow(Args.PlatformID, Results)
					return	
				end
            
				local Rule = OperationInfo[1].Rule	
				local RuleName = OperationInfo[1].Name
				local GMId = OperationInfo[1].ID
            
				local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())

				local HostIDs = string.split(Args.HostID, ",")
				local NHostIDs = {}
				for _, HostID in ipairs(HostIDs) do
					table.insert(NHostIDs, tonumber(HostID))
				end
				local HostIDs = ServerData:GetServerList(Args.ServerType, NHostIDs, Args.PlatformID)
				--验证所填参数是否正确，这里要分填写玩家uid的和不用填写玩家uid的
				if #HostIDs ~= 0 then
					for _, HostID in ipairs(HostIDs) do
						local HostInfo = {HostID = HostID,RuleName = RuleName, GMParams = GMParams}
						GMParams = string.split(GMParams, ",")
						
						--判断是否可以指定GsId进程
						local GsID = nil
						if CommonData.GMGsIDList[tonumber(GMId)] then
							local ParamIndex = CommonData.GMGsIDList[tonumber(GMId)]["ParamIndex"]
							if GMParams[ParamIndex] then
								GsID = GMParams[ParamIndex]
							end
						end
						local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
						if not Flag then
							ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
							self:MultiGMShow(Args.PlatformID, Results) --展示结果
							return
						else
							--执行GM指令
							Args.HostID = HostID
							local Flag, Result = CommonFunc.ExecuteGM(Args, Args.GMID, GMCMD, OperationTime, GsID)
							HostInfo.Result = Result
						end
						table.insert(Results, HostInfo)
					end
				end
			end
		end
		self:MultiGMShow(Args.PlatformID, Results) --展示结果
	end
end

function GMShow(self, PlatformID, Results)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local ServerTypes = CommonFunc.GetMulServerTypes()
	--GM指令
	local OrgGMList = GMRuleData:Get({["OssFlag"]=1})
	local GMList = {}
	for _, GM in ipairs(OrgGMList) do
		GMList[GM.ID] = GM.Name .. "_[" .. GM.RuleFormat .. "]" 
	end
	--展示数据
	local Titles = {"平台", "服", "账号", "角色", "GM指令", "执行结果", }
	local PlatformStr = PlatformID and Platforms[PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	local TableData = {}
	for _, Result in ipairs(Results or {}) do
		local CTable = {PlatformStr, SeverMap[Result.HostID] or "", Result.Uid or "", Result.Name or "", 
		Result.RuleName or "", Result.Result or "执行失败"}
		table.insert(TableData, CTable)
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
		OrgGMList = OrgGMList,
		GMList = GMList,
		TableData = TableData,
		DataTable = DataTable,
		Titles = Titles,
	}
	Viewer:View("template/player/gmExecute.html", Params)
end

function DoGM(self)
	local Results = {}
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local RoleName = Args.RoleName
		local OperationInfo = GMRuleData:Get({ID = Args.GMID})
		if not OperationInfo or not OperationInfo[1] or not OperationInfo[1].Rule then
			ExtMsg = "GM指令错误，请联系后台开发人员"
			self:GMShow(Args.PlatformID, Results) --展示结果
			return
		end
		local Rule = OperationInfo[1].Rule
		local RuleName = OperationInfo[1].Name
		local GMParams = Args.GMParams
		local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
		if Args.RoleName and Args.RoleName ~= "" then
			--这里执行需要输入角色的GM指令
			Results = self:GetUserInfo(Args)
			--验证所填参数是否正确，这里要分填写玩家uid的和不用填写玩家uid的
			if #Results ~= 0 then
				for _, UidInfo in ipairs(Results) do
					UidInfo.RuleName = RuleName
					GMParams = UidInfo.Uid .. " " .. GMParams
					GMParams = string.split(GMParams)
					--验证参数
					local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
					if not Flag then
						ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
						self:GMShow(Args.PlatformID, Results) --展示结果
						return
					else
						--执行GM指令
						Args.HostID = UidInfo.HostID
						local Flag, Result = CommonFunc.ExecuteGM(Args, Args.GMID, GMCMD, OperationTime)
						UidInfo.Result = Result
					end
				end
			end
		else
			--不需要输入角色名的GM指令
			local HostIDs = string.split(Args.HostID, ",")
			local NHostIDs = {}
			for _, HostID in ipairs(HostIDs) do
				table.insert(NHostIDs, tonumber(HostID))
			end
			local HostIDs = ServerData:GetServerList(Args.ServerType, NHostIDs, Args.PlatformID)
			--验证所填参数是否正确，这里要分填写玩家uid的和不用填写玩家uid的
			if #HostIDs ~= 0 then
				for _, HostID in ipairs(HostIDs) do
					local HostInfo = {HostID = HostID,RuleName = RuleName}
					GMParams = string.split(GMParams)
					--判断是否可以指定GsId进程
					local GsID = nil
					if CommonData.GMGsIDList[tonumber(Args.GMID)] then
						local ParamIndex = CommonData.GMGsIDList[tonumber(Args.GMID)]["ParamIndex"]
						if GMParams[ParamIndex] then
							GsID = GMParams[ParamIndex]
						end
					end
					local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
					if not Flag then
						ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
						self:GMShow(Args.PlatformID, Results) --展示结果
						return
					else
						--执行GM指令
						Args.HostID = HostID
						local Flag, Result = CommonFunc.ExecuteGM(Args, Args.GMID, GMCMD, OperationTime, GsID)
						HostInfo.Result = Result
					end
					table.insert(Results, HostInfo)
				end
			end
		end
		self:GMShow(Args.PlatformID, Results) --展示结果
	end
end

--获得玩家uid列表
function GetUserInfo(self, Options)
	local Results = {}
	if Options.RoleName and Options.RoleName ~= "" then
		--先查tblUserInfo表获得玩家对应的HostID
		local RoleName = Options.RoleName
		local RoleNames = string.split(RoleName, ";")
		local ServerType = Options.ServerType
		local HostIDs = Options.HostID
		local HostList = ServerData:GetServerList(ServerType, HostIDs, Options.PlatformID)
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
