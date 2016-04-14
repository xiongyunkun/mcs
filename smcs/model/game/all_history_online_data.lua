------------------------------------------
--$Id: vip_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblAllHistoryOnline` (
  `MD5Str` varchar(64) NOT NULL DEFAULT '' COMMENT 'md5字符串',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `PlatformIDs` varchar(512) NOT NULL DEFAULT '' COMMENT '平台ID列表',
  `MaxOnline` int(11) NOT NULL DEFAULT '0' COMMENT '最高在线人数',
  `AveOnline` int(11) NOT NULL DEFAULT '0' COMMENT '平均在线人数',
  `MinOnline` int(11) NOT NULL DEFAULT '0' COMMENT '最低在线人数',
  `UpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上一次更新时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`MD5Str`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全服历史在线统计表'

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.PlatformIDs and Options.PlatformIDs ~= "" then
		Where = Where .. " and PlatformIDs = '" .. Options.PlatformIDs .. "'"
	end
	if Options.MD5Str and Options.MD5Str ~= "" then
		Where = Where .. " and MD5Str = '" .. Options.MD5Str .. "'"
	end
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from smcs.tblAllHistoryOnline " .. Where .. " order by Date"
	--ngx.say(Sql)
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

function Insert(self, PlatformIDs, Date, MaxOnline, AveOnline, MinOnline)
	--先对平台md5求值
	table.sort(PlatformIDs)
	PlatformIDs = table.concat(PlatformIDs, ",")
	local MD5Str = ngx.md5(PlatformIDs)
	local NowTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local Sql = "insert into smcs.tblAllHistoryOnline(MD5Str, Date, PlatformIDs, MaxOnline, AveOnline, MinOnline)"
			.. " values('" .. MD5Str .. "','".. Date .. "','" .. PlatformIDs .. "','"  .. MaxOnline .. "','" 
			.. AveOnline .. "','" .. MinOnline .. "')"
			.. " on duplicate key update MaxOnline = '" .. MaxOnline .. "', AveOnline = '" 
			.. AveOnline .. "', MinOnline = '" .. MinOnline .. "',UpdateTime='" .. NowTime .. "'"

	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end




