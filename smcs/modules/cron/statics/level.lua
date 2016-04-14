----------------------------------------
--$Id: level.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 等级统计
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "Level" 

--通过分析升级日志中原有等级和现有等级对比昨天的等级数据得出等级统计
function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	--获得今天的升级日志数据
	local LevelRes = LevelUpLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	--再把昨天的等级统计也拿出来
	local yesterday = os.date("%Y-%m-%d", os.time() - 3600 - 86400)
	local OldLevelInfo = LevelData:Get({PlatformID = PlatformID, HostID = HostID})
	--整理数据成{Level = num} 格式
	local OldLevelMap = {}
	if OldLevelInfo and OldLevelInfo[1] then
		OldLevelInfo = OldLevelInfo[1]
		for _, Info in ipairs(OldLevelInfo) do
			OldLevelMap[Info.Level] = Info.Num
		end
	end
	--统计分析今天的升级数据，按每个uid来分,统计出每个uid的原有等级和现在等级
	local LevelInfo = {}
	for _, Info in ipairs(LevelRes) do
		local Uid = Info.Uid
		local OrgLevel = Info.OrgLevel
		local NewLevel = Info.NewLevel
		if not LevelInfo[Uid] then
			LevelInfo[Uid] = {OrgLevel = OrgLevel, NewLevel = NewLevel}
		else
			--如果新等级比刚才记录的新等级大则用现在的新等级
			if LevelInfo[Uid].NewLevel < NewLevel then
				LevelInfo[Uid].NewLevel = NewLevel
			end
			--如果原等级比刚才记录的原等级小则用现在的原等级
			if LevelInfo[Uid].OrgLevel > OrgLevel then
				LevelInfo[Uid].OrgLevel = OrgLevel
			end
		end
	end
	
	for _, Info in pairs(LevelInfo) do
		local OrgLevel = Info.OrgLevel
		local NewLevel = Info.NewLevel
		--在昨天的数据中原等级减1
		if OldLevelMap[OrgLevel] then
			OldLevelMap[OrgLevel] = OldLevelMap[OrgLevel] - 1
		end
		--同时新等级+1
		OldLevelMap[NewLevel] = (OldLevelMap[NewLevel] or 0) + 1
	end
	--记录入库
	for Level, Num in pairs(OldLevelMap) do
		if Level ~= 0 then --排除掉等级为0的数据
			LevelData:Insert(PlatformID, HostID, Level, Num)
		end
	end
	return true
end



