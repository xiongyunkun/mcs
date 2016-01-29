----------------------------------------
--$Id: challenge.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 极限挑战
--]]
--
module(...,package.seeall)

--统计指标
IndexName = "Challenge" 
local pairs = pairs
local ipairs = ipairs

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", ngx.time() - 3600) -- 统计前一个小时的
	--按照渠道来统计
	local ChallengeRes = ChallengeLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	local Results = {}
	for _, Info in ipairs(ChallengeRes) do
		Results[Info.ChapterId] = Results[Info.ChapterId] or {}
		Results[Info.ChapterId][Info.Idx] = Results[Info.ChapterId][Info.Idx] or {}
		Results[Info.ChapterId][Info.Idx][Info.StageId] = Results[Info.ChapterId][Info.Idx][Info.StageId] or {}
		Results[Info.ChapterId][Info.Idx][Info.StageId][Info.Uid] = true --根据uid来去重
	end
	for ChapterId, CInfo in pairs(Results) do
		for Idx, IInfo in pairs(CInfo) do
			for StageId, SInfo in pairs(IInfo) do
				local PassNum = table.size(SInfo) --参与人数
				ChallengeData:Insert(PlatformID, HostID, Day, ChapterId, Idx, StageId, PassNum)
			end
		end
	end
	return true
end




