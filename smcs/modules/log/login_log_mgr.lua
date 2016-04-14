----------------------------------------
--$Id: login_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 登陆日志查询
--
--]]

--钻石金币操作面板展示
function LogShow(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d 00:00:00",os.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",os.time())
	
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "<br>",},
		{["Type"] = "label",["Text"] = "IP:"},
		{["Type"] = "text",["Name"] = "Ip", ["Placeholder"] = "IP"},

		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {'时间', "平台", "服", "角色ID", "角色名", "等级", '类型', 'IP'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}

	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		--需要同时查询tblLoginLog和tblLogoutLog两张表，并且需要根据时间排序
		local LoginLog = LoginLogData:Get(Options.PlatformID, Options)
		local LogoutLog = LogoutLogData:Get(Options.PlatformID, Options)
		--先数组合并
		for _, LogoutInfo in ipairs(LogoutLog) do
			LogoutInfo.Type = 2
			table.insert(LoginLog, LogoutInfo)
		end
		for _, LoginInfo in ipairs(LoginLog) do
			local Data = {}
			table.insert(Data, LoginInfo.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, LoginInfo.Uid)
			table.insert(Data, LoginInfo.Name)
			table.insert(Data, LoginInfo.Lv or 0)
			table.insert(Data, LoginInfo.Type == 2 and "登出" or "登入")
			
			table.insert(Data, LoginInfo.Ip)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("登陆日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/login_log_list.html")
end

DoRequest()