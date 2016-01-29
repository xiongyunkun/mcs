--[[
	接收cmcs端发送的支付订单状态更新请求
]]

function UpdatePayStatus(self)
	local Args = GetPostArgs()
	local OrderID = Args.OrderID
	local HostID = Args.HostID
	local Status = Args.Status or ""
	local StatusInfo = string.split(Status, " ") --{Status,PlatformID,Uid,UserName,URS,Level}
	if OrderID and #StatusInfo == 5 then
		--更新订单状态
		local PlatformID = StatusInfo[2]
		local PayInfo = {
			Status = StatusInfo[1],
			Uid = StatusInfo[3],
			Name = StatusInfo[4],
			Urs = StatusInfo[5],
		}
		PayOrderData:UpdatePayInfo(PlatformID, OrderID, PayInfo)
		ngx.say(1)
	else
		ngx.say(0)
	end
	
end

DoRequest(true)
