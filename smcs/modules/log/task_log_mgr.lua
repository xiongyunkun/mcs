----------------------------------------
--$Id: task_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 任务日志查询
--
--]]

--钻石金币操作面板展示
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
		{["Type"] = "label",["Text"] = "任务ID:"},
		{["Type"] = "text",["Name"] = "Task", ["Placeholder"] = "任务ID"},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {"接受时间", "完成时间", "平台", "服", "角色ID", "角色名", "任务ID", '任务名称', '任务类型'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local TaskLogList = TaskLogData:Get(Options.PlatformID, Options)
		if #TaskLogList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["DisplayLength"] = 50,
			}
			Viewer:View("template/log/task_log_list.html")
			return
		end
		TaskLogList = self:MergeTask(TaskLogList)
		for _, TaskLog in ipairs(TaskLogList) do
			local Data = {}
			table.insert(Data, TaskLog.StartTime or "")
			table.insert(Data, TaskLog.EndTime or "")
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, TaskLog.Uid)
			table.insert(Data, TaskLog.Name)
			table.insert(Data, TaskLog.Task)
			table.insert(Data, TaskDataMap[TaskLog.Task] or "")
			table.insert(Data, TaskLog.TaskType == 1 and "主线任务" or "其他任务")
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
	Viewer:View("template/log/task_log_list.html")
end

function MergeTask(self, TaskLogList)
	local NewTaskLogList = {}
	local TaskLogMap = {}
	for _, TaskLog in ipairs(TaskLogList) do
		if not TaskLogMap[TaskLog.Uid] then
			TaskLogMap[TaskLog.Uid] = {}
		end
		if not TaskLogMap[TaskLog.Uid][TaskLog.Task] then
			TaskLogMap[TaskLog.Uid][TaskLog.Task] = TaskLog
		end
		if TaskLog.Type == 1 then
			TaskLogMap[TaskLog.Uid][TaskLog.Task].StartTime = TaskLog.Time
		elseif TaskLog.Type == 2 then
			TaskLogMap[TaskLog.Uid][TaskLog.Task].EndTime = TaskLog.Time
		end
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