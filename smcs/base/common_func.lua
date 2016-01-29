----------------------------------------
--$Id: common_func.lua 21449 2014-10-22 06:46:41Z xiongyunkun $
----------------------------------------
--[[
-- 公用方法
--
--]]

module(...,package.seeall)

--平台列表
function GetPlatformList(IsAll)
	local PlatformList = PlatformData:GetPlatform()
	local Platforms = {}
	for _, Platform in ipairs(PlatformList) do
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	if IsAll then
		return Platforms --如果选择所有的则直接返回
	end
	--再获得该用户拥有权限的平台
	local SelectedMap = {}
	local PlatformPermissions = GetSession("PlatformPermissions")
	for PlatformID, _ in pairs(PlatformPermissions or {}) do
		if Platforms[PlatformID] then
			SelectedMap[PlatformID] = Platforms[PlatformID]
		end
	end
	return SelectedMap
end

--服列表
function GetServers(PlatformID)
	--如果平台为空服务器列表也直接返回为空
	if not PlatformID or PlatformID == "" then 
		return {} 
	end
	
	local Servers = MixServerData:GetServers(PlatformID)
	local NewServers = {}
	for _, Server in ipairs(Servers) do
		NewServers[Server.hostid] = Server.name
	end
	return NewServers
end

--获得多选服务器类型选择列表
function GetMulServerTypes()
	local Types = {
		"自选大区(只发下面所选大区)",
		"所有大区(除去下面所选大区)",
	}
	return Types
end

--获得操作类型
function GetOperationType()
	local Types = {"立即执行","定时执行"}
	return Types
end

function GetBroadcastTypes()
	local Types = {
	"聊天框世界频道",
	"聊天框系统频道",
	"系统滚屏公告",
	}
	return Types
end

--[[
func：导出成excel文件
params: 
	Titles:表格头部
	Contents：表格内容，注意每行数据都用一个数组来表示，有多行数据就用多个数组
]]
function ExportExcel(FileName, Titles, Contents)
	--设置htmp头部
	ngx.header["Content-type"] = "application/vnd.ms-execl"
	ngx.header["Content-Disposition"] = "attachment; filename=" .. FileName
	ngx.header["Pragma"] = "no-cache"
	ngx.header["Expires"] = 0
	--构造内容
	local ContentArray = {}
	local NewTitles = {}
	for _, Title in ipairs(Titles) do
		Title = utf2gbk:iconv(Title) --转成gbk格式
		table.insert(NewTitles, Title or "")
	end
	table.insert(ContentArray, table.concat(NewTitles, "\t"))
	for _, RowContent in ipairs(Contents) do
		local NewRowContent = {}
		for _, ColValue in ipairs(RowContent) do
			ColValue = utf2gbk:iconv(ColValue) --转成gbk格式
			table.insert(NewRowContent, ColValue)
		end
		table.insert(ContentArray, table.concat(NewRowContent, "\t"))
	end
	local ContentStr = table.concat( ContentArray, "\n")
	return ContentStr
end
--[[
  数字格式化
  例如：1234567890 格式化为：1,234,567,890
]]
function NumberFormat(Number)
	local AbsFlag = ""
	local AbsNum = math.abs(Number)
	if AbsNum ~= Number then
		AbsFlag = "-"
	end
	local AbsStr = tostring(AbsNum)
	local StrInfo = string.split(AbsStr, ".")
	local NumStr = StrInfo[1] 
	local FloatStr = StrInfo[2] and "." .. StrInfo[2] or ""
	local Length = string.len(NumStr)
	local StartIndex = 1
	local EndIndex = Length % 3
	local FormatStr = ""
	while true do
		local Str = string.sub(NumStr, StartIndex, EndIndex)
		if StartIndex == 1 then
			FormatStr = FormatStr .. Str
		else
			FormatStr = FormatStr .. "," .. Str
		end
		if EndIndex == Length then
			break
		end
		StartIndex = EndIndex + 1
		EndIndex = math.min(EndIndex + 3, Length)
	end
	FormatStr = AbsFlag .. FormatStr .. FloatStr
	return FormatStr
end

-- 生成流水号
function GenerateTransID(OperationTime)
	local TimeStamp = GetTimeStamp(OperationTime)
	local Random = math.random(1, 9999) --取随机数
	return TimeStamp .. "" .. Random
end

