iconv = require("iconv")
require("libtools")
utf2gbk = iconv.new("gbk","utf8")
json = require("base.json")
DB = require("base.database")

ServerData = require("model.serverdata")
PlatformData = require("model.platform_data")
GMRuleData = require("model.gm_rule_data")
GMOperationData = require("model.gm_operation_data")
PlayerInfoData = require("model.user_info_data")
--激活码
CDKeyActivityData = require("model.cdkey.cdkey_activity_data")
CDKeyData = require("model.cdkey.cdkey_data")
CDKeyExchangeData = require("model.cdkey.cdkey_exchange_data")
CDKeyErrData = require("model.cdkey.cdkey_err_data")

--接口密钥
InterfaceKeyData = require("model.interface_key.interface_key_data")
--充值
PayLogData = require("model.pay.pay_log_data") --充值日志
PayOrderData = require("model.pay.pay_order_data") --充值数据
UserPayStaticsData = require("model.pay.user_pay_statics_data") --玩家充值统计数据

--IP白名单
IPWhiteListData = require("model.ip_white_list_data")

CommonFunc = require("base.common_func")

function GetPostArgs()
	ngx.req.read_body()
	return ngx.req.get_post_args()
end

function GetQueryArgs(ToGBK)
	local Args = {}
	local Vars = ngx.req.get_uri_args()
	for ArgName, ArgValue in pairs(Vars) do
		Args[ArgName] = ArgValue
	end
	return Args
end

function GetQueryArg(ArgName, ToGBK)
	local Val = ngx.var["arg_"..ArgName]
	if Val then
		Val = ngx.unescape_uri(Val)
	end
	if false and ToGBK and Val then
		if string.find(Val,"[%z\224-\239][\128-\191]*") then
			local nmsg, err = utf2gbk:iconv(Val)
			if not err then
				Val = nmsg
			end
		end
	end
	return Val
end

function DoRequest(Force)
	if not CheckIPAccess() then
		ngx.exit(ngx.HTTP_FORBIDDEN) --禁止访问
		return
	end
	local ProcFunc = ngx.var.processfunc
	local Model = getfenv(2)
	Model.CURPOSITION = "所在的位置"
	Model[ProcFunc](Model)
end


IPWhiteListMap = {} --记录IP白名单列表
IPWhiteListFlag = false --白名单初始化标志位
--初始化IP白名单列表，如果IP白名单有更新，需要reload一下gservice
function InitIPWhiteListMap()
	local IPWhiteList = IPWhiteListData:Get()
	for _, IPInfo in ipairs(IPWhiteList) do
		local Index = IPInfo.IndexName
		local IPList = IPInfo.IPList
		IPWhiteListMap[Index] = {}
		IPList = string.split(IPList, ",")
		for _, IP in ipairs(IPList) do
			IPWhiteListMap[Index][IP] = true
		end
	end
	IPWhiteListFlag = true
end

function CheckIPAccess()
	local Flag = true
	local Index = ngx.var.accessIPIndex
	if Index and Index ~= "" then
		if not IPWhiteListFlag then
			InitIPWhiteListMap()
		end
		local IP = ngx.var.remote_addr
		if IPWhiteListMap[Index] and not IPWhiteListMap[Index][IP] then
			Flag = false
		end
	end 
	return Flag
end

function UriEncode(Str)
	return ngx.escape_uri(Str) 
end

function UriDecode(Str)
	return ngx.unescape_uri(Str)
end

function GetBasePath()
	return ngx.var.document_root
end

-- session operation
local LastCheckTime = os.time()
local CheckTime = 60
SessionData = {}
CookieName = "_ns_f"
local function GetCookie(Key)
	local header = ngx.req.get_headers()
	local CookieStr = header.Cookie
	if CookieStr then
		return string.match(CookieStr,CookieName.."=(%w+)")
	end
end

local function NewSession(Life)
	local Sid = tostring(math.random(100,999))..os.time()
	SessionData[Sid] = {LastTime=os.time(),Life=Life or 30*60, Data={}}
	ngx.header['Set-Cookie'] = {CookieName..'='..Sid..'; path=/'}	
	return SessionData[Sid]
end

function GetSession(Key)
	CheckCleanSession()
	local Sid = GetCookie(CookieName)
	if not Sid then return end
	local SData = SessionData[Sid]
	if not SData then return end
	SData.LastTime = os.time()
	return SData.Data[Key]
end

function SetSession(Key,Value)
	CheckCleanSession()
	local Sid = GetCookie(CookieName)
	local SData
	if Sid then
		SData = SessionData[Sid]
	end
	if not SData then
		SData = NewSession()	
	end
	SData.LastTime = os.time()
	SData.Data[Key] = Value
end

function DelSession()
	local Sid = GetCookie(CookieName)
	if Sid then
		SessionData[Sid] = nil
	end
end

