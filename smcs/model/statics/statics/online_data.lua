------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblOnline` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '跨服配置ID',
  `OnlineNum` int(11) DEFAULT '0' COMMENT '在线人数',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  PRIMARY KEY (`HostID`,`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线人数统计表';

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
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time >= '" .. Options.Time .. " 00:00:00' and Time <= '" .. Options.Time .. " 23:59:59'"
	end
	if Options.ExactTime and Options.ExactTime ~= "" then
		Where = Where .. " and Time = '" .. Options.ExactTime .. "'"
	end
	local Sql = "select HostID, Time,sum(OnlineNum) as Num from "..PlatformID.."_statics.tblOnline " .. Where .. " group by HostID, Time"
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
			for _, Info in ipairs(Res) do
				Results[Info.Time] = (Results[Info.Time] or 0) + Info.Num
			end
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		for _, Info in ipairs(Res) do
			Results[Info.Time] = (Results[Info.Time] or 0) + Info.Num
		end
	end

	return Results
end


function Insert(self, PlatformID, HostID, OnlineNum, Time)
	local Sql = "insert into " .. PlatformID .. "_statics.tblOnline(PlatformID, HostID, OnlineNum, Time) values('"
			.. PlatformID .. "','".. HostID .. "','" .. OnlineNum .. "','" .. Time
			.. "') on duplicate key update OnlineNum = values(OnlineNum)"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res		
end


