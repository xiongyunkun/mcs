------------------------------------------
--$Id: cdkey_activity.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblCDKeyActivity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '活动名称',
  `KeyType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用类型',
  `KeyNum` int(11) NOT NULL DEFAULT '0' COMMENT '生成数量',
  `StartTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `EndTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `Rewards` varchar(512) NOT NULL DEFAULT '' COMMENT '奖励内容',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='激活码活动内容表' 

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
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.KeyType and Options.KeyType ~= "" then
		Where = Where .. " and KeyType = '" .. Options.KeyType .. "'"
	end
	if Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "'"
	end
	local Sql = "select * from smcs.tblCDKeyActivity " .. Where .. " order by ID DESC"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--获得激活码活动键值对
function GetActivityMap(self)
	local ActivityList = self:Get({})
	local ActivityMap = {}
	for _, ActivityInfo in ipairs(ActivityList) do
		ActivityMap[ActivityInfo.ID] = ActivityInfo.Name
	end
	return ActivityMap
end

local Cols = {"PlatformID", "Name", "KeyType", "KeyNum", "StartTime", "EndTime", "Rewards", "Operator",}

--插入数据
function Insert(self, Args)
	local Sql = "insert into smcs.tblCDKeyActivity(" .. table.concat(Cols, ",") .. ") values('"
	local InsertValues = {}
	for _, Col in ipairs(Cols) do
		local Value = Args[Col] or ""
		table.insert(InsertValues, Value)
	end
	Sql = Sql .. table.concat(InsertValues, "','") .. "')"
	DB:ExeSql(Sql)

	--返回ID
	local Res = self:Get(Args)
	if not Res or not Res[1] then
		return
	else
		return Res[1]["ID"]
	end
end

