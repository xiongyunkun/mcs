----------------------------------------
--$Id: common_func.lua 21449 2014-10-22 06:46:41Z xiongyunkun $
----------------------------------------
--[[
-- 公用方法
--
--]]

module(...,package.seeall)

-- 生成流水号
function GenerateTransID(OperationTime)
	local TimeStamp = GetTimeStamp(OperationTime)
	local Random = math.random(1, 9999) --取随机数
	return TimeStamp .. "" .. Random
end

--验证参数
function VerifyGMParms(GMRule, GMParams)
	--GM命令
	local GMCMD = ""
	local Func = function() GMCMD = string.format(GMRule, unpack(GMParams)) end
	local Succed, Err = xpcall(Func, debug.traceback)
	if not Succed then
		return false, "GM参数错误，请重新填写,Err:"..tostring(Err)
	else
		return true, GMCMD
	end
end

function ExecuteGM(Args, GMCMD, OperationTime, Operator)
	--先在tblGMOperations表中记录
	local Options = {
		PlatformID = Args.PlatformID,
		HostIDs = Args.HostID,
		RuleID = Args.GMID,
		GsID = 0,
		GMValues = GMCMD,
		OperationTime = OperationTime,
		Operator = Operator or "gservice",
		TransID = GenerateTransID(OperationTime),
		Memo = "",
	}
	local ID = GMOperationData:Insert(Options)
	--开始执行
	local ShellValues = {Args.HostID, 0, '"' .. GMCMD .. '"', "'" .. OperationTime .. "'", Options.TransID}
	ShellValues = table.concat(ShellValues, ";") --分号拼接
	--ngx.say(ShellValues)
	local Params = {
		shellname = "gm_cmd.sh",
		shellparam = ShellValues,
		IsPend = "true", --挂起等待
	}
	local Flag = nil
	local Response = nil
	for X = 1, 3 do --默认调用三次，只要有一次成功则跳出循环
		Flag, Response = ReqCmcsByServerId(tonumber(Args.HostID), "executegm", Params)
		if Flag then
			break
		end
	end
	--ngx.say(Response)
	local Result = "false"
	if Flag and Response then
		--提交对应的服务器
		GMOperationData:UpdateStatus(ID,2) --将状态更新为已执行
		--将结果记录入库
		GMOperationData:UpdateResult(ID, Response)
		Response = UnSerialize(Response) 
		if Response then
			Result = Response.Result
		end
	end
	return Flag, Result
end

--获得多玩平台的Uri中的HostID值，例如/yy/s1/broacast, HostID=s1
function GetDWHostID()
	local Uri = ngx.var.uri
	local Strs = string.split(Uri, "/")
	local ServerID = Strs[#Strs-1]
	local PlatformID = ""
	if ngx.var.host == "192.168.1.98" then --内网测试的
		PlatformID = "test"
	else
		PlatformID = "dw"
	end
	local HostID = ServerData:GetHostID(PlatformID, ServerID)
	return HostID
end

--获得HMacSha1加密后的字符串
function HMacSha1Str(Str, Key)
	local ShaStr = libtools.hmac_sha1(Str, Key)
	local ScretStr = ""
	for i = 1, string.len(ShaStr) do
		local charcode = tonumber(string.byte(ShaStr, i, i));
		ScretStr = ScretStr .. string.format("%02x", charcode);
	end
	return ScretStr
end
--url encode编码
function EncodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end
-- url decode解码
function decodeURI(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end

--获得对应平台接口的密钥
function GetInterfaceKey(PlatformID, IndexName)
	local Key = "123456" --默认都是123456
	local Options = {
		PlatformID = PlatformID,
		IndexName = IndexName,
	}
	local KeyInfo = InterfaceKeyData:Get(Options)
	if KeyInfo and KeyInfo[1] then
		Key = KeyInfo[1].Sign
	end
	return Key
end

--判断字符串是否为空
function IsStrEmpty(Str)
	return not Str or Str == ""
end

--调用cmcs端通过查询登陆日志获得玩家信息,适用于UserInfoData中查询不到玩家的情况
--param: HostID:服ID， SearchKey:查找字段(Uid, Urs), Value:字段值，需要转换为string类型
function GetUserInfoFromCmcs(HostID, SearchKey, Value)
	local NowTime = os.time()
	local Params = {
		FileNames = "key/login.log",
		HostID = HostID,
		StartTimes = os.date("%Y-%m-%d %H:%M:%S", NowTime - 600), --获取前10分钟的
	}
	local Flag = nil
	local Response = nil
	for X = 1, 2 do --默认调用2次，只要有一次成功则跳出循环
		Flag, Response = ReqCmcsByServerId(tonumber(HostID), "getlog", Params)
		if Flag then
			break
		end
	end
	local UserInfo = {}
	if Flag then
		Response  = UnSerialize(Response) 
		if Response then
			for FileName, LogContent in pairs(Response) do
				if LogContent ~= "" or LogContent ~= " " then
					local Lines = string.split(LogContent, "\n")
					for _, Line in ipairs(Lines) do
						if Line ~= "" and Line ~= " " then
							local TValue = GetLogValue(Line, SearchKey)
							if TValue == Value then --找到该玩家
								UserInfo[SearchKey] = Value
								UserInfo["Time"] = GetLogTime(Line)
								--解析角色名和uid等级等信息
								local Cols = {"Uid", "Ip", "Name", "Sex", "Lv", "Urs"}
								local ColNames = {"Uid", "Ip", "Name", "Sex", "Level", "Urs"}
								for Index, Col in ipairs(Cols) do
									if Col ~= SearchKey then
										local ColValue = GetLogValue(Line, Col)
										UserInfo[ColNames[Index]] = ColValue
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return UserInfo
end

--用正则表达式提取Log对应的内容
function GetLogValue(Line,Key, DefaultValue)
	local Key = Key .. "="
	local Value = DefaultValue or ""
	local From, To = string.find(Line, Key)
	if not From then
		return Value --没有找到，直接返回
	end
	local CLine = string.sub(Line, To+1)
	local Strs = string.split(CLine, ",")
	if Strs and Strs[1] then
		Value = Strs[1]
	end
	return Value
end

-- 获得Log中行数据的时间
function GetLogTime(Line)
	local Match = "%[[%S%s]+]"
	local Time = string.match(Line, Match)
	Time = string.sub(Time,2,string.len(Time)-1)
	return Time
end

--获得平台账号，根据传递过来的平台账号然后还得加上平台ID
function GetPlatformAccount(PlatformID, Account)
	local NewAccount = ""
	if PlatformID == "test" then
		PlatformID = "" --如果是测试环境就为空字符串
	end
	if Account and Account ~= "" then
		NewAccount = PlatformID .. "_" .. Account
	end
	return NewAccount
end

--获得平台账号列表，前面加上平台ID前缀
function GetPlatformAccounts(PlatformID, Accounts)
	local NewAccounts = {}
	if Accounts and Accounts ~= "" then
		if PlatformID == "test" then
			PlatformID = "" --如果是测试环境就为空字符串
		end
		Accounts = string.split(Accounts, ",")
		for _, Account in ipairs(Accounts) do
			table.insert(NewAccounts, PlatformID .. "_" .. Account)
		end
	end
	return table.concat( NewAccounts, ",")
end


 