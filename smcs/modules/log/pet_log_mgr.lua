----------------------------------------
--$Id: pet_log_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 魔神日志查询
--
--]]
local TypeValues = {
	[0] = "全部",
	[1] = "魔神获得",
	[2] = "魔神拆解",
	[3] = "魔神升级",
	--[4] = "魔神升星",
	[5] = "魔神培养",
	[6] = "魔神进化",
	[7] = "宝石镶嵌",
	[9] = "魔神突破",
	[10] = "魔神献祭",
}

--钻石金币操作面板展示
function LogShow(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d 00:00:00",os.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",os.time())
	
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "<br>",},
		{["Type"] = "Select",["Label"] = "操作类型",["Name"] = "Type", ["Values"] = TypeValues},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {"时间", "平台", "服", "角色ID", "角色名", "魔神名称", '操作类型', '消耗资源', "操作结果"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		Options.NOperationType = 8 --排除删除操作
		local PetLogList = PetLogData:Get(Options.PlatformID, Options)
		if #PetLogList >= 1000 then
			ExtMsg = "数据量太大，请缩小查询范围后查询"
			DataTable = {
				["ID"] = "logTable",
				["NoDivPage"] = true,
				["DisplayLength"] = 50,
			}
			Viewer:View("template/log/coin_log_list.html")
			return
		end
		for _, PetLog in ipairs(PetLogList) do
			local Data = {}
			table.insert(Data, PetLog.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, PetLog.Uid)
			table.insert(Data, PetLog.Name)
			table.insert(Data, PetDataMap[PetLog.PetID] or "")
			table.insert(Data, TypeValues[PetLog.OperationType])
			local ResourceList = {}
			local TArray = string.split(PetLog.NeedResource, "#")
			for _, Info in ipairs(TArray) do
				local Infos = string.split(Info, "_")
				local TypeID = tonumber(Infos[1])
				if TypeID == 1 then --道具
					local ItemName = ItemDataMap[tonumber(Infos[2])]
					if ItemName then
						ResourceList[ItemName] = tonumber(Infos[3])
					end
				elseif TypeID == 8 then --魔神
					local PetName = PetDataMap[tonumber(Infos[2])]
					if PetName then
						ResourceList[PetName] = tonumber(Infos[3])
					end
				else
					local ResourceName = CommonData.BONUS_ID2NAME[TypeID]
					if ResourceName then
						ResourceList[ResourceName] = tonumber(Infos[3])
					end
				end
			end
			table.insert(Data, Serialize(ResourceList) or "")
			table.insert(Data, PetLog.Result)
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("货币日志.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
	}
	Viewer:View("template/log/pet_log_list.html")
end

DoRequest()