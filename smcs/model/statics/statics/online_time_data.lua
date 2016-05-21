------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblOnlineTime` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Time0` int(11) NOT NULL DEFAULT '0' COMMENT '{0,1}',
  `Time5` int(11) NOT NULL DEFAULT '0' COMMENT '{5, 10}',
  `Time10` int(11) NOT NULL DEFAULT '0' COMMENT '{10, 15}',
  `Time15` int(11) NOT NULL DEFAULT '0' COMMENT '{15, 30}',
  `Time30` int(11) NOT NULL DEFAULT '0' COMMENT '{30, 45}',
  `Time45` int(11) NOT NULL DEFAULT '0' COMMENT '{45, 60}',
  `Time60` int(11) NOT NULL DEFAULT '0' COMMENT '{60, 90}',
  `Time90` int(11) NOT NULL DEFAULT '0' COMMENT '{90, 120}',
  `Time120` int(11) NOT NULL DEFAULT '0' COMMENT '{120, 150}',
  `Time150` int(11) NOT NULL DEFAULT '0' COMMENT '{150, 180}',
  `Time180` int(11) NOT NULL DEFAULT '0' COMMENT '{180, 240}',
  `Time240` int(11) NOT NULL DEFAULT '0' COMMENT '{240, 300}',
  `Time300` int(11) NOT NULL DEFAULT '0' COMMENT '{300, 360}',
  `Time360` int(11) NOT NULL DEFAULT '0' COMMENT '{360, 420}',
  `Time420` int(11) NOT NULL DEFAULT '0' COMMENT '{420,600}',
  `TotalTimes` int(11) NOT NULL DEFAULT '0' COMMENT '总时长',
  `TotalPlayers` int(11) NOT NULL DEFAULT '0' COMMENT '玩家总数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Time1` int(11) NOT NULL DEFAULT '0' COMMENT '{1, 5}',
  `Time600` int(11) NOT NULL DEFAULT '0' COMMENT '{600, 900}',
  `Time900` int(11) NOT NULL DEFAULT '0' COMMENT '{900, 1200}',
  `Time1200` int(11) NOT NULL DEFAULT '0' COMMENT '{1200}',
  `UserType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:老用户,2:新用户',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`UserType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家在线时长统计表'
--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	if Options.UserType and Options.UserType ~= "" then
		Where = Where .. " and UserType = '" .. Options.UserType .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblOnlineTime " .. Where .. " order by HostID, Date"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end

function GetStatics(self, Options)
	--先判断有没有选择平台，如果没有，则是选择全部平台
	local Results = {}
	if not Options.PlatformID or Options.PlatformID == "" then
		local PlatformMap = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(PlatformMap) do
			Options.PlatformID = PlatformID
			local Res = self:Get(Options)
			Results = self:MergeData(Res, Results)
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		Results = self:MergeData(Res, Results)
	end
	return Results
end

function MergeData(self, OrgResults, TotalResults)
	for _, Info in ipairs(OrgResults) do
		if not TotalResults[Info.Date] then
			TotalResults[Info.Date] = Info
			if Info["TotalPlayers"] ~= 0 then
				TotalResults[Info.Date]["AveTime"] = math.ceil(Info["TotalTimes"]/(Info["TotalPlayers"] * 60))
			else
				TotalResults[Info.Date]["AveTime"] = 0
			end
		else
			--需要合并数值，当日新增直接相加，每天的留存率还得重新计算
			local DateInfo = TotalResults[Info.Date]
			DateInfo["Time0"] = DateInfo["Time0"] + Info["Time0"]
			DateInfo["Time1"] = DateInfo["Time1"] + Info["Time1"]
			DateInfo["Time5"] = DateInfo["Time5"] + Info["Time5"]
			DateInfo["Time10"] = DateInfo["Time10"] + Info["Time10"]
			DateInfo["Time15"] = DateInfo["Time15"] + Info["Time15"]
			DateInfo["Time30"] = DateInfo["Time30"] + Info["Time30"]
			DateInfo["Time45"] = DateInfo["Time45"] + Info["Time45"]
			DateInfo["Time60"] = DateInfo["Time60"] + Info["Time60"]
			DateInfo["Time90"] = DateInfo["Time90"] + Info["Time90"]
			DateInfo["Time120"] = DateInfo["Time120"] + Info["Time120"]
			DateInfo["Time150"] = DateInfo["Time150"] + Info["Time150"]
			DateInfo["Time180"] = DateInfo["Time180"] + Info["Time180"]
			DateInfo["Time240"] = DateInfo["Time240"] + Info["Time240"]
			DateInfo["Time300"] = DateInfo["Time300"] + Info["Time300"]
			DateInfo["Time360"] = DateInfo["Time360"] + Info["Time360"]
			DateInfo["Time420"] = DateInfo["Time420"] + Info["Time420"]
			DateInfo["Time600"] = DateInfo["Time600"] + Info["Time600"]
			DateInfo["Time900"] = DateInfo["Time900"] + Info["Time900"]
			DateInfo["Time1200"] = DateInfo["Time1200"] + Info["Time1200"]
			DateInfo["TotalTimes"] = DateInfo["TotalTimes"] + Info["TotalTimes"]
			DateInfo["TotalPlayers"] = DateInfo["TotalPlayers"] + Info["TotalPlayers"]
			if DateInfo["TotalPlayers"] ~= 0 then
				DateInfo["AveTime"] = math.ceil(DateInfo["TotalTimes"]/(DateInfo["TotalPlayers"] * 60))
			else
				DateInfo["AveTime"] = 0
			end
			TotalResults[Info.Date] = DateInfo
		end
	end
	return TotalResults
end

local Cols = {"Time0", "Time1", "Time5", "Time10", "Time15", "Time30","Time45","Time60", "Time90", "Time120", 
              "Time150", "Time180","Time240", "Time300","Time360", "Time420", "Time600", "Time900", "Time1200",
			  "TotalTimes", "TotalPlayers",}

function Insert(self, PlatformID, HostID, Date, UserType, RetInfo)
	local Sql = "insert into " .. PlatformID .. "_statics.tblOnlineTime(PlatformID, HostID, Date, UserType,"..table.concat(Cols, ",")
			.. ") values('" .. PlatformID .. "','".. HostID .. "','" .. Date .. "','" .. UserType .. "','"
	local InsertValues = {}
	local UpdateValues = {}
	for _, Col in ipairs(Cols) do
		table.insert(InsertValues, RetInfo[Col] or 0)
		if RetInfo[Col] then
			table.insert(UpdateValues, Col .. "= '" .. RetInfo[Col] .. "'")
		end
	end
	Sql = Sql .. table.concat(InsertValues, "','") .. "') on duplicate key update " .. table.concat(UpdateValues, ",")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end


