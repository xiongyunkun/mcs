------------------------------------------
--$Id: broadcastcfgdata.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblBroadcastCfg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `ServerType` int(11) NOT NULL DEFAULT '1' COMMENT '大区类型',
  `HostIDs` varchar(512) NOT NULL DEFAULT '' COMMENT '服hostID',
  `StartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `BroadType` int(11) NOT NULL DEFAULT '0' COMMENT '公告类型',
  `SendInterval` int(11) NOT NULL DEFAULT '0' COMMENT '发送间隔',
  `SendNum` int(11) NOT NULL DEFAULT '0' COMMENT '发送次数',
  `Content` varchar(512) NOT NULL DEFAULT '' COMMENT '发送内容',
  `OperateType` int(11) NOT NULL DEFAULT '0' COMMENT '操作类型：1：立即执行，2：定时执行',
  `Operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，1：已提交，2：已执行',
  `Result` varchar(512) NOT NULL DEFAULT '' COMMENT '执行结果',
  `Memo` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `LastOperationTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上一次执行时间',
  `NowOperationNum` int(11) NOT NULL DEFAULT '0' COMMENT '已执行次数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告配置表'

--]]
module(...,package.seeall)

--查询数据
function Get(self, Options)
	local Where = " where Flag = 'true' "
	if Options.ID and Options.ID ~= "" then
		Where = Where .. " and ID = '" .. Options.ID .. "'"
	end
	if Options.PlatformID and Options.PlatformID ~= "" then
		Where = Where .. " and PlatformID = '" .. Options.PlatformID .. "'"
	end
	if Options.HostIDs and Options.HostIDs ~= "" then
		Where = Where .. " and HostIDs like '" .. Options.HostIDs .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
		Where = Where .. " and SubmitTime >= '" .. Options.StartTime .. " 00:00:00'"
	end
	if Options.EndTime and Options.EndTime ~= "" then
		Where = Where .. " and SubmitTime <= '" .. Options.EndTime .. " 23:59:59'"
	end
	if Options.Content and Options.Content ~= "" then
		Where = Where .. " and Content = '" .. Options.Content .. "'"
	end
	local Sql = "select * from smcs.tblBroadcastCfg " .. Where
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

--获得在合适时间内执行的公告（Time处于StartTime和EndTime之间）
function GetProperTimeInfo(self, Time)
	local Sql = "select * from smcs.tblBroadcastCfg where Flag = 'true' and OperateType = '2' and StartTime <= '" 
			.. Time .. "' and EndTime >= '" .. Time .. "'"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end

local Cols = {"PlatformID", "HostIDs", "StartTime","EndTime","BroadType", "SendInterval", "SendNum", 
			"Content","OperateType", "Operator", "SubmitTime", "Status", "Result","Memo",}

--插入数据
function Insert(self, Args)
	local InsertCols = {"PlatformID", "ServerType", "HostIDs", "StartTime","EndTime","BroadType", "SendInterval", "SendNum", 
			"Content","OperateType", "Operator", "Memo",}
	local Sql = "insert into smcs.tblBroadcastCfg ("..table.concat(InsertCols, ",").. ") values("
	local Values = {}
	for _, Col in ipairs(InsertCols) do
		local Value = Args[Col] and "'" .. Args[Col] .. "'" or "''"
		table.insert(Values, Value)
	end
	Sql = Sql .. table.concat(Values, ",") .. ")"
	DB:ExeSql(Sql)
	--返回ID
	local Res = self:Get(Args)
	if not Res or not Res[1] then
		return 0
	else
		return Res[1]["ID"]
	end
end

function Update(self, Args)
	if not Args.ID then return end
	local UpdateCols = {"PlatformID", "ServerType", "HostIDs", "StartTime","EndTime","BroadType", "SendInterval", "SendNum", 
			"Content","OperateType", "Operator", "SubmitTime", "Status", "Memo",}
	local Sql = "update smcs.tblBroadcastCfg set "
	local Values = {}
	for _, Col in ipairs(UpdateCols) do
		if Args[Col] then
			local Value = Col .. " = '" .. Args[Col] .. "'"
			table.insert(Values, Value)
		end
	end
	Sql = Sql .. table.concat(Values, ",") .. " where ID = '" .. Args.ID .. "'"
	DB:ExeSql(Sql)
end

function Delete(self, ID)
	local Sql = "update smcs.tblBroadcastCfg set Flag = 'false' where ID = '" .. ID .. "'"
	DB:ExeSql(Sql)
end

--更新执行结果
function UpdateResult(self, ID, Result)
	local OperationTime = os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	local Sql = "update smcs.tblBroadcastCfg set Status = '2',Result='" .. Result .. "',LastOperationTime='"
			.. OperationTime .. "',NowOperationNum = NowOperationNum + 1 where ID = '" .. ID .. "'"
	DB:ExeSql(Sql)
end

