-------------------------------------------
-- $Id: database.lua 3806 2014-05-14 06:28:46Z zork $
-------------------------------------------
--[[
-- database operator
--]]
module(...,package.seeall)

local parser = require("rds.parser")
function ExeSql(self, Sql)
	local resp = ngx.location.capture("/mysql",{method=ngx.HTTP_POST,body=Sql})
	if resp.status ~= ngx.HTTP_OK or not resp.body then
		return nil, resp.status
	end
	local res, err = parser.parse(resp.body)
	if res == nil then
		return nil, err or resp.body
	end
	local Ret
	if res.resultset then
		Ret = {}
		for i, row in ipairs(res.resultset) do
			local RowSet = {}
			for col, val in pairs(row) do
				if val ~= parser.null then
					RowSet[col] = val
				end
			end
			Ret[i] = RowSet
		end
	end
	return Ret, resp.body
end

function ExeSqlEx(self, DbType, Sql)
	local resp = ngx.location.capture(DbType,{method=ngx.HTTP_POST,body=Sql})
	if resp.status ~= ngx.HTTP_OK or not resp.body then
		return nil, resp.status
	end
	local res, err = parser.parse(resp.body)
	if res == nil then
		return nil, err or resp.body
	end
	local Ret
	if res.resultset then
		Ret = {}
		for i, row in ipairs(res.resultset) do
			local RowSet = {}
			for col, val in pairs(row) do
				if val ~= parser.null then
					RowSet[col] = val
				end
			end
			Ret[i] = RowSet
		end
	end
	return Ret, resp.body
end
