return 
{
	["Data"] = {
		["全战斗力排行榜"] = {
			["Check"] = function (Formula, Object)
	return Formula.CheckUserNone(Formula,Object)
end,
			["CheckIsFighting"] = false,
			["Col"] = {
				{
					["DataType"] = "varchar(64)",
					["Key"] = "Name",
					["Name"] = "姓名",
					["Var"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "Level",
					["Name"] = "等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserLeve(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "HeadId",
					["Name"] = "头像",
					["Var"] = function (Formula, Object)
	return Formula.GetUserHeadId(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "VipLevel",
					["Name"] = "VIP等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserVipLevel(Formula,Object)
end,
				},
				{
					["DataType"] = "varchar(64)",
					["Key"] = "FactionName",
					["Name"] = "公会名称",
					["Var"] = function (Formula, Object)
	return Formula.GetUserFactionName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "CombatForces",
					["Name"] = "全战斗力",
					["Var"] = function (Formula, Object)
	return Formula.GetUserTotalCombatForces(Formula,Object)
end,
				},
			},
			["Desc"] = "全战斗力排行榜",
			["DisplayName"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
			["ManualJoin"] = false,
			["MaxAmount"] = 50,
			["Name"] = "全战斗力",
			["NeedClear"] = "无",
			["ObjectType"] = "人物",
			["PKey"] = "UserUid",
			["PageAmount"] = 30,
			["ShowName"] = "全员战斗力",
			["SortIdx1"] = "CombatForces",
			["SortIdx2"] = "Level",
			["TblName"] = "totalcombatforces",
			["UKey"] = function (Formula, Object)
	return Formula.GetUserUid(Formula,Object)
end,
		},
		["副本进度排行榜"] = {
			["Check"] = function (Formula, Object)
	return Formula.CheckUserNone(Formula,Object)
end,
			["CheckIsFighting"] = false,
			["Col"] = {
				{
					["DataType"] = "varchar(64)",
					["Key"] = "Name",
					["Name"] = "姓名",
					["Var"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "Level",
					["Name"] = "等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserLeve(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "HeadId",
					["Name"] = "头像",
					["Var"] = function (Formula, Object)
	return Formula.GetUserHeadId(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "VipLevel",
					["Name"] = "VIP等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserVipLevel(Formula,Object)
end,
				},
				{
					["DataType"] = "varchar(64)",
					["Key"] = "FactionName",
					["Name"] = "公会名称",
					["Var"] = function (Formula, Object)
	return Formula.GetUserFactionName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "CombatForces",
					["Name"] = "全战斗力",
					["Var"] = function (Formula, Object)
	return Formula.GetUserTotalCombatForces(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "StageProgress",
					["Name"] = "副本进度",
					["Var"] = function (Formula, Object)
	return Formula.GetUserStageProgress(Formula,Object)
end,
				},
			},
			["Desc"] = "副本进度排行榜",
			["DisplayName"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
			["ManualJoin"] = false,
			["MaxAmount"] = 50,
			["Name"] = "副本进度",
			["NeedClear"] = "无",
			["ObjectType"] = "人物",
			["PKey"] = "UserUid",
			["PageAmount"] = 30,
			["ShowName"] = "副本进度",
			["SortIdx1"] = "StageProgress",
			["SortIdx2"] = "CombatForces",
			["TblName"] = "stageprogress",
			["UKey"] = function (Formula, Object)
	return Formula.GetUserUid(Formula,Object)
end,
		},
		["等级排行榜"] = {
			["Check"] = function (Formula, Object)
	return Formula.CheckUserNone(Formula,Object)
end,
			["CheckIsFighting"] = false,
			["Col"] = {
				{
					["DataType"] = "varchar(64)",
					["Key"] = "Name",
					["Name"] = "姓名",
					["Var"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "Level",
					["Name"] = "等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserLeve(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "HeadId",
					["Name"] = "头像",
					["Var"] = function (Formula, Object)
	return Formula.GetUserHeadId(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "VipLevel",
					["Name"] = "VIP等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserVipLevel(Formula,Object)
end,
				},
				{
					["DataType"] = "varchar(64)",
					["Key"] = "FactionName",
					["Name"] = "公会名称",
					["Var"] = function (Formula, Object)
	return Formula.GetUserFactionName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "CombatForces",
					["Name"] = "全战斗力",
					["Var"] = function (Formula, Object)
	return Formula.GetUserTotalCombatForces(Formula,Object)
end,
				},
			},
			["Desc"] = "等级排行榜",
			["DisplayName"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
			["ManualJoin"] = false,
			["MaxAmount"] = 50,
			["Name"] = "等级",
			["NeedClear"] = "无",
			["ObjectType"] = "人物",
			["PKey"] = "UserUid",
			["PageAmount"] = 30,
			["ShowName"] = "等级",
			["SortIdx1"] = "Level",
			["SortIdx2"] = "CombatForces",
			["TblName"] = "level",
			["UKey"] = function (Formula, Object)
	return Formula.GetUserUid(Formula,Object)
end,
		},
		["英雄战斗力排行榜"] = {
			["Check"] = function (Formula, Object)
	return Formula.CheckHeroHasOwner(Formula,Object)
end,
			["CheckIsFighting"] = false,
			["Col"] = {
				{
					["DataType"] = "varchar(64)",
					["Key"] = "Name",
					["Name"] = "姓名",
					["Var"] = function (Formula, Object)
	return Formula.GetCardOwner(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "Level",
					["Name"] = "英雄等级",
					["Var"] = function (Formula, Object)
	return Formula.GetCardLevel(Formula,Object)
end,
				},
				{
					["DataType"] = "varchar(2500)",
					["Key"] = "CardInfo",
					["Name"] = "英雄信息",
					["Var"] = function (Formula, Object)
	return Formula.GetCardInfo(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "CombatForces",
					["Name"] = "英雄战斗力",
					["Var"] = function (Formula, Object)
	return Formula.GetCardCombatForces(Formula,Object)
end,
				},
				{
					["DataType"] = "bigint(20)",
					["Key"] = "CardUid",
					["Name"] = "英雄Uid",
					["Var"] = function (Formula, Object)
	return Formula.GetCardUid(Formula,Object)
end,
				},
			},
			["Desc"] = "英雄战斗力排行榜",
			["DisplayName"] = function (Formula, Object)
	return Formula.GetCardOwner(Formula,Object)
end,
			["ManualJoin"] = false,
			["MaxAmount"] = 50,
			["Name"] = "英雄战斗力",
			["NeedClear"] = "无",
			["ObjectType"] = "英雄",
			["PKey"] = "CardUid",
			["PageAmount"] = 20,
			["ShowName"] = "英雄战斗力",
			["SortIdx1"] = "CombatForces",
			["SortIdx2"] = "Level",
			["TblName"] = "cardcombatforces",
			["UKey"] = function (Formula, Object)
	return Formula.GetCardUid(Formula,Object)
end,
		},
		["连击排行榜"] = {
			["Check"] = function (Formula, Object)
	return Formula.CheckUserNone(Formula,Object)
end,
			["CheckIsFighting"] = false,
			["Col"] = {
				{
					["DataType"] = "varchar(64)",
					["Key"] = "Name",
					["Name"] = "姓名",
					["Var"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "Level",
					["Name"] = "等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserLeve(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "HeadId",
					["Name"] = "头像",
					["Var"] = function (Formula, Object)
	return Formula.GetUserHeadId(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "VipLevel",
					["Name"] = "VIP等级",
					["Var"] = function (Formula, Object)
	return Formula.GetUserVipLevel(Formula,Object)
end,
				},
				{
					["DataType"] = "varchar(64)",
					["Key"] = "FactionName",
					["Name"] = "公会名称",
					["Var"] = function (Formula, Object)
	return Formula.GetUserFactionName(Formula,Object)
end,
				},
				{
					["DataType"] = "int(11)",
					["Key"] = "ComboNum",
					["Name"] = "连击数",
					["Var"] = function (Formula, Object)
	return Formula.GetUserMaxCombo(Formula,Object)
end,
				},
			},
			["Desc"] = "连击排行榜",
			["DisplayName"] = function (Formula, Object)
	return Formula.GetUserName(Formula,Object)
end,
			["ManualJoin"] = false,
			["MaxAmount"] = 50,
			["Name"] = "连击数",
			["NeedClear"] = "无",
			["ObjectType"] = "人物",
			["PKey"] = "UserUid",
			["PageAmount"] = 30,
			["ShowName"] = "体力活动连击",
			["SortIdx1"] = "ComboNum",
			["SortIdx2"] = "Level",
			["TblName"] = "combo",
			["UKey"] = function (Formula, Object)
	return Formula.GetUserUid(Formula,Object)
end,
		},
	},
	["Formula"] = {
		["人物"] = {
			["CheckUserNone"] = function (Formula, Object, ...)
	return true
end,
			["GetUserArenaRank"] = function (Formula, Object, ...)
	local TopListData = Object:GetTopListData() or {} return TopListData.Rank
end,
			["GetUserCombatForces"] = function (Formula, Object, ...)
	return Object:CalCombatForces()
end,
			["GetUserDefendGroup"] = function (Formula, Object, ...)
	local Args= { ... } assert(Args[1],"缺少参数1") assert(Args[2],"缺少参数2") local TopListData = Object:GetTopListData() or {} return TopListData.DefendGroup[Args[1] ] and TopListData.DefendGroup[Args[1] ][Args[2] ] or -1
end,
			["GetUserExp"] = function (Formula, Object, ...)
	return Object:GetExp()
end,
			["GetUserFactionName"] = function (Formula, Object, ...)
	return (Object:GetFactionName() or "")
end,
			["GetUserHeadId"] = function (Formula, Object, ...)
	return  Object:GetHead()
end,
			["GetUserLeve"] = function (Formula, Object, ...)
	return Object:GetLevel()
end,
			["GetUserLocation"] = function (Formula, Object, ...)
	return Object:GetLocation() or ""
end,
			["GetUserMaxCombo"] = function (Formula, Object, ...)
	return Object:GetMaxComboNum() or 0
end,
			["GetUserName"] = function (Formula, Object, ...)
	return Object:GetName()
end,
			["GetUserNil"] = function (Formula, Object, ...)
	return ""
end,
			["GetUserStageProgress"] = function (Formula, Object, ...)
	local STAGE_CFG = ALLSETTING.StageCfg local StageData = Object:GetStageData() or {} local DetailStageData = StageData.StageData or {} local StarsCount = 0 for MapId, MapCfg in pairs(STAGE_CFG.MapCfg) do  for _, StageId in ipairs(MapCfg.StageList or {}) do   local StageCfg = STAGE_CFG.StageCfg[StageId]   if DetailStageData[StageId] and (StageCfg.StageType ~= 1) then    StarsCount = StarsCount + (DetailStageData[StageId].Score or 0)    end  end end return StarsCount 
end,
			["GetUserTotalCombatForces"] = function (Formula, Object, ...)
	return Object:CalTotalCombatForces()
end,
			["GetUserUid"] = function (Formula, Object, ...)
	return Object:GetUid()
end,
			["GetUserVipLevel"] = function (Formula, Object, ...)
	return VIP_MGR:GetLevel(Object)
end,
		},
		["英雄"] = {
			["CheckHeroHasOwner"] = function (Formula, Object, ...)
	return Object._Owner
end,
			["GetCardCombatForces"] = function (Formula, Object, ...)
	return Object:GetCombatForces()
end,
			["GetCardInfo"] = function (Formula, Object, ...)
	return Object:GetInfoStr()
end,
			["GetCardLevel"] = function (Formula, Object, ...)
	return Object:GetLevel()
end,
			["GetCardOwner"] = function (Formula, Object, ...)
	return Object._Owner:GetName()
end,
			["GetCardUid"] = function (Formula, Object, ...)
	return Object:GetUid()
end,
		},
	},
	["MenuTbl"] = {
		{
			"全战斗力排行榜",
			["Display"] = true,
			["Name"] = "全战斗力排行榜",
			["ShowName"] = "全员战斗力",
		},
		{
			"英雄战斗力排行榜",
			["Display"] = true,
			["Name"] = "英雄战斗力",
			["ShowName"] = "英雄战斗力",
		},
		{
			"等级排行榜",
			["Display"] = true,
			["Name"] = "等级排行榜",
			["ShowName"] = "等级",
		},
		{
			"副本进度排行榜",
			["Display"] = true,
			["Name"] = "副本进度排行榜",
			["ShowName"] = "副本进度",
		},
		{
			"连击排行榜",
			["Display"] = true,
			["Name"] = "体力活动连击",
			["ShowName"] = "体力活动连击",
		},
	},
}