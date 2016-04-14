----------------------------------------
--$Id: kugoo.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 酷狗平台创角回调接口
--]]

--
module(...,package.seeall)

--统计指标
IndexName = "kugou"
local GameID = 1 --游戏ID
local TEST_URL = "cp.game.kugou.com/statistic/create_role_test.php" --测试地址
local FORMAL_URL = "cp.game.kugou.com/statistic/create_role.html" --正式地址
function CronSend(self, PlatformID, HostID, StartTime, EndTime)
	--把今天的注册数据都读取出来
	if PlatformID == IndexName then
		local ServerInfo = ServerData:GetServer({hostid = HostID})
		if not ServerInfo or #ServerInfo == 0 then 
			return --没有服配置就直接返回
		end
		local RegLogList = AddPlayerLogData:Get(PlatformID, {HostID = HostID, StartTime = StartTime, EndTime = EndTime})
		for _, Info in ipairs(RegLogList) do
			local Urs = Info.Urs
			local Strs = string.split(Urs, "_")
			local Params = {
				gameid = GameID,
				uid = Strs[#Strs],
				serverid = ServerInfo[1].servmark,
				roleid = Info.Uid,
				rolename = "@" .. Info.Uid,
				time = Info.Time,
			}
			local Url = TEST_URL .. "?" .. table.concat( Params, "&")
			ReqOutUrl(Url) --记得上线的时候改回正式地址
		end
	end
	return true
end





