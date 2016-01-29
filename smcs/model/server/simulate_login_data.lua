------------------------------------------
--$Id: simulate_login_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblSimulateLogin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='一键登录操作记录表'

--]]
module(...,package.seeall)

function Get( self, Options )
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.Urs and Options.Urs ~= "" then
		Where = Where .. " and Urs = '" .. Options.Urs .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from smcs.tblSimulateLogin " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end
local Cols = {"PlatformID", "HostID", "Urs", "Time", "Operator"}

function Insert(self, Args)
	local Values = {}
	local UpdateValues = {}
	for _, ColName in ipairs(Cols) do
		local Value = Args[ColName] and "'".. Args[ColName].."'" or "''"
		table.insert(Values, Value)
	end

	local Sql = "insert into smcs.tblSimulateLogin (" .. table.concat(Cols, ",") .. ") values("
		.. table.concat( Values, ",") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end



