----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 运营数据中有关充值的逻辑
--
--]]
--充值数据
function PayData(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
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
	Titles = {Translate("时间"), Translate("平台"), Translate("服"), Translate("日活跃"), 
			Translate("充值次数"), Translate("充值人数"), Translate("首充人数"), Translate("ARPU"), 
			Translate("付费率"), Translate("日充值"), Translate("日消耗"), Translate("总存量"),
			Translate("总充值"), Translate("总消耗"),}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("充值数据.xls", Titles, TableData)
		ngx.say(ExcelStr)
		return
	else
		--hicharts插件内容
		Hicharts = {
			["CssID"] = "container",
			["Text"] = Translate("充值数据表"),
			["Title"] = Translate("日充值"),
			["SeriesName"] = Translate("日充值："),
			["Timestamp"] = Timestamp,
			["DateData"] = DateData, --时间数据
			["TimeRange"] = TimeRange,
			["PointInterval"] = 86400, --时间间隔为1天
		}
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
	end
	Viewer:View("template/oss/payData.html")
end 

--角色充值排行
function RolePayRank(self)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Export",},
	}
	Titles = {Translate("排名"), Translate("平台"), Translate("服"), Translate("账号"), 
			Translate("角色"), Translate("累计充值"), Translate("累计次数"), Translate("昨充"), 
			Translate("今充"), Translate("单次最少"), Translate("单次最多"), Translate("首充"),Translate("首充时间"),
			Translate("最后充"), Translate("最后充值时间")}
	TableData = {}
	if Options.PlatformID then		
		local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
		local ServerList = ServerData:GetAllServers()
		local ServerMap = {}
		for _, ServerInfo in ipairs(ServerList) do
			ServerMap[ServerInfo.hostid] = ServerInfo.name
		end
		Options.OrderCol = "TotalCashNum DESC limit 100" --按总充值金额倒序排列
		local UserPayRes = UserPayStaticsData:GetPayRank(Options)
		local NowTime = os.time()
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
					YesterdayPay = CommonFunc.TransformCurrency(DayInfo.Currency, DayInfo.TotalCashNum) or 0
				elseif DayInfo.Date == Today then
					TodayPay = CommonFunc.TransformCurrency(DayInfo.Currency, DayInfo.TotalCashNum) or 0
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
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
			["SortBy"] = "asc",
		}
		Viewer:View("template/oss/rolePayRank.html")
	end
	
end
--角色充值统计
function RolePayStatics(self)
	Options = GetQueryArgs()
	local NowTime = os.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Select", ["Label"] = "服类型", ["Name"] = "ServerType", ["Values"] = {Translate("全服数据"), Translate("新服数据")},},
		{["Type"] = "Export",},
	}
	TableData = {}
	Titles = {Translate("平台"), Translate("服"), Translate("用户档次(元宝)"), Translate("帐号数"), Translate("占比")}
	
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
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/rolePayRankStatics.html")
	end
	
end

