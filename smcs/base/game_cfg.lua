--[[
--加载游戏配置表
]]
local CfgMap = {}
--物品配置表
local ItemCfg = require("custom_conf.itemattribute")
local ItemDataMap = {}
for ItemID, ItemInfo in pairs(ItemCfg.Cfg) do
	ItemDataMap[ItemID] = ItemInfo.Name
end
CfgMap["ItemDataMap"] = ItemDataMap
--任务配置表
local TaskCfg = require("custom_conf.story")
local TaskDataMap = {}
for TaskID, TaskInfo in pairs(TaskCfg) do
	TaskDataMap[TaskID] = TaskInfo.Name
end
CfgMap["TaskDataMap"] = TaskDataMap
--登陆过程分析配置表
local ActionAnalysisCfg = require("custom_conf.action_analysis_cfg")
CfgMap["ActionAnalysisCfg"] = ActionAnalysisCfg
--坐骑配置表
local MountCfg = require("custom_conf.mount_attribute")
CfgMap["MountCfg"] = MountCfg
local MountFuncCfg = require("custom_conf.mountfunc_cfg")
local MountTransIDMap = {}
for ID, MountInfo in pairs(MountFuncCfg.TransCfg) do
	MountTransIDMap[ID] = MountInfo.Name
end
CfgMap["MountTransIDMap"] = MountTransIDMap
--log建表sql语句配置
local CreateTableSqlCfg = require("custom_conf.create_table_sql_cfg")
CfgMap["CreateTableSqlCfg"] = CreateTableSqlCfg
--魔神配置表
local PetCfg = require("custom_conf.pet_attribute")
local PetDataMap = {}
for PetID, PetInfo in pairs(PetCfg.ConstInfo["宠物数据表"]) do
	PetDataMap[PetID] = PetInfo.Name
end
CfgMap["PetDataMap"] = PetDataMap
return CfgMap



