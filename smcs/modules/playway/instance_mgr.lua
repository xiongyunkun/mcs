----------------------------------------
--$Id: instance_mgr.lua 67092 2015-07-13 09:50:01Z jm $
----------------------------------------
--[[
-- 关卡达成
--
--]]

local DifficultyList = {}
local pairs = pairs

function Show(self)
	local Options = GetQueryArgs()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	Options.StageType = Options.StageType or 1 --默认展示普通关卡
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local StageTypes = {"普通关卡", "精英关卡"}
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Select", ["Label"] = "关卡类型", ["Name"] = "StageType", ["Values"] = StageTypes},
		{["Type"] = "Export",},
	}
	local Titles = {"平台", "服", "章节ID", "章节名称", "参与人数", "达成人数", "总创角人数", "达成率"}
	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"

	local InstanceRes = InstanceData:GetStatics(Options)
	for StageId, Info in pairs(InstanceRes) do
		local Data = {}
		table.insert(Data, PlatformStr)
		table.insert(Data, HostStr)
		table.insert(Data, StageId)
		table.insert(Data, STAGE_MAP[StageId] or "")
		table.insert(Data, Info.TotalNum or 0)
		table.insert(Data, Info.PassNum or 0)
		table.insert(Data, Info.RegNum or 0)
		local Rate = Info.RegNum ~= 0 and math.floor(Info.PassNum * 10000/Info.RegNum)/100 .. "%" or 0
		table.insert(Data, Rate)
		table.insert(TableData, Data)
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("关卡达成.xls", Titles, TableData)
		ngx.say(ExcelStr)
		return
	end
	local DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
		["SortCol"] = 2,
		["SortBy"] = "asc",
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


DoRequest()
