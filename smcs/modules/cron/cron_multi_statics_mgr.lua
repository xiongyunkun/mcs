----------------------------------------
--$Id: cron_multi_statics_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 定时轮询统计,由这里发起请求调用cron_statics_mgr.lua中的CronExecute方法
-- 注意设置MAX_THREAD_SIZE大小，要保证这个数量小于nginx的进程数
--
--]]

local MAX_THREAD_SIZE = 2 --最多并发的线程数 
local STATICS_URL = "http://127.0.0.1:8081/cron/cron_statics"

function CronExecute(self)
	local PlatformRes = MixServerData:Get({})
	local PlatformIDs = {}
	for _, Info in ipairs(PlatformRes) do
		PlatformIDs[Info.PlatformID] = true
	end
	local PlatformIDList = {}
	-- 将平台取余平均分布在大小为MAX_THREAD_SIZE的数组中
	local Index = 0
	for PlatformID, _ in pairs(PlatformIDs) do
		local Mod = (Index % MAX_THREAD_SIZE) + 1
		PlatformIDList[Mod] = PlatformIDList[Mod] or {}
		table.insert(PlatformIDList[Mod], PlatformID)
		Index = Index + 1
	end
	for _, Platforms in pairs(PlatformIDList) do
		local PlatformIDStr = table.concat( Platforms, ",")
		local Thread, Err = ngx.thread.spawn(ThreadExecute, PlatformIDStr) --启动线程
	end
end

--线程执行
function ThreadExecute(PlatformIDStr)
	local Params = {
		PlatformID = PlatformIDStr,
	}
	local Flag, Res = ReqOutUrl(STATICS_URL, Params) --发送http请求
	ngx.say(Flag, Res)
end

DoRequest(true) --不需要进行权限验证
