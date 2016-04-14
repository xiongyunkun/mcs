------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblRetention` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `NewNum` int(11) NOT NULL DEFAULT '0' COMMENT '当然新增',
  `1Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '次日留存',
  `2Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '2日留存',
  `3Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '3日留存',
  `4Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '4日留存',
  `5Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '5日留存',
  `6Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '6日留存',
  `7Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '7日留存',
  `10Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '10日留存',
  `15Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '15日留存',
  `30Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '30日留存',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `LoginNum` int(11) DEFAULT '0' COMMENT '当日登陆人数',
  `13Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '13日留存',
  `29Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '29日留存',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留存率统计表'

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
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblRetention " .. Where .. " order by HostID, Date"
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
			self:MergeData(Res, Results)
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		self:MergeData(Res, Results)
	end
	return Results
end

function MergeData(self, OrgResults, TotalResults)
	for _, Info in ipairs(OrgResults) do
		if not TotalResults[Info.Date] then
			TotalResults[Info.Date] = Info
		else
			--需要合并数值，当日新增直接相加，每天的留存率还得重新计算
			local DateInfo = TotalResults[Info.Date]  
			DateInfo["1Days"] = self:GetRetRate(DateInfo, Info, "1Days")
			DateInfo["2Days"] = self:GetRetRate(DateInfo, Info, "2Days")
			DateInfo["3Days"] = self:GetRetRate(DateInfo, Info, "3Days")
			DateInfo["4Days"] = self:GetRetRate(DateInfo, Info, "4Days")
			DateInfo["5Days"] = self:GetRetRate(DateInfo, Info, "5Days")
			DateInfo["6Days"] = self:GetRetRate(DateInfo, Info, "6Days")
			DateInfo["7Days"] = self:GetRetRate(DateInfo, Info, "7Days")
			DateInfo["10Days"] = self:GetRetRate(DateInfo, Info, "10Days")
			DateInfo["13Days"] = self:GetRetRate(DateInfo, Info, "13Days")
			DateInfo["15Days"] = self:GetRetRate(DateInfo, Info, "15Days")
			DateInfo["29Days"] = self:GetRetRate(DateInfo, Info, "29Days")
			DateInfo["30Days"] = self:GetRetRate(DateInfo, Info, "30Days")
			DateInfo.NewNum = DateInfo.NewNum + Info.NewNum
			DateInfo.LoginNum = DateInfo.LoginNum + Info.LoginNum
			TotalResults[Info.Date] = DateInfo
		end
	end
end

--算除数
function GetRetRate(self, OrgDateInfo, NewDateInfo, Index)
	local NewNum = OrgDateInfo.NewNum + NewDateInfo.NewNum
	if NewNum == 0 then
		return 0
	else
		local OrgRetNum = OrgDateInfo[Index] * OrgDateInfo.NewNum * 100
		local NewRetNum = NewDateInfo[Index] * NewDateInfo.NewNum * 100
		local C = math.floor((OrgRetNum + NewRetNum)/NewNum)
		C = C/100
		return C
	end
end

local Cols = {"LoginNum","NewNum","1Days", "2Days", "3Days", "4Days","5Days","6Days", "7Days", "10Days", 
	"13Days", "15Days", "29Days", "30Days"}

function Insert(self, PlatformID, HostID, Date, RetInfo)
	local Sql = "insert into " .. PlatformID .. "_statics.tblRetention(PlatformID, HostID, Date,"..table.concat(Cols, ",")
			.. ") values('" .. PlatformID .. "','".. HostID .. "','" .. Date .. "','" 
	local InsertValues = {}
	local UpdateValues = {}
	for _, Col in ipairs(Cols) do
		table.insert(InsertValues, RetInfo[Col] or 0)
		if RetInfo[Col] then
			table.insert(UpdateValues, Col .. "= '" .. RetInfo[Col] .. "'")
		end
	end
	Sql = Sql .. table.concat(InsertValues, "','") .. "') on duplicate key update " .. table.concat(UpdateValues, ",")
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


