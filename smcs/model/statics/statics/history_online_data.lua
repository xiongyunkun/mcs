------------------------------------------
--$Id: vip_data.lua 41389 2015-01-27 13:04:31Z xiongyunkun $
------------------------------------------
--[[
CREATE TABLE `tblHistoryOnline` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `MaxOnline` int(11) NOT NULL DEFAULT '0' COMMENT '最高在线人数',
  `AveOnline` int(11) NOT NULL DEFAULT '0' COMMENT '平均在线人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `MinOnline` int(11) NOT NULL DEFAULT '0' COMMENT '最低在线人数',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史在线统计表' 

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
	if Options.HostIDs and type(Options.HostIDs) == "table" then
		local HostIDs = Options.HostIDs
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
			HostIDs = NewHostIDs
		end
		Where = Where .. " and HostID in ('" .. table.concat(HostIDs, "','") .. "')"
	end
	if Options.Date and Options.Date ~= "" then
		Where = Where .. " and Date = '" .. Options.Date .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Date >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Date <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from "..PlatformID.."_statics.tblHistoryOnline " .. Where .. " order by HostID, Date"
	--ngx.say(Sql)
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return {}, Err end
	return Res
end

function GetStatics(self, Options)
	local Results = {}
	local NewOptions = {
		PlatformID = Options.PlatformID,
		HostID = Options.HostID,
		HostIDs = Options.HostIDs,
	}
	if Options.PlatformID and Options.PlatformID ~= "" and Options.HostID 
		and Options.HostID ~= "" then
		local Res = self:Get(Options)
		Results = self:MergeData(Results, Res)
	else
		local StartTime = GetTimeStamp(tostring(Options.StartTime) .. " 00:00:00")
		local EndTime = GetTimeStamp(tostring(Options.EndTime) .. " 23:59:59")
		local Today = os.date("%Y-%m-%d", os.time()) 
		local PlatformMap = CommonFunc.GetPlatformList()
		local PlatformIDs = {}
		--如果选择了平台只获取该平台的，否则是全部有权限的平台
		if Options.PlatformID and Options.PlatformID ~= "" then
			table.insert(PlatformIDs, Options.PlatformID)
		else
			for PlatformID, _ in pairs(PlatformMap) do
				table.insert(PlatformIDs, PlatformID)
			end
		end
		
		local MD5Str = nil
		if #PlatformIDs > 0 then
			table.sort(PlatformIDs)
			MD5Str = ngx.md5(table.concat( PlatformIDs, ","))
		end
		while StartTime < EndTime do
			local Date = os.date("%Y-%m-%d",StartTime)
			local IsNewServer = 0 --默认不是新服
			if tonumber(Options.ServerType) == 2 then
				IsNewServer = 1 --只查询新服
			end
			if Date ~= Today and MD5Str then
				--不是今天的数据，先看看全服统计库里面有没有数据
				local TList = AllHistoryOnlineData:Get({MD5Str = MD5Str, Date = Date, IsNewServer = IsNewServer,})
				if TList and TList[1] then
					Results[Date] = TList[1] 
				end
			end
			if not Results[Date] or Results[Date].MaxOnline == 0 then
				NewOptions.Time = Date
				local OnlineRes = OnlineData:GetStatics(NewOptions)
				local Period = self:GetPeriod(Date)
				local MaxOnline, AveOnline, MinOnline = self:GetStaticsNum(OnlineRes, Period)
				Results[Date] = {
					MaxOnline = MaxOnline,
					MinOnline = MinOnline,
					AveOnline = AveOnline,
				}
				--同时记录入库,今天的数据不记录
				if  Date ~= Today and MD5Str then
					AllHistoryOnlineData:Insert(PlatformIDs, Date, MaxOnline, AveOnline, MinOnline, IsNewServer)
				end
			end
			StartTime = StartTime + 86400
		end
	end
	return Results 
end

local MIN_NUM = 100000 --最低在线人数判断阀值
--获得统计汇总时间内的最高在线和平均在线
function GetStaticsNum(self, StaticsRes, Period)
	local MaxNum = 0
	local MinNum = MIN_NUM
	local AveNum = 0
	local TotalNum = 0
	for Time, Num in pairs(StaticsRes) do
		TotalNum = TotalNum + Num
		if Num > MaxNum then
			MaxNum = Num
		end
		if Num < MinNum then
			MinNum = Num
		end
	end
	if TotalNum ~= 0 then
		AveNum = math.ceil(TotalNum/Period)
	end
	-- 如果还是等于MIN_NUM或者有区间段没有统计数据的话最低人数直接变为0
	if MinNum == MIN_NUM or table.size(StaticsRes) ~= Period then
		MinNum = 0 
	end
	return MaxNum, AveNum, MinNum
end

--获得时间周期次数(即经历过多少个5分钟)
function GetPeriod(self, Day)
	local StartTime = GetTimeStamp(Day .. " 00:00:00")
	local NowTime = os.time()
	local EndTime = StartTime + 86400 
	EndTime = EndTime < NowTime and EndTime or NowTime
	local Num = 0
	while StartTime < EndTime do
		StartTime = StartTime + 300 --5分钟统计一次的
		Num = Num + 1
	end
	return Num
end

function MergeData(self, Results, Res)
	for _, Info in ipairs(Res) do
		if not Results[Info.Date] then
			Results[Info.Date] = Info
		else
			Results[Info.Date].MaxOnline = Results[Info.Date].MaxOnline + Info.MaxOnline
			Results[Info.Date].AveOnline = Results[Info.Date].AveOnline + Info.AveOnline
			Results[Info.Date].MinOnline = Results[Info.Date].MinOnline + Info.MinOnline
		end
	end
	return Results
end


function Insert(self, PlatformID, HostID, Date, MaxOnline, AveOnline, MinOnline)
	local Sql = "insert into " .. PlatformID .. "_statics.tblHistoryOnline(PlatformID, HostID, Date, MaxOnline, AveOnline, MinOnline)"
			.. " values('" .. PlatformID .. "','".. HostID .. "','" .. Date .. "','"  .. MaxOnline .. "','" .. AveOnline .. "','" .. MinOnline .. "')"
			.. " on duplicate key update MaxOnline = '" .. MaxOnline .. "', AveOnline = '" .. AveOnline .. "', MinOnline = '" .. MinOnline .. "'"
	local HostIP = CommonFunc.GetHostIP(PlatformID)
	local Res, Err = DB:ExeSql(Sql, HostIP)
	if not Res then return nil, Err end
	return Res
end




