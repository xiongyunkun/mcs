----------------------------------------
--$Id: endless_battle_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 方舟之战查询
--
--]]

local ExitTypes = {
	[1] = "手动退出", 
	[2] = "死亡退出",
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
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {"时间", "平台", "服", "角色ID", "角色名", "通关层数", "获得奖励", '退出类型'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local LogList = EndlessBattleLogData:Get(Options.PlatformID, Options)
		if #LogList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/playway/endless_battle.html")
			return
		end
		for _, LogInfo in ipairs(LogList) do
			local Data = {}
			table.insert(Data, LogInfo.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, LogInfo.Uid)
			table.insert(Data, LogInfo.Name)
			table.insert(Data, LogInfo.CurStage)
			local Rewards = self:GetRewardStr(LogInfo.Rewards)
			table.insert(Data, table.size(Rewards) >0  and Serialize(Rewards) or "")
			table.insert(Data, ExitTypes[tonumber(LogInfo.ExitType)] or "")
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("方舟之战日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
		["DisplayLength"] = 50,
	}
	Viewer:View("template/playway/endless_battle.html")
end

function GetRewardStr(self, Rewards)
	local Results = {}
	local RewardList = string.split(Rewards, "#")
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