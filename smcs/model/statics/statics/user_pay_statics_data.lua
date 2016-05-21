------------------------------------------
--$Id: pay_order_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblUserPayStatics` (
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `TotalCashNum` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总充值金额',
  `TotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '总充值次数',
  `TotalGold` int(11) NOT NULL DEFAULT '0' COMMENT '总钻石数量',
  `MinCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '单次最小充值金额',
  `MaxCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '单次最大充值金额',
  `FirstCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '首充充值金额',
  `FirstCashTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首充时间',
  `LastCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '最后充值金额',
  `LastCashTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后充值时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`Uid`),
  KEY `index1` (`Urs`),
  KEY `index2` (`FirstCashTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家充值统计表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.Urs and Options.Urs ~= "" then
		Where = Where .. " and Urs = '" .. Options.Urs .. "'"
	end
	if Options.StartFirstCashTime and Options.StartFirstCashTime ~= "" then
		Where = Where .. " and FirstCashTime >= '" .. Options.StartFirstCashTime .. "'"
	end
	if Options.EndFirstCashTime and Options.EndFirstCashTime ~= "" then
		Where = Where .. " and FirstCashTime <= '" .. Options.EndFirstCashTime .. "'"
	end
	if Options.OrderCol and Options.OrderCol ~= "" then
		Where = Where .. " order by " .. Options.OrderCol
	end
	local Sql = "select * from "..PlatformID.."_statics.tblUserPayStatics " .. Where 
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end

--批量插入
function BatchInsert(self, PlatformID, Results)
	local Cols = {"Uid", "Urs", "Name", "HostID", "Currency", "TotalCashNum" , "TotalNum", "TotalGold",
			"MinCashNum", "MaxCashNum", "FirstCashNum", "FirstCashTime", "LastCashNum", "LastCashTime"}
	local StrResults = {}
	for _, Result  in pairs(Results) do
		local List = {}
		for _, Col in ipairs(Cols) do
			local Value = Result[Col] or ""
			table.insert(List, "'" .. Value .. "'")
		end
		local StrValue = table.concat(List, ",")
		table.insert(StrResults, StrValue)
	end
	--更新语句
	local UpdateValues = {}
	table.insert(UpdateValues, "TotalCashNum = TotalCashNum + values(TotalCashNum)")
	table.insert(UpdateValues, "TotalNum = TotalNum + values(TotalNum)")
	table.insert(UpdateValues, "TotalGold = TotalGold + values(TotalGold)")
	table.insert(UpdateValues, "MinCashNum = least(MinCashNum, values(MinCashNum))")
	table.insert(UpdateValues, "MaxCashNum = greatest(MaxCashNum, values(MaxCashNum))")
	table.insert(UpdateValues, "LastCashNum = values(LastCashNum)")
	table.insert(UpdateValues, "LastCashTime = values(LastCashTime)")
	table.insert(UpdateValues, "Name = values(Name)")
	-- 采用批量插入的方式
	local Sql = "insert into "..PlatformID.."_statics.tblUserPayStatics( "..table.concat(Cols, ",").. ") values("
	Sql = Sql .. table.concat(StrResults, "),(") .. ") on duplicate key update " .. table.concat( UpdateValues, ", ")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end

--获得该天的首冲人数
function GetFirstCashNum(self, PlatformID, HostID, Date)
	local Options = {
		HostID = HostID,
		StartFirstCashTime = Date .. " 00:00:00",
		EndFirstCashTime = Date .. " 23:59:59",
	}
	local Res = self:Get(PlatformID, Options)
	local Num =  Res and #Res or 0
	return Num
end

function GetPayRank(self, Options)
	local Results = {}
	if not Options.PlatformID or Options.PlatformID == "" then
		local PlatformMap = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(PlatformMap) do
			Options.PlatformID = PlatformID
			local Res = self:Get(Options.PlatformID, Options)
			for _, Info in ipairs(Res) do
				Info.PlatformID = Options.PlatformID
				Info.TotalCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.TotalCashNum)
				Info.MinCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.MinCashNum)
				Info.MaxCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.MaxCashNum)
				Info.FirstCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.FirstCashNum)
				Info.LastCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.LastCashNum)
				table.insert(Results, Info)
			end
			table.sort(Results, function(A, B) return A.TotalCashNum > B.TotalCashNum end)
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options.PlatformID, Options) --已经是排好序的，直接返回
		for _, Info in ipairs(Res) do
			Info.PlatformID = Options.PlatformID
			Info.TotalCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.TotalCashNum)
			Info.MinCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.MinCashNum)
			Info.MaxCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.MaxCashNum)
			Info.FirstCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.FirstCashNum)
			Info.LastCashNum = CommonFunc.TransformCurrency(Info.Currency, Info.LastCashNum)
			table.insert(Results, Info)
		end
	end
	return Results
end





