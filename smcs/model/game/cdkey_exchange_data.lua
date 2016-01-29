------------------------------------------
--$Id: cdkey_activity.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblCDKeyExchange` (
  `CDKey` varchar(32) NOT NULL DEFAULT '' COMMENT '激活码',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `ActivityID` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `ExchangeTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '兑换时间',
  PRIMARY KEY (`CDKey`,`Uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='激活码兑换表' 

--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where 1=1 "
	if Options.CDKey and Options.CDKey ~= "" then
		Where = Where .. " and `CDKey` = '" .. Options.CDKey .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and `Uid` = '" .. Options.Uid .. "'"
	end
	if Options.ActivityID and Options.ActivityID ~= "" then
		Where = Where .. " and ActivityID = '" .. Options.ActivityID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	local Sql = "select * from smcs.tblCDKeyExchange " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"CDKey", "Uid", "ActivityID", "HostID", "Urs"}
--插入数据
function Insert(self, Args)
	local StrResults = {}
	for _, Col in ipairs(Cols) do
		local Value = Result[Col] or ""
		table.insert(StrResults, "'" .. Value .. "'")
	end
	--插入数据库
	local Sql = "insert into smcs.tblCDKeyExchange(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, ",") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end




