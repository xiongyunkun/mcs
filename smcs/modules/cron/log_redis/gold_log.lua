----------------------------------------
--$Id: gold_log.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 拉取gold相关日志并且入库,相关日志文件有：addgold.lua, subgold.lua
--]]

--
module(...,package.seeall)

local Cols = {"Uid", "Urs", "Value", "Type", "Remain", "Name"}
local ColMap = {
	["Value"] = "Changes",
	["Type"] = "Reason",
}

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
				if Col == "Value" and IsSub then
					ColValue = "-" .. ColValue --如果是扣除钻石的话前面添加负号
				end
				Col = ColMap[Col] or Col
				Result[Col] = ColValue
			end
			--根据文件名确定钻石类型
			local GoldType = ""
			if string.find(LogJson.type, "creditgold") then
				GoldType = "2" --绑定钻石
			else
				GoldType = "1" --非绑定钻石
			end
			Result["GoldType"] = GoldType
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
		GoldLogData:BatchInsert(PlatformID, Results)
	end
	return true
end