--充值对账
function PayVerify(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
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
	if Options.PlatformID then
		Titles = {Translate("充值时间"), Translate("平台"), Translate("服名称"), Translate("订单号"), Translate("玩家角色ID"),
		 Translate("玩家角色名"),Translate("玩家平台账号"),
		Translate("充值金额"), Translate("货币类型"),Translate("所获钻石"),Translate("充值状态")}
		local ServerList = ServerData:GetAllServers()
		local ServerMap = {}
		for _, ServerInfo in ipairs(ServerList) do
			ServerMap[ServerInfo.hostid] = ServerInfo.name
		end
		TableData = {}
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
			local StatusMap = {[-1] = Translate("充值失败"), [1] = Translate("已充值"),[0] = Translate("已发送充值请求")}
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
	Viewer:View("template/oss/payVerify.html")
end

-- VIP用户统计
function VipStatics(self)
	Options = GetQueryArgs()
	local NowTime = os.time()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	Options.Date = Options.Time
	local VipResults, TotalNum, TotalLostNum = VipData:GetStatics(Options)
	Timestamp = GetTimeStamp(Options.Time .. " 00:00:00")
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Export",}
	}
	Titles = {Translate("时间"), Translate("平台"), Translate("服"), Translate("VIP等级"), Translate("vip人数"), Translate("当前vip人数"),
		Translate("VIP同级流失"),Translate("同级流失率"),Translate("总流失率"),Translate("总人数")}
	TitleTips = {}
	TitleTips[5] = Translate("当前VIP总人数(包括激活和非激活)")
	TitleTips[6] = Translate("当前激活的VIP人数")
	TableData = {}
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
		DataTable = {
			["ID"] = "logTable",
			["SortCol"] = "3",
			["SortBy"] = "asc",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/vipStatics.html")
	end
end

--元宝消耗
function GoldConsume(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	local GoldResults, TotalValue = GoldData:GetStatics("Sub" ,Options)
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	local GoldTypes = CommonData.GoldTypeNames
	local TGoldTypes = {[""] = "全部",}
	for ID, GoldName in pairs(GoldTypes) do
		TGoldTypes[tostring(ID)] = GoldName
	end
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "钻石类型",["Name"] = "GoldType", ["Values"] = TGoldTypes,},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	Titles = {Translate("货币类型"), Translate("渠道"), Translate("相关系统"), Translate("物品名称"), 
		Translate("物品数量"), Translate("元宝消耗值"), Translate("占比"), Translate("消费人数"), 
			Translate("消费次数")}

	local Channels = {Translate("VIP购买"),Translate("众神之门"),Translate("魔法炼金"), Translate("快速扫荡"),Translate("宠物购买"),}
	TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local TotalUidNum, TotalConsumeNum = 0, 0
	for GoldType, GoldInfo in pairs(GoldResults) do
		for Channel, ChannelInfo in pairs(GoldInfo) do 
			if string.len(Channel) > 0 then
				local TInfo = {}
				table.insert(TInfo, GoldTypes[GoldType])
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
	local TGoldType = "all"
	if Options.GoldType and Options.GoldType ~= "" then
		TGoldType = GoldTypes[tonumber(Options.GoldType)] or "all"
	end
	local SInfo = { TGoldType, "all", "all", "all", "", TotalValue, "100%", TotalUidNum, TotalConsumeNum}
	table.insert(TableData, 1, SInfo)
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("元宝消耗.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["bSort"] = true,
			["SortCol"] = "4",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/goldConsume.html")
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

--钻石产出
function GoldGenerate(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	local GoldResults, TotalValue = GoldData:GetStatics("Add" ,Options)
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	local GoldTypes = CommonData.GoldTypeNames
	local TGoldTypes = {[""] = Translate("全部"),}
	for ID, GoldName in pairs(GoldTypes) do
		TGoldTypes[tostring(ID)] = GoldName
	end
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "钻石类型",["Name"] = "GoldType", ["Values"] = TGoldTypes,},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	Titles = {Translate("平台"), Translate("服"), Translate("货币"), Translate("渠道"), Translate("相关系统"), 
			Translate("物品名称"), Translate("物品数量"),  Translate("元宝产出量"),Translate("占比")}
	TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	--先加上总计
	local SInfo = {PlatformStr, HostStr, "钻石", "all", "all", "all", "all", TotalValue, "100%"}
	table.insert(TableData, SInfo)
	for GoldType, GoldInfo in pairs(GoldResults) do
		for Channel, ChannelInfo in pairs(GoldInfo) do 
			local TInfo = {}
			table.insert(TInfo, PlatformStr)
			table.insert(TInfo, HostStr)
			table.insert(TInfo, GoldTypes[GoldType])
			local Names = string.split(Channel, "_")
			table.insert(TInfo, Names[1])
			table.insert(TInfo, Names[2] or Names[#Names])
			table.insert(TInfo, Names[3] or Names[#Names])
			table.insert(TInfo, 1)
			local Value = ChannelInfo.Value
			table.insert(TInfo, Value)
			table.insert(TInfo, math.floor(Value * 10000/TotalValue)/100 .. "%")
			table.insert(TableData, TInfo)
		end
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("元宝产出.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["bSort"] = true,
			["SortCol"] = "4",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/goldGenerate.html")
	end
end

--充值频率
function PayFrequencyShow(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
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
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "服类型", ["Name"] = "ServerType", ["Values"] = {Translate("全服数据"), Translate("新服数据")},},
		{["Type"] = "Export",},
	}
	Titles = {Translate("时间"),Translate("平台"), Translate("服"), Translate("充值人数"),Translate("1次"),
			Translate("2次"),Translate("3次"),Translate("4次"),Translate("5次"),Translate("6-10"),
			Translate("11-20"),Translate("20次以上")}
	TableData = {}
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
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/payFrequency.html")
	end
end

--钻石积累
function GoldAccumulate(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-01",os.time())
	local Timestamp = GetTimeStamp(Options.StartTime .. " 00:00:00")
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
	Titles = {Translate("时间"), Translate("平台"), Translate("服"), Translate("充值钻石数"), 
			Translate("消费非绑定钻石数"), Translate("消费绑定钻石数"), Translate("非绑定钻石囤积"), 
				Translate("绑定钻石囤积")}
	TableData = {}
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local PayDayRes = PayDayStaticsData:GetStatics(Options)
	local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
	local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59") 
	while StartTime < EndTime do
		local DateInfo = {}
		local Date = os.date("%Y-%m-%d",StartTime)
		table.insert(DateInfo, Date)
		table.insert(DateInfo, PlatformStr)
		table.insert(DateInfo, HostStr)
		local PayGold = 0 --充值钻石数
		local GoldConsume = 0 -- 消费非绑定钻石数
		local CreditGoldConsume = 0 --消费绑定钻石数
		local GoldRest = 0 -- 非绑定钻石囤积
		local CreditGoldRest = 0 -- 绑定钻石囤积
		if PayDayRes[Date] then
			PayGold = PayDayRes[Date].PayGold
			GoldConsume = PayDayRes[Date].GoldConsume
			CreditGoldConsume = PayDayRes[Date].CreditGoldConsume
			GoldRest = PayDayRes[Date].TotalGoldProduce + PayDayRes[Date].TotalGoldConsume
			CreditGoldRest = PayDayRes[Date].TotalCreditGoldProduce + PayDayRes[Date].TotalCreditGoldConsume
		end
		table.insert(DateInfo, PayGold)
		table.insert(DateInfo, GoldConsume)
		table.insert(DateInfo, CreditGoldConsume)
		table.insert(DateInfo, GoldRest)
		table.insert(DateInfo, CreditGoldRest)
		table.insert(TableData, DateInfo)
		StartTime = StartTime + 86400
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("钻石积累.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		Viewer:View("template/oss/goldGenerate.html")
	end
end

DoRequest()
