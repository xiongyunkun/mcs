----------------------------------------
--$Id: money_log.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 拉取money相关日志并且入库,相关日志文件有：addmoney.lua, submoney.lua
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "MoneyLog" 
--请求参数类型
RequestType = "getlog"
-- 需要读取的文件名
FileNames = {"key/addmoney.log", "key/submoney.log"}

local Cols = {"Uid", "Urs", "Value", "Type", "Remain", "Name"}
--区别判断重复的数据，用于统计时间点的数据比对
local UniqueKey = "Uid"

--构造请求参数
function GenerateReqParams(self, PlatformID, HostID)
	local StartDate = os.date("%Y-%m-%d",os.time()) 
	local StartTime = os.date("%Y-%m-%d %H:%M:%S",GetTimeStamp(StartDate .. " 00:00:00"))  --默认是当天的0点
	local StartTimes = {}
	for _, FileName in ipairs(FileNames) do
		local Res = StaticsModuleData:Get({HostID = HostID, FileName = FileName, IndexName = IndexName})
		if Res and Res[1] then
			StartTime = Res[1]["StaticsTime"]
		end
		table.insert(StartTimes, StartTime)
	end
	local Params = {
		FileNames = table.concat(FileNames, ","),
		HostID = HostID,
		StartTimes = table.concat(StartTimes, ",")
	}
	return Params
end

--处理回调结果
function HandleResponse(self, PlatformID, HostID, Response, ExecuteTime, LastSaticsTimes)
	if not CommonFunc.CheckLogErr(HostID, IndexName, Response) then
		return false
	end
	local TotalNum = 0 
	for FileName, LogContent in pairs(Response) do
		if LogContent ~= "" or LogContent ~= " " then
			local LastSaticsTime = LastSaticsTimes[FileName]
			--需要把上一次统计时间点的记录拿出来对比下看有没有
			local SameTimeStatics = MoneyLogData:GetSameTimeStatics(PlatformID,{HostID=HostID, Time=LastSaticsTime})
			local Results = {}
			local Lines = string.split(LogContent, "\n")
			local LastTime = nil
			local IsSub = string.find(FileName, "sub")
			for _, Line in ipairs(Lines) do
				if Line ~= "" and Line ~= " " then
					local Result = {HostID,}
					local UniqueValue = nil
					for _, Col in ipairs(Cols) do
						local ColValue = CommonFunc.GetLogValue(Line, Col)
						if Col == "Value" and IsSub then
							ColValue = "-" .. ColValue --如果是扣除钻石的话前面添加负号
						end
						table.insert(Result, ColValue)
						if Col ==  UniqueKey then
							UniqueValue = tonumber(ColValue)
						end
					end
					--再提取时间
					local RegTime = CommonFunc.GetLogTime(Line)
					if SameTimeStatics[UniqueValue] ~= RegTime then
						--没有重复数据的才添加
						table.insert(Result, RegTime)
						table.insert(Results, Result)
						TotalNum = TotalNum + 1 --暂时先加1，后面再去分析时间统计
						LastTime = RegTime -- 时间取最后一个
					end
				end
			end
			if #Results > 0 then
				MoneyLogData:BatchInsert(PlatformID, Results)
			end
			-- 更新tblStaticsCfg表中统计时间记录
			if table.size(SameTimeStatics) ~= 0 and not LastTime then
				--如果此次获得数据都是与库里面的数据一样，将统计时间往后推后一秒
				LastSaticsTime = GetTimeStamp(LastSaticsTime)
				LastTime = os.date("%Y-%m-%d %H:%M:%S",LastSaticsTime + 1) --取下一秒
			end
			if LastTime then
				local Params = {
					HostID = HostID,
					FileName = FileName,
					IndexName = IndexName,
					StaticsTime = LastTime,
				}
				StaticsModuleData:Update(Params)
			end
			
		end
	end
	return true
end

