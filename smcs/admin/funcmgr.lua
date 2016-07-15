---------------------------------------
--$Id: funcmgr.lua 121879 2016-06-29 02:38:19Z xiongyunkun $
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
local Icons = {"icon-home","icon-dashboard", "icon-laptop", "icon-edit", "icon-legal", "icon-cog"}

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
	local Index = 1
	local ModulePermissions = GetSession("ModulePermissions")
	for _, Module in pairs(Modules) do
		if Module.isshow == "true" and ModulePermissions[Module.name] then
			local name = Module.name
			local parent = Module.parent
			local ModuleInfo = TempModules[name] 
			if not ModuleInfo then	
				ModuleInfo = {name = name,}
				TempModules[name] = ModuleInfo
			end
			ModuleInfo.act = (Module.uri ~= "" and Module.uri or nil) 
			if parent and parent ~= "" and ModulePermissions[parent] then
				if not TempModules[parent] then
					TempModules[parent] = {
						name = parent,
						icon = Icons[Index] or Icons[(Index%(#Icons))+1],
						sub = {},
					}
					Index = Index + 1
				end
				if not TempModules[parent].sub then
					TempModules[parent].sub = {}
					TempModules[parent].icon = Icons[Index] or Icons[(Index%(#Icons))+1]
					Index = Index + 1
				end
				table.insert(TempModules[parent].sub,ModuleInfo)
			end
			if not parent or parent == "" then
				table.insert(FuncIndex, ModuleInfo)
			end
		end
	end
	Viewer:View("template/func/funcindex.html")
end

function ReqAdminList(self, Msg)
	local SystemMap = {} --让'全部'选项排第一
	System = ngx.var.system or ""
	if System == "" then
		SystemMap[""] = "全部"
		for SystemID, SystemName in pairs(CommonData.SystemMap) do
			SystemMap[SystemID] = SystemName
		end
	end
	ModuleName = GetQueryArg("ModuleName") or ""
	Modules = ModulesData:GetAllModules({ModuleName = ModuleName}) 
	for _, Module in ipairs(Modules) do
		local Systems = string.split(Module.system, ",")
		local NewSystems = {}
		if #Systems > 0 then 
			for _, SystemID in ipairs(Systems) do
				table.insert(NewSystems, SystemMap[SystemID])
			end
		else
			table.insert(NewSystems, "全部")
		end
		Module.system = table.concat(NewSystems, ",")
	end
	
	ExtMsg = Msg
	--获得模块名称
	ModuleNames = self:GetModuleNames()
	table.insert(ModuleNames,1,"")
	Viewer:View("template/func/adminmodules.html")
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
	if ngx.var.request_method == "POST" then
		local ModuleInfo = GetPostArgs()
		if self:CheckModuleExist(ModuleInfo.name) then
			self:ReqAdminList(string.format(MsgList[2],ModuleInfo.name))
			return
		end
		if ModuleInfo.uri and ModuleInfo.uri ~= "" and self:CheckModuleUriExist(ModuleInfo.uri) then
			self:ReqAdminList(string.format(MsgList[4],ModuleInfo.name,ModuleInfo.uri))
			return
		end
		if ModuleInfo.system then
			if type(ModuleInfo.system) == "table" then
				ModuleInfo.system = table.concat(ModuleInfo.system, ",")
			end
		else
			ModuleInfo.system = ngx.var.system or ""
		end
		if ModuleInfo.sortID and ModuleInfo.sortID == "" then
			ModuleInfo.sortID = "1" -- 排序默认值是1
		end
		local Ret, Msg = ModulesData:AddModule(ModuleInfo)
		self:ReqAdminList(Msg)
	else
		local Name = GetQueryArg("name") or ""
		ActionUrl = "/admin/moduleadd"
		ModuleInfo = {}
		if Name and Name ~= "" then
			ModuleInfo = ModulesData:GetAllModules({ModuleName = Name})
			if ModuleInfo and ModuleInfo[1] then
				ModuleInfo = ModuleInfo[1]
				local Systems = string.split(ModuleInfo.system, ",")
				local NewSystems = {}
				for _, System in ipairs(Systems) do
					NewSystems[System] = true
				end
				ModuleInfo.system = NewSystems
				ActionUrl = "/admin/modulemod" --同时提交的url也要修改
			end
		end
		SystemMap = {} --让'全部'选项排第一
		System = ngx.var.system or ""
		if System == "" then
			SystemMap[""] = "全部"
			for SystemID, SystemName in pairs(CommonData.SystemMap) do
				SystemMap[SystemID] = SystemName
			end
		end
		Viewer:View("template/func/addmodules.html")
	end
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
	--适用系统
	if ModuleInfo.system then
		if type(ModuleInfo.system) == "table" then
			ModuleInfo.system = table.concat(ModuleInfo.system, ",")
		end
	else
		ModuleInfo.system = ngx.var.system or ""
	end
	if ModuleInfo.sortID and ModuleInfo.sortID == "" then
		ModuleInfo.sortID = "1" -- 排序默认值是1
	end
	local Ret, Msg = ModulesData:ModifyModuleByName(ModuleInfo)
	self:ReqAdminList(Msg)
end

DoRequest()
