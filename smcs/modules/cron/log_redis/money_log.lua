----------------------------------------
--$Id: money_log.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 拉取money相关日志并且入库,相关日志文件有：addmoney.lua, submoney.lua
--]]

--
module(...,package.seeall)

local Cols = {"Uid", "Urs", "Name", "Type", "Reason", "Changes", "Remain"}


--处理回调结果
function HandleResponse(self, LogList, ServerPlatformMap)
	local PlatformResults = {}
	for _, LogJson in ipairs(LogList) do
		local Message = LogJson.message
		if Message ~= "" and Message ~= " " then
			local HostID = tonumber(LogJson.hostid)
			local Type = LogJson.type
			local IsSub = string.find(Type, "sub")
			local Result = {["HostID"] = HostID}
			for _, Col in ipairs(Cols) do
				local ColValue = CommonFunc.GetLogValue(Message, Col)
				if Col == "Changes" and IsSub then
					ColValue = "-" .. ColValue --如果是扣除钻石的话前面添加负号
				end
				Result[Col] = ColValue
			end
			--再提取时间
			Result["Time"] = CommonFunc.GetLogTime(Message)
			local PlatformID = ServerPlatformMap[HostID]
			if PlatformID then
				PlatformResults[PlatformID] = PlatformResults[PlatformID] or {}
				table.insert(PlatformResults[PlatformID], Result)
			end
		end
	end
	for PlatformID, Results in pairs(PlatformResults) do
		MoneyLogData:BatchInsert(PlatformID, Results)
	end
	return true
end

