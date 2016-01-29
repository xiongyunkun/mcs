module(...,package.seeall)

function View(self,filename,debug)
	local tf = io.open("/home/zork/smcs/"..filename,"r")
	local context = tf:read("*a") 
	tf:close()
	context = self:MergeInclude(context, filename, 1)
	local env = {}
	local env_mt = {__index = getfenv(2)}
	setmetatable(env, env_mt)
	--context = string.gsub(context,"%$(.-)%$",function(s) return s end)
	local chunk = "local context = \"\"\n"
	for c1 in string.gmatch(context,"(.-)\n") do
		local code = string.match(c1,"^#(.+)$")
		if code then
			chunk = chunk .. code .. "\n" 
		else
			local con = string.gsub(c1,"\"","\\\"")
			con = string.gsub(con,"%$(.-)%$",function(s) return "\"..("..string.gsub(s,"\\\"","\"")..")..\"" end)			
			chunk = chunk .. "context=context..\""..con .."\\n\"\n"
		end
	end
	chunk = chunk .. "return context \n"
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

function MergeInclude(self, Context, ParentFile, Level,ParentMap)
	local LoadedMap = ParentMap or {}
	if LoadedMap[ParentFile] and LoadedMap[ParentFile] ~= Level then
		-- error
		ngx.log(ngx.ERR,ParentFile.." have loop include")
		return Context
	end
	LoadedMap[ParentFile] = Level
	local MergeContext = string.gsub(Context,"#.-include%(.-[\'\"](.-)[\'\"].-%).-\n",function(filename)
		local tf = io.open("/home/zork/smcs/"..filename,"r")
		local IncContext = tf:read("*a")
		tf:close()
		return self:MergeInclude(IncContext, filename, (Level + 1), LoadedMap)
	end
	)
	return MergeContext
end
