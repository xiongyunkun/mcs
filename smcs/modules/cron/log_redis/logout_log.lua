----------------------------------------
--$Id: logout_log.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 拉取logout.log相关日志并且入库,相关日志文件有：logout.log
--]]

module(...,package.seeall)

--前面的HostID和后面的时间都不要在这里填
local Cols = {"Uid", "Urs", "OnTime", "Lv", "SceneUid", "X", "Y", "VipLevel", "IsVip",
			"Fighting", "Name", "Gold", "TotalGold", "Money", "Ip"}

--默认值
local DefaultValues = {
	["Gold"] = 0,
	["TotalGold"] = 0,
	["Money"] = 0,
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
				local ColValue = CommonFunc.GetLogValue(Message, Col, DefaultValues[Col])
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
		LogoutLogData:BatchInsert(PlatformID, Results)
		--同时再更新一次玩家信息表，防止玩家修改角色名
		UserInfoData:BatchUpdate(PlatformID, Results)
	end
	return true
end

