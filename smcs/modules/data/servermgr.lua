----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 各服数据
--
--]]

function GetServerData(self)
	--获得平台列表
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	Options.HostID = nil --这里没有HostID
	--filter页面模板显示的参数
	local TabList = {"创建角色数", "登陆人数", "平均在线", "在线峰值", "付费人数", "付费金额",
			"付费次数", "首充人数"}
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "导出表名", ["Name"] = "TableIndex", ["Values"] = TabList},
		{["Type"] = "Export",},
	}
	local RegData = nil
	local LoginData = nil
	local AveOnlineData = nil
	local MaxOnlineData = nil
	local PayNumData = nil
	local PayTotalMoneyData = nil
	local PayCountData = nil
	local FirstPayNumData = nil
	local DayList = {}
	local ServerMarkMap = nil
	if Options.PlatformID and Options.PlatformID ~= "" then
		local RegRes = HistoryRegData:Get(Options) --获得历史注册数据
		local LoginRes = RetentionData:Get(Options) -- 日活跃
		local OnlineRes = HistoryOnlineData:Get(Options) --PCU最高在线
		local ServerPayRes = PayDayStaticsData:Get(Options.PlatformID, Options) --服充值日统计数据
		RegData = self:OrganizeData(RegRes, "RegNum") --创建角色数
		LoginData = self:OrganizeData(LoginRes, "LoginNum") --登陆人数
		AveOnlineData = self:OrganizeData(OnlineRes, "AveOnline") --平均在线
		MaxOnlineData = self:OrganizeData(OnlineRes, "MaxOnline") --在线峰值
		PayNumData = self:OrganizeData(ServerPayRes, "PayUserNum") --付费人数
		PayTotalMoneyData = self:OrganizeData(ServerPayRes, "CashNum") --付费金额
		PayCountData = self:OrganizeData(ServerPayRes, "PayNum") --付费次数
		FirstPayNumData = self:OrganizeData(ServerPayRes, "FirstPayUserNum") --首充人数
		
		local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
		local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59")
		
		while StartTime < EndTime do
			local Date = os.date("%Y-%m-%d",StartTime)
			table.insert(DayList, Date)
			StartTime = StartTime + 86400
		end
		ServerMarkMap = self:GetServerMarkMap(Options.PlatformID)
		if Options.Submit == "导出" then
			local List = {RegData, LoginData, AveOnlineData, MaxOnlineData, PayNumData, PayTotalMoneyData}
			local Index = tonumber(Options.TableIndex)  
			local Datas = List[Index] or {}
			local TableData = self:GetExcelDataTable(DayList, ServerMarkMap, Datas)
			table.insert(DayList, 1, "服")
			local ExcelName = Platforms[Options.PlatformID] .. "_" .. TabList[Index] .. ".xls"
			local ExcelStr = CommonFunc.ExportExcel(ExcelName, DayList, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	local Params = {
		Options = Options,
		Platforms = Platforms,
		TabList = TabList,
		Filters = Filters,
		RegData = RegData,
		LoginData = LoginData,
		AveOnlineData = AveOnlineData,
		MaxOnlineData = MaxOnlineData,
		PayNumData = PayNumData,
		PayTotalMoneyData = PayTotalMoneyData,
		PayCountData = PayCountData,
		FirstPayNumData = FirstPayNumData,
		DayList = DayList,
		ServerMarkMap = ServerMarkMap,
	}
	Viewer:View("template/data/server_data.html", Params)
end

--根据表格和对应的指标值整理数据
function OrganizeData(self, Res, IndexName)
	local Results = {}
	if not Res then 
		return Results
	end
	for _, Info in ipairs(Res) do
		if not Results[Info.HostID] then
			Results[Info.HostID] = {}
		end
		Results[Info.HostID][Info.Date] = Info[IndexName]
	end
	return Results
end

--获得统计专区的服的HostID与服名的对应关系
function GetServerMarkMap(self, PlatformID)
	--获得统计服列表
	local StaticsServers = ServerData:GetStaticsServers()
	local Servers = MixServerData:GetServers(PlatformID)
	local AllServerMarkMap = {}
	for _, Server in ipairs(Servers) do
		AllServerMarkMap[Server.hostid] = Server.name
	end
	local ServerMarkMap = {}
	for HostID, ServerMark in pairs(AllServerMarkMap) do
		if StaticsServers[HostID] then
			ServerMarkMap[HostID] = ServerMark
		end
	end
	return ServerMarkMap
end

--整理获得excel导出的数据表格
function GetExcelDataTable(self, DayList, ServerMarkMap, Datas)
	local Results = {}
	for HostID,ServerMark in pairs(ServerMarkMap) do
		local Result = {}
		table.insert(Result, ServerMark)
		for _,Day in pairs(DayList) do
			local Value = Datas[HostID] and Datas[HostID][Day] or "-"
			table.insert(Result, Value)
		end
		table.insert(Results, Result)
	end
	return Results
end

DoRequest()
