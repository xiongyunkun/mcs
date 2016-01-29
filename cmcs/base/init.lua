iconv = require("iconv")
DB = require("base.database")
utf2gbk = iconv.new("gbk","utf8")
require("lposix")

function GetPostArgs()
	ngx.req.read_body()
	return ngx.req.get_post_args()
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
	local ProcFunc = ngx.var.processfunc
	local Model = getfenv(2)
	Model.CURPOSITION = "所在的位置"
	Model[ProcFunc](Model)
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

function GetGamePath()
	return ngx.var.basegamepath
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

--删除空白前导空白字符或者指定字符集中的字符
function string.lstrip(str, chars)
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
function string.rstrip(str, chars)
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
function string.strip(str, chars)
	return string.rstrip(string.lstrip(str, chars), chars)
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

CronGetPayResultFlag = false --定时轮询获取充值结果标志位

