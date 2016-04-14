------------------------------------------
--$Id: server_merge_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblServerMerge` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `SrcHostIDs` varchar(512) NOT NULL DEFAULT '' COMMENT '源服HostID列表',
  `ToHostID` int(11) NOT NULL DEFAULT '0' COMMENT '目标服HostID',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态值，0:未发布，1:已发布',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`),
  KEY `index1` (`SubmitTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器合服记录表'

--]]

module(...,package.seeall)

--获得操作日志
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options and Options.ID and Options.ID ~= "" then
		Where = Where .. " and ID = '" .. Options.ID .. "' "
	end
	if Options and Options.NotID and Options.NotID ~= "" then
		Where = Where .. " and ID != '" .. Options.NotID .. "' " --不等于
	end 
	if Options and Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "' "
	end
	if Options and Options.SrcHostID and Options.SrcHostID ~= "" then
		Where = Where .. " and SrcHostIDs like '%" .. Options.SrcHostID .. "%' "
	end
	if Options and Options.ToHostID and Options.ToHostID ~= "" then
		Where = Where .. " and ToHostID = '" .. Options.ToHostID .. "' "
	end
	if Options and Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "' "
	end
	if Options and Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and SubmitTime >= '"..Options.StartTime.." 00:00:00' "
	end
	if Options and Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and SubmitTime <= '"..Options.EndTime.." 23:59:59' "
	end
	if Options and Options.Status and Options.Status ~= "" then
		Where = Where .. " and Status = '" .. Options.Status .. "' "
	end
	if not Options.ASC then
		Where = Where .. " order by ID DESC"
	end
	local Sql = "select * from smcs.tblServerMerge " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


LogCol = {"PlatformID", "SrcHostIDs", "ToHostID", "Operator"}
-- 插入更新操作
function Insert(self, LogInfo)
	local Sql = ""
	if LogInfo.ID and LogInfo.ID ~= "" then
		Sql = "update smcs.tblServerMerge set "
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
		Sql = "insert into smcs.tblServerMerge (PlatformID, SrcHostIDs, ToHostID, Operator) values( "
		local Values = {}
		for _, ColName in ipairs(LogCol) do
			local Value = LogInfo[ColName] and "'".. LogInfo[ColName].."'" or "''"
			table.insert(Values, Value)
		end
		local ValueStr = table.concat(Values, ",")
		Sql = Sql .. ValueStr .. ")"
	end
	local Res, Err = DB:ExeSql(Sql)
	
end

-- 删除操作
function Delete(self, ID)
	--然后再删除记录
	local Sql = "update smcs.tblServerMerge set Flag = 'false' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err 
end

--更新发布状态
function UpdateStatus(self, ID, Status)
	local Sql = "update smcs.tblServerMerge set Status = '" .. Status .. "' where ID = '"..ID.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end



