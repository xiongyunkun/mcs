------------------------------------------
--$Id: staticserrdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblStaticsErr` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '跨服配置ID',
  `StaticsIndex` varchar(32) NOT NULL DEFAULT '' COMMENT '统计指标',
  `FileName` varchar(32) NOT NULL DEFAULT '' COMMENT '文件名',
  `ErrContent` varchar(256) NOT NULL DEFAULT '' COMMENT '变更原因', 
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计错误信息表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.HostID and Options.HostID ~= "" then
		Where = Where .. " and HostID = '" .. Options.HostID .. "'"
	end
	if Options.StaticsIndex and Options.StaticsIndex ~= "" then
		Where = Where .. " and StaticsIndex = '" .. Options.StaticsIndex .. "'"
	end
	if Options.FileNames and type(Options.FileNames) == "table" and #Options.FileNames ~= 0 then
		local FileNames = table.concat(Options.FileNames, "','")
		Where = Where .. " and FileName in ('" .. FileNames .. "')"
	end
	if Options.FileName and Options.FileName ~= "" then
		Where = Where .. " and FileName = '" .. Options.FileName .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and Time >= '" .. Options.StartTime .. "'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and Time <= '" .. Options.EndTime .. "'"
	end
	local Sql = "select * from smcs.tblStaticsErr " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--插入数据
function Insert(self, Options)
	local Sql = "insert into smcs.tblStaticsErr (HostID, StaticsIndex, FileName, ErrContent) values("
	Sql = Sql .. "'"..Options.HostID.."','"..Options.StaticsIndex.."','"..Options.FileName.."','"..Options.ErrContent.."')"
	DB:ExeSql(Sql)
end

