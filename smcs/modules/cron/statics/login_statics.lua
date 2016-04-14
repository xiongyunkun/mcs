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
local VerifyVersionIndex = 1 --登陆版本验证
local EnterUserListUIInex = 2 --老用户登陆加载角色信息
local DownloadSourceIndex = 3 --加载资源包
local ShowNewRoleIndex = 4 --创角页面展示
local NewRoleSucIndex = 5 --创角成功
local EnterGameIndex = 6 --进入游戏
local AccountEnterIndex = 7 --账号登陆验证
local PlayerAddIndex = 8 --点击创角按钮



function CronStatics(self, PlatformID, HostID)
	-- 统计前一个小时的
	local Time = os.time() - 3600
	local Day = os.date("%Y-%m-%d", Time) 
	local Hour = tonumber(os.date("%H",Time))
	local HourStart = os.date("%Y-%m-%d %H:00:00",Time)
	local HourEnd = os.date("%Y-%m-%d %H:59:59",Time)
	local Res = self:GetLog(PlatformID, HostID, HourStart, HourEnd)
	local StepNums = {} --记录各步骤的次数
	local StepUids = {} --记录各步骤的Uid列表
	for _, Info in ipairs(Res) do
		local Step = tonumber(Info.Step)
		local Uid = tonumber(Info.Uid)
		if not StepUids[Step] then
			StepUids[Step] = {}
		end
		StepUids[Step][Uid] = true
		StepNums[Step] = (StepNums[Step] or 0) + 1
	end
	local LoginNum = math.max((StepNums[AccountEnterIndex] or 0) - (StepNums[EnterUserListUIInex] or 0), 0) -- 登陆接口
	local DownloadNum = StepNums[DownloadSourceIndex] or 0--下载资源包
	local ShowRoleNum = StepNums[ShowNewRoleIndex] or 0 -- 创角页面展示
	local RoleSucNum = StepNums[NewRoleSucIndex]  or 0 -- 创角成功
	local EnterGameNum = StepNums[EnterGameIndex] or 0 -- 进入游戏
	local Results = {LoginNum, DownloadNum, ShowRoleNum, RoleSucNum, EnterGameNum,}
	--剩下的再将登陆过程配置表中的统计流程加上
	local TypeNames = {["出现命名界面"] = true, ["战斗开始"] = true}
	for ID, ActionInfo in pairs(ActionAnalysisCfg.Cfg) do
		local Num = 0
		if TypeNames[ActionInfo.Type] then
			Num = table.size(StepUids[ID] or {})
		else
			Num = StepNums[ID] or 0
		end
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






