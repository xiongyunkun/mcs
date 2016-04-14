----------------------------------------
--$Id: mount_level_statics.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 玩法参与统计
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "InstanceStatics" 

local InstLevelMap = {
	[1] = 23,
	[2] = 23,
	[3] = 25,
	[6] = 34,
	[7] = 34,
	[8] = 34,
	[11] = 30,
	[12] = 30,
	[13] = 27,
	[14] = 27,
	[15] = 31,
	[16] = 24,
	[17] = 30,
	[18] = 30,
	[19] = 29,
	[20] = 29,
	[21] = 30,
	[22] = 30,
	[51] = 30,
	[52] = 30,
	[53] = 30,
	[54] = 30,
	[55] = 30,
}

--统计副本参与信息
function CronStatics(self, PlatformID, HostID)
	local NowTime = os.time()
	local Day = os.date("%Y-%m-%d", NowTime - 3600) -- 统计当前时间的
	local Options = {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"}
	local InstanceLogList = InstanceLogData:Get(PlatformID, Options)
	local Results = {}
	for _, Log in ipairs(InstanceLogList) do
		--按照InstanceType来统计
		Results[Log.InstanceType] = Results[Log.InstanceType] or {PlayNum = 0, Uids = {}}
		Results[Log.InstanceType].PlayNum = Results[Log.InstanceType].PlayNum + 1
		Results[Log.InstanceType].Uids[Log.Uid] = true
	end
	local OpenFuncNums = self:GetOpenFuncNum(PlatformID, HostID)
	for InstanceType, InstanceInfo in pairs(Results) do
		local Args = {
			PlatformID = PlatformID,
			HostID = HostID,
			Date = Day,
			InstanceType = InstanceType,
			PlayNum = InstanceInfo.PlayNum,
			UidNum = table.size(InstanceInfo.Uids),
			OpenFuncNum = OpenFuncNums[InstLevelMap[InstanceType] or -1] or 0,
		}
		InstanceStaticsData:Insert(PlatformID, Args)
	end
	return true
end

--获得该等级开放人数
function GetOpenFuncNum(self, PlatformID, HostID)
	local Results = {}
	local Levels = {}
	for _, Level in pairs(InstLevelMap) do
		Levels[Level] = true
	end
	for Level, _ in pairs(Levels) do
		local Res = UserInfoData:Get({PlatformID = PlatformID, HostID = HostID, MinLevel = Level})
		Results[Level] = #Res
	end
	return Results
end






