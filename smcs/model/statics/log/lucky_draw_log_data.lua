------------------------------------------
--$Id: task_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblLuckyDrawLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `Times` int(11) DEFAULT '0' COMMENT '抽奖次数',
  `ProcType` tinyint DEFAULT '0' COMMENT '抽奖类型',
  `Bonus` varchar(256) NOT NULL DEFAULT '' COMMENT '奖励列表',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '变更时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='酒馆日志表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where 1=1 "
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time = '" .. Options.Time .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name = '" .. Options.Name .. "'"
	end
	if Options.Times and Options.Times ~= "" then
		Where = Where .. " and Times = '" .. Options.Times .. "'"
	end
	if Options.ProcType and Options.ProcType ~= "" and Options.ProcType ~= "0" then
		Where = Where .. " and ProcType = '" .. Options.ProcType .. "'"
	end
	local Sql = "select * from " .. PlatformID .. "_log.tblLuckyDrawLog " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

--获得某一时间点的数据，并且组装成{Uid=Time}格式
function GetSameTimeStatics(self, PlatformID, Options)
	local Res = self:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[Info.Uid] = Info.Time
	end
	return Results
end

local Cols = {"HostID", "Uid", "Urs", "Name","Times", "ProcType", "Bonus", "Time"}

function BatchInsert(self, PlatformID, Results)
	local StrResults = {}
	for _, Result  in ipairs(Results) do
		local List = {}
		for _, Col in ipairs(Cols) do
			local Value = Result[Col] or ""
			table.insert(List, "'" .. Value .. "'")
		end
		local StrValue = table.concat(List, ",")
		table.insert(StrResults, StrValue)
	end
	--插入数据库
	local Sql = "insert into " .. PlatformID .. "_log.tblLuckyDrawLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	ngx.say(Sql)
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

