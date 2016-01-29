----------------------------------------
--$Id: pay_actual_time.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 玩家充值统计，按日期对充值进行统计
--]]
--
module(...,package.seeall)

--统计指标
IndexName = "UserPayDayStatics"

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", ngx.time() - 3600) -- 统计前一个小时的
	--从充值订单表中拿到这一次要统计的订单列表
	local PayOrderList = PayOrderData:Get(PlatformID, {HostID=HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	--按照玩家角色分类
	local Results = {} --记录玩家日充值统计结果
	local FrequencyResults = {} --记录充值频率统计结果
	for _, PayOrderInfo in ipairs(PayOrderList) do
		if not Results[PayOrderInfo.Uid] then
			Results[PayOrderInfo.Uid] = {
				HostID = HostID,
				Uid = PayOrderInfo.Uid,
				Urs = PayOrderInfo.Urs,
				Name = PayOrderInfo.Name,
				Date = Day,
				Currency = PayOrderInfo.Currency,
				TotalCashNum = PayOrderInfo.CashNum,
				TotalNum = 1, --充值次数
				TotalGold = PayOrderInfo.Gold, --总钻石
			}
		else
			Results[PayOrderInfo.Uid].TotalCashNum = Results[PayOrderInfo.Uid].TotalCashNum + PayOrderInfo.CashNum
			Results[PayOrderInfo.Uid].TotalNum = Results[PayOrderInfo.Uid].TotalNum + 1
			Results[PayOrderInfo.Uid].TotalGold = Results[PayOrderInfo.Uid].TotalGold + PayOrderInfo.Gold
		end
		--再统计该天的充值频率
		FrequencyResults[PayOrderInfo.Uid] = (FrequencyResults[PayOrderInfo.Uid] or 0) + 1
	end
	if table.size(Results) > 0 then
		UserPayDayStaticsData:BatchInsert(PlatformID, Results) --插入玩家日充值统计数据库
	end
	--充值频率区间统计
	if table.size(FrequencyResults) > 0 then
		local NewFrequencyResults = self:StaticsFrequency(FrequencyResults)
		NewFrequencyResults["HostID"] = HostID
		NewFrequencyResults["Date"] = Day
		PayDayFrequencyStaticsData:Insert(PlatformID, NewFrequencyResults) --插入统计频率区间数据库
	end
	return true
end

--充值频率空间
local FrequencyMap = {
	["Pay1Num"] = {1,1},
	["Pay2Num"] = {2,2},
	["Pay3Num"] = {3,3},
	["Pay4Num"] = {4,4},
	["Pay5Num"] = {5,5},
	["Pay6Num"] = {6,10},
	["Pay11Num"] = {11,20},
	["Pay20Num"] = {21},
}

--统计各充值频率区间人数
function StaticsFrequency(self, FrequencyResults)
	local Results = {}
	local TotalNum = 0
	for _, Num in pairs(FrequencyResults) do
		for FrequencyName, Zone in pairs(FrequencyMap) do
			if Num >= Zone[1] and Zone[2] and Num <= Zone[2] then
				Results[FrequencyName] = (Results[FrequencyName] or 0) + 1
				break --跳出循环，统计下一个玩家
			end
		end
		TotalNum = TotalNum + 1
	end
	Results["PayUserNum"] = TotalNum
	return Results
end
	



