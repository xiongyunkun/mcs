----------------------------------------
--$Id: instance_mgr.lua 67092 2015-07-13 09:50:01Z jm $
----------------------------------------
--[[
-- 角色排行榜
-- 实时从各个游戏服拉取排行榜
--]]

local pairs = pairs

function Show(self)
	local Options = GetQueryArgs()
	Options.Time = Options.Time or os.date("%Y-%m-%d", NowTime)
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local Titles, TblNames, TabList = self:GetTitles()
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "导出表名", ["Name"] = "TableIndex", ["Values"] = TabList},
		{["Type"] = "Export",},
	}
	
	local TableData = {}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID 
		and Options.HostID ~= "" then
		TableData = self:GetToplistData(Options.HostID)
	end
	if Options.Submit == "导出" then
		local TabIndex = Options.TableIndex
		local NewTitles, ExcelResults = self:MergeExcelData(TabIndex, Titles, TableData)
		local ExcelStr = CommonFunc.ExportExcel(TabList[TabIndex] .. "排行榜.xls", NewTitles, ExcelResults)
		ngx.say(ExcelStr)
		return
	end
	local DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		Filters = Filters,
		TableData = TableData,
		DataTable = DataTable,
		Titles = Titles,
		TblNames = TblNames,
		TabList = TabList,
	}
	Viewer:View("template/playway/toplist_show.html", Params)
end

--获得Title列表
function GetTitles(self)
	local Titles = {}
	local TblNames = {}
	local TabList = {}
	for Title, Info in pairs(TopListCfg.Data) do
		Titles[Title] = {Keys = {}, Names = {}}
		table.insert(TblNames, Title)
		TabList[Info.TblName] = Title
		for _, ColInfo in ipairs(Info.Col) do
			local Name = ColInfo.Name
			if Title == "英雄战斗力排行榜" and Name == '英雄信息' then
				Name = "英雄名"
			end
			table.insert(Titles[Title].Names, Name)
			table.insert(Titles[Title].Keys, ColInfo.Key)
		end
	end
	return Titles, TblNames, TabList
end
--获得排行榜数据
function GetToplistData(self, HostID)
	local Titles = {}
	local TitleToplistMap = {}
	local Results = {}
	for Title, Info in pairs(TopListCfg.Data) do
		table.insert(Titles, Info.TblName)
		TitleToplistMap[Info.TblName] = Title
	end
	--从cmcs那边请求mysql
	local Flag = nil
	local Response = nil
	local Params = {
		Titles = table.concat( Titles, ","),
		HostID = HostID,
	}
	for X = 1, 2 do --默认调用2次，只要有一次成功则跳出循环
		Flag, Response = ReqCmcsByServerId(tonumber(HostID), "getmysql", Params)
		if Flag then
			break
		end
	end
	if Flag then
		Response = UnSerialize(Response)
		for Title, Info in pairs(Response or {}) do
			local TblName = TitleToplistMap[Title]
			if TitleToplistMap[Title] == "英雄战斗力排行榜" then
				for _, CInfo in ipairs(Info) do
					local Name = CInfo["CardInfo"]
					Name = string.match(Name, "Name:([%S%s]+)*TypeId") --英雄名称替换
					CInfo["CardInfo"] = Name
				end
			end
			Results[TblName] = Info
		end
	end
	return Results
end

--封装excel数据
function MergeExcelData(self, TabIndex, Titles, Results)
	local TitleName = nil
	for Title, Info in pairs(TopListCfg.Data) do
		if Info.TblName == TabIndex then
			TitleName = Title
			break
		end
	end 
	local ExcelResults = {}
	local NewTitles = {}
	if TitleName then
		NewTitles = Titles[TitleName].Names
		table.insert(NewTitles, 1, "排名")
		table.insert(NewTitles, 2, "玩家Uid")
		local Result = Results[TitleName] or {}
		for _, Info in ipairs(Result) do
			local Data = {}
			table.insert(Data, Info["TopId"])
			table.insert(Data, Info["UserUid"])
			for _, Key in ipairs(Titles[TitleName].Keys) do
				table.insert(Data, Info[Key] or "")
			end
			table.insert(ExcelResults, Data)
		end
	end
	return NewTitles, ExcelResults
end


DoRequest()
