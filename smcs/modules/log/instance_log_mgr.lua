----------------------------------------
--$Id: instance_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 副本日志查询
--
--]]
local OperationTypes = {"挑战", "扫荡"}
local OperationResults = {[0] = "失败", [1] = "成功", [-1] = ""}
--物品日志操作面板展示
function LogShow(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d 00:00:00",os.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",os.time())
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	local InstanceList = {}
	for ID, InstName in pairs(CommonData.SYS_INSTANCES) do
		InstanceList[ID] = InstName
	end
	for ID, InstName in pairs(CommonData.TIMER_INSTANCES) do
		InstanceList[ID] = InstName
	end
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "Select",["Label"] = "类型",["Name"] = "InstanceType", ["Values"] = InstanceList},
		{["Type"] = "<br>",},
		{["Type"] = "label",["Text"] = "副本ID:"},
		{["Type"] = "text",["Name"] = "InstanceID", ["Placeholder"] = "副本ID"},
		{["Type"] = "label",["Text"] = "副本名称:"},
		{["Type"] = "text",["Name"] = "InstanceName", ["Placeholder"] = "副本名称"},

		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}

	--展示数据
	Titles = {'时间', "平台", "服", "角色ID", "角色名", "副本类型","副本ID", '副本名称', "挑战类型", "挑战结果",
		'挑战次数','获得奖励','星级评定'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	
	TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local LogList = InstanceLogData:Get(Options.PlatformID, Options)
		for _, Log in ipairs(LogList) do
			local Data = {}
			table.insert(Data, Log.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Log.Uid)
			table.insert(Data, Log.Name)
			table.insert(Data, InstanceList[Log.InstanceType] or "")
			table.insert(Data, Log.InstanceID)
			table.insert(Data, Log.InstanceName)
			table.insert(Data, OperationTypes[Log.OperationType])
			local Result = OperationResults[Log.Result]
			table.insert(Data, Result)
			table.insert(Data, Log.Num)
			local RewardList = self:GetReward(Log.Reward)
			table.insert(Data, Result == "成功" and Serialize(RewardList) or "")
			table.insert(Data, Log.Star)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("副本日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/instance_log_list.html")
end

--获得奖励列表
function GetReward(self, Rewards)
	local Results = {}
	local RewardList = string.split(Rewards, ";")
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