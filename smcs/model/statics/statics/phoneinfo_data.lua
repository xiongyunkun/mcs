--------------------------------------
--$Id:
--手机信息表
--------------------------------------

--[[
CREATE TABLE 'tblPhone' (
	`PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
	`HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
	`Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
	'IMEI' varchar(20) NOT NULL DEFAULT '0' COMMENT '移动设备标识',
	'IMSI' varchar(20) NOT NULL DEFAULT '0' COMMENT '移动用户标识',
	'Model' varchar(20) NOT NULL DEFAULT '未知' COMMENT '型号',
	'Brand' varchar(20) NOT NULL DEFAULT '未知' COMMENT '品牌',
	'SysVer' varchar(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
	'SdkVer' varchar(20) NOT NULL DEFAULT '0' COMMENT 'SDK版本', 
	'SimOperation' varchar(20) NOT NULL DEFAULT '无' COMMENT '运营商',
	'DPI' varchar(20) NOT NULL DEFAULT '0*0' COMMENT '分辨率',
  	`Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  	`Uids` varchar(20000) DEFAULT '' COMMENT 'uid列表',
	PRIMARY KEY ('PlatformID', 'HostID', 'IMEI')
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '手机信息统计表'
--]]

module(...,package.seeall)

function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	
	local Where = " where Flag = 'true' "
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	
	if Options.IMEI and Options.IMEI ~= "" then
		Where = Where .. " and IMEI = '" .. Options.IMEI .. "'"
	end
	
	if Options.Model and Options.Model ~= "" then
		Where = Where .. " and Model = '" .. Options.Model .. "'"
	end
	
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	
	local Sql = "select * from " .. PlatformID .. "_statics.tblPhone " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

local Cols = {"PlatformID", "HostID", "IMEI", "IMSI", "Model", "Brand", "SysVer", "SdkVer", "SimOperation", "DPI", "Uids", "Date"}
function BatchInsert(self, PlatformID, HostID, Results)
	local StrResults = {}
	for _, Results in ipairs(Results) do
		local List = {}
		for _, Col in ipairs(Cols) do
			local Value = Results[Col] or ""
			table.insert(List, "'" .. Value .. "'")
		end
		local StrValue = table.concat(List, ",")
		table.insert(StrResults, StrValue)
	end


	local Sql = "insert into " .. PlatformID .. "_statics.tblPhone(" .. table.concat(Cols, ",") .. ") values("
	
	
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	
	local UpdateStr = ""
	for i = 4 , #Cols do
		local Str = Cols[i] .. " = values(" .. Cols[i] .. "),"
		UpdateStr = UpdateStr .. Str 
	end
	UpdateStr = string.sub(UpdateStr, 1, string.len(UpdateStr) - 1)

	Sql = Sql .. " on duplicate key update " .. UpdateStr
	
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

function GetStatics(self, Options)
	local Results = {
		Model = {},
		Brand = {},
		DPI = {},
	}
	local Count = 0
	if not Options.PlatformID or Options.PlatformID == "" then
		local PlatformMap = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(PlatformMap) do
			Options.PlatformID = PlatformID
			local Res = self:Get(Options)
			Results, Count = self:MergeData(Results, Res)
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		Results, Count = self:MergeData(Results, Res)
	end
	return Results, Count
end

function MergeData(self, Results, Res)
	local Count = 0 
	for _, Info in ipairs(Res) do
		Results.Model[Info.Model] = ( Results.Model[Info.Model] or 0 )  + 1
		Results.Brand[Info.Brand] = (Results.Brand[Info.Brand] or 0) + 1
		Results.DPI[Info.DPI] = (Results.DPI[Info.DPI] or 0) + 1
		Count = Count + 1
	end

	return Results, Count
end

