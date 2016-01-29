---------------------------------------------
--$Id: mysqlop.lua 67056 2015-05-25 12:00:31Z xiongyunkun $
---------------------------------------------
--[[
--	查询mysql返回数据
--]]

function GetMysql(self)
	local Args = GetPostArgs()
	local Titles = Args.Titles
	local HostID = Args.HostID
	Titles = string.split(Titles, ",")
	local Results = {}
	for _, Title in ipairs(Titles) do
		local TableName = Title .. "_cache_" .. HostID
		local Sql = "select * from toplist." .. TableName .. " limit 100"
		local Res, Err = DB:ExeSql(Sql)
		Results[Title] = Res or {}
	end
	Results = Serialize(Results)
	ngx.say(Results)
end


DoRequest()
