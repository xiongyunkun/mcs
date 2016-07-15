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
  `CashNum` DECIMAL(9,2) NOT NULL DEFAULT '0' COMMENT '货币数量', 
  `Gold` int(11) NOT NULL DEFAULT '0' COMMENT '钻石数量',  
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',  
  PRIMARY KEY (`Uid`),
  KEY `index1` (`Urs`)
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
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.HostIDs and Options.HostIDs ~= "" then
		Where = Where .. " and HostID in ('" .. table.concat(Options.HostIDs, "','") .. "')"
	end
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.Urs and Options.Urs ~= "" then
		Where = Where .. " and Urs = '" .. Options.Urs .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblUserPayStatics " .. Where 
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end





