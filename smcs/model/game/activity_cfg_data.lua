------------------------------------------
--$Id: activitycfgdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblActivityCfg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `ServerType` int(11) NOT NULL DEFAULT '1' COMMENT '大区类型',
  `HostIDs` varchar(512) NOT NULL DEFAULT '' COMMENT '服hostID',
  `StartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `ActivityID` int(11) DEFAULT NULL COMMENT '活动ID',
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，1：已提交，2：已发布',   
  `Memo` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动配置表' 


--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.ID and Options.ID ~= "" then
		Where = Where .. " and ID = '" .. Options.ID .. "'"
	end
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostIDs and Options.HostIDs ~= "" then
		Where = Where .. " and HostIDs like '" .. Options.HostIDs .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and SubmitTime >= '" .. Options.StartTime .. " 00:00:00'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and SubmitTime <= '" .. Options.EndTime .. " 23:59:59'"
	end
	local Sql = "select * from smcs.tblActivityCfg " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--插入数据
function Insert(self, Args)
	local InsertCols = {"PlatformID", "ServerType", "HostIDs", "StartTime","EndTime","ActivityID", "Operator", "Status", "Memo",}
	local Sql = "insert into smcs.tblActivityCfg ("..table.concat(InsertCols, ",").. ") values("
	local Values = {}
	for _, Col in ipairs(InsertCols) do
		local Value = Args[Col] and "'" .. Args[Col] .. "'" or "''"
		table.insert(Values, Value)
	end
	Sql = Sql .. table.concat(Values, ",") .. ")"
	DB:ExeSql(Sql)
	--查询获得ID
	local SelectStrs = {}
	for _, Col in ipairs(InsertCols) do
		local Value = Args[Col] and Col .. " = '" .. Args[Col] .. "' " or Col .. " = '' "
		table.insert(SelectStrs, Value)
	end
	local SelectSql = "select ID from smcs.tblActivityCfg where " .. table.concat( SelectStrs, " and ")
	local Res, Err = DB:ExeSql(SelectSql)
	if not Res or not Res[1] then return nil, Err end
	return Res[1]["ID"]
end

function Update(self, Args)
	if not Args.ID then return end
	local UpdateCols = {"PlatformID", "ServerType", "HostIDs", "StartTime","EndTime","ActivityID", "Operator", "Status", "Memo",}
	local Sql = "update smcs.tblActivityCfg set "
	local Values = {}
	for _, Col in ipairs(UpdateCols) do
		if Args[Col] then
			local Value = Col .. " = '" .. Args[Col] .. "'"
			table.insert(Values, Value)
		end
	end
	Sql = Sql .. table.concat(Values, ",") .. " where ID = '" .. Args.ID .. "'"
	DB:ExeSql(Sql)
end

function Delete(self, ID)
	local Sql = "update smcs.tblActivityCfg set Flag = 'false' where ID = '" .. ID .. "'"
	DB:ExeSql(Sql)
end

function UpdateStatus(self, ID, Status)
	local Sql = "update smcs.tblActivityCfg set Status = '" .. Status .. "' where ID = '" .. ID .. "'"
	DB:ExeSql(Sql)
end

