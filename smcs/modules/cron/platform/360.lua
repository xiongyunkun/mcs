----------------------------------------
--$Id: 360.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 360平台发送数据
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "360"
local REQUEST_URL = "game.api.1360.com/player"

function CronSend(self, PlatformID, HostID, StartTime, EndTime)
	--把今天的注册数据都读取出来
	if PlatformID == IndexName then
		local RegLogList = AddPlayerLogData:Get(PlatformID, {HostID = HostID, StartTime = StartTime, EndTime = EndTime})
		local LevelUpLogList = LevelUpLogData:Get(PlatformID, {
			HostID = HostID, 
			StartTime = StartTime, 
			EndTime = EndTime,
			MinNewLevel = 30, --只获得30级别以上的升级日志
		})
		local ServerInfo = ServerData:GetServer({hostid = HostID})
		if not ServerInfo or #ServerInfo == 0 then
			return
		end
		local ServerID = ServerInfo[1].servmark
		--先发送注册数据
		for _, Info in ipairs(RegLogList) do
			local Urs = CommonFunc.ExtractPlatformUrs(Info.Urs)
			local Params = {
				qid = Urs,
				playid = Info.Uid,
				server_id = ServerID,
				gkey = "zs",
				level = 1,
				name = "@" .. Info.Uid,
				toptype = "",
				topvalue = "",
				gender = Info.Sex == 1 and "m" or "w",
				head = "",
				marry = "",
				job = "",
			}
			local List = {Params["gender"], Params["Gkey"], Params["head"], Params["job"], Params["level"],
				Params["marry"], Params["name"], Params["playid"], Params["qid"], Params["server_id"], Params["toptype"],
				Params["topvalue"], Params["key"]}
			local MD5Str = ngx.md5(table.concat( List, ""))
			Params["sign"] = MD5Str
			ReqOutUrl(REQUEST_URL, Params)
		end
		--再发送升级数据
		for _, Info in ipairs(LevelUpLogList) do
			local Urs = CommonFunc.ExtractPlatformUrs(Info.Urs)
			local Params = {
				qid = Urs,
				playid = Info.Uid,
				server_id = ServerID,
				gkey = "zs",
				level = Info.NewLevel,
				name = Info.Name,
				toptype = "",
				topvalue = "",
				gender = "m",
				head = "",
				marry = "",
				job = "",
			}
			local List = {Params["gender"], Params["Gkey"], Params["head"], Params["job"], Params["level"],
				Params["marry"], Params["name"], Params["playid"], Params["qid"], Params["server_id"], Params["toptype"],
				Params["topvalue"], Params["key"]}
			local MD5Str = ngx.md5(table.concat( List, ""))
			Params["sign"] = MD5Str
			ReqOutUrl(REQUEST_URL, Params)
		end
	end
	return true
end





