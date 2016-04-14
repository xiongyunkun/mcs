----------------------------------------
--$Id: mount_level_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 坐骑升阶日志查询
--
--]]

--坐骑升阶操作面板展示
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
	Titles = {"时间", "平台", "服", "角色ID", "角色名", "操作前坐骑等阶", '操作后坐骑等阶', 
		'操作前祝福值', "操作后祝福值", "消耗列表"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local MountLevelLogList = MountLevelLogData:Get(Options.PlatformID, Options)
		if #MountLevelLogList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/log/mount_level_log_list.html")
			return
		end
		for _, LogInfo in ipairs(MountLevelLogList) do
			local Data = {}
			table.insert(Data, LogInfo.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, LogInfo.Uid)
			table.insert(Data, LogInfo.Name)
			local OrgEvoLevelStr = (MountTransIDMap[LogInfo.TransID] or "") .. "(" .. LogInfo.OrgEvoLevel .."阶)"
			table.insert(Data, OrgEvoLevelStr)
			local NewEvoLevelStr = (MountTransIDMap[LogInfo.TransID] or "") .. "(" .. LogInfo.NewEvoLevel .."阶)"
			table.insert(Data, NewEvoLevelStr)
			table.insert(Data, LogInfo.OrgExp)
			table.insert(Data, LogInfo.NewExp)
			table.insert(Data, Serialize(self:GetConsumeStr(LogInfo.Consumes)))
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("魔神升阶日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/mount_level_log_list.html")
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