----------------------------------------
--$Id: arena_log_mgr.lua 88866 2016-01-26 07:28:41Z xiongyunkun $
----------------------------------------
--[[
-- 竞技场日志查询
--
--]]

function LogShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time() - 86400)
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
	local Titles = {"时间", "平台", "服", "挑战ID", "挑战名", "目标ID", '目标名', 
		'现排名', "原排名", "挑战队列", "防御队列"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	local TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local ArenaLogList = ArenaLogData:Get(Options.PlatformID, Options)
		if #ArenaLogList >= 5000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["NoDivPage"] = true,
				["DisplayLength"] = 50,
			}
			Viewer:View("template/log/coin_log_list.html")
			return
		end
		
		for _, ArenaLog in ipairs(ArenaLogList) do
			local Data = {}
			table.insert(Data, ArenaLog.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, ArenaLog.Uid)
			table.insert(Data, ArenaLog.Name)
			table.insert(Data, ArenaLog.TargetUid)
			table.insert(Data, ArenaLog.TargetName)
			table.insert(Data, ArenaLog.Rank)
			table.insert(Data, ArenaLog.TRank)
			table.insert(Data, ArenaLog.FightName)
			table.insert(Data, ArenaLog.DefendName)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("货币日志.xls", Titles, TableData)
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
	Viewer:View("template/log/levelup_log_list.html", Params)
end

DoRequest()

