----------------------------------------
--$Id: mountmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 玩法参与统计展示
--
--]]
--等级对应
InstLevelMap = {
	[1] = 23,[2] = 23,[3] = 25,[6] = 34,[7] = 34,[8] = 34,[11] = 30,[12] = 30,
	[13] = 27,[14] = 27,[15] = 31,[16] = 24,[17] = 30,[18] = 30,[19] = 29,[20] = 29,
	[21] = 30,[22] = 30,[51] = 30,[52] = 30,[53] = 30,[54] = 30,[55] = 30,
}

function InstanceShow(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",os.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",os.time())
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--filter页面模板显示的参数
	TabList = {"系统玩法", "定时玩法",}
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Select", ["Label"] = "导出表名", ["Name"] = "TableIndex", ["Values"] = TabList},
		{["Type"] = "Export",},
	}
	SysInstanceList = CommonData.SYS_INSTANCES
	TimerInstanceList = CommonData.TIMER_INSTANCES
	InstanceRes = InstanceStaticsData:GetStatics(Options)
	if Options.Submit == "导出" then
		local Index = tonumber(Options.TableIndex) 
		local Titles = nil
		if Index == 1 then --系统玩法
			Titles = SysInstanceList
		else
			Titles = TimerInstanceList
		end
		local NewTitles = {}
		for _, Title in pairs(Titles) do
			table.insert(NewTitles, Title)
			table.insert(NewTitles, "")
			table.insert(NewTitles, "")
		end
		table.insert(NewTitles, 1, "日期")
		local TableData = self:GetExcelDataTable(Titles, InstanceRes)
		local ExcelName = (Platforms[Options.PlatformID]  or "全部") .. "_" .. TabList[Index] .. ".xls"
		local ExcelStr = CommonFunc.ExportExcel(ExcelName, NewTitles, TableData)
		ngx.say(ExcelStr)
		return
	end
	Viewer:View("template/playway/instance_show.html")
end

function GetExcelDataTable(self, Titles, InstanceRes)
	local Results = {}
	--第一行也是标题
	local ChileTitles = {""}
	for _, Title in pairs(Titles) do
		table.insert(ChileTitles, "参与人数")
		table.insert(ChileTitles, "功能开放人数")
		table.insert(ChileTitles, "参与率")
	end
	table.insert(Results, ChileTitles)
	for Day, DayInfo in pairs(InstanceRes) do
		local Result = {Day}
		for ID, _ in pairs(Titles) do
			table.insert(Result, (DayInfo[ID] and DayInfo[ID].UidNum or ""))
			table.insert(Result, (DayInfo[ID] and DayInfo[ID].OpenFuncNum or ""))
			local Rate = "0%"
			if DayInfo[ID] and DayInfo[ID].UidNum and DayInfo[ID].OpenFuncNum ~= 0 then
				Rate = math.floor(DayInfo[ID].UidNum * 10000/DayInfo[ID].OpenFuncNum)/100 .. "%"
			end
			table.insert(Result, Rate)
		end
		table.insert(Results, Result)
	end
	return Results
end


DoRequest()
