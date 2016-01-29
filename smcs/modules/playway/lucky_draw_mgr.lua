----------------------------------------
--$Id: lucky_draw_mgr.lua 67092 2015-07-13 09:50:01Z jm $
----------------------------------------
--[[
-- 酒馆统计
--
--]]

local TypeValues = {
	[0] = "全部",
	[1] = "1连抽", 
	[2] = "10连抽", 
	[3] = "免费抽取"
}

function Show(self)
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
		{["Type"] = "Select",["Label"] = "类型",["Name"] = "ProcType", ["Values"] = TypeValues},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	local Titles = {"时间", "平台", "服", "角色ID", "角色名", "抽奖类型", "奖励列表"}
	local TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local LuckyLogList = LuckyDrawLogData:Get(Options.PlatformID, Options)
		for _, Info in ipairs(LuckyLogList) do
			local Data = {}
			table.insert(Data, Info.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Info.Uid)
			table.insert(Data, Info.Name)
			table.insert(Data, TypeValues[Info.ProcType])
			local RewardList = self:GetReward(Info.Bonus)
			table.insert(Data, table.size(RewardList) > 0 and Serialize(RewardList) or "")
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("酒馆统计.xls", Titles, TableData)
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
		TableData = TableData,
		DataTable = DataTable,
		Titles = Titles,
	}
	Viewer:View("template/playway/lucky_draw_show.html", Params)
end

function GetReward(self, Rewards)
	local Results = {}
	local RewardList = string.split(Rewards, ";")
	local CardInfos = CardCfg.ConstInfo["卡片_配置表"]
	for _, Reward in ipairs(RewardList) do
		--再用下划线划分
		local RewardInfo = string.split(Reward, "_")
		if #RewardInfo == 3 then
			local RewardName = RewardInfo[1]
			if RewardName == "物品" then
				local ItemName = ItemDataMap[tonumber(RewardInfo[2])] or "未知物品"
				Results[ItemName] = (Results[ItemName] or 0) + tonumber(RewardInfo[3])
			elseif RewardName == "卡片" then
				local CardInfo = CardInfos[tonumber(RewardInfo[2])] 
				local CardName = CardInfo.Name or "未知卡牌"
				Results[CardName] = (Results[CardName] or 0) + tonumber(RewardInfo[3])
			end
		end
	end
	return Results
end


DoRequest()
