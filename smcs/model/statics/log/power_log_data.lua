------------------------------------------
--$Id: power_log_data.lua 81663 2015-12-09 09:16:51Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblPowerLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `DPower` int(11) DEFAULT '0' COMMENT '体力变化数',
  `Reason` varchar(64) NOT NULL DEFAULT '' COMMENT '变更原因',
  `Power` int(11) DEFAULT '0' COMMENT '当前体力数',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '变更时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体力日志表' 

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
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
    if Options.Name and Options.Name ~= "" then
        Where = Where .. " and Name = '" .. Options.Name .. "'"
    end
    if Options.Uid and Options.Uid ~= "" then
        Where = Where .. " and Uid = '" .. Options.Uid .. "'"
    end
    if Options.Consume and Options.Consume ~= "" then
        Where = Where .. " and DPower < '0'"
    end
	local Sql = "select * from " .. PlatformID .. "_log.tblPowerLog " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

--获得某一时间点的数据，并且组装成{Uid=Time}格式
function GetSameTimeStatics(self, PlatformID, Options)
	local Res = self:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[Info.Uid] = Info.Time
	end
	return Results
end

local Cols = {"HostID", "Uid", "Urs", "DPower", "Reason", "Power", "Name", "Time"}
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
	local Sql = "insert into " .. PlatformID .. "_log.tblPowerLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

