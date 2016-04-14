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
		{["Type"] = "label",["Text"] = "邮件内容:"},
		{["Type"] = "text",["Name"] = "Content", ["Placeholder"] = "邮件内容"},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}

	--展示数据
	Titles = {'时间', "平台", "服", "角色ID", "角色名", "邮件类型", '发信人', "标题",'内容',
		'附加奖励'}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		--先从用户信息表中获取玩家ID与Name的映射关系
		local UidMap = {}
		local UserRes = UserInfoData:Get({PlatformID = Options.PlatformID, HostID = Options.HostID,Uid=Options.Uid})
		for _, Info in ipairs(UserRes) do
			UidMap[Info.Uid] = Info.Name
		end
		local LogList = MessageLogData:Get(Options.PlatformID, Options)
		for _, Log in ipairs(LogList) do
			local Data = {}
			table.insert(Data, Log.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Log.Uid)
			table.insert(Data, UidMap[Log.Uid])
			table.insert(Data, MessageTypes[Log.MessageType])
			table.insert(Data, Log.SenderName)
			table.insert(Data, Log.Title)
			table.insert(Data, Log.Content)
			local RewardList = self:GetReward(Log.Bonus)
			local RewardStr = table.size(RewardList) > 0 and Serialize(RewardList) or ""
			RewardStr = string.gsub(RewardStr, "钻石", '<font color="red">钻石<font>')
			RewardStr = string.gsub(RewardStr, "绑钻", '<font color="red">绑钻<font>')
			table.insert(Data, RewardStr)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("邮件日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/message_log_list.html")
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