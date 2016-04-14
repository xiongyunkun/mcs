------------------------------------------
--$Id: level_statics_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblLevelStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Level` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `TotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '总人数',
  `TotalLostNum` int(11) NOT NULL DEFAULT '0' COMMENT '流失人数',
  `LivelNum` int(11) NOT NULL DEFAULT '0' COMMENT '活跃用户数', 
  `LiveLostNum` int(11) NOT NULL DEFAULT '0' COMMENT '活跃用户流失数', 
  `PayNum` int(11) NOT NULL DEFAULT '0' COMMENT '付费用户数', 
  `PayLostNum` int(11) NOT NULL DEFAULT '0' COMMENT  '付费用户流失数',  
  `PayLivelNum` int(11) NOT NULL DEFAULT '0' COMMENT '付费活跃用户数', 
  `PayLiveLostNum` int(11) NOT NULL DEFAULT '0' COMMENT  '付费活跃用户流失数',  
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
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end 
	if Options.Level and Options.Level ~= "" then
		Where = Where .. " and Level = '" .. Options.Level .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblLevelStatics " .. Where 
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
		local Level = Info.Level
		local Date = Info.Date
		if not Results[Date] then --该日期的数据什么都没有，重新构造一个
			Results[Date] = {}
			local MaxLevel = CommonData.MaxLevel
			for X = 1, MaxLevel do
				Results[Date][X] = {}
			end
			Results[Date][Level] = Info
		else
			Results[Date][Level].TotalNum = (Results[Date][Level].TotalNum or 0) + Info.TotalNum
			Results[Date][Level].TotalLostNum = (Results[Date][Level].TotalLostNum or 0) + Info.TotalLostNum
			Results[Date][Level].LivelNum = (Results[Date][Level].LivelNum or 0) + Info.LivelNum
			Results[Date][Level].LiveLostNum = (Results[Date][Level].LiveLostNum or 0) + Info.LiveLostNum
			Results[Date][Level].PayNum = (Results[Date][Level].PayNum or 0) + Info.PayNum
			Results[Date][Level].PayLostNum = (Results[Date][Level].PayLostNum or 0) + Info.PayLostNum
			Results[Date][Level].PayLivelNum = (Results[Date][Level].PayLivelNum or 0) + Info.PayLivelNum
			Results[Date][Level].PayLiveLostNum = (Results[Date][Level].PayLiveLostNum or 0) + Info.PayLiveLostNum
		end
	end
	return Results
end

local Cols = {'TotalNum', 'LivelNum', 'PayNum', 'PayLivelNum'}

--插入数据
function Insert(self, PlatformID, HostID, Date, Level, NumInfo)
	local Sql = "insert into " .. PlatformID .. "_statics.tblLevelStatics(PlatformID, HostID, Date, Level, " 
			.. table.concat(Cols, ",") .. ")" .. " values('" .. PlatformID .. "','".. HostID .. "','" 
			.. Date .. "','".. Level .. "','"
	local InsertValues = {}
	local UpdateValues = {}
	for _, Col in ipairs(Cols) do
		table.insert(InsertValues, NumInfo[Col] or 0)
		if NumInfo[Col] then
			table.insert(UpdateValues, Col .. "= '" .. NumInfo[Col] .. "'")
		end
	end
	Sql = Sql .. table.concat(InsertValues, "','") .. "') on duplicate key update " 
		.. table.concat(UpdateValues, ",")	
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local LostCols = {"TotalLostNum", "LiveLostNum", "PayLostNum", "PayLiveLostNum"}

--更新流失率
function UpdateLostNum(self, PlatformID, HostID, Date, Level, NumInfo)
	local Sql = "update " .. PlatformID .. "_statics.tblLevelStatics set "
	local UpdateValues = {}
	for _, Col in ipairs(LostCols) do
		if NumInfo[Col] then
			table.insert(UpdateValues, Col .. "= '" .. NumInfo[Col] .. "'")
		end
	end
	Sql = Sql .. table.concat(UpdateValues, ",") .. " where PlatformID = '" .. PlatformID .. "' and HostID = '"
		.. HostID .. "' and Date = '" .. Date .. "' and Level = '" .. Level .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end



