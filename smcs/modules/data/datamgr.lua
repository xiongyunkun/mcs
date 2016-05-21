----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- platform list manager
--
--]]


function Index(self)
	--获得平台列表
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	Platforms = CommonFunc.GetPlatformList()
	Options.HostID = nil --这里没有HostID
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "服类型", ["Name"] = "ServerType", ["Values"] = {"全服数据", "新服数据"},},
		{["Type"] = "Export",},
	}
	local Servers = ServerData:GetServersByServerTime(Options) -- 开服数
	local ServerNums = self:GetServerNums(Servers)
	--如果选择了新服数据先获得新服HostID列表
	if tonumber(Options.ServerType) == 2 then
		local HostIDs = {}
		for _, Server in ipairs(Servers) do
			table.insert(HostIDs, Server.hostid)
		end
		Options.HostIDs = HostIDs
	end
	local RegRes = HistoryRegData:GetStatics(Options) --获得历史注册数据
	local LoginRes = RetentionData:GetStatics(Options) -- 日活跃
	local OnlineRes = HistoryOnlineData:GetStatics(Options) --PCU最高在线
	local ServerPayRes = PayDayStaticsData:GetStatics(Options) --服充值日统计数据
	TableData = {}
	TotalDateList = {}
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59")
	local TotalRegNum = 0
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, ServerNums[Date] or 0) 
		local RegNum = RegRes[Date] and RegRes[Date].RegNum or 0
		table.insert(DateInfo, RegNum)
		local LoginNum = LoginRes[Date] and LoginRes[Date].LoginNum or 0
		table.insert(DateInfo, LoginNum)
		table.insert(DateInfo, OnlineRes[Date] and OnlineRes[Date].MaxOnline or 0)
		local PayUserNum = ServerPayRes[Date] and ServerPayRes[Date].PayUserNum or 0
		table.insert(DateInfo, PayUserNum)
		table.insert(DateInfo, ServerPayRes[Date] and ServerPayRes[Date].CashNum or 0) 
		local ARPU = ServerPayRes[Date] and ServerPayRes[Date].PayNum ~= 0 and PayUserNum ~= 0 and math.floor(ServerPayRes[Date].CashNum * 100/PayUserNum)/100 or 0 --ARPU
		table.insert(DateInfo, ARPU)
		table.insert(DateInfo, LoginNum ~= 0 and math.floor(PayUserNum * 10000/LoginNum)/100 .. "%" or "0%")
		table.insert(TableData, DateInfo)
		StartTime = StartTime + 86400
	end
	local NewTableData = {}
	local Len = #TableData
	for X = 1, Len do
		table.insert(NewTableData, TableData[Len-X+1])
	end
	TableData = NewTableData
	if Options.Submit == "导出" then
		local Titles = {"日期", "开服数", "日注册", "日活跃", "在线峰值", "充值人数", "充值金额", "ARPU值", "活跃付费率"}
		local ExcelStr = CommonFunc.ExportExcel("数据总览.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--各平台收入总数
		PlatformPayList = {}
		TotalPayAmount = 0
		--各平台的注册人数
		RegResults = self:GetTotalRegNumByPlatform(Options)
		PayResults = self:GetTotalCashNumByPlatform(Options)
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
			
		}
		Viewer:View("template/data/index.html")
	end
end

--获得当天在线峰值人数，目前是从5分钟在线数据中直接获取，后期考虑下怎么优化
function GetMaxOnline(self, Options, Date)
	local NewOptions = {
		PlatformID = Options.PlatformID,
		HostID = Options.HostID,
		Time = Date,
	}
	local OnlineRes = OnlineData:GetStatics(NewOptions)
	local MaxOnline = 0
	for Time, Num in pairs(OnlineRes) do
		if Num > MaxOnline then
			MaxOnline = Num
		end
	end
	return MaxOnline
end

