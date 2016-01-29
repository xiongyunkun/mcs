--[[
	有米平台充值接口
]]
local EXCHANGE_RATE = 10 --充值兑换钻石比例

function PayCallback(self)
	local Result = ""
	local Args = GetQueryArgs()
	local PlatformID = self:GetPlatformID(Args)
	if not self:CheckParamEmty(Args) then
		Result = "param_empty" --参数为空
		self:RecordLog(PlatformID, Result)
		ngx.print(Result) 
		return
	end
	if not self:VerifyParam(Args) then
		Result = "param_auth_erro"
		self:RecordLog(PlatformID, Result)
		ngx.print(Result) --参数验证失败
		return
	end
	
	--判断订单号是否重复
	local IsDuplicate = PayOrderData:CheckDuplicate(PlatformID, Args.order_id)
	if IsDuplicate then
		Result = "order_duplicate"
		self:RecordLog(PlatformID, Result)
		ngx.print(Result)
		return
	end
	--判断角色是否存在
	local UserInfo = self:GetUserInfo(PlatformID, Args.server_id, Args.role_id)
	if table.size(UserInfo) == 0 then --没有该玩家信息
		Result = "no_user_erro"
		self:RecordLog(PlatformID, Result)
		ngx.print(Result)
		return
	end
	local Money = tonumber(Args.money)/100 --有米传过来的是分，这里要转换成元
	local Gold = math.floor(Money) * EXCHANGE_RATE
	if Gold <= 0 then
		Result = "money_erro"
		self:RecordLog(PlatformID, Result)
		ngx.print(Result) --充值金额错误
		return
	end
	local InsertValues = {
		OrderID = Args.order_id,
		Urs = UserInfo.Urs, 
		Uid = Args.role_id,
		Name = UserInfo.Name,
		Level = UserInfo.Level or "1",
		HostID = Args.server_id,
		Currency = "RMB",
		CashNum = Money,
		PayChannel = Args.pay_type,
		Gold = Gold,
		Time = Args.pay_time,
		Callback = Args.callback or "",
		PlatformID = PlatformID,
	}
	--然后调用对应的游戏服充值接口
	local Status = self:SendPayRequest(InsertValues)
	InsertValues.Status = Status
	--记录入库
	PayOrderData:Insert(PlatformID, InsertValues)
	if Status < 0 then
		Result = "pay_failed"
		self:RecordLog(PlatformID, Result)
		ngx.print(Result) -- 充值失败
	else
		Result = "success"
		self:RecordLog(PlatformID, Result)
		ngx.print(Result)
	end
	return
end

--验证参数是否为空
function CheckParamEmty(self, Args)
	local CheckParams = {"order_id", "money", "server_id", "role_id", "openid",
		"order_status", "pay_time", "sdk_id", "chn_id", "sub_chn_id", "sign"}
	for _, Key in ipairs(CheckParams) do
		local Value = Args[Key]
		if not Value or Value == "" then
			return false --如果为空则直接返回
		end
	end
	return true
end

--验证参数是否正确
function VerifyParam(self, Args)
	local KeyList = {}
	for K, V in pairs(Args) do
		if K ~= "sign" then
			table.insert(KeyList, K)
		end
	end
	table.sort(KeyList) --升序排列
	local ParamArray = {}
	for _, K in ipairs(KeyList) do
		table.insert(ParamArray, K .. "=" .. Args[K])
	end
	local VerifyStr = table.concat(ParamArray, "")
	local Key = CommonFunc.GetInterfaceKey("youmi", "pay_order")
	VerifyStr = VerifyStr .. Key
	local Md5Str = libtools.md5(VerifyStr)
	if Md5Str == Args.sign then
		return true
	else
		return false
	end
end

--根据SDKID获得PlatformID
function GetPlatformID(self, Args)
	local PlatformID = "test"
	local SDKID = Args.sdk_id
	if SDKID then
		local PlatformInfo = PlatformData:Get({SDKID = SDKID})
		if PlatformInfo and PlatformInfo[1] then
			PlatformID = PlatformInfo[1].PlatformID
		end
	end
	return PlatformID
end

function GetUserInfo(self, PlatformID, HostID, Uid)
	local UserInfo = {}
	--判断玩家账号是否存在,先到数据库中查询玩家信息
	local Res = PlayerInfoData:Get({PlatformID = PlatformID, Uid = Uid, HostID = HostID})
	if not Res or #Res == 0 then
		--再去对应服查询该玩家信息
		UserInfo = CommonFunc.GetUserInfoFromCmcs(HostID, "Uid", Uid)
	else
		UserInfo = Res[1]
	end
	return UserInfo
end

--调用cmcs接口发送充值请求
function SendPayRequest(self, Args)
	--先获得服IP地址
	local Result = -1
	local Params = {
		OrderID = Args.OrderID,
		HostID = Args.HostID,
		Uid = Args.Uid,
		Name = Args.Name,
		Urs = Args.Urs,
		Gold = Args.Gold,
		Time = Args.Time,
		Callback = Args.Callback,
		PlatformID = Args.PlatformID,
	}
	local Flag = false
	local Response = nil
	for X = 1, 3 do --默认调用三次，只要有一次成功则跳出循环
		Flag, Response = ReqCmcsByServerId(tonumber(Args.HostID), "dopay", Params)
		if Flag then
			Result = tonumber(Response)
			break
		end
	end
	return Result
end

--记录充值日志
function RecordLog(self, PlatformID, Result)
	local Args = ngx.var.request_uri
	local Params = {
		OrderID = Args.order_id or "",
		Args = Args,
		Result = Result,
	}
	PayLogData:Insert(PlatformID, Params)
end

DoRequest(true)
