------------------------------------------
--$Id: online_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblPayActualTime` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `PayCashNum` int(11) DEFAULT '0' COMMENT '充值金额',
  `PayUserNum` int(11) DEFAULT '0' COMMENT '充值人数',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  PRIMARY KEY (`HostID`,`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实时充值统计表' 

--]]
module(...,package.seeall)

--查询数据,这里必须选择平台
function Get(self, Options)
	local PlatformID = Options.PlatformID
	if not PlatformID then
		return {}
	end
	local Where = " where Flag = 'true' "
	if Options.HostID and Options.HostID ~= "" then
		local HostID = Options.HostID
		if not Options.NoMerge then
			HostID = CommonFunc.GetToHostID(HostID) --合服转换
		end
		Where = Where .. " and HostID = '" .. HostID .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	if Options.Time and Options.Time ~= "" then
		Where = Where .. " and Time >= '" .. Options.Time .. " 00:00:00' and Time <= '" .. Options.Time .. " 23:59:59'"
	end
	local Sql = "select HostID, Time,sum(PayCashNum) as PayNum, sum(PayUserNum) as UserNum, Currency from "
		..PlatformID.."_statics.tblPayActualTime " .. Where .. " group by HostID, Time"
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
			for _, Info in ipairs(Res) do
				local PayNum = CommonFunc.TransformCurrency(Info.Currency, Info.PayNum)
				if not Results[Info.Time] then
					Results[Info.Time] = {PayNum = PayNum, UserNum = Info.UserNum}
				else
					Results[Info.Time].PayNum = Results[Info.Time].PayNum + PayNum
					Results[Info.Time].UserNum = Results[Info.Time].UserNum + Info.UserNum
				end
			end
		end
		Options.PlatformID = nil
	else
		local Res = self:Get(Options)
		for _, Info in ipairs(Res) do
			local PayNum = CommonFunc.TransformCurrency(Info.Currency, Info.PayNum)
			if not Results[Info.Time] then
				Results[Info.Time] = {PayNum = PayNum, UserNum = Info.UserNum}
			else
				Results[Info.Time].PayNum = Results[Info.Time].PayNum + PayNum
				Results[Info.Time].UserNum = Results[Info.Time].UserNum + Info.UserNum
			end
		end
	end
	return Results
end


function Insert(self, PlatformID, HostID, PayCashNum, PayUserNum, Time)
	local Sql = "insert into " .. PlatformID .. "_statics.tblPayActualTime(HostID, PayCashNum, PayUserNum, Time) values('"
			.. HostID .. "','" .. PayCashNum .. "','" .. PayUserNum .. "','" .. Time .. "')"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res		
end


