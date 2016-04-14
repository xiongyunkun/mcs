----------------------------------------
--$Id: pay_actual_time.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 实时充值统计，每5分钟统计一次,单独统计
--]]
--
module(...,package.seeall)

--统计指标
IndexName = "PayActualTime"

--获得上一次统计时间
function GetLastStaticsTime(self, HostID)
	local OrderIDs = ""
	local StartDate = os.date("%Y-%m-%d",os.time()) 
	local StaticsTime = os.date("%Y-%m-%d %H:%M:%S",GetTimeStamp(StartDate .. " 00:00:00"))  --默认是当天的0点
	local Res = PayStaticsCfgData:Get({HostID = HostID})
	if Res and Res[1] then
		StaticsTime = Res[1]["StaticsTime"]
		OrderIDs = Res[1]["OrderIDs"]
	end
	--再将OrderIDs分割成数组
	local NewOrderIDs = {}
	OrderIDs = string.split(OrderIDs, ",")
	for _, OrderID in ipairs(OrderIDs) do
		NewOrderIDs[OrderID] = true
	end
	return StaticsTime, NewOrderIDs
end 

--既要统计实时充值，又要统计玩家角色充值统计
function CronExecute(self, PlatformID, HostID)
	local LastStaticsTime, OrderIDs = self:GetLastStaticsTime(HostID)
	--从充值订单表中拿到这一次要统计的订单列表
	local PayOrderList = PayOrderData:Get(PlatformID, {HostID=HostID, StartTime = LastStaticsTime})
	--先拿到最后的充值订单时间
	local NowStaticsTime = nil 
	if PayOrderList and #PayOrderList > 0 then
		NowStaticsTime = PayOrderList[#PayOrderList].Time
	end
	local NowOrderIDs = {}
	local TotalPayCashNum = 0
	local PayUsers = {}
	local UserPayList = {}
	for _, PayOrder in ipairs(PayOrderList) do
		if not OrderIDs[PayOrder.OrderID] then --只统计不在上一次统计时间的订单
			TotalPayCashNum = TotalPayCashNum + PayOrder.CashNum
			PayUsers[PayOrder.Uid] = true
			if PayOrder.Time == NowStaticsTime then
				table.insert(NowOrderIDs, PayOrder.OrderID)
			end
			--统计玩家充值统计
			if not UserPayList[PayOrder.Uid] then
				UserPayList[PayOrder.Uid] = {
					HostID = HostID,
					Uid = PayOrder.Uid,
					Urs = PayOrder.Urs,
					Name = PayOrder.Name,
					Date = Day,
					Currency = PayOrder.Currency,
					TotalCashNum = PayOrder.CashNum, --总充值金额
					TotalNum = 1, --充值次数
					TotalGold = PayOrder.Gold, --总钻石
					FirstCashNum = PayOrder.CashNum, --首冲金额
					FirstCashTime = PayOrder.Time, --首冲时间
					LastCashNum = PayOrder.CashNum, --最后充值金额
					LastCashTime = PayOrder.Time, --最后充值时间
					MinCashNum = PayOrder.CashNum, --最低充值金额
					MaxCashNum = PayOrder.CashNum, --最大充值金额
				}
			else
				UserPayList[PayOrder.Uid].TotalCashNum = UserPayList[PayOrder.Uid].TotalCashNum + PayOrder.CashNum
				UserPayList[PayOrder.Uid].TotalNum = UserPayList[PayOrder.Uid].TotalNum + 1
				UserPayList[PayOrder.Uid].TotalGold = UserPayList[PayOrder.Uid].TotalGold + PayOrder.Gold
				UserPayList[PayOrder.Uid].LastCashNum = PayOrder.CashNum
				UserPayList[PayOrder.Uid].LastCashTime = PayOrder.Time
				UserPayList[PayOrder.Uid].MinCashNum = math.min(UserPayList[PayOrder.Uid].MinCashNum, PayOrder.CashNum)
				UserPayList[PayOrder.Uid].MaxCashNum = math.max(UserPayList[PayOrder.Uid].MaxCashNum, PayOrder.CashNum)
			end
		end
	end
	--只记录充值金额不为0的充值统计
	if TotalPayCashNum ~= 0 then
		local ExecuteTime = CommonFunc.GetCorrectTime(300) --5分钟统计一次
		ExecuteTime = os.date("%Y-%m-%d %H:%M:%S", ExecuteTime)
		local PayUserNum = table.size(PayUsers)
		PayActualTimeData:Insert(PlatformID, HostID, TotalPayCashNum, PayUserNum, ExecuteTime)
		--然后插入玩家充值统计表
		UserPayStaticsData:BatchInsert(PlatformID, UserPayList) --插入玩家充值统计数据库
		if NowStaticsTime == LastStaticsTime then 
			--上一次统计时间和这一次的相同，表示这段时间内都没有数据进来，时间也是往后推1秒
			NowStaticsTime = GetTimeStamp(LastStaticsTime)
			NowStaticsTime = NowStaticsTime + 1
			NowStaticsTime = os.date("%Y-%m-%d %H:%M:%S", NowStaticsTime)
		end
	elseif table.size(OrderIDs) ~= 0 then 
		--当前没有统计订单，但是上一次又有订单，所以将统计时间往后推1秒，类似于日志统计那里的逻辑
		NowStaticsTime = GetTimeStamp(LastStaticsTime)
		NowStaticsTime = NowStaticsTime + 1
		NowStaticsTime = os.date("%Y-%m-%d %H:%M:%S", NowStaticsTime)
	end
	if NowStaticsTime then
		--更新统计时间
		PayStaticsCfgData:Update({HostID = HostID, OrderIDs = table.concat( NowOrderIDs, ","), StaticsTime = NowStaticsTime})
	end
end
	



