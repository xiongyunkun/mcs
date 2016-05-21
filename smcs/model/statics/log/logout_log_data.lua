------------------------------------------
--$Id: goldlogdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblLogoutLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` varchar(32) NOT NULL DEFAULT '' COMMENT '玩家ID',
  `Urs` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家账号',
  `OnTime` int(11) NOT NULL DEFAULT '0' COMMENT '在线时长（秒）',
  `Lv` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `SceneUid` int(11) NOT NULL DEFAULT '0' COMMENT '场景uid',
  `X` int(11) NOT NULL DEFAULT '0' COMMENT 'X坐标',
  `Y` int(11) NOT NULL DEFAULT '0' COMMENT 'Y坐标',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '退出时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `VipLevel` tinyint(4) DEFAULT '0' COMMENT 'VIP等级',
  `IsVip` tinyint(4) DEFAULT '0' COMMENT 'VIP是否激活状态',
  `Fighting` int(11) DEFAULT '0' COMMENT '战斗力',
  `Gold` int(11) DEFAULT '0' COMMENT '钻石数(非绑钻)',
  `TotalGold` int(11) DEFAULT '0' COMMENT '总钻石数(绑钻+非绑钻)',
  `Money` int(11) DEFAULT '0' COMMENT '金币数',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'IP地址',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8 COMMENT='玩家退出日志表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
	local StartDate = os.date("%Y-%m-%d", os.time()) --按日期分表,默认是当天
	local EndDate = StartDate --默认与StartDate相等
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time = '" .. Options.Time .. "'"
		StartDate = CommonFunc.GetDate(Options.Time)
		EndDate = StartDate
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
		StartDate = CommonFunc.GetDate(Options.StartTime)
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
		EndDate = CommonFunc.GetDate(Options.EndTime)
	end
	if Options.VipLevel and Options.VipLevel ~= "" then
		Where = Where .. " and VipLevel = '" .. Options.VipLevel .. "'"
	end
	if Options.NoVipLevel and Options.NoVipLevel ~= "" then
		Where = Where .. " and VipLevel != '" .. Options.NoVipLevel .. "'"
	end
	if Options.IsVip and Options.IsVip ~= "" then
		Where = Where .. " and IsVip = '" .. Options.IsVip .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
        Where = Where .. " and Uid = '" .. Options.Uid .. "'"
    end
    if Options.Name and Options.Name ~= "" then
        Where = Where .. " and Name = '" .. Options.Name .. "'"
    end
    if Options.Ip and Options.Ip ~= "" then
        Where = Where .. " and Ip = '" .. Options.Ip .. "'"
    end
     --计算所跨天数
    local DateList = CommonFunc.GetMySqlTableDateList(StartDate, EndDate)
    local Sqls = {}
    for _, Date in ipairs(DateList) do
		local Sql = "select * from " .. PlatformID .. "_log.tblLogoutLog_" .. Date .. Where
		table.insert(Sqls, Sql)
    end
	Sqls = table.concat( Sqls, " union ")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sqls, HostIP)
	if not Res then return {}, Err end
	return Res
end

--获得某一时间点的数据，并且组装成{Uid=Time}格式
function GetSameTimeStatics(self, PlatformID, Options)
	local Res = self:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[tonumber(Info.Uid)] = Info.Time
	end
	return Results
end

local Cols = {"HostID", "Uid", "Urs", "OnTime", "Lv", "SceneUid", "X", "Y", 
				"VipLevel", "IsVip", "Fighting", "Name", "Time","Gold","TotalGold","Money","Ip"}

function BatchInsert(self, PlatformID, Results)
	local StrResults = {}
	for _, Result  in ipairs(Results) do
		local List = {}
		local Date = nil
		for _, Col in ipairs(Cols) do
			local Value = Result[Col] or ""
			table.insert(List, "'" .. Value .. "'")
			if Col == "Time" then
				Date = CommonFunc.GetMySqlTableDate(Result[Col])
			end
		end
		if Date then
			StrResults[Date] = StrResults[Date] or {}
			local StrValue = table.concat(List, ",")
			table.insert(StrResults[Date], StrValue)
		end
	end
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	--插入数据库
	for Date, DateResults in pairs(StrResults) do
		local Sql = "insert into " .. PlatformID .. "_log.tblLogoutLog_" .. Date .. "(" 
			.. table.concat(Cols, ",") .. ") values(" .. table.concat(DateResults, "),(") .. ")"
		DB:ExeSql(Sql, HostIP)
	end
	return true
end

