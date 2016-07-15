------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblUserInfo` (
  `Uid` int(11) NOT NULL DEFAULT '0' COMMENT '玩家ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Urs` varchar(64) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `LastLoginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Level` int(11) NOT NULL DEFAULT '1' COMMENT '玩家等级',
  `RegTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `Sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别',
  PRIMARY KEY (`Uid`),
  KEY `index1` (`Urs`),
  KEY `index2` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家信息表'

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	local Where = " where Flag = 'true' "
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.HostIDs and Options.HostIDs ~= "" then
		Where = Where .. " and HostID in ('" .. Options.HostIDs .. "')"
	end
	if Options.Urs and Options.Urs ~= "" then
		Where = Where .. " and Urs = '" .. Options.Urs .. "'"
	end
	if Options.UrsList and Options.UrsList ~= "" then
		Where = Where .. " and Urs in ('" .. Options.UrsList .. "')"
	end
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.Names and Options.Names ~= "" then
		Where = Where .. " and Name in ('" .. Options.Names .. "')"
	end
	if Options.RegTime and Options.RegTime ~= "" then
		Where = Where .. " and RegTime >= '" .. Options.RegTime .. "'"
	end
	if Options.MinLevel and Options.MinLevel ~= "" then
		Where = Where .. " and Level >= '" .. Options.MinLevel .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblUserInfo " .. Where 
	local HostIP = GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end



