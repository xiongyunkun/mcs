---------------------------------------
--$Id: funcmgr.lua 3697 2014-05-13 03:51:38Z zork $
---------------------------------------
--[[
--List the function index for user who can use
--
--]]
local MsgList = {
"模块\"%s\"不存在",
"模块\"%s\"已存在",
"模块\"%s\"是其它模块的父模块",
"模块\"%s\"的uri\"%s\"已经存在",
}

function CheckModuleExist(self, ModuleName)
	local Modules = ModulesData:GetAllModules()
	for _, Module in pairs(Modules) do
		if Module.name == ModuleName then
			return Module
		end
	end
end

function CheckModuleInParent(self, ModuleName)
	local Modules = ModulesData:GetAllModules()
	for _, Module in pairs(Modules) do
		if (Module.parent or "") == ModuleName then
			return Module
		end
	end
end

function CheckModuleUriExist(self, ModuleUri)
	local Modules = ModulesData:GetAllModules()
	for _, Module in pairs(Modules) do
		if Module.uri == ModuleUri then
			return Module
		end
	end
end

function ReqFuncList(self)
	local Modules = ModulesData:GetAllModules()
	FuncIndex = {}
	local TempModules = {}
	local UserId = GetSession("UserId")
	for _, Module in pairs(Modules) do
		if Module.isshow == "true" and PermissionData:CheckUserPermission(UserId, Module.name) then
			local name = Module.name
			local parent = Module.parent
			local ModuleInfo = TempModules[name] 
			if not ModuleInfo then	
				ModuleInfo = {name = name,}
				TempModules[name] = ModuleInfo
			end
			ModuleInfo.act = (Module.uri ~= "" and Module.uri or nil) 
			if parent and parent ~= "" and PermissionData:CheckUserPermission(UserId, parent) then
				if not TempModules[parent] then
					TempModules[parent] = {
						name = parent,
						sub = {},
					}
				end
				if not TempModules[parent].sub then
					TempModules[parent].sub = {}
				end
				table.insert(TempModules[parent].sub,ModuleInfo)
			end
			if not parent or parent == "" then
				table.insert(FuncIndex, ModuleInfo)
			end
		end
	end

	Viewer:View("template/funcindex.html")
end

function ReqAdminList(self, Msg)
	Modules = ModulesData:GetAllModules() 
	ExtMsg = Msg
	Viewer:View("template/adminmodules.html")
end

-- get module names
function GetModuleNames(self, exclude)
	local Modules = ModulesData:GetAllModules()
	local Names = {}
	for _, Module in ipairs(Modules) do
		if Module.name ~= exclude then
			table.insert(Names, Module.name)
		end
	end
	return Names
end

function DoAdminDel(self)
	local ModuleName = UriDecode(GetQueryArg("name"))
	if not self:CheckModuleExist(ModuleName) then
		self:ReqAdminList(string.format(MsgList[1],ModuleName))
		return
	end
	if self:CheckModuleInParent(ModuleName) then
		self:ReqAdminList(string.format(MsgList[3],ModuleName))
		return
	end
	local Ret, Msg = ModulesData:DelModuleByName(ModuleName)
	self:ReqAdminList(Msg)
end

function DoAdminAdd(self)
	local ModuleInfo = GetPostArgs()
	if self:CheckModuleExist(ModuleInfo.name) then
		self:ReqAdminList(string.format(MsgList[2],ModuleInfo.name))
		return
	end
	if ModuleInfo.uri and ModuleInfo.uri ~= "" and self:CheckModuleUriExist(ModuleInfo.uri) then
		self:ReqAdminList(string.format(MsgList[4],ModuleInfo.name,ModuleInfo.uri))
		return
	end
--	local IsShow = ModuleInfo.isshow
--	ModuleInfo.isshow = (IsShow == "yes" and true or false)
	local Ret, Msg = ModulesData:AddModule(ModuleInfo)
	self:ReqAdminList(Msg)
end

function DoAdminModify(self)
	local ModuleInfo = GetPostArgs()
	if ModuleInfo.name ~= ModuleInfo.oldname then
		if self:CheckModuleExist(ModuleInfo.name) then
			self:ReqAdminList(string.format(MsgList[2],ModuleInfo.name))
			return
		end
		if self:CheckModuleInParent(ModuleInfo.oldname) then
			self:ReqAdminList(string.format(MsgList[3],ModuleInfo.oldname))
			return
		end
	end
	local OldModule = self:CheckModuleExist(ModuleInfo.oldname)
	if not OldModule then
		self:ReqAdminList(string.format(MsgList[1],ModuleInfo.oldname))
		return
	end
	if OldModule.uri ~= ModuleInfo.uri then
		-- check uri exist
		if self:CheckModuleUriExist(ModuleInfo.uri) then
			self:ReqAdminList(string.format(MsgList[4],ModuleInfo.oldname,ModuleInfo.uri))
			return
		end
	end
--	local IsShow = ModuleInfo.isshow
--	ModuleInfo.isshow = (IsShow == "yes" and true or false)
	local Ret, Msg = ModulesData:ModifyModuleByName(ModuleInfo)
	self:ReqAdminList(Msg)
end

DoRequest()
