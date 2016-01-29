----------------------------------------
--$Id: start_num_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- vip用户信息展示
--
--]]

local IndexList = {"DPI", "Model", "Brand"}
local MAX_TOP = 10

function StartNumShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	local TabList = {"分辨率",  "手机型号", "手机品牌"}
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "导出表名", ["Name"] = "TableIndex", ["Values"] = TabList},
		{["Type"] = "Export",},
	}
	local DataTables = {}
	local Titles = {}
	local DateList = self:GetDates(Options.StartTime, Options.EndTime)
	local Res = StartNumData:GetStatics(Options)
	for _, Index in ipairs(IndexList) do
		Titles[Index] = {"日期"}
		DataTables[Index] = {}
		local TopNList = self:GetTopNIndexList(MAX_TOP, Index, Res) --只取前10个
		local CIndexTotals = {"总计"}
		local TotalNum = 0
		for _, TopInfo in ipairs(TopNList) do
			table.insert(Titles[Index], TopInfo.CIndex) --填充标题
			table.insert(CIndexTotals, TopInfo.Num)
			TotalNum = TotalNum + TopInfo.Num
		end
		table.insert(Titles[Index], "总计") --当天的所有总计
		table.insert(CIndexTotals, TotalNum)
		table.insert(DataTables[Index], CIndexTotals) --加入每个子指标的总数
		--再计算每天的数据以及总数
		for _, Date in ipairs(DateList) do
			local Data = {}
			table.insert(Data, Date)
			local DateTotalNum = 0
			for _, TopInfo in ipairs(TopNList) do
				local Num = Res[Index][Date] and Res[Index][Date][TopInfo.CIndex] or 0
				table.insert(Data, Num)
				DateTotalNum = DateTotalNum + Num
			end
			table.insert(Data, DateTotalNum) --该天总计
			table.insert(DataTables[Index], Data)
		end
	end
	if Options.Submit == "导出" then
		local TabIndexList = {"Model", "Brand", "DPI"}
		local TableIndex = TabIndexList[tonumber(Options.TableIndex)]
		local ExcelName = TabList[tonumber(Options.TableIndex)] .. "_启动次数.xls"
		local ExcelStr = CommonFunc.ExportExcel(ExcelName, Titles[TableIndex], DataTables[TableIndex])
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
		}
		local Params = {
			Options = Options,
			Platforms = Platforms,
			TabList = TabList,
			Filters = Filters,
			DataTables = DataTables,
			Titles = Titles,
			DataTable = DataTable,
		}
		Viewer:View("template/oss/startNum.html", Params)
	end

end

--获得开始时间和结束时间之间的日期列表
function GetDates(self, StartDate, EndDate)
	local StartTime = GetTimeStamp(StartDate .. " 00:00:00")
	local EndTime = GetTimeStamp(EndDate .. " 23:59:59")
	local DateList = {}
	while StartTime <= EndTime do
		local Date = os.date("%Y-%m-%d", StartTime)
		table.insert(DateList, Date)
		StartTime = StartTime + 86400
	end
	return DateList
end

--获得前TopN的子指标列表以及总数
function GetTopNIndexList(self, TopN, Index, Res)
	local Array = {}
	local CIndexNumMap = {}
	for Date, DateInfo in pairs(Res[Index] or {}) do
		for CIndex, Num in pairs(DateInfo) do
			CIndexNumMap[CIndex] = (CIndexNumMap[CIndex] or 0) + Num
		end
	end
	for CIndex, Num in pairs(CIndexNumMap) do
		table.insert(Array, {CIndex = CIndex, Num = Num})
	end
	--排序，只取前TopN名
	table.sort(Array, function(A, B) return A.Num > B.Num end)
	return Array
end

DoRequest()
