--[[
	接收cmcs端发送的支付订单状态更新请求
]]

function UpdatePayStatus(self)
	local Args = GetPostArgs()
	local OrderID = Args.OrderID
	local HostID = Args.HostID
	local Status = Args.Status
	local ServerPlatformMap = ServerData:GetServerPlatformMap()
	local PlatformID = ServerPlatformMap[tonumber(HostID)]
	if OrderID and Status and PlatformID then
		--更新订单状态
		local StatusInfo = string.split(Status, " ")
		if #StatusInfo == 5 then --{Status,Uid,UserName,URS,Level}
			local PayInfo = {
				Status = StatusInfo[1],
				Uid = StatusInfo[2],
				Name = StatusInfo[3],
				Urs = StatusInfo[4],
				Level = StatusInfo[5],
			}
			PayOrderData:UpdatePayInfo(PlatformID, OrderID, PayInfo)
		else --兼容旧的数据，只发送充值状态过来
			PayOrderData:UpdateStatus(PlatformID, OrderID, StatusInfo[1])
		end
		ngx.say(1)
	else
		ngx.say(0)
	end
	
end

DoRequest(true)
