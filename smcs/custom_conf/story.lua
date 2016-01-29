return 
{
	["APIInfo"] = {
		["人物等级"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"人物等级缺少参数") return User:GetLevel()>=Args[1]
end,
		["关卡群S数量"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"配置表关卡群S数量缺少参数1:关卡群名字") assert(Args[2] and type(Args[2])=="number","配置表关卡群S数量缺少参数2:S的数量") local StageGroupCfg = setting:Get("setting/stage_cfg.lua").MapCfg local StageGroup = assert(StageGroupCfg[Args[1]], "没找到该关卡群"..Args[1]) local SCount = 0 for I,StageId in ipairs(StageGroup.StageList) do     local StageData = task.InstMgr():GetStageById(StageId)     if StageData:GetScore() and StageData:GetScore()>=3 then         SCount = SCount + 1     end end return SCount>=Args[2]
end,
		["卡牌升星"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"卡牌升星缺少参数") local AchieveMgr = User:GetAchieveMgr() local CardUid = AchieveMgr.__CheckParam__ if CardUid then     local CardObj = (User:GetAllCards() or {})[CardUid]     if CardObj and (CardObj:GetQuality()or 0)>=Args[1] then       return true     end end return false 
end,
		["卡牌升级"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"卡牌升级缺少参数") local AllCards = User:GetAllCards() for CardUid,CardObj in pairs(AllCards or {}) do     if CardObj:GetLevel()>=Args[1] then         return true     end end return false
end,
		["卡牌进化颜色"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"卡牌进化颜色缺少参数") local AllCards = User:GetAllCards() for CardUid,CardObj in pairs(AllCards or {}) do     if (CardObj:GetWakeupLv() or 0)>=Args[1] then         return true     end end return false 
end,
		["多人竞赛等级"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"多人竞赛等级缺少参数") return User:GetMpvpLevel()>=Args[1]
end,
		["多张卡牌进化颜色"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"卡牌进化颜色缺少参数") assert(Args[2],"卡牌张数") local Count = 0 local AllCards = User:GetAllCards() for CardUid,CardObj in pairs(AllCards or {}) do     if (CardObj:GetWakeupLv() or 0)>=Args[1] then         Count = Count + 1     end     if Count >= Args[2] then        return true     end end return false 
end,
		["得到星级卡牌"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"得到星级卡牌缺少参数1:星级") assert(Args[2],"得到星级卡牌缺少参数2:数量") local AllCards = User:GetAllCards() local Num=0 for CardUid,CardObj in pairs(AllCards or {}) do     if CardObj:GetQuality()>=Args[1] then         Num = Num+1     end end return Num>=Args[2] 
end,
		["无"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} return true
end,
		["有月卡"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...}  local LeftTime = VIP_MGR:GetMonthCardLeftTime(User) if LeftTime <=0 then     return false end return true
end,
		["有至尊卡"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} local VipInfo = User:GetVipInfo() or {} if not (VipInfo and VipInfo[2]) then     return false end return true
end,
		["竞技场排名"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"竞技场等级缺少参数") local TopListData = User:GetTopListData() or {} local MaxRank = TopListData.MaxRank or 999999 return MaxRank<=Args[1]
end,
		["竞技场积分达到"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"确实积分参数") local ArenaCredit = User:GetCounterMgr():GetCount("竞技场积分", "获得") return ArenaCredit >= Args[1] 
end,
		["符文强化"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"符文强化到缺少参数") local AllCards = User:GetAllCards() for CardUid,CardObj in pairs(AllCards or {}) do     local RuneList = CardObj:GetRunesList()     for Idx,Item in pairs(RuneList or {}) do        if (Item:GetEnchantlvl()or 0)>=Args[1] then return true end     end end return false
end,
		["英雄升级"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"英雄升级缺少英雄个数参数") assert(Args[2],"英雄升级缺少等级参数") local AllCards = User:GetAllCards() local Count = 0 for CardUid,CardObj in pairs(AllCards or {}) do     if CardObj:GetLevel()>= Args[2] then         Count = Count + 1         if Count >= Args[1] then              return true,Count         end     end end return false,Count
end,
		["装备符文"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} local AllCards = User:GetAllCards() for CardUid,CardObj in pairs(AllCards or {}) do     local RuneList = CardObj:GetRunesList()     if RuneList and table.size(RuneList)>0 then         return true     end end return false
end,
		["计数数据达成"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"计数数据达成缺少参数") local Type, Data = User:GetCounterMgr():GetCount(AchieveItemCfg.CounterType,AchieveItemCfg.CounterParam) if Data and Data >= Args[1] then     return true,User:GetCounterMgr():GetCount(AchieveItemCfg.CounterType,AchieveItemCfg.CounterParam) end return false,User:GetCounterMgr():GetCount(AchieveItemCfg.CounterType,AchieveItemCfg.CounterParam)
end,
		["计数达成"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"计数达成缺少参数") if User:GetCounterMgr():GetCount(AchieveItemCfg.CounterType,AchieveItemCfg.CounterParam) >=Args[1] then return true,User:GetCounterMgr():GetCount(AchieveItemCfg.CounterType,AchieveItemCfg.CounterParam) end return false,User:GetCounterMgr():GetCount(AchieveItemCfg.CounterType,AchieveItemCfg.CounterParam)
end,
		["领取竞技场积分次数"] = function (API, User, AchieveItemCfg, ...)
	local Args = {...} assert(Args[1],"确实次数参数") local CREDITBONUS_CFG = ALLSETTING.ArenaCfg.CreditBonusCfg local Count = 0 for Id, Cfg in pairs(CREDITBONUS_CFG.Cfg) do     local Count1 = User:GetCounterMgr():GetCount(Cfg.Type, Cfg.Param)     if Count1 > 0 then         Count = Count + 1     end end if Count >= Args[1] then     return true end return false 
end,
	},
	["BaseCfg"] = {
		[10001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 5)
end,
			},
			["CounterMax"] = 5,
			["Desc"] = "战队等级提升到5",
			["Level"] = 1,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升1",
			["NextAchieve"] = 10002,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "200000,30",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[10002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 10)
end,
			},
			["CounterMax"] = 10,
			["Desc"] = "战队等级提升到10",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升2",
			["NextAchieve"] = 10003,
			["PreAchieve"] = 10001,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "200000,20",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[10003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 15)
end,
			},
			["CounterMax"] = 15,
			["Desc"] = "战队等级提升到15",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升3",
			["NextAchieve"] = 10004,
			["PreAchieve"] = 10002,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "200000,20",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[10004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 18)
end,
			},
			["CounterMax"] = 18,
			["Desc"] = "战队等级提升到18",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升4",
			["NextAchieve"] = 10005,
			["PreAchieve"] = 10003,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "200000,20",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[10005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 20)
end,
			},
			["CounterMax"] = 20,
			["Desc"] = "战队等级提升到20",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升5",
			["NextAchieve"] = 10006,
			["PreAchieve"] = 10004,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10006] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 22)
