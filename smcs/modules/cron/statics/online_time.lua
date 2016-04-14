----------------------------------------
--$Id: online_time.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 在线时长统计
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "OnlineTime" 

--统计指标
local TimeIndex = {
	["Time0"] = {0, 1},
	["Time1"] = {1, 5},
	["Time5"] = {5, 10},
	["Time10"] = {10, 15},
	["Time15"] = {15, 30},
	["Time30"] = {30, 45},
	["Time45"] = {45, 60},
	["Time60"] = {60, 90},
	["Time90"] = {90, 120},
	["Time120"] = {120, 150},
	["Time150"] = {150, 180},
	["Time180"] = {180, 240},
	["Time240"] = {240, 300},
	["Time300"] = {300, 360},
	["Time360"] = {360, 420},
	["Time420"] = {420, 600},
	["Time600"] = {600, 900},
	["Time900"] = {900, 1200},
	["Time1200"] = {1200},
}

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	--从今天的玩家退出日志中读取数据在线时长
	local LogoutRes = LogoutLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	local NewPlayerResults = {} --新玩家统计结果
	local OldPlayerResults = {} --老玩家统计结果
	local NewPlayerTimes = 0 -- 新玩家总时长
	local OldPlayerTimes = 0 --老玩家总时长
	local NewPlayerNum = 0 --新玩家人数
	local OldPlayerNum = 0 --老玩家人数
	local NewPlayerInfoMap = {}
	local OldPlayerInfoMap = {}
	local NewUids = self:GetNewPlayerUids(PlatformID, HostID, Day)
	for _, Info in ipairs(LogoutRes) do
		local OnTime = tonumber(Info.OnTime or 0)
		--20150413：多玩需求，在线时长只统计超过5分钟的
		local Uid = Info.Uid
		if NewUids[Uid] then --属于新用户
			NewPlayerInfoMap[Uid] = (NewPlayerInfoMap[Uid] or 0) + OnTime
			if OnTime >= 300 then
				NewPlayerTimes = NewPlayerTimes + OnTime 
			end
		else --否则属于老玩家
			OldPlayerInfoMap[Uid] = (OldPlayerInfoMap[Uid] or 0) + OnTime
			if OnTime >= 300 then
				OldPlayerTimes = OldPlayerTimes + OnTime
			end
		end
	end
	NewPlayerNum = table.size(NewPlayerInfoMap)
	OldPlayerNum = table.size(OldPlayerInfoMap)
	--先统计新玩家的各个区间的指标
	for Uid, OnTime in pairs(NewPlayerInfoMap) do
		-- 对比统计指标看落在哪个区间
		for IndexName, IndexInfo in pairs(TimeIndex) do
			if #IndexInfo == 1 and OnTime >= (IndexInfo[1] * 60) then
				--直接落在这个区间了,直接退出循环
				NewPlayerResults[IndexName] = (NewPlayerResults[IndexName] or 0) + 1
				break
			end
			if #IndexInfo == 2 and OnTime >= (IndexInfo[1] * 60) and OnTime < (IndexInfo[2] * 60) then
				NewPlayerResults[IndexName] = (NewPlayerResults[IndexName] or 0) + 1
				break
			end
		end
	end
	NewPlayerResults["TotalTimes"] = NewPlayerTimes
	NewPlayerResults["TotalPlayers"] = NewPlayerNum
	OnlineTimeData:Insert(PlatformID, HostID, Day, 2, NewPlayerResults) --新玩家
	--再统计老用户的
	for Uid, OnTime in pairs(OldPlayerInfoMap) do
		-- 对比统计指标看落在哪个区间
		for IndexName, IndexInfo in pairs(TimeIndex) do
			if #IndexInfo == 1 and OnTime >= (IndexInfo[1] * 60) then
				--直接落在这个区间了,直接退出循环
				OldPlayerResults[IndexName] = (OldPlayerResults[IndexName] or 0) + 1
				break
			end
			if #IndexInfo == 2 and OnTime >= (IndexInfo[1] * 60) and OnTime < (IndexInfo[2] * 60) then
				OldPlayerResults[IndexName] = (OldPlayerResults[IndexName] or 0) + 1
				break
			end
		end
	end
	OldPlayerResults["TotalTimes"] = OldPlayerTimes
	OldPlayerResults["TotalPlayers"] = OldPlayerNum
	OnlineTimeData:Insert(PlatformID, HostID, Day, 1, OldPlayerResults) -- 老玩家
	return true
end

--获得该天的新玩家Uid列表
function GetNewPlayerUids(self, PlatformID, HostID, Day)
	local Res = AddPlayerLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	local NewUids = {}
	for _, Info in ipairs(Res) do
		NewUids[Info.Uid] = true
	end
	return NewUids
end



