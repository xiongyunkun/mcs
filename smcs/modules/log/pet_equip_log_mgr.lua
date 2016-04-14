----------------------------------------
--$Id: pet_equip_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 魔神装备日志查询
--
--]]

--魔神装备日志操作面板展示
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
	Titles = {"时间", "平台", "服", "角色ID", "角色名", "部位", "消耗材料", "操作类型", "操作后装备名称"}
	TableData = {}
	local PositionList = {"武器", "铠甲", "腰带", "护符"}
	local OperationTypes = {"进阶","强化", "附魔"}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local PetEquipLogList = PetEquipLogData:Get(Options.PlatformID, Options)
		if #PetEquipLogList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/log/pet_equip_log_list.html")
			return
		end
		for _, LogInfo in ipairs(PetEquipLogList) do
			local Data = {}
			table.insert(Data, LogInfo.Time or "")
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, LogInfo.Uid)
			table.insert(Data, LogInfo.Name)
			local Position = LogInfo.Position
			Position = string.split(Position, "#")
			local PositionStr = ""
			if #Position > 1 then
				PositionStr = "魔神装备" .. Position[1] .. PositionList[tonumber(Position[2])]
			end
			table.insert(Data, PositionStr)
			--消耗资源
			local NewConsumeList = {}
			local ConsumeList = string.split(LogInfo.Consume, "#")
			for _, Consume in ipairs(ConsumeList) do
				Consume = string.split(Consume, "_")
				if tonumber(Consume[1]) == 1 then
					local ItemName = ItemDataMap[tonumber(Consume[2])]
					if ItemName then
						NewConsumeList[ItemName] = tonumber(Consume[3])
					end
				elseif CommonData.BONUS_ID2NAME[tonumber(Consume[1])] then
					NewConsumeList[CommonData.BONUS_ID2NAME[tonumber(Consume[1])]] = tonumber(Consume[3])
				end
			end
			table.insert(Data, table.size(NewConsumeList) > 0  and Serialize(NewConsumeList) or "")
			table.insert(Data, OperationTypes[LogInfo.OperationType])
			table.insert(Data, LogInfo.NewItemName)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("魔神装备日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/pet_equip_log_list.html")
end

DoRequest()