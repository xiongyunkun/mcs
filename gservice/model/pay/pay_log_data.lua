------------------------------------------
--$Id: pay_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblPayLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrderID` varchar(32) NOT NULL DEFAULT '' COMMENT '订单ID',
  `Args` varchar(256) NOT NULL DEFAULT '' COMMENT '回调参数',
  `Result` varchar(32) NOT NULL DEFAULT '' COMMENT '返回结果', 
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`ID`),
  KEY `index1` (`OrderID`),
  KEY `index2` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值日志表'  

--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where 1=1 "
	if Options.OrderID and Options.OrderID ~= "" then
		Where = Where .. " and OrderID = '" .. Options.OrderID .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..Options.PlatformID.."_log.tblPayLog" .. Where 
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end



--插入数据
function Insert(self, PlatformID, Args)
	local InsertCols = {"OrderID", "Args", "Result"}
	local Sql = "insert into "..PlatformID.."_log.tblPayLog" .. "("..table.concat(InsertCols, ",").. ") values("
	local Values = {}
	for _, Col in ipairs(InsertCols) do
		local Value = Args[Col] and "'" .. Args[Col] .. "'" or "''"
		table.insert(Values, Value)
	end
	Sql = Sql .. table.concat(Values, ",") .. ")"
	DB:ExeSql(Sql)
end




