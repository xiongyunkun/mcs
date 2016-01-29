----------------------------------------
--$Id: item_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 登陆日志查询
--
--]]

local OperationTypes = {"获得","移出"}

--物品日志操作面板展示
function LogShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time() - 86400 * 7)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
--	local Positions = {[0] = "全部",[1] = "背包",[2] = "临时背包",[3] = "装备"}
--	local PositionMap = {[0] = "立即使用",[1] = "背包",[2] = "临时背包",[3] = "装备"}
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "<br>",},
--		{["Type"] = "Select",["Label"] = "物品位置:",["Name"]="Position",["Values"] = Positions},
		{["Type"] = "label",["Text"] = "物品ID:"},
		{["Type"] = "text",["Name"] = "ItemType", ["Placeholder"] = "物品ID"},

		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}

	--展示数据
	local Titles = {'时间', "平台", "服", "角色ID", "角色名", "物品ID", '物品名', "物品数量",'操作类型','操作方式'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	local TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		--需要同时查询tblLoginLog和tblLogoutLog两张表，并且需要根据时间排序
		local ItemLogList = ItemLogData:Get(Options.PlatformID, Options)
		for _, ItemLog in ipairs(ItemLogList) do
			local Data = {}
			table.insert(Data, ItemLog.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, ItemLog.Uid)
			table.insert(Data, ItemLog.Name)
			table.insert(Data, ItemLog.ItemType)
			table.insert(Data, ItemLog.ItemName)
			table.insert(Data, ItemLog.Amount)
--			table.insert(Data, PositionMap[ItemLog.Position] or "背包")
			table.insert(Data, OperationTypes[ItemLog.OperationType] or "")
			table.insert(Data, ItemLog.Reason)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("物品日志.xls", Titles, TableData)
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
	Viewer:View("template/log/item_log_list.html", Params)
end

DoRequest()
