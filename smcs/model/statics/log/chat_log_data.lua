------------------------------------------
--$Id: chat_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblChatLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服配置ID',
  `Uid` int(11) NOT NULL DEFAULT '0' COMMENT '玩家ID',
  `ChannelID` tinyint NOT NULL DEFAULT '1' COMMENT '渠道ID',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `Msg` varchar(512) NOT NULL DEFAULT '' COMMENT '聊天内容',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where 1=1 "
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
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	--计算所跨天数
    local DateList = CommonFunc.GetMySqlTableDateList(StartDate, EndDate)
    local Sqls = {}
    for _, Date in ipairs(DateList) do
		local Sql = "select * from " .. PlatformID .. "_log.tblChatLog_" .. Date .. Where .. " order by Time Desc"
		table.insert(Sqls, Sql)
    end
	Sqls = table.concat( Sqls, " union ")
	local Res, Err = DB:ExeSql(Sqls)
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

local Cols = {"HostID", "Uid", "ChannelID", "Time", "Msg"}

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
	--插入数据库
	for Date, DateResults in pairs(StrResults) do
		local Sql = "insert into " .. PlatformID .. "_log.tblChatLog_" ..  Date .. "(" 
			.. table.concat(Cols, ",") .. ") values(" .. table.concat(DateResults, "),(") .. ")"
		-- 采用批量插入的方式
		DB:ExeSql(Sql)
	end
	return true
end

