------------------------------------------
--$Id: hitory_reg_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblHistoryReg` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `RegNum` int(11) NOT NULL DEFAULT '0' COMMENT '当日注册人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `TotalRegNum` int(11) NOT NULL DEFAULT '0' COMMENT '总注册人数，开服到现在',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史注册统计表' 

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
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.HostIDs and type(Options.HostIDs) == "table" then
		Where = Where .. " and HostID in ('" .. table.concat(Options.HostIDs, "','") .. "')"
	end
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblHistoryReg " .. Where .. " order by HostID, Date"
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
			Results[Info.Date] = Info
		else
			Results[Info.Date].RegNum = Results[Info.Date].RegNum + Info.RegNum
			Results[Info.Date].TotalRegNum = Results[Info.Date].TotalRegNum + Info.TotalRegNum
		end
	end
	return Results
end


function Insert(self, PlatformID, HostID, Date, RegNum, TotalRegNum)
	local Sql = "insert into " .. PlatformID .. "_statics.tblHistoryReg(PlatformID, HostID, Date, RegNum, TotalRegNum) values('" 
			.. PlatformID .. "','".. HostID .. "','" .. Date .. "','"  .. RegNum .. "','"  .. TotalRegNum 
			.. "') on duplicate key update RegNum = '" .. RegNum .. "', TotalRegNum = '" .. TotalRegNum .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end




