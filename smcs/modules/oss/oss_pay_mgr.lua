----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 运营数据中有关充值的逻辑
--
--]]
--充值数据
function PayData(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	local TableData = {}
	local DateData = {}
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	local TimeRange = EndTime - StartTime
	if Options.PlatformID then	
		local LoginRes = RetentionData:GetStatics(Options) -- 日活跃
		--构造表格	
		local PayRes = PayDayStaticsData:GetStatics(Options)
		local TotalRestAmount = 0 --总存量
		local TotalPayAmount = 0 --总充值
		local TotalConsumeAmount = 0 --总消耗
		while StartTime < EndTime do
			local DateInfo = {}
			local Date = os.date("%Y-%m-%d",StartTime)
			table.insert(DateInfo, Date)
			table.insert(DateInfo, Options.PlatformID and Platforms[Options.PlatformID] or "all") --平台
			table.insert(DateInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all") -- 服
			local OnlineNum = LoginRes[Date] and LoginRes[Date].LoginNum or 0 --日活跃用户
			table.insert(DateInfo, CommonFunc.NumberFormat(OnlineNum))
			local PayInfo = PayRes[Date] or {}
			local PayNum = PayInfo.PayNum or 0 --充值次数
			local PayPersonNum = PayInfo.PayUserNum or 0 --充值人数
			local PayAmount = PayInfo.CashNum or 0 --日充值金额
			local FirstPayNum = PayInfo.FirstPayUserNum or 0 --首充人数
			local ARPU = PayPersonNum ~= 0 and math.floor(PayAmount * 100/PayPersonNum)/100 or 0 --ARPU
			local PayRate = OnlineNum ~= 0 and math.floor(PayPersonNum * 10000/OnlineNum)/100 .. "%" or "0%" --付费率
			table.insert(DateInfo, CommonFunc.NumberFormat(PayNum))
			table.insert(DateInfo, CommonFunc.NumberFormat(PayPersonNum))
			table.insert(DateInfo, CommonFunc.NumberFormat(FirstPayNum))
			table.insert(DateInfo, ARPU)
			table.insert(DateInfo, PayRate)
			table.insert(DateInfo, CommonFunc.NumberFormat(PayAmount))
			table.insert(DateInfo, CommonFunc.NumberFormat((PayInfo.GoldConsume or 0) + (PayInfo.CreditGoldConsume or 0))) --日消耗
			local TotalRestNum = (PayInfo.TotalGoldProduce or 0) + (PayInfo.TotalCreditGoldProduce or 0) 
				- (PayInfo.TotalGoldConsume or 0) - (PayInfo.TotalCreditGoldConsume or 0) --总存量
			table.insert(DateInfo, CommonFunc.NumberFormat(TotalRestNum))
			table.insert(DateInfo, CommonFunc.NumberFormat(PayInfo.TotalCashNum or 0))
			table.insert(DateInfo, CommonFunc.NumberFormat((PayInfo.TotalGoldConsume or 0) + (PayInfo.TotalCreditGoldConsume or 0)))
			table.insert(TableData, DateInfo)
			table.insert(DateData, PayAmount)
			StartTime = StartTime + 86400
		end
		
	end
	local Titles = {"时间", "平台", "服", "日活跃", 
			"充值次数", "充值人数", "首充人数", "ARPU", 
			"付费率", "日充值", "日消耗", "总存量","总充值", "总消耗",}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("充值数据.xls", Titles, TableData)
		ngx.say(ExcelStr)
		return
	else
		--hicharts插件内容
		local Hicharts = {
			["CssID"] = "container",
			["Text"] = "充值数据表",
			["Title"] = "日充值",
			["SeriesName"] = "日充值：",
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
	end
	Viewer:View("template/oss/payData.html", Params)
end 

--角色充值排行
function RolePayRank(self)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Export",},
	}
	local Titles = {"排名", "平台", "服", "账号", 
			"角色", "累计充值", "累计次数", "昨充", 
			"今充", "单次最少", "单次最多", "首充","首充时间",
			"最后充", "最后充值时间"}
	local TableData = {}
	if Options.PlatformID then		
		local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
		local ServerList = ServerData:GetAllServers()
		local ServerMap = {}
		for _, ServerInfo in ipairs(ServerList) do
			ServerMap[ServerInfo.hostid] = ServerInfo.name
		end
		Options.OrderCol = "TotalCashNum DESC limit 100" --按总充值金额倒序排列
		local UserPayRes = UserPayStaticsData:GetPayRank(Options)
		local NowTime = ngx.time()
		local Today = os.date("%Y-%m-%d", NowTime) --今天日期
		local Yesterday = os.date("%Y-%m-%d", NowTime - 86400) --昨天日期
		for Idx, UserPay in ipairs(UserPayRes) do
			local Info = {}
			table.insert(Info, Idx) --排名
			table.insert(Info, PlatformStr) --平台
			table.insert(Info, ServerMap[UserPay.HostID] or "") --服
			table.insert(Info, UserPay.Uid) --账号
			table.insert(Info, UserPay.Name) --角色名
			table.insert(Info, UserPay.TotalCashNum) -- 累计充值
			table.insert(Info, UserPay.TotalNum) -- 累计次数
			local YesterdayPay = 0
			local TodayPay = 0
			local DayPay = UserPayDayStaticsData:Get(UserPay.PlatformID, {Uid = UserPay.Uid, StartTime = Yesterday, EndTime = EndTime})
			for _, DayInfo in ipairs(DayPay) do
				if DayInfo.Date == Yesterday then
					YesterdayPay = DayInfo.TotalCashNum or 0
				elseif DayInfo.Date == Today then
					TodayPay = DayInfo.TotalCashNum or 0
				end
			end
			table.insert(Info, YesterdayPay) -- 昨充
			table.insert(Info, TodayPay) --今充
			table.insert(Info, UserPay.MinCashNum) -- 单次最少
			table.insert(Info, UserPay.MaxCashNum) -- 单次最多
			table.insert(Info, UserPay.FirstCashNum) -- 首冲
			table.insert(Info, UserPay.FirstCashTime) --首充时间
			table.insert(Info, UserPay.LastCashNum) --最后充
			table.insert(Info, UserPay.LastCashTime) --最后充时间
			table.insert(TableData, Info)
		end
		
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("充值数据.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
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
		}
		Viewer:View("template/oss/rolePayRank.html", Params)
	end
	
end
--角色充值统计
function RolePayStatics(self)
	local Options = GetQueryArgs()
	local NowTime = ngx.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Select", ["Label"] = "服类型", ["Name"] = "ServerType", ["Values"] = {"全服数据", "新服数据"},},
		{["Type"] = "Export",},
	}
	local TableData = {}
	local Titles = {"平台", "服", "用户档次(元宝)", "帐号数", "占比"}
	
	if Options.PlatformID then
		local ZoneMap = PayZoneStaticsData:GetZoneMap()
		local Zones = {}
		for Idx, ZoneInfo in ipairs(ZoneMap) do
			Zones[Idx] = ZoneInfo[1]
		end
		local NewServers = ServerData:GetServersByServerTime(Options) -- 开服数
		--如果选择了新服数据先获得新服HostID列表
		if tonumber(Options.ServerType) == 2 then
			local HostIDs = {}
			for _, Server in ipairs(NewServers) do
				table.insert(HostIDs, Server.hostid)
			end
			Options.HostIDs = HostIDs
		end
		local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
		local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
		local StaticsNums = {}
		local ZonePayRes, TotalNum = PayZoneStaticsData:GetStatics(Options)
		local ZonePayMap = {}
		for Idx, ZoneInfo in pairs(ZonePayRes) do
			ZonePayMap[Idx] = ZoneInfo.PayUserNum
		end
		for Idx, ZoneName in ipairs(Zones) do
			local TData = {}
			table.insert(TData, PlatformStr)
			table.insert(TData, HostStr)
			table.insert(TData, ZoneName)
			table.insert(TData, ZonePayMap[Idx] or 0)
			local Rate = TotalNum and TotalNum ~= 0 and math.floor((ZonePayMap[Idx] or 0)*10000/TotalNum)/100 .. "%" or "0%"
			table.insert(TData, Rate)
			table.insert(TableData, TData)
		end
		
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("角色充值数据.xls", Titles, TableData)
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
		Viewer:View("template/oss/rolePayRankStatics.html", Params)
	end
	
end

--充值对账
function PayVerify(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host"},
		{["Type"] = "label", ["Text"] = "角色ID:",},
		{["Type"] = "text", ["Name"] = "Uid", ["Placeholder"] = "请输入角色ID"},
		{["Type"] = "label", ["Text"] = "角色名:",},
		{["Type"] = "text", ["Name"] = "Name", ["Placeholder"] = "请输入角色名"},
		{["Type"] = "label", ["Text"] = "订单号:",},
		{["Type"] = "text", ["Name"] = "OrderID", ["Placeholder"] = "请输入订单号"},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	local TableData = {}
	local DataTable = {}
	local Titles = {}
	if Options.PlatformID then
		Titles = {"充值时间", "平台", "服名称", "订单号", "玩家角色ID", "玩家角色名","玩家平台账号",
		"充值金额", "货币类型","所获钻石","充值状态"}
		local ServerList = ServerData:GetAllServers()
		local ServerMap = {}
		for _, ServerInfo in ipairs(ServerList) do
			ServerMap[ServerInfo.hostid] = ServerInfo.name
		end
		
		--重新封装一下查询条件
		local NowOptions = {
			PlatformID = Options.PlatformID, 
			HostID = Options.HostID,
			StartTime = Options.StartTime .. " 00:00:00",
			EndTime = Options.EndTime .. " 23:59:59",
			Name = Options.Name,
			Uid = Options.Uid,
			OrderID = Options.OrderID,
		}
		local PayOrderRes = PayOrderData:Get(Options.PlatformID, NowOptions)
		local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
		for _, PayOrderInfo in ipairs(PayOrderRes) do
			local TData = {}
			table.insert(TData, PayOrderInfo.Time)
			table.insert(TData, PlatformStr)
			table.insert(TData, ServerMap[PayOrderInfo.HostID] or "")
			table.insert(TData, PayOrderInfo.OrderID)
			table.insert(TData, PayOrderInfo.Uid)
			table.insert(TData, PayOrderInfo.Name)
			table.insert(TData, PayOrderInfo.Urs)
			table.insert(TData, PayOrderInfo.CashNum)
			table.insert(TData, PayOrderInfo.Currency)
			table.insert(TData, PayOrderInfo.Gold)
			local StatusMap = {[-1] = "充值失败", [1] = "已充值",[0] = "已发送充值请求"}
			table.insert(TData, StatusMap[PayOrderInfo.Status] )
			table.insert(TableData, TData)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("充值对账.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		else
			DataTable = {
				["ID"] = "logTable",
				["NoDivPage"] = true,
			}
		end
	end
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		Filters = Filters,
		TableData = TableData,
		Titles = Titles,
		DataTable = DataTable,
	}
	Viewer:View("template/oss/payVerify.html", Params)
end

-- VIP用户统计
function VipStatics(self)
	local Options = GetQueryArgs()
	local NowTime = ngx.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	Options.Date = Options.Time
	local VipResults, TotalNum, TotalLostNum = VipData:GetStatics(Options)
	local Timestamp = GetTimeStamp(Options.Time .. " 00:00:00")
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",}
	}
	local Titles = {"时间", "平台", "服", "VIP等级", "vip人数", "当前vip人数",
		"VIP同级流失","同级流失率","总流失率","总人数"}
	local TitleTips = {}
	TitleTips[5] = "当前VIP总人数(包括激活和非激活)"
	TitleTips[6] = "当前激活的VIP人数"
	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local VipLevels = CommonData.VipLevels
	for _, VipLevel in ipairs(VipLevels) do
		local TData = {}
		table.insert(TData, Options.Time)
		table.insert(TData, PlatformStr)
		table.insert(TData, HostStr)
		table.insert(TData, VipLevel)
		if VipResults[VipLevel] then --有vip统计数据
			table.insert(TData, VipResults[VipLevel].VipNum)
			table.insert(TData, VipResults[VipLevel].NowVipNum)
			table.insert(TData, VipResults[VipLevel].LostNum)
			table.insert(TData, math.ceil(VipResults[VipLevel].LostNum * 10000/VipResults[VipLevel].VipNum)/100 .. "%")
			local LostRate = "0%"
			if TotalLostNum ~= 0 then
				LostRate = math.ceil(VipResults[VipLevel].LostNum * 10000/TotalLostNum)/100 .. "%"
			end
			table.insert(TData, LostRate)
		else --没有该级别vip统计数据
			table.insert(TData, 0)
			table.insert(TData, 0)
			table.insert(TData, 0)
			table.insert(TData, "0%")
			table.insert(TData, "0%")
		end
		table.insert(TData, TotalNum)
		table.insert(TableData, TData)
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("VIP用户统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["SortCol"] = "3",
			["SortBy"] = "asc",
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
			Timestamp= Timestamp,
			TitleTips = TitleTips,
		}
		Viewer:View("template/oss/vipStatics.html", Params)
	end
end

--过滤去重玩家账号列表
function GetUniqueUidNum(self, Uids)
	local Uids = string.split(Uids, ",")
	local UidMap = {}
	for _, Uid in ipairs(Uids) do
		if Uid ~= "" then
			UidMap[Uid] = true
		end
	end
	return table.size(UidMap)
end

--钻石统计
function GoldStatics(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	Options.SelectType = Options.SelectType or 1 --默认是产出
	local SelectType = tonumber(Options.SelectType)
	local GoldResults, TotalValue = GoldData:GetStatics(SelectType == 1 and "Add" or "Sub" ,Options)
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local SelectTypes = {"钻石产出", "钻石消耗"}
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "查询类型",["Name"] = "SelectType", ["Values"] = SelectTypes,},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	local Titles = {"平台", "服", "渠道", "相关系统", "物品名称", "物品数量",  
		"钻石数量","占比", "统计人数", "统计次数"}
	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local TotalUidNum, TotalConsumeNum = 0, 0

	for GoldType, GoldInfo in pairs(GoldResults) do
		for Channel, ChannelInfo in pairs(GoldInfo) do 
			if string.len(Channel) > 0 then
				local TInfo = {}
				table.insert(TInfo, PlatformStr)
				table.insert(TInfo, HostStr)
				local Names = string.split(Channel, "_")
				table.insert(TInfo, Names[1])
				table.insert(TInfo, Names[2] or Names[#Names])
				table.insert(TInfo, Names[3] or Names[#Names])
				table.insert(TInfo, 1)
				local Value = ChannelInfo.Value
				table.insert(TInfo, Value)
				table.insert(TInfo, math.floor(Value * 10000/TotalValue)/100 .. "%")
				local UidNum = self:GetUniqueUidNum(ChannelInfo.Uids)
				TotalUidNum = TotalUidNum + UidNum
				table.insert(TInfo, UidNum)
				TotalConsumeNum = TotalConsumeNum + ChannelInfo.ConsumeNum
				table.insert(TInfo, ChannelInfo.ConsumeNum)
				table.insert(TableData, TInfo)
			end
		end
	end
	--先加上总计
	local SInfo = {PlatformStr, HostStr, "all", "all", "all", "", TotalValue, "100%", 
		TotalUidNum, TotalConsumeNum}
	table.insert(TableData, 1, SInfo)
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("钻石统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["SortCol"] = "6",
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
			Timestamp= Timestamp,
		}
		Viewer:View("template/oss/goldStatics.html", Params)
	end
end

--充值频率
function PayFrequencyShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local NewServers = ServerData:GetServersByServerTime(Options) -- 开服数
	--如果选择了新服数据先获得新服HostID列表
	if tonumber(Options.ServerType) == 2 then
		local HostIDs = {}
		for _, Server in ipairs(NewServers) do
			table.insert(HostIDs, Server.hostid)
		end
		Options.HostIDs = HostIDs
	end
	local FreResults = PayDayFrequencyStaticsData:GetStatics(Options)
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "服类型", ["Name"] = "ServerType", ["Values"] = {"全服数据", "新服数据"},},
		{["Type"] = "Export",},
	}
	local Titles = {"时间","平台", "服", "充值人数","1次","2次","3次","4次","5次","6-10","11-20","20次以上"}
	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, PlatformStr)
		table.insert(DateInfo, HostStr)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].PayUserNum or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay1Num or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay2Num or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay3Num or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay4Num or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay5Num or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay6Num or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay11Num or 0)
		table.insert(DateInfo, FreResults[Date] and FreResults[Date].Pay20Num or 0)
		table.insert(TableData, DateInfo)
		StartTime = StartTime + 86400
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("充值频率.xls", Titles, TableData)
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
		Viewer:View("template/oss/payFrequency.html", Params)
	end
