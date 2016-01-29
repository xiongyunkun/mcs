------------------------------------------
--$Id: platformdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
REATE TABLE `tblPlatform` (
  `PlatformID` varchar(16) NOT NULL COMMENT '平台ID',
  `PlatformName` varchar(64) NOT NULL DEFAULT '' COMMENT '平台名称',
  `Sort` int(11) default '1' COMMENT '排序',
  `Status` tinyint(4) default '1' COMMENT '状态：1-可用；2-停用',
  `ServerIDRange` varchar(32) NOT NULL DEFAULT '' COMMENT '服ID范围',
  `Memo` varchar(128) NOT NULL DEFAULT '' COMMENT '备注',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `W3Url` varchar(64) NOT NULL DEFAULT '' COMMENT '3w地址',
  `SDKID` int(11) DEFAULT '0' COMMENT '平台SDKID',
  PRIMARY KEY (`PlatformID`)
 ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='平台信息表' ;

--]]
module(...,package.seeall)

--获得所有平台
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.SDKID and Options.SDKID ~= "" then
		Where = Where .. " and SDKID = '" .. Options.SDKID .. "'"
	end
	local Sql = "select * from smcs.tblPlatform " .. Where .. " order by Sort ASC"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


