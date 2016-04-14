----------------------------------------
--$Id: fighting.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 战斗力排行榜
-- 20150417:只统计改名之后的战斗力排行
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "FigtingRank" 
RankNum = 100 --只统计前100名

function CronStatics(self, PlatformID, HostID)
	local Day = os.date("%Y-%m-%d", os.time() - 3600) -- 统计前一个小时的
	--从今天的玩家退出日志中读取战斗力和角色名字
	local LogoutRes = LogoutLogData:Get(PlatformID, {HostID = HostID, StartTime = Day .. " 00:00:00", EndTime = Day .. " 23:59:59"})
	--把库中该HostID的数据都拿出来在一起排序
	local RankRes = FightRankData:Get({PlatformID = PlatformID, HostID = HostID, Limit = CommonData.FightingRankNum})
	--合并到一起
	local TotalRes = {}
	for _, Info in ipairs(RankRes) do
		if Info.Name ~= "@" .. Info.Uid then
			TotalRes[Info.Uid] = Info
		end
	end
	--因为LogoutRes是最新的，所以可以让LogoutRes覆盖之前的排名数据
	for _, Info in ipairs(LogoutRes) do
		if Info.Name ~= "@" .. Info.Uid then
			TotalRes[Info.Uid] = Info
		end
	end
	local NewRes = {}
	for _, Info in pairs(TotalRes) do
		table.insert(NewRes, Info)
	end
	--数组排序
	local SortFunc = function(A, B) 
		if B.Fighting == A.Fighting then --战斗力相同的情况下比较vip等级
			return B.VipLevel < A.VipLevel
		else
			return B.Fighting < A.Fighting
		end
	end
	table.sort(NewRes, SortFunc)
	FightRankData:Delete(PlatformID, HostID) --全部清空
	for Index, Info in ipairs(NewRes) do
		if Index <= CommonData.FightingRankNum then
			FightRankData:Insert(PlatformID, HostID, Info.Uid, Info.Name, Info.Fighting)
		end
	end
	return true
end