end,
			},
			["CounterMax"] = 22,
			["Desc"] = "战队等级提升到22",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升6",
			["NextAchieve"] = 10007,
			["PreAchieve"] = 10005,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10007] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 24)
end,
			},
			["CounterMax"] = 24,
			["Desc"] = "战队等级提升到24",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升7",
			["NextAchieve"] = 10008,
			["PreAchieve"] = 10006,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10008] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 26)
end,
			},
			["CounterMax"] = 26,
			["Desc"] = "战队等级提升到26",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升8",
			["NextAchieve"] = 10009,
			["PreAchieve"] = 10007,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10009] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 28)
end,
			},
			["CounterMax"] = 28,
			["Desc"] = "战队等级提升到28",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升9",
			["NextAchieve"] = 10010,
			["PreAchieve"] = 10008,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10010] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 30)
end,
			},
			["CounterMax"] = 30,
			["Desc"] = "战队等级提升到30",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升10",
			["NextAchieve"] = 10011,
			["PreAchieve"] = 10009,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10011] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 32)
end,
			},
			["CounterMax"] = 32,
			["Desc"] = "战队等级提升到32",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升11",
			["NextAchieve"] = 10012,
			["PreAchieve"] = 10010,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10012] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 34)
end,
			},
			["CounterMax"] = 34,
			["Desc"] = "战队等级提升到34",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升12",
			["NextAchieve"] = 10013,
			["PreAchieve"] = 10011,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10013] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 36)
end,
			},
			["CounterMax"] = 36,
			["Desc"] = "战队等级提升到36",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升13",
			["NextAchieve"] = 10014,
			["PreAchieve"] = 10012,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10014] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 38)
end,
			},
			["CounterMax"] = 38,
			["Desc"] = "战队等级提升到38",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升14",
			["NextAchieve"] = 10015,
			["PreAchieve"] = 10013,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10015] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 40)
end,
			},
			["CounterMax"] = 40,
			["Desc"] = "战队等级提升到40",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升15",
			["NextAchieve"] = 10016,
			["PreAchieve"] = 10014,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10016] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 42)
end,
			},
			["CounterMax"] = 42,
			["Desc"] = "战队等级提升到42",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升16",
			["NextAchieve"] = 10017,
			["PreAchieve"] = 10015,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10017] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 44)
end,
			},
			["CounterMax"] = 44,
			["Desc"] = "战队等级提升到44",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升17",
			["NextAchieve"] = 10018,
			["PreAchieve"] = 10016,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10018] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 46)
end,
			},
			["CounterMax"] = 46,
			["Desc"] = "战队等级提升到46",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升18",
			["NextAchieve"] = 10019,
			["PreAchieve"] = 10017,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10019] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 48)
end,
			},
			["CounterMax"] = 48,
			["Desc"] = "战队等级提升到48",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升19",
			["NextAchieve"] = 10020,
			["PreAchieve"] = 10018,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10020] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 50)
end,
			},
			["CounterMax"] = 50,
			["Desc"] = "战队等级提升到50",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升20",
			["NextAchieve"] = 10021,
			["PreAchieve"] = 10019,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10021] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 52)
end,
			},
			["CounterMax"] = 52,
			["Desc"] = "战队等级提升到52",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升21",
			["NextAchieve"] = 10022,
			["PreAchieve"] = 10020,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10022] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 54)
end,
			},
			["CounterMax"] = 54,
			["Desc"] = "战队等级提升到54",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升22",
			["NextAchieve"] = 10023,
			["PreAchieve"] = 10021,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10023] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 56)
end,
			},
			["CounterMax"] = 56,
			["Desc"] = "战队等级提升到56",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升23",
			["NextAchieve"] = 10024,
			["PreAchieve"] = 10022,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10024] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 58)
end,
			},
			["CounterMax"] = 58,
			["Desc"] = "战队等级提升到58",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升24",
			["NextAchieve"] = 10025,
			["PreAchieve"] = 10023,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10025] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 60)
end,
			},
			["CounterMax"] = 60,
			["Desc"] = "战队等级提升到60",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升25",
			["NextAchieve"] = 10026,
			["PreAchieve"] = 10024,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10026] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 62)
end,
			},
			["CounterMax"] = 62,
			["Desc"] = "战队等级提升到62",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升26",
			["NextAchieve"] = 10027,
			["PreAchieve"] = 10025,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10027] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 64)
end,
			},
			["CounterMax"] = 64,
			["Desc"] = "战队等级提升到64",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升27",
			["NextAchieve"] = 10028,
			["PreAchieve"] = 10026,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10028] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 66)
end,
			},
			["CounterMax"] = 66,
			["Desc"] = "战队等级提升到66",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升28",
			["NextAchieve"] = 10029,
			["PreAchieve"] = 10027,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10029] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 68)
end,
			},
			["CounterMax"] = 68,
			["Desc"] = "战队等级提升到68",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升29",
			["NextAchieve"] = 10030,
			["PreAchieve"] = 10028,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10030] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 70)
end,
			},
			["CounterMax"] = 70,
			["Desc"] = "战队等级提升到70",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升30",
			["NextAchieve"] = 10031,
			["PreAchieve"] = 10029,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10031] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 72)
end,
			},
			["CounterMax"] = 72,
			["Desc"] = "战队等级提升到72",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升31",
			["NextAchieve"] = 10032,
			["PreAchieve"] = 10030,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10032] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 74)
end,
			},
			["CounterMax"] = 74,
			["Desc"] = "战队等级提升到74",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升32",
			["NextAchieve"] = 10033,
			["PreAchieve"] = 10031,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10033] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 76)
end,
			},
			["CounterMax"] = 76,
			["Desc"] = "战队等级提升到76",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升33",
			["NextAchieve"] = 10034,
			["PreAchieve"] = 10032,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10034] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 78)
end,
			},
			["CounterMax"] = 78,
			["Desc"] = "战队等级提升到78",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升34",
			["NextAchieve"] = 10035,
			["PreAchieve"] = 10033,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10035] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 80)
end,
			},
			["CounterMax"] = 80,
			["Desc"] = "战队等级提升到80",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升35",
			["NextAchieve"] = 10036,
			["PreAchieve"] = 10034,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10036] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 82)
end,
			},
			["CounterMax"] = 82,
			["Desc"] = "战队等级提升到82",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升36",
			["NextAchieve"] = 10037,
			["PreAchieve"] = 10035,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10037] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 84)
end,
			},
			["CounterMax"] = 84,
			["Desc"] = "战队等级提升到84",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升37",
			["NextAchieve"] = 10038,
			["PreAchieve"] = 10036,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10038] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 86)
end,
			},
			["CounterMax"] = 86,
			["Desc"] = "战队等级提升到86",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升38",
			["NextAchieve"] = 10039,
			["PreAchieve"] = 10037,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10039] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 88)
