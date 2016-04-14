----------------------------------------
--$Id: gololog.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 留存率统计,针对新注册用户的指标统计
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "Retention" 

--计算新增用户数，不仅是新注册的，还要是进入游戏后的
function GetRegData(self, PlatformID, HostID, Date)
	local StartTime = Date .. " 00:00:00"
	local EndTime = Date .. " 23:59:59"
	local Options = {HostID = HostID, StartTime = StartTime, EndTime = EndTime,}
	--先拿到这天新注册的用户
	local RegRes = AddPlayerLogData:Get(PlatformID, Options)
	local ResList = {}
	for _, RegInfo in ipairs(RegRes) do
		ResList[RegInfo.Uid] = true
	end
	--再拿到登陆用户数
	local LoginRes = LoginLogData:Get(PlatformID, Options)
	local LoginList = {}
	for _, LoginInfo in ipairs(LoginRes) do
		LoginList[LoginInfo.Uid] = true
	end
	--结合两者算出该天的新增用户数,是既注册而且又登陆的用户
	local Results = {}
	for Uid, _ in pairs(ResList) do
		if LoginList[Uid] then
			Results[Uid] = true
		end
	end
	return Results
end

--计算首充用户数
function GetFirstPayUserData(self, PlatformID, HostID, Date)
	local StartTime = Date .. " 00:00:00"
	local EndTime = Date .. " 23:59:59"
	local Options = {HostID = HostID, StartFirstCashTime = StartTime, EndFirstCashTime = EndTime,}
	--获得这一天的首冲人数
	local Res = UserPayStaticsData:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[Info.Uid] = true
	end 
	return Results
end

--获得这一天的登陆数据
function GetLoginData(self, PlatformID, HostID, Date)
	local Options = {HostID = HostID, StartTime = Date .. " 00:00:00", EndTime = Date .. " 23:59:59",}
	local LoginRes = LoginLogData:Get(PlatformID, Options)
	local LoginList = {}
	for _, LoginInfo in ipairs(LoginRes) do
		LoginList[LoginInfo.Uid] = true
	end
	--再拿到这一天的退出日志，如果这个玩家这一天有退出操作，也算他有登陆过
	local LogoutRes = LogoutLogData:Get(PlatformID, Options)
	for _, LogoutInfo in ipairs(LogoutRes) do
		LoginList[LogoutInfo.Uid] = true
	end
	return LoginList
end

function CronStatics(self, PlatformID, HostID)
	local Today = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	--先获得今天的登陆数据
	local LoginList = self:GetLoginData(PlatformID, HostID, Today)
	--登陆用户付费率
	self:StaticsLoginUserRetention(PlatformID, HostID, Today, LoginList)
	--付费用户付费率
	self:StaticsPayUserRetention(PlatformID, HostID, Today, LoginList)
end

