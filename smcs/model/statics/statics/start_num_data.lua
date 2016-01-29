------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblStartNum` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Index` varchar(32) NOT NULL DEFAULT '' COMMENT '统计指标',
  `CIndex` varchar(32) NOT NULL DEFAULT '' COMMENT '子统计指标',
  `Num` int(11) NOT NULL DEFAULT '0' COMMENT '启动次数',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`Index`,`CIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='启动次数统计表'

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
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. " 00:00:00'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. " 23:59:59'"
	end
	if Options.Index and Options.Index ~= "" then
		Where = Where .. " and `Index` = '" .. Options.Index .. "'"
	end
	if Options.CIndex and Options.CIndex ~= "" then
		Where = Where .. " and `CIndex` = '" .. Options.CIndex .. "'"
	end
	local Sql = "select * from " ..PlatformID.."_statics.tblStartNum " .. Where
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
			for _, Info in ipairs(Res) do
				Results[Info.Index] = Results[Info.Index] or {}
				Results[Info.Index][Info.Date] = Results[Info.Index][Info.Date] or {}
				Results[Info.Index][Info.Date][Info.CIndex] = (Results[Info.Index][Info.Date][Info.CIndex] or 0) + Info.Num
			end
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		for _, Info in ipairs(Res) do
			Results[Info.Index] = Results[Info.Index] or {}
			Results[Info.Index][Info.Date] = Results[Info.Index][Info.Date] or {}
			Results[Info.Index][Info.Date][Info.CIndex] = (Results[Info.Index][Info.Date][Info.CIndex] or 0) + Info.Num
		end
	end

	return Results
end


function Insert(self, PlatformID, HostID, Date, Index, CIndex, Num)
	local Sql = "insert into " .. PlatformID .. "_statics.tblStartNum(PlatformID, HostID, Date, `Index`, `CIndex`, Num) values('" 
			.. PlatformID .. "','".. HostID .. "','" .. Date .. "','" .. Index .. "','" .. CIndex .. "','" .. Num 
			.. "') on duplicate key update Num = values(Num)"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res		
end