end,
			},
			["CounterMax"] = 88,
			["Desc"] = "战队等级提升到88",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升39",
			["NextAchieve"] = 10040,
			["PreAchieve"] = 10038,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10040] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 90)
end,
			},
			["CounterMax"] = 90,
			["Desc"] = "战队等级提升到90",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升40",
			["NextAchieve"] = 10041,
			["PreAchieve"] = 10039,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10041] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 92)
end,
			},
			["CounterMax"] = 92,
			["Desc"] = "战队等级提升到92",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升41",
			["NextAchieve"] = 10042,
			["PreAchieve"] = 10040,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10042] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 94)
end,
			},
			["CounterMax"] = 94,
			["Desc"] = "战队等级提升到94",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升42",
			["NextAchieve"] = 10043,
			["PreAchieve"] = 10041,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10043] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 96)
end,
			},
			["CounterMax"] = 96,
			["Desc"] = "战队等级提升到96",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升43",
			["NextAchieve"] = 10044,
			["PreAchieve"] = 10042,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10044] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["人物等级"](API, User, AchieveItemCfg , 98)
end,
			},
			["CounterMax"] = 98,
			["Desc"] = "战队等级提升到98",
			["Level"] = 0,
			["ModuleType"] = "人物升级",
			["Name"] = "战队提升44",
			["PreAchieve"] = 10043,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010101] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10101",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-圣城郊区",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "圣城郊区",
			["NextAchieve"] = 1101010,
			["PreAchieve"] = 1101003,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010102] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10102",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-爆炸事件",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "爆炸事件",
			["NextAchieve"] = 1010103,
			["PreAchieve"] = 1101010,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010103] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10103",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-吕布",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "吕布",
			["NextAchieve"] = 1101030,
			["PreAchieve"] = 1010102,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010104] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10104",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-追踪卷轴",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "追踪卷轴",
			["NextAchieve"] = 1010105,
			["PreAchieve"] = 1101030,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010105] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10105",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-关银屏",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "关银屏",
			["NextAchieve"] = 1010106,
			["PreAchieve"] = 1010104,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010106] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10106",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-交易",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "交易",
			["NextAchieve"] = 1010107,
			["PreAchieve"] = 1010105,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010107] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10107",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-洛基",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "洛基",
			["NextAchieve"] = 1010108,
			["PreAchieve"] = 1010106,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010108] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10108",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-关羽",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "关羽",
			["NextAchieve"] = 1010201,
			["PreAchieve"] = 1010107,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010201] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10201",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-腐坏的森林",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "腐坏的森林",
			["NextAchieve"] = 1010202,
			["PreAchieve"] = 1010108,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010202] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10202",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-雅典娜",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "雅典娜",
			["NextAchieve"] = 1010203,
			["PreAchieve"] = 1010201,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010203] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10203",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精灵古道",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精灵古道",
			["NextAchieve"] = 1010204,
			["PreAchieve"] = 1010202,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010204] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10204",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-强尼",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "强尼",
			["NextAchieve"] = 1010205,
			["PreAchieve"] = 1010203,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010205] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10205",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-前行",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "前行",
			["NextAchieve"] = 1010206,
			["PreAchieve"] = 1010204,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010206] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10206",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-沙拉曼",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "沙拉曼",
			["NextAchieve"] = 1010207,
			["PreAchieve"] = 1010205,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010207] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10207",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-出发",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "出发",
			["NextAchieve"] = 1010208,
			["PreAchieve"] = 1010206,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010208] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10208",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-尼克斯",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "尼克斯",
			["NextAchieve"] = 1010209,
			["PreAchieve"] = 1010207,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010209] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10209",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-前行",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "前行",
			["NextAchieve"] = 1010210,
			["PreAchieve"] = 1010208,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010210] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10210",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-寻找精灵王",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "寻找精灵王",
			["NextAchieve"] = 1010211,
			["PreAchieve"] = 1010209,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010211] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10211",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精灵王出现",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精灵王出现",
			["NextAchieve"] = 1010212,
			["PreAchieve"] = 1010210,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010212] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10212",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精灵女王",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精灵女王",
			["NextAchieve"] = 1010301,
			["PreAchieve"] = 1010211,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010301] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10301",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-初入神庙",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "初入神庙",
			["NextAchieve"] = 1010302,
			["PreAchieve"] = 1010212,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010302] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10302",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-拉琪亚",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "拉琪亚",
			["NextAchieve"] = 1010303,
			["PreAchieve"] = 1010301,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010303] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10303",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-亚瑟族人",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "亚瑟族人",
			["NextAchieve"] = 1010304,
			["PreAchieve"] = 1010302,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010304] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10304",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-潜入",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "潜入",
			["NextAchieve"] = 1010305,
			["PreAchieve"] = 1010303,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010305] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10305",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-神庙内部",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "神庙内部",
			["NextAchieve"] = 1010306,
			["PreAchieve"] = 1010304,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010306] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10306",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-陷阱",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "陷阱",
			["NextAchieve"] = 1010307,
			["PreAchieve"] = 1010305,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010307] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10307",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-旧殿地宫",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "旧殿地宫",
			["NextAchieve"] = 1010308,
			["PreAchieve"] = 1010306,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010308] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10308",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-窃贼斯德尼",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "窃贼斯德尼",
			["NextAchieve"] = 1010309,
			["PreAchieve"] = 1010307,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010309] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10309",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-地牢",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "地牢",
			["NextAchieve"] = 1010310,
			["PreAchieve"] = 1010308,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010310] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10310",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-阿瑞斯",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "阿瑞斯",
			["NextAchieve"] = 1010311,
			["PreAchieve"] = 1010309,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010311] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10311",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-拦路者",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "拦路者",
			["NextAchieve"] = 1010312,
			["PreAchieve"] = 1010310,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010312] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10312",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-夏侯惇",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "夏侯惇",
			["NextAchieve"] = 1010401,
			["PreAchieve"] = 1010311,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010401] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10401",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-初入巢穴",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "初入巢穴",
			["NextAchieve"] = 1010402,
			["PreAchieve"] = 1010312,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010402] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10402",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-初入巢穴II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "初入巢穴II",
			["NextAchieve"] = 1010403,
			["PreAchieve"] = 1010401,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010403] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10403",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-初入巢穴III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "初入巢穴III",
			["NextAchieve"] = 1010404,
			["PreAchieve"] = 1010402,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010404] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10404",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-失去宁静I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "失去宁静I",
			["NextAchieve"] = 1010405,
			["PreAchieve"] = 1010403,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010405] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10405",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-失去宁静II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "失去宁静II",
			["NextAchieve"] = 1010406,
			["PreAchieve"] = 1010404,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010406] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10406",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-失去宁静III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "失去宁静III",
			["NextAchieve"] = 1104061,
			["PreAchieve"] = 1010405,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010407] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10407",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-斑斓I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "斑斓I",
			["NextAchieve"] = 1010408,
			["PreAchieve"] = 1104061,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010408] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10408",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-斑斓II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "斑斓II",
			["NextAchieve"] = 1010409,
			["PreAchieve"] = 1010407,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010409] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10409",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-斑斓III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "斑斓III",
			["NextAchieve"] = 1010410,
			["PreAchieve"] = 1010408,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010410] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10410",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-深入圣巢I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "深入圣巢I",
			["NextAchieve"] = 1010411,
			["PreAchieve"] = 1010409,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010411] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10411",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-深入圣巢II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "深入圣巢II",
			["NextAchieve"] = 1010412,
			["PreAchieve"] = 1010410,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010412] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10412",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-深入圣巢III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "深入圣巢III",
			["NextAchieve"] = 1104121,
			["PreAchieve"] = 1010411,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010413] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10413",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-塞拉祭坛I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "塞拉祭坛I",
			["NextAchieve"] = 1010414,
			["PreAchieve"] = 1104121,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010414] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10414",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-塞拉祭坛II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "塞拉祭坛II",
			["NextAchieve"] = 1010415,
			["PreAchieve"] = 1010413,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010415] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10415",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-塞拉祭坛III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "塞拉祭坛III",
			["NextAchieve"] = 1010416,
			["PreAchieve"] = 1010414,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010416] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10416",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-绿叶崖I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "绿叶崖I",
			["NextAchieve"] = 1010417,
			["PreAchieve"] = 1010415,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010417] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10417",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-绿叶崖II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "绿叶崖II",
			["NextAchieve"] = 1010418,
			["PreAchieve"] = 1010416,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010418] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10418",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-绿叶崖III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "绿叶崖III",
			["NextAchieve"] = 1104181,
			["PreAchieve"] = 1010417,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010501] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10501",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-荒原少女I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "荒原少女I",
			["NextAchieve"] = 1010502,
			["PreAchieve"] = 1104181,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010502] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10502",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-荒原少女II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "荒原少女II",
			["NextAchieve"] = 1010503,
			["PreAchieve"] = 1010501,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010503] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10503",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-荒原少女III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "荒原少女III",
			["NextAchieve"] = 1010504,
			["PreAchieve"] = 1010502,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010504] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10504",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-荒原I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "荒原I",
			["NextAchieve"] = 1010505,
			["PreAchieve"] = 1010503,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010505] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10505",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-荒原II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "荒原II",
			["NextAchieve"] = 1010506,
			["PreAchieve"] = 1010504,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010506] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10506",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-荒原III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "荒原III",
			["NextAchieve"] = 1105061,
			["PreAchieve"] = 1010505,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010507] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10507",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-巨魔山脉I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "巨魔山脉I",
			["NextAchieve"] = 1010508,
			["PreAchieve"] = 1105061,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010508] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10508",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-巨魔山脉II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "巨魔山脉II",
			["NextAchieve"] = 1010509,
			["PreAchieve"] = 1010507,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010509] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10509",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-巨魔山脉III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "巨魔山脉III",
			["NextAchieve"] = 1010510,
			["PreAchieve"] = 1010508,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010510] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10510",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-要塞爆炸I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "要塞爆炸I",
			["NextAchieve"] = 1010511,
			["PreAchieve"] = 1010509,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010511] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10511",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-要塞爆炸II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "要塞爆炸II",
			["NextAchieve"] = 1010512,
			["PreAchieve"] = 1010510,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010512] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10512",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-要塞爆炸III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "要塞爆炸III",
			["NextAchieve"] = 1105121,
			["PreAchieve"] = 1010511,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010513] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10513",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-蒲英小镇I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "蒲英小镇I",
			["NextAchieve"] = 1010514,
			["PreAchieve"] = 1105121,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010514] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10514",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-蒲英小镇II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "蒲英小镇II",
			["NextAchieve"] = 1010515,
			["PreAchieve"] = 1010513,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010515] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10515",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-蒲英小镇III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "蒲英小镇III",
			["NextAchieve"] = 1010516,
			["PreAchieve"] = 1010514,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010516] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10516",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-鲁夫I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "鲁夫I",
			["NextAchieve"] = 1010517,
			["PreAchieve"] = 1010515,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010517] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10517",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-鲁夫II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "鲁夫II",
			["NextAchieve"] = 1010518,
			["PreAchieve"] = 1010516,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1010518] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "10518",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-鲁夫III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "鲁夫III",
			["NextAchieve"] = 1105181,
			["PreAchieve"] = 1010517,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020101] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20101",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-精英-厄尔湾",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-厄尔湾",
			["NextAchieve"] = 1020102,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020102] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20102",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-精英-无垠滩",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-无垠滩",
			["NextAchieve"] = 1020103,
			["PreAchieve"] = 1020101,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020103] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20103",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-精英-琅琊沟",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-琅琊沟",
			["NextAchieve"] = 1020104,
			["PreAchieve"] = 1020102,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020104] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20104",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-精英-彩虹域",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-彩虹域",
			["NextAchieve"] = 1020105,
			["PreAchieve"] = 1020103,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020105] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20105",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-精英-悼亡境",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-悼亡境",
			["NextAchieve"] = 1020106,
			["PreAchieve"] = 1020104,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020106] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20106",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-精英-魔龙岭",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-魔龙岭",
			["NextAchieve"] = 1020201,
			["PreAchieve"] = 1020105,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020201] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20201",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精英-上淤泽",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-上淤泽",
			["NextAchieve"] = 1020202,
			["PreAchieve"] = 1020106,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020202] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20202",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精英-海问滩",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-海问滩",
			["NextAchieve"] = 1020203,
			["PreAchieve"] = 1020201,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020203] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20203",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精英-雷临池",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-雷临池",
			["NextAchieve"] = 1020204,
			["PreAchieve"] = 1020202,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020204] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20204",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精英-化灵林",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-化灵林",
			["NextAchieve"] = 1020205,
			["PreAchieve"] = 1020203,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020205] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20205",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精英-迷雾岛",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-迷雾岛",
			["NextAchieve"] = 1020206,
			["PreAchieve"] = 1020204,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020206] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20206",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关2.精灵沼泽-精英-东崖廷",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-东崖廷",
			["NextAchieve"] = 1020301,
			["PreAchieve"] = 1020205,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020301] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20301",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-精英-冥魇渊",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-冥魇渊",
			["NextAchieve"] = 1020302,
			["PreAchieve"] = 1020206,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020302] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20302",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-精英-狱火境",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-狱火境",
			["NextAchieve"] = 1020303,
			["PreAchieve"] = 1020301,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020303] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20303",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-精英-蛇盘道",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-蛇盘道",
			["NextAchieve"] = 1020304,
			["PreAchieve"] = 1020302,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020304] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20304",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-精英-喀斯径",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-喀斯径",
			["NextAchieve"] = 1020305,
			["PreAchieve"] = 1020303,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020305] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20305",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-精英-钟乳峰",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-钟乳峰",
			["NextAchieve"] = 1020306,
			["PreAchieve"] = 1020304,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020306] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20306",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关3.帕雅神庙-精英-圣灵巅",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-圣灵巅",
			["NextAchieve"] = 1020401,
			["PreAchieve"] = 1020305,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020401] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20401",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-精英-涡藻坎",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-涡藻坎",
			["NextAchieve"] = 1020402,
			["PreAchieve"] = 1020306,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020402] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20402",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-精英-月轮壁",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-月轮壁",
			["NextAchieve"] = 1020403,
			["PreAchieve"] = 1020401,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020403] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20403",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-精英-渔网地",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-渔网地",
			["NextAchieve"] = 1020404,
			["PreAchieve"] = 1020402,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020404] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20404",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-精英-伯莱湖",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-伯莱湖",
			["NextAchieve"] = 1020405,
			["PreAchieve"] = 1020403,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020405] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20405",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-精英-圣甲巢",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-圣甲巢",
			["NextAchieve"] = 1020406,
			["PreAchieve"] = 1020404,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020406] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20406",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-精英-巫魔井",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-巫魔井",
			["NextAchieve"] = 1020501,
			["PreAchieve"] = 1020405,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020501] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20501",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-精英-神魔沼",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-神魔沼",
			["NextAchieve"] = 1020502,
			["PreAchieve"] = 1020406,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020502] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20502",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-精英-蝴蝶谷",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-蝴蝶谷",
			["NextAchieve"] = 1020503,
			["PreAchieve"] = 1020501,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020503] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20503",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-精英-迷人丘",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-迷人丘",
			["NextAchieve"] = 1020504,
			["PreAchieve"] = 1020502,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020504] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20504",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-精英-浮屠山",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-浮屠山",
			["NextAchieve"] = 1020505,
			["PreAchieve"] = 1020503,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020505] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20505",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-精英-幻魔峡",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-幻魔峡",
			["NextAchieve"] = 1020506,
			["PreAchieve"] = 1020504,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1020506] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "20506",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-精英-魔蛇窟",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英-魔蛇窟",
			["PreAchieve"] = 1020505,
			["RewardParam1"] = "5000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[10601] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 3)
