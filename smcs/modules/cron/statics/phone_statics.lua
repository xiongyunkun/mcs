----------------------------------------
--$Id: 
----------------------------------------
--[[
-- 手机型号神马的分析
--]]

-- 需要读取的文件名
--
module(...,package.seeall)

--统计指标
IndexName = "PhoneStatics"
function CronStatics(self, PlatformID, HostID)
	local Date = os.date("%Y-%m-%d", ngx.time() - 3600) -- 统计前一个小时的
	local StartTime = Date .. " 00:00:00"
	local EndTime = Date .. " 23:59:59"
	local Options = {HostID = HostID, StartTime = StartTime, EndTime = EndTime,}
	
	local LoginRes = LoginLogData:Get(PlatformID, {HostID = HostID, StartTime = StartTime, EndTime = EndTime})

	
	local Results = {}
	for _, Info in ipairs(LoginRes) do
		local PhoneInfo = Info.PhoneInfo
		local PhoneInfoTbl = string.split(PhoneInfo, ";")
		
		local Uid = Info.Uid
		
		local Model = PhoneInfoTbl[1]
		local Brand = PhoneInfoTbl[2]
		local SysVer = PhoneInfoTbl[3]
		local SdkVer = PhoneInfoTbl[4]
		local SimOperation = PhoneInfoTbl[5]
		local DPI = PhoneInfoTbl[6] .. "*" .. PhoneInfoTbl[7]
		local IMEI = PhoneInfoTbl[8]
		local IMSI = PhoneInfoTbl[9]
		
		if IMEI then
			-- 加入Uid重复判断
			local OldRes = PhoneData:Get({PlatformID = PlatformID, HostID = HostID, IMEI = IMEI})
			
			local Uids = ""
			if not next(OldRes) then
				Uids = tostring(Uid)	
			else
				for _, OldInfo in pairs(OldRes) do
					Uids = OldInfo.Uids
					local OldUids = string.split(OldInfo.Uids, ",")
					if not table.member_key(OldUids, tostring(Uid) ) then
						Uids = Uids .. "," .. Uid
						break
					end
				end
			end
    
			local Result = {} 
			Result["PlatformID"] 	= PlatformID 	
			Result["HostID"]		= HostID		
			Result["IMEI"]			= IMEI		
			Result["IMSI"]			= IMSI		
			Result["Model"] 		= Model 		 
			Result["Brand"] 		= Brand 		 
			Result["SysVer"] 		= SysVer 		 
			Result["SdkVer"] 		= SdkVer 		 
			Result["SimOperation"]	= SimOperation 
			Result["DPI"] 			= DPI
			Result["Uids"] 			= Uids 
			Result["Date"]			= Date
			
			table.insert(Results, Result)
		end
	end
	if #Results > 0 then
		PhoneData:BatchInsert(PlatformID, HostID, Results)
	end
	return true
end

--[[

	local Model = {} -- 记录机型种类
	local Brand = {} -- 品牌
	local SysVer = {} -- 系统版本
	local SdkVer = {} -- sdk版本
	local SimOperation = {} -- 运营商
	local DPI = {}	--分辨率
	
	local LoginNum = 0
	
	Model[ PhoneInfoTbl[1] ] = ( Model[ PhoneInfoTbl[1] ] or 0 ) + 1
	Brand[ PhoneInfoTbl[2] ] = ( Brand[ PhoneInfoTbl[2] ] or 0 ) + 1
	SysVer[PhoneInfoTbl[3] ] = ( SysVer[ PhoneInfoTbl[3] ] or 0 ) + 1
	SdkVer[PhoneInfoTbl[4] ] = ( SdkVer[ PhoneInfoTbl[4] ] or 0 ) + 1
	SimOperation[PhoneInfoTbl[5] ] = (SimOperation[PhoneInfoTbl[5] ] or 0 ) + 1
	DPI[PhoneInfoTbl[6] .. "*" .. PhoneInfoTbl[7] ] = (DPI[PhoneInfoTbl[6] .. "*" .. PhoneInfoTbl[7] ] or 0) + 1
	LoginNum = LoginNum + 1
--	LoginStaticsData:Insert(PlatformID, HostID, )
--]]

