------------------------------------------
--$Id: statics_module_data.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblStaticsModule` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `FileName` varchar(32) NOT NULL DEFAULT '' COMMENT '文件名',
  `IndexName` varchar(32) NOT NULL COMMENT '统计指标',
  `Row` int(11) DEFAULT '0' COMMENT '当前统计行数',
  `UpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`HostID`,`FileName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计配置表'


--]]
module(...,package.seeall)

--获得服配置列表
function GetServersCfg(self, Options)
	local Servers = ServerData:GetServer({})
	local Res = self:GetHostCfg(Options)
	for _, Server in ipairs(Servers) do
		if Res[Server["hostid"]] then
			Server["StaticsCfg"] = Res[Server["hostid"]] -- 添加到server数组中
		end
	end
	return Servers
end

--[[ 把数据整理下面的格式
 [HostID] = {
	[FileName1] = Row1,
	[FileName2] = Row2,
	}
 }
]]
function GetHostCfg(self,Options)
	local Res = self:Get(Options)
	local NewRes = {}
	for _, Info in ipairs(Res) do
		local HostID = Info["HostID"]
		local IndexName = Info["IndexName"]
		local FileName = Info["FileName"]
		local Row = Info["Row"]
		if not NewRes[HostID] then
			NewRes[HostID] = {}
		end
		NewRes[HostID][FileName] = Row
	end
	return NewRes
end


function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.FileNames and type(Options.FileNames) == "table" and #Options.FileNames ~= 0 then
		local FileNames = table.concat(Options.FileNames, "','")
		Where = Where .. " and FileName in ('" .. FileNames .. "')"
	end
	if Options.FileName and Options.FileName ~= "" then
		Where = Where .. " and FileName = '" .. Options.FileName .. "'"
	end
	if Options.IndexName and Options.IndexName ~= "" then
		Where = Where .. " and IndexName = '" .. Options.IndexName .. "'"
	end
	local Sql = "select * from smcs.tblStaticsModule " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

-- 插入更新
function Update(self, Params)
	local Sql = "insert into smcs.tblStaticsModule(HostID, FileName, IndexName, StaticsTime) values"
	Sql = Sql .. "('" .. Params.HostID .. "','" .. Params.FileName .. "','" .. Params.IndexName .. "','" .. Params.StaticsTime .. "')"
	Sql = Sql .. " on duplicate key update StaticsTime = '" .. Params.StaticsTime .. "', UpdateTime = CURRENT_TIMESTAMP()"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

