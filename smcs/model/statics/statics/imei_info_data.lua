------------------------------------------
--$Id: hitory_reg_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblIMEIInfo` (
  `IMEI` varchar(32) NOT NULL DEFAULT '' COMMENT '设备号ID',
  `Step` tinyint NOT NULL DEFAULT '0' COMMENT '步骤ID',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`IMEI`,`Step`),
  KEY `index1` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备号表'

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	local Where = " where Flag = 'true' "
	if Options.IMEI and Options.IMEI ~= "" then
		Where = Where .. " and IMEI = '" .. Options.IMEI .. "'"
	end
	if Options.Step and Options.Step ~= "" then
		Where = Where .. " and Step = '" .. Options.Step .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblIMEIInfo " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

function Insert(self, PlatformID, IMEIMap, Step, Time)
	local IMEIList = {}
	for IMEI, _ in pairs(IMEIMap) do
		local Result = {IMEI, Step, Time}
		table.insert(IMEIList, table.concat(Result, "','"))
	end
	if #IMEIList > 0 then
		local Sql = "insert into ".. PlatformID .. "_statics.tblIMEIInfo(IMEI, Step, Time) values('"
		.. table.concat( IMEIList, "'),('") .. "') on duplicate key update Flag = 'true'"
		DB:ExeSql(Sql)
	end
end





