----------------------------------------
--$Id: pet_soul_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 宝石日志查询
--
--]]

local OperationTypes = {
	[0] = "全部",
	[1] = "替换", 
	[2] = "镶嵌",
	[3] = "卸下", 
	[4] = "合成"
}

--宝石日志操作面板展示
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
		{["Type"] = "Select",["Label"] = "操作类型",["Name"] = "OperationType", ["Values"] = OperationTypes},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {"时间", "平台", "服", "角色ID", "角色名", "部位", "操作类型", '消耗材料', '操作后宝石名称', "操作数量"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local PetSoulLogList = PetSoulLogData:Get(Options.PlatformID, Options)
		if #PetSoulLogList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/log/pet_soul_log_list.html")
			return
		end
		for _, LogInfo in ipairs(PetSoulLogList) do
			local Data = {}
			table.insert(Data, LogInfo.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, LogInfo.Uid)
			table.insert(Data, LogInfo.Name)
			table.insert(Data, LogInfo.Grid ~= 0 and "栏位" .. LogInfo.Grid or "背包")
			table.insert(Data, OperationTypes[LogInfo.OperationType] or "")
			local Consume = self:GetConsumeStr(LogInfo.Consume)
			table.insert(Data, table.size(Consume) >0  and Serialize(Consume) or "")
			table.insert(Data, ItemDataMap[LogInfo.ItemType] or "")
			table.insert(Data, LogInfo.Amount)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("宝石日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/pet_soul_log_list.html")
end

function GetConsumeStr(self, Consumes)
	local Results = {}
	local RewardList = string.split(Consumes, "#")
	for _, Reward in ipairs(RewardList) do
		--再用下划线划分
		local RewardInfo = string.split(Reward, "_")
		if #RewardInfo == 3 and CommonData.BONUS_ID2NAME[tonumber(RewardInfo[1])] then
			local RewardName = CommonData.BONUS_ID2NAME[tonumber(RewardInfo[1])]
			if RewardName == "物品" then
				local ItemName = ItemDataMap[tonumber(RewardInfo[2])] or "未知物品"
				Results[ItemName] = (Results[ItemName] or 0) + tonumber(RewardInfo[3])
			else
				Results[RewardName] = (Results[RewardName] or 0) + tonumber(RewardInfo[3])
			end
		end
	end
	return Results
end


DoRequest()