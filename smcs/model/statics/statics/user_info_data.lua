------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblUserInfo` (
  `Uid` int(11) NOT NULL DEFAULT '0' COMMENT '玩家ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Urs` varchar(64) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `LastLoginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Level` int(11) NOT NULL DEFAULT '1' COMMENT '玩家等级',
  `RegTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `Sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别',
  PRIMARY KEY (`Uid`),
  KEY `index1` (`Urs`),
  KEY `index2` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家信息表'

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	local Where = " where Flag = 'true' "
	if Options.Uid and Options.Uid ~= "" then
		Where = Where .. " and Uid = '" .. Options.Uid .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		if HostID == tonumber(Options.HostID) then
			Where = Where .. " and HostID = '" .. HostID .. "'"
		else
			local HostIDs = {HostID, Options.HostID} --还要包含之前的服在里面
			Where = Where .. " and HostID in ('" .. table.concat(HostIDs, "','") .. "')"
		end
	end
	if Options.HostIDs and Options.HostIDs ~= "" then
		local HostIDs = Options.HostIDs
		HostIDs = string.split(HostIDs, "','")
		if not Options.NoMerge then
			local NewHostIDs = {}
			local THostMap = {}
			for _, HostID in ipairs(HostIDs) do
				HostID = CommonFunc.GetToHostID(HostID) --合服转换
				if not THostMap[HostID] then
					table.insert(NewHostIDs, HostID)
					THostMap[HostID] = true
				end
			end
			--两个数组合并
			for _, HostID in ipairs(HostIDs) do
				if not THostMap[tonumber(HostID)] then
					table.insert(NewHostIDs, tonumber(HostID))
				end
			end
			HostIDs = NewHostIDs
		end
		Where = Where .. " and HostID in ('" .. table.concat(HostIDs, "','") .. "')"
	end
	if Options.Urs and Options.Urs ~= "" then
		Where = Where .. " and Urs = '" .. Options.Urs .. "'"
	end
	if Options.Name and Options.Name ~= "" then
		Where = Where .. " and Name COLLATE utf8_bin like '%" .. Options.Name .. "%'"
	end
	if Options.RealName and Options.RealName ~= "" then
		Where = Where .. " and Name COLLATE utf8_bin = '" .. Options.RealName .. "'"
	end
	if Options.Names and Options.Names ~= "" then
		Where = Where .. " and Name COLLATE utf8_bin in ('" .. Options.Names .. "')"
	end
	if Options.RegTime and Options.RegTime ~= "" then
		Where = Where .. " and RegTime >= '" .. Options.RegTime .. "'"
	end
	if Options.MaxRegTime and Options.MaxRegTime ~= "" then
		Where = Where .. " and RegTime <= '" .. Options.MaxRegTime .. "'"
	end
	if Options.MinLevel and Options.MinLevel ~= "" then
		Where = Where .. " and Level >= '" .. Options.MinLevel .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblUserInfo " .. Where
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end

local InsertCols = {"HostID", "Uid", "Urs", "Name", "Time", "Sex", "LastUpdateTime"}
local Cols = {"HostID", "Uid", "Urs", "Name", "LastLoginTime", "RegTime", "Sex", "LastUpdateTime"}

--批量插入
function BatchInsert(self, PlatformID, Results)
	local StrResults = {}
	local LastUpdateTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local DefaultValues = {["OnlineFlag"] = 0, ["LastUpdateTime"] = LastUpdateTime,}
	for Idx, Result  in ipairs(Results) do
		local TResult = {}
		for _, Col in ipairs(InsertCols) do
			local Value = Result[Col] or ""
			if DefaultValues[Col] then
				Value = DefaultValues[Col]
			end
			Value = "'" .. Value .. "'"
			table.insert(TResult, Value)
			if Col == "Time" then --还需要把这列记为注册时间
				table.insert(TResult, Value)
			end
		end
		local StrValue = table.concat(TResult, ",")
		table.insert(StrResults, StrValue)
	end
	local Sql = "insert into " .. PlatformID .. "_statics.tblUserInfo(".. table.concat(Cols, ",") .. ") values("
	-- 采用批量插入的方式
	Sql = Sql .. table.concat(StrResults, "),(") 
		.. ") on duplicate key update Name = values(Name),LastLoginTime=values(LastLoginTime),LastUpdateTime=values(LastUpdateTime),OnlineFlag='1'"	
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res		
end

