------------------------------------------
--$Id: key_value_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblKeyValue` (
   `Key` varchar(32) NOT NULL DEFAULT '' COMMENT 'Key值', 
   `Value` varchar(32) NOT NULL DEFAULT '' COMMENT 'Value值',  
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`Key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='KV记录表' 

--]]
module(...,package.seeall)

function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.Key and Options.Key ~= "" then
		Where = Where .. " and `Key` = '" .. Options.Key .. "'"
	end
	local Sql = "select * from smcs.tblKeyValue " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 插入更新
function Insert(self, Args)
	local Sql = "insert into smcs.tblKeyValue(`Key`, `Value`) values('"
		.. Args.Key .. "','" .. Args.Value .. "') on duplicate key update Flag = 'true',`Value` = '" 
		.. Args.Value .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

