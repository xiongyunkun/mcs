------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblChallenge` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',  
  `ChapterId` int DEFAULT '0' COMMENT '章节ID',
  `Idx` tinyint DEFAULT '0' COMMENT '章节难度',
  `StageId` int DEFAULT '0' COMMENT '关卡ID',
  `PassNum` int DEFAULT '0' COMMENT '参与人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`ChapterId`,`Idx`,`StageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='极限挑战统计表'

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
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from " ..PlatformID.."_statics.tblChallenge " .. Where .. " order by HostID, Date"
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
				Results[Info.ChapterId] = Results[Info.ChapterId] or {}
				Results[Info.ChapterId][Info.Idx] = Results[Info.ChapterId][Info.Idx] or {}
				Results[Info.ChapterId][Info.Idx][Info.StageId] = (Results[Info.ChapterId][Info.Idx][Info.StageId] or 0) + Info.PassNum
			end
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		for _, Info in ipairs(Res) do
			Results[Info.ChapterId] = Results[Info.ChapterId] or {}
			Results[Info.ChapterId][Info.Idx] = Results[Info.ChapterId][Info.Idx] or {}
			Results[Info.ChapterId][Info.Idx][Info.StageId] = (Results[Info.ChapterId][Info.Idx][Info.StageId] or 0) + Info.PassNum
		end
	end
	return Results
end


function Insert(self, PlatformID, HostID, Date, ChapterId, Idx, StageId, PassNum)
	local Vals = {PlatformID, HostID, Date, ChapterId, Idx, StageId, PassNum}
	local Sql = "insert into " .. PlatformID .. "_statics.tblChallenge(PlatformID, HostID, Date, ChapterId, Idx, StageId, PassNum) values('" 
			.. table.concat( Vals, "','") .."') on duplicate key update PassNum=values(PassNum)"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res		
end


