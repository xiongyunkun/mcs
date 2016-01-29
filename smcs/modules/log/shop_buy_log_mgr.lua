----------------------------------------
--$Id: shop_buy_log_mgr.lua 88866 2016-01-26 07:28:41Z xiongyunkun $
----------------------------------------
--[[
-- 消费日志查询
--
--]]

local CURRENCY_TYPE = {
	[0] = "金币",
	[2] = "竞技场功勋",
	[3] = "街头霸王",
	[4] = "钻石",
	[5] = "公会贡献",
	[6] = "天赋点"
}

local ShopIDs = {"日常", "竞技场", "街霸", "地精", "黑市", "商行Ⅰ", "商行Ⅱ", "商行Ⅲ"}

local ipairs = ipairs

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
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	local Titles = {"时间", "平台", "服", "角色ID", "角色名", "商店名称", '物品名称', '数量', "价格类型", "价格数量"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	local TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		Options.Consume = true
		local ShopBuyLogList = ShopBuyLogData:Get(Options.PlatformID, Options)
		if #ShopBuyLogList >= 5000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/log/consume_log_list.html")
			return
		end
		for _, ShopLog in ipairs(ShopBuyLogList) do
			local Data = {}
			table.insert(Data, ShopLog.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, ShopLog.Uid)
			table.insert(Data, ShopLog.Name)
			table.insert(Data, ShopIDs[tonumber(ShopLog.ShopId)])
			table.insert(Data, ItemDataMap[tonumber(ShopLog.ItemType)] or "")
			table.insert(Data, ShopLog.Amount)
			local CostType = string.split(ShopLog.CostType, "_")
			local TypeNames = {}
			for _, Info in ipairs(CostType) do
				if Info ~= "" then
					table.insert(TypeNames, CURRENCY_TYPE[tonumber(Info)] or "")
				end
			end
			table.insert(Data, table.concat( TypeNames, ","))
			local CostValue = ShopLog.CostValue
			CostValue = string.sub(CostValue, 0, string.len(CostValue) - 1)
			CostValue = string.gsub(CostValue, "_", ",")
			table.insert(Data, CostValue)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("消费日志.xls", Titles, TableData)
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
	Viewer:View("template/log/consume_log_list.html", Params)
end

DoRequest()
