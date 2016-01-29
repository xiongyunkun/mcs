----------------------------------------
--$Id: cron_broadcast_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时执行公告
--
--]]
local GMID = 15 --公告GMID
function CronExecute(self)
	--先获得当前在执行时间范围内的公告
	local NowTimeStamp = ngx.time()
	local NowTime = os.date("%Y-%m-%d %H:%M:%S",NowTimeStamp)
	local BroadcastList = BroadcastData:GetProperTimeInfo(NowTime)
	--根据上一次执行时间和时间间隔判断是否需要执行
	local NeedOperationList = {}
	for _, BroadcastInfo in ipairs(BroadcastList) do
		local LastOperationTime = BroadcastInfo.LastOperationTime
		LastOperationTime = GetTimeStamp(LastOperationTime)
		local SendInterval = tonumber(BroadcastInfo.SendInterval)
		SendInterval = SendInterval * 60 --转换成秒
		if LastOperationTime + SendInterval <= NowTimeStamp then
			--执行次数是否已达到上限
			local SendNum = BroadcastInfo.SendNum
			local NowOperationNum = BroadcastInfo.NowOperationNum
			if SendNum == 0  or SendNum > NowOperationNum then --没有次数限制,执行GM
				local HostIDs = string.split(BroadcastInfo.HostIDs, ",")
				local NHostIDs = {}
				for _, HostID in ipairs(HostIDs) do
					table.insert(NHostIDs, tonumber(HostID))
				end
				local HostList = ServerData:GetServerList(BroadcastInfo.ServerType, NHostIDs, BroadcastInfo.PlatformID)
				local Results = self:ExecuteGM(BroadcastInfo.PlatformID, HostList, GMID, BroadcastInfo.BroadType, BroadcastInfo.Content)
				BroadcastData:UpdateResult(BroadcastInfo.ID, Serialize(Results))
			end
		end
	end
	ngx.say("ok")
end

-- 执行GM指令发送公告
function ExecuteGM(self, PlatformID, HostList, GMID, BroadType, Content)
	local Results = {}
	--获得GM指令
	local OperationInfo = GMRuleData:Get({ID = GMID})
	local Rule = OperationInfo[1].Rule
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	local BroadcastID = CommonData.BroadcastList[tonumber(BroadType)]
	if not BroadcastID then
		return
	end
	--验证参数
	local GMParams = {BroadcastID, Content}
	local Flag, GMCMD = CommonFunc.VerifyGMParms(Rule, GMParams)
	if not Flag then
		ExtMsg = "GM参数不对，参数为："..table.concat(GMParams, ",")
		return
	else
		local Options = {PlatformID = PlatformID}
		for _, HostID in ipairs(HostList) do
			--执行GM指令
			Options.HostID = HostID
			local Flag, Result = CommonFunc.ExecuteGM(Options, GMID, GMCMD, OperationTime)
			Results[HostID] = Result
		end
	end
	return Results
end

DoRequest(true) --不需要进行权限验证
