------------------------------------------
--$Id: statics_module_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblRunErroTime` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `LastStaticsTime` timestamp NULL DEFAULT NULL COMMENT '上一次统计时间',
  `UpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='错误日志统计时间表' 

--]]
module(...,package.seeall)

function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	local Sql = "select * from smcs.tblRunErroTime " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 插入更新
function Insert(self, Args)
	local Sql = "insert into smcs.tblRunErroTime(HostID, LastStaticsTime, UpdateTime) values('"
		.. Args.HostID .. "','" .. Args.LastStaticsTime .. "','" .. Args.UpdateTime 
		.. "') on duplicate key update Flag = 'true',LastStaticsTime = '" .. Args.LastStaticsTime .. "',UpdateTime='"
		.. Args.UpdateTime .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

