----------------------------------------
--$Id: fighting.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 历史在线统计
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "HistoryOnline" 
local MIN_NUM = 100000 --最低在线人数判断阀值

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	--把今天的在线数据都读取出来
	local OnlineRes = OnlineData:Get({PlatformID = PlatformID, HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	local Period = self:GetPeriod(Day)
	local MaxNum, AveNum, MinNum = self:GetNum(OnlineRes, Period)
	HistoryOnlineData:Insert(PlatformID, HostID, Day, MaxNum, AveNum, MinNum)
	return true
end

function CronTotalStatics(self, ServerPlatformMap)
	local Day = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	local Period = self:GetPeriod(Day)
	local Options = {StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59", StaticsType="all"}
	local OnlineRes = OnlineData:GetStatics(Options)
	local MaxNum, AveNum, MinNum = self:GetStaticsNum(OnlineRes, Period) 
	HistoryOnlineData:Insert("all", 0, Day, MaxNum, AveNum, MinNum)
	--再计算各个平台的
	local PlatformList = {}
	for HostID, PlatformID in pairs(ServerPlatformMap) do
		if not PlatformList[PlatformID] then
			PlatformList[PlatformID] = true
		end
	end
	for PlatformID, _ in pairs(PlatformList) do
		Options.PlatformID = PlatformID
		OnlineRes = OnlineData:GetStatics(Options)
		MaxNum, AveNum, MinNum = self:GetStaticsNum(OnlineRes, Period) 
		HistoryOnlineData:Insert(PlatformID, 0, Day, MaxNum, AveNum, MinNum)
	end
	return true
end

--根据在线数据获得最高在线和平均在线值
function GetNum(self, OnlineRes, Period)
	local MaxNum = 0
	local MinNum = MIN_NUM
	local AveNum = 0
	local TotalNum = 0
	for _, Info in ipairs(OnlineRes) do
		TotalNum = TotalNum + Info.Num
		if Info.Num > MaxNum then
			MaxNum = Info.Num
		end
		if Info.Num < MinNum then
			MinNum = Info.Num
		end
	end
	if TotalNum ~= 0 then
		AveNum = math.ceil(TotalNum/Period)
	end
	-- 如果还是等于MIN_NUM或者有区间段没有统计数据的话最低人数直接变为0
	if MinNum == MIN_NUM or #OnlineRes ~= Period then
		MinNum = 0 
	end
	return MaxNum, AveNum, MinNum
end

--获得统计汇总时间内的最高在线和平均在线
function GetStaticsNum(self, StaticsRes, Period)
	local MaxNum = 0
	local MinNum = MIN_NUM
	local AveNum = 0
	local TotalNum = 0
	for Time, Num in pairs(StaticsRes) do
		TotalNum = TotalNum + Num
		if Num > MaxNum then
			MaxNum = Num
		end
		if Num < MinNum then
			MinNum = Num
		end
	end
	if TotalNum ~= 0 then
		AveNum = math.ceil(TotalNum/Period)
	end
	-- 如果还是等于MIN_NUM或者有区间段没有统计数据的话最低人数直接变为0
	if MinNum == MIN_NUM or table.size(StaticsRes) ~= Period then
		MinNum = 0 
	end
	return MaxNum, AveNum, MinNum
end

--获得时间周期次数(即经历过多少个5分钟)
function GetPeriod(self, Day)
	local StartTime = GetTimeStamp(Day .. " 00:00:00")
	local NowTime = os.time()
	local EndTime = StartTime + 86400 
	EndTime = EndTime < NowTime and EndTime or NowTime
	local Num = 0
	while StartTime < EndTime do
		StartTime = StartTime + 300 --5分钟统计一次的
		Num = Num + 1
	end
	return Num
end




