----------------------------------------
--$Id: pay_actual_time.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 充值区间统计，按日期进行统计
--]]
--
module(...,package.seeall)

--统计指标
IndexName = "PayZoneStatics"

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	--从玩家充值统计表中获取数据进行统计
	local UserPayRes = UserPayStaticsData:Get(PlatformID, {HostID=HostID,})
	local Zones = self:ExtractZone()
	--按照玩家角色分类
	local Results = {}
	for _, UserPayInfo in ipairs(UserPayRes) do
		local TotalGold = UserPayInfo.TotalGold
		local ZoneID = nil
		for Idx, Limit in ipairs(Zones) do
			if TotalGold <= Limit then
				ZoneID = Idx
				break
			end
		end
		if not ZoneID then --如果没有找到则将最大的ZoneID赋值给它
			ZoneID = #Zones + 1
		end
		Results[ZoneID] = (Results[ZoneID] or 0) + 1
	end
	if table.size(Results) > 0 then
		PayZoneStaticsData:BatchInsert(PlatformID, HostID, Day, Results)
	end
	
	return true
end

--获得充值空间
function ExtractZone(self)
	local ZoneMap = PayZoneStaticsData:GetZoneMap()
	local ZoneList = {}
	for Idx, ZoneInfo in ipairs(ZoneMap) do
		if ZoneInfo[3] then
			ZoneList[Idx] = ZoneInfo[3]
		end
	end
	return ZoneList
end
	



