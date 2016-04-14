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
  PRIMARY KEY (`PlatformID`)
 ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='平台信息表' ;

--]]
module(...,package.seeall)

--获得所有平台
function GetPlatform(self, PlatformID)
	local Where = ""
	if PlatformID and PlatformID ~= "" then
		Where = " and PlatformID = '" .. PlatformID .. "'"
	end
	local Sql = "select * from smcs.tblPlatform where Flag = 'true'" .. Where .. " order by Sort ASC"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


PlatformCol = {"PlatformID", "PlatformName", "Sort", "Status", "ServerIDRange", "Memo"}
-- 插入更新操作
function UpdatePlatform(self, PlatformInfo)
	local Sql = "insert into smcs.tblPlatform (PlatformID, PlatformName, Sort, Status, ServerIDRange, Memo) values( "
	local Values = {}
	local UpdateValues = {}
	for _, ColName in ipairs(PlatformCol) do
		local Value = PlatformInfo[ColName] and "'".. PlatformInfo[ColName].."'" or "''"
		table.insert(Values, Value)
		if ColName ~= "PlatformID" then --主键不能更新
			table.insert(UpdateValues, ColName.. " = " .. Value)
		end
	end
	table.insert(UpdateValues, "Flag = 'true'") -- 最后插入标志位
	local ValueStr = table.concat(Values, ",")
	local UpdateStr = table.concat(UpdateValues, ",")
	Sql = Sql .. ValueStr .. ") on duplicate key update " .. UpdateStr
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 删除操作
function DelPlatform(self, PlatformID)
	local Sql = "update smcs.tblPlatform set Flag = 'false' where PlatformID = '"..PlatformID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

