--[[
	全局函数，例如http请求获取发送，session存取，mysql操作等
]]
local FuncMap = {}

function FuncMap.GetPostArgs()
	ngx.req.read_body()
	return ngx.req.get_post_args(0)
end

function FuncMap.GetQueryArgs(ToGBK)
	local Args = {}
	local Vars = ngx.req.get_uri_args()
	for ArgName, ArgValue in pairs(Vars) do
		Args[ArgName] = ArgValue
	end
	SetQueryArgsSession(Args)
	return Args
end

function FuncMap.GetQueryArg(ArgName, ToGBK)
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

function FuncMap.DoRequest(Force)
	if not Force and not GetSession("UserId") then
		--ngx.say("请重新登录")
		ngx.say("<script>top.location.href = '/';</script>")
		return
	end

	if not Force and not CheckSessionModulePermission(ngx.var.module_name) then
		ngx.say(string.format("没有权限访问[%s]", ngx.var.module_name))
		return
	end
	local User = UserData:GetUserById(GetSession("UserId"))
	UserName = ""
	if User and User["name"] then
		UserName = User["name"]
	end
	--多语言
	UserLanguage = GetLanguage()
	LanguageContents = CommonData.LANGUAGE_CONTENTS[UserLanguage]
	-- 判断是否需要记录模块日志
	if not Force and ngx.var.module_name and ngx.var.module_name ~= "" then
		local Args = {}
		if ngx.var.request_method == "POST" then
			Args = GetPostArgs()
		else
			Args = GetQueryArgs()
		end
		local Log = Serialize(Args)
		if ModulesData:CheckNeedLog(ngx.var.module_name) then
			local LogInfo = {
				Module = ngx.var.module_name,
				Operator = User and User["account"] or "",
				Log = Log,
			}
			ModuleLogData:Insert(LogInfo)
		end
		--每个操作都需要记录操作日志
		local System = ngx.var.system or ""
		local OperationInfo = {
			Module = ngx.var.module_name,
			Operator = User and User["account"] or "",
			Log = Log,
			System = CommonData.SysMap[System] or 1,
		}
		OperationLogData:Insert(OperationInfo)
	end
	local ProcFunc = ngx.var.processfunc
	local Model = getfenv(2)
	Model.CURPOSITION = "所在的位置"
	Model[ProcFunc](Model)
end

--从session中判断模块权限
function FuncMap.CheckSessionModulePermission(ModuleName)
	if not ModuleName or ModuleName == "" then return true end --为空直接返回
	local ModulePermissions = GetSession("ModulePermissions") 
	if not ModulePermissions[ModuleName] then
		return false
	else
		return true
	end
end

function FuncMap.UriEncode(Str)
	return ngx.escape_uri(Str) 
end

function FuncMap.UriDecode(Str)
	return ngx.unescape_uri(Str)
end

function FuncMap.GetBasePath()
	return ngx.var.document_root
end

-- session operation
local LastCheckTime = ngx.time()
local CheckTime = 60
FuncMap.SessionData = ngx.shared.sessions
--获得session
local function GetSessionInfo(Sid)
	local SData = SessionData:get(Sid)
	if SData then
		SData = json.decode(SData)
	end
	return SData
end
--保存session
local function SaveSessionInfo(Sid, SData)
	local Str = json.encode(SData)
	SessionData:set(Sid, Str)
end

local CookieName = "_ns_f"
local function GetCookie(Key)
	local header = ngx.req.get_headers()
	local CookieStr = header.Cookie
	if CookieStr then
		return string.match(CookieStr,CookieName.."=(%w+)")
	end
end

local function NewSession(Life)
	local Sid = tostring(math.random(100,999))..ngx.time()
	local SessionInfo = {LastTime=ngx.time(),Life=Life or 60*60, Data={}, QueryArgs={},}
	
	ngx.header['Set-Cookie'] = {CookieName..'='..Sid..'; path=/'}	
	return Sid, SessionInfo
end

function FuncMap.GetSession(Key)
	CheckCleanSession()
	local Sid = GetCookie(CookieName)
	if not Sid then return end
	local SData = GetSessionInfo(Sid)
	if not SData then return end
	SData.LastTime = ngx.time()
	return SData.Data[Key]
end

function FuncMap.SetSession(Key,Value)
	CheckCleanSession()
	local Sid = GetCookie(CookieName)
	local SData
	if Sid then
		SData = GetSessionInfo(Sid)
	end
	if not SData then
		Sid, SData = NewSession()	
	end
	SData.LastTime = ngx.time()
	SData.Data[Key] = Value
	SaveSessionInfo(Sid, SData)
end

function FuncMap.BatchSetSession(SessionTable)
	CheckCleanSession()
	local Sid = GetCookie(CookieName)
	local SData
	if Sid then
		SData = GetSessionInfo(Sid)
	end
	if not SData then
		Sid, SData = NewSession()	
	end
	SData.LastTime = ngx.time()
	for Key, Value in pairs(SessionTable) do
		SData.Data[Key] = Value
	end
	SaveSessionInfo(Sid, SData)
end

function FuncMap.DelSession()
	local Sid = GetCookie(CookieName)
	if Sid then
		SessionData:set(Sid, nil)
	end
end

function FuncMap.CheckCleanSession()
	local Now = ngx.time()
	if Now - LastCheckTime >= CheckTime then
		LastCheckTime = Now
		local SidList = SessionData:get_keys(0) --获得所有的Sid 
		for _, Sid in ipairs(SidList) do
			local Session = GetSessionInfo(Sid)
			if Session then
				if Now - Session.LastTime >= Session.Life then
					SessionData:set(Sid, nil)
				end
			end
		end
	end