-- 判断日志返回是否错误
function CheckLogErr(HostID, IndexName, Response)
	-- 先判断是否返回的是数字错误(500等错误）
	if tonumber(Response) then
		--[[for _, FileName in ipairs(FileNames) do
			local Options = {
				HostID = HostID,
				FileName = FileName,
				ErrContent = Response,
			}
			StaticsErrData:Insert(Options)
		end]]
		return false
	end
	local Flag = true
	for FileName, LogContent in pairs(Response) do
		-- 过滤掉空白字符串
		LogContent = string.strip(LogContent)
		if string.find(LogContent, "shell error code:") or string.find(LogContent, "get shell result error") then
			--记录入错误日志库
			local Options = {
				HostID = HostID,
				FileName = FileName,
				StaticsIndex = IndexName,
				ErrContent = LogContent,
			}
			StaticsErrData:Insert(Options)
			Flag = false
		end
	end
	return Flag
end

--用正则表达式提取Log对应的内容
function GetLogValue(Line,Key, DefaultValue)
	local Key = "[), ]" .. Key .. " = "
	local Value = DefaultValue or ""
	local From, To = string.find(Line, Key)
	if not From then
		return Value --没有找到，直接返回
	end
	local CLine = string.sub(Line, To+1)
	local Strs = string.split(CLine, ",")
	if Strs and Strs[1] then
		Value = Strs[1]
	end
	Value = MysqlEscapeString(Value) --mysql转义
	return Value
end

--获得日志时间
function GetLogTime(Line)
	local Match = "%[[%S%s]+]"
	local Time = string.match(Line, Match)
	Time = string.sub(Time,2,string.len(Time)-1)
	return Time
end

--获得距离Day这天相隔OverDays天的日期
--params: Day:2015-01-24 OverDays: -1
function GetOverDate(Day, OverDays)
	local Timestamp = GetTimeStamp(Day .. " 00:00:00")
	Timestamp = Timestamp + OverDays * 86400
	return os.date("%Y-%m-%d", Timestamp)
end

--获得修正时间,统计的时候可能不是准时的，根据其TimeDiff时间间隔计算其修正时间
--例如当前执行时间是10:01，Frequency为5其修正执行时间为10:00
function GetCorrectTime(Frequency)
	local NowTime = ngx.time()
	local Date = os.date("%Y-%m-%d", NowTime)
	Date = Date .. " 00:00:00"
	local StartTime = GetTimeStamp(Date)
	local EndTime = StartTime + 86400
	while StartTime < EndTime do
		if StartTime + Frequency > NowTime then
			break
		end
		StartTime = StartTime + Frequency
	end
	return StartTime
end

--验证参数
function VerifyGMParms(GMRule, GMParams)
	--GM命令
	local GMCMD = ""
	local Func = function() GMCMD = string.format(GMRule, unpack(GMParams)) end
	local Succed, Err = xpcall(Func, debug.traceback)
	if not Succed then
		return false, "GM参数错误，请重新填写,Err:"..tostring(Err)
	else
		return true, GMCMD
	end
end

function ExecuteGM(Args, GMID, GMCMD, OperationTime, GsID)
	--先在tblGMOperations表中记录
	local User = UserData:GetUserById(GetSession("UserId"))
	GsID = GsID or 0 --默认都是到0进程上执行
	local Options = {
		PlatformID = Args.PlatformID,
		HostIDs = Args.HostID,
		RuleID = GMID,
		GsID = GsID,
		GMValues = GMCMD,
		OperationTime = OperationTime,
		Operator = User and User["account"] or "",
		TransID = GenerateTransID(OperationTime),
		Memo = "",
	}
	local ID = GMOperationData:Insert(Options)
	--开始执行
	local ShellValues = {Args.HostID, GsID, '"' .. GMCMD .. '"', "'" .. OperationTime .. "'", Options.TransID}
	ShellValues = table.concat(ShellValues, ";") --分号拼接
	ShellValues = string.gsub(ShellValues, "\n", "") --过滤掉换行符
	ShellValues = string.gsub(ShellValues, "\r", "")
	local Params = {
		shellname = CommonData.ShellMap[4],
		shellparam = ShellValues,
		IsPend = "true", --挂起等待
	}
	local Flag = nil
	local Response = nil
	for X = 1, 3 do --默认调用三次，只要有一次成功则跳出循环
		Flag, Response = ReqCmcsByServerId(tonumber(Args.HostID), "executegm", Params)
		if Flag then
			break
		end
	end
	local Result = "执行失败"
	if Flag then
		--提交对应的服务器
		GMOperationData:UpdateStatus(ID,2) --将状态更新为已执行
		--将结果记录入库
		GMOperationData:UpdateResult(ID, Response)
		Response = UnSerialize(Response) 
		if Response then
			Result = Response.Result == "true" and "执行成功" or "执行失败"
		end
	end
	return Flag, Result
end

--mysql字符串替换，主要是针对单引号转义字符
function MysqlEscapeString(Str)
	Str = string.gsub(Str, "\\", '\\\\')
	Str = string.gsub(Str, "'", "\\'")
	return Str
end

--获得对应平台接口的密钥
function GetInterfaceKey(PlatformID, IndexName)
	local Key = "123456" --默认都是123456
	local Options = {
		PlatformID = PlatformID,
		IndexName = IndexName,
	}
	local KeyInfo = InterfaceKeyData:Get(Options)
	if KeyInfo and KeyInfo[1] then
		Key = KeyInfo[1].Sign
	end
	return Key
end

--发送RTX提醒
function SendRTX(Receivers, Title, Content)
	Title = utf2gbk:iconv(Title) --转成gbk格式
	Content = utf2gbk:iconv(Content) --转成gbk格式
	Receivers = type(Receivers) == "table" and table.concat( Receivers, ",") or Receivers
	local Params = {
		"receiver=" .. Receivers,
		"title=" .. ngx.escape_uri(Title),
		"msg=" .. ngx.escape_uri(Content),
		"ext=" .. "1", --扩展字段,其实没有用，只是为了抵消最后那个问号
	}
	local Url = CommonData.RTX_URL .. table.concat(Params, "&")
	local Flag, Response = ReqOutUrl(Url)
	return Response
end

function SendMail(Receivers, ErroKey, Content)
	ErroKey = utf2gbk:iconv(ErroKey) --转成gbk格式
	Content = utf2gbk:iconv(Content) --转成gbk格式
	
	local Params = {
		"errorkey=" .. ngx.escape_uri(ErroKey),
		"Content=" .. ngx.escape_uri(Content),
	}

	local Url = CommonData.MAIL_URL .. table.concat(Params, "&")
	local Flag, Response = ReqOutUrl(Url)
	return Response
end
--判断字符串是否为空
function IsStrEmpty(Str)
	return not Str or Str == ""
end

-- 获取SDKName对应的ServerList 
function GetServerListByFileName(FileName)
	local InListServer = {}
	local ServList = { ServerList = {} }
	local ServerInList = ServerData:GetServerSDKInfo(FileName)
	for _, Svrinlist in pairs(ServerInList) do
		InListServer[Svrinlist.serverid] = true
	end
	if not next(InListServer) then
		return {}
	end
	
	local Servers = ServerData:GetAllServers()
	for id, Server in ipairs(Servers) do
		if InListServer[Server.hostid] then
			if not ServList.ServerList[Server.hostid] then
				ServList.ServerList[Server.hostid] = {
					Ip = Server.address,
					Port = Server.ports,
					Name = Server.name,
					State = Server.status,
					Priority = Server.priority,
					Tips = Server.tips
				}
			end
		end
	end

	return ServList
end

function GetEnvListByEnvName(EnvName, FileName)
	local UrlCfg = SDKCfg.UrlList[EnvName]
	if not UrlCfg then return end

	local EnvList = {
		["ASSET_URL"] =  UrlCfg.AssetUrl,
		["FILE_URL"] = UrlCfg.FileUrl,
		["SERVER_LIST_URL"] = UrlCfg.ServerListUrl .. "serverlist/" .. FileName .. ".txt",
		["BROADCAST_URL"] = UrlCfg.BroadCastUrl,
	}
	
	return EnvList
end

--查询获得合服之后的目标服，如果没有合服则直接返回源服HostID
function GetToHostID(SrcHostID)
	SrcHostID = tonumber(SrcHostID)
	--TODO:后面做合服的时候再做扩展
	local ToHostID = SrcHostID
	return ToHostID
end

--从渠道账号中获得渠道ID
function GetPlatformIDByUrs(Urs)
	local DefaultPlatformID = "test"
	local PlatformID = DefaultPlatformID
	if Urs and Urs ~= "" then
		local SDKID = nil
		for X in string.gmatch(Urs, "(%d+)_%d+_%d+") do
			SDKID = X
			break
		end
		if SDKID then
			SDKID = tonumber(SDKID)
			local SDKIDMap = ngx.shared.sdkid_platform_map --sdkid-map映射表
			local Platforms = SDKIDMap:get_keys(0) 
			if #Platforms == 0 then --dict中未空，全部初始化一下
				Platforms = PlatformData:GetPlatform()
				for _, Info in ipairs(Platforms) do
					UpdateSDKIDMapDict(Info.SDKID, Info.PlatformID)
				end
			end
			PlatformID = SDKIDMap:get(SDKID)
		end
		
		if not PlatformID then --如果没有就取默认值
			PlatformID = DefaultPlatformID 
		end
	end
	return PlatformID
end

--根据HostID查询该HostID所在的平台列表
function GetPlatformListByHostID(HostID)
	local PlatformList = {}
	local PRes = MixServerData:Get({HostID = HostID})
	for _, PInfo in ipairs(PRes) do
		local PlatformID = PInfo.PlatformID
		table.insert(PlatformList, PlatformID)
	end
	return PlatformList
end

--更新SDK缓存
function UpdateSDKIDMapDict(SDKID, PlatformID)
	local SDKIDMap = ngx.shared.sdkid_platform_map --sdkid-map映射表
	SDKIDMap:set(tonumber(SDKID), PlatformID)
end

--转换成页面展示的奖励列表
function GetReward(Rewards)
	local Results = {}
	local RewardList = string.split(Rewards, ";")
	for _, Reward in ipairs(RewardList) do
		--再用下划线划分
		local RewardInfo = string.split(Reward, "_")
		if #RewardInfo == 3 and CommonData.MAIL_TYPE2NAME[tonumber(RewardInfo[1])] then
			local RewardName = CommonData.MAIL_TYPE2NAME[tonumber(RewardInfo[1])]
			if RewardName == "物品" then
				local ItemName = ItemDataMap[tonumber(RewardInfo[3])] or "未知物品"
				Results[ItemName] = (Results[ItemName] or 0) + tonumber(RewardInfo[2])
			else
				Results[RewardName] = (Results[RewardName] or 0) + tonumber(RewardInfo[2])
			end
		end
	end
	return Results
end



