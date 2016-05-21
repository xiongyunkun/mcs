----------------------------------------
--$Id: pay_day_statics.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 日充值统计
--]]
--
module(...,package.seeall)

--统计指标
IndexName = "PayDayStatics"

function CronStatics(self, PlatformID, HostID)
	local NowTime = os.time()
	local Day = os.date("%Y-%m-%d", NowTime - 3600) -- 统计前一个小时的
	--从玩家日充值统计表中获得此次要统计的列表
	local UserPayList = UserPayDayStaticsData:Get(PlatformID, {HostID=HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	--按照玩家角色分类
	local DayPayInfo = {
		HostID = HostID,
		Date = Day,
		Currency = "USD", --默认是人民币
		CashNum = 0, --充值金额
		PayGold = 0, --充值钻石数量
		PayNum = 0, --充值次数
		PayUserNum = 0, --充值人数
		FirstPayUserNum = 0, --首冲人数
		GoldConsume = 0, --非绑钻消耗数
		GoldProduce = 0, --非绑钻产出数
		CreditGoldProduce = 0, --绑钻产出数
		CreditGoldConsume = 0, --绑钻消耗数
		TotalPayGold = 0, --总充值钻石
		TotalGoldProduce = 0, --总非绑钻石产出数
		TotalGoldConsume = 0, --总非绑钻消耗数
		TotalCreditGoldProduce = 0, --总绑钻产出数
		TotalCreditGoldConsume = 0, --总绑钻消耗数
	}
	for _, UserPayInfo in ipairs(UserPayList) do
		DayPayInfo.Currency = UserPayInfo.Currency
		DayPayInfo.CashNum = DayPayInfo.CashNum + UserPayInfo.TotalCashNum
		DayPayInfo.PayGold = DayPayInfo.PayGold + UserPayInfo.TotalGold
		DayPayInfo.PayNum = DayPayInfo.PayNum + UserPayInfo.TotalNum
		DayPayInfo.PayUserNum = DayPayInfo.PayUserNum + 1
	end
	DayPayInfo.FirstPayUserNum = UserPayStaticsData:GetFirstCashNum(PlatformID, HostID, Day) --首冲人数
	local GoldConsume, CreditGoldConsume, GoldProduce, CreditGoldProduce = self:GetDayGoldInfo(PlatformID, HostID, Day)
	DayPayInfo.GoldConsume = GoldConsume
	DayPayInfo.CreditGoldConsume = CreditGoldConsume
	DayPayInfo.GoldProduce = GoldProduce
	DayPayInfo.CreditGoldProduce = CreditGoldProduce
	--然后还有给总数赋值
	DayPayInfo.TotalCashNum = DayPayInfo.CashNum
	DayPayInfo.TotalPayGold = DayPayInfo.PayGold 
	DayPayInfo.TotalGoldProduce = DayPayInfo.GoldProduce
	DayPayInfo.TotalCreditGoldProduce = DayPayInfo.CreditGoldProduce
	DayPayInfo.TotalGoldConsume = DayPayInfo.GoldConsume
	DayPayInfo.TotalCreditGoldConsume = DayPayInfo.CreditGoldConsume
	--拿到昨天的数据累加总充值钻石、总钻石产出数、总钻石消耗数
	local Yesterday = os.date("%Y-%m-%d", NowTime - 3600 - 86400) --昨天
	local YesterdayInfo = PayDayStaticsData:Get(PlatformID, {HostID = HostID, Date = Yesterday})
	if YesterdayInfo and YesterdayInfo[1] then
		--叠加昨天的数据
		DayPayInfo.TotalCashNum = DayPayInfo.TotalCashNum + YesterdayInfo[1].TotalCashNum
		DayPayInfo.TotalPayGold = DayPayInfo.TotalPayGold + YesterdayInfo[1].TotalPayGold
		DayPayInfo.TotalGoldProduce = DayPayInfo.TotalGoldProduce + YesterdayInfo[1].TotalGoldProduce
		DayPayInfo.TotalGoldConsume = DayPayInfo.TotalGoldConsume + YesterdayInfo[1].TotalGoldConsume
		DayPayInfo.TotalCreditGoldProduce = DayPayInfo.TotalCreditGoldProduce + YesterdayInfo[1].TotalCreditGoldProduce
		DayPayInfo.TotalCreditGoldConsume = DayPayInfo.TotalCreditGoldConsume + YesterdayInfo[1].TotalCreditGoldConsume
	end
	PayDayStaticsData:Insert(PlatformID, DayPayInfo) --记录入库
	return true
end

--获得日钻石数据扣除和产出数
function GetDayGoldInfo(self, PlatformID, HostID, Date)
	local GoldConsume = 0 --非绑钻消耗
	local CreditGoldConsume = 0 --绑钻消耗
	local GoldProduce = 0 --非绑钻产出
	local CreditGoldProduce = 0 --绑钻产出
	local Options = {
		PlatformID = PlatformID,
		HostID = HostID,
		Date = Date,
	}
	local GoldList = GoldData:Get(Options)
	for _, GoldInfo in ipairs(GoldList) do
		if GoldInfo.StaticsType == 1 then --消耗
			if GoldInfo.GoldType == 1 then --非绑钻
				GoldConsume = GoldConsume + GoldInfo.Value
			else
				CreditGoldConsume = CreditGoldConsume + GoldInfo.Value
			end
		elseif GoldInfo.StaticsType == 2 then --产出
			if GoldInfo.GoldType == 1 then --非绑钻
				GoldProduce = GoldProduce + GoldInfo.Value
			else
				CreditGoldProduce = CreditGoldProduce + GoldInfo.Value
			end
		end	
	end 
	return GoldConsume, CreditGoldConsume, GoldProduce, CreditGoldProduce
end
	