end,
			},
			["CounterMax"] = 3,
			["CounterParam"] = "无",
			["CounterType"] = "卡牌技能升级",
			["Desc"] = "升级英雄技能3次",
			["IsDaily"] = true,
			["Level"] = 9,
			["ModuleType"] = "英雄技能",
			["Name"] = "技能升级",
			["RewardParam1"] = "50",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["Type"] = "日常",
		},
		[10901] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["卡牌升星"](API, User, AchieveItemCfg , 3)
end,
			},
			["Desc"] = "任意一个英雄升到3星",
			["Level"] = 22,
			["ModuleType"] = "卡牌升星",
			["Name"] = "三星英雄",
			["RewardParam1"] = "20000",
			["RewardType1"] = "金币",
			["Type"] = "成就",
		},
		[1101001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "101001",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-普攻，连击",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "普攻，连击",
			["NextAchieve"] = 1101002,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1101002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "101002",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-连击，奥义",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "连击，奥义",
			["NextAchieve"] = 1101003,
			["PreAchieve"] = 1101001,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1101003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "101003",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-BOSS战",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "BOSS战",
			["NextAchieve"] = 1010101,
			["PreAchieve"] = 1101002,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1101010] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "101010",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-罗宾奥义",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "罗宾奥义",
			["NextAchieve"] = 1010102,
			["PreAchieve"] = 1010101,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1101030] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "101030",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关1.珊瑚曲境-西鲁芙奥义",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "西鲁芙奥义",
			["NextAchieve"] = 1010104,
			["PreAchieve"] = 1010103,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1104061] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "104061",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-奖励关卡I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "奖励关卡I",
			["NextAchieve"] = 1010407,
			["PreAchieve"] = 1010406,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1104121] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "104121",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-奖励关卡II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "奖励关卡II",
			["NextAchieve"] = 1010413,
			["PreAchieve"] = 1010412,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1104181] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "104181",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关4.圣光之巢-奖励关卡III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "奖励关卡III",
			["NextAchieve"] = 1010501,
			["PreAchieve"] = 1010418,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1105061] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "105061",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-奖励关卡I",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "奖励关卡I",
			["NextAchieve"] = 1010507,
			["PreAchieve"] = 1010506,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1105121] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "105121",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-奖励关卡II",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "奖励关卡II",
			["NextAchieve"] = 1010513,
			["PreAchieve"] = 1010512,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[1105181] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "105181",
			["CounterType"] = "完成关卡",
			["Desc"] = "通关5.蒲英魔都-奖励关卡III",
			["Level"] = 0,
			["ModuleType"] = "完成关卡",
			["Name"] = "奖励关卡III",
			["PreAchieve"] = 1010518,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "5",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[11101] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["竞技场排名"](API, User, AchieveItemCfg , 1000)
