------------------------------------------
--$Id: money_data.lua 78530 2015-11-09 09:44:11Z jm $
------------------------------------------
--[[
CREATE TABLE `tblMoney` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Channel` varchar(64) NOT NULL DEFAULT '' COMMENT '渠道',
  `StaticsType` tinyint DEFAULT '1' COMMENT '统计类型,1:消耗,2:产出',
  `Value` int(11) NOT NULL DEFAULT '0' COMMENT '金钱值',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Uids` varchar(20000) DEFAULT '' COMMENT 'uid列表',
  `ConsumeNum` int(11) DEFAULT '0' COMMENT '消费次数',
   PRIMARY KEY (`PlatformID`,`HostID`,`Date`, `Channel`,`StaticsType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金钱统计表'

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
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	if Options.Channel and Options.Channel ~= "" then
		Where = Where .. " and Channel = '" .. Options.Channel .. "'"
	end
	
	if Options.StaticsType and Options.StaticsType ~= "" then
		Where = Where .. " and StaticsType = '" .. Options.StaticsType .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblMoney " .. Where .. " order by HostID, Date"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

--获得元宝类型与渠道的对应关系
function MergeChannelMap(self, PlatformID, StaticsType, MoneyChannels)
	local Sql = "select distinct Channel from " .. PlatformID .. "_statics.tblMoney where StaticsType = '" .. StaticsType .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then
		return MoneyChannels
	end
	for _, ChannelInfo in ipairs(Res) do
		MoneyChannels[ChannelInfo.Channel] = {}
	end
	return MoneyChannels
end

function GetStatics(self, StaticsType, Options)
	--先判断有没有选择平台，如果没有，则是选择全部平台
	local Results = {}
	local TotalValue = 0
	Options.StaticsType = CommonData.GoldStaticsTypes[StaticsType]
	if not Options.PlatformID or Options.PlatformID == "" then
		local PlatformMap = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(PlatformMap) do
			Results = self:MergeChannelMap(PlatformID, StaticsType, Results)
			Options.PlatformID = PlatformID
			local Res = self:Get(Options)
			Results, TotalValue = self:MergeData(Results, Res, TotalValue)
		end
		Options.PlatformID = nil
	else
		Results = self:MergeChannelMap(Options.PlatformID, StaticsType, Results)
		local Res = self:Get(Options)
		Results, TotalValue = self:MergeData(Results, Res, TotalValue)
	end
	Options.StaticsType = nil -- 清空
	return Results, TotalValue
end

function MergeData(self, Results, MoneyRes, TotalValue)
	local TotalValue = TotalValue
	for _, MoneyInfo in ipairs(MoneyRes) do
		local Channel = MoneyInfo.Channel
		local Value = MoneyInfo.Value
		local ConsumeNum = MoneyInfo.ConsumeNum
		local Uids = MoneyInfo.Uids
		TotalValue = TotalValue + Value
		if not Results[Channel] then
			Results[Channel] = MoneyInfo
		else
			Results[Channel].Value = Results[Channel].Value + Value
			Results[Channel].ConsumeNum = Results[Channel].ConsumeNum + ConsumeNum
			Results[Channel].Uids = Results[Channel].Uids .. "," .. Uids
		end
	end
	return Results, TotalValue
end

function Insert(self, PlatformID, HostID, Date, Channel, StaticsType, Value, Uids, ConsumeNum)
	local Sql = "insert into " .. PlatformID .. "_statics.tblMoney(PlatformID, HostID, Date, Channel, StaticsType, Value,"
			.. "Uids, ConsumeNum) values('" .. PlatformID .. "','".. HostID .. "','" .. Date .. "','" 
			.. Channel .. "','" .. StaticsType .. "','" .. Value 
			.. "','" .. Uids .. "','" .. ConsumeNum .. "') on duplicate key update Value = '" .. Value 
			.. "', Uids = '".. Uids .. "', ConsumeNum = '".. ConsumeNum .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end
