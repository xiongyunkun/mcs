------------------------------------------
--$Id: vip_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblCardStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `CardTypeId` int(11) NOT NULL DEFAULT '1' COMMENT '英雄ID',
  `TotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '拥有数量',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`CardTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='英雄统计表' 

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
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.CardTypeId and Options.CardTypeId ~= "" and Options.CardTypeId ~= "0" then
		Where = Where .. " and CardTypeId = '" .. Options.CardTypeId .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblCardStatics " .. Where .. " order by HostID"
	local Res, Err = DB:ExeSql(Sql)
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
			for _, Info in ipairs(Res) do
				Results[Info.CardTypeId] = (Results[Info.CardTypeId] or 0) + 1
			end
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		for _, Info in ipairs(Res) do
			Results[Info.CardTypeId] = (Results[Info.CardTypeId] or 0) + 1
		end
	end
	return Results
end

--批量插入
function BatchInsert(self, PlatformID, Results)
	local NewResults = {}
	for _, Info in ipairs(Results) do
		local HostID = Info.HostID
		NewResults[HostID] = NewResults[HostID] or {}
		NewResults[HostID][Info.CardTypeId] = (NewResults[HostID][Info.CardTypeId] or 0) + 1
	end
	for HostID, Info in pairs(NewResults) do
		for CardTypeId, Num in pairs(Info) do
			self:Insert(PlatformID, HostID, CardTypeId, Num)
		end
	end
end


function Insert(self, PlatformID, HostID, CardTypeId, TotalNum)
	local Vals = {PlatformID, HostID, CardTypeId, TotalNum}
	local Sql = "insert into " .. PlatformID .. "_statics.tblCardStatics(PlatformID, HostID, CardTypeId, TotalNum) values('" 
			.. table.concat( Vals, "','") .."') on duplicate key update TotalNum=TotalNum+values(TotalNum)"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res		
end