end,
			},
			["Desc"] = "竞技场排名达到1000",
			["Level"] = 20,
			["ModuleType"] = "竞技场排名",
			["Name"] = "竞技王者",
			["RewardParam1"] = "200012,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[11102] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["领取竞技场积分次数"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterParam"] = "领取",
			["CounterType"] = "竞技场积分",
			["Desc"] = "领取1次竞技场积分奖励",
			["Level"] = 20,
			["ModuleType"] = "领取竞技场积分次数",
			["Name"] = "竞技积分",
			["RewardParam1"] = "200012,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[11201] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "极限挑战",
			["Desc"] = "完成一次极限挑战",
			["Level"] = 18,
			["ModuleType"] = "极限挑战",
			["Name"] = "极限挑战",
			["RewardParam1"] = "500004,5",
			["RewardType1"] = "物品",
			["Type"] = "成就",
		},
		[11401] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "完成街霸",
			["Desc"] = "挑战街霸里1个对手",
			["IsDaily"] = true,
			["Level"] = 23,
			["ModuleType"] = "完成街霸",
			["Name"] = "街头霸王",
			["RewardParam1"] = "50",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10510,
			["Type"] = "日常",
		},
		[12001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,5)
end,
			},
			["Desc"] = "召唤5个英雄",
			["Level"] = 20,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集1",
			["NextAchieve"] = 12002,
			["RewardParam1"] = "200012,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,7)
end,
			},
			["Desc"] = "召唤7个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集2",
			["NextAchieve"] = 12003,
			["PreAchieve"] = 12001,
			["RewardParam1"] = "200012,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,9)
end,
			},
			["Desc"] = "召唤9个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集3",
			["NextAchieve"] = 12004,
			["PreAchieve"] = 12002,
			["RewardParam1"] = "200012,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,11)
end,
			},
			["Desc"] = "召唤11个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集4",
			["NextAchieve"] = 12005,
			["PreAchieve"] = 12003,
			["RewardParam1"] = "200012,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,13)
end,
			},
			["Desc"] = "召唤13个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集5",
			["NextAchieve"] = 12006,
			["PreAchieve"] = 12004,
			["RewardParam1"] = "200012,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12006] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,15)
