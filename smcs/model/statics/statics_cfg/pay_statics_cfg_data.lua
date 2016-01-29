------------------------------------------
--$Id: statics_index_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblPayStaticsCfg` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `OrderIDs` varchar(256) NOT NULL DEFAULT '' COMMENT '上一次统计时间的订单ID',
  `StaticsTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上一次统计时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`, `HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值统计配置表'

--]]
module(...,package.seeall)

function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	local Sql = "select * from smcs.tblPayStaticsCfg " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 插入更新
function Update(self, Params)
	local Sql = "insert into smcs.tblPayStaticsCfg(PlatformID, HostID, OrderIDs, StaticsTime) values"
		.. "('" .. Params.PlatformID .. "','" .. Params.HostID .. "','" .. Params.OrderIDs 
		.. "','" .. Params.StaticsTime .. "')"
		.. " on duplicate key update OrderIDs = '" .. Params.OrderIDs .. "', StaticsTime = '" 
		.. Params.StaticsTime .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


