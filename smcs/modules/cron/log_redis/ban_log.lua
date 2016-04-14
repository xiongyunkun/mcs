----------------------------------------
--$Id: ban_log.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 拉取ban.log相关日志并且入库,相关日志文件有：ban.log
--]]

module(...,package.seeall)

--前面的HostID和后面的时间都不要在这里填
local Cols = {"Uid", "Urs", "Name", "OperationType", "StartTime", "BanTime", "Reason", "ExtInfo"}
local OperationTypes = {
	["chat"] = 1,
	["unbanchat"] = 2,
	["banlogin"] = 3,
	["unbanlogin"] = 4,
	["chat_ban_ip"] = 5,
}

--处理回调结果
function HandleResponse(self, LogList, ServerPlatformMap)
	local PlatformResults = {}
	for _, LogJson in ipairs(LogList) do
		local Message = LogJson.message
		if Message ~= "" and Message ~= " " then
			local HostID = tonumber(LogJson.hostid)
			local Result = {["HostID"] = HostID}
			for _, Col in ipairs(Cols) do
				local ColValue = CommonFunc.GetLogValue(Message, Col)
				Result[Col] = ColValue
			end
			--再提取时间
			Result["Time"] = CommonFunc.GetLogTime(Message)
			--执行列转换
			if Result["StartTime"] then
				Result["BanStartTime"] = os.date("%Y-%m-%d %H:%M:%S", Result["StartTime"])
			end
			if Result["BanTime"] then
				Result["BanEndTime"] = os.date("%Y-%m-%d %H:%M:%S", Result["StartTime"] + Result["BanTime"])
			end
			Result["OperationType"] = OperationTypes[Result["OperationType"]] or 1

			local PlatformID = ServerPlatformMap[HostID]
			if PlatformID then
				PlatformResults[PlatformID] = PlatformResults[PlatformID] or {}
				table.insert(PlatformResults[PlatformID], Result)
			end
		end
	end
	for PlatformID, Results in pairs(PlatformResults) do
		BanLogData:BatchInsert(PlatformID, Results)
	end
	return true
end

