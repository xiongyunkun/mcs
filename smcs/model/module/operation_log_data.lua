------------------------------------------
--$Id: platformdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblOperationLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人员',
  `Log` varchar(256) NOT NULL DEFAULT '' COMMENT '操作记录',
  `System` tinyint NOT NULL DEFAULT '1' COMMENT '系统,1:管理后台,2:oss',
  `LogTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`),
  KEY `index1` (`LogTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表' 

--]]
module(...,package.seeall)

--获得操作日志
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options and Options.Module and Options.Module ~= "" then
		Where = Where .. " and Module = '" .. Options.Module .. "' "
	end
	if Options and Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "' "
	end
	if Options and Options.System and Options.System ~= "" then
		Where = Where .. " and System = '" .. Options.System .. "' "
	end
	if Options and Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and LogTime >= '"..Options.StartTime.." 00:00:00' "
	end
	if Options and Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and LogTime <= '"..Options.EndTime.." 23:59:59' "
	end
	local Sql = "select * from smcs.tblOperationLog " .. Where .. " order by ID DESC"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


LogCol = {"Module", "Operator", "Log", "System"}
-- 插入操作
function Insert(self, LogInfo)
	local Sql = "insert into smcs.tblOperationLog (Module, Operator, Log, System) values( "
	local Values = {}
	for _, ColName in ipairs(LogCol) do
		local ColValue = string.gsub(LogInfo[ColName], "'", "\\'")
		local Value = LogInfo[ColName] and "'".. ColValue .."'" or "''"
		table.insert(Values, Value)
	end
	local ValueStr = table.concat(Values, ",")
	Sql = Sql .. ValueStr .. ")"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 删除操作
function Delete(self, ID)
	local Sql = "update smcs.tblOperationLog set Flag = 'false' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

