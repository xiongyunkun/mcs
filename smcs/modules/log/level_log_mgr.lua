----------------------------------------
--$Id: login_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 等级日志查询
--
--]]

--钻石金币操作面板展示
function LogShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time() - 86400 * 7)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "<br>",},

		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	local Titles = {'时间', "平台", "服", "角色ID", "角色名", "平台账号", "原有经验", "变化经验", "现有经验", "原等级", "现等级", "变化原因"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	local TableData = {}

	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		--需要同时查询tblLoginLog和tblLogoutLog两张表，并且需要根据时间排序
		local LevelLogList = LevelUpLogData:Get(Options.PlatformID, Options)
		
		for _, Info in ipairs(LevelLogList) do
			local Data = {}
			table.insert(Data, Info.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Info.Uid)
			table.insert(Data, Info.Name)
			table.insert(Data, Info.Urs)
			table.insert(Data, Info.OldExp)
			table.insert(Data, Info.DeltaExp)
			table.insert(Data, Info.Exp)
			table.insert(Data, Info.OrgLevel)
			table.insert(Data, Info.NewLevel)
			table.insert(Data, Info.Reason)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("登陆日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	local DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,

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
	Viewer:View("template/log/levelup_log_list.html", Params)
end

DoRequest()
