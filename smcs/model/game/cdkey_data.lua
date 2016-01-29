------------------------------------------
--$Id: cdkey_activity.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblCDKey` (
  `CDKey` varchar(32) NOT NULL DEFAULT '' COMMENT '激活码',
  `ActivityID` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `IsValid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,0:无效',
  `InitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生成时间',
  `ExpireTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  PRIMARY KEY (`CDKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='激活码表' 

--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where 1=1 "
	if Options.CDKey and Options.CDKey ~= "" then
		Where = Where .. " and `CDKey` = '" .. Options.CDKey .. "'"
	end
	if Options.ActivityID and Options.ActivityID ~= "" then
		Where = Where .. " and ActivityID = '" .. Options.ActivityID .. "'"
	end
	local Sql = "select * from smcs.tblCDKey " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--获得激活码或者该玩家的兑换信息
function GetKeyInfo(self, CDKey, Uid)
	local Res = nil
	if CDKey and CDKey ~= "" then
		local Sql = "select a.*, b.Uid, b.HostID, b.Urs, b.ExchangeTime from smcs.tblCDKey a left join "
			.. " smcs.tblCDKeyExchange b on a.CDKey = b.CDKey where a.CDKey = '" .. CDKey .. "'"
		Res = DB:ExeSql(Sql)
	elseif Uid and Uid ~= "" then
		Res = CDKeyExchangeData:Get({Uid = Uid})
	end
	return Res
end

--插入数据
function Insert(self, Args)
	local Sql = "insert into smcs.tblCDKey(CDKey, ActivityID) values('" ..Args.CDKey .. "','" .. Args.ActivityID .. "')"
	DB:ExeSql(Sql)
end

--使激活码失效
function AbortKey(self, Args)
	local Where = " where 1=1 "
	local RunFlag = false -- 执行标志，防止误删数据
	if Args.ActivityID and Args.ActivityID ~= "" then
		RunFlag = true
		Where = Where .. " and ActivityID = '" .. Args.ActivityID .. "'"
	end
	if Args.CDKey and Args.CDKey ~= "" then
		RunFlag = true
		Where = Where .. " and `CDKey` = '" .. Args.CDKey .. "'"
	end
	if not RunFlag then return end -- 没有查询条件直接退出
	local Time = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	local Sql = "update smcs.tblCDKey set IsValid = '0',ExpireTime='" .. Time .. "' ".. Where
	DB:ExeSql(Sql)
end



