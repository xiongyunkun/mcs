------------------------------------------
--$Id: play_way_statics_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblInstanceStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `InstanceType` int(11) NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `PlayNum` int(11) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `UidNum` int(11) NOT NULL DEFAULT '0' COMMENT '参与人次',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `OpenFuncNum` int(11) NOT NULL DEFAULT '0' COMMENT '功能开放人数',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`InstanceType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='副本统计数据表' 

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
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Date = '" .. Options.Time .. "'"
	end
	
	local Sql = "select * from "..PlatformID.."_statics.tblInstanceStatics " .. Where
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
			Results[Info.Date] = {[Info.InstanceType] = Info}
		elseif not Results[Info.Date][Info.InstanceType] then
			Results[Info.Date][Info.InstanceType] = Info
		else
			Results[Info.Date][Info.InstanceType].PlayNum = Results[Info.Date][Info.InstanceType].PlayNum + Info.PlayNum
			Results[Info.Date][Info.InstanceType].UidNum = Results[Info.Date][Info.InstanceType].UidNum + Info.UidNum
			Results[Info.Date][Info.InstanceType].OpenFuncNum = Results[Info.Date][Info.InstanceType].OpenFuncNum + Info.OpenFuncNum
		end
	end
	return Results
end

local Cols = {"PlatformID", "HostID", "Date", "InstanceType", "PlayNum", "UidNum", "OpenFuncNum"}

function Insert(self, PlatformID, Args)
	local InsertValues = {}
	for _, Col in ipairs(Cols) do
		table.insert(InsertValues, Args[Col] or '')
	end
	local Sql = "replace into " .. PlatformID .. "_statics.tblInstanceStatics("
			.. table.concat( Cols, ", ") .. ") values('" .. table.concat( InsertValues, "', '") .. "')"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then 
		return nil, Err 
	end
	return Res
end




