----------------------------------------
--$Id: vipmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- vip用户信息展示
--
--]]

function VipShow(self)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	local Servers = CommonFunc.GetServers(Options.PlatformID)
	local VipLevels = {}
	for X = 1, 15 do
		table.insert(VipLevels, "VIP" .. X)
	end
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "Select", ["Label"] = "VIP等级", ["Name"] = "VipLevel", ["Values"] = VipLevels,},
		{["Type"] = "Export",},
	}
	local TableData = {}
	--只有选定了平台和服的才允许查询
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID 
		and Options.HostID ~= "" then
		local TOptions = {
			PlatformID = Options.PlatformID,
			HostID = Options.HostID,
			VipLevel = Options.VipLevel,
		}
		local UserInfos = UserInfoData:Get(TOptions)
		local NowTime = ngx.time()
		for _, UserInfo in ipairs(UserInfos) do
			local Info = {}
			table.insert(Info, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Info, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Info, UserInfo.Uid)
			table.insert(Info, UserInfo.Urs)
			local Name = UserInfo.Name
			local LastLoginTime = UserInfo.LastLoginTime
			--如果超过7天没有登录名字要标红
			if NowTime - GetTimeStamp(LastLoginTime) >= 604800 then 
				Name = "<font color='red'>" .. Name .. "</font>"
			end
			table.insert(Info, Name)
			table.insert(Info, UserInfo.Level)
			table.insert(Info, UserInfo.VipLevel)
			table.insert(Info, UserInfo.Fighting)
			--查询玩家充值情况
			local PayOptions = {
				HostID = Options.HostID,
				Uid = UserInfo.Uid,
			}
			local FirstCashTime = "-" --首冲时间
			local LastCashTime = "-" --最后充值时间
			local TotalGold = 0 --累计充值钻石
			local UserPayInfo = UserPayStaticsData:Get(Options.PlatformID, PayOptions)
			if UserPayInfo and UserPayInfo[1] then
				FirstCashTime = UserPayInfo[1].FirstCashTime
				LastCashTime = UserPayInfo[1].LastCashTime
				TotalGold = UserPayInfo[1].TotalGold
			end
			table.insert(Info, FirstCashTime)
			table.insert(Info, LastCashTime)
			table.insert(Info, TotalGold)
			table.insert(Info, LastLoginTime)
			table.insert(TableData, Info)
		end
	end
	local Titles = {"平台", "服", "UID", "平台账号", "角色名",
		"等级", "VIP等级", "战力", "首充时间", "最后一次充值时间", "累计充值钻石", "最后一次登录时间"}
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("VIP用户信息统计.xls", Titles, TableData)
		ngx.say(ExcelStr)
	else
		local DataTable = {
			["ID"] = "logTable",
			["NoDivPage"] = true,
			["SortCol"] = 5,
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
		Viewer:View("template/oss/vipShow.html", Params)
	end
end

DoRequest()
