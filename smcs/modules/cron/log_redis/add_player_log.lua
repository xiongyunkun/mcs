----------------------------------------
--$Id: add_player.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 拉取addplayer.log相关日志并且入库,相关日志文件有：addplayer.log
--]]

module(...,package.seeall)

--前面的HostID和后面的时间都不要在这里填
local Cols = {"Uid", "Urs", "Sex"}
local Frequency = 300 --实时在线为5分钟一个周期，300秒

--处理回调结果
function HandleResponse(self, LogList, ServerPlatformMap)
	local PlatformResults = {}
	local PlatformNums = {}
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
			local PlatformID = ServerPlatformMap[HostID]
			if PlatformID then
				PlatformResults[PlatformID] = PlatformResults[PlatformID] or {}
				table.insert(PlatformResults[PlatformID], Result)
				PlatformNums[PlatformID] = PlatformNums[PlatformID] or {}
				PlatformNums[PlatformID][HostID] = PlatformNums[PlatformID][HostID]
					or {Male = 0, Female = 0, TotalNum = 0}
				if tonumber(Result["Sex"]) == 1 then
					PlatformNums[PlatformID][HostID].Male = PlatformNums[PlatformID][HostID].Male + 1
				else
					PlatformNums[PlatformID][HostID].Female = PlatformNums[PlatformID][HostID].Female + 1
				end
				PlatformNums[PlatformID][HostID].TotalNum = PlatformNums[PlatformID][HostID].TotalNum + 1
			end
		end
	end
	local ExecuteTime = CommonFunc.GetCorrectTime(Frequency)
	ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
	for PlatformID, Results in pairs(PlatformResults) do
		AddPlayerLogData:BatchInsert(PlatformID, Results)
		for HostID, HostInfo in pairs(PlatformNums[PlatformID]) do
			if HostInfo.TotalNum ~= 0 then
				AddPlayerData:Insert(PlatformID, HostID, HostInfo.TotalNum, HostInfo.Male, 
					HostInfo.Female, ExecuteTime)
			end
		end
	end
	return true
end

