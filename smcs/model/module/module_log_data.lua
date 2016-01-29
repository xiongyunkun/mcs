------------------------------------------
--$Id: platformdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblModuleLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '模块人员',
  `Log` varchar(256) NOT NULL DEFAULT '' COMMENT '操作记录',
  `LogTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块操作日志表'

--]]
module(...,package.seeall)

--获得操作日志
function Get(self, Options)
	local Where = ""
	if Options and Options.Module and Options.Module ~= "" then
		Where = Where .. " and Module = '" .. Options.Module .. "' "
	end
	if Options and Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "' "
	end
	if Options and Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and LogTime >= '"..Options.StartTime.." 00:00:00' "
	end
	if Options and Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and LogTime <= '"..Options.EndTime.." 23:59:59' "
	end
	local Sql = "select * from smcs.tblModuleLog where Flag = 'true'" .. Where .. " order by ID DESC"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


LogCol = {"Module", "Operator", "Log"}
-- 插入操作
function Insert(self, LogInfo)
	local Sql = "insert into smcs.tblModuleLog (Module, Operator, Log) values( "
	local Values = {}
	for _, ColName in ipairs(LogCol) do
		local Value = LogInfo[ColName] and "'".. LogInfo[ColName].."'" or "''"
		table.insert(Values, Value)
	end
	local ValueStr = table.concat(Values, ",")
	Sql = Sql .. ValueStr .. ")"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 删除操作
function Delete(self, ID)
	local Sql = "update smcs.tblModuleLog set Flag = 'false' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

