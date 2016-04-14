----------------------------------------
--$Id: online_time.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 在线时长统计
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "Gold" 

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	--按照渠道来统计
	local GoldRes = GoldLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	local AddGoldResults = {}
	local SubGoldResults = {}
	local AddCreditResults = {}
	local SubCreditResults = {}
	for _, GoldInfo in ipairs(GoldRes) do
		if tonumber(GoldInfo["GoldType"]) == 1 then
			if tonumber(GoldInfo["Changes"]) >= 0 then
				self:MergeResults(AddGoldResults, GoldInfo)
			else
				self:MergeResults(SubGoldResults, GoldInfo)
			end
		elseif tonumber(GoldInfo["GoldType"]) == 2 then
			if tonumber(GoldInfo["Changes"]) >= 0 then
				self:MergeResults(AddCreditResults, GoldInfo)
			else
				self:MergeResults(SubCreditResults, GoldInfo)
			end
		end
	end
	--记录入库
	self:Insert(PlatformID, Day, CommonData.GoldTypes.Gold, CommonData.GoldStaticsTypes.Add, AddGoldResults)
	self:Insert(PlatformID, Day, CommonData.GoldTypes.Gold, CommonData.GoldStaticsTypes.Sub, SubGoldResults)
	self:Insert(PlatformID, Day, CommonData.GoldTypes.CreditGold, CommonData.GoldStaticsTypes.Add, AddCreditResults)
	self:Insert(PlatformID, Day, CommonData.GoldTypes.CreditGold, CommonData.GoldStaticsTypes.Sub, SubCreditResults)
	return true
end

--合并数据
function MergeResults(self, OrgResults, NewResults)
	local Channel = NewResults["Reason"]
	if not OrgResults[Channel] then
		OrgResults[Channel] = NewResults
		--再记录下消费人群Uids，需要去重
		OrgResults[Channel]["Uids"] = {tonumber(NewResults["Uid"])}
		OrgResults[Channel]["ConsumeNum"] = 1 --消费次数
	else
		OrgResults[Channel]["Changes"] = OrgResults[Channel]["Changes"] + NewResults["Changes"]
		OrgResults[Channel]["ConsumeNum"] = (OrgResults[Channel]["ConsumeNum"] or 0) + 1 --消费次数
		--再记录下消费人群Uids，需要去重
		if not OrgResults[Channel]["Uids"] then
			OrgResults[Channel]["Uids"] = {}
		end
		if not table.member_key(OrgResults[Channel]["Uids"], tonumber(NewResults["Uid"])) then
			table.insert(OrgResults[Channel]["Uids"], tonumber(NewResults["Uid"]))
		end
	end
	return OrgResults
end

function Insert(self, PlatformID, Date, GoldType, StaticsType, Results)
	for Channel, Result in pairs(Results) do
		local Uids = table.concat(Result.Uids or {}, ",")
		GoldData:Insert(PlatformID, Result.HostID, Date, Channel, GoldType, StaticsType, Result.Changes, Uids, Result.ConsumeNum)
	end
end



