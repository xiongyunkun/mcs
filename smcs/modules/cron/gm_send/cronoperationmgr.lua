----------------------------------------
--$Id: cronoperationmgr.lua 21449 2014-10-22 06:46:41Z xiongyunkun $
----------------------------------------
--[[
-- 服务器操作管理
--
--]]

ServerOperationFlag = false --执行标志位，防止上一次还在执行下一次执行就已经开始的情况

function ServerOperation(self)
	--检查当前时间段内是否有需要定时执行的操作
	if ServerOperationFlag then
		return 
	end
	ServerOperationFlag = true --正在执行，设置标志位
	local NowTime = ngx.time()
	local StartTime = os.date("%Y-%m-%d %H:%M:%S",NowTime - 60)
	ngx.say("start time: " .. StartTime)
	local EndTime = os.date("%Y-%m-%d %H:%M:%S",NowTime + 60)
	ngx.say("end time: " .. EndTime)
	
	local Options = {
		StartTime = StartTime,
		EndTime = EndTime,
		IsOperated = "0", --未执行标志位
	}
	local OperationList = ServerOperationData:Get(Options)
	--开始执行
	for _, Operation in ipairs(OperationList) do
		local Results = {}
		local HostIDs = string.split(Operation.HostIDs, ",")
		for _, HostID in ipairs(HostIDs) do
			local Params = {
				shellname = CommonData.ShellMap[tonumber(Operation.OperationType)],
				shellparam = HostID,
			}
			local Response = ReqCmcsByServerId(tonumber(HostID), "execute", Params)
			Results[HostID] = Response
		end
		--记录入库，更新执行状态
		ServerOperationData:UpdateLog(Operation.ID, Serialize(Results))
	end
	ServerOperationFlag = false
	ngx.say("ok")
end


DoRequest(true) --不需要进行权限验证
