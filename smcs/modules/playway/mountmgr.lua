----------------------------------------
--$Id: mountmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 坐骑等阶统计展示
--
--]]
local MaxDay = 7 --只展示7天的
local MaxLevel = 10 --最大等阶

function MountLevelShow(self)
	Options = GetQueryArgs()
	Options.Time = Options.Time or os.date("%Y-%m-%d",os.time())
	Options.DayOnline = Options.DayOnline or "0"
	Options.NotDayReg = Options.NotDayReg or "0"
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	local Days = {}
	Days[0] = "全部"
	for X = 1, MaxDay do
		Days[X] = X
	end
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Time",},
		{["Type"] = "Select", ["Label"] = "近*天活跃",["Name"] = "DayOnline", ["Values"] = Days,},
		{["Type"] = "Select", ["Label"] = "非*天注册",["Name"] = "NotDayReg", ["Values"] = Days,},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {"平台", "服", "日期", "坐骑名称", "坐骑等阶", "近*天活跃", "非*天注册", "用户数", "同阶占比", "总占比"}
	TableData = {}
	Options.StaticsIndex = "MountLevel"
	Options.MaxDayOnline = MaxDay
	Options.MaxNotDayReg = MaxDay
	local PlatformStr = Options.PlatformID and Platforms[Options.PlatformID] or "all"
	local HostStr = Options.HostID and Servers[tonumber(Options.HostID)] or "all"
	local MountInfoList = PlayWayStaticsData:GetStatics(Options)
	--还需要单独获得每个等阶的汇总数据
	local TotalOptions = {
		PlatformID = Options.PlatformID,
		HostID = Options.HostID,
		Time = Options.Time,
		StaticsIndex = "MountLevel",
	}
	local TotalMountInfoList = PlayWayStaticsData:GetStatics(TotalOptions)
	--计算总人数,用于统计总占比
	local TotalNum = 0
	for Day, MountInfo in pairs(TotalMountInfoList) do 
		for Level = 1, MaxLevel do 
			for ChildLevel = 1, MaxLevel do
				TotalNum = TotalNum + (MountInfo[Level] and MountInfo[Level][ChildLevel] and MountInfo[Level][ChildLevel][0][0] or 0)
			end
		end
	end

	for Day, MountInfo in pairs(MountInfoList) do
		for Level = 1, MaxLevel do 
			for ChildLevel = 1, MaxLevel do
				local MountName = MountCfg["ConstInfo"]["坐骑数据表"][(Level-1)*10 + ChildLevel].Name or ""
				if MountInfo[Level] and MountInfo[Level][ChildLevel] then
					for DayOnline,  OnlineInfo in pairs(MountInfo[Level][ChildLevel]) do
						for NotDayReg, Num in pairs(OnlineInfo) do
							local Data = {}
							table.insert(Data, PlatformStr)
							table.insert(Data, HostStr)
							table.insert(Data, Day)
							table.insert(Data, MountName)
							table.insert(Data, Level .. "阶" .. ChildLevel .. "星")
							table.insert(Data, DayOnline ~= 0 and DayOnline or "-")
							table.insert(Data, NotDayReg ~= 0 and NotDayReg or "-")
							table.insert(Data, Num)
							local Rate = "0%"
							if Num ~= 0 and TotalMountInfoList[Day][Level][ChildLevel][0][0] ~= 0 then
								Rate = math.floor(Num * 10000/TotalMountInfoList[Day][Level][ChildLevel][0][0])/100 .. "%"
							end
							table.insert(Data, Rate)
							local TotalRate = "0%"
							if Num ~= 0 and TotalNum ~= 0 then
								TotalRate = math.floor(Num * 10000/TotalNum)/100 .. "%"
							end
							table.insert(Data, TotalRate)
							table.insert(TableData, Data)
						end
					end
				else
					local Data = {}
					table.insert(Data, PlatformStr)
					table.insert(Data, HostStr)
					table.insert(Data, Day)
					table.insert(Data, MountName)
					table.insert(Data, Level .. "阶" .. ChildLevel .. "星")
					table.insert(Data, tonumber(Options.DayOnline) ~= 0 and Options.DayOnline or "-")
					table.insert(Data, tonumber(Options.NotDayReg) ~= 0 and Options.NotDayReg or "-")
					table.insert(Data, 0)
					table.insert(Data, "0%")
					table.insert(Data, "0%")
					table.insert(TableData, Data)
				end
			end
		end
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("用户留存.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
			["SortCol"] = 2,
			["SortBy"] = "desc",
		}
		Viewer:View("template/playway/mount_level_show.html")
	end
end


DoRequest()
