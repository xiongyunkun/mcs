----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 各服数据
--
--]]

function GetServerData(self)
	--获得平台列表
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	Platforms = CommonFunc.GetPlatformList()
	Options.HostID = nil --这里没有HostID
	--filter页面模板显示的参数
	TabList = {"创建角色数", "登陆人数", "平均在线", "在线峰值", "付费人数", "付费金额"}
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "导出表名", ["Name"] = "TableIndex", ["Values"] = TabList},
		{["Type"] = "Export",},
	}
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
		
		local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
		local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59")
		DayList = {}
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
	Viewer:View("template/data/server_data.html")
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
		Results[Info.HostID][Info.Date] = (Results[Info.HostID][Info.Date] or 0) + Info[IndexName]
	end
	return Results
end

--获得统计专区的服的HostID与服名的对应关系
function GetServerMarkMap(self, PlatformID)
	--获得统计服列表
	local StaticsServers = ServerData:GetStaticsServers()
	local Servers = ServerData:GetServer({PlatformID = PlatformID})
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

--开服数据汇总
function DataReport(self)
	--获得平台列表
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" then
		local HostID = Options.HostID and Options.HostID ~= "" and Options.HostID or nil
		local Servers = ServerData:GetServer({
			platformid = Options.PlatformID, 
			min_start_server_time = Options.StartTime .. " 00:00:00",
			max_start_server_time = Options.EndTime .. " 23:59:59",
			hostid = HostID,
		})

		for _, ServerInfo in ipairs(Servers) do
			local StartServerTime = ServerInfo.startservertime
			local TimeInfo = string.split(StartServerTime, " ")
			--登陆接口数
			local LoginData = self:GetLoginStaticsData(Options.PlatformID, ServerInfo.hostid, TimeInfo[1])
			--充值数据
			local PayData = self:GetPayData(Options.PlatformID, ServerInfo.hostid, TimeInfo[1])
			--留存率
			local RetentionData = self:GetRetentionData(Options.PlatformID, ServerInfo.hostid, TimeInfo[1])
			local ARPU = PayData.PayUserNum ~= 0 and math.floor(PayData.TotalCashNum * 100/PayData.PayUserNum)/100 or 0 --ARPU
			local PayRate = LoginData.EnterGame and LoginData.EnterGame ~= 0 and math.floor(PayData.PayUserNum * 10000/LoginData.EnterGame)/100 .. "%" or "0%"
			local RegShowRate = LoginData.LoginInterface ~= 0 and math.floor(LoginData.RegShow * 10000/LoginData.LoginInterface)/100 .. "%" or "0%"
			local RegSucRate = LoginData.LoginInterface ~= 0 and math.floor(LoginData.RegSuc * 10000/LoginData.LoginInterface)/100 .. "%" or "0%"
			local EnterLostRate = LoginData.LoginInterface ~= 0 and math.floor(LoginData.EnterGame * 10000/LoginData.LoginInterface)/100 .. "%" or "0%"
			local Server = {
				TimeInfo[1], 
				Options.PlatformID and Platforms[Options.PlatformID] or "all",
				ServerInfo.name,
				LoginData.LoginInterface,
				LoginData.RegSuc,
				LoginData.EnterGame,
				RetentionData.MaxOnline,
				PayData.TotalCashNum,
				PayData.PayUserNum,
				ARPU,
				PayRate,
				RegShowRate,
				RegSucRate,
				EnterLostRate,
				RetentionData["1DaysRet"] ~= 0 and RetentionData["1DaysRet"] .. "%" or "/",
				RetentionData["7DaysRet"] ~= 0 and RetentionData["7DaysRet"] .. "%" or "/",
			}
			table.insert(TableData, Server)
		end
	end
	Titles = {"开服时间", "平台", "服", "登陆接口数", "创角数", "进入游戏数",
				"在线峰值", "充值金额", "充值人数", "ARPU", "活跃付费率", 
				"到达创角率", "创角成功率","进入游戏率", "次日留存", "7日留存"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("开服数据.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/data/new_server.html")
	end
end

--获得登陆过程数据(登陆接口数，创角数)
function GetLoginStaticsData(self, PlatformID, HostID, Date)
	local Res = LoginStaticsData:Get({PlatformID = PlatformID, HostID = HostID, Date = Date, NoMerge = true})
	local Results = {LoginInterface = 0, RegShow = 0, RegSuc = 0, EnterGame = 0}
	for _, Info in ipairs(Res) do
		if Info.Step == 1 then --登陆接口数
			Results.LoginInterface = Results.LoginInterface + Info.Num
		elseif Info.Step == 3 then
			Results.RegShow = Results.RegShow + Info.Num
		elseif Info.Step == 4 then --创角数
			Results.RegSuc = Results.RegSuc + Info.Num
		elseif Info.Step == 5 then --进入游戏数
			Results.EnterGame = Results.EnterGame + Info.Num
		end 
	end
	return Results
end

--充值数据
function GetPayData(self, PlatformID, HostID, Date)
	local Res = PayDayStaticsData:Get(PlatformID, {HostID = HostID, Date = Date, NoMerge = true})
	local Results = {TotalCashNum = 0, PayUserNum = 0, FirstPayUserNum = 0}
	if Res and Res[1] then
		Results.TotalCashNum = Res[1].TotalCashNum
		Results.PayUserNum = Res[1].PayUserNum
		Results.FirstPayUserNum = Res[1].FirstPayUserNum
	end
	return Results
end
--获得留存率等信息
function GetRetentionData(self, PlatformID, HostID, Date)
	local Res = RetentionData:Get({PlatformID = PlatformID, HostID = HostID, Date = Date, NoMerge = true})
	local OnlineRes = HistoryOnlineData:Get({PlatformID = PlatformID, HostID = HostID, Date = Date})
	local Results = {["MaxOnline"] = 0, ["1DaysRet"] = "/", ["7DaysRet"] = "/"}
	if Res and Res[1] then
		Results["1DaysRet"] = Res[1]["1Days"]
		Results["7DaysRet"] = Res[1]["6Days"] 
		Results.LoginNum = Res[1].LoginNum
	end
	if OnlineRes and OnlineRes[1] then
		Results.MaxOnline = OnlineRes[1].MaxOnline
	end
	return Results
end

DoRequest()
