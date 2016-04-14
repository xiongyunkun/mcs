------------------------------------------
--$Id: modgmruledata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblStartServerInfo` (
  `OrderID` varchar(32) NOT NULL DEFAULT '' COMMENT '订单ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `ServerID` varchar(16) NOT NULL DEFAULT '' COMMENT '服编号',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT 'HostID',
  `StartServerTime`timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '开服时间' ,
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='独代平台开服信息表'

--]]
module(...,package.seeall)

--获得GM指令
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.OrderID and Options.OrderID ~= "" then
		Where = Where .. " and OrderID = '" .. Options.OrderID .. "'"
	end
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.ServerID and Options.ServerID ~= "" then
		Where = Where .. " and ServerID = '" .. Options.ServerID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	local Sql = "select * from smcs.tblStartServerInfo " .. Where .. ""
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"OrderID", "PlatformID", "ServerID", "HostID", "StartServerTime"}
function Insert(self, Results)
	local StrResults = {}
	for _, Col in ipairs(Cols) do
		local Value = Results[Col] or ""
		table.insert(StrResults, "'" .. Value .. "'")
	end
	--插入数据库
	local Sql = "insert into smcs.tblStartServerInfo(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, ",") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--更新开服时间
function UpdateStartServerTime(self, OrderID, StartServerTime)
	local Sql = "update smcs.tblStartServerInfo set StartServerTime = '" 
		.. StartServerTime .. "' where OrderID = '" .. OrderID .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


