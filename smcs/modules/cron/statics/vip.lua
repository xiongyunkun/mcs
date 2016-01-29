----------------------------------------
--$Id: vip.lua 54731 2015-04-01 13:06:11Z xiongyunkun $
----------------------------------------
--[[
-- vip用户统计
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "VIP" 

function CronStatics(self, PlatformID, HostID)
	--先统计vip人数
	local VipResults = {}
	local Day = os.date("%Y-%m-%d", ngx.time() - 3600) -- 统计前一个小时的
	local Options = {
		HostID = HostID, 
		NoVipLevel = 0, --查询VipLevel不等于0
		StartTime = Day .. " 00:00:00",
		EndTime = Day .. " 23:59:59",
	}
	local VipRes = LogoutLogData:Get(PlatformID, Options)
	for _, VipInfo in ipairs(VipRes) do
		local VipLevel = VipInfo.VipLevel
		local AddNowNum = VipInfo.IsVip ==1 and 1 or 0
		if not VipResults[VipLevel] then
			VipResults[VipLevel] = {VipNums = {[VipInfo.Uid] = true}, NowVipNums = {}}
		else
			VipResults[VipLevel].VipNums[VipInfo.Uid] = true
		end
		if VipInfo.IsVip == 1 then
			VipResults[VipLevel].NowVipNums[VipInfo.Uid] = true
		end
	end
	--记录入库
	for VipLevel, VipInfo in pairs(VipResults) do
		VipInfo.VipNum = table.size(VipInfo.VipNums)
		VipInfo.NowVipNum = table.size(VipInfo.NowVipNums)
		VipData:Insert(PlatformID, HostID, Day, VipLevel, VipInfo)
	end
	--再统计7天前的vip流失率
	self:StaticsLostNum(PlatformID, HostID, Day)
	return true
end

--统计流失率
function StaticsLostNum(self, PlatformID, HostID, Date)
	local LastDate = CommonFunc.GetOverDate(Date, -8) -- 算8天之前的
	local StartDay = CommonFunc.GetOverDate(Date, -7) -- 从第7天开始
	local Options = {
		HostID = HostID, 
		NoVipLevel = 0, --查询VipLevel不等于0
		IsVip = 1,
		StartTime = LastDate .. " 00:00:00",
		EndTime = LastDate .. " 23:59:59",
	}
	local VipRes = LogoutLogData:Get(PlatformID, Options)
	--整理数据，排除重复的
	local NewVipRes = {}
	for _, VipInfo in ipairs(VipRes) do
		NewVipRes[VipInfo.Uid] = VipInfo
	end
	--提取登陆日志对比出流失人数
	local LoginRes = LoginLogData:Get(PlatformID, {HostID = HostID, Uid = Uid, StartTime = StartDay .. " 00:00:00"})
	local LoginUids = {}
	for _, LoginInfo in ipairs(LoginRes) do
		LoginUids[LoginInfo.Uid] = true
	end
	local LostNums = {}
	for _, VipInfo in ipairs(NewVipRes) do
		local Uid  = VipInfo.Uid
		local VipLevel = VipInfo.VipLevel
		--判断这个uid后面有没有登录过
		if not LoginUids[Uid] then
			LostNums[VipLevel] = (LostNums[VipLevel] or 0) + 1 
		end
	end
	for VipLevel, LostNum in pairs(LostNums) do
		VipData:UpdateLostNum(PlatformID, HostID, LastDate, VipLevel, LostNum)
	end
	return true
end




