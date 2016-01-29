------------------------------------------
--$Id: machine_data.lua 50959 2015-03-16 13:12:56Z zork $
------------------------------------------
--[[
-- Server machine data
--
-- CREATE TABLE IF NOT EXIST tblMachine (
--	address varchar(20) PRIMARY KEY,
--	sshport	varchar(32),
--	platformid varchar(16),
--	inited int(8) default 0,
-- ) CHARACTER SET utf8;
--
--]]
module(...,package.seeall)

-- 从server表更新机器数据到machine表，只更新新加的记录
function UpdateMachineData(self)
	local Sql = "insert into tblMachine (address,sshport,platformid) select DISTINCT s.address,0,s.platformid from servers as s left join tblMachine as m on s.address = m.address where m.address is NULL;"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function GetMachineList(self, Platformid)
	local Sql = "select * from tblMachine"
	if Platformid then
		Sql = Sql .. " where platformid='"..Platformid.."'"
	end
	Sql = Sql .. " order by address;"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

local NeedCol = {"sshport","platformid","inited"}
function UpdateMachineInfo(self, MachineInfo)
	if not MachineInfo or not MachineInfo.address then
		return false, "wich machine want to modify?"
	end
	local SetTbl = {}
	for _, ColName in ipairs(NeedCol) do
		if MachineInfo[ColName] then
			table.insert(SetTbl, ColName .."='"..MachineInfo[ColName].."'")	
		end
	end
	if #SetTbl <= 0 then
		return false, "nothing to change"
	end
	local Sql = "update tblMachine set "..table.concat(SetTbl,",").." where address='"..MachineInfo.address.."';"
	local Res, Err = DB:ExeSql(Sql)
	return Res, Err
end

function DelMachine(self, Address)
	local Sql = "delete from tblMachine where address='"..Address.."';"
	return DB:ExeSql(Sql)
end

