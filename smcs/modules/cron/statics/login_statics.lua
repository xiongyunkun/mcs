----------------------------------------
--$Id: vip.lua 41401 2015-01-27 13:23:21Z xiongyunkun $
----------------------------------------
--[[
-- 登陆过程分析
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "LoginStatics" 


function CronStatics(self, PlatformID, HostID)
	-- 统计前一个小时的
	local Time = ngx.time() - 3600
	local Day = os.date("%Y-%m-%d", Time) 
	local Hour = tonumber(os.date("%H",Time))
	local HourStart = os.date("%Y-%m-%d %H:00:00",Time)
	local HourEnd = os.date("%Y-%m-%d %H:59:59",Time)
	local Res = self:GetLog(PlatformID, HostID, HourStart, HourEnd)

	local StepNums = {} --记录各步骤的次数
	for _, Info in ipairs(Res) do
		local Step = tonumber(Info.Step)
		local Uid = tonumber(Info.Uid)
		StepNums[Step] = (StepNums[Step] or 0) + 1
	end
	local Results = {}
	--剩下的再将登陆过程配置表中的统计流程加上
	local TypeNames = {["出现命名界面"] = true, ["战斗开始"] = true}
	for ID, ActionInfo in pairs(ActionAnalysisCfg) do
		local Num = StepNums[ID] or 0
		Results[ID] = Num
	end
	for Index, Num in pairs(Results) do
		LoginStaticsData:Insert(PlatformID, HostID, Day, Hour, Index, Num)
	end
	return true
end

--获得某段时间内的登陆分析日志
function GetLog(self, PlatformID, HostID, StartTime, EndTime)
	local Options = {
		HostID = HostID, 
		StartTime = StartTime,
		EndTime = EndTime,
	}
	local Res = ClientLoadLogData:Get(PlatformID, Options)
	return Res
end

--从时间中解析出小时
function GetHour(self, Time)
	local Hour = nil
	local TimeInfo = string.split(Time)
	if TimeInfo and TimeInfo[2] then
		local Seconds = string.split(TimeInfo[2], ":")
		if Seconds and Seconds[2] then
			Hour = Seconds[2] 
		end
	end
	return Hour
end

--全服统计
function CronTotalStatics(self, PlatformID)
	self:Statics3WLogin(PlatformID)
	self:StaticsStartNum(PlatformID)
end

--统计3W服的登陆日志
function Statics3WLogin(self, PlatformID)
	-- 统计前一个小时的
	local Time = ngx.time() - 3600
	local Day = os.date("%Y-%m-%d", Time) 
	local Hour = tonumber(os.date("%H",Time))
	local HourStart = os.date("%Y-%m-%d %H:00:00",Time)
	local HourEnd = os.date("%Y-%m-%d %H:59:59",Time)

	local Res = self:GetLog(PlatformID, CommonData.W3_HOSTID, HourStart, HourEnd)
	
	--之前记录过的设备号也不能排重
	local OldRecordMap = {}
	local OldIMEIRes = IMEIInfoData:Get({PlatformID = PlatformID, EndTime = HourEnd})
	for _, Info in ipairs(OldIMEIRes) do
		OldRecordMap[Info.IMEI] = OldRecordMap[Info.IMEI] or {}
		OldRecordMap[Info.IMEI][Info.Step] = true
	end
	--从Step=1到7中依次过滤掉老玩家信息
	local StepIMEIs = {}
	for _, Info in ipairs(Res) do
		if not OldRecordMap[Info.IMEI] or not OldRecordMap[Info.IMEI][Info.Step] then --不是老玩家的话就统计
			StepIMEIs[Info.Step] = StepIMEIs[Info.Step] or {}
			StepIMEIs[Info.Step][Info.IMEI] = true
		end
	end
	--当前统计时间
	local StaticsTime = os.date("%Y-%m-%d %H:%M:%S", Time + 3600)
	for Index = 1, 4 do
		local StepInfo = StepIMEIs[Index] or {}
		local Num = table.size(StepInfo) or 0
		LoginStaticsData:Insert(PlatformID, CommonData.W3_HOSTID, Day, Hour, Index, Num)
		--将点击图标的设备号记录下来，下次排重
		IMEIInfoData:Insert(PlatformID, StepInfo, Index, StaticsTime)
	end
	return true
end

--统计启动次数
function StaticsStartNum(self, PlatformID)

	local Day = os.date("%Y-%m-%d", ngx.time() - 3600) -- 统计前一个小时的
	--按照渠道来统计
	local Options = {
		HostID = CommonData.W3_HOSTID,
		StartTime = Day .. " 00:00:00",
		EndTime = Day .. " 23:59:59",
		Step = 1, --只统计点击图片的那个步骤
	}

	local Res = ClientLoadLogData:Get(PlatformID, Options)
	local DPIResults = {} --分辨率统计
	local ModelResults = {} --型号统计
	local BrandResults = {} --品牌统计
	for _, Info in ipairs(Res) do
		local PhoneInfo = string.split(Info.PhoneInfo, ";")
		if #PhoneInfo >= 7 then
			local Model = PhoneInfo[1]
			local Brand = PhoneInfo[2]
			local DPI = PhoneInfo[6] .. "*" .. PhoneInfo[7]
			DPIResults[DPI] = (DPIResults[DPI] or 0) + 1
			ModelResults[Model] = (ModelResults[Model] or 0) + 1
			BrandResults[Brand] = (BrandResults[Brand] or 0) + 1
		end
	end
	--记录入库
	for CIndex, Num in pairs(DPIResults) do --分辨率入库
		StartNumData:Insert(PlatformID, CommonData.W3_HOSTID, Day, "DPI", CIndex, Num)
	end
	for CIndex, Num in pairs(ModelResults) do --型号入库
		StartNumData:Insert(PlatformID, CommonData.W3_HOSTID, Day, "Model", CIndex, Num)
	end
	for CIndex, Num in pairs(BrandResults) do --品牌入库
		StartNumData:Insert(PlatformID, CommonData.W3_HOSTID, Day, "Brand", CIndex, Num)
	end
	return true
end





