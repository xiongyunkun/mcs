------------------------------------------
--$Id: task_log_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblMountLevel` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `RegTime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '玩家注册',
  `LoginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上一次登陆时间',
  `UpdateTime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '上一次更新时间',
  `MountID` int(11) NOT NULL DEFAULT '1' COMMENT '坐骑ID',
  `EvoLevel` int(11) NOT NULL DEFAULT '1' COMMENT '等阶',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Level` int(11) NOT NULL DEFAULT '1' COMMENT '星级',
  PRIMARY KEY (`Uid`),
  KEY `index1` (`UpdateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='坐骑等阶表'   

--]]
module(...,package.seeall)

--查询数据
function Get(self, PlatformID, Options)
	local Where = " where Flag = 'true' "
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.UpdateTime and Options.UpdateTime ~= "" then
		Where = Where .. " and UpdateTime = '" .. Options.UpdateTime .. "'"
	end
	
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	local Sql = "select HostID, Uid, UNIX_TIMESTAMP(RegTime) as RegTime,  UNIX_TIMESTAMP(LoginTime) as LoginTime, UpdateTime, MountID, EvoLevel, Level from " 
        .. PlatformID .. "_statics.tblMountLevel " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return {}, Err end
	return Res
end

--获得某一时间点的数据，并且组装成{Uid=Time}格式
function GetSameTimeStatics(self, PlatformID, Options)
	local Res = self:Get(PlatformID, Options)
	local Results = {}
	for _, Info in ipairs(Res) do
		Results[tonumber(Info.Uid)] = Info.UpdateTime
	end
	return Results
end

local Cols = {"HostID", "Uid", "RegTime", "LoginTime", "UpdateTime", "MountID", "EvoLevel", "Level"}

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
	local Sql = "replace into " .. PlatformID .. "_statics.tblMountLevel(" .. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ")"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

