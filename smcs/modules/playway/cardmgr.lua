----------------------------------------
--$Id: cardmgr.lua 87365 2016-01-14 06:21:54Z xiongyunkun $
----------------------------------------
--[[
-- 卡牌等阶统计展示
--
--]]

--英雄统计
function CardStaticsShow(self)
	local Options = GetQueryArgs()
	local CardRes = CardStaticsData:GetStatics(Options)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local CardInfos = CardCfg.ConstInfo["卡片_配置表"]
	local CardMap = {[0] = "全部"}
	for CardTypeId, Info in pairs(CardInfos) do
		if CardTypeId >= 10000000 and CardTypeId < 20000000 and Info.CanSee == 1 then
			CardMap[CardTypeId] = Info.Name
		end
	end
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "英雄名称", ["Name"] = "CardTypeId", ["Values"] = CardMap,},
		{["Type"] = "Export",},
	}
	local Titles = {"平台", "服", "英雄ID", "英雄名称", "拥有数量"}
	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	for CardTypeId, Num in pairs(CardRes) do
		local CardInfo = {}
		table.insert(CardInfo, PlatformStr)
		table.insert(CardInfo, HostStr)
		table.insert(CardInfo, CardTypeId)
		table.insert(CardInfo, CardMap[CardTypeId] or "")
		table.insert(CardInfo, Num)
		table.insert(TableData, CardInfo)
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("英雄统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
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
		Viewer:View("template/playway/card_show.html", Params)
	end
end

DoRequest()
