------------------------------------------
--$Id: pay_order_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblUserPayDayStatics` (
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '充值日期', 
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号', 
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名', 
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID', 
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `TotalCashNum` DECIMAL(9,2) NOT NULL DEFAULT '0' COMMENT '总充值金额', 
  `TotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '总充值次数',
  `TotalGold` int(11) NOT NULL DEFAULT '0' COMMENT '总钻石数量', 
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位', 
  PRIMARY KEY (`Uid`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家日充值统计表' 

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
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
	
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.Urs and Options.Urs ~= "" then
		Where = Where .. " and Urs = '" .. Options.Urs .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblUserPayDayStatics " .. Where 
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end

--批量插入
function BatchInsert(self, PlatformID, Results)
	local Cols = {"Uid", "Date", "Urs", "Name", "HostID", "Currency", "TotalCashNum" , "TotalNum", "TotalGold"}
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
	local Sql = "insert into "..PlatformID.."_statics.tblUserPayDayStatics( "..table.concat(Cols, ",").. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") 
		.. ") on duplicate key update TotalCashNum = values(TotalCashNum), TotalNum = values(TotalNum),TotalGold = values(TotalGold)"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end




