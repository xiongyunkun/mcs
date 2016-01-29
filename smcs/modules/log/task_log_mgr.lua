----------------------------------------
--$Id: task_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 任务日志查询
--
--]]

--钻石金币操作面板展示
function LogShow(self)
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
		{["Type"] = "<br>",},
		{["Type"] = "label",["Text"] = "任务ID:"},
		{["Type"] = "text",["Name"] = "AchieveId", ["Placeholder"] = "任务ID"},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	local Titles = {"完成时间", "平台", "服", "角色ID", "任务ID", "任务名字", "完成等级"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	local TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local TaskLogList = TaskLogData:Get(Options.PlatformID, Options)
		if #TaskLogList >= 5000 then
			local ExtMsg = "数据量太大，请缩小查询范围后查询"
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
				ExtMsg = ExtMsg,
			}
			Viewer:View("template/log/task_log_list.html", Params)
			return
		end
		TaskLogList = self:MergeTask(TaskLogList)
		for _, TaskLog in ipairs(TaskLogList) do
			local Data = {}
			table.insert(Data, TaskLog.EndTime or "")
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, TaskLog.Uid)
			table.insert(Data, TaskLog.AchieveId)
			table.insert(Data, TaskDataMap[TaskLog.AchieveId] or "")
			table.insert(Data, TaskLog.FinishLevel)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("任务日志.xls", Titles, TableData)
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
	Viewer:View("template/log/task_log_list.html", Params)
end

function MergeTask(self, TaskLogList)
	local NewTaskLogList = {}
	local TaskLogMap = {}
	for _, TaskLog in ipairs(TaskLogList) do
		if not TaskLogMap[TaskLog.Uid] then
			TaskLogMap[TaskLog.Uid] = {}
		end
		if not TaskLogMap[TaskLog.Uid][TaskLog.AchieveId] then
			TaskLogMap[TaskLog.Uid][TaskLog.AchieveId] = TaskLog
		end
		TaskLogMap[TaskLog.Uid][TaskLog.AchieveId].EndTime = TaskLog.Time
	end
	--排序
	for _, UserTask in pairs(TaskLogMap) do
		for TaskID, TaskLog in pairs(UserTask) do
			table.insert(NewTaskLogList, TaskLog)
		end
	end
	table.sort(NewTaskLogList, function(X, Y) return GetTimeStamp(X) > GetTimeStamp(Y) end)
	return NewTaskLogList
end

DoRequest()
