----------------------------------------
--$Id: money.lua 88008 2016-01-18 12:51:31Z xiongyunkun $
----------------------------------------
--[[
-- 金钱消耗统计
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "Money" 

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", ngx.time() - 3600) -- 统计前一个小时的
	--按照渠道来统计
	local MoneyRes = MoneyLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	local AddMoneyResults = {}
	local SubMoneyResults = {}
	for _, MoneyInfo in ipairs(MoneyRes) do
		if tonumber(MoneyInfo["Changes"]) >= 0 then
			self:MergeResults(AddMoneyResults, MoneyInfo)
		else
			self:MergeResults(SubMoneyResults, MoneyInfo)
		end
	end
	--记录入库
	self:Insert(PlatformID, Day, CommonData.GoldStaticsTypes.Add, AddMoneyResults)
	self:Insert(PlatformID, Day, CommonData.GoldStaticsTypes.Sub, SubMoneyResults)
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

function Insert(self, PlatformID, Date, StaticsType, Results)
	for Channel, Result in pairs(Results) do
		local Uids = table.concat(Result.Uids or {}, ",")
		MoneyData:Insert(PlatformID, Result.HostID, Date, Channel, StaticsType, Result.Changes, Uids, Result.ConsumeNum)
	end
end



