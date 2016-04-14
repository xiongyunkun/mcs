----------------------------------------
--$Id: god_door_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 魔神统计查询
--
--]]

function PetStaticsShow(self)
	Options = GetQueryArgs()
	Options.Time = Options.Time or os.date("%Y-%m-%d",os.time())
	
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	local PetNameMap = {[""] = "全部"}
	for ID, PetName in pairs(PetDataMap) do
		PetNameMap[ID] = PetName .. "_" .. ID
	end
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "<br>",},
		{["Type"] = "Select", ["Label"] = "魔神",["Name"] = "PetID", ["Values"] = PetNameMap,},
		{["Type"] = "Time",},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {'时间', "平台", "服", "角色ID", "角色名", "平台账号", "魔神ID", "魔神名称", "等级", "等阶", "战斗力"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local PetList = PetDayStaticsData:Get(Options.PlatformID, Options)
		if #PetList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/playway/petmgr.html")
			return
		end
		for _, Info in ipairs(PetList) do
			local Data = {}
			table.insert(Data, Info.Date)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Info.Uid)
			table.insert(Data, Info.Name)
			table.insert(Data, Info.Urs)
			table.insert(Data, Info.PetID)
			table.insert(Data, PetDataMap[Info.PetID])
			table.insert(Data, Info.Level)
			table.insert(Data, Info.StarLevel)
			table.insert(Data, Info.Fighting)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("魔神统计.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",

		["DisplayLength"] = 50,
	}
	Viewer:View("template/playway/petmgr.html")
end

DoRequest()