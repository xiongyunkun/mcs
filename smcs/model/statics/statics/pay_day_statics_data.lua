------------------------------------------
--$Id: pay_order_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblPayDayStatics` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `CashNum` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `PayGold` int(11) NOT NULL DEFAULT '0' COMMENT '充值钻石数量',
  `PayNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值次数',
  `PayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值人数',
  `FirstPayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '首冲人数',
  `GoldConsume` int(11) NOT NULL DEFAULT '0' COMMENT '非绑钻钻石消耗数',
  `GoldProduce` int(11) NOT NULL DEFAULT '0' COMMENT '非绑钻钻石产出数',
  `TotalCashNum` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '总充值金额',
  `TotalPayGold` bigint(20) NOT NULL DEFAULT '0' COMMENT '总充值钻石',
  `TotalGoldProduce` bigint(20) NOT NULL DEFAULT '0' COMMENT '总非绑钻钻石产出数',
  `TotalGoldConsume` bigint(20) NOT NULL DEFAULT '0' COMMENT '总非绑钻钻石消耗数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `TotalCreditGoldProduce` bigint(20) NOT NULL DEFAULT '0' COMMENT '总绑钻钻石产出数',
  `TotalCreditGoldConsume` bigint(20) NOT NULL DEFAULT '0' COMMENT '总绑钻钻石消耗数',
  `CreditGoldProduce` int(11) NOT NULL DEFAULT '0' COMMENT '绑钻钻石产出数',
  `CreditGoldConsume` int(11) NOT NULL DEFAULT '0' COMMENT '绑钻钻石消耗数',
  PRIMARY KEY (`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日充值统计表'

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
	local Sql = "select * from "..PlatformID.."_statics.tblPayDayStatics " .. Where
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
			Results[Info.Date].CashNum = Results[Info.Date].CashNum + Info.CashNum
			Results[Info.Date].PayGold = Results[Info.Date].PayGold + Info.PayGold
			Results[Info.Date].PayNum = Results[Info.Date].PayNum + Info.PayNum
			Results[Info.Date].PayUserNum = Results[Info.Date].PayUserNum + Info.PayUserNum
			Results[Info.Date].FirstPayUserNum = Results[Info.Date].FirstPayUserNum + Info.FirstPayUserNum
			Results[Info.Date].GoldConsume = Results[Info.Date].GoldConsume + Info.GoldConsume
			Results[Info.Date].GoldProduce = Results[Info.Date].GoldProduce + Info.GoldProduce
			Results[Info.Date].TotalPayGold = Results[Info.Date].TotalPayGold + Info.TotalPayGold
			Results[Info.Date].TotalGoldProduce = Results[Info.Date].TotalGoldProduce + Info.TotalGoldProduce
			Results[Info.Date].TotalCashNum = Results[Info.Date].TotalCashNum + Info.TotalCashNum
			Results[Info.Date].TotalGoldConsume = Results[Info.Date].TotalGoldConsume + Info.TotalGoldConsume
			Results[Info.Date].TotalCreditGoldProduce = Results[Info.Date].TotalCreditGoldProduce + Info.TotalCreditGoldProduce
			Results[Info.Date].TotalCreditGoldConsume = Results[Info.Date].TotalCreditGoldConsume + Info.TotalCreditGoldConsume
			Results[Info.Date].CreditGoldProduce = Results[Info.Date].CreditGoldProduce + Info.CreditGoldProduce
			Results[Info.Date].CreditGoldConsume = Results[Info.Date].CreditGoldConsume + Info.CreditGoldConsume
		end
	end
	return Results
end

--批量插入
function Insert(self, PlatformID, Results)
	local Cols = {"HostID", "Date", "Currency", "CashNum", "PayGold", "PayNum", "PayUserNum" , "FirstPayUserNum", 
		"GoldConsume", "GoldProduce", "TotalCashNum", "TotalPayGold", "TotalGoldProduce", "TotalGoldConsume",
		"TotalCreditGoldProduce", "TotalCreditGoldConsume", "CreditGoldProduce", "CreditGoldConsume"}
	local UpdateCols = {"CashNum", "PayGold", "PayNum", "PayUserNum" , "FirstPayUserNum", 
		"GoldConsume", "GoldProduce", "TotalCashNum", "TotalPayGold", "TotalGoldProduce", "TotalGoldConsume",
		"TotalCreditGoldProduce", "TotalCreditGoldConsume", "CreditGoldProduce", "CreditGoldConsume"}
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
	local Sql = "insert into "..PlatformID.."_statics.tblPayDayStatics( "..table.concat(Cols, ",").. ") values("
		.. table.concat(StrResults, ",") .. ") on duplicate key update " .. table.concat( UpdateResults, ", ")
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end




