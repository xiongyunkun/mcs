----------------------------------------
--$Id: team_inst_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 诸神黄昏日志查询
--
--]]

local Stages = {
	[10001] = "双生之门",
	[10002] = "守望之魂",
	[10003] = "三极之地",
	[10004] = "厄梦桥",
	[10005] = "战歌峡谷",
	[10006] = "海王神宫",
	[10007] = "潘神秘境",
	[10008] = "转轮殿",
}
local Difficulties = {"简单", "普通", "困难"}
local Types = {"进入副本", "通关", "获得奖励", "获得额外奖励"}

--诸神黄昏操作面板展示
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
	Titles = {"时间", "平台", "服", "角色ID", "角色名", "副本名称", '副本难度', '操作类型', "奖励列表"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local TeamInstLogList = TeamInstLogData:Get(Options.PlatformID, Options)
		if #TeamInstLogList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/playway/team_inst_show.html")
			return
		end
		for _, LogInfo in ipairs(TeamInstLogList) do
			local Data = {}
			table.insert(Data, LogInfo.Time or "")
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, LogInfo.Uid)
			table.insert(Data, LogInfo.Name)
			table.insert(Data, Stages[LogInfo.StageId] or LogInfo.StageId)
			table.insert(Data, Difficulties[LogInfo.SubStageId])
			table.insert(Data, Types[LogInfo.Type])
			--消耗资源
			local NewRewardList = {}
			local Rewards = string.split(LogInfo.Rewards, "#")
			for _, Reward in ipairs(Rewards) do
				Reward = string.split(Reward, "_")
				if tonumber(Reward[1]) == 1 then
					local ItemName = ItemDataMap[tonumber(Reward[2])]
					if ItemName then
						NewRewardList[ItemName] = tonumber(Reward[3])
					end
				elseif CommonData.BONUS_ID2NAME[tonumber(Reward[1])] then
					NewRewardList[CommonData.BONUS_ID2NAME[tonumber(Reward[1])]] = tonumber(Reward[3])
				end
			end
			table.insert(Data, table.size(NewRewardList) > 0  and Serialize(NewRewardList) or "")
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("任务日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
		["DisplayLength"] = 50,
	}
	Viewer:View("template/playway/team_inst_show.html")
end

DoRequest()