----------------------------------------
--$Id: add_player.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 拉取additem.log、subitem.log相关日志并且入库,相关日志文件有：additem.log、subitem.log
--]]

module(...,package.seeall)

--前面的HostID和后面的时间都不要在这里填
local Cols = {"Uid", "Name", "OperationType", "Type", "Reason", "Memo", 
	"ItemName", "ItemType", "ShowType", "Amount", "Position"}

--处理回调结果
function HandleResponse(self, LogList, ServerPlatformMap)
	local PlatformResults = {}
	local OperationTypes = {
		["additem"] = 1,
		["subitem"] = 2,
	}
	for _, LogJson in ipairs(LogList) do
		local Message = LogJson.message
		local Type = LogJson.type
		if Message ~= "" and Message ~= " " then
			local HostID = tonumber(LogJson.hostid)
			local Result = {["HostID"] = HostID}
			for _, Col in ipairs(Cols) do
				local ColValue = CommonFunc.GetLogValue(Message, Col)
				if Col == "OperationType" then
					ColValue = OperationTypes[Type] or 1
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
		ItemLogData:BatchInsert(PlatformID, Results)
	end
	return true
end

