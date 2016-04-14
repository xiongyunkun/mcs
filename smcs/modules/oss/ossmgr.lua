----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- platform list manager
--
--]]

--留存率
function Retention(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	local RetData = {}
	if Options.OperationType == "2" then
		RetData = PayRetentionData:GetStatics(Options)
	else
		RetData = RetentionData:GetStatics(Options)
	end 
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "统计类型", ["Name"] = "OperationType", ["Values"] = {["1"] = "登陆用户", ["2"] = "付费用户"},},
		{["Type"] = "Export",},
	}
	--构造表格
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	TableData = {}
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all")
		table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
		local NewNum = 0 
		if Options.OperationType == "2" then
			NewNum = RetData[Date] and RetData[Date]["FirstPayUserNum"] or 0 
		else
			NewNum = RetData[Date] and RetData[Date]["NewNum"] or 0
		end
		table.insert(DateInfo, NewNum)
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "1Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "2Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "3Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "4Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "5Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "6Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "13Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "29Days"))
		table.insert(TableData, DateInfo)
		StartTime = StartTime + 86400
	end
	local Title = Options.OperationType == "2" and "当日首充" or "当日新增"
	Titles = {"时间", "平台", "服", Title, "次日留存", "3日留存率",
				"4日留存率", "5日留存率", "6日留存率", "7日留存率", "14日留存率", 
				"30日留存率"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("用户留存.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/retention.html")
	end
end
--格式化留存率数据
function RetDataFormat(self, DateInfo, Index)
	if DateInfo and DateInfo[Index] and DateInfo[Index] ~= 0 then
		return DateInfo[Index] .. "%"
	else
		return "-"
	end
end

--在线时长
function OnlineTime(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	local OnlineData = OnlineTimeData:GetStatics(Options)
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "玩家类型", ["Name"] = "UserType", ["Values"] = {[""] = "所有玩家", ["2"] = "新注册玩家"},},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	--构造表格
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	TableData = {}
	local TimeRange = EndTime - StartTime
	local DateData = {}
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all")
		table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
		local AveTime = OnlineData[Date] and OnlineData[Date]["AveTime"] or 0
		table.insert(DateInfo, AveTime)
		table.insert(DateData, AveTime)
		local Time0, Time1, Time5, Time10, Time30, Time60, Time120, Time240, Time360, Time600, Time900, Time1200 = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		if OnlineData[Date] then
			Time0 = (OnlineData[Date]["Time0"] or 0)
			Time1 = (OnlineData[Date]["Time1"] or 0)
			Time5 = (OnlineData[Date]["Time5"] or 0)
			Time10 = (OnlineData[Date]["Time10"] or 0) + (OnlineData[Date]["Time15"] or 0)
			Time30 = (OnlineData[Date]["Time30"] or 0) + (OnlineData[Date]["Time45"] or 0)
			Time60 = (OnlineData[Date]["Time60"] or 0) + (OnlineData[Date]["Time90"] or 0)
			Time120 = (OnlineData[Date]["Time120"] or 0) + (OnlineData[Date]["Time150"] or 0) + (OnlineData[Date]["Time180"] or 0)
			Time240 = (OnlineData[Date]["Time240"] or 0) + (OnlineData[Date]["Time300"] or 0)
			Time360 = (OnlineData[Date]["Time360"] or 0) + (OnlineData[Date]["Time420"] or 0)
			Time600 = (OnlineData[Date]["Time600"] or 0)
			Time900 = (OnlineData[Date]["Time900"] or 0)
			Time1200 = (OnlineData[Date]["Time1200"] or 0)
		end
		table.insert(DateInfo, Time0)
		table.insert(DateInfo, Time1)
		table.insert(DateInfo, Time5)
		table.insert(DateInfo, Time10)
		table.insert(DateInfo, Time30)
		table.insert(DateInfo, Time60)
		table.insert(DateInfo, Time120)
		table.insert(DateInfo, Time240)
		table.insert(DateInfo, Time360)
		table.insert(DateInfo, Time600)
		table.insert(DateInfo, Time900)
		table.insert(DateInfo, Time1200)
		table.insert(TableData, DateInfo)
		StartTime = StartTime + 86400
	end
	Titles = {"时间", "平台", "服", "平均在线时长", 
			"<=1分钟", "(1,5]分钟", "(5,10]分钟", "(10,30]分钟", 
			"(30,60]分钟", "(1,2]小时", "(2,4]小时", "(4,6]小时","(6,10]小时",
			"(10,15]小时","(15,20]小时",">20小时"}
	if Options.Submit == "导出" then 
		local ExcelStr = CommonFunc.ExportExcel("在线时长.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = "玩家在线时长",
			["Title"] = "在线时长(分钟)",
			["SeriesName"] = "在线时长：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 86400, --时间间隔为1天
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/onlineTime.html")
	end
end

function FightRank(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	local RankRes = FightRankData:GetStatics(Options)
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	Titles = {"平台", "服", "排名", "角色名", "战斗力"}
	TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	for Index, RankInfo in ipairs(RankRes) do
		local RankData = {}
		table.insert(RankData, PlatformStr)
		table.insert(RankData, HostStr)
		table.insert(RankData, Index)
		table.insert(RankData, RankInfo.Name)
		table.insert(RankData, RankInfo.Fighting)
		table.insert(TableData, RankData)
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("元宝产出.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["SortCol"] = "2",
			["SortBy"] = "asc",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/fightRank.html")
	end
end

--登陆过程分析
function LoginStatics(self)
	Options = GetQueryArgs()
	local NowTime = os.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	local Timestamp = GetTimeStamp(Options.Time .. " 00:00:00")
	

	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",},
	}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	Titles = {"序号", "过程点", "完成等级", "总耗时"}
	for X = 0, 23 do
		table.insert(Titles, X)
	end
	table.insert(Titles, "总计")
	table.insert(Titles, "占比")
	local LoginStaticsStep = CommonData.LoginStaticsStep
	local StaticsStep = {}
	for Name, ID in pairs(LoginStaticsStep) do
		StaticsStep[ID] = Name
	end
	--还要加上登陆过程分析配置表中的配置项
	for ID, ActionInfo in pairs(ActionAnalysisCfg.Cfg) do
		StaticsStep[ID] = ActionInfo.Name
	end
	--再从登陆过程分析表中拿到可配置的登陆流程列表
	--先把总计算出来
	local TotalResults = {}
	local DateData = {}
	TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" then	
		local LoginRes = LoginStaticsData:GetStatics(Options)
		for Index, StepName in pairs(StaticsStep) do
			TotalResults[Index] = 0
			for X = 0, 23 do
				local Num = 0
				if LoginRes[Options.Time] and LoginRes[Options.Time][X] and LoginRes[Options.Time][X][Index] then
					TotalResults[Index] = TotalResults[Index] + LoginRes[Options.Time][X][Index]
				end
			end
		end
		local RowIndex = 1
		for Index, StepName in pairs(StaticsStep) do
			local Info = {}
			table.insert(Info, Index > 10 and Index - 5 or Index)
			table.insert(Info, StepName)
			local Level = ActionAnalysisCfg.Cfg[Index] and ActionAnalysisCfg.Cfg[Index].Level or 1
			local NeedTime = ActionAnalysisCfg.Cfg[Index] and ActionAnalysisCfg.Cfg[Index].NeedTime or 1
			table.insert(Info, Level)
			table.insert(Info, NeedTime)
			for X = 0, 23 do
				local Num = 0
				if LoginRes[Options.Time] and LoginRes[Options.Time][X] and LoginRes[Options.Time][X][Index] then
					Num = LoginRes[Options.Time][X][Index]
				end
				if StepName == "进入游戏" then
					table.insert(DateData, Num)
				end
				table.insert(Info, Num)
			end
			table.insert(Info, TotalResults[Index] or 0) --总计
			local Rate = "0%"
			if TotalResults[1] ~= 0 then
				Rate = math.floor(TotalResults[Index] * 10000/TotalResults[1])/100 .. "%"
			end
			table.insert(Info, Rate) --占比
			table.insert(TableData, Info)
			RowIndex = RowIndex + 1
		end
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("登陆过程分析.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = "登陆数据表",
			["Title"] = "日登陆",
			["SeriesName"] = "日登陆：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = 86400,
			["PointInterval"] = 3600, --时间间隔为1小时
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
			["SortBy"] = "asc",
		}
		Viewer:View("template/oss/loginStatics.html")
	end
end


--玩家等级统计
function LevelStatics(self)
	Options = GetQueryArgs()
	local NowTime = os.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	local LevelRes = LevelStaticsData:GetStatics(Options)
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",},
	}
	Titles = {"日期", "平台", "服", "等级", "用户数", "占比", "流失率", "活跃用户数",
		"活跃用户占比", "活跃用户流失率", "付费用户数", "付费用户占比", "付费用户流失率",
		"付费活跃用户数", "付费活跃用户占比", "付费活跃用户流失率"}
	TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local DateInfo = LevelRes[Options.Time] or {} --直接拿这一天的出来展示即可
	local TotalNum = 0
	TitleTips = {
		[5] = "截至统计日期，停留在统计等级的角色数",
		[6] = "该等级用户数/全部用户数",
		[7] = "该等级流失用户数/全部用户数",
		[8] = "截至统计日期，当天在线时间超过4h的角色数",
		[9] = "该等级活跃用户数/全部用户数",
		[10] = "该等级活跃用户流失用户数/全部用户数",
		[11] = "截至统计日期，有付费的角色数",
		[12] = "该等级付费用户数/全部用户数",
		[13] = "该等级付费用户流失用户数/全部用户数",
		[14] = "截至统计日期，当天在线时间超过4h的付费角色数",
		[15] = "该等级付费活跃用户数/全部用户数",
		[16] = "该等级付费活跃用户流失用户数/全部用户数"
	}
	for _, LevelInfo in pairs(DateInfo) do
		TotalNum = TotalNum + LevelInfo.TotalNum
	end
	for Level, LevelInfo in pairs(DateInfo) do
		local Info = {}
		table.insert(Info, Options.Time)  --日期
		table.insert(Info, PlatformStr)  --平台
		table.insert(Info, HostStr) --服
		table.insert(Info, Level) --等级
		table.insert(Info, LevelInfo.TotalNum) --用户数
		local TotalNumRate = math.floor(LevelInfo.TotalNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, TotalNumRate) --占比
		local TotalLostRate = math.floor(LevelInfo.TotalLostNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, TotalLostRate) --流失率
		table.insert(Info, LevelInfo.LivelNum) --活跃用户数
		local LiveRate = math.floor(LevelInfo.LivelNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, LiveRate) --活跃用户占比
		local LiveLostRate = math.floor(LevelInfo.LiveLostNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, LiveLostRate) -- 活跃用户流失率
		table.insert(Info, LevelInfo.PayNum)
		local PayNumRate = math.floor(LevelInfo.PayNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, PayNumRate) -- 付费用户占比
		local PayLostRate = math.floor(LevelInfo.PayLostNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, PayLostRate) --付费用户流失率
		table.insert(Info, LevelInfo.PayLivelNum) --付费活跃用户数
		local PayLiveRate = math.floor(LevelInfo.PayLivelNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, PayLiveRate) --付费活跃用户占比
		local PayLiveLostRate = math.floor(LevelInfo.PayLiveLostNum * 10000/TotalNum)/100 .. "%"
		table.insert(Info, PayLiveLostRate) --付费活跃用户流失率
		table.insert(TableData, Info)
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("玩家等级统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/levelStatics.html")
	end
end

-- 历史注册
function RegHistory(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	local RegRes = HistoryRegData:GetStatics(Options)
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	
	Titles = {"时间", "平台", "服", "当日注册", "历史注册", "男", "女",}
	TitleTips = {}
	TitleTips[5] = "当前统计时间内的注册总量"
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	TableData = {}
	local TimeRange = EndTime - StartTime
	local DateData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local TotalNum = 0
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, PlatformStr) --平台
		table.insert(DateInfo, HostStr) -- 服
		local RegNum = 0
		local Male = 0
		local Female = 0
		if RegRes[Date] then
			RegNum = RegRes[Date].RegNum
			TotalNum = TotalNum + RegNum
			Male = RegRes[Date].Male
			Female = RegNum - Male
		end
		table.insert(DateInfo, RegNum)
		table.insert(DateInfo, TotalNum)
		table.insert(DateInfo, Male)
		table.insert(DateInfo, Female)
		table.insert(TableData, DateInfo)
		table.insert(DateData, RegNum)
		StartTime = StartTime + 86400
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("历史注册.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = "历史注册表",
			["Title"] = "日注册",
			["SeriesName"] = "日注册：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 86400, --时间间隔为1天
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/regHistory.html")
	end
end

function OnlineHistroy(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	local OnlineRes = HistoryOnlineData:GetStatics(Options)
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	Titles = {"时间", "平台", "服", "最高在线", "平均在线", "平高比",}
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	TableData = {}
	local TimeRange = EndTime - StartTime
	local DateData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local TotalNum = 0
	
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, PlatformStr) --平台
		table.insert(DateInfo, HostStr) -- 服
		local MaxNum = 0
		local AveNum = 0
		if OnlineRes[Date] then
			MaxNum = OnlineRes[Date].MaxOnline
			AveNum = OnlineRes[Date].AveOnline
		end
		table.insert(DateInfo, MaxNum)
		table.insert(DateInfo, AveNum)
		local Rate = "0%"
		if MaxNum ~= 0 then
			Rate = math.floor(AveNum * 10000/MaxNum)/100 .. "%"
		end
		table.insert(DateInfo, Rate)
		table.insert(TableData, DateInfo)
		table.insert(DateData, MaxNum)
		StartTime = StartTime + 86400
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("历史注册.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = "历史在线表",
			["Title"] = "日在线",
			["SeriesName"] = "日在线：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 86400, --时间间隔为1天
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/onlineHistory.html")
	end
end

DoRequest()
