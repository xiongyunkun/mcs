----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- platform list manager
--
--]]

--留存率
function Retention(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local RetData = {}
	if Options.RetentionType == "2" then
		RetData = PhoneRetentionData:GetStatics(Options) --设备留存
	elseif Options.RetentionType == "3" then
		RetData = PayRetentionData:GetStatics(Options) --付费留存
	else
		RetData = RetentionData:GetStatics(Options) --用户留存
	end
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "留存类型", ["Name"] = "RetentionType", ["Values"] = {"登陆留存", "设备留存","付费留存"},},
		{["Type"] = "Export",},
	}
	--构造表格
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	local TableData = {}
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all")
		table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
		table.insert(DateInfo, RetData[Date] and RetData[Date]["NewNum"] or 0)
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
	local Titles = {"时间", "平台", "服", "当日新增", "次日留存", "3日留存率",
				"4日留存率", "5日留存率", "6日留存率", "7日留存率", "14日留存率", 
				"30日留存率"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("用户留存.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
		}
		Viewer:View("template/oss/retention.html", Params)
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

--设备留存率
function PhoneRetention(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local RetData = PhoneRetentionData:GetStatics(Options)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	--构造表格
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	local TableData = {}
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all")
		table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
		table.insert(DateInfo, RetData[Date] and RetData[Date]["NewNum"] or 0)
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "1Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "2Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "3Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "4Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "5Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "6Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "7Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "13Days"))
		table.insert(DateInfo, self:RetDataFormat(RetData[Date], "30Days"))
		table.insert(TableData, DateInfo)
		StartTime = StartTime + 86400
	end
	local Titles = {"时间", "平台", "服", "当日新增", "次日留存", "2日留存率", "3日留存率",
				"4日留存率", "5日留存率", "6日留存率", "7日留存率", "13日留存率", 
				"30日留存率"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("用户留存.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
		}
		Viewer:View("template/oss/retention.html", Params)
	end
end


--在线时长
function OnlineTime(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local OnlineData = OnlineTimeData:GetStatics(Options)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
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
	local TableData = {}
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
	local Titles = {"时间", "平台", "服", "平均在线时长", 
			"<=1分钟", "(1,5]分钟", "(5,10]分钟", "(10,30]分钟", 
			"(30,60]分钟", "(1,2]小时", "(2,4]小时", "(4,6]小时","(6,10]小时",
			"(10,15]小时","(15,20]小时",">20小时"}
	if Options.Submit == "导出" then 
		local ExcelStr = CommonFunc.ExportExcel("在线时长.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		local Hicharts = {
			["CssID"] = "container",
			["Text"] = "玩家在线时长",
			["Title"] = "在线时长(分钟)",
			["SeriesName"] = "在线时长：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 86400, --时间间隔为1天
		}
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
			Hicharts = Hicharts,
		}
		Viewer:View("template/oss/onlineTime.html", Params)
	end
end

--登陆过程分析
function LoginStatics(self)
	local Options = GetQueryArgs()
	local NowTime = ngx.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	local Timestamp = GetTimeStamp(Options.Time .. " 00:00:00")
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",},
	}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local Titles = {"序号", "过程点",}
	for X = 0, 23 do
		table.insert(Titles, X)
	end
	table.insert(Titles, "总计")
	table.insert(Titles, "占比")
	local StaticsStep = CommonData.LoginStaticsStep
	--还要加上登陆过程分析配置表中的配置项
	for ID, ActionInfo in pairs(ActionAnalysisCfg) do
		StaticsStep[ActionInfo.Desc] = ID
	end
	--再从登陆过程分析表中拿到可配置的登陆流程列表
	local TotalResults = {}
	local DateData = {}
	local TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" then	
		local LoginRes = LoginStaticsData:GetStatics(Options)
		--先把总计算出来
		for StepName, Index in pairs(StaticsStep) do
			TotalResults[Index] = 0
			for X = 0, 23 do
				local Num = 0
				if LoginRes[Options.Time] and LoginRes[Options.Time][X] and LoginRes[Options.Time][X][Index] then
					TotalResults[Index] = TotalResults[Index] + LoginRes[Options.Time][X][Index]
				end
			end
		end
		local RowIndex = 1
		for StepName, Index in pairs(StaticsStep) do
			local Info = {}
			table.insert(Info, Index > 14 and Index - 10 or Index)
			table.insert(Info, StepName)
			for X = 0, 23 do
				local Num = 0
				if LoginRes[Options.Time] and LoginRes[Options.Time][X] and LoginRes[Options.Time][X][Index] then
					Num = LoginRes[Options.Time][X][Index]
				end
				if string.find(StepName, "进入游戏") then
					table.insert(DateData, Num)
				end
				table.insert(Info, Num)
			end
			table.insert(Info, TotalResults[Index] or 0) --总计
			local Rate = "0%"
			if TotalResults[1] ~= 0 then
				Rate = math.floor((TotalResults[Index] or 0) * 10000/TotalResults[1])/100 .. "%"
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
		local Hicharts = {
			["CssID"] = "container",
			["Text"] = "登陆数据表",
			["Title"] = "日登陆",
			["SeriesName"] = "日登陆：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = 86400,
			["PointInterval"] = 3600, --时间间隔为1小时
		}
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
			["SortBy"] = "asc",
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
			Hicharts = Hicharts,
		}
		Viewer:View("template/oss/loginStatics.html", Params)
	end
end


--玩家等级统计
function LevelStatics(self)
	local Options = GetQueryArgs()
	local NowTime = ngx.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	local LevelRes = LevelStaticsData:GetStatics(Options)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",},
	}
	local Titles = {"日期", "平台", "服", "等级", "用户数", "占比", "流失率", "活跃用户数",
		"活跃用户占比", "活跃用户流失率", "付费用户数", "付费用户占比", "付费用户流失率",
		"付费活跃用户数", "付费活跃用户占比", "付费活跃用户流失率"}
	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local DateInfo = LevelRes[Options.Time] or {} --直接拿这一天的出来展示即可
	local TotalNum = 0
	local TitleTips = {
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
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
			TitleTips = TitleTips,
		}
		Viewer:View("template/oss/levelStatics.html", Params)
	end