end,
			},
			["Desc"] = "召唤15个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集6",
			["NextAchieve"] = 12007,
			["PreAchieve"] = 12005,
			["RewardParam1"] = "200013,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12007] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,17)
end,
			},
			["Desc"] = "召唤17个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集7",
			["NextAchieve"] = 12008,
			["PreAchieve"] = 12006,
			["RewardParam1"] = "200013,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12008] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,19)
end,
			},
			["Desc"] = "召唤19个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集8",
			["NextAchieve"] = 12009,
			["PreAchieve"] = 12007,
			["RewardParam1"] = "200013,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12009] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,21)
end,
			},
			["Desc"] = "召唤21个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集9",
			["NextAchieve"] = 12010,
			["PreAchieve"] = 12008,
			["RewardParam1"] = "200013,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12010] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,23)
end,
			},
			["Desc"] = "召唤23个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集10",
			["NextAchieve"] = 12011,
			["PreAchieve"] = 12009,
			["RewardParam1"] = "200013,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12011] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,25)
end,
			},
			["Desc"] = "召唤25个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集11",
			["NextAchieve"] = 12012,
			["PreAchieve"] = 12010,
			["RewardParam1"] = "200013,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12012] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,27)
end,
			},
			["Desc"] = "召唤27个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集12",
			["NextAchieve"] = 12013,
			["PreAchieve"] = 12011,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12013] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,29)
end,
			},
			["Desc"] = "召唤29个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集13",
			["NextAchieve"] = 12014,
			["PreAchieve"] = 12012,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12014] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,31)
end,
			},
			["Desc"] = "召唤31个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集14",
			["NextAchieve"] = 12015,
			["PreAchieve"] = 12013,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12015] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,33)
end,
			},
			["Desc"] = "召唤33个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集15",
			["NextAchieve"] = 12016,
			["PreAchieve"] = 12014,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12016] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,35)
end,
			},
			["Desc"] = "召唤35个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集16",
			["NextAchieve"] = 12017,
			["PreAchieve"] = 12015,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12017] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,37)
end,
			},
			["Desc"] = "召唤37个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集17",
			["NextAchieve"] = 12018,
			["PreAchieve"] = 12016,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12018] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,39)
end,
			},
			["Desc"] = "召唤39个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集18",
			["NextAchieve"] = 12019,
			["PreAchieve"] = 12017,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[12019] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["得到星级卡牌"](API, User, AchieveItemCfg , 1,41)
end,
			},
			["Desc"] = "召唤41个英雄",
			["Level"] = 0,
			["ModuleType"] = "获得星级卡牌",
			["Name"] = "英雄召集19",
			["PreAchieve"] = 12018,
			["RewardParam1"] = "200014,5",
			["RewardParam2"] = "20000",
			["RewardType1"] = "物品",
			["RewardType2"] = "金币",
			["Type"] = "成就",
		},
		[20101] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 3)
end,
			},
			["CounterMax"] = 3,
			["CounterParam"] = "精英",
			["CounterType"] = "完成关卡",
			["Desc"] = "完成3次精英关卡",
			["IsDaily"] = true,
			["Level"] = 10,
			["ModuleType"] = "完成关卡",
			["Name"] = "精英关卡",
			["RewardParam1"] = "50",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10304,
			["Type"] = "日常",
		},
		[20201] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 10)
end,
			},
			["CounterMax"] = 10,
			["CounterParam"] = "普通",
			["CounterType"] = "完成关卡",
			["Desc"] = "完成10次普通关卡",
			["IsDaily"] = true,
			["Level"] = 5,
			["ModuleType"] = "完成关卡",
			["Name"] = "普通关卡",
			["RewardParam1"] = "100",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["Type"] = "日常",
		},
		[20301] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 3)
end,
			},
			["CounterMax"] = 3,
			["CounterParam"] = "无",
			["CounterType"] = "完成竞技场",
			["Desc"] = "完成竞技场比赛",
			["IsDaily"] = true,
			["Level"] = 12,
			["ModuleType"] = "完成关卡",
			["Name"] = "竞技场",
			["RewardParam1"] = "100",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10311,
			["Type"] = "日常",
		},
		[20501] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 2)
end,
			},
			["CounterMax"] = 2,
			["CounterParam"] = "无",
			["CounterType"] = "完成试炼",
			["Desc"] = "完成2次试炼",
			["IsDaily"] = true,
			["Level"] = 17,
			["ModuleType"] = "完成关卡",
			["Name"] = "强者试炼",
			["RewardParam1"] = "70",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10403,
			["Type"] = "日常",
		},
		[20701] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "抽卡",
			["Desc"] = "酒馆喝酒1次",
			["IsDaily"] = true,
			["Level"] = 5,
			["ModuleType"] = "抽卡",
			["Name"] = "喝一杯",
			["RewardParam1"] = "50",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10202,
			["Type"] = "日常",
		},
		[20801] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "完成探索",
			["Desc"] = "开始一次探索",
			["IsDaily"] = true,
			["Level"] = 16,
			["ModuleType"] = "完成探索",
			["Name"] = "前往探索",
			["RewardParam1"] = "50",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10503,
			["Type"] = "日常",
		},
		[21001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "古物鉴定",
			["Desc"] = "古董店鉴定古物1次",
			["IsDaily"] = true,
			["Level"] = 10,
			["ModuleType"] = "古物鉴定",
			["Name"] = "古董店寻宝",
			["RewardParam1"] = "50",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10302,
			["Type"] = "日常",
		},
		[30000] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取5张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V1]",
			["RewardParam1"] = "200000,5",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 1,
		},
		[30001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取10张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V2]",
			["RewardParam1"] = "200000,10",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 2,
		},
		[30002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取10张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V3]",
			["RewardParam1"] = "200000,10",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 3,
		},
		[30003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取15张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V4]",
			["RewardParam1"] = "200000,15",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 4,
		},
		[30004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取15张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V5]",
			["RewardParam1"] = "200000,15",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 5,
		},
		[30005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取20张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V6]",
			["RewardParam1"] = "200000,20",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 6,
		},
		[30006] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取20张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V7]",
			["RewardParam1"] = "200000,20",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 7,
		},
		[30007] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取25张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V8]",
			["RewardParam1"] = "200000,25",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 8,
		},
		[30008] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取25张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V9]",
			["RewardParam1"] = "200000,25",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 9,
		},
		[30009] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取30张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V10]",
			["RewardParam1"] = "200000,30",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 10,
		},
		[30010] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取40张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V11]",
			["RewardParam1"] = "200000,40",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 11,
		},
		[30011] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取50张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V12]",
			["RewardParam1"] = "200000,50",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 12,
		},
		[30012] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取60张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V13]",
			["RewardParam1"] = "200000,60",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 13,
		},
		[30013] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取70张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V14]",
			["RewardParam1"] = "200000,70",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 14,
		},
		[30014] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["无"](API, User, AchieveItemCfg )
