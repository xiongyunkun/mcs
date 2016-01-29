------------------------------------------
--$Id: modgmoperationdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblGMOperations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostIDs` varchar(512) NOT NULL DEFAULT '' COMMENT '服hostID',
  `RuleID` int NOT NULL COMMENT '指令规则ID',
  `GsID` int NOT NULL DEFAULT '-1' COMMENT '执行进程ID',
  `GMValues` varchar(128) NOT NULL DEFAULT '' COMMENT '指令值',
  `TimeType` int(11) NOT NULL DEFAULT '1' COMMENT '执行时间类型：1：定时执行，2：立即执行',
  `OperationTime` timestamp NULL DEFAULT NULL COMMENT '执行时间',
  `TransID` varchar(32) NOT NULL DEFAULT '' COMMENT '流水号',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `Status` int NOT NULL DEFAULT '0' COMMENT '状态，0：编辑中，1：已提交，2：已执行',
  `Result` varchar(256) NOT NULL DEFAULT '' COMMENT '执行结果',
  `Memo` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GM指令操作列表'


--]]
module(...,package.seeall)

--获得GM指令
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options and Options.ID and Options.ID ~= "" then
		Where = Where .. " and ID = '" .. Options.ID .. "' "
	end
	if Options and Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "' "
	end
	if Options and Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostIDs like '%" .. Options.HostID .. "%' "
	end
	if Options and Options.RuleID and Options.RuleID ~= "" then
		Where = Where .. " and RuleID = '" .. Options.RuleID .. "' "
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
	if Options and Options.TransID and Options.TransID ~= "" then
		Where = Where .. " and TransID = '" .. Options.TransID .. "' "
	end
	if Options and Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "' "
	end
	local Sql = "select * from smcs.tblGMOperations " .. Where .. ""
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


OperationCol = {"PlatformID", "HostIDs", "RuleID", "GsID", "GMValues", "OperationTime", "TransID", "Operator", "Memo"}
-- 插入操作
function Insert(self, OperationInfo)
	local Sql = "insert into smcs.tblGMOperations (PlatformID, HostIDs, RuleID, GsID, GMValues, OperationTime, TransID, Operator, Memo) values( "
	local Values = {}
	if not OperationInfo.TransID and OperationInfo.TransID == "" then
		OperationInfo.TransID = CommonFunc.GenerateTransID(OperationInfo.OperationTime)
	end
	for _, ColName in ipairs(OperationCol) do
		local Value = OperationInfo[ColName] and "'".. string.gsub(OperationInfo[ColName], "'", "\\'").."'" or "''"
		table.insert(Values, Value)
	end
	local ValueStr = table.concat(Values, ",")
	Sql = Sql .. ValueStr .. ")"
	local Res, Err = DB:ExeSql(Sql)
	-- 返回ID
	local RowInfo = self:Get({TransID = OperationInfo.TransID})
	if RowInfo and RowInfo[1] and RowInfo[1]["ID"] then
		return RowInfo[1]["ID"]
	else
		return nil
	end
end

-- 更新操作
function Update(self, OperationInfo)
	local Sql = "update smcs.tblGMOperations set "
	local Values = {}
	OperationInfo.TransID = CommonFunc.GenerateTransID(OperationInfo.OperationTime)
	for _, ColName in ipairs(OperationCol) do
		local Value = OperationInfo[ColName] and ColName .. "='".. string.gsub(OperationInfo[ColName], "'", "\\'") .."'" or "''"
		table.insert(Values, Value)
	end
	local ValueStr = table.concat(Values, ",")
	Sql = Sql .. ValueStr .. " where ID = '" .. OperationInfo.ID .. "'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 更新状态
function UpdateStatus(self, ID, Status)
	local Sql = "update smcs.tblGMOperations set Status = '" .. Status .."' where ID = '" .. ID .."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

--更新执行结果
function UpdateResult(self, ID, Result)
	local Sql = "update smcs.tblGMOperations set Result = '" .. Result .. "' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

-- 删除操作
function Delete(self, ID)
	local Sql = "update smcs.tblGMOperations set Flag = 'false' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end


