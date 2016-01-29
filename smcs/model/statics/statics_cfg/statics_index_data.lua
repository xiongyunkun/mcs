------------------------------------------
--$Id: statics_index_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblStaticsIndex` (
  `IndexName` varchar(32) NOT NULL COMMENT '统计指标',
  `Frequency` int(11) DEFAULT '0' COMMENT '统计频率，以分钟为单位',
  `LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上一次统计时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`IndexName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计指标配置表'

--]]
module(...,package.seeall)

function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.IndexName and Options.IndexName ~= "" then
		Where = Where .. " and IndexName = '" .. Options.IndexName .. "'"
	end
	local Sql = "select * from smcs.tblStaticsIndex " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 插入更新
function Update(self, Params)
	local Sql = "insert into smcs.tblStaticsIndex(IndexName, Frequency, LastTime) values"
	Sql = Sql .. "('" .. Params.IndexName .. "','" .. Params.Frequency .. "','" .. Params.LastTime .. "')"
	Sql = Sql .. " on duplicate key update Frequency = '" .. Params.Frequency .. "', LastTime = '" .. Params.LastTime .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--更新上一次统计时间
function UpdateTime(self, IndexName, Time)
	local Sql = "update smcs.tblStaticsIndex set LastTime = '" .. Time .. "' where IndexName = '" .. IndexName .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

