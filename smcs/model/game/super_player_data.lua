------------------------------------------
--$Id: activitycfgdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblSuperPlayer` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `Uid` int(11) NOT NULL COMMENT 'Uid',
  `RoleName` varchar(128) NOT NULL DEFAULT '' COMMENT '角色名',
  `QQ` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `Status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：未设置领取礼包，2：已设置',   
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY ( `PlatformID`, `Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超级会员表' 

--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.RoleName and Options.RoleName ~= "" then
		Where = Where .. " and RoleName = '" .. Options.RoleName .. "'"
	end
	if Options.Operator and Options.Operator ~= "" then
		Where = Where .. " and Operator = '" .. Options.Operator .. "'"
	end
	local Sql = "select * from smcs.tblSuperPlayer " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"PlatformID", "Uid", "RoleName", "QQ", "Operator",}
local UpdateCols = {"RoleName", "QQ", "Operator",}

--更新数据
function Update(self, Args)
	if not Args.Uid then return end
	local Sql = "insert into smcs.tblSuperPlayer(" .. table.concat(Cols, ",") .. ") values('"
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
function UpdateStatus(self, PlatformID, Uid, Status)
	local Sql = "update smcs.tblSuperPlayer set Status = '" .. Status .. "' where Uid = '" .. Uid .. "' and PlatformID = '" ..PlatformID .. "'"
	DB:ExeSql(Sql)
end

--删除操作
function Delete(self, PlatformID, Uid)
	local Sql = "update smcs.tblSuperPlayer set Flag = 'false' where Uid = '" .. Uid .. "' and PlatformID = '" .. PlatformID .. "'"
	DB:ExeSql(Sql)
end

