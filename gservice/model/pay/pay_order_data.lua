------------------------------------------
--$Id: pay_order_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblPayOrder` (
  `OrderID` varchar(32) NOT NULL DEFAULT '' COMMENT '订单ID', 
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',  
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',  
  `Level` int(11) NOT NULL DEFAULT '1' COMMENT '玩家等级', 
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',  
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `CashNum` DECIMAL(9,2) NOT NULL DEFAULT '0' COMMENT '货币数量', 
  `PayChannel` varchar(32) NOT NULL DEFAULT '' COMMENT '充值渠道',
  `Gold` int(11) NOT NULL DEFAULT '0' COMMENT '钻石数量',  
  `Time` timestamp NOT NULL DEFAULT  '0000-00-00 00:00:00'  COMMENT '充值时间',
  `Status` tinyint NOT NULL DEFAULT '0' COMMENT '充值状态，-1:充值失败,0:已发送充值请求,1:已充值', 
  `LastUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近更新时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',  
  PRIMARY KEY (`OrderID`),
  KEY `index1` (`Urs`),
  KEY `index2` (`Uid`),
  KEY `index3` (`LastUpdateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值订单表' 

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
	if Options.OrderID and Options.OrderID ~= "" then
		Where = Where .. " and OrderID = '" .. Options.OrderID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.Urs and Options.Urs ~= "" then
		Where = Where .. " and Urs = '" .. Options.Urs .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblPayOrder " .. Where 
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end



--插入数据
function Insert(self, PlatformID, Args)
	local InsertCols = {"OrderID", "Urs", "Uid", "Name", "Level","HostID", "Currency", "CashNum" ,  
		"PayChannel", "Gold", "Time", "Status"}
	local Sql = "insert into "..PlatformID.."_statics.tblPayOrder( "..table.concat(InsertCols, ",").. ") values("
	local Values = {}
	for _, Col in ipairs(InsertCols) do
		local Value = Args[Col] and "'" .. Args[Col] .. "'" or "''"
		table.insert(Values, Value)
	end
	Sql = Sql .. table.concat(Values, ",") .. ")"
	DB:ExeSql(Sql)
end

--更改状态
function UpdateStatus(self, PlatformID, OrderID, Status)
	local NowTime = os.date("%Y-%m-%d %H:%M:%S", os.time())
	local Sql = "update "..PlatformID.."_statics.tblPayOrder set Status = '" .. Status
		.. "', LastUpdateTime='" .. NowTime .. "' where OrderID = '" ..OrderID .. "'"
	DB:ExeSql(Sql)
end

--判断订单是否重复
function CheckDuplicate(self, PlatformID, OrderID)
	local Sql = "select * from " .. PlatformID .. "_statics.tblPayOrder where OrderID = '" .. OrderID .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if Res and #Res > 0 then
		return true
	else
		return false
	end
end

--更新充值数据
function UpdatePayInfo(self, PlatformID, OrderID, Info)
	local NowTime = os.date("%Y-%m-%d %H:%M:%S", os.time())
	local UpdateCols = {"Status = '", Info.Status, "', Uid='", Info.Uid, "', Name='", Info.Name,
		"', Urs='", Info.Urs, "', LastUpdateTime='", NowTime} --TODO:删除了Level，后面再加
	local Sql = "update "..PlatformID.."_statics.tblPayOrder set " .. table.concat( UpdateCols, "")
		.. "' where OrderID = '" ..OrderID .. "'"
	DB:ExeSql(Sql)
end