end

-- 新增玩家等级
function NewUserLevelStatics(self)
	local Options = GetQueryArgs()
	local NowTime = ngx.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",},
	}

	local Titles = {"日期", "平台", "服", "等级", "用户数", "占比" }
	
	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"

	local StartTime = Options.Time .. " 00:00:00"
	local EndTime = Options.Time .. " 23:59:59"
	
	local LevelList = {}
	local TotalNum = 0
	if not Options.PlatformID or Options.PlatformID == "" then
		for PlatformID , _ in pairs(Platforms) do
			local Res = AddPlayerLogData:Get(PlatformID, {StartTime = StartTime, EndTime = EndTime})

			for _, Info in ipairs(Res) do
				local UserRes = UserInfoData:Get({PlatformID=PlatformID,HostID=Info.HostID, Uid=Info.Uid})
				for _, UserInfo in ipairs(UserRes) do
					if not LevelList[UserInfo.Level] then
						LevelList[UserInfo.Level] = {}
					end
                
					table.insert(LevelList[UserInfo.Level], Info.Uid)
					TotalNum = TotalNum + 1
				end
			end
		end
	else
		local Res = AddPlayerLogData:Get(Options.PlatformID, {HostID=Options.HostID, StartTime=StartTime, EndTime=EndTime})
		for _, Info in ipairs(Res) do
			local UserRes = UserInfoData:Get({PlatformID=PlatformID,HostID=Info.HostID, Uid=Info.Uid})
			for _, UserInfo in ipairs(UserRes) do
				if not LevelList[UserInfo.Level] then
					LevelList[UserInfo.Level] = {}
				end
            
				table.insert(LevelList[UserInfo.Level], Uid)
				TotalNum = TotalNum + 1
			end
		end
	end
	
	local DateData = {}
	for i = 1, CommonData.MaxLevel do
		local Info = {}
		local LevelNum = LevelList[i] and #LevelList[i] or 0
		table.insert(Info, Options.Time)
		table.insert(Info, PlatformStr)
		table.insert(Info, HostStr)
		table.insert(Info, i)
		table.insert(Info, LevelNum)
		table.insert(Info, math.floor(LevelNum*10000/TotalNum)/100 .. "%")
		table.insert(TableData, Info)
		table.insert(DateData, LevelNum)
	end
	
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("玩家等级统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		local Hicharts = {
			["CssID"] = "container",
			["Text"] = "新增玩家等级表",
			["Title"] = "人数",
			["SeriesName"] = "人数",
			["Level"] = 1,
			["DateData"] = DateData, --等级数据
			["LevelRange"] = 100,
			["PointInterval"] = 1, --等级间隔
		}
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
			Hicharts = Hicharts,
		}
		Viewer:View("template/oss/newuserLevelStatics.html", Params)
	end
end

-- 历史注册
function RegHistory(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local RegRes = HistoryRegData:GetStatics(Options)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	
	local Titles = {"时间", "平台", "服", "当日注册", "历史注册"} --, "男", "女",}
	local TitleTips = {}
	TitleTips[5] = "当前统计时间内的注册总量"
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	local TableData = {}
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
--		local Male = 0
		local Female = 0
		if RegRes[Date] then
			RegNum = RegRes[Date].RegNum
			TotalNum = TotalNum + RegNum
		--	Male = RegRes[Date].Male
		--	Female = RegNum - Male
		end
		table.insert(DateInfo, RegNum)
		table.insert(DateInfo, TotalNum)
--		table.insert(DateInfo, Male)
--		table.insert(DateInfo, Female)
		table.insert(TableData, DateInfo)
		table.insert(DateData, RegNum)
		StartTime = StartTime + 86400
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("历史注册.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		local Hicharts = {
			["CssID"] = "container",
			["Text"] = "历史注册表",
			["Title"] = "日注册",
			["SeriesName"] = "日注册：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 86400, --时间间隔为1天
		}
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
			Hicharts = Hicharts,
			TitleTips = TitleTips,
		}
		Viewer:View("template/oss/regHistory.html", Params)
	end
end

function OnlineHistroy(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local OnlineRes = HistoryOnlineData:GetStatics(Options)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	local Titles = {"时间", "平台", "服", "最高在线", "平均在线", "平高比",}
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	local TableData = {}
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
		local Hicharts = {
			["CssID"] = "container",
			["Text"] = "历史在线表",
			["Title"] = "日在线",
			["SeriesName"] = "日在线：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 86400, --时间间隔为1天
		}
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			Servers = Servers,
			Filters = Filters,
			TableData = TableData,
			Titles = Titles,
			DataTable = DataTable,
			Hicharts = Hicharts,
		}
		Viewer:View("template/oss/onlineHistory.html", Params)
	end
end

DoRequest()
