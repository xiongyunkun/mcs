----------------------------------------
--$Id: mount_level_statics.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 坐骑等阶统计
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "MountLevelStatics" 
local MaxDay = 7 --统计的最大天数

--通过分析玩家信息表中的玩家等级获得玩家的等级分布
function CronStatics(self, PlatformID, HostID)
	local NowTime = os.time()
	local Day = os.date("%Y-%m-%d", NowTime) -- 统计当前时间的
	local MountUserList = MountLevelData:Get(PlatformID, {HostID = HostID})
	local DayTimeStamp = self:GetStartTimeStamp(NowTime) --获得第二天0点的时间戳
	local Results = {}
	for _, UserInfo in ipairs(MountUserList) do
		local LoginDiffDay = self:GetDiffDay(UserInfo.LoginTime, DayTimeStamp)
		local RegDiffDay = self:GetDiffDay(UserInfo.RegTime, DayTimeStamp)
		local EvoLevel = UserInfo.EvoLevel
		local Level = UserInfo.Level
		if not Results[EvoLevel] then
			Results[EvoLevel] = {[Level] = {}}
		elseif not Results[EvoLevel][Level] then
			Results[EvoLevel][Level] = {}
		end
		Results[EvoLevel][Level] = self:StaticsNum(LoginDiffDay, RegDiffDay, Results[EvoLevel][Level])
	end
	--记录入库
	for EvoLevel, EvoInfo in pairs(Results) do
		for Level, LevelInfo in pairs(EvoInfo) do
			for DayOnline, OnlineInfo in pairs(LevelInfo) do
				for NotDayReg, PlayerNum in pairs(OnlineInfo) do
					local Args = {
						PlatformID = PlatformID,
						HostID = HostID,
						StaticsIndex = "MountLevel",
						Date = Day,
						Level = EvoLevel,
						ChildLevel = Level,
						DayOnline = DayOnline,
						NotDayReg = NotDayReg,
						PlayerNum = PlayerNum,
					}
					PlayWayStaticsData:Insert(PlatformID, Args)
				end
			end
		end
	end
	return true
end

--返回第二天0点的时间戳
function GetStartTimeStamp(self, NowTime)
	local Date = os.date("%Y-%m-%d", NowTime)
	Date = Date .. " 00:00:00"
	local StartTime = GetTimeStamp(Date)
	StartTime = StartTime + 86400
	return StartTime
end

--获得这段时间的间隔天数,最小也为1天
function GetDiffDay(self, StartTime, EndTime)
	local DiffTime = EndTime - StartTime
	local DiffDay = math.floor(DiffTime/86400)
	return math.max(1, DiffDay)
end

--统计人数
--例如：玩家最近1天有登陆，那么近2-7天都需要加上，因为算近2-7天都有登陆
--玩家最近3天（大前天）注册的，那么算非近1-2天注册人数
function StaticsNum(self, LoginDiffDay, RegDiffDay, LevelResults)
	RegDiffDay = math.min(RegDiffDay, MaxDay) --上限是统计到MaxDay的
	for X = LoginDiffDay, MaxDay do
		LevelResults[X] = LevelResults[X] or {}
		for Y = 1, RegDiffDay do
			LevelResults[X][Y] = (LevelResults[X][Y] or 0) + 1
		end
		--统计近LoginDiffDay天登陆的汇总
		LevelResults[X][0] = (LevelResults[X][0] or 0) + 1
	end
	--同时近0天活跃非近0天注册用来记录总数
	LevelResults[0] = LevelResults[0] or {}
	LevelResults[0][0] = (LevelResults[0][0] or 0) + 1
	--还要统计非近Y天注册用来记录总数
	for Y = 1, RegDiffDay do
		LevelResults[0][Y] = (LevelResults[0][Y] or 0) + 1
	end
	return LevelResults
end




