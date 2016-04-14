----------------------------------------
--$Id: login_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 经验日志查询
--
--]]

--经验日志查询
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

		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {'时间', "平台", "服", "角色ID", "角色名", "平台账号", "原有经验", "变化经验",
		"现有经验", "原等级", "现等级", "变化原因"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}

	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local ExpLogList = ExpLogData:Get(Options.PlatformID, Options)
		
		for _, Info in ipairs(ExpLogList) do
			local Data = {}
			table.insert(Data, Info.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Info.Uid)
			table.insert(Data, Info.Name)
			table.insert(Data, Info.Urs)
			table.insert(Data, Info.OrgExp)
			table.insert(Data, Info.ExpChange)
			table.insert(Data, Info.CurExp)
			table.insert(Data, Info.OrgLevel)
			table.insert(Data, Info.CurLevel)
			table.insert(Data, Info.Reason)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("经验日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,

		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/exp_log_list.html")
end

DoRequest()