--统计登陆用户留存率
function StaticsLoginUserRetention(self, PlatformID, HostID, Today, LoginList)
	--每天的日期
	local RegDay = self:GetRegData(PlatformID, HostID, Today)
	local Day1 = CommonFunc.GetOverDate(Today, -1)
	local Day2 = CommonFunc.GetOverDate(Today, -2)
	local Day3 = CommonFunc.GetOverDate(Today, -3)
	local Day4 = CommonFunc.GetOverDate(Today, -4)
	local Day5 = CommonFunc.GetOverDate(Today, -5)
	local Day6 = CommonFunc.GetOverDate(Today, -6)
	local Day7 = CommonFunc.GetOverDate(Today, -7)
	local Day10 = CommonFunc.GetOverDate(Today, -10)
	local Day13 = CommonFunc.GetOverDate(Today, -13)
	local Day15 = CommonFunc.GetOverDate(Today, -15)
	local Day29 = CommonFunc.GetOverDate(Today, -29)
	local Day30 = CommonFunc.GetOverDate(Today, -30)
	--获得那一天的新增用户数
	local RegDay1 = self:GetRegData(PlatformID, HostID, Day1)
	local RegDay2 = self:GetRegData(PlatformID, HostID, Day2)
	local RegDay3 = self:GetRegData(PlatformID, HostID, Day3)
	local RegDay4 = self:GetRegData(PlatformID, HostID, Day4)
	local RegDay5 = self:GetRegData(PlatformID, HostID, Day5)
	local RegDay6 = self:GetRegData(PlatformID, HostID, Day6)
	local RegDay7 = self:GetRegData(PlatformID, HostID, Day7)
	local RegDay10 = self:GetRegData(PlatformID, HostID, Day10)
	local RegDay13 = self:GetRegData(PlatformID, HostID, Day13)
	local RegDay15 = self:GetRegData(PlatformID, HostID, Day15)
	local RegDay29 = self:GetRegData(PlatformID, HostID, Day29)
	local RegDay30 = self:GetRegData(PlatformID, HostID, Day30)
	-- 计算留存率
	local Rate1 = self:GetRetenRate(RegDay1, LoginList)
	local Rate2 = self:GetRetenRate(RegDay2, LoginList)
	local Rate3 = self:GetRetenRate(RegDay3, LoginList)
	local Rate4 = self:GetRetenRate(RegDay4, LoginList)
	local Rate5 = self:GetRetenRate(RegDay5, LoginList)
	local Rate6 = self:GetRetenRate(RegDay6, LoginList)
	local Rate7 = self:GetRetenRate(RegDay7, LoginList)
	local Rate10 = self:GetRetenRate(RegDay10, LoginList)
	local Rate13 = self:GetRetenRate(RegDay13, LoginList)
	local Rate15 = self:GetRetenRate(RegDay15, LoginList)
	local Rate29 = self:GetRetenRate(RegDay29, LoginList)
	local Rate30 = self:GetRetenRate(RegDay30, LoginList)
	--记录入库
	local Temp = {["NewNum"] = table.size(RegDay),["LoginNum"] = table.size(LoginList),}
	RetentionData:Insert(PlatformID, HostID, Today, Temp)
	RetentionData:Insert(PlatformID, HostID, Day1, {["1Days"] = Rate1})
	RetentionData:Insert(PlatformID, HostID, Day2, {["2Days"] = Rate2})
	RetentionData:Insert(PlatformID, HostID, Day3, {["3Days"] = Rate3})
	RetentionData:Insert(PlatformID, HostID, Day4, {["4Days"] = Rate4})
	RetentionData:Insert(PlatformID, HostID, Day5, {["5Days"] = Rate5})
	RetentionData:Insert(PlatformID, HostID, Day6, {["6Days"] = Rate6})
	RetentionData:Insert(PlatformID, HostID, Day7, {["7Days"] = Rate7})
	RetentionData:Insert(PlatformID, HostID, Day10, {["10Days"] = Rate10})
	RetentionData:Insert(PlatformID, HostID, Day13, {["13Days"] = Rate13})
	RetentionData:Insert(PlatformID, HostID, Day15, {["15Days"] = Rate15})
	RetentionData:Insert(PlatformID, HostID, Day29, {["29Days"] = Rate29})
	RetentionData:Insert(PlatformID, HostID, Day30, {["30Days"] = Rate30})
	return true
end

