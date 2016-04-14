------------------------------------------
--$Id: modgmruledata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblGMCmdRules` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '指令名称',
  `Rule` varchar(256) NOT NULL DEFAULT '' COMMENT '指令规则',
  `Memo` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `OssFlag` int(11) DEFAULT '0' COMMENT '是否保留给运营操作，0：否，1：是',
  `RuleFormat` varchar(128) NOT NULL DEFAULT '' COMMENT '规则样式',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GM指令规则表'

--]]
module(...,package.seeall)

--获得GM指令
function Get(self, Options)
	local Where = ""
	if Options and Options.ID and Options.ID ~= "" then
		Where = Where .. " and ID = '" .. Options.ID .. "' "
	end
	if Options and Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name like '%" .. Options.Name .. "%' "
	end
	if Options and Options.OssFlag and Options.OssFlag ~= "" then
		Where = Where .. " and OssFlag = '" .. Options.OssFlag .. "' "
	end
	local Sql = "select * from smcs.tblGMCmdRules where Flag = 'true'" .. Where .. ""
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


RuleCol = {"Name", "Rule", "Memo", "OssFlag", "RuleFormat"}
-- 插入操作
function Insert(self, RuleInfo)
	local Sql = "insert into smcs.tblGMCmdRules (Name, Rule, Memo, OssFlag, RuleFormat) values( "
	local Values = {}
	local UpdateValues = {}
	for _, ColName in ipairs(RuleCol) do
		local Value = RuleInfo[ColName] and "'".. string.gsub(RuleInfo[ColName], "'", "\\'").."'" or "''"
		table.insert(Values, Value)
	end
	local ValueStr = table.concat(Values, ",")
	Sql = Sql .. ValueStr .. ")"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 更新操作
function Update(self, RuleInfo)
	local Sql = "update smcs.tblGMCmdRules set "
	local Values = {}
	for _, ColName in ipairs(RuleCol) do
		local Value = RuleInfo[ColName] and ColName .. "='".. string.gsub(RuleInfo[ColName], "'", "\\'") .."'" or "''"
		table.insert(Values, Value)
	end
	local ValueStr = table.concat(Values, ",")
	Sql = Sql .. ValueStr .. " where ID = '" .. RuleInfo.ID .. "'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 删除操作
function Delete(self, ID)
	local Sql = "update smcs.tblGMCmdRules set Flag = 'false' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

