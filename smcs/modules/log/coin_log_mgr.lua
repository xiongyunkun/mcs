----------------------------------------
--$Id: coin_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 货币日志查询
--
--]]
local TypeValues = {
	[1] = "钻石",
	[2] = "金币",
}

--钻石金币操作面板展示
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
		{["Type"] = "Select",["Label"] = "类型",["Name"] = "Type", ["Values"] = TypeValues},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	local Titles = {"时间", "平台", "服", "角色ID", "角色名", "货币变化量", '操作后货币量', '系统', "渠道", "物品", "数量"}
	local TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local CoinLogList = {}
		if tonumber(Options.Type) == 1 then --钻石
			CoinLogList = GoldLogData:Get(Options.PlatformID, Options)
		elseif tonumber(Options.Type) == 2 then --金币
			CoinLogList = MoneyLogData:Get(Options.PlatformID, Options)
		end
		if #CoinLogList >= 5000 then
			local ExtMsg = "数据量太大，请缩小查询范围后查询"
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
				ExtMsg = ExtMsg,
			}
			Viewer:View("template/log/coin_log_list.html", Params)
			return
		end
		
		for _, CoinLog in ipairs(CoinLogList) do
			if CoinLog.Reason and CoinLog.Reason ~= "" then
				local Data = {}
				table.insert(Data, CoinLog.Time)
				table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
				table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
				table.insert(Data, CoinLog.Uid)
				table.insert(Data, CoinLog.Name)
				table.insert(Data, CoinLog.Changes)
				table.insert(Data, CoinLog.Remain)
				local Names = string.split(CoinLog.Reason, "_")
				table.insert(Data, Names[1])
				table.insert(Data, Names[2] or Names[#Names])
				table.insert(Data, Names[3] or Names[#Names])
				table.insert(Data, 1)
				table.insert(TableData, Data)
			end
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
	Viewer:View("template/log/coin_log_list.html", Params)
end

DoRequest()
