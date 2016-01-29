------------------------------------------
--$Id: activitycfgdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblSuperPlayerServer` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
   `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `QQ` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `GoldLimit` int(11) NOT NULL DEFAULT '0' COMMENT '元宝额度',  
  `Status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：未发布，2：已发布',   
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY ( `PlatformID`, `HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超级会员区服设置表' 


--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.QQ and Options.QQ ~= "" then
		Where = Where .. " and QQ = '" .. Options.QQ .. "'"
	end
	if Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "'"
	end
	local Sql = "select * from smcs.tblSuperPlayerServer " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"PlatformID", "HostID", "QQ", "GoldLimit", "Operator",}
local UpdateCols = {"GoldLimit", "QQ", "Operator",}

--更新数据
function Update(self, Args)
	if not Args.HostID then return end
	local Sql = "insert into smcs.tblSuperPlayerServer(" .. table.concat(Cols, ",") .. ") values('"
	local InsertValues = {}
	for _, Col in ipairs(Cols) do
		local Value = Args[Col] or ""
		table.insert(InsertValues, Value)
	end
	Sql = Sql .. table.concat(InsertValues, "','") .. "') on duplicate key update "
	local Values = {}
	for _, Col in ipairs(UpdateCols) do
		if Args[Col] then
			local Value = Col .. " = '" .. Args[Col] .. "'"
			table.insert(Values, Value)
		end
	end
	Sql = Sql .. table.concat(Values, ",") 
	DB:ExeSql(Sql)
end

--更新发布状态
function UpdateStatus(self, PlatformID, HostID, Status)
	local Sql = "update smcs.tblSuperPlayerServer set Status = '" .. Status .. "' where HostID = '" .. HostID .. "' and PlatformID = '" ..PlatformID .. "'"
	DB:ExeSql(Sql)
end

--删除操作
function Delete(self, PlatformID, HostID)
	local Sql = "update smcs.tblSuperPlayerServer set Flag = 'false' where HostID = '" .. HostID .. "' and PlatformID = '" .. PlatformID .. "'"
	DB:ExeSql(Sql)
end