end

--金钱统计
function MoneyStatics(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",ngx.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	Options.SelectType = Options.SelectType or 1
	local SelectType = tonumber(Options.SelectType)
	local MoneyResults, TotalValue = MoneyData:GetStatics(SelectType == 1 and "Add" or "Sub" ,Options)
	local Platforms = CommonFunc.GetPlatformList()
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local SelectTypes = {"金钱产出", "金钱消耗"}
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "查询类型",["Name"] = "SelectType", ["Values"] = SelectTypes,},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	local Titles = {"平台", "服", "渠道", "相关系统", "物品名称", "物品数量", "金钱数量", 
		"占比", "统计人数", "统计次数"}

	local TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local TotalUidNum, TotalConsumeNum = 0, 0
	for Channel, ChannelInfo in pairs(MoneyResults) do 
		if string.len(Channel) > 0 then
			local TInfo = {}
			table.insert(TInfo, PlatformStr)
			table.insert(TInfo, HostStr)
			local Names = string.split(Channel, "_")
			table.insert(TInfo, Names[1] or "")
			table.insert(TInfo, Names[2] or Names[#Names] or "")
			table.insert(TInfo, Names[3] or Names[#Names] or "")
			table.insert(TInfo, 1)
			local Value = ChannelInfo.Value
			table.insert(TInfo, Value)
			table.insert(TInfo, math.floor(Value * 10000/TotalValue)/100 .. "%")
			local UidNum = self:GetUniqueUidNum(ChannelInfo.Uids)
			TotalUidNum = TotalUidNum + UidNum
			table.insert(TInfo, UidNum)
			TotalConsumeNum = TotalConsumeNum + ChannelInfo.ConsumeNum
			table.insert(TInfo, ChannelInfo.ConsumeNum)
			table.insert(TableData, TInfo)
		end
	end
	--先加上总计
	local SInfo = { PlatformStr, HostStr, "all", "all", "all", "", TotalValue, "100%", TotalUidNum, TotalConsumeNum}
	table.insert(TableData, 1, SInfo)
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("金钱统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["SortCol"] = "6",
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
		Viewer:View("template/oss/moneyStatics.html", Params)
	end
end

DoRequest()
