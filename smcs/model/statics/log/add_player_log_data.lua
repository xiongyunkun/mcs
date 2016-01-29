------------------------------------------
--$Id: goldlogdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblAddPlayerLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` varchar(32) NOT NULL DEFAULT '' COMMENT '玩家ID',
  `Urs` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家账号',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Sex` int(11) DEFAULT '1' COMMENT '性别',
  PRIMARY KEY (`ID`),
  KEY `index1` (`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COMMENT='玩家注册日志表' 


--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
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
	local Sql = "select * from " .. PlatformID .. "_log.tblAddPlayerLog " .. Where
	--ngx.say(Sql)
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

--获得某一时间点的数据，并且组装成{Urs=Time}格式
function GetSameTimeStatics(self, PlatformID, Options)
	local Res = self:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[Info.Urs] = Info.Time
	end
	return Results
end

local Cols = {"HostID", "Uid", "Urs", "Sex", "PhoneInfo", "Time"}
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
	local Sql = "insert into " .. PlatformID .. "_log.tblAddPlayerLog(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

