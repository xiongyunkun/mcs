------------------------------------------
--$Id: vip_data.lua 114984 2016-04-28 10:04:46Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblVIP` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `VipLevel` tinyint DEFAULT '0' COMMENT 'VIP等级',
  `VipNum` int(11) NOT NULL DEFAULT '0' COMMENT 'Vip人数',
  `NowVipNum` int(11) NOT NULL DEFAULT '0' COMMENT '当前Vip人数',
  `LostNum` int(11) NOT NULL DEFAULT '0' COMMENT '同级VIP流失人数',
   PRIMARY KEY (`PlatformID`,`HostID`,`Date`, `VipLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='VIP统计表'

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
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	if Options.VipLevel and Options.VipLevel ~= "" then
		Where = Where .. " and VipLevel = '" .. Options.VipLevel .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblVIP " .. Where .. " order by HostID, Date"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end

function GetStatics(self, Options)
	--先判断有没有选择平台，如果没有，则是选择全部平台
	local Results = {}
	local TotalNum = 0
	local TotalLostNum = 0
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
	for VipLevel, VipInfo in pairs(Results) do
		TotalNum = TotalNum + VipInfo.VipNum
		TotalLostNum = TotalLostNum + VipInfo.LostNum
	end
	return Results, TotalNum, TotalLostNum
end

function MergeData(self, Results, VipRes)
	for _, ResInfo in ipairs(VipRes) do
		local VipLevel = ResInfo.VipLevel
		local VipNum = ResInfo.VipNum
		local NowVipNum = ResInfo.NowVipNum
		local LostNum = ResInfo.LostNum
		if not Results[VipLevel] then
			Results[VipLevel] = {VipNum = VipNum, NowVipNum = NowVipNum, LostNum = LostNum}
		else
			Results[VipLevel].VipNum = Results[VipLevel].VipNum + VipNum
			Results[VipLevel].NowVipNum = Results[VipLevel].NowVipNum + NowVipNum
			Results[VipLevel].LostNum = Results[VipLevel].LostNum + LostNum
		end
	end
	return Results
end

local Cols = {"VipNum","NowVipNum",}

function Insert(self, PlatformID, HostID, Date, VipLevel, RetInfo)
	local Sql = "insert into " .. PlatformID .. "_statics.tblVIP(PlatformID, HostID, Date, VipLevel, "..table.concat(Cols, ",")
			.. ") values('" .. PlatformID .. "','".. HostID .. "','" .. Date .. "','"  .. VipLevel .. "','" 
	local InsertValues = {}
	local UpdateValues = {}
	for _, Col in ipairs(Cols) do
		table.insert(InsertValues, RetInfo[Col] or 0)
		if RetInfo[Col] then
			table.insert(UpdateValues, Col .. "= '" .. RetInfo[Col] .. "'")
		end
	end
	Sql = Sql .. table.concat(InsertValues, "','") .. "') on duplicate key update " .. table.concat(UpdateValues, ",")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end

--更新流失人数
function UpdateLostNum(self, PlatformID, HostID, Date, VipLevel, LostNum)
	local Sql = "update " .. PlatformID .. "_statics.tblVIP set LostNum = '" .. LostNum 
		.. "' where HostID = '" .. HostID .. "' and Date = '" .. Date .. "' and VipLevel = '" .. VipLevel .. "'"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end


