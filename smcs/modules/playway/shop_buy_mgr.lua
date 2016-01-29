----------------------------------------
--$Id: instance_mgr.lua 67092 2015-07-13 09:50:01Z jm $
----------------------------------------
--[[
-- 商城道具统计
--
--]]

local DifficultyList = {}
local pairs = pairs

function Show(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d 00:00:00",ngx.time() - 86400)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d 23:59:59",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	local Titles = {"平台", "服", "商品ID", "商品名称", "购买次数", "购买人次"}
	local TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" then
		local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
		local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"

		local Res = ShopBuyLogData:Get(Options.PlatformID, Options)
		local NewRes = self:AssembleData(Res)
		for ItemType, Info in pairs(NewRes) do
			local Data = {}
			table.insert(Data, PlatformStr)
			table.insert(Data, HostStr)
			table.insert(Data, ItemType)
			table.insert(Data, ItemDataMap[tonumber(ItemType)] or "")
			table.insert(Data, Info.PayNum or 0)
			table.insert(Data, table.size(Info.Uids))
			table.insert(TableData, Data)
		end
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("关卡达成.xls", Titles, TableData)
		ngx.say(ExcelStr)
		return
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
		TableData = TableData,
		DataTable = DataTable,
		Titles = Titles,
	}
	Viewer:View("template/playway/instance_show.html", Params)
end

function AssembleData(self, Res)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[Info.ItemType] = Results[Info.ItemType] or {PayNum = 0, Uids = {}}
		Results[Info.ItemType].PayNum = Results[Info.ItemType].PayNum + Info.Amount
		Results[Info.ItemType].Uids[Info.Uid] = true 
	end
	return Results
end



DoRequest()
