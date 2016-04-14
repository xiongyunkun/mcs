----------------------------------------
--$Id: gololog.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 从redis中获得在线人数数据,同时修正前5分钟数据（如果没有）
--]]

--
module(...,package.seeall)

local Frequency = 300 --实时在线为5分钟一个周期，300秒

--处理回调结果
function HandleResponse(self, LogList, ServerPlatformMap)
	local Time = CommonFunc.GetCorrectTime(Frequency)
	Time = os.date("%Y-%m-%d %H:%M:%S", Time)
	for _, LogJson in ipairs(LogList) do
		local OnlineNum = LogJson.num or 0
		local HostID = tonumber(LogJson.hostid)
		if tonumber(OnlineNum) ~= 0 and HostID then 
			local PlatformID = ServerPlatformMap[HostID]
			if PlatformID then
				OnlineData:Insert(PlatformID, HostID, OnlineNum, Time)
				self:CheckPreDataErro(PlatformID, HostID, Time)
			end
		end
	end
	return true
end

--检查前5分钟的在线人数数据是否正确，检查的标准是：此次有数据，前5分钟没有，但是前10分钟又有数据，
--所以用前10分钟的数据填入进前5分钟进来
function CheckPreDataErro(self, PlatformID, HostID, Time)
	local Timestamp = GetTimeStamp(Time)
	local Pre5Time = os.date("%Y-%m-%d %H:%M:%S", Timestamp - 300) --前5分钟
	local Pre10Time = os.date("%Y-%m-%d %H:%M:%S", Timestamp - 600) --前10分钟
	local Pre5Info = OnlineData:Get({PlatformID = PlatformID, HostID = HostID, ExactTime = Pre5Time})
	--前5分钟的数据没有但是前10分钟的数据有的话需要补齐前分钟的数据
	if #Pre5Info == 0 or Pre5Info[1].Num == 0 then 
		local Pre10Info = OnlineData:Get({PlatformID = PlatformID, HostID = HostID, ExactTime = Pre10Time})
		if #Pre10Info > 0 then --前10分钟有数据，所以补齐前5分钟的数据
			local OnlineNum = Pre10Info[1].Num
			OnlineData:Insert(PlatformID, HostID, OnlineNum, Pre5Time) --填入前5分钟数据
		end
	end
end
