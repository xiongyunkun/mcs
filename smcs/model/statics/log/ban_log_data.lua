------------------------------------------
--$Id: ban_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblBanLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',  
  `Operator`  varchar(32) NOT NULL DEFAULT '' COMMENT '操作人', 
  `OperationType` tinyint NOT NULL DEFAULT '1' COMMENT '操作类型,1:禁言,2:解除禁言,3:封号,4:解除封号', 
  `BanStartTime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '封禁开始时间',
  `BanEndTime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '封禁结束时间',
  `Reason`  varchar(128) NOT NULL DEFAULT '' COMMENT '原因', 
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`),
  KEY `index2` (`Uid`),
  KEY `index3` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='封号禁言日志表' 

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where 1=1 "
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time = '" .. Options.Time .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "'"
	end
	if Options.OperationType and Options.OperationType ~= "" then
		Where = Where .. " and OperationType = '" .. Options.OperationType .. "'"
	end
	if Options.Reason and Options.Reason ~= "" then
		Where = Where .. " and Reason like '%" .. Options.Reason .. "%'"
	end
	local Sql = "select * from " .. PlatformID .. "_log.tblBanLog " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

local Cols = {"HostID", "Uid", "Name", "Operator", "OperationType", "BanStartTime", "BanEndTime", "Reason", "Time"}

function BatchInsert(self, PlatformID, Results)
	local StrResults = {}
	for _, Result  in ipairs(Results) do
		local List = {}
		for _, Col in ipairs(Cols) do
			local Value = Result[Col] or ""
			table.insert(List, "'" .. Value .. "'")
		end
		local StrValue = table.concat(List, ",")
		table.insert(StrResults, StrValue)
	end
	--插入数据库
	local Sql = "insert into " .. PlatformID .. "_log.tblBanLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

