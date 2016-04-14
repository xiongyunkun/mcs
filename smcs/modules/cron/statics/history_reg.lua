----------------------------------------
--$Id: history_reg.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 历史注册
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "HistoryReg" 

function CronStatics(self, PlatformID, HostID)
	local NowTime = os.time()
	local Day = os.date("%Y-%m-%d", NowTime - 3600) -- 统计前一个小时的
	--把今天的注册数据都读取出来
	local RegRes = AddPlayerData:Get({PlatformID = PlatformID, HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	--计算结果
	local RegNum = 0
	local Male = 0
	local Female = 0
	for _, Info in ipairs(RegRes) do
		RegNum = RegNum + Info.Num
		Male = Male + Info.Male
		Female = Female + Info.Female
	end
	--再计算总注册人数，先获得昨天的总注册人数
	local TotalRegNum = RegNum
	local Yesterday = os.date("%Y-%m-%d", NowTime - 3600 - 86400)
	local YesterdayInfo = HistoryRegData:Get({PlatformID = PlatformID, HostID = HostID,Date = Yesterday})
	if YesterdayInfo and YesterdayInfo[1] then
		TotalRegNum = TotalRegNum + (YesterdayInfo[1].TotalRegNum or 0)
	end
	HistoryRegData:Insert(PlatformID, HostID, Day, RegNum, Male, Female, TotalRegNum)
	return true
end




