------------------------------------------
--$Id: god_door_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblPetDayStatics` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `PetUid` bigint(20) NOT NULL DEFAULT '0' COMMENT '魔神Uid',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `PetID` int NOT NULL DEFAULT '0' COMMENT '宠物ID',
  `Level` int NOT NULL DEFAULT '0' COMMENT '魔神等级',
  `StarLevel` int NOT NULL DEFAULT '0' COMMENT '魔神星级',
  `Fighting` int NOT NULL DEFAULT '0' COMMENT '魔神战斗力',
  PRIMARY KEY (`HostID `,`PetUid `,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='魔神日统计表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where 1=1 "
	local Date = os.date("%Y%m%d", os.time()) --按日期分表,默认是当天
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Date = '" .. Options.Time .. "'"
		Date = Options.Time
		Date = string.gsub(Date, "-", "")
	end
    if Options.Uid and Options.Uid ~= "" then
        Where = Where .. " and Uid = '" .. Options.Uid .. "'"
    end
    if Options.Name and Options.Name ~= "" then
        Where = Where .. " and Name = '" .. Options.Name .. "'"
    end
    if Options.PetID and Options.PetID ~= "" then
        Where = Where .. " and PetID = '" .. Options.PetID .. "'"
    end
	local Sql = "select * from " .. PlatformID .. "_log.tblPetDayStatics_" .. Date .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

local Cols = {"HostID", "PetUid", "Date", "Uid", "Urs", "Name", "PetID", "Level", "StarLevel", "Fighting"}

function BatchInsert(self, PlatformID, Results)
	local StrResults = {}
	for _, Result  in pairs(Results) do
		local List = {}
		local Date = nil
		for _, Col in ipairs(Cols) do
			local Value = Result[Col] or ""
			table.insert(List, "'" .. Value .. "'")
			if Col == "Date" then
				Date = string.gsub(Value, "-", "") --获取日期
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
		local Sql = "insert into " .. PlatformID .. "_log.tblPetDayStatics_" .. Date .. "(" 
			.. table.concat(Cols, ",") .. ") values(" .. table.concat(DateResults, "),(") .. ")"
			.." on duplicate key update Level = values(Level),StarLevel = values(StarLevel),Fighting=values(Fighting)"
		DB:ExeSql(Sql)
	end
	return true
end

--删除统计记录
function Delete(self, PlatformID, HostID, Date, PetUidList)
	local TableDate = string.gsub(Date, "-", "")
	local Sql = "delete from " .. PlatformID .. "_log.tblPetDayStatics_" .. TableDate 
		.. " where HostID = '" .. HostID .. "' and PetUid in ('" .. table.concat( PetUidList, "','")
		.. "') and Date = '" .. Date .. "'"
	DB:ExeSql(Sql)
end

