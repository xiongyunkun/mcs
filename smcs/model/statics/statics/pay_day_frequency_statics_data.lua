------------------------------------------
--$Id: pay_order_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblPayDayFrequencyStatics` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `PayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值人数',
  `Pay1Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值1次人数',
  `Pay2Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值2次人数',
  `Pay3Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值3次人数',
  `Pay4Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值4次人数',
  `Pay5Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值5次人数',
  `Pay6Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值6-10次人数',
  `Pay11Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值11-20次人数',
  `Pay20Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值20次以上人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日充值频率统计表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
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
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblPayDayFrequencyStatics " .. Where 
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
			local Res = self:Get(PlatformID, Options)
			Results = self:MergeData(Results, Res)
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options.PlatformID, Options)
		Results = self:MergeData(Results, Res)
	end

	return Results
end

--合并数据
function MergeData(self, Results, PayInfoList)
	for _, Info in ipairs(PayInfoList) do
		if not Results[Info.Date] then
			Results[Info.Date] = Info
		else
			Results[Info.Date].PayUserNum = Results[Info.Date].PayUserNum + Info.PayUserNum
			Results[Info.Date].Pay1Num = Results[Info.Date].Pay1Num + Info.Pay1Num
			Results[Info.Date].Pay2Num = Results[Info.Date].Pay2Num + Info.Pay2Num
			Results[Info.Date].Pay3Num = Results[Info.Date].Pay3Num + Info.Pay3Num
			Results[Info.Date].Pay4Num = Results[Info.Date].Pay4Num + Info.Pay4Num
			Results[Info.Date].Pay5Num = Results[Info.Date].Pay5Num + Info.Pay5Num
			Results[Info.Date].Pay6Num = Results[Info.Date].Pay6Num + Info.Pay6Num
			Results[Info.Date].Pay11Num = Results[Info.Date].Pay11Num + Info.Pay11Num
			Results[Info.Date].Pay20Num = Results[Info.Date].Pay20Num + Info.Pay20Num
		end
	end
	return Results
end

--批量插入
function Insert(self, PlatformID, Results)
	local Cols = {"HostID", "Date", "PayUserNum" , "Pay1Num", 
		"Pay2Num", "Pay3Num", "Pay4Num", "Pay5Num", "Pay6Num", "Pay11Num", "Pay20Num"}
	local UpdateCols = {"PayUserNum" , "Pay1Num", 
		"Pay2Num", "Pay3Num", "Pay4Num", "Pay5Num", "Pay6Num", "Pay11Num", "Pay20Num"}
	local StrResults = {}
	for _, Col in ipairs(Cols) do
		local Value = Results[Col] or ""
		table.insert(StrResults, "'" .. Value .. "'")
	end
	local UpdateResults = {}
	for _, UpdateCol in ipairs(UpdateCols) do
		table.insert(UpdateResults, UpdateCol .. "=values(" .. UpdateCol .. ")")
	end
	--更新语句
	local Sql = "insert into "..PlatformID.."_statics.tblPayDayFrequencyStatics( "..table.concat(Cols, ",")
		.. ") values(" .. table.concat(StrResults, ",") .. ") on duplicate key update " 
		.. table.concat( UpdateResults, ", ")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end




