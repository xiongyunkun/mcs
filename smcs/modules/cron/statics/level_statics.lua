----------------------------------------
--$Id: level_statics.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 等级统计
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "LevelStatics" 

--通过分析玩家信息表中的玩家等级获得玩家的等级分布
function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", ngx.time() - 3600) -- 统计前一个小时的
	--从玩家信息表中获取对应玩家的等级分布
	local LevelList = {}
	local UsersRes = UserInfoData:Get({PlatformID = PlatformID, HostID = HostID, MaxRegTime = Day .. " 23:59:59"})
	for _, UserInfo in ipairs(UsersRes) do
		LevelList[UserInfo.Level] = LevelList[UserInfo.Level] or {}
		table.insert(LevelList[UserInfo.Level], UserInfo.Uid)
	end
	--再从退出日志中获得今天的活跃用户
	local LoginUserNums = {} --今天登陆过的用户数目
	local LiveUserNums = {} -- 今天登陆时长超过4小时的用户数目（活跃用户）
	local PayUserNums = {} --今天充值用户数
	local PayLiveUserNums = {} --今天充值的活跃用户数
	local LoginUserList = {}
	local LogoutUserList = {}
	local PayUserList = {}
	local LoginRes = LoginLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	local LogoutRes = LogoutLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	for _, Info in ipairs(LoginRes) do
		local Uid = tonumber(Info.Uid)
		LoginUserList[Uid] = true
	end
	for _, Info in ipairs(LogoutRes) do
		local Uid = tonumber(Info.Uid)
		LogoutUserList[Uid] = (LogoutUserList[Uid] or 0) + tonumber(Info.OnTime or 0)
	end
	--从玩家日充值统计表中获取该服该天的充值情况
	local PayDayRes = UserPayDayStaticsData:Get(PlatformID, {Date = Day, HostID = HostID})
	for _, Info in ipairs(PayDayRes) do
		PayUserList[Info.Uid] = true
	end
	for Level, UidList in pairs(LevelList) do
		for _, Uid in ipairs(UidList) do
			if LoginUserList[Uid] then
				LoginUserNums[Level] = (LoginUserNums[Level] or 0) + 1
			end
			if LogoutUserList[Uid] and LogoutUserList[Uid] >= 14400  then --4小时
				LiveUserNums[Level] = (LiveUserNums[Level] or 0) + 1 --活跃用户
				if PayUserList[Uid] then
					PayLiveUserNums[Level] = (PayLiveUserNums[Level] or 0) + 1
				end 
			end
			if PayUserList[Uid] then
				PayUserNums[Level] = (PayUserNums[Level] or 0) + 1
			end
		end
	end

	local MaxLevel = CommonData.MaxLevel
	for X = 1, MaxLevel do
		local TotalNum = LevelList[X] and #LevelList[X] or 0
		local LivelNum = LiveUserNums[X] or 0
		local PayNum = PayUserNums[X] or 0
		local PayLivelNum = PayLiveUserNums[X] or 0
		local NumInfo = {
			TotalNum = TotalNum,
			LivelNum = LivelNum,
			PayNum = PayNum,
			PayLivelNum = PayLivelNum,
		}
		LevelStaticsData:Insert(PlatformID, HostID, Day, X, NumInfo)
	end
	
	------------------再统计昨天的流失率---------------------------------------------
	--获得昨天的活跃用户数
	local Yesterday = os.date("%Y-%m-%d", ngx.time() - 3600 - 86400)
	local LastLogoutRes = LogoutLogData:Get(PlatformID, {HostID = HostID, StartTime = Yesterday .. " 00:00:00", EndTime = Yesterday .. " 23:59:59"})
	local LastLiveUids = {}  -- 记录玩家uid与在线时长的对应关系
	local LastUidLevels = {} --记录玩家uid与等级的对应关系
	for _, Info in ipairs(LastLogoutRes) do
		local Uid = tonumber(Info.Uid)
		LastLiveUids[Uid] = (LastLiveUids[Uid] or 0) + tonumber(Info.OnTime or 0)
		LastUidLevels[Uid] = Info.Level
	end
	local LastLostLiveUids = {} --昨天的活跃用户流失数
	local LastLostPayLevels = {} --昨天的付费用户流失数
	local LastLostPayLiveLevels = {} --昨天的付费活跃流失用户数
	local YesterdayPayRes = UserPayDayStaticsData:Get(PlatformID, {Date = Yesterday, HostID = HostID})
	local YesterdayPayUserList = {}
	for _, YesterdayPayInfo in ipairs(YesterdayPayRes) do
		YesterdayPayUserList[YesterdayPayInfo.Uid] = true
	end
	for Uid, Time in pairs(LastLiveUids) do
		if Time >= 14400 and not LoginUserList[Uid] then  --看看这些活跃用户今天有没有登录
			LastLostLiveUids[LastUidLevels[Uid]] = (LastLostLiveUids[LastUidLevels[Uid]] or 0) + 1
			if YesterdayPayUserList[Uid] then
				LastLostPayLiveLevels[LastUidLevels[Uid]] = (LastLostPayLiveLevels[LastUidLevels[Uid]] or 0) + 1
			end
		end
	end
	--统计流失率是因为这些玩家到今天都没有登录过游戏，玩家等级可以直接从UserInfo表中获得
	for Level, UidList in pairs(LevelList) do
		for _, Uid in ipairs(UidList) do
			if YesterdayPayUserList[Uid] and not LoginUserList[Uid] then --今天都没有登录就算流失
				LastLostPayLevels[Level] = (LastLostPayLevels[Level] or 0) + 1
			end 
		end
	end 
	for X = 1, MaxLevel do
		--昨天的用户流失率可以直接根据用户信息表中该等级的玩家今天没有登录日志的情况来判断
		local TotalNum = LevelList[X] and #LevelList[X] or 0
		local TotalLostNum = TotalNum - (LoginUserNums[X] or 0) --总流失数
		local LiveLostNum = LastLostLiveUids[X] or 0 --活跃用户流失
		local PayLostNum = LastLostPayLevels[X] or 0 --付费用户流失
		local PayLiveLostNum = LastLostPayLiveLevels[X] or 0 --活跃付费用户流失
		local NumInfo = {
			TotalLostNum = TotalLostNum,
			LiveLostNum = LiveLostNum,
			PayLostNum = PayLostNum,
			PayLiveLostNum = PayLiveLostNum,
		}
		LevelStaticsData:UpdateLostNum(PlatformID, HostID, Yesterday, X, NumInfo)
	end
	return true
end



