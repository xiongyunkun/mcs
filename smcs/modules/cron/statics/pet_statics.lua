----------------------------------------
--$Id: level_statics.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 魔神统计
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "PetStatics" 

--通过分析玩家信息表中的玩家等级获得玩家的等级分布
function CronStatics(self, PlatformID, HostID)
	local NowTime = os.time()
	local Day = os.date("%Y-%m-%d", NowTime - 3600) -- 统计前一个小时的
	--获得昨天的魔神数据
	local Yesterday = os.date("%Y-%m-%d", NowTime - 3600- 86400)
	local YesterdayPetList = PetDayStaticsData:Get(PlatformID, {HostID = HostID, Time = Yesterday})
	local PetResults = {}
	local DelPetList = {}
	for _, PetInfo in ipairs(YesterdayPetList) do
		PetInfo.Date = Day
		PetInfo.Name = CommonFunc.MysqlEscapeString(PetInfo.Name)
		PetResults[PetInfo.PetUid] = PetInfo
	end
	--再获得今天的魔神日志，更新魔神数据
	local PetLogList = PetLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .." 00:00:00", EndTime = Day .. " 23:59:59"})
	for _, PetLog in ipairs(PetLogList) do
		if PetLog.OperationType == 8 then --魔神删除
			PetResults[PetLog.PetUid] = nil
			table.insert(DelPetList, PetLog.PetUid)
		elseif PetLog.OperationType ~= 2 then --魔神拆解已经计算在魔神删除里面了
			--直接覆盖
			PetResults[PetLog.PetUid] = {
				HostID = HostID,
				PetUid = PetLog.PetUid,
				Date = Day,
				Uid = PetLog.Uid,
				Urs = PetLog.Urs,
				Name = CommonFunc.MysqlEscapeString(PetLog.Name),
				PetID = PetLog.PetID,
				Level = PetLog.Level,
				StarLevel = PetLog.StarLevel,
				Fighting = PetLog.Fighting,
			}
		end
	end
	--插入数据库
	PetDayStaticsData:BatchInsert(PlatformID, PetResults)
	--删除这些魔神
	if #DelPetList > 0 then
		PetDayStaticsData:Delete(PlatformID, HostID, Day, DelPetList)
	end
	return true
end



