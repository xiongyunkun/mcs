----------------------------------------
--$Id: mountmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 玩法参与统计展示
--
--]]

function InstanceShow(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time()-7*24*3600)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	local InstanceRes = InstancePlayData:GetStatics(Options)
	--再获得该天的登陆人数
	local LoginRes = RetentionData:GetStatics(Options) -- 日活跃
	if Options.Submit == "导出" then
		local Index = tonumber(Options.TableIndex) 
		local Titles = TRAIL_NAME_MAP
		local NewTitles = {}
		for _, Title in pairs(Titles) do
			table.insert(NewTitles, Title)
			table.insert(NewTitles, "")
			table.insert(NewTitles, "")
		end
		table.insert(NewTitles, 1, "日期")
		local TableData = self:GetExcelDataTable(Titles, InstanceRes, LoginRes)
		local ExcelName = (Platforms[Options.PlatformID]  or "全部") .. "_" .. TabList[Index] .. ".xls"
		local ExcelStr = CommonFunc.ExportExcel(ExcelName, NewTitles, TableData)
		ngx.say(ExcelStr)
		return
	end
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		Filters = Filters,
		TableData = TableData,
		DataTable = DataTable,
		Titles = Titles,
		InstanceRes = InstanceRes,
		LoginRes = LoginRes,
	}
	Viewer:View("template/playway/instance_play_show.html", Params)
end

function GetExcelDataTable(self, Titles, InstanceRes, LoginRes)
	local Results = {}
	--第一行也是标题
	local ChileTitles = {""}
	for _, Title in pairs(Titles) do
		table.insert(ChileTitles, "参与次数")
		table.insert(ChileTitles, "参与人数")
		table.insert(ChileTitles, "参与率")
	end
	table.insert(Results, ChileTitles)
	for Day, DayInfo in pairs(InstanceRes) do
		local Result = {Day}
		for ID, _ in pairs(Titles) do
			table.insert(Result, (DayInfo[ID] and DayInfo[ID].PlayNum or ""))
			table.insert(Result, (DayInfo[ID] and DayInfo[ID].UidNum or ""))
			local Rate = ""
			if DayInfo[ID] and DayInfo[ID].UidNum and LoginRes[Day] and LoginRes[Day].LoginNum then
				Rate = math.floor(DayInfo[ID].UidNum * 10000/LoginRes[Day].LoginNum)/100 .. "%"
			end
			table.insert(Result, Rate)
		end
		table.insert(Results, Result)
	end
	return Results
end


DoRequest()
