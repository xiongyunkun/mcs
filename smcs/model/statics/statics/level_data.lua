------------------------------------------
--$Id: vip_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblLevel` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Level` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `Num` int(11) NOT NULL DEFAULT '0' COMMENT '人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`Level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家等级统计表' 

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
	local Sql = "select * from "..PlatformID.."_statics.tblLevel " .. Where 
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

function GetStatics(self, Options)
	--先判断有没有选择平台，如果没有，则是选择全部平台
	local Results = {}
	local MaxLevel = CommonData.MaxLevel
	for X = 1, MaxLevel do
		Results[X] = 0
	end
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
		local Level = Info.Level
		if Results[Level] then --排除掉等级0的数据
			Results[Level] = Results[Level] + Info.Num
		end
	end
	return Results
end


function Insert(self, PlatformID, HostID, Level, Num)
	local Sql = "insert into " .. PlatformID .. "_statics.tblLevel(PlatformID, HostID, Level, Num)"
			.. " values('" .. PlatformID .. "','".. HostID .. "','" .. Level .. "','" .. Num .. "')"
			.. " on duplicate key update Num = '" .. Num .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end




