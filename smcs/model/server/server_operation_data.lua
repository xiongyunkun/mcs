------------------------------------------
--$Id: serveroperationdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblServerOperation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostIDs` varchar(512) NOT NULL DEFAULT '' COMMENT '服hostID',
  `OperationType` int(11) NOT NULL DEFAULT '1' COMMENT '操作类型,发布更新:1，开服:2，关服:3',
  `TimeType` int(11) NOT NULL DEFAULT '1' COMMENT '执行时间类型：1：定时执行，2：立即执行',
  `OperationTime` timestamp NULL DEFAULT NULL COMMENT '执行时间',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `IsOperated` int(11) NOT NULL DEFAULT '0' COMMENT '是否已操作,0:未操作，1：已操作',
  `Log` text COMMENT '反馈日志',
  `Memo` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`),
  KEY `index1` (`OperationTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='服务器操作记录表'
 

--]]
module(...,package.seeall)

--获得操作日志
function Get(self, Options)
	local Where = ""
	if Options and Options.ID and Options.ID ~= "" then
		Where = Where .. " and ID = '" .. Options.ID .. "' "
	end
	if Options and Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "' "
	end
	if Options and Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostIDs like '%" .. Options.HostID .. "%' "
	end
	if Options and Options.OperationType and Options.OperationType ~= "" then
		Where = Where .. " and OperationType = '" .. Options.OperationType .. "' "
	end
	if Options and Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "' "
	end
	if Options and Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and OperationTime >= '"..Options.StartTime.." 00:00:00' "
	end
	if Options and Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and OperationTime <= '"..Options.EndTime.." 23:59:59' "
	end
	if Options and Options.OperationTime and Options.OperationTime ~= "" then
		Where = Where .. " and OperationTime = '"..Options.OperationTime.."'"
	end
	if Options and Options.IsOperated and Options.IsOperated ~= "" then
		Where = Where .. " and IsOperated = '" .. Options.IsOperated .. "' "
	end
	local Sql = "select * from smcs.tblServerOperation where Flag = 'true'" .. Where .. " order by ID DESC"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


LogCol = {"PlatformID", "HostIDs", "OperationType", "TimeType", "OperationTime", "Operator", "IsOperated", "Memo"}
-- 插入更新操作
function Insert(self, LogInfo)
	local Sql = ""
	if LogInfo.ID and LogInfo.ID ~= "" then
		Sql = "update smcs.tblServerOperation set "
		local Values = {}
		for _, ColName in ipairs(LogCol) do 
			local Value = LogInfo[ColName]  and " = '" .. LogInfo[ColName] .. "'" or "''"
			Value = ColName .. Value
			table.insert(Values, Value)
		end
		--提交时间变为现在的时间
		local SubmitTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
		table.insert(Values, "SubmitTime = '" .. SubmitTime .. "'")
		local ValueStr = table.concat(Values, ",")
		Sql = Sql .. ValueStr .. " where ID = '" .. LogInfo.ID .. "'"
	else
		Sql = "insert into smcs.tblServerOperation (PlatformID, HostIDs, OperationType, TimeType, OperationTime, Operator, IsOperated, Memo) values( "
		local Values = {}
		for _, ColName in ipairs(LogCol) do
			local Value = LogInfo[ColName] and "'".. LogInfo[ColName].."'" or "''"
			table.insert(Values, Value)
		end
		local ValueStr = table.concat(Values, ",")
		Sql = Sql .. ValueStr .. ")"
	end
	DB:ExeSql(Sql)
	--需要返回ID，查表获得ID
	local ID = LogInfo.ID or ""
	if ID == "" then
		local Res = self:Get({OperationTime = LogInfo['OperationTime']})
		if Res and Res[1] then
			ID = Res[1]["ID"] or ""
		end
	end
	return ID
end

-- 删除操作
function Delete(self, ID)
	local Sql = "update smcs.tblServerOperation set Flag = 'false' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 更新操作日志
function UpdateLog(self, ID, Log)
	local Log = string.gsub(Log,"'","\\'") --单引号转义
	local Sql = "update smcs.tblServerOperation set Log = '"..Log.."', IsOperated = '1' where ID = '".. ID .. "'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

