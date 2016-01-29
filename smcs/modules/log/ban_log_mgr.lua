----------------------------------------
--$Id: ban_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 禁言封号日志查询
--
--]]

--禁言封号日志操作面板展示
function LogShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time() - 86400 * 7)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--获得用户名列表
	local UserInfo = UserData:GetAllUsers()
	local Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "<br>",},
		{["Type"] = "label",["Text"] = "原因:"},
		{["Type"] = "text",["Name"] = "Reason", ["Placeholder"] = "原因"},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}

	--展示数据
	local Titles = {'时间', "平台", "服", "角色ID", "角色名", "操作类型", '操作人', "封禁开始时间",
		'封禁结束时间','封禁原因'}
	local OperationTypes = CommonData.BanOperationTypes
	local TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local LogList = BanLogData:Get(Options.PlatformID, Options)
		for _, Log in ipairs(LogList) do
			local Data = {}
			table.insert(Data, Log.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Log.Uid)
			table.insert(Data, Log.Name)
			local OperationStr = ""
			if Log.OperationType == 3 then --封号标红
				OperationStr = '<font color="red">' .. OperationTypes[Log.OperationType] .. "</font>"
			elseif Log.OperationType == 4 then --解封标蓝
				OperationStr = '<font color="blue">' .. OperationTypes[Log.OperationType] .. "</font>"
			else
				OperationStr = OperationTypes[Log.OperationType]
			end
			table.insert(Data, OperationStr)
			table.insert(Data, Users[Log.Operator] or Log.Operator)
			table.insert(Data, Log.BanStartTime)
			table.insert(Data, Log.BanEndTime == Log.BanStartTime and '<font color="red">永久</font>' or Log.BanEndTime)
			table.insert(Data, Log.Reason)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("封禁日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	local DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		Filters = Filters,
		Titles = Titles,
		TableData = TableData,
		DataTable = DataTable,
	}
	Viewer:View("template/log/ban_log_list.html", Params)
end


DoRequest()