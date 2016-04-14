----------------------------------------
--$Id: modulesdata.lua 3691 2014-05-13 03:37:42Z zork $
----------------------------------------
--[[
-- Modules database Operator
--]]
module(...,package.seeall)

local ConfigFilePath = {
	[""] = "/custom_conf/custom_modules.conf",
	["oss"] = "/custom_conf/oss_custom_modules.conf",
}

function GetAllModules(self,Options)
	local Where = " where 1=1 "
	if Options and Options.ModuleName and Options.ModuleName ~= "" then
		Where = Where .. " and name like '%" .. Options.ModuleName .. "%' "
	end
	if Options and Options.System then
		Where = Where .. " and System like '" .. Options.System .. "%'"
	end
	if ngx.var.system and ngx.var.system ~= "" then
		Where = Where .. " and System like '%" .. ngx.var.system .. "%'"
	end
	local Sql = "select * from modules ".. Where .." order by parent, sortID"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"name","uri","module","procfunc","parent","isshow","descinfo","IsLog","system","sortID"}
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
	--if not Ret then return false, Err end
	self:MakeAllConfigFile()
	return true, Err
end

function DelModuleByName(self,ModuleName)
	local Sql = "delete from permission where module='"..ModuleName.."'"
	local Ret, Err = DB:ExeSql(Sql)	

	Sql = "delete from modules where name='"..ModuleName.."'"
	Ret,Err = DB:ExeSql(Sql)
	--if not Ret then return false, Err end
	self:MakeAllConfigFile()
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
	--if not Ret then return false, Err end
	self:MakeAllConfigFile()
	return true, Err 
end

local ExcludeModule = {
	["admin/funcmgr.lua"] = true,
}

function MakeAllConfigFile(self)
	self:MakeConfigureFile(nil,ConfigFilePath[""]) --服务器管理
	self:MakeConfigureFile({System = "oss"},ConfigFilePath["oss"]) --服务器管理
end

function MakeConfigureFile(self, Options, OutputPath)
	local Modules = self:GetAllModules(Options)
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
	local cf, Err = io.open(GetBasePath()..OutputPath, "w+")
	if not cf then
		ngx.say(Err)
		return
	end
	cf:write(Context)
	cf:flush()
	cf:close()
end

--判断是否需要记录模块日志
function CheckNeedLog(self, ModuleName)
	local Sql = "select * from smcs.modules where IsLog = '1'"
	local Ret, Err = DB:ExeSql(Sql)
	for _, Info in ipairs(Ret) do
		if Info.name == ModuleName then
			return true
		end
	end
	return false
end

-- 构造树状的模块列表,目前一般只有一二级菜单
function GetModulesTree(self, Options)
	local Modules = self:GetAllModules(Options)
	local TreeMap = {}
	for _, Module in ipairs(Modules) do
		if not Module.parent or Module.parent == "" then
			Module.children = {}
			TreeMap[Module.name] = Module
		else
			local TModule = TreeMap[Module.parent]
			if TModule then
				table.insert(TModule.children, Module)
			else
				--还是把他当做一级菜单
				Module.children = {}
				TreeMap[Module.name] = Module
			end
		end
	end
	return TreeMap
end