local UpdateCols = {"HostID", "Uid", "Urs", "Name", "Level","LastLogoutTime","SceneUid",
				"TotalOnlineTime","Fighting","Gold","TotalGold","Money","OnlineFlag","LastUpdateTime","VipLevel", "IsVip",}
local ColMap = {["LastLogoutTime"] = "Time",["Level"] = "Lv", ["TotalOnlineTime"] = "OnTime",} --需要配置重新进行转换的列
local DuplicateUpCols = {"Name", "Urs", "Level","LastLogoutTime","SceneUid","Fighting",
	"Gold","TotalGold","Money","OnlineFlag","LastUpdateTime","VipLevel", "IsVip",}

function BatchUpdate(self, PlatformID, Results)
	local StrResults = {}
	local LastUpdateTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
	local DefaultValues = {["OnlineFlag"] = 0, ["LastUpdateTime"] = LastUpdateTime,}
	for Idx, Result  in ipairs(Results) do
		local TResult = {}
		for _, Col in ipairs(UpdateCols) do
			local Value = Result[Col] or ""
			if ColMap[Col] then
				Value = Result[ColMap[Col]] or ""
			elseif DefaultValues[Col] then
				Value = DefaultValues[Col]
			end
			Value = "'" .. Value .. "'"
			table.insert(TResult, Value)
		end
		local StrValue = table.concat(TResult, ",")
		table.insert(StrResults, StrValue)
	end
	local Sql = "insert into " .. PlatformID .. "_statics.tblUserInfo(".. table.concat(UpdateCols, ",") .. ") values("
	-- 采用批量更新的方式
	local Duplicates = {}
	for _, Col in ipairs(DuplicateUpCols) do
		table.insert(Duplicates, Col .. " = values(" .. Col .. ")")
	end
	Sql = Sql .. table.concat(StrResults, "),(") 
		.. ") on duplicate key update " .. table.concat(Duplicates, ",") 
		.. ",TotalOnlineTime = TotalOnlineTime + values(TotalOnlineTime)"	
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end

--批量更新玩家名字信息
function BatchUpdateName(self, PlatformID, Results)
	local StrResults = {}
	local NameCols = {"HostID", "Uid", "Urs", "Name"}
	for Idx, Result  in ipairs(Results) do
		local TResult = {}
		for _, Col in ipairs(NameCols) do
			local Value = "'" .. (Result[Col] or "") .. "'"
			table.insert(TResult, Value)
		end
		local StrValue = table.concat(TResult, ",")
		table.insert(StrResults, StrValue)
	end
	local Sql = "insert into " .. PlatformID .. "_statics.tblUserInfo(".. table.concat(NameCols, ",") .. ") values("
	-- 采用批量更新的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ") on duplicate key update Name = values(Name)"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end

--批量更新玩家等级
function BatchUpdateLevel(self, PlatformID, Results)
	local StrResults = {}
	local NameCols = {"HostID", "Uid", "Urs", "Level", "Name"}
	for Idx, Result  in ipairs(Results) do
		local TResult = {}
		for _, Col in ipairs(NameCols) do
			local Value = ""
			if Col == "Level" then
				Value = "'" .. (Result["NewLevel"] or "") .. "'"
			else
				Value = "'" .. (Result[Col] or "") .. "'"
			end
			table.insert(TResult, Value)
		end
		local StrValue = table.concat(TResult, ",")
		table.insert(StrResults, StrValue)
	end
	local Sql = "insert into " .. PlatformID .. "_statics.tblUserInfo(".. table.concat(NameCols, ",") .. ") values("
	-- 采用批量更新的方式
	Sql = Sql .. table.concat(StrResults, "),(") .. ") on duplicate key update Level = values(Level), Name= values(Name)"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end


