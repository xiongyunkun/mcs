-------------------------------------------
-- $Id: redis.lua 94928 2015-11-09 04:09:34Z xiongyunkun $
-------------------------------------------
--[[
-- redis相关操作逻辑
--]]
module(...,package.seeall)

--初始化连接
function InitConnection(self)
    local Redis = REDIS:new()
    Redis:set_timeout(5000) -- 5 sec
    local ok, err = Redis:connect("127.0.0.1", 6379)
    if not ok then
        ngx.say("failed to connect: ", err)
        return
    end
    return Redis
end

--从redis中批量获得日志数据，是通过在redis中执行lua脚本来获取的
function GetLog(self, LuaStr, LogName)
    local Redis = self:InitConnection()
    local Result = {}
    if Redis then
        local Res, Err = Redis:eval(LuaStr, "1", LogName)
        if Res and type(Res) == "table" then
            Result = Res
        end
    end
    Redis:set_keepalive(10000, 100) --放入连接池
    return Result
end

