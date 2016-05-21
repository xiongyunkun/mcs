------------------------------------------
--$Id: vip_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblFigtingRank` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` varchar(32) NOT NULL DEFAULT '' COMMENT '玩家ID',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '角色名称',
  `Fighting` int(11) NOT NULL DEFAULT '0' COMMENT '战斗力',
   PRIMARY KEY (`PlatformID`,`HostID`,`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='战斗力排行榜表'

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	local Where = " where 1=1 "
	local Limit = ""
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.Limit and Options.Limit ~= "" then
		Limit = " limit 0," .. Options.Limit
	end
	local Sql = "select * from "..PlatformID.."_statics.tblFigtingRank " .. Where .. " order by HostID, Fighting DESC " .. Limit
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end

function GetStatics(self, Options)
	--先判断有没有选择平台，如果没有，则是选择全部平台
	local Results = {}
	if not Options.PlatformID or Options.PlatformID == "" then
		local PlatformMap = CommonFunc.GetPlatformList()
		for PlatformID, _ in pairs(PlatformMap) do
			Options.PlatformID = PlatformID
			Options.Limit = CommonData.FightingRankNum
			local RankRes = self:Get(Options)
			Results = self:MergeData(Results, RankRes)
		end
		Options.PlatformID = nil
	else
		Options.Limit = CommonData.FightingRankNum
		Results = self:Get(Options)
	end
	return Results
end

function MergeData(self, Results, RankRes)
	for _, Info in ipairs(RankRes) do
		table.insert(Results, Info)
	end
	--数组排序
	local SortFunc = function(A, B) return B.Fighting < A.Fighting end
	table.sort(Results, SortFunc)
	if #Results > CommonData.FightingRankNum then
		--把大于排名上限的都删除
		local Start = CommonData.FightingRankNum + 1
		local End = #Results
		for X = Start, End do
			Results[X] = nil
		end
	end
	return Results
end

function Insert(self, PlatformID, HostID, Uid, Name, Fighting)
	Name = CommonFunc.MysqlEscapeString(Name)
	local Sql = "insert into " .. PlatformID .. "_statics.tblFigtingRank(PlatformID, HostID, Uid, Name, Fighting)"
			.. " values('" .. PlatformID .. "','".. HostID .. "','" .. Uid .. "','"  .. Name .. "','" .. Fighting .. "')"
			.. " on duplicate key update Name = '" .. Name .. "', Fighting = '" .. Fighting .. "'"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end

function Delete(self, PlatformID, HostID)
	local Sql = "delete from " .. PlatformID .. "_statics.tblFigtingRank where PlatformID = '" .. PlatformID
			.."' and HostID = '" .. HostID .. "'"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res		
end