function CheckCleanSession()
	local Now = os.time()
	if Now - LastCheckTime >= CheckTime then
		LastCheckTime = Now
		for Sid, Session in pairs(SessionData) do
			if Now - Session.LastTime >= Session.Life then
				SessionData[Sid] = nil	
			end
		end
	end
end

function ReqOutUrl(Url, Params)
	local BodyStr = ""
	if Params then
		local BodyTbl = {}
		for k, v in pairs(Params) do
   			table.insert(BodyTbl, k.."="..v) 
		end
		BodyStr = table.concat(BodyTbl,"&")
	end
	local resp = ngx.location.capture("/proxy?host="..ngx.escape_uri(Url),{method=ngx.HTTP_POST,body=BodyStr})
	if resp.status ~= ngx.HTTP_OK then
		return nil, resp.status
	end
	return true, resp.body
end

-- access the cmcs interface and return the context
local CmcsPort = 7633
function ReqCmcsByServerId(SvrId, Inter, Params)
	local Servers = ServerData:GetAllServers()
	local TargetSvr
	for _, Server in pairs(Servers) do
		if Server.hostid == SvrId then
			TargetSvr = Server
			break
		end
	end
	if not TargetSvr then
		return nil, "no cmcs found "
	end
	local TargetUrl = TargetSvr.address .. ":"..CmcsPort.."/"..Inter 
	return ReqOutUrl(TargetUrl, Params)
end

function ExecuteCmcsShell(SvrId, ShellName, ParamStr)
	return ReqCmcsByServerId(SvrId, "execute", {shellname=ShellName, shellparam=ParamStr})
end

function GetCmcsFile(SvrId, FileName, ParamTbl)
	local TmpTbl = {}
	if ParamTbl then
		for k, v in pairs(ParamTbl) do
			table.insert(TmpTbl, k.."="..v)
		end
	end
	return ReqCmcsByServerId(SvrId, "getfile", {filename=FileName, param=table.concat(TmpTbl,",")})
end

function Serialize(Object)
local function ConvSimpleType(v)
	if type(v)=="string" then
		return string.format("%q",v)
	end
	return tostring(v)
end

local function RealFun(Object, Depth)
	Depth = Depth or 0
	Depth = Depth + 1
	assert(Depth<40, "too long Depth to serialize"..debug.traceback())

	if type(Object) == 'table' then
		local Ret = {}
		table.insert(Ret,'{')
		for k, v in pairs(Object) do
			local _k = ConvSimpleType(k)
			if _k == nil then
				error("key type error: "..type(k))
			end
			table.insert(Ret,'[' .. _k .. ']')
			table.insert(Ret,'=')
			table.insert(Ret,RealFun(v, Depth))
			table.insert(Ret,',')
		end
		table.insert(Ret,'}')
		return table.concat(Ret)
	else
		return ConvSimpleType(Object)
	end
end
return RealFun(Object)
end

--Data是序列化的数据(字符串)
function UnSerialize(Data)
	return assert(loadstring("return "..Data))()
end

function GetConfigPath(ConfigName)
	local PathMap = {
		["CroServer"] = GetBasePath().."/interfacedata/croserver/",
		["ServerGroup"] = GetBasePath().."/interfacedata/servergroup/",
	}
	return PathMap[ConfigName]
end

--将一个str以del分割为若干个table中的元素
--n为分割次数
function string.split( line, sep, maxsplit ) 
	if string.len(line) == 0 then
		return {}
	end
	sep = sep or ' '
	maxsplit = maxsplit or 0
	local retval = {}
	local pos = 1   
	local step = 0
	while true do   
		local from, to = string.find(line, sep, pos, true)
		step = step + 1
		if (maxsplit ~= 0 and step > maxsplit) or from == nil then
			local item = string.sub(line, pos)
			table.insert( retval, item )
			break
		else
			local item = string.sub(line, pos, from-1)
			table.insert( retval, item )
			pos = to + 1
		end
	end     
	return retval  
end

function GetTimeStamp(Time)
	if type(Time) ~= "string" or 
		string.match(Time, "^%d+%-%d+%-%d+ %d+:%d+:%d+$") == nil then
		return os.time()
	end
	local MatchTable = {}
	
	for item in string.gmatch(Time, "%d+") do
		table.insert(MatchTable, item)
	end
	local TimeTable = {}
	TimeTable.year = MatchTable[1]
	TimeTable.month = MatchTable[2]
	TimeTable.day = MatchTable[3]
	TimeTable.hour = MatchTable[4]
	TimeTable.min = MatchTable[5]
	TimeTable.sec = MatchTable[6]
	local TimeStamp = os.time(TimeTable)
	return TimeStamp
end

--扩展table方法
function table.member_key(Table, Value)
	if type(Table) ~= "table" then
		return nil
	end
	for k,v in pairs(Table) do
		if v == Value then
			return k
		end
	end

	return nil
end

--返回table的size
function table.size(Table)
	if Table then
		local Ret = 0
		for _,_ in pairs(Table) do
			Ret = Ret + 1
		end
		return Ret
	else
		return 0
	end
end