end

--将查询的一些选项信息记录在session中,目前记录的信息有：平台、服、账号
function FuncMap.SetQueryArgsSession(Args)
	local Sid = GetCookie(CookieName)
	if not Sid then return end
	local SData = GetSessionInfo(Sid) or {}
	local Url = ngx.var.uri
	-- 只有在两次连续请求的url都相同的情况下才重新记录信息，否则取出之前记录的信息，并且重新记录下url
	if SData.QueryArgs and SData.QueryArgs.Url == Url then
		SData.QueryArgs = {PlatformID = Args.PlatformID, HostID = Args.HostID, Account = Args.Account,}
	else
		Args.PlatformID = SData.QueryArgs and SData.QueryArgs.PlatformID or nil
		Args.HostID = SData.QueryArgs and SData.QueryArgs.HostID or nil 
		Args.Account = SData.QueryArgs and SData.QueryArgs.Account or nil
	end
	SData.QueryArgs.Url = Url
	SaveSessionInfo(Sid, SData)
	return Args
end

--设置语言
function FuncMap.SetLanguage(Language)
	SetSession("Language", Language)
end

--获得当前设置的语言
function FuncMap.GetLanguage()
	local Language = "cn" --默认都是简体中文
	local TLanguage = GetSession("Language")
	if TLanguage then
		Language = TLanguage
	end
	return Language
end

function FuncMap.ReqOutUrl(Url, Params)	
	local BodyStr = ""
	if Params then
		BodyStr = ngx.encode_args(Params)
	end
	local HttpTitle = "http://"
	if string.find(Url, HttpTitle) ~= 1 then 
		Url = HttpTitle .. Url --没有http://的话要加上
	end
	local HttpClient = HTTP.new()
	local Res, Err = HttpClient:request_uri(Url, {
			method="POST",
			body=BodyStr,
			headers = {
          		["Content-Type"] = "application/x-www-form-urlencoded",
        	},
		}
	)
	if not Res then
		return nil, Err
	end
	if Res.status ~= ngx.HTTP_OK then
		return nil, Res.status
	end
	HttpClient:set_keepalive(10000, 100) --放入连接池
	return true, Res.body
end

-- access the cmcs interface and return the context
local CmcsPort = 7633
function FuncMap.ReqCmcsByServerId(SvrId, Inter, Params)
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
	local TargetUrl = TargetSvr.address .. ":"..CmcsPort.."/"..Inter 
	return ReqOutUrl(TargetUrl, Params)
end

function FuncMap.ExecuteCmcsShell(SvrId, ShellName, ParamStr)
	return ReqCmcsByServerId(SvrId, "execute", {shellname=ShellName, shellparam=ParamStr})
end

function FuncMap.GetCmcsFile(SvrId, FileName, ParamTbl)
	local TmpTbl = {}
	if ParamTbl then
		for k, v in pairs(ParamTbl) do
			table.insert(TmpTbl, k.."="..v)
		end
	end
	return ReqCmcsByServerId(SvrId, "getfile", {filename=FileName, param=table.concat(TmpTbl,",")})
end

function FuncMap.PutCmcsServFile(SvrId, FileName, ServList)
	return ReqCmcsByServerId(SvrId, "putservfile", {filename=FileName, list=ServList})
end

function FuncMap.Serialize(Object)
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
function FuncMap.UnSerialize(Data)
	local Result = nil
	local Func = function() Result = assert(loadstring("return "..Data))() end
	local Ret, Err = xpcall(Func, debug.traceback)
	return Result
end

--将一个str以del分割为若干个table中的元素
--n为分割次数
FuncMap.string = string
function FuncMap.string.split( line, sep, maxsplit ) 
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
			retval[step] = item
			break
		else
			local item = string.sub(line, pos, from-1)
			retval[step] = item
			pos = to + 1
		end
	end     
	return retval  
end

--删除空白前导空白字符或者指定字符集中的字符
local function lstrip(str, chars)
	if chars then
		for k=1,#str do
			local sub = string.sub(str,k,k)
			if not string.find(chars, sub, 1, true) then
				return string.sub(str, k)
			end
		end
	else
		return string.gsub(str, "^%s*", "")
	end
end
--删除空白后导空白字符或者指定字符集中的字符
local function rstrip(str, chars)
	if chars then
		for k=#str,1 do
			local sub = string.sub(str,k,k)
			if not string.find(chars, sub, 1, true) then
				return string.sub(str, 1, k)
			end
		end
	else		
		return string.gsub(str, "%s*$", "")
	end
end

--删除空白前后空白字符或者指定字符集中的字符
function FuncMap.string.strip(str, chars)
	return rstrip(lstrip(str, chars), chars)
end

-- 获得时间戳，Time为空则返回现有的时间戳，反之Time的时间格式为“2014-11-10 14:46:55”
function FuncMap.GetTimeStamp(Time)
	if type(Time) ~= "string" or 
		string.match(Time, "^%d+%-%d+%-%d+ %d+:%d+:%d+$") == nil then
		return ngx.time()
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
FuncMap.table = table
function FuncMap.table.member_key(Table, Value)
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
function FuncMap.table.size(Table)
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

--翻译文字内容
function FuncMap.Translate(Content)
	local TransContent = Content
	if UserLanguage ~= "cn" and LanguageContents then
		if LanguageContents[Content] then
			TransContent = LanguageContents[Content]
		end
	end
	return TransContent
end

return FuncMap