end,
			},
			["Desc"] = "领取80张扫荡券",
			["IsDaily"] = true,
			["Level"] = 0,
			["ModuleType"] = "VIP福利",
			["Name"] = "扫荡券[V15]",
			["RewardParam1"] = "200000,80",
			["RewardType1"] = "物品",
			["Type"] = "日常",
			["VipLv"] = 15,
		},
		[40001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "购买体力",
			["Desc"] = "购买体力1次",
			["IsDaily"] = true,
			["Level"] = 16,
			["ModuleType"] = "购买体力",
			["Name"] = "购买体力",
			["RewardParam1"] = "50",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["Type"] = "日常",
		},
		[40002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "点金手",
			["Desc"] = "使用点金手1次",
			["IsDaily"] = true,
			["Level"] = 15,
			["ModuleType"] = "点金手",
			["Name"] = "点金手",
			["RewardParam1"] = "30",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["Type"] = "日常",
		},
		[40003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "商店购买",
			["Desc"] = "购买商品1次",
			["IsDaily"] = true,
			["Level"] = 12,
			["ModuleType"] = "商店购买",
			["Name"] = "商店购买",
			["RewardParam1"] = "30",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10307,
			["Type"] = "日常",
		},
		[40004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "装备洗练",
			["Desc"] = "装备洗炼1次",
			["IsDaily"] = true,
			["Level"] = 26,
			["ModuleType"] = "装备洗练",
			["Name"] = "装备洗炼",
			["RewardParam1"] = "30",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10305,
			["Type"] = "日常",
		},
		[40005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 5)
end,
			},
			["CounterMax"] = 5,
			["CounterParam"] = "无",
			["CounterType"] = "遗迹探险",
			["Desc"] = "挖到宝贝5个",
			["IsDaily"] = true,
			["Level"] = 15,
			["ModuleType"] = "遗迹探险",
			["Name"] = "遗迹探险",
			["RewardParam1"] = "30",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["StageId"] = 10309,
			["Type"] = "日常",
		},
		[40006] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 3)
end,
			},
			["CounterMax"] = 3,
			["CounterParam"] = "无",
			["CounterType"] = "英雄累计升级",
			["Desc"] = "任意英雄升级3次",
			["IsDaily"] = true,
			["Level"] = 10,
			["ModuleType"] = "英雄累计升级",
			["Name"] = "英雄升级",
			["RewardParam1"] = "30",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["Type"] = "日常",
		},
		[40007] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "无",
			["CounterType"] = "英雄累计升品",
			["Desc"] = "任意英雄觉醒1次",
			["IsDaily"] = true,
			["Level"] = 16,
			["ModuleType"] = "英雄累计升品",
			["Name"] = "英雄觉醒",
			["RewardParam1"] = "30",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["Type"] = "日常",
		},
		[40008] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["有月卡"](API, User, AchieveItemCfg )
end,
			},
			["CounterParam"] = "1",
			["CounterType"] = "Vip充值",
			["Desc"] = "每天可领取100钻石",
			["IsDaily"] = true,
			["Level"] = 1,
			["ModuleType"] = "月卡返利",
			["Name"] = "月卡福利",
			["Resident"] = true,
			["RewardParam1"] = "100",
			["RewardType1"] = "钻石",
			["Type"] = "日常",
		},
		[40009] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["有至尊卡"](API, User, AchieveItemCfg )
end,
			},
			["CounterParam"] = "2",
			["CounterType"] = "Vip充值",
			["Desc"] = "每天可领取100钻石",
			["IsDaily"] = true,
			["Level"] = 1,
			["ModuleType"] = "至尊卡返利",
			["Name"] = "至尊福利",
			["Resident"] = true,
			["RewardParam1"] = "100",
			["RewardType1"] = "钻石",
			["Type"] = "日常",
		},
		[40010] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 300)
end,
			},
			["CounterMax"] = 300,
			["CounterParam"] = "钻石",
			["CounterType"] = "消耗",
			["Desc"] = "消耗300钻石",
			["IsDaily"] = true,
			["Level"] = 15,
			["ModuleType"] = "消耗钻石",
			["Name"] = "消耗钻石",
			["RewardParam1"] = "30",
			["RewardParam2"] = "3000",
			["RewardType1"] = "经验",
			["RewardType2"] = "金币",
			["Type"] = "日常",
		},
		[50001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["英雄升级"](API, User, AchieveItemCfg , 2,5)
end,
			},
			["CounterMax"] = 2,
			["Desc"] = "任意升级2个英雄到5级",
			["Level"] = 6,
			["ModuleType"] = "英雄升级",
			["Name"] = "培养英雄1",
			["NextAchieve"] = 50002,
			["NotCheck"] = true,
			["RewardParam1"] = "3000",
			["RewardParam2"] = "200012,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[50002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["英雄升级"](API, User, AchieveItemCfg , 3,10)
end,
			},
			["CounterMax"] = 3,
			["Desc"] = "任意升级3个英雄到10级",
			["Level"] = 6,
			["ModuleType"] = "英雄升级",
			["Name"] = "培养英雄2",
			["NextAchieve"] = 50003,
			["NotCheck"] = true,
			["PreAchieve"] = 50001,
			["RewardParam1"] = "6000",
			["RewardParam2"] = "200012,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[50003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["多张卡牌进化颜色"](API, User, AchieveItemCfg , 1,4)
