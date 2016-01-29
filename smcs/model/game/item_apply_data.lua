------------------------------------------
--$Id: cdkey_activity.lua 3850 2014-05-14 08:26:00Z zork $
------------------------------------------
--[[
CREATE TABLE `tblItemApply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostIDs` varchar(128) NOT NULL DEFAULT '' COMMENT '平台ID', 
  `RoleNames` varchar(512) NOT NULL DEFAULT '' COMMENT '角色列表',  
  `Reason` varchar(128) NOT NULL DEFAULT '' COMMENT '申请理由',  
  `Items` varchar(256) NOT NULL DEFAULT '' COMMENT '道具',
  `Applicant` varchar(32) NOT NULL DEFAULT '' COMMENT '申请人',
  `SubmitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `LastUpdateTime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '提交时间',
  `Auditor` varchar(32) NOT NULL DEFAULT '' COMMENT '审核人',
  `AuditTime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间', 
  `Status` tinyint NOT NULL DEFAULT '1' COMMENT '审核状态,1:未审核,2:通过,3:未通过,4:发送中', 
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='返利道具申请表' 


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
	if Options.Applicant and Options.Applicant ~= "" then
		Where = Where .. " and Applicant = '" .. Options.Applicant .. "'"
	end
	if Options.Status and Options.Status ~= "" then
		Where = Where .. " and Status = '" .. Options.Status .. "'"
	end
	if Options.StartTime and Options.StartTime ~= "" then
        Where = Where .. " and SubmitTime >= '" .. Options.StartTime .. " 00:00:00'"
    end
    if Options.EndTime and Options.EndTime ~= "" then
        Where = Where .. " and SubmitTime <= '" .. Options.EndTime .. " 23:59:59'"
    end
	local Sql = "select * from smcs.tblItemApply " .. Where .. " order by ID DESC"
	local Res, Err = DB:ExeSql(Sql)
	if not Res then return nil, Err end
	return Res
end


local Cols = {"PlatformID", "HostIDs", "RoleNames", "Reason", "Items", "Applicant", "SubmitTime", "LastUpdateTime"}
local UpdateCols = {"PlatformID", "HostIDs", "RoleNames", "Reason", "Items",  "Applicant", "LastUpdateTime"}

--插入数据
function Insert(self, Args)
    local Sql = ""
    if not Args["ID"] or Args["ID"] == "" then --插入操作
	   Sql = "insert into smcs.tblItemApply(" .. table.concat(Cols, ",") .. ") values('"
	   local InsertValues = {}
	   for _, Col in ipairs(Cols) do
		  local Value = Args[Col] or ""
		  table.insert(InsertValues, Value)
	   end
	   Sql = Sql .. table.concat(InsertValues, "','") .. "')"
    else --更新操作
        local UpdateValues = {}
        for _, Col in ipairs(UpdateCols) do
            local Value = Col .. " = '" .. (Args[Col] or "") .. "'"
            table.insert(UpdateValues, Value)
        end
        Sql = "update smcs.tblItemApply set " .. table.concat( UpdateValues, ", ") .. " where ID = '" .. Args.ID .. "'" 
    end
	DB:ExeSql(Sql)
end

--变更审核状态
function VerifyApply(self, ID, Auditor, AuditTime, Status)
    local Sql = "update smcs.tblItemApply set Auditor = '" .. Auditor .. "',AuditTime = '" .. AuditTime 
        .. "',Status = '" .. Status .. "' where ID = '" .. ID .. "'"
    DB:ExeSql(Sql)
end

function Delete(self, ID)
    local Sql = "update smcs.tblItemApply set Flag = 'false' where ID = '" .. ID .. "'"
    DB:ExeSql(Sql)
end

--检查申请是否已经被修改,如果没有被修改则返回false否则返回true
function CheckIsModified(self, ID, LastUpdateTime)
    local Sql = "select * from smcs.tblItemApply where ID = '" .. ID .. "' and LastUpdateTime = '" .. LastUpdateTime .. "'"
    local Res, Err = DB:ExeSql(Sql)
    if not Res or #Res == 0 then 
      return true
    else
      return false
    end
end
--判断是否已经被审核
function CheckIsAudited(self, ID)
    local Sql = "select * from smcs.tblItemApply where ID = '" .. ID .. "'"
    local Res, Err = DB:ExeSql(Sql)
    if Res and Res[1]then
        if Res[1].AuditTime ~= "0000-00-00 00:00:00" then
            return true, Res[1].Status
        end
    end
    return false
end

--更改订单状态
function UpdateStatus(self, ID, Status)
  local Sql = "update smcs.tblItemApply set Status = '" .. Status .. "' where ID = '" .. ID .. "'"
  DB:ExeSql(Sql)
end

