----------------------------------------
--$Id: lucky_draw_mgr.lua 67092 2015-07-13 09:50:01Z jm $
----------------------------------------
--[[
-- 极限挑战
--
--]]

local DifficultyList = {}
local pairs = pairs

function Show(self)
	local Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d",ngx.time() - 86400)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d",ngx.time())
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "StartTime",},
		{["Type"] = "EndTime",},
		{["Type"] = "Export",},
	}
	local Titles = {"平台", "服", "章节名称", "星级", "参与人数", "参与率"}
	local TableData = {}
	
	local ChallengeRes = ChallengeData:GetStatics(Options)
	local TotalLoginNum = 0 --总登陆人数
	if table.size(ChallengeRes) > 0 then
		local LoginRes = RetentionData:GetStatics(Options)
		for _, Info in pairs(LoginRes) do
			TotalLoginNum = TotalLoginNum + (Info.LoginNum or 0)
		end
	end
	for ChapterId, CInfo in pairs(ChallengeRes) do
		for Idx, IInfo in pairs(CInfo) do
			for StageId, Num in pairs(IInfo) do
				local Data = {}
				table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
				table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
				table.insert(Data, ChapterId)
				table.insert(Data, Idx)
				table.insert(Data, Num)
				local Rate = TotalLoginNum ~= 0 and math.floor(Num * 10000/TotalLoginNum)/100 .. "%" or 0
				table.insert(Data, Rate)
				table.insert(TableData, Data)
			end
		end
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("极限挑战.xls", Titles, TableData)
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
	}
	Viewer:View("template/playway/challenge_show.html", Params)
end


DoRequest()
