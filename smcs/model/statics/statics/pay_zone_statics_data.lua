------------------------------------------
--$Id: pay_zone_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblPayZone` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `ZoneID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID', 
  `PayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值人数',
   PRIMARY KEY (`PlatformID`,`HostID`,`Date`, `ZoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值区间人数统计表'

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	local Where = " where 1=1 "
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
	if Options.HostIDs and type(Options.HostIDs) == "table" then
		local HostIDs = Options.HostIDs
		if not Options.NoMerge then
			local NewHostIDs = {}
			local THostMap = {}
			for _, HostID in ipairs(HostIDs) do
				HostID = CommonFunc.GetToHostID(HostID) --合服转换
				if not THostMap[HostID] then
					table.insert(NewHostIDs, HostID)
					THostMap[HostID] = true
				end
			end
			HostIDs = NewHostIDs
		end
		Where = Where .. " and HostID in ('" .. table.concat(HostIDs, "','") .. "')"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Date = '" .. Options.Time .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblPayZone " .. Where .. " order by HostID, Date"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

function GetStatics(self, Options)
	--先判断有没有选择平台，如果没有，则是选择全部平台
	local Results = {}
	local TotalNum = 0
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
	--再统计总人数和总流失人数
	for ZoneID, ZoneInfo in pairs(Results) do
		TotalNum = TotalNum + ZoneInfo.PayUserNum
	end
	return Results, TotalNum
end

function MergeData(self, Results, PayRes)
	for _, ResInfo in ipairs(PayRes) do
		local ZoneID = ResInfo.ZoneID
		if not Results[ZoneID] then
			Results[ZoneID] = {PayUserNum = ResInfo.PayUserNum}
		else
			Results[ZoneID].PayUserNum = Results[ZoneID].PayUserNum + ResInfo.PayUserNum
		end
	end
	return Results
end

function BatchInsert(self, PlatformID, HostID, Date, ZoneInfo)
	local Values = {}
	for ZoneID, PayUserNum in pairs(ZoneInfo) do
		local List = {PlatformID, HostID, Date, ZoneID, PayUserNum}
		table.insert(Values, table.concat( List, "','"))
	end
	local Sql = "insert into " .. PlatformID .. "_statics.tblPayZone(PlatformID, HostID, Date, ZoneID, PayUserNum"
			.. ") values('" .. table.concat( Values, "'),('") .. "') on duplicate key update PayUserNum = values(PayUserNum)"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end
--统计空间
local ZoneMap = {
	{"0-9",0, 9},
	{"10-49", 10, 49},
	{"50-99", 50, 99},
	{"100-199", 100, 199},
	{"200--499", 200, 499},
	{"500--999", 500, 999},
	{"1000--1999", 1000, 1999},
	{"2000--4999", 2000, 4999},
	{"5000--9999", 5000, 9999},
	{"10000--19999", 10000, 19999},
	{"20000-49999", 20000, 49999},
	{">50000", 50000,},
}
function GetZoneMap(self)
	return ZoneMap
end



