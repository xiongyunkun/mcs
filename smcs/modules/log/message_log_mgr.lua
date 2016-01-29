----------------------------------------
--$Id: message_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 邮件日志查询
--
--]]
local MessageTypes = {"奖励消息", "提示消息"}

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
		{["Type"] = "text",["Name"] = "TargetUid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "收件者角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "<br>",},
		{["Type"] = "label",["Text"] = "邮件内容:"},
		{["Type"] = "text",["Name"] = "Content", ["Placeholder"] = "邮件内容"},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}

	--展示数据
	local Titles = {'时间', "平台", "服", "角色ID", "角色名", '发信人', "标题",'内容','附加奖励'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		--先从用户信息表中获取玩家ID与Name的映射关系
		local UidMap = {}
		local UserRes = UserInfoData:Get({PlatformID = Options.PlatformID, HostID = Options.HostID,Uid=Options.TargetUid, Name = Options.Name})
		for _, Info in ipairs(UserRes) do
			UidMap[Info.Uid] = Info.Name
		end
		local LogList = MessageLogData:Get(Options.PlatformID, Options)
		for _, Log in ipairs(LogList) do
			local Data = {}
			table.insert(Data, Log.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Log.TargetUid)
			table.insert(Data, UidMap[Log.Uid] or "系统")
--			table.insert(Data, MessageTypes[Log.MessageType])
			table.insert(Data, Log.SenderName)
			table.insert(Data, Log.Title)
			table.insert(Data, Log.Content)
			local RewardList = CommonFunc.GetReward(Log.Bonus)
			table.insert(Data, table.size(RewardList) > 0 and Serialize(RewardList) or "")
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("邮件日志.xls", Titles, TableData)
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
	Viewer:View("template/log/message_log_list.html", Params)
end

DoRequest()
