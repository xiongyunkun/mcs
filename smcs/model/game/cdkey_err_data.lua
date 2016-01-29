------------------------------------------
--$Id: cdkey_activity.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblCDKeyErr` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CDKey` varchar(32) NOT NULL DEFAULT '' COMMENT '激活码',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` varchar(32) NOT NULL DEFAULT '' COMMENT '角色ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `ErrTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '错误时间',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='激活码输入错误表' ;

--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.ID and Options.ID ~= "" then
		Where = Where .. " and ID = '" .. Options.ID .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and ErrTime >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and ErrTime <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from smcs.tblCDKeyErr " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"CDKey", "HostID", "Uid", "Urs"}

--插入数据
function Insert(self, Args)
	if not Args.HostID then return end
	local Sql = "insert into smcs.tblCDKeyErr(" .. table.concat(Cols, ",") .. ") values('"
	local InsertValues = {}
	for _, Col in ipairs(Cols) do
		local Value = Args[Col] or ""
		table.insert(InsertValues, Value)
	end
	Sql = Sql .. table.concat(InsertValues, "','") .. "')"
	DB:ExeSql(Sql)
end

