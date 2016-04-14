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
IndexName = "LoginAnalysis" 
local BattleStartIndex = 9
local BattleStopIndex = 10
local NameShowIndex = 11

function CronStatics(self, PlatformID, HostID)
	local ShowRoleLost = {} --成功创角流失
	local RoleSucLost = {} --进入游戏流失
	local FirstStartCombatLost = {} --第一次战斗开始流失
	local FirstEndCombatLost = {} --第一次战斗结束流失
	local SecondStartCombatLost = {} --第二次战斗开始流失
	local SecondEndCombatLost = {} --第二次战斗结束流失
	local NameShowLost = {} -- 命名页面流失
	local NameSucLost = {} --命名结束流失

	local StartTime = 1429063200 --2015/4/15 10:0:0
	local EndTime = 1429372800 -- 2015/4/19 0:0:0
	while(StartTime <= EndTime) do
		local Time = StartTime - 3600
		local Day = os.date("%Y-%m-%d", Time) 
		local Hour = tonumber(os.date("%H",Time))
		local HourStart = os.date("%Y-%m-%d %H:00:00",Time)
		local HourEnd = os.date("%Y-%m-%d %H:59:59",Time)
		local Res = self:GetLog(PlatformID, HostID, HourStart, HourEnd)
		--有一些统计过程点还需要把上上一个小时的拿出来统计
		local LastHourStart = os.date("%Y-%m-%d %H:00:00",Time - 3600)
		local LastHourEnd = os.date("%Y-%m-%d %H:59:59",Time - 3600)
		local LastRes = self:GetLog(PlatformID, HostID, nil, LastHourEnd)
		local StepNums = {} --记录各步骤的次数
		for _, Info in ipairs(Res) do
			local Step = tonumber(Info.Step)
			if not StepNums[Step] then
				StepNums[Step] = {}
			end
			StepNums[Step][Info.Urs] = true
		end
		--第一次战斗和第二次战斗的统计
		local FirstStartCombatNum, FirstEndCombatNum, SecondStartCombatNum, SecondEndCombatNum = self:GetCombatInfo(Res, LastRes)
		local NameShowNum = self:GetNameShowNum(Res) --命名展示页面
		ShowRoleLost = self:GetLostUrs(StepNums[4], StepNums[5], ShowRoleLost) --成功创角流失
		RoleSucLost = self:GetLostUrs(StepNums[5], StepNums[6], RoleSucLost) --进入游戏流失
		FirstStartCombatLost = self:GetLostUrs(StepNums[6],FirstStartCombatNum, FirstStartCombatLost) --第一次战斗开始流失
		FirstEndCombatLost = self:GetLostUrs(FirstStartCombatNum, FirstEndCombatNum, FirstEndCombatLost) --第一次战斗结束流失
		SecondStartCombatLost = self:GetLostUrs(FirstEndCombatNum, SecondStartCombatNum, SecondStartCombatLost) --第二次战斗开始流失
		SecondEndCombatLost = self:GetLostUrs(SecondStartCombatNum, SecondEndCombatNum, SecondEndCombatLost) --第二次战斗结束流失
		NameShowLost = self:GetLostUrs(SecondEndCombatNum, NameShowNum, NameShowLost) -- 命名页面流失
		NameSucLost = self:GetLostUrs(NameShowNum, StepNums[12], NameSucLost) --命名结束流失
		StartTime = StartTime + 3600
	end
	local Titles = {"过程点", "进入人数", "流失人数", "流失玩家ID"}
	local Data ={{"成功创角流失", table.size(StepNums[5]),#ShowRoleLost, table.concat( ShowRoleLost, ", ")}}
	table.insert(Data,{"进入游戏流失", table.size(StepNums[6]),#RoleSucLost, table.concat( RoleSucLost, ", ")})
	table.insert(Data,{"第一次战斗开始流失", table.size(FirstStartCombatNum),#FirstStartCombatLost, table.concat( FirstStartCombatLost, ", ")})
	table.insert(Data, {"第一次战斗结束流失", table.size(FirstEndCombatNum),#FirstEndCombatLost, table.concat( FirstEndCombatLost, ", ")})
	table.insert(Data, {"第二次战斗开始流失", table.size(SecondStartCombatNum),#SecondStartCombatLost, table.concat( SecondStartCombatLost, ", ")})
	table.insert(Data, {"第二次战斗结束流失", table.size(SecondEndCombatNum),#SecondEndCombatLost, table.concat( SecondEndCombatLost, ", ")})
	table.insert(Data, {"命名页面流失", table.size(StepNums[11]),#NameShowLost, table.concat( NameShowLost, ", ")})
	table.insert(Data, {"命名结束流失", table.size(StepNums[12]),#NameSucLost, table.concat( NameSucLost, ", ")})
	
	local ExcelStr = CommonFunc.ExportExcel("流失统计.xls", Titles, Data)
	ngx.say(ExcelStr)
	return true
end

function GetLostUrs(self, StartStepUrs, EndStepUrs, Results)
	StartStepUrs = StartStepUrs or {}
	EndStepUrs = EndStepUrs or {}
	for Urs, _ in pairs(StartStepUrs) do
		if not EndStepUrs[Urs] then
			table.insert(Results, Urs)
		end
	end
	return Results
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

--解析出第一次战斗和第二次战斗开始和结束的信息
function GetCombatInfo(self, Res, LastRes)
	local FirstStartCombat = {}
	local FirstEndCombat = {}
	local SecondStartCombat = {}
	local SecondEndCombat = {}
	--按照uid以及对应的日志出现的次数来整理
	local Results = {}
	local LastResults = {} --之前的战斗统计
	local UrsMap = {}
	for _, Info in ipairs(Res) do
		--只统计战斗开始和战斗结束的日志
		if Info.Step == BattleStartIndex or Info.Step == BattleStopIndex then
			if not Results[Info.Uid] then
				Results[Info.Uid] = {}
			end
			Results[Info.Uid][Info.Step] = (Results[Info.Uid][Info.Step] or 0) + 1
			UrsMap[Info.Uid] = Info.Urs
		end
	end
	--同时还要对比分析上一个小时的数据，如果上一个小时该玩家也有同样的日志，相关的次数+1
	for _, Info in ipairs(LastRes) do
		--也是只统计战斗开始和战斗结束的日志
		if Info.Step == BattleStartIndex or Info.Step == BattleStopIndex then
			if not LastResults[Info.Uid] then
				LastResults[Info.Uid] = {}
			end
			LastResults[Info.Uid][Info.Step] = (LastResults[Info.Uid][Info.Step] or 0) + 1
		end
	end
	for Uid, Info in pairs(Results) do
		local StartNum = Info[BattleStartIndex]
		local EndNum = Info[BattleStopIndex]
		if StartNum then
			if LastResults[Uid] and LastResults[Uid][BattleStartIndex] and LastResults[Uid][BattleStopIndex] then
				if LastResults[Uid][BattleStartIndex] < 2 then 
					SecondStartCombat[UrsMap[Uid]] = true
				end
			else
				FirstStartCombat[UrsMap[Uid]] = true
				if StartNum > 1 and (Info[BattleStopIndex] or LastResults[Uid][BattleStopIndex]) then
					SecondStartCombat[UrsMap[Uid]] = true
				end
			end
		end	
		if EndNum then
			if LastResults[Uid] and LastResults[Uid][BattleStopIndex] and LastResults[Uid][BattleStartIndex] then
				if LastResults[Uid][BattleStopIndex] < 2 then
					SecondEndCombat[UrsMap[Uid]] = true
				end
			else
				FirstEndCombat[UrsMap[Uid]] = true
				if EndNum > 1 and (Info[BattleStartIndex] or LastResults[Uid][BattleStartIndex]) then
					SecondEndCombat[UrsMap[Uid]] = true
				end
			end
		end	
	end
	return FirstStartCombat, FirstEndCombat, SecondStartCombat, SecondEndCombat
end

--计算命名界面出现次数，主要是排重处理
function GetNameShowNum(self, Res)
	local ShowNum = 0
	local Results = {}
	for _, Info in ipairs(Res) do
		if Info.Step == NameShowIndex then
			Results[Info.Urs] = true
		end
	end
	return Results
end







