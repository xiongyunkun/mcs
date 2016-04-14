----------------------------------------
--$Id: banmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 禁言封号管理
--
--]]
local BAN_ID = 13
local UN_BAN_ID = 14

function ForbiddenShow(self, PlatformID, Results)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	Options.PlatformID = Options.PlatformID or PlatformID
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	OperationTypes = CommonData.BanOperationTypes
	ForbidTimes = {
		[60] = "1小时",
		[180] = "3小时",
		[300] = "5小时",
		[86400] = "24小时",
		[0] = "永久",
	}
	--展示数据
	Titles = {"平台", "服", "账号", "角色", "执行结果",}
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
	Viewer:View("template/player/forbidden.html")
end

--玩家禁言提交
function DoForbidden(self)
	local Results = {}
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local RoleName = Args.RoleName
		--只有封禁角色名不为空的时候才提交
		local UserList = {}
		if RoleName and RoleName ~= "" then
			local RoleNames = string.split(RoleName, ";")
			--先查tblUserInfo表获得玩家对应的HostID
			local ServerType = Args.ServerType
			local UserOptions = {
				PlatformID = Args.PlatformID,
				Names = table.concat(RoleNames, "','"),
				HostID = Args.HostID
			}
			UserList = UserInfoData:Get(UserOptions)
			local OperationType = tonumber(Args.OperationType)
			if OperationType == 1 then
				self:Ban(Args, "chat", UserList)
			elseif OperationType == 2 then
				self:UnBan(Args, "chat", UserList)
			elseif OperationType == 3 then
				self:Ban(Args, "login", UserList)
			elseif OperationType == 4 then
				self:UnBan(Args, "login", UserList)
			end
			--记录日志
			local Reason = Args.Reason
			self:Log(Args.PlatformID, OperationType, Args.ForbidTime, Args.Reason, UserList)
		end
		self:ForbiddenShow(Args.PlatformID, UserList)
	end
	
end

--封禁
function Ban(self, Options, BanType, UserList)
	local OperationInfo = GMRuleData:Get({ID = BAN_ID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local BanTime = tonumber(Options.ForbidTime) or 0
	BanTime = BanTime * 60
	for _, UidInfo in ipairs(UserList) do
		local GMParams = {BanType, UidInfo.Uid, BanTime, "smcs_封禁"}
		local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
		if not Flag then
			ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
			return UserList
		else
			--执行GM指令
			Options.HostID = UidInfo.HostID
			local Flag, Result = CommonFunc.ExecuteGM(Options, BAN_ID, GMCMD, OperationTime)
			UidInfo.Result = Result
		end
	end
	return UserList
end

--解禁
function UnBan(self, Options, BanType, UserList)
	local OperationInfo = GMRuleData:Get({ID = UN_BAN_ID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	for _, UidInfo in ipairs(UserList) do
		local GMParams = {BanType, UidInfo.Uid, "smcs_解禁"}
		local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
		if not Flag then
			ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
			return UserList
		else
			--执行GM指令
			Options.HostID = UidInfo.HostID
			local Flag, Result = CommonFunc.ExecuteGM(Options, UN_BAN_ID, GMCMD, OperationTime)
			UidInfo.Result = Result
		end
	end
	return UserList
end

--记录封禁日志
function Log(self, PlatformID, OperationType, BanTime, Reason, UserList)
	local Results = {}
	local NowTime = os.time()
	local StartTime = os.date("%Y-%m-%d %H:%M:%S",NowTime)
	local EndTime = NowTime + (tonumber(BanTime) * 60)
	EndTime = os.date("%Y-%m-%d %H:%M:%S", EndTime)
	--获得操作人ID
	local User = UserData:GetUserById(GetSession("UserId"))
	for _, UidInfo in ipairs(UserList) do
		local Result = {
			HostID = UidInfo.HostID,
			Uid = UidInfo.Uid,
			Name = UidInfo.Name,
			Operator = User and User["account"] or "",
			OperationType = OperationType,
			BanStartTime = StartTime,
			BanEndTime = EndTime,
			Reason = Reason,
			Time = StartTime,
		}
		table.insert(Results, Result)
	end
	BanLogData:BatchInsert(PlatformID, Results)
end

DoRequest()