end,
			},
			["Desc"] = "4个英雄进阶到绿",
			["Level"] = 10,
			["ModuleType"] = "卡牌进化颜色",
			["Name"] = "觉醒1",
			["NextAchieve"] = 50004,
			["NotCheck"] = true,
			["PreAchieve"] = 50002,
			["RewardParam1"] = "6000",
			["RewardParam2"] = "20",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[50004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["多张卡牌进化颜色"](API, User, AchieveItemCfg , 2,3)
end,
			},
			["Desc"] = "3个英雄进阶到绿+1",
			["Level"] = 15,
			["ModuleType"] = "卡牌进化颜色",
			["Name"] = "觉醒2",
			["NotCheck"] = true,
			["PreAchieve"] = 50003,
			["RewardParam1"] = "6000",
			["RewardParam2"] = "20",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[50005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["多张卡牌进化颜色"](API, User, AchieveItemCfg , 3,2)
end,
			},
			["Desc"] = "2个英雄进阶到蓝",
			["Level"] = 20,
			["ModuleType"] = "卡牌进化颜色",
			["Name"] = "觉醒3",
			["NotCheck"] = true,
			["PreAchieve"] = 50003,
			["RewardParam1"] = "10000",
			["RewardParam2"] = "40",
			["RewardType1"] = "金币",
			["RewardType2"] = "钻石",
			["Type"] = "成就",
		},
		[60001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数数据达成"](API, User, AchieveItemCfg , 20)
end,
			},
			["CounterMax"] = 20,
			["CounterParam"] = "无",
			["CounterType"] = "遗迹挖矿达到深度",
			["Desc"] = "遗迹探险达到深度20",
			["Level"] = 1,
			["ModuleType"] = "遗迹挖矿达到",
			["Name"] = "遗迹深处1",
			["NextAchieve"] = 60002,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "1000,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10309,
			["Type"] = "成就",
		},
		[60002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数数据达成"](API, User, AchieveItemCfg , 50)
end,
			},
			["CounterMax"] = 50,
			["CounterParam"] = "无",
			["CounterType"] = "遗迹挖矿达到深度",
			["Desc"] = "遗迹探险达到深度50",
			["Level"] = 1,
			["ModuleType"] = "遗迹挖矿达到",
			["Name"] = "遗迹深处2",
			["NextAchieve"] = 60003,
			["PreAchieve"] = 60001,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "1000,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10309,
			["Type"] = "成就",
		},
		[60003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数数据达成"](API, User, AchieveItemCfg , 100)
end,
			},
			["CounterMax"] = 100,
			["CounterParam"] = "无",
			["CounterType"] = "遗迹挖矿达到深度",
			["Desc"] = "遗迹探险达到深度100",
			["Level"] = 1,
			["ModuleType"] = "遗迹挖矿达到",
			["Name"] = "遗迹深处3",
			["PreAchieve"] = 60002,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "1000,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10309,
			["Type"] = "成就",
		},
		[60004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数数据达成"](API, User, AchieveItemCfg , 20)
end,
			},
			["CounterMax"] = 20,
			["CounterParam"] = "无",
			["CounterType"] = "遗迹挖矿达到宽度",
			["Desc"] = "遗迹探险达到宽度20",
			["Level"] = 1,
			["ModuleType"] = "遗迹挖矿达到",
			["Name"] = "遗迹远处1",
			["NextAchieve"] = 60005,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "1000,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10309,
			["Type"] = "成就",
		},
		[60005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数数据达成"](API, User, AchieveItemCfg , 50)
end,
			},
			["CounterMax"] = 50,
			["CounterParam"] = "无",
			["CounterType"] = "遗迹挖矿达到宽度",
			["Desc"] = "遗迹探险达到宽度50",
			["Level"] = 1,
			["ModuleType"] = "遗迹挖矿达到",
			["Name"] = "遗迹远处2",
			["NextAchieve"] = 60006,
			["PreAchieve"] = 60004,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "1000,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10309,
			["Type"] = "成就",
		},
		[60006] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数数据达成"](API, User, AchieveItemCfg , 100)
end,
			},
			["CounterMax"] = 100,
			["CounterParam"] = "无",
			["CounterType"] = "遗迹挖矿达到宽度",
			["Desc"] = "遗迹探险达到宽度100",
			["Level"] = 1,
			["ModuleType"] = "遗迹挖矿达到",
			["Name"] = "遗迹远处3",
			["PreAchieve"] = 60005,
			["RewardParam1"] = "2000",
			["RewardParam2"] = "1000,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10309,
			["Type"] = "成就",
		},
		[70001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "普通_地图1",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(主线)珊瑚曲境获得满星",
			["Level"] = 3,
			["ModuleType"] = "满星通关",
			["Name"] = "关卡宝箱1",
			["NextAchieve"] = 70002,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500004,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[70002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "普通_地图2",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(主线)精灵沼泽获得满星",
			["Level"] = 5,
			["ModuleType"] = "满星通关",
			["Name"] = "关卡宝箱2",
			["NextAchieve"] = 70003,
			["PreAchieve"] = 70001,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500004,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[70003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "普通_地图3",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(主线)帕雅神庙获得满星",
			["Level"] = 10,
			["ModuleType"] = "满星通关",
			["Name"] = "关卡宝箱3",
			["NextAchieve"] = 70004,
			["PreAchieve"] = 70002,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500004,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[70004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "普通_地图4",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(主线)圣光之巢获得满星",
			["Level"] = 15,
			["ModuleType"] = "满星通关",
			["Name"] = "关卡宝箱4",
			["NextAchieve"] = 70005,
			["PreAchieve"] = 70003,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500004,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[70005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "普通_地图5",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(主线)蒲英魔都获得满星",
			["Level"] = 20,
			["ModuleType"] = "满星通关",
			["Name"] = "关卡宝箱5",
			["NextAchieve"] = 70006,
			["PreAchieve"] = 70004,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500004,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[70006] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "普通_地图6",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(主线)赤鹿之林获得满星",
			["Level"] = 25,
			["ModuleType"] = "满星通关",
			["Name"] = "关卡宝箱6",
			["PreAchieve"] = 70005,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500004,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["Type"] = "成就",
		},
		[80001] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "精英_地图1",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(精英)珊瑚曲境获得满星",
			["Level"] = 5,
			["ModuleType"] = "满星通关",
			["Name"] = "精英宝箱1",
			["NextAchieve"] = 80002,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500002,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10304,
			["Type"] = "成就",
		},
		[80002] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "精英_地图2",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(精英)精灵沼泽获得满星",
			["Level"] = 10,
			["ModuleType"] = "满星通关",
			["Name"] = "精英宝箱2",
			["NextAchieve"] = 80003,
			["PreAchieve"] = 80001,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500002,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10304,
			["Type"] = "成就",
		},
		[80003] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "精英_地图3",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(精英)帕雅神庙获得满星",
			["Level"] = 15,
			["ModuleType"] = "满星通关",
			["Name"] = "精英宝箱3",
			["NextAchieve"] = 80004,
			["PreAchieve"] = 80002,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500002,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10304,
			["Type"] = "成就",
		},
		[80004] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "精英_地图4",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(精英)圣光之巢获得满星",
			["Level"] = 20,
			["ModuleType"] = "满星通关",
			["Name"] = "精英宝箱4",
			["NextAchieve"] = 80005,
			["PreAchieve"] = 80003,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500002,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10304,
			["Type"] = "成就",
		},
		[80005] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "精英_地图5",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(精英)蒲英魔都获得满星",
			["Level"] = 25,
			["ModuleType"] = "满星通关",
			["Name"] = "精英宝箱5",
			["NextAchieve"] = 80006,
			["PreAchieve"] = 80004,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500002,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10304,
			["Type"] = "成就",
		},
		[80006] = {
			["ConditionFuncs"] = {
				function (API, User, AchieveItemCfg)
	local Args = {}  return API["计数达成"](API, User, AchieveItemCfg , 1)
end,
			},
			["CounterMax"] = 1,
			["CounterParam"] = "精英_地图6",
			["CounterType"] = "满星通关地图",
			["Desc"] = "(精英)赤鹿之林获得满星",
			["Level"] = 30,
			["ModuleType"] = "满星通关",
			["Name"] = "精英宝箱6",
			["PreAchieve"] = 80005,
			["RewardParam1"] = "20000",
			["RewardParam2"] = "500002,5",
			["RewardType1"] = "金币",
			["RewardType2"] = "物品",
			["StageId"] = 10304,
			["Type"] = "成就",
		},
	},
	["DateCfg"] = {
	},
}