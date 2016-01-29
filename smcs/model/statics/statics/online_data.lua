------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblOnline` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '跨服配置ID',
  `OnlineNum` int(11) DEFAULT '0' COMMENT '在线人数',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `PlatformID` int(11) NOT NULL DEFAULT '0' COMMENT '平台ID',
  PRIMARY KEY (`HostID`,`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线人数统计表' 

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
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time >= '" .. Options.Time .. " 00:00:00' and Time <= '" .. Options.Time .. " 23:59:59'"
	end
	local Sql = "select HostID, Time,sum(OnlineNum) as Num from "..PlatformID.."_statics.tblOnline " .. Where .. " group by HostID, Time"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

function GetStatics(self, Options)
	--先判断有没有选择平台，如果没有，则是选择全部平台
	local Results = {}
	if not Options.PlatformID or Options.PlatformID == "" then
		--如果选择全平台考虑到混服情况需要去重，同一个HostID只能统计一次
		local SelectHostIDList = {}
		local PlatformMap = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(PlatformMap) do
			Options.PlatformID = PlatformID
			local Res = self:Get(Options)
			for _, Info in ipairs(Res) do
				--只记录没有的HostID的情况
				if not SelectHostIDList[Info.Time] or not SelectHostIDList[Info.Time][Info.HostID] then
					Results[Info.Time] = (Results[Info.Time] or 0) + Info.Num
					SelectHostIDList[Info.Time] = SelectHostIDList[Info.Time] or {}
					SelectHostIDList[Info.Time][Info.HostID] = true
				end
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
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res		
end


