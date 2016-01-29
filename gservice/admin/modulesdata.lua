----------------------------------------
--$Id: modulesdata.lua 3697 2014-05-13 03:51:38Z zork $
----------------------------------------
--[[
-- Modules database Operator
--]]
module(...,package.seeall)

local AllModules = {}
function GetAllModules(self)
	if #AllModules > 0 then
		return AllModules
	end
	local Sql = "select * from modules order by parent, name"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	for i, row in ipairs(Res) do
		local ModuleInfo = {}
		for col, val in pairs(row) do
			ModuleInfo[col] = val
		end
		table.insert(AllModules, ModuleInfo)
	end
	return AllModules
end

local Cols = {"name","uri","module","procfunc","parent","isshow","descinfo"}
function AddModule(self, ModuleInfo)
	local Sql = "insert into modules set "
	local SetTbl = {}
	for _, Col in ipairs(Cols) do
		if ModuleInfo[Col] then
			table.insert(SetTbl, Col.."='"..ModuleInfo[Col].."'")
		end
	end
	Sql = Sql .. table.concat(SetTbl,",")
	local Ret, Err = DB:ExeSql(Sql)
	AllModules = {}
	--if not Ret then return false, Err end
	self:MakeConfigureFile()
	return true, Err
end

function DelModuleByName(self,ModuleName)
	local Sql = "delete from permission where module='"..ModuleName.."'"
	local Ret, Err = DB:ExeSql(Sql)	

	Sql = "delete from modules where name='"..ModuleName.."'"
	Ret,Err = DB:ExeSql(Sql)
	AllModules = {}
	--if not Ret then return false, Err end
	self:MakeConfigureFile()
	return true, Err
end

function ModifyModuleByName(self,ModuleInfo)
	local Sql = "update modules set "
	local SetTbl = {}
	for _, Col in ipairs(Cols) do
		if ModuleInfo[Col] then
			table.insert(SetTbl, Col.."='"..ModuleInfo[Col].."'")
		end
	end

	Sql = Sql .. table.concat(SetTbl,",") .." where name='"..ModuleInfo.oldname.."'"
	local Ret, Err = DB:ExeSql(Sql)
	AllModules = {}
	--if not Ret then return false, Err end
	self:MakeConfigureFile()
	return true, Err 
end

local configfile = "/custom_conf/custom_modules.conf"
local ExcludeModule = {
	["admin/funcmgr.lua"] = true,
}
function MakeConfigureFile(self)
	local Modules = self:GetAllModules()
	local Context = ""
	local LocationInfo = [[location /%s {
		default_type "text/html";
		set $processfunc "%s";
		set $module_name "%s";
		content_by_lua_file %s;
	}
]]
	for _, Module in pairs(Modules) do
		if Module.uri and Module.uri ~= "" and not ExcludeModule[Module.module] then
			Context = Context..string.format(LocationInfo,Module.uri,Module.procfunc, Module.name, Module.module)
		end
	end
	local cf, Err = io.open(GetBasePath()..configfile, "w+")
	if not cf then
		ngx.say(Err)
		return
	end
	cf:write(Context)
	cf:flush()
	cf:close()
end
