----------------------------------------
--$Id: instance_statics.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 关卡达成
--]]
--
module(...,package.seeall)

--统计指标
IndexName = "Instance" 
local pairs = pairs
local ipairs = ipairs

function CronStatics(self, PlatformID, HostID)
	local NowTime = ngx.time()
	local Day = os.date("%Y-%m-%d", NowTime - 3600) -- 统计前一个小时的
	--按照渠道来统计
	local Options = {
		HostID = HostID,
		StartTime = Day .. " 00:00:00",
		EndTime = Day .. " 23:59:59",
	}
	local LogRes = InstanceLogData:Get(PlatformID, Options)
	local Yesterday = os.date("%Y-%m-%d", NowTime - 3600 - 86400) --昨天
	local YesterdayRes = InstanceData:Get({PlatformID = PlatformID, HostID = HostID, Time = Yesterday})
	local Results = {}
	local PlayResults = {}
	for _, Info in ipairs(YesterdayRes) do
		Results[Info.StageId] = {TotalNum = Info.TotalNum, PassNum = Info.PassNum}
	end
	local TrailIDMap = TrailCfg.StageId2Id
	for _, Info in ipairs(LogRes) do
		--先统计活动关卡
		if Info.StageType == "活动关卡" then
			local InstanceType = TrailIDMap[tonumber(Info.StageId)]
			if InstanceType then
				PlayResults[InstanceType] = PlayResults[InstanceType] or {Uids={},TotalNum = 0}
				--统计参与人数
				PlayResults[InstanceType]["Uids"][Info.Uid] = true
				--统计参与次数
				PlayResults[InstanceType].TotalNum = PlayResults[InstanceType].TotalNum + 1
			end
		else --普通关卡和精英关卡
			if Info.IsFirstWin == 1 then --首次达成
				Results[Info.StageId] = Results[Info.StageId] or {TotalNum = 0, PassNum = 0}
				Results[Info.StageId].PassNum = Results[Info.StageId].PassNum + 1
			end
			if Info.IsFirstEnter == 1 then --首次参与
				Results[Info.StageId] = Results[Info.StageId] or {TotalNum = 0, PassNum = 0}
				Results[Info.StageId].TotalNum = Results[Info.StageId].TotalNum + 1
			end
		end
	end
	--结果记录副本统计表
	local RegNum = self:GetRegNum(PlatformID, HostID)
	for StageId, Info in pairs(Results) do
		InstanceData:Insert(PlatformID, HostID, Day, StageId, Info.TotalNum or 0, 
			Info.PassNum or 0, RegNum or 0)
	end
	--记录副本参与统计数据表
	for InstanceType, Info in pairs(PlayResults) do
		local Args = {
			PlatformID = PlatformID,
			HostID = HostID,
			Date = Day,
			InstanceType = InstanceType,
			UidNum = table.size(Info.Uids),
			PlayNum = Info.TotalNum,
		}
		InstancePlayData:Insert(PlatformID, Args)
	end
	return true
end

--获得这个服的注册人数
function GetRegNum(self, PlatformID, HostID)
	local Num = 0
	local RegRes = HistoryRegData:GetStatics({PlatformID = PlatformID, HostID = HostID})
	for _, Info in pairs(RegRes) do
		Num = Num + Info.RegNum
	end
	return Num
end




