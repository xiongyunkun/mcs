------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblLoginStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Hour` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小时',
  `Step` int(11) NOT NULL DEFAULT '0' COMMENT '统计指标ID',
  `Num` int(11) NOT NULL DEFAULT '0' COMMENT '统计值',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`Hour`,`Step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆流程统计表'  

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
		local HostIDList = {Options.HostID, CommonData.W3_HOSTID}
		Where = Where .. " and HostID in ('" .. table.concat( HostIDList, "','") .. "')"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	if Options.Step and Options.Step ~= "" then
		Where = Where .. " and Step = '" .. Options.Step .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblLoginStatics " .. Where .. " order by HostID, Date"
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
		if not Results[Info.Date] then
			Results[Info.Date] = {[Info.Hour] = {[Info.Step] = Info.Num}}
		elseif not Results[Info.Date][Info.Hour] then
			Results[Info.Date][Info.Hour] = {[Info.Step] = Info.Num}
		elseif not Results[Info.Date][Info.Hour][Info.Step] then
			Results[Info.Date][Info.Hour][Info.Step] = Info.Num
		else
			Results[Info.Date][Info.Hour][Info.Step] = Results[Info.Date][Info.Hour][Info.Step] + Info.Num
		end
	end
	return Results
end

function Insert(self, PlatformID, HostID, Date, Hour, Step, Num)
	local Sql = "insert into " .. PlatformID .. "_statics.tblLoginStatics(PlatformID, HostID, Date, Hour, Step, Num)"
			.. " values('" .. PlatformID .. "','" .. HostID .. "','" .. Date .. "','"
			.. Hour .. "','" .. Step .. "','" .. Num .. "') on duplicate key update Num = '" .. Num .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


