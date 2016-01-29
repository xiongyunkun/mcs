--[[
--加载游戏配置表
]]
local CfgMap = {}
--物品配置表
local ItemCfg = require("custom_conf.itemattribute")
local ItemDataMap = {}
for ItemID, ItemInfo in pairs(ItemCfg) do
	local ItemName = ItemInfo.Name
	if string.find(ItemName, "#") == 1 then
		ItemName = string.sub(ItemName, 9)
	end
	ItemDataMap[ItemID] = ItemName
end
CfgMap["ItemDataMap"] = ItemDataMap

--任务配置表
local TaskCfg = require("custom_conf.story").BaseCfg
TaskDataMap = {}
for TaskID, TaskInfo in pairs(TaskCfg) do
	TaskDataMap[TaskID] = TaskInfo.Name
end
CfgMap["TaskDataMap"] = TaskDataMap

--登陆过程分析配置表
local ActionAnalysisCfg = require("custom_conf.action_analysis_cfg")
CfgMap["ActionAnalysisCfg"] = ActionAnalysisCfg

--卡牌配置表
local CardCfg = require("custom_conf.card_attribute")
CfgMap["CardCfg"] = CardCfg
-- SDK
local SDKCfg = require("custom_conf.sdkid_cfg")
CfgMap["SDKCfg"] = SDKCfg
--副本名称映射表
local StageCfg = require("custom_conf.stage_cfg")
local STAGE_MAP = {}
for StageID, Info in pairs(StageCfg.StageCfg) do
	STAGE_MAP[StageID] = Info.ShowName
end
CfgMap["STAGE_MAP"] = STAGE_MAP
CfgMap["StageCfg"] = StageCfg.StageCfg

local TrailCfg = require("custom_conf.trial_cfg")
local TRAIL_NAME_MAP = {}
for ID, Info in ipairs(TrailCfg) do
	TRAIL_NAME_MAP[ID] = Info.Name
end
CfgMap["TrailCfg"] = TrailCfg
CfgMap["TRAIL_NAME_MAP"] = TRAIL_NAME_MAP
--排行榜配置
local TopListCfg = require("custom_conf.toplist_cfg")
CfgMap["TopListCfg"] = TopListCfg

return CfgMap



