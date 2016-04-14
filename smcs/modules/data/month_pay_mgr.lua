----------------------------------------
--$Id: month_pay_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 月收入统计
--
--]]

function MonthPayStatics(self)
	--获得平台列表
	Options = GetQueryArgs()
	Options.Time = Options.Time or os.date("%Y-%m",os.time())
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time", ["Format"] = "yyyy-MM"},
		{["Type"] = "Export",},
	}
	TableData = {}
	local Results = self:OrganizeData(Options)
	for PlatformID, PayInfo in pairs(Results) do
		local MonthInfo = {}
		table.insert(MonthInfo, Options.Time)
		table.insert(MonthInfo, Options.PlatformID and Platforms[Options.PlatformID] or Platforms[PlatformID]) --平台
		table.insert(MonthInfo, Options.HostID and Servers[tonumber(Options.HostID)] or "all") -- 服
		local CashNum = 0
		if PayInfo[Options.Time] and PayInfo[Options.Time].CashNum then
			CashNum = PayInfo[Options.Time].CashNum
		end
		table.insert(MonthInfo, CashNum) --充值金额
		table.insert(TableData, MonthInfo)
	end
	Options.StartTime = nil
	Options.EndTime = nil
	
	Titles = {"时间", "平台", "服", "充值金额",}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("月收入统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
		return
	else
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
	end
	Viewer:View("template/data/month_pay_statics.html")
end

function OrganizeData(self, Options)
	--加入开始时间和结束时间
	Options.StartTime = Options.Time .. "-01"
	Options.EndTime = Options.Time .. "-31"
	local Results = {}
	if not Options.PlatformID or Options.PlatformID == "" then
		local PlatformMap = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(PlatformMap) do
			Options.PlatformID = PlatformID
			local PayDayList = PayDayStaticsData:GetStatics(Options)
			--按照月份进行汇总
			Results[PlatformID] = self:MergeDataByMonth(Options.Time, PayDayList)
		end
		Options.PlatformID = nil
	else
		--有选择平台
		local PayDayList = PayDayStaticsData:GetStatics(Options)
		Results[Options.PlatformID] = self:MergeDataByMonth(Options.Time, PayDayList)
	end
	return Results
end

--统计这个月的充值金额
function MergeDataByMonth(self, Month, DataList)
	local MonthResults = {}
	for Day, Info in pairs(DataList) do
		MonthResults[Month] = MonthResults[Month] or {}
		MonthResults[Month].CashNum = (MonthResults[Month].CashNum or 0) + Info.CashNum --充值金额
	end
	return MonthResults
end

DoRequest()
