----------------------------------------
--$Id: god_door_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 众神之门查询
--
--]]

--众神之门查询
function LogShow(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d 00:00:00",os.time())
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",os.time())
	
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	local DoorTypes = {
		[0] = "全部",
		[1] = "黄金之门", 
		[2] = "钻石1抽", 
		[3] = "钻石10抽", 
		[4] = "黄金之门10连抽",
		[5] = "五星神坛"
	}
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host",},
		{["Type"] = "label",["Text"] = "角色ID:"},
		{["Type"] = "text",["Name"] = "Uid", ["Placeholder"] = "角色ID"},
		{["Type"] = "label",["Text"] = "角色名:"},
		{["Type"] = "text",["Name"] = "Name", ["Placeholder"] = "角色名"},
		{["Type"] = "Select", ["Label"] = "抽奖类型",["Name"] = "DoorType", ["Values"] = DoorTypes,},
		{["Type"] = "label",["Text"] = "魔神ID:"},
		{["Type"] = "text",["Name"] = "PetID", ["Placeholder"] = "魔神ID"},
		{["Type"] = "<br>",},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "Export",},
	}
	--展示数据
	Titles = {'时间', "平台", "服", "角色ID", "角色名", "平台账号", "抽奖类型", "消耗资源", 
		"产出物品", "产出魔神"}
	local PlatformStr = PlatformID and Platforms[Options.PlatformID] or "all"
	local SeverMap = CommonFunc.GetServers(PlatformID)
	TableData = {}
	
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID and Options.HostID ~= "" then
		local GodDoorList = GodDoorLogData:Get(Options.PlatformID, Options)
		for _, Info in ipairs(GodDoorList) do
			local Data = {}
			table.insert(Data, Info.Time)
			table.insert(Data, Options.PlatformID and Platforms[Options.PlatformID] or "all")
			table.insert(Data, Options.HostID and Servers[tonumber(Options.HostID)] or "all")
			table.insert(Data, Info.Uid)
			table.insert(Data, Info.Name)
			table.insert(Data, Info.Urs)
			table.insert(Data, DoorTypes[Info.DoorType])
			--消耗资源
			local NewConsumeList = {}
			local ConsumeList = string.split(Info.Consume, "#")
			for _, Consume in ipairs(ConsumeList) do
				Consume = string.split(Consume, "_")
				if tonumber(Consume[1]) == 1 then
					local ItemName = ItemDataMap[tonumber(Consume[2])]
					if ItemName then
						NewConsumeList[ItemName] = tonumber(Consume[3])
					end
				elseif CommonData.BONUS_ID2NAME[tonumber(Consume[1])] then
					NewConsumeList[CommonData.BONUS_ID2NAME[tonumber(Consume[1])]] = tonumber(Consume[3])
				end
			end
			table.insert(Data, table.size(NewConsumeList) > 0  and Serialize(NewConsumeList) or "")
			local ItemList = {}
			local PetList = {}
			local RewardList = string.split(Info.Reward, "#")
			for _, Reward in ipairs(RewardList) do
				Reward = string.split(Reward, "_")
				if tonumber(Reward[1]) == 1 then --物品
					local ItemName = ItemDataMap[tonumber(Reward[2])]
					if ItemName then
						ItemList[ItemName] = (ItemList[ItemName] or 0) + tonumber(Reward[3])
					end
				elseif tonumber(Reward[1]) == 8 then --魔神
					local PetName = PetDataMap[tonumber(Reward[2])]
					if PetName then
						PetList[PetName] = (PetList[PetName] or 0) + tonumber(Reward[3])
					end
				end
			end
			table.insert(Data, table.size(ItemList) > 0  and Serialize(ItemList) or "")
			table.insert(Data, table.size(PetList) > 0  and Serialize(PetList) or "")
			table.insert(TableData, Data)
		end
		if Options.Submit == "导出" then
			local ExcelStr = CommonFunc.ExportExcel("众神之门.xls", Titles, TableData)
			ngx.say(ExcelStr)
			return
		end
	end
	DataTable = {
		["ID"] = "logTable",

		["DisplayLength"] = 50,
	}
	Viewer:View("template/playway/god_door_show.html")
end

DoRequest()