function OnlineStatics(self)
	Options = GetQueryArgs()
	local NowTime = os.time()
	--如果单独选择了平台还要计算该平台的时差
	if Options.PlatformID and Options.PlatformID ~= "" then
		local PlatformInfo = PlatformData:GetPlatform(Options.PlatformID)
		if PlatformInfo and PlatformInfo[1] then
			local TimeZone = PlatformInfo[1].TimeZone or 0
			NowTime = NowTime + TimeZone * 3600
		end
	end
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	Timestamp = GetTimeStamp(Options.Time .. " 00:00:00")
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",}
	}
	
	local DateData = {}
	TableData = {}
	--数据库中获取数据
	local OnlineRes = OnlineData:GetStatics(Options)
	local StartTime = Timestamp
	local EndTime = StartTime + 86400 
	EndTime = EndTime < NowTime and EndTime or NowTime
	local TimeRange = EndTime - StartTime
	while StartTime < EndTime do
		local DateInfo = {}
		local Time = os.date("%Y-%m-%d %H:%M:%S", StartTime)
		local Data = OnlineRes[Time] or 0
		table.insert(DateInfo, Time)
		table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all")
		table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
		table.insert(DateInfo, Data)
		table.insert(TableData, DateInfo)
		table.insert(DateData, Data)
		StartTime = StartTime + 300
	end
	Titles = {"时间", "平台", "服", "在线人数"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("实时在线.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = "实时在线人数",
			["Title"] = "在线人数",
			["SeriesName"] = "实时在线人数：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 300,
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/data/online_statics.html")
	end
end

--实时注册
function RegStatics(self)
	Options = GetQueryArgs()
	local NowTime = os.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	Timestamp = GetTimeStamp(Options.Time .. " 00:00:00")
	Platforms = CommonFunc.GetPlatformList()
	
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",}
	}
	local DateData = {}
	TableData = {}
	--数据库中获取数据
	local PlayerRes = AddPlayerData:GetStatics(Options)
	local StartTime = Timestamp
	local EndTime = StartTime + 86400 
	EndTime = EndTime < NowTime and EndTime or NowTime
	local TimeRange = EndTime - StartTime
	local TotalRegNum = 0 --总注册人数
	while StartTime < EndTime do
		local DateInfo = {}
		local Time = os.date("%Y-%m-%d %H:%M:%S", StartTime)
		local Data = PlayerRes[Time] or 0
		table.insert(DateInfo, Time)
		table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all")
		table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
		table.insert(DateInfo, Data)
		TotalRegNum = TotalRegNum + Data
		table.insert(TableData, DateInfo)
		table.insert(DateData, Data)
		StartTime = StartTime + 300
	end
	local TotalInfo = {
		"总计",
		Options.PlatformID and Platforms[Options.PlatformID] or "all",
		Options.HostID and Servers[tonumber(Options.HostID)] or "all",
		TotalRegNum,
	}
	table.insert(TableData, 1, TotalInfo)
	Titles = {"时间", "平台", "服", "注册人数"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("实时注册.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = "实时注册人数",
			["Title"] = "注册人数",
			["SeriesName"] = "实时注册人数：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 300,
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/data/reg_statics.html")
	end
end

--实时充值
function PayStatics(self)
	Options = GetQueryArgs()
	local NowTime = os.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	Timestamp = GetTimeStamp(Options.Time .. " 00:00:00")
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",}
	}
	
	--充值数据
	local PayRes = PayActualTimeData:GetStatics(Options)
	local DateData = {}
	TableData = {}
	local StartTime = Timestamp
	local EndTime = StartTime + 86400
	EndTime = EndTime < NowTime and EndTime or NowTime
	local TimeRange = EndTime - StartTime
	local TotalPayNum = 0 --充值总额
	while StartTime < EndTime do
		local DateInfo = {}
		local Time = os.date("%Y-%m-%d %H:%M:%S", StartTime)
		local DataInfo = PayRes[Time] or {}
		table.insert(DateInfo, Time)
		table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all")
		table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
		table.insert(DateInfo, DataInfo.PayNum or 0)
		table.insert(TableData, DateInfo)
		table.insert(DateData, DataInfo.PayNum or 0)
		StartTime = StartTime + 300
		TotalPayNum = TotalPayNum + (DataInfo.PayNum or 0)
	end
	local TotalInfo = {
		"总计",
		Options.PlatformID and Platforms[Options.PlatformID] or "all",
		Options.HostID and Servers[tonumber(Options.HostID)] or "all",
		TotalPayNum,
	}
	table.insert(TableData, 1, TotalInfo)
	Titles = {"时间", "平台", "服", "充值金额"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("实时充值.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = "实时充值金额",
			["Title"] = "充值金额",
			["SeriesName"] = "实时充值金额：",
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 300,
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}

		Viewer:View("template/data/pay_statics.html")
	end
end

--获得平台的注册总人数，如果有选择平台则只统计该平台的，否则统计各个平台的
function GetTotalRegNumByPlatform(self,Options)
	local Results = {}
	local NewOptions = {PlatformID = Options.PlatformID, Date = Options.EndTime}
	if not Options.PlatformID or Options.PlatformID == "" then
		local Platforms = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(Platforms) do
			NewOptions.PlatformID = PlatformID
			local Num = 0
			local RegRes = HistoryRegData:GetStatics(NewOptions)
			for _, Info in pairs(RegRes) do
				Num = Num + Info.TotalRegNum
			end
			Results[PlatformID] = Num
			NewOptions.PlatformID = nil
		end
	else
		--选择了平台，只统计该平台的
		local Num = 0
		local RegRes = HistoryRegData:GetStatics(NewOptions)
		for _, Info in pairs(RegRes) do
			Num = Num + Info.TotalRegNum
		end
		Results[NewOptions.PlatformID] = Num
	end
	return Results
end

--获得开服数列表
function GetServerNums(self, Servers)
	local Results = {}
	if Servers then
		for _, ServerInfo in ipairs(Servers) do
			local StartServerTime = ServerInfo.startservertime
			local DateInfo = string.split(StartServerTime, " ")
			if DateInfo and DateInfo[1] then
				if Results[DateInfo[1]] then
					Results[DateInfo[1]] = Results[DateInfo[1]] + 1
				else
					Results[DateInfo[1]] = 1
				end
			end
		end
	end
	return Results
end

function GetTotalCashNumByPlatform(self, Options)
	local Results = {}
	local NewOptions = {PlatformID = Options.PlatformID, Date = Options.EndTime}
	if not NewOptions.PlatformID or NewOptions.PlatformID == "" then
		local Platforms = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(Platforms) do
			NewOptions.PlatformID = PlatformID
			local Num = 0
			local PayRes = PayDayStaticsData:GetStatics(NewOptions)
			for _, Info in pairs(PayRes) do
				Num = Num + Info.TotalCashNum
			end
			Results[PlatformID] = Num
			NewOptions.PlatformID = nil
		end
	else
		--选择了平台，只统计该平台的
		local Num = 0
		local RegRes = PayDayStaticsData:GetStatics(NewOptions)
		for _, Info in pairs(RegRes) do
			Num = Num + Info.TotalCashNum
		end
		Results[NewOptions.PlatformID] = Num
	end
	return Results
end
DoRequest()
