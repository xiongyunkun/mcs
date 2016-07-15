iconv = require("iconv")
require("libtools")
utf2gbk = iconv.new("gbk","utf8")
json = require("base.json")
MYSQL = require("base.mysql")
DB = require("base.database")
REDIS = require("base.redis")

PlatformData = require("model.server.platform_data")
ServerData = require("model.server.serverdata")
CroServerData = require("model.server.cro_server_data")
GMRuleData = require("model.gm_rule_data")
GMOperationData = require("model.gm_operation_data")
PlayerInfoData = require("model.user_info_data")
StartServerInfoData = require("model.server.start_server_info_data")
MergeServerInfoData = require("model.server.merge_server_info_data") --独代平台合服信息表
ServerMergeData = require("model.server.server_merge_data") --合服配置表

--激活码
CDKeyActivityData = require("model.cdkey.cdkey_activity_data")
CDKeyData = require("model.cdkey.cdkey_data")
CDKeyExchangeData = require("model.cdkey.cdkey_exchange_data")
CDKeyErrData = require("model.cdkey.cdkey_err_data")
NewServerExchangeData = require("model.cdkey.new_server_exchange_data")
--公告
BroadcastData = require("model.broadcast.broadcast_cfg_data")
--邮件
EmailData = require("model.email.email_cfg_data")
--用户统计数据
HistoryOnlineData = require("model.user_statics_num.history_online_data")
HistoryRegData = require("model.user_statics_num.history_reg_data")
OnlineData = require("model.user_statics_num.online_data")
RetentionData = require("model.user_statics_num.retention_data")
FigtingRankData = require("model.user_statics_num.fighting_rank_data")
--接口密钥
InterfaceKeyData = require("model.interface_key.interface_key_data")
--封号日志
BanLogData = require("model.log.ban_log_data")
GoldLogData = require("model.log.gold_log_data")
MoneyLogData = require("model.log.money_log_data")
LoginLogData = require("model.log.login_log_data")
AddPlayerLogData = require("model.log.add_player_log_data")
--充值
PayLogData = require("model.pay.pay_log_data") --充值日志
PayOrderData = require("model.pay.pay_order_data") --充值数据
UserPayStaticsData = require("model.pay.user_pay_statics_data") --玩家充值统计数据
PayDayStaticsData = require("model.pay.pay_day_statics_data") --服日充值统计

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

--初始化合服映射表
function InitServerMergeMap()
	local MergesrcHostMap = ngx.shared.merge_src_host_map --源服合服映射表
	local MergeToHostMap = ngx.shared.merge_to_host_map --目标服合服映射表
	local Servers = ServerData:GetAllServers()
	local ToHostIDMap = {}
	for _, Server in ipairs(Servers) do
		MergesrcHostMap:set(Server.hostid, Server.mergeto)
		local ToHostID = Server.mergeto ~= 0 and Server.mergeto or Server.hostid
		ToHostIDMap[ToHostID] = ToHostIDMap[ToHostID] or {}
		table.insert(ToHostIDMap[ToHostID], Server.hostid)
	end
	for ToHostID, SrcHostIDs in pairs(ToHostIDMap) do
		MergeToHostMap:set(ToHostID, table.concat( SrcHostIDs, ","))
	end
end

--查询获得合服之后的目标服，如果没有合服则直接返回源服HostID
function GetToHostID(SrcHostID)
	SrcHostID = tonumber(SrcHostID)
	local MergesrcHostMap = ngx.shared.merge_src_host_map --源服合服映射表
	local SrcHostIDs = MergesrcHostMap:get_keys(0)
	if #SrcHostIDs == 0 then
		--缓存里面为空，初始化缓存
		InitServerMergeMap()
	end
	local ToHostID = MergesrcHostMap:get(SrcHostID)
	if not ToHostID or ToHostID == 0 then
		ToHostID = SrcHostID --没有进行过合服，目标服就是源服
	end
	return ToHostID
end

--返回合服目标服为ToHostID的服列表
function GetSrcHostIDs(ToHostID)
	ToHostID = tonumber(ToHostID)
	local MergeToHostMap = ngx.shared.merge_to_host_map --目标服合服映射表
	local ToHostIDs = MergeToHostMap:get_keys(0)
	if #ToHostIDs == 0 then
		--缓存里面为空，初始化缓存
		InitServerMergeMap()
	end
	local SrcHostIDs = MergeToHostMap:get(ToHostID)
	if not SrcHostIDs then
		return {ToHostID} --如果为空直接返回目标服
	end 
	SrcHostIDs = string.split(SrcHostIDs, ",")
	local NewSrcHostIDs = {}
	for _, SrcHostID in ipairs(SrcHostIDs) do
		table.insert(NewSrcHostIDs, tonumber(SrcHostID))
	end
	return NewSrcHostIDs
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
		return "no cmcs found "
	end
	local IP = TargetSvr.address .. ":7633"
	local TargetUrl = IP.."/"..Inter 
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

--独代平台ID映射表
DD_PlatformIDMap = {
	dw = "YY", --多玩平台
}

--初始化平台IP的dict
function InitHostIPMap()
	local HostIPMap = ngx.shared.host_ip_map --平台IP映射表
	local Platforms = PlatformData:GetPlatform()
	for _, Info in ipairs(Platforms) do
		if Info.IP and Info.IP ~= "" then
			HostIPMap:set(Info.PlatformID, Info.IP)
		end
	end
end

--根据平台ID获得对应的IP地址
function GetHostIP(PlatformID)
	local HostIPMap = ngx.shared.host_ip_map --平台IP映射表
	local IPs = HostIPMap:get_keys(0)
	if #IPs == 0 then
		InitHostIPMap()
	end
	local IP = HostIPMap:get(PlatformID)
	return IP
end

local RedisIP = "127.0.0.1"
local RedisPort = 6379
--rpush到redis中
function RPushRedis(Key, Value)
	local Redis = REDIS:new()
    Redis:set_timeout(240000) -- 4 min
    local ok, err = Redis:connect(RedisIP, RedisPort)
    if not ok then
        ngx.say("failed to connect: ", err)
        return
    end
    --[[local res, err = Redis:auth("FfsOI89KL")
    if not res then
        ngx.say("failed to authenticate: ", err)
        return
    end]]
    Redis:rpush(Key, Value)
    Redis:set_keepalive(10000, 100) --放入连接池
    return true
end




