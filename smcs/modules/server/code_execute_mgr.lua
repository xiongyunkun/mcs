----------------------------------------
--$Id: code_execute_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 服务器代码执行
--
--]]
local GMID = 22 --execute执行命令的GMID
local MAX_SUB_NUM = 30 --最多并发的子请求数量
--后台清档逻辑
function ExecuteShow(self)
	--展示数据
	Titles = {"平台", "服", "执行结果", }
	TableData = {}
	Platforms = CommonFunc.GetPlatformList(true) 
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local HostIDs = Args.HostIDs
		local GsID = Args.GsID
		if type(HostIDs) == "string" then
			HostIDs = {HostIDs}
		end
		local Code = Args.Code or ""
		--字符串替换,过滤回车符
		Code = string.gsub(Code, "\n", " ")
		Code = string.gsub(Code, "\r", " ")
		Code = string.gsub(Code, '"', "'")
		local ServerPlatformMap = ServerData:GetServerPlatformMap()
		local ServerList = ServerData:GetAllServers()
		local ServerMap = {}
		for _, Server in ipairs(ServerList) do
			ServerMap[Server.hostid] = Server.name
		end
		local Results = self:MultiExecute(HostIDs, GsID, Code)
		for HostID, Result in pairs(Results) do
			local PlatformID = ServerPlatformMap[tonumber(HostID)]
			local PlatformStr = PlatformID and Platforms[PlatformID] or "all"
			local HostInfo = {PlatformStr, ServerMap[tonumber(HostID)] or "", Result or "执行失败"}
			table.insert(TableData, HostInfo)
		end
	end
	local TagList = ServerData:GetGroupClass()
	GroupMap = {}
	for _, Group in ipairs(TagList) do
		GroupMap[Group.id] = Group.name
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/server/code_execute.html")
end

--并发执行
function MultiExecute(self, HostIDs, GsID, Code)
	local ServerPlatformMap = ServerData:GetServerPlatformMap()
	local ServerList = ServerData:GetAllServers()
	local ServerMap = {}
	for _, Server in ipairs(ServerList) do
		ServerMap[Server.hostid] = Server
	end
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local User = UserData:GetUserById(GetSession("UserId"))
	local SubRequestList = {} --子请求列表
	local IDList = {} --ID列表
	local IDHostMap = {} --记录ID与HostID的对应关系
	local Threads = {} --线程列表
	local Results = {}
	for _, HostID in ipairs(HostIDs) do
		HostID = tonumber(HostID)
		local PlatformID = ServerPlatformMap[HostID]
		local TransID = CommonFunc.GenerateTransID(OperationTime)
		--先记录入库
		local Options = {
			PlatformID = PlatformID,
			HostIDs = HostID,
			RuleID = GMID,
			GsID = GsID,
			GMValues = Code,
			OperationTime = OperationTime,
			Operator = User and User["account"] or "",
			TransID = TransID,
			Memo = "",
		}
		local ID = GMOperationData:Insert(Options)
		--需要对平台的时区进行转换
		local TimeZone = 0
		local PlatformInfo = PlatformData:GetPlatform(PlatformID)
		if PlatformInfo and PlatformInfo[1] then
			TimeZone = PlatformInfo[1].TimeZone or 0
			if TimeZone ~= 0 then
				OperationTime = GetTimeStamp(OperationTime)
        		OperationTime = OperationTime - 3600 * TimeZone
        		OperationTime = os.date("%Y-%m-%d %H:%M:%S", OperationTime)
			end
		end
		--开始执行
		local ShellValues = {HostID, GsID, '"' .. Code .. '"', "'" .. OperationTime .. "'", TransID}
		ShellValues = table.concat(ShellValues, ";") --分号拼接
		ShellValues = string.gsub(ShellValues, "\n", "") --过滤掉换行符
		ShellValues = string.gsub(ShellValues, "\r", "")
		local Params = {
			shellname = CommonData.ShellMap[4],
			shellparam = ShellValues,
			IsPend = "true", --挂起等待
		}
		local Url = ServerMap[HostID].address .. ":7633/executegm"
		Threads[HostID] = ngx.thread.spawn(ThreadExecute, ID, Url, Params, HostID)
	end
	for HostID, Thread in pairs(Threads) do
		local Flag, Res = ngx.thread.wait(Thread)
		if not Flag then
			Results[HostID] = "执行失败"
		else
			Results[HostID] = Res
		end
	end
	return Results
end

--线程执行
function ThreadExecute(ID, Url, Params, HostID)
	local Flag, Res = ReqOutUrl(Url, Params)
	local Result = "执行失败"
	GMOperationData:UpdateStatus(ID,2) --将状态更新为已执行
	GMOperationData:UpdateResult(ID, Res)
	if Flag then
		Res = UnSerialize(Res)
		Result = Res.Result == "true" and "执行成功" or "执行失败" 
	end
	return Result
end

function GetServerTagList(self)
	local Args = GetPostArgs()
	local TagID = Args.TagID
	local PlatformID = Args.PlatformID
	--获得该标签下面的服务器列表
	local ServerMap = {}
	if TagID and TagID ~= "" then
		local Groups = ServerData:GetServerGroup(TagID)
		local Servers = ServerData:GetAllServers()
		for _, Group in ipairs(Groups) do
			for _, Server in ipairs(Servers) do
				if Server.hostid == Group.svrid then
					if PlatformID == "" then
						ServerMap[tostring(Server.hostid)] = Server.name
					elseif PlatformID == Server.platformid then
						ServerMap[tostring(Server.hostid)] = Server.name
					end
				end
			end
		end
	end
	ngx.say(json.encode(ServerMap))
end

DoRequest()