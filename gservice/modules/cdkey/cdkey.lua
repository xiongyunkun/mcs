--[[
	激活码兑换相关逻辑
]]

local MAX_FAIL_NUM = 1000 -- 最大失败匹配次数，超过这个次数之后无论对错都返回错误
local UNVALID_FLAG = -1 --激活码无效标志
local PARAM_ERRO_FLAG = -2 --参数不合法标志
local CHEAT_FLAG = -3  --作弊标志，错误次数已经达到最大失败匹配次数
local HAS_USED_BATCH_FLAG = -4 --已使用该批次激活码，针对一个角色只能使用一次的情况
local HAS_EXCHANG_FLAG = 0 --已领取标志
local CAN_EXCHANG_FLAG = 1 --可领取标志
local CDKEY_LEN = 10  --激活码长度

function ExchangeKey(self)
	local CDKey = GetQueryArg("cdkey") or ""
	local Uid = GetQueryArg("uid") or ""
	local Urs = GetQueryArg("urs") or ""
	local HostID = GetQueryArg("hostid") or ""
	if not self:IsEmpty(CDKey) and not self:IsEmpty(Uid) and string.len(CDKey) == CDKEY_LEN and 
		not self:IsEmpty(Urs) and not self:IsEmpty(HostID) then
		--首先查找该玩家最近24小时的兑换记录
		local FailedNum = self:GetFailedNum(Uid)
		if FailedNum >= MAX_FAIL_NUM then
			ngx.say(Serialize({Result=CHEAT_FLAG})) --直接返回无效
			return
		end
		--查询数据库判断激活码是否有效
		local Res = CDKeyData:Get({CDKey = CDKey})
		if not Res or not Res[1] then
			CDKeyErrData:InsertErroData(CDKey, Uid, Urs, HostID)
			ngx.say(Serialize({Result=UNVALID_FLAG})) --没有该激活码,返回无效
			return
		end
		--判断是否已经领取
		if Res[1].IsValid ~= 1 then --已经被领取了，返回已经领取
			CDKeyErrData:InsertErroData(CDKey, Uid, Urs, HostID)
			ngx.say(Serialize({Result=HAS_EXCHANG_FLAG}))
			return
		end
		--获得奖励列表
		local RewardRes = CDKeyActivityData:Get({ID = Res[1].ActivityID})
		if not RewardRes or not RewardRes[1] then
			CDKeyErrData:InsertErroData(CDKey, Uid, Urs, HostID)
			ngx.say(Serialize({Result=UNVALID_FLAG})) --没有该激活码活动,返回无效
			return
		end
		RewardRes = RewardRes[1]
		--判断时间是否过期
		local NowTime = os.time()
		local StartTime = GetTimeStamp(RewardRes.StartTime)
		local EndTime = GetTimeStamp(RewardRes.EndTime)
		if StartTime > NowTime or EndTime < NowTime then
			CDKeyErrData:InsertErroData(CDKey, Uid, Urs, HostID)
			ngx.say(Serialize({Result=UNVALID_FLAG})) --没有该激活码活动,返回无效
			return
		end
		--判断使用类型
		local KeyTypeFlag = self:CheckKeyType(Uid, HostID, RewardRes, CDKey)
		if not KeyTypeFlag or KeyTypeFlag == HAS_USED_BATCH_FLAG then 
			CDKeyErrData:InsertErroData(CDKey, Uid, Urs, HostID)
			local Result = KeyTypeFlag or UNVALID_FLAG
			ngx.say(Serialize({Result=Result})) --不满足使用类型
			return
		end
		--判断平台是否满足
		local ServerInfo = ServerData:GetServerByHostID(HostID)
		if not ServerInfo.platformid or ServerInfo.platformid ~= RewardRes.PlatformID then
			CDKeyErrData:InsertErroData(CDKey, Uid, Urs, HostID)
			local Result = UNVALID_FLAG
			ngx.say(Serialize({Result=Result})) --不满足使用类型
			return
		end
		--更新兑奖记录
		local Args = {
			CDKey = CDKey,
			HostID = HostID,
			Uid = Uid,
			Urs = Urs,
			ActivityID = RewardRes.ID,
		}
		--TODO:这里还要再次判断一下是否已经领取，防止有人并发访问
		CDKeyExchangeData:Insert(Args)
		if RewardRes.KeyType ~= 4 then
			CDKeyData:AbortKey({CDKey = CDKey})
		end
		local RewardStr = RewardRes.Rewards
		ngx.say(Serialize({Result=CAN_EXCHANG_FLAG, Rewards = RewardStr}))
	else
		CDKeyErrData:InsertErroData(CDKey, Uid, Urs, HostID)
		ngx.say(Serialize({Result=PARAM_ERRO_FLAG})) --参数不合法
	end
end

--获得该玩家最近24小时兑换失败记录次数
function GetFailedNum(self, Uid)
	local NowTime = os.time()
	local EndTime = os.date("%Y-%m-%d %H:%M:%S", NowTime)
	local StartTime = os.date("%Y-%m-%d %H:%M:%S", NowTime - 86400)
	local Res = CDKeyErrData:Get({Uid = Uid, StartTime = StartTime, EndTime = EndTime})
	local FailedNum = 0 
	if Res then
		FailedNum = #Res
	end
	return FailedNum
end


--判断字符串是否为空
function IsEmpty(self, Str)
	if not Str or Str == "" then
		return true
	else
		return false
	end
end

-- 检查使用类型
function CheckKeyType(self, Uid, HostID, RewardRes, CDKey)
	local KeyType = RewardRes.KeyType
	if KeyType == 1 then --一个角色使用一次
		local Res = CDKeyExchangeData:Get({Uid = Uid, ActivityID = RewardRes.ID,})
		if Res and #Res > 0 then
			return HAS_USED_BATCH_FLAG --已经有使用过了
		else
			return true
		end
	elseif KeyType == 2 then --使用一次不限制角色
		return true -- 直接返回true
	elseif KeyType == 3 then --每个服只使用一次
		local Res = CDKeyExchangeData:Get({HostID = HostID, ActivityID = RewardRes.ID,})
		if Res and #Res > 0 then
			return false --已经有被使用了
		else
			return true
		end
	elseif KeyType == 4 then --微信礼包类型
		local Res = CDKeyExchangeData:Get({Uid = Uid, CDKey = CDKey})
		if Res and #Res > 0 then
			return false --已经有被使用了
		else
			return true
		end
	end
end

DoRequest(true)
