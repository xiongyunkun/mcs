----------------------------------------
--$Id: instance_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 副本日志查询
--
--]]
-- local OperationTypes = {"挑战", "扫荡"}
-- local OperationResults = {[0] = "失败", [1] = "成功"}
--物品日志操作面板展示
function LogShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time() - 86400 * 7)
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
		{["Type"] = "label",["Text"] = "副本ID:"},
		{["Type"] = "text",["Name"] = "StageId", ["Placeholder"] = "副本ID"},
		{["Type"] = "label",["Text"] = "副本类型:"},
		{["Type"] = "text",["Name"] = "StageType", ["Placeholder"] = "副本类型"},

		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}

	--展示数据
	local Titles = {'时间', "平台", "服", "角色ID", "角色名", "副本ID", "副本名称", '副本类型', '挑战结果', '挑战次数','获得奖励','星级评定'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local LogList = InstanceLogData:Get(Options.PlatformID, Options)
		for _, Log in ipairs(LogList) do
			local Data = {}
			table.insert(Data, Log.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Log.Uid)
			table.insert(Data, Log.Name)
			table.insert(Data, Log.StageId)
			local InstName = STAGE_MAP[tonumber(Log.StageId)] or ""
			table.insert(Data, InstName)
			table.insert(Data, Log.StageType)
			local Result = Log.IsFinish > 0 and "成功" or "失败"
			table.insert(Data, Result)
			table.insert(Data, Log.Times)
			local BonusList = self:GetBonus(Log.Bonus)
			table.insert(Data, Result == "成功" and Serialize(BonusList) or "")
			table.insert(Data, Log.IsFinish)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("副本日志.xls", Titles, TableData)
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
	Viewer:View("template/log/instance_log_list.html", Params)
end

--获得奖励列表
function GetBonus(self, Bonuss)
	local Results = {}
	local BonusList = string.split(Bonuss, ";")
	for _, Bonus in ipairs(BonusList) do
		--再用下划线划分
		local BonusInfo = string.split(Bonus, "_")
		if #BonusInfo == 5 then
			local BonusName = BonusInfo[2]
			if BonusName == "物品" then
				local ItemName = ItemDataMap[tonumber(BonusInfo[3])] or "未知物品"
				Results[ItemName] = (Results[ItemName] or 0) + tonumber(BonusInfo[4])
			else
				Results[BonusName] = (Results[BonusName] or 0) + tonumber(BonusInfo[4])
			end
		end
	end
	return Results
end

DoRequest()
