------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblLoginAnalysis` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `LoginNum` int(11) NOT NULL DEFAULT '0' COMMENT '登陆接口人数',
  `DownloadNum` int(11) NOT NULL DEFAULT '0' COMMENT '下载资源包人数',
  `ShowRoleNum` int(11) NOT NULL DEFAULT '0' COMMENT '展示创角人数',
  `RoleSucNum` int(11) NOT NULL DEFAULT '0' COMMENT '创角成功人数',
  `EnterGameNum` int(11) NOT NULL DEFAULT '0' COMMENT '进入游戏人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆过程分析统计表' 

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
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
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblLoginAnalysis " .. Where .. " order by HostID, Date"
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
			local Res = self:Get(Options)
			Results = self:MergeData(Results, Res)
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		Results = self:MergeData(Results, Res)
	end
	return Results
end

function MergeData(self, Results, Res)
	for _, Info in ipairs(Res) do
		if not Results[Info.Date] then
			Results[Info.Date] = Info
		else
			Results[Info.Date].LoginNum = Results[Info.Date].LoginNum + Info.LoginNum
			Results[Info.Date].DownloadNum = Results[Info.Date].DownloadNum + Info.DownloadNum
			Results[Info.Date].ShowRoleNum = Results[Info.Date].ShowRoleNum + Info.ShowRoleNum
			Results[Info.Date].RoleSucNum = Results[Info.Date].RoleSucNum + Info.RoleSucNum
			Results[Info.Date].EnterGameNum = Results[Info.Date].EnterGameNum + Info.EnterGameNum
		end
	end
	return Results
end

local Cols = {"LoginNum", "DownloadNum", "ShowRoleNum", "RoleSucNum", "EnterGameNum"}

function Insert(self, PlatformID, HostID, Date, NumInfo)
	local Values = {}
	local UpdateValues = {}
	for _, Key in ipairs(Cols) do
		local Value = NumInfo[Key] or 0
		local UpdateValue = Key .. "='" .. Value .. "'"
		table.insert(Values, Value)
		table.insert(UpdateValues, UpdateValue)
	end
	local Sql = "insert into " .. PlatformID .. "_statics.tblLoginAnalysis(PlatformID, HostID, Date,"..table.concat(Cols, ",")..")"
			.. " values('" .. PlatformID .. "','" .. HostID .. "','" .. Date .. "','".. table.concat(Values, "','") 
			.. "') on duplicate key update " .. table.concat(UpdateValues, ",")
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end


