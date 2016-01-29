module(...,package.seeall)

function View(self,filename, params, debug)
	local tf = io.open(GetBasePath().."/"..filename,"r")
	local context = tf:read("*a") 
	tf:close()
	context = self:MergeInclude(context, filename, 1)
	local env = params or {}
	local env_mt = {}
	if params then --如果传递了参数就不需要引用上一层函数环境了
		env_mt = {__index = getfenv()}
	else
		env_mt = {__index = getfenv(2)} --2代表上一层调用自己的函数环境
	end
	setmetatable(env, env_mt)
	local chunk = "local contexts = {}\n"
	for c1 in string.gmatch(context,"(.-)\n") do
		local code = string.match(c1,"^#(.+)$")
		if code then
			chunk = chunk .. code .. "\n"
		else
			local con = string.gsub(c1,"\"","\\\"")
			con = string.gsub(con,"%$(.-)%$",function(s) return "\"..("..string.gsub(s,"\\\"","\"")..")..\"" end)
			chunk = chunk .. "table.insert(contexts,\"" .. con .. "\")\n"
		end
	end
	chunk = chunk .. "return table.concat( contexts, '\\n') \n"
	if not debug then
		local cf,err = loadstring(chunk)
		if not cf then
			ngx.say(err)
			return
		end
		setfenv(cf,env)
		local ct = cf()
		ngx.say(ct)
	else
		ngx.say(chunk)
	end
end

--加载include标签所引用的文件
function MergeInclude(self, Context, ParentFile, Level,ParentMap)
	local LoadedMap = ParentMap or {}
	if LoadedMap[ParentFile] and LoadedMap[ParentFile] ~= Level then
		-- error
		ngx.log(ngx.ERR,ParentFile.." have loop include")
		return Context
	end
	LoadedMap[ParentFile] = Level
	local MergeContext = string.gsub(Context,"#include%(.-[\'\"](.-)[\'\"].-%).-\n",function(filename)
		local tf = io.open(GetBasePath().."/"..filename,"r")
		local IncContext = tf:read("*a")
		tf:close()
		return self:MergeInclude(IncContext, filename, (Level + 1), LoadedMap)
	end
	)
	return MergeContext
end
