-----------------------------------------
--$Id: logmgr.lua 21449 2014-10-22 06:46:41Z xiongyunkun $
----------------------------------------


function LogList(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-86400)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	--获得模块名列表
	Modules = ModulesData:GetAllModules() 
	--获得用户名列表
	local UserInfo = UserData:Get()
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local Datas = ModuleLogData:Get(Options)
	Logs = {}
	for _, Data in ipairs(Datas) do
		Data["OperatorName"] = Users[Data["Operator"]] or Data["Operator"]
		table.insert(Logs, Data)
	end
	Viewer:View("template/log/loglist.html")
end

function OperationList(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-86400)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	--获得模块名列表
	Modules = ModulesData:GetAllModules() 
	--获得用户名列表
	local UserInfo = UserData:Get({},true)
	Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local System = ngx.var.system or ""
	Options.System = CommonData.SysMap[System] or 1
	local Datas = OperationLogData:Get(Options)
	Logs = {}
	for _, Data in ipairs(Datas) do
		Data["OperatorName"] = Users[Data["Operator"]] or Data["Operator"]
		table.insert(Logs, Data)
	end
	Viewer:View("template/log/operation_list.html")
end

DoRequest()