--统计付费用户留存率
function StaticsPayUserRetention(self, PlatformID, HostID, Today, LoginList)
	--每天的日期
	local RegDay = self:GetFirstPayUserData(PlatformID, HostID, Today)
	local Day1 = CommonFunc.GetOverDate(Today, -1)
	local Day2 = CommonFunc.GetOverDate(Today, -2)
	local Day3 = CommonFunc.GetOverDate(Today, -3)
	local Day4 = CommonFunc.GetOverDate(Today, -4)
	local Day5 = CommonFunc.GetOverDate(Today, -5)
	local Day6 = CommonFunc.GetOverDate(Today, -6)
	local Day7 = CommonFunc.GetOverDate(Today, -7)
	local Day10 = CommonFunc.GetOverDate(Today, -10)
	local Day13 = CommonFunc.GetOverDate(Today, -13)
	local Day15 = CommonFunc.GetOverDate(Today, -15)
	local Day29 = CommonFunc.GetOverDate(Today, -29)
	local Day30 = CommonFunc.GetOverDate(Today, -30)
	--获得那一天的首充人数
	local RegDay1 = self:GetFirstPayUserData(PlatformID, HostID, Day1)
	local RegDay2 = self:GetFirstPayUserData(PlatformID, HostID, Day2)
	local RegDay3 = self:GetFirstPayUserData(PlatformID, HostID, Day3)
	local RegDay4 = self:GetFirstPayUserData(PlatformID, HostID, Day4)
	local RegDay5 = self:GetFirstPayUserData(PlatformID, HostID, Day5)
	local RegDay6 = self:GetFirstPayUserData(PlatformID, HostID, Day6)
	local RegDay7 = self:GetFirstPayUserData(PlatformID, HostID, Day7)
	local RegDay10 = self:GetFirstPayUserData(PlatformID, HostID, Day10)
	local RegDay13 = self:GetFirstPayUserData(PlatformID, HostID, Day13)
	local RegDay15 = self:GetFirstPayUserData(PlatformID, HostID, Day15)
	local RegDay29 = self:GetFirstPayUserData(PlatformID, HostID, Day29)
	local RegDay30 = self:GetFirstPayUserData(PlatformID, HostID, Day30)
	-- 计算留存率
	local Rate1 = self:GetRetenRate(RegDay1, LoginList)
	local Rate2 = self:GetRetenRate(RegDay2, LoginList)
	local Rate3 = self:GetRetenRate(RegDay3, LoginList)
	local Rate4 = self:GetRetenRate(RegDay4, LoginList)
	local Rate5 = self:GetRetenRate(RegDay5, LoginList)
	local Rate6 = self:GetRetenRate(RegDay6, LoginList)
	local Rate7 = self:GetRetenRate(RegDay7, LoginList)
	local Rate10 = self:GetRetenRate(RegDay10, LoginList)
	local Rate13 = self:GetRetenRate(RegDay13, LoginList)
	local Rate15 = self:GetRetenRate(RegDay15, LoginList)
	local Rate29 = self:GetRetenRate(RegDay29, LoginList)
	local Rate30 = self:GetRetenRate(RegDay30, LoginList)
	--记录入库
	local Temp = {["FirstPayUserNum"] = table.size(RegDay),["LoginNum"] = table.size(LoginList),}
	PayRetentionData:Insert(PlatformID, HostID, Today, Temp)
	PayRetentionData:Insert(PlatformID, HostID, Day1, {["1Days"] = Rate1})
	PayRetentionData:Insert(PlatformID, HostID, Day2, {["2Days"] = Rate2})
	PayRetentionData:Insert(PlatformID, HostID, Day3, {["3Days"] = Rate3})
	PayRetentionData:Insert(PlatformID, HostID, Day4, {["4Days"] = Rate4})
	PayRetentionData:Insert(PlatformID, HostID, Day5, {["5Days"] = Rate5})
	PayRetentionData:Insert(PlatformID, HostID, Day6, {["6Days"] = Rate6})
	PayRetentionData:Insert(PlatformID, HostID, Day7, {["7Days"] = Rate7})
	PayRetentionData:Insert(PlatformID, HostID, Day10, {["10Days"] = Rate10})
	PayRetentionData:Insert(PlatformID, HostID, Day13, {["13Days"] = Rate13})
	PayRetentionData:Insert(PlatformID, HostID, Day15, {["15Days"] = Rate15})
	PayRetentionData:Insert(PlatformID, HostID, Day29, {["29Days"] = Rate29})
	PayRetentionData:Insert(PlatformID, HostID, Day30, {["30Days"] = Rate30})
	return true
end

--计算留存率
function GetRetenRate(self, RegList, LoginList)
	local RegNum = table.size(RegList)
	if RegNum == 0 then
		return 0  --直接返回0
	end
	local RetNum = 0
	for Uid, _ in pairs(LoginList) do
		if RegList[Uid] then
			RetNum = RetNum + 1
		end
	end
	
	local Rate = math.floor(RetNum*10000/RegNum)/100
	return Rate
end


