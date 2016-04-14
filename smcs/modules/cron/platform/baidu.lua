----------------------------------------
--$Id: 360.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 百度平台创角，玩家升级时向百度推送数据
-- 创角推送，玩家等级在每增加5级的时候推送，及6,11,16.。。等级别
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "baidu"
local REQUEST_URL = "youxi.baidu.com/roleAction/gameRolePost.jsp" --发送地址
local API_KEY = 1090 --百度平台众神之神游戏ID

function CronSend(self, PlatformID, HostID, StartTime, EndTime)
	--把今天的注册数据都读取出来
	if PlatformID == IndexName then
		local RegLogList = AddPlayerLogData:Get(PlatformID, {HostID = HostID, StartTime = StartTime, EndTime = EndTime})
		local LevelUpLogList = LevelUpLogData:Get(PlatformID, {
			HostID = HostID, 
			StartTime = StartTime, 
			EndTime = EndTime,
		})
		--发送数据
		local ServerInfo = ServerData:GetServer({hostid = HostID})
		if not ServerInfo or #ServerInfo == 0 then
			return
		end
		local ServerID = ServerInfo[1].servmark
		local NowTime = os.date("%Y-%m-%d %H:%M:%S",os.time())
		--先发送创角
		for _, Info in ipairs(RegLogList) do
			local Urs = CommonFunc.ExtractPlatformUrs(Info.Urs)
			local Params = {
				api_key = API_KEY,
				user_id = Urs,
				server_id = ServerID,
				timestamp = UriEncode(NowTime),
				role_name = "@" .. Info.Uid,
				role_time = UriEncode(Info.Time),
				action = "CREATE",
				multi_flag = "N",
				role_level = "1",
				role_online_time = "1",
				role_count_online_time = "1",
			}
			Params["sign"] = self:GenerateSign(Params)
			ReqOutUrl(REQUEST_URL, Params)
		end
		--再发送升级数据
		for _, Info in ipairs(LevelUpLogList) do
			--只发送6,11,16,21这些等级的数据
			if Info.NewLevel ~= 1 and (Info.NewLevel - 1)%5 == 0 then
				Urs = CommonFunc.ExtractPlatformUrs(Info.Urs)
				local Params = {
					api_key = API_KEY,
					user_id = Urs,
					server_id = ServerID,
					timestamp = NowTime,
					role_name = Info.Name,
					role_time = Info.Time,
					action = "UPDATE",
					multi_flag = "N",
					role_level = Info.NewLevel,
					role_online_time = "",
					role_count_online_time = "",
				}
				Params["sign"] = self:GenerateSign(Params)
				ReqOutUrl(REQUEST_URL, Params)
			end
		end
	end
	return true
end

function GenerateSign(self, Params)
	local List = {}
	for Key, Value in pairs(Params) do
		table.insert(List, Key .. "=" .. Value)
	end
	table.sort(List)
	local Key = CommonFunc.GetInterfaceKey(PlatformID, "login_key") --登陆密钥
	table.insert(List, 1, Key)
	local MD5Str = ngx.md5(table.concat( List, ""))
	return MD5Str
end





