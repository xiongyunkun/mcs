-------------------------------------------------------
--$Id: version_data.lua 50924 2015-03-16 12:37:54Z zork $
-------------------------------------------------------
--[[
--	CREATE TABLE IF NOT EXISTS tblPubVersion (
--		version varchar(255) PRIMARY KEY,
--		memo varchar(255) default '',
--		type int(8),
--		ctime timestamp
--	) CHARACTER SET utf8;
--]]

module(...,package.seeall)

VersionType = {
	SERVER = 0,
	CLIENT = 1,
}
function GetAllVersion(self, Type, LastCount)
	if Type ~= VersionType.SERVER and Type ~= VersionType.CLIENT then
		return false, "Version Type Error"
	end
	local Sql = "select * from tblPubVersion where type='"..Type.."' order by ctime desc"
	if LastCount then
		Sql = Sql .. " limit 1,"..LastCount
	end
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

VerCol = {"version", "memo", "type"}
function AddVersion(self, VersionInfo)
	local Sql = "insert into tblPubVersion set "
	local SetTbl = {}
	for _, Col in ipairs(VerCol) do
		local Val = VersionInfo[Col]
		if Col == "type" and (not Val or (tonumber(Val) ~= VersionType.SERVER and tonumber(Val) ~= VersionType.CLIENT)) then
			return false, "must have version type"
		end
		if Val then
			table.insert(SetTbl, Col.."='"..Val.."'")
		end
	end
	if #SetTbl <= 0 then return false end
	Sql = Sql .. table.concat(SetTbl, ",")
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function DelVersion(self, Version)
	local Sql = "delete from tblPubVersion where version='"..Version.."'"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end
