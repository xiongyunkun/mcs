-------------------------------------------
-- $Id: database.lua 114985 2016-04-28 10:05:01Z xiongyunkun $
-------------------------------------------
--[[
-- database operator
--]]
module(...,package.seeall)

function ExeSql(self, Sql, HostIP)
    HostIP = HostIP or "127.0.0.1"
	local db, err = MYSQL:new()
	if not db then
    	ngx.say("failed to instantiate mysql: ", err)
        return
    end
    db:set_timeout(10000) -- 10 sec
    local ok, err, errno, sqlstate = db:connect{
        host = HostIP,
        port = 3306,
        database = "smcs",
        user = "smcs",
        password = "smcsdb",
        max_packet_size = 10240 * 10240 
    }

    if not ok then
        ngx.say("failed to connect: ", err, ": ", errno, " ", sqlstate)
        return
    end
    local res, err, errno, sqlstate = db:query(Sql)
    db:set_keepalive(10000, 100)
    return res, err
end
