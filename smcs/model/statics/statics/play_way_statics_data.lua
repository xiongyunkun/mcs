------------------------------------------
--$Id: play_way_statics_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblPlayWayStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `StaticsIndex` varchar(32) NOT NULL DEFAULT '' COMMENT '统计指标',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Level` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `DayOnline` int(11) NOT NULL DEFAULT '0' COMMENT '近*天活跃',
  `NotDayReg` int(11) NOT NULL DEFAULT '0' COMMENT '非近*天注册',
  `PlayerNum` int(11) NOT NULL DEFAULT '0' COMMENT '人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `ChildLevel` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  PRIMARY KEY (`PlatformID`,`HostID`,`StaticsIndex`,`Date`,`Level`,`ChildLevel`,`DayOnline`,`NotDayReg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩法统计数据表'

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
	if Options.StaticsIndex and Options.StaticsIndex ~= "" then
		Where = Where .. " and StaticsIndex = '" .. Options.StaticsIndex .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Date = '" .. Options.Time .. "'"
	end
	if Options.Level and Options.Level ~= "" then
		Where = Where .. " and Level = '" .. Options.Level .. "'"
	end
	if Options.ChildLevel and Options.ChildLevel ~= "" then
		Where = Where .. " and ChildLevel = '" .. Options.ChildLevel .. "'"
	end
	if Options.DayOnline and Options.DayOnline ~= "" then
		Where = Where .. " and DayOnline = '" .. Options.DayOnline .. "'"
	else
		Where = Where .. " and DayOnline = '0' "
	end
	if Options.MaxDayOnline and Options.MaxDayOnline ~= "" then
		Where = Where .. " and DayOnline <='" .. Options.MaxDayOnline .. "'"
	end
	if Options.NotDayReg and Options.NotDayReg ~= "" then
		Where = Where .. " and NotDayReg ='" .. Options.NotDayReg .. "'"
	else
		Where = Where .. " and NotDayReg = '0' "
	end
	if Options.MaxNotDayReg and Options.MaxNotDayReg ~= "" then
		Where = Where .. " and NotDayReg <='" .. Options.MaxNotDayReg .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblPlayWayStatics " .. Where
	local Res, Err = DB:ExeSql(Sql)
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
			Results = self:MergeData(Results, Res)
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		Results = self:MergeData(Results, Res)
	end
	return Results
end

function MergeData(self, Results, Res)
	for _, Info in ipairs(Res) do
		local Date = Info.Date
		local Level = Info.Level
		local ChildLevel = Info.ChildLevel
		local DayOnline = Info.DayOnline
		local NotDayReg = Info.NotDayReg
		local PlayerNum = Info.PlayerNum
		if not Results[Info.Date] then
			Results[Info.Date] = {[Level] = {[ChildLevel] = {[DayOnline] = {[NotDayReg] = PlayerNum}}}}
		elseif not Results[Info.Date][Level] then
			Results[Info.Date][Level] = {[ChildLevel] = {[DayOnline] = {[NotDayReg] = PlayerNum}}}
		elseif not Results[Info.Date][Level][ChildLevel] then
			Results[Info.Date][Level][ChildLevel] = {[DayOnline] = {[NotDayReg] = PlayerNum}}
		elseif not Results[Info.Date][Level][ChildLevel][DayOnline] then
			Results[Info.Date][Level][ChildLevel][DayOnline] = {[NotDayReg] = PlayerNum}
		elseif not Results[Info.Date][Level][ChildLevel][DayOnline][NotDayReg] then
			Results[Info.Date][Level][ChildLevel][DayOnline][NotDayReg] = PlayerNum
		else
			Results[Info.Date][Level][ChildLevel][DayOnline][NotDayReg] = Results[Info.Date][Level][ChildLevel][DayOnline][NotDayReg] + PlayerNum
		end
	end
	return Results
end

local Cols = {"PlatformID", "HostID", "StaticsIndex", "Date", "Level", "ChildLevel", "DayOnline", "NotDayReg", "PlayerNum"}

function Insert(self, PlatformID, Args)
	local InsertValues = {}
	for _, Col in ipairs(Cols) do
		table.insert(InsertValues, Args[Col] or '')
	end
	local Sql = "replace into " .. PlatformID .. "_statics.tblPlayWayStatics("
			.. table.concat( Cols, ", ") .. ") values('" .. table.concat( InsertValues, "', '") .. "')"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then 
		return nil, Err 
	end
	return Res
end




