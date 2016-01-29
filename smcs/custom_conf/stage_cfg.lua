return 
{
	["ActStage2Level"] = {
		[200001] = 1,
		[200002] = 30,
		[200003] = 55,
		[200004] = 70,
		[200005] = 80,
		[200006] = 90,
		[200007] = 1,
		[200008] = 30,
		[200009] = 55,
		[200010] = 70,
		[200011] = 80,
		[200012] = 90,
		[200013] = 1,
		[200014] = 30,
		[200015] = 55,
		[200016] = 70,
		[200017] = 80,
		[200018] = 90,
		[200019] = 1,
		[200020] = 30,
		[200021] = 55,
		[200022] = 70,
		[200023] = 80,
		[200024] = 90,
		[200025] = 1,
		[200026] = 30,
		[200027] = 55,
		[200028] = 70,
		[200029] = 80,
		[200030] = 90,
	},
	["ActStageCfg"] = {
		[200001] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,1)
end,
				function (API, OP)
	return API[4](OP,200001)
end,
			},
			["Desc"] = "金币多多！",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200001)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1011)
end,
				function (API, OP)
	return API[1](OP, 1012)
end,
				function (API, OP)
	return API[1](OP, 1013)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200001,
			["ItemDesc"] = {
				["Item"] = {
					200015,
				},
			},
			["MapPath"] = "scene_7",
			["MonsterId"] = 1011,
			["Name"] = "物理免疫（难度1）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "傀俑古地Ⅰ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200001)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200002] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,30)
end,
				function (API, OP)
	return API[4](OP,200002)
end,
			},
			["Desc"] = "金币多多！",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200002)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1014)
end,
				function (API, OP)
	return API[1](OP, 1015)
end,
				function (API, OP)
	return API[1](OP, 1016)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200002,
			["ItemDesc"] = {
				["Item"] = {
					200015,
					200016,
				},
			},
			["MapPath"] = "scene_8",
			["MonsterId"] = 1015,
			["Name"] = "物理免疫（难度2）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "傀俑古地Ⅱ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200002)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200003] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,55)
end,
				function (API, OP)
	return API[4](OP,200003)
end,
			},
			["Desc"] = "金币多多！",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200003)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1017)
end,
				function (API, OP)
	return API[1](OP, 1018)
end,
				function (API, OP)
	return API[1](OP, 1019)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200003,
			["ItemDesc"] = {
				["Item"] = {
					200015,
					200016,
				},
			},
			["MapPath"] = "scene_1",
			["MonsterId"] = 1019,
			["Name"] = "物理免疫（难度3）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "傀俑古地Ⅲ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200003)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200004] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,70)
end,
				function (API, OP)
	return API[4](OP,200004)
end,
			},
			["Desc"] = "金币多多！",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200004)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1020)
end,
				function (API, OP)
	return API[1](OP, 1021)
end,
				function (API, OP)
	return API[1](OP, 1022)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200004,
			["ItemDesc"] = {
				["Item"] = {
					200015,
					200016,
				},
			},
			["MapPath"] = "scene_7",
			["MonsterId"] = 1020,
			["Name"] = "物理免疫（难度4）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "傀俑古地Ⅳ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200004)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200005] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,80)
end,
				function (API, OP)
	return API[4](OP,200005)
end,
			},
			["Desc"] = "金币多多！",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200005)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1023)
end,
				function (API, OP)
	return API[1](OP, 1024)
end,
				function (API, OP)
	return API[1](OP, 1025)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200005,
			["ItemDesc"] = {
				["Item"] = {
					200015,
					200016,
				},
			},
			["MapPath"] = "scene_8",
			["MonsterId"] = 1024,
			["Name"] = "物理免疫（难度5）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "傀俑古地Ⅴ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200005)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200006] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,90)
end,
				function (API, OP)
	return API[4](OP,200006)
end,
			},
			["Desc"] = "金币多多！",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200006)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1026)
end,
				function (API, OP)
	return API[1](OP, 1027)
end,
				function (API, OP)
	return API[1](OP, 1028)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200006,
			["ItemDesc"] = {
				["Item"] = {
					200015,
					200016,
				},
			},
			["MapPath"] = "scene_1",
			["MonsterId"] = 1028,
			["Name"] = "物理免疫（难度6）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "傀俑古地Ⅵ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200006)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200007] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,1)
end,
				function (API, OP)
	return API[4](OP,200007)
end,
			},
			["Desc"] = "经验药水多多!",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200007)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1029)
end,
				function (API, OP)
	return API[1](OP, 1030)
end,
				function (API, OP)
	return API[1](OP, 1031)
end,
			},
			["ExpBonus"] = 0,
			["HireType"] = 1,
			["Id"] = 200007,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_3",
			["MonsterId"] = 1029,
			["Name"] = "法术免疫（难度1）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "英魂空间Ⅰ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200007)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200008] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,30)
end,
				function (API, OP)
	return API[4](OP,200008)
end,
			},
			["Desc"] = "经验药水多多!",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200008)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1032)
end,
				function (API, OP)
	return API[1](OP, 1033)
end,
				function (API, OP)
	return API[1](OP, 1034)
end,
			},
			["ExpBonus"] = 0,
			["HireType"] = 1,
			["Id"] = 200008,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 1033,
			["Name"] = "法术免疫（难度2）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "英魂空间Ⅱ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200008)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200009] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,55)
end,
				function (API, OP)
	return API[4](OP,200009)
end,
			},
			["Desc"] = "经验药水多多!",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200009)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1035)
end,
				function (API, OP)
	return API[1](OP, 1036)
end,
				function (API, OP)
	return API[1](OP, 1037)
end,
			},
			["ExpBonus"] = 0,
			["HireType"] = 1,
			["Id"] = 200009,
			["ItemDesc"] = {
				["Item"] = {
					200012,
					200013,
				},
			},
			["MapPath"] = "scene_7",
			["MonsterId"] = 1037,
			["Name"] = "法术免疫（难度3）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "英魂空间Ⅲ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200009)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200010] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,70)
end,
				function (API, OP)
	return API[4](OP,200010)
end,
			},
			["Desc"] = "经验药水多多!",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200010)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1038)
end,
				function (API, OP)
	return API[1](OP, 1039)
end,
				function (API, OP)
	return API[1](OP, 1040)
end,
			},
			["ExpBonus"] = 0,
			["HireType"] = 1,
			["Id"] = 200010,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200013,
				},
			},
			["MapPath"] = "scene_3",
			["MonsterId"] = 1038,
			["Name"] = "法术免疫（难度4）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "英魂空间Ⅳ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200010)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200011] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,80)
end,
				function (API, OP)
	return API[4](OP,200011)
end,
			},
			["Desc"] = "经验药水多多!",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200011)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1041)
end,
				function (API, OP)
	return API[1](OP, 1042)
end,
				function (API, OP)
	return API[1](OP, 1043)
end,
			},
			["ExpBonus"] = 0,
			["HireType"] = 1,
			["Id"] = 200011,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200013,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 1042,
			["Name"] = "法术免疫（难度5）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "英魂空间Ⅴ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200011)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200012] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,90)
end,
				function (API, OP)
	return API[4](OP,200012)
end,
			},
			["Desc"] = "经验药水多多!",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200012)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1044)
end,
				function (API, OP)
	return API[1](OP, 1045)
end,
				function (API, OP)
	return API[1](OP, 1046)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200012,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200013,
				},
			},
			["MapPath"] = "scene_7",
			["MonsterId"] = 1046,
			["Name"] = "法术免疫（难度6）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "英魂空间Ⅵ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200012)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200013] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,1)
end,
				function (API, OP)
	return API[4](OP,200013)
end,
			},
			["Desc"] = "进阶石多多！#r只能选择物理英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200013)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1047)
end,
				function (API, OP)
	return API[1](OP, 1048)
end,
				function (API, OP)
	return API[1](OP, 1049)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200013,
			["ItemDesc"] = {
				["Item"] = {
					610001,
				},
			},
			["MapPath"] = "scene_8",
			["MonsterId"] = 1047,
			["Name"] = "水属性限定（难度1）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "九曲堑径Ⅰ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200013)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200014] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,30)
end,
				function (API, OP)
	return API[4](OP,200014)
end,
			},
			["Desc"] = "进阶石多多！#r只能选择物理英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200014)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1050)
end,
				function (API, OP)
	return API[1](OP, 1051)
end,
				function (API, OP)
	return API[1](OP, 1052)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200014,
			["ItemDesc"] = {
				["Item"] = {
					610001,
				},
			},
			["MapPath"] = "scene_1",
			["MonsterId"] = 1051,
			["Name"] = "水属性限定（难度2）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "九曲堑径Ⅱ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200014)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200015] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,55)
end,
				function (API, OP)
	return API[4](OP,200015)
end,
			},
			["Desc"] = "进阶石多多！#r只能选择物理英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200015)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1053)
end,
				function (API, OP)
	return API[1](OP, 1054)
end,
				function (API, OP)
	return API[1](OP, 1055)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200015,
			["ItemDesc"] = {
				["Item"] = {
					610001,
				},
			},
			["MapPath"] = "scene_3",
			["MonsterId"] = 1055,
			["Name"] = "水属性限定（难度3）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "九曲堑径Ⅲ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200015)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200016] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,70)
end,
				function (API, OP)
	return API[4](OP,200016)
end,
			},
			["Desc"] = "进阶石多多！#r只能选择物理英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200016)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1056)
end,
				function (API, OP)
	return API[1](OP, 1057)
end,
				function (API, OP)
	return API[1](OP, 1058)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200016,
			["ItemDesc"] = {
				["Item"] = {
					610001,
				},
			},
			["MapPath"] = "scene_8",
			["MonsterId"] = 1056,
			["Name"] = "水属性限定（难度4）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "九曲堑径Ⅳ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200016)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200017] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,80)
end,
				function (API, OP)
	return API[4](OP,200017)
end,
			},
			["Desc"] = "进阶石多多！#r只能选择物理英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200017)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1059)
end,
				function (API, OP)
	return API[1](OP, 1060)
end,
				function (API, OP)
	return API[1](OP, 1061)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200017,
			["ItemDesc"] = {
				["Item"] = {
					610001,
				},
			},
			["MapPath"] = "scene_1",
			["MonsterId"] = 1060,
			["Name"] = "水属性限定（难度5）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "九曲堑径Ⅴ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200017)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200018] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,90)
end,
				function (API, OP)
	return API[4](OP,200018)
end,
			},
			["Desc"] = "进阶石多多！#r只能选择物理英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200018)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1062)
end,
				function (API, OP)
	return API[1](OP, 1063)
end,
				function (API, OP)
	return API[1](OP, 1064)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200018,
			["ItemDesc"] = {
				["Item"] = {
					610001,
				},
			},
			["MapPath"] = "scene_3",
			["MonsterId"] = 1064,
			["Name"] = "水属性限定（难度6）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "九曲堑径Ⅵ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200018)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200019] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,1)
end,
				function (API, OP)
	return API[4](OP,200019)
end,
			},
			["Desc"] = "掉落丰富的觉醒材料！#r只能选择法术英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200019)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1065)
end,
				function (API, OP)
	return API[1](OP, 1066)
end,
				function (API, OP)
	return API[1](OP, 1067)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200019,
			["ItemDesc"] = {
				["Item"] = {
					610105,
					610205,
					610305,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 1065,
			["Name"] = "火属性限定（难度1）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "熔岩火浴Ⅰ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200019)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200020] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,30)
end,
				function (API, OP)
	return API[4](OP,200020)
end,
			},
			["Desc"] = "掉落丰富的觉醒材料！#r只能选择法术英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200020)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1068)
end,
				function (API, OP)
	return API[1](OP, 1069)
end,
				function (API, OP)
	return API[1](OP, 1070)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200020,
			["ItemDesc"] = {
				["Item"] = {
					610107,
					610207,
					610307,
				},
			},
			["MapPath"] = "scene_7",
			["MonsterId"] = 1069,
			["Name"] = "火属性限定（难度2）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "熔岩火浴Ⅱ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200020)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200021] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,55)
end,
				function (API, OP)
	return API[4](OP,200021)
end,
			},
			["Desc"] = "掉落丰富的觉醒材料！#r只能选择法术英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200021)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1071)
end,
				function (API, OP)
	return API[1](OP, 1072)
end,
				function (API, OP)
	return API[1](OP, 1073)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200021,
			["ItemDesc"] = {
				["Item"] = {
					610108,
					610208,
					610308,
				},
			},
			["MapPath"] = "scene_8",
			["MonsterId"] = 1073,
			["Name"] = "火属性限定（难度3）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "熔岩火浴Ⅲ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200021)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200022] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,70)
end,
				function (API, OP)
	return API[4](OP,200022)
end,
			},
			["Desc"] = "掉落丰富的觉醒材料！#r只能选择法术英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200022)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1074)
end,
				function (API, OP)
	return API[1](OP, 1075)
end,
				function (API, OP)
	return API[1](OP, 1076)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200022,
			["ItemDesc"] = {
				["Item"] = {
					610108,
					610208,
					610308,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 1074,
			["Name"] = "火属性限定（难度4）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "熔岩火浴Ⅳ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200022)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200023] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,80)
end,
				function (API, OP)
	return API[4](OP,200023)
end,
			},
			["Desc"] = "掉落丰富的觉醒材料！#r只能选择法术英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200023)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1077)
end,
				function (API, OP)
	return API[1](OP, 1078)
end,
				function (API, OP)
	return API[1](OP, 1079)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200023,
			["ItemDesc"] = {
				["Item"] = {
					610108,
					610208,
					610308,
				},
			},
			["MapPath"] = "scene_7",
			["MonsterId"] = 1078,
			["Name"] = "火属性限定（难度5）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "熔岩火浴Ⅴ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200023)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200024] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,90)
end,
				function (API, OP)
	return API[4](OP,200024)
end,
			},
			["Desc"] = "掉落丰富的觉醒材料！#r只能选择法术英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200024)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1080)
end,
				function (API, OP)
	return API[1](OP, 1081)
end,
				function (API, OP)
	return API[1](OP, 1082)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200024,
			["ItemDesc"] = {
				["Item"] = {
					610108,
					610208,
					610308,
				},
			},
			["MapPath"] = "scene_8",
			["MonsterId"] = 1082,
			["Name"] = "火属性限定（难度6）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "熔岩火浴Ⅵ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200024)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200025] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,1)
end,
				function (API, OP)
	return API[4](OP,200025)
end,
			},
			["Desc"] = "掉落丰富的装备进阶材料！#r只能选择女性英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200025)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1083)
end,
				function (API, OP)
	return API[1](OP, 1084)
end,
				function (API, OP)
	return API[1](OP, 1085)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200025,
			["ItemDesc"] = {
				["Item"] = {
					3000201,
					3000202,
					3000203,
				},
			},
			["MapPath"] = "scene_1",
			["MonsterId"] = 1083,
			["Name"] = "木属性限定（难度1）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "阡陌桃园Ⅰ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200025)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200026] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,30)
end,
				function (API, OP)
	return API[4](OP,200026)
end,
			},
			["Desc"] = "掉落丰富的装备进阶材料！#r只能选择女性英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200026)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1086)
end,
				function (API, OP)
	return API[1](OP, 1087)
end,
				function (API, OP)
	return API[1](OP, 1088)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200026,
			["ItemDesc"] = {
				["Item"] = {
					3000301,
					3000302,
					3000303,
					3000304,
				},
			},
			["MapPath"] = "scene_3",
			["MonsterId"] = 1087,
			["Name"] = "木属性限定（难度2）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "阡陌桃园Ⅱ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200026)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200027] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,55)
end,
				function (API, OP)
	return API[4](OP,200027)
end,
			},
			["Desc"] = "掉落丰富的装备进阶材料！#r只能选择女性英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200027)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1089)
end,
				function (API, OP)
	return API[1](OP, 1090)
end,
				function (API, OP)
	return API[1](OP, 1091)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200027,
			["ItemDesc"] = {
				["Item"] = {
					3000401,
					3000402,
					3000403,
					3000404,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 1091,
			["Name"] = "木属性限定（难度3）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "阡陌桃园Ⅲ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200027)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200028] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,70)
end,
				function (API, OP)
	return API[4](OP,200028)
end,
			},
			["Desc"] = "掉落丰富的装备进阶材料！#r只能选择女性英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200028)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1092)
end,
				function (API, OP)
	return API[1](OP, 1093)
end,
				function (API, OP)
	return API[1](OP, 1094)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200028,
			["ItemDesc"] = {
				["Item"] = {
					3000501,
					3000502,
					3000503,
				},
			},
			["MapPath"] = "scene_1",
			["MonsterId"] = 1092,
			["Name"] = "木属性限定（难度4）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "阡陌桃园Ⅳ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200028)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200029] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,80)
end,
				function (API, OP)
	return API[4](OP,200029)
end,
			},
			["Desc"] = "掉落丰富的装备进阶材料！#r只能选择女性英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200029)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1095)
end,
				function (API, OP)
	return API[1](OP, 1096)
end,
				function (API, OP)
	return API[1](OP, 1097)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200029,
			["ItemDesc"] = {
				["Item"] = {
					3000501,
					3000502,
					3000503,
				},
			},
			["MapPath"] = "scene_3",
			["MonsterId"] = 1096,
			["Name"] = "木属性限定（难度5）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "阡陌桃园Ⅴ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200029)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[200030] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,90)
end,
				function (API, OP)
	return API[4](OP,200030)
end,
			},
			["Desc"] = "掉落丰富的装备进阶材料！#r只能选择女性英雄",
			["EndAccount"] = {
				function (API, OP)
	return API[5](OP,200030)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 1098)
end,
				function (API, OP)
	return API[1](OP, 1099)
end,
				function (API, OP)
	return API[1](OP, 1100)
end,
			},
			["ExpBonus"] = 10,
			["HireType"] = 1,
			["Id"] = 200030,
			["ItemDesc"] = {
				["Item"] = {
					3000501,
					3000502,
					3000503,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 1100,
			["Name"] = "木属性限定（难度6）",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "阡陌桃园Ⅵ",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[10](OP,200030)
end,
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
		},
		[400011] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,9)
end,
			},
			["Demo"] = "极限挑战教学1",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400011)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400011)
end,
			},
			["HireType"] = 5,
			["Id"] = 400011,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400011,
			["Name"] = "极限挑战1-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战1-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400011)
end,
			},
		},
		[400012] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400011)
end,
			},
			["Demo"] = "极限挑战教学2",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400012)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400012)
end,
			},
			["HireType"] = 5,
			["Id"] = 400012,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400012,
			["Name"] = "极限挑战1-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战1-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400012)
end,
			},
		},
		[400013] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400012)
end,
			},
			["Demo"] = "极限挑战教学3",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400013)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400013)
end,
			},
			["HireType"] = 5,
			["Id"] = 400013,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400013,
			["Name"] = "极限挑战1-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战1-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400013)
end,
			},
		},
		[400021] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400013)
end,
			},
			["Demo"] = "极限挑战教学4",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400021)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400021)
end,
			},
			["HireType"] = 5,
			["Id"] = 400021,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400021,
			["Name"] = "极限挑战2-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战2-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400021)
end,
			},
		},
		[400022] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400021)
end,
			},
			["Demo"] = "极限挑战教学5",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400022)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400022)
end,
			},
			["HireType"] = 5,
			["Id"] = 400022,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400022,
			["Name"] = "极限挑战2-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战2-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400022)
end,
			},
		},
		[400023] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400022)
end,
			},
			["Demo"] = "极限挑战教学6",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400023)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400023)
end,
			},
			["HireType"] = 5,
			["Id"] = 400023,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400023,
			["Name"] = "极限挑战2-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战2-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400023)
end,
			},
		},
		[400031] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400023)
end,
			},
			["Demo"] = "极限挑战教学7",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400031)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400031)
end,
			},
			["HireType"] = 5,
			["Id"] = 400031,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400031,
			["Name"] = "极限挑战3-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战3-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400031)
end,
			},
		},
		[400032] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400031)
end,
			},
			["Demo"] = "极限挑战教学8",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400032)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400032)
end,
			},
			["HireType"] = 5,
			["Id"] = 400032,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400032,
			["Name"] = "极限挑战3-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战3-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400032)
end,
			},
		},
		[400033] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400032)
end,
			},
			["Demo"] = "极限挑战教学9",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400033)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400033)
end,
			},
			["HireType"] = 5,
			["Id"] = 400033,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400033,
			["Name"] = "极限挑战3-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战3-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400033)
end,
			},
		},
		[400041] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400033)
end,
			},
			["Demo"] = "极限挑战教学10",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400041)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400041)
end,
			},
			["HireType"] = 5,
			["Id"] = 400041,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400041,
			["Name"] = "极限挑战4-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战4-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400041)
end,
			},
		},
		[400042] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400041)
end,
			},
			["Demo"] = "极限挑战教学11",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400042)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400042)
end,
			},
			["HireType"] = 5,
			["Id"] = 400042,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400042,
			["Name"] = "极限挑战4-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战4-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400042)
end,
			},
		},
		[400043] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400042)
end,
			},
			["Demo"] = "极限挑战教学12",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400043)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400043)
end,
			},
			["HireType"] = 5,
			["Id"] = 400043,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400043,
			["Name"] = "极限挑战4-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战4-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400043)
end,
			},
		},
		[400051] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400043)
end,
			},
			["Demo"] = "极限挑战教学13",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400051)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400051)
end,
			},
			["HireType"] = 5,
			["Id"] = 400051,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400051,
			["Name"] = "极限挑战5-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战5-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400051)
end,
			},
		},
		[400052] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400051)
end,
			},
			["Demo"] = "极限挑战教学14",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400052)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400052)
end,
			},
			["HireType"] = 5,
			["Id"] = 400052,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400052,
			["Name"] = "极限挑战5-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战5-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400052)
end,
			},
		},
		[400053] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400052)
end,
			},
			["Demo"] = "极限挑战教学15",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400053)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400053)
end,
			},
			["HireType"] = 5,
			["Id"] = 400053,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400053,
			["Name"] = "极限挑战5-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战5-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400053)
end,
			},
		},
		[400061] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400053)
end,
			},
			["Demo"] = "极限挑战教学16",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400061)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400061)
end,
			},
			["HireType"] = 5,
			["Id"] = 400061,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400061,
			["Name"] = "极限挑战6-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战6-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400061)
end,
			},
		},
		[400062] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400061)
end,
			},
			["Demo"] = "极限挑战教学17",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400062)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400062)
end,
			},
			["HireType"] = 5,
			["Id"] = 400062,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400062,
			["Name"] = "极限挑战6-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战6-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400062)
end,
			},
		},
		[400063] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400062)
end,
			},
			["Demo"] = "极限挑战教学18",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400063)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400063)
end,
			},
			["HireType"] = 5,
			["Id"] = 400063,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400063,
			["Name"] = "极限挑战6-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战6-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400063)
end,
			},
		},
		[400071] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400063)
end,
			},
			["Demo"] = "极限挑战教学19",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400071)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400071)
end,
			},
			["HireType"] = 5,
			["Id"] = 400071,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400071,
			["Name"] = "极限挑战7-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战7-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400071)
end,
			},
		},
		[400072] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400071)
end,
			},
			["Demo"] = "极限挑战教学20",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400072)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400072)
end,
			},
			["HireType"] = 5,
			["Id"] = 400072,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400072,
			["Name"] = "极限挑战7-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战7-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400072)
end,
			},
		},
		[400073] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400072)
end,
			},
			["Demo"] = "极限挑战教学21",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400073)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400073)
end,
			},
			["HireType"] = 5,
			["Id"] = 400073,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400073,
			["Name"] = "极限挑战7-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战7-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400073)
end,
			},
		},
		[400081] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400073)
end,
			},
			["Demo"] = "极限挑战教学22",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400081)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400081)
end,
			},
			["HireType"] = 5,
			["Id"] = 400081,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400081,
			["Name"] = "极限挑战8-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战8-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400081)
end,
			},
		},
		[400082] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400081)
end,
			},
			["Demo"] = "极限挑战教学23",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400082)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400082)
end,
			},
			["HireType"] = 5,
			["Id"] = 400082,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400082,
			["Name"] = "极限挑战8-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战8-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400082)
end,
			},
		},
		[400083] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400082)
end,
			},
			["Demo"] = "极限挑战教学24",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400083)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400083)
end,
			},
			["HireType"] = 5,
			["Id"] = 400083,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400083,
			["Name"] = "极限挑战8-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战8-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400083)
end,
			},
		},
		[400091] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400083)
end,
			},
			["Demo"] = "极限挑战教学25",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400091)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400091)
end,
			},
			["HireType"] = 5,
			["Id"] = 400091,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400091,
			["Name"] = "极限挑战9-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战9-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400091)
end,
			},
		},
		[400092] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400091)
end,
			},
			["Demo"] = "极限挑战教学26",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400092)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400092)
end,
			},
			["HireType"] = 5,
			["Id"] = 400092,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400092,
			["Name"] = "极限挑战9-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战9-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400092)
end,
			},
		},
		[400093] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400092)
end,
			},
			["Demo"] = "极限挑战教学27",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400093)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400093)
end,
			},
			["HireType"] = 5,
			["Id"] = 400093,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400093,
			["Name"] = "极限挑战9-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战9-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400093)
end,
			},
		},
		[400101] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400093)
end,
			},
			["Demo"] = "极限挑战教学28",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400101)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400101)
end,
			},
			["HireType"] = 5,
			["Id"] = 400101,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400101,
			["Name"] = "极限挑战10-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战10-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400101)
end,
			},
		},
		[400102] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400101)
end,
			},
			["Demo"] = "极限挑战教学29",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400102)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400102)
end,
			},
			["HireType"] = 5,
			["Id"] = 400102,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400102,
			["Name"] = "极限挑战10-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战10-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400102)
end,
			},
		},
		[400103] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400102)
end,
			},
			["Demo"] = "极限挑战教学30",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400103)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400103)
end,
			},
			["HireType"] = 5,
			["Id"] = 400103,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400103,
			["Name"] = "极限挑战10-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战10-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400103)
end,
			},
		},
		[400111] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400103)
end,
			},
			["Demo"] = "极限挑战教学31",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400111)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400111)
end,
			},
			["HireType"] = 5,
			["Id"] = 400111,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400111,
			["Name"] = "极限挑战11-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战11-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400111)
end,
			},
		},
		[400112] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400111)
end,
			},
			["Demo"] = "极限挑战教学32",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400112)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400112)
end,
			},
			["HireType"] = 5,
			["Id"] = 400112,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400112,
			["Name"] = "极限挑战11-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战11-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400112)
end,
			},
		},
		[400113] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400112)
end,
			},
			["Demo"] = "极限挑战教学33",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400113)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400113)
end,
			},
			["HireType"] = 5,
			["Id"] = 400113,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400113,
			["Name"] = "极限挑战11-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战11-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400113)
end,
			},
		},
		[400121] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400113)
end,
			},
			["Demo"] = "极限挑战教学34",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400121)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400121)
end,
			},
			["HireType"] = 5,
			["Id"] = 400121,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400121,
			["Name"] = "极限挑战12-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战12-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400121)
end,
			},
		},
		[400122] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400121)
end,
			},
			["Demo"] = "极限挑战教学35",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400122)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400122)
end,
			},
			["HireType"] = 5,
			["Id"] = 400122,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400122,
			["Name"] = "极限挑战12-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战12-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400122)
end,
			},
		},
		[400123] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400122)
end,
			},
			["Demo"] = "极限挑战教学36",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400123)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400123)
end,
			},
			["HireType"] = 5,
			["Id"] = 400123,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400123,
			["Name"] = "极限挑战12-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战12-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400123)
end,
			},
		},
		[400131] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400123)
end,
			},
			["Demo"] = "极限挑战教学37",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400131)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400131)
end,
			},
			["HireType"] = 5,
			["Id"] = 400131,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400131,
			["Name"] = "极限挑战13-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战13-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400131)
end,
			},
		},
		[400132] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400131)
end,
			},
			["Demo"] = "极限挑战教学38",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400132)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400132)
end,
			},
			["HireType"] = 5,
			["Id"] = 400132,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400132,
			["Name"] = "极限挑战13-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战13-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400132)
end,
			},
		},
		[400133] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400132)
end,
			},
			["Demo"] = "极限挑战教学39",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400133)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400133)
end,
			},
			["HireType"] = 5,
			["Id"] = 400133,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400133,
			["Name"] = "极限挑战13-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战13-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400133)
end,
			},
		},
		[400141] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400133)
end,
			},
			["Demo"] = "极限挑战教学40",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400141)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400141)
end,
			},
			["HireType"] = 5,
			["Id"] = 400141,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400141,
			["Name"] = "极限挑战14-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战14-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400141)
end,
			},
		},
		[400142] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400141)
end,
			},
			["Demo"] = "极限挑战教学41",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400142)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400142)
end,
			},
			["HireType"] = 5,
			["Id"] = 400142,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400142,
			["Name"] = "极限挑战14-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战14-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400142)
end,
			},
		},
		[400143] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400142)
end,
			},
			["Demo"] = "极限挑战教学42",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400143)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400143)
end,
			},
			["HireType"] = 5,
			["Id"] = 400143,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400143,
			["Name"] = "极限挑战14-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战14-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400143)
end,
			},
		},
		[400151] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400143)
end,
			},
			["Demo"] = "极限挑战教学43",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400151)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400151)
end,
			},
			["HireType"] = 5,
			["Id"] = 400151,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400151,
			["Name"] = "极限挑战15-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战15-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400151)
end,
			},
		},
		[400152] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400151)
end,
			},
			["Demo"] = "极限挑战教学44",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400152)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400152)
end,
			},
			["HireType"] = 5,
			["Id"] = 400152,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400152,
			["Name"] = "极限挑战15-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战15-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400152)
end,
			},
		},
		[400153] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400152)
end,
			},
			["Demo"] = "极限挑战教学45",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400153)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400153)
end,
			},
			["HireType"] = 5,
			["Id"] = 400153,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400153,
			["Name"] = "极限挑战15-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战15-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400153)
end,
			},
		},
		[400161] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400153)
end,
			},
			["Demo"] = "极限挑战教学46",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400161)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400161)
end,
			},
			["HireType"] = 5,
			["Id"] = 400161,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400161,
			["Name"] = "极限挑战16-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战16-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400161)
end,
			},
		},
		[400162] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400161)
end,
			},
			["Demo"] = "极限挑战教学47",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400162)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400162)
end,
			},
			["HireType"] = 5,
			["Id"] = 400162,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400162,
			["Name"] = "极限挑战16-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战16-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400162)
end,
			},
		},
		[400163] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400162)
end,
			},
			["Demo"] = "极限挑战教学48",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400163)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400163)
end,
			},
			["HireType"] = 5,
			["Id"] = 400163,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400163,
			["Name"] = "极限挑战16-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战16-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400163)
end,
			},
		},
		[400171] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400163)
end,
			},
			["Demo"] = "极限挑战教学49",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400171)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400171)
end,
			},
			["HireType"] = 5,
			["Id"] = 400171,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400171,
			["Name"] = "极限挑战17-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战17-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400171)
end,
			},
		},
		[400172] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400171)
end,
			},
			["Demo"] = "极限挑战教学50",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400172)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400172)
end,
			},
			["HireType"] = 5,
			["Id"] = 400172,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400172,
			["Name"] = "极限挑战17-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战17-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400172)
end,
			},
		},
		[400173] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400172)
end,
			},
			["Demo"] = "极限挑战教学51",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400173)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400173)
end,
			},
			["HireType"] = 5,
			["Id"] = 400173,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400173,
			["Name"] = "极限挑战17-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战17-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400173)
end,
			},
		},
		[400181] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400173)
end,
			},
			["Demo"] = "极限挑战教学52",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400181)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400181)
end,
			},
			["HireType"] = 5,
			["Id"] = 400181,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400181,
			["Name"] = "极限挑战18-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战18-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400181)
end,
			},
		},
		[400182] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400181)
end,
			},
			["Demo"] = "极限挑战教学53",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400182)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400182)
end,
			},
			["HireType"] = 5,
			["Id"] = 400182,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400182,
			["Name"] = "极限挑战18-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战18-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400182)
end,
			},
		},
		[400183] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400182)
end,
			},
			["Demo"] = "极限挑战教学54",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400183)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400183)
end,
			},
			["HireType"] = 5,
			["Id"] = 400183,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400183,
			["Name"] = "极限挑战18-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战18-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400183)
end,
			},
		},
		[400191] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400183)
end,
			},
			["Demo"] = "极限挑战教学55",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400191)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400191)
end,
			},
			["HireType"] = 5,
			["Id"] = 400191,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400191,
			["Name"] = "极限挑战19-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战19-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400191)
end,
			},
		},
		[400192] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400191)
end,
			},
			["Demo"] = "极限挑战教学56",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400192)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400192)
end,
			},
			["HireType"] = 5,
			["Id"] = 400192,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400192,
			["Name"] = "极限挑战19-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战19-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400192)
end,
			},
		},
		[400193] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400192)
end,
			},
			["Demo"] = "极限挑战教学57",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400193)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400193)
end,
			},
			["HireType"] = 5,
			["Id"] = 400193,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400193,
			["Name"] = "极限挑战19-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战19-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400193)
end,
			},
		},
		[400201] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400193)
end,
			},
			["Demo"] = "极限挑战教学58",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400201)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400201)
end,
			},
			["HireType"] = 5,
			["Id"] = 400201,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400201,
			["Name"] = "极限挑战20-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战20-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400201)
end,
			},
		},
		[400202] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400201)
end,
			},
			["Demo"] = "极限挑战教学59",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400202)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400202)
end,
			},
			["HireType"] = 5,
			["Id"] = 400202,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400202,
			["Name"] = "极限挑战20-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战20-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400202)
end,
			},
		},
		[400203] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400202)
end,
			},
			["Demo"] = "极限挑战教学60",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400203)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400203)
end,
			},
			["HireType"] = 5,
			["Id"] = 400203,
			["ItemDesc"] = {
				["Item"] = {
					200011,
					200012,
				},
			},
			["MapPath"] = "scene_4",
			["MonsterId"] = 400203,
			["Name"] = "极限挑战20-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战20-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400203)
end,
			},
		},
		[400211] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400211)
end,
			},
			["Demo"] = "极限挑战教学61",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400211)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400211)
end,
			},
			["HireType"] = 6,
			["Id"] = 400211,
			["MapPath"] = "scene_5",
			["MonsterId"] = 400211,
			["Name"] = "极限挑战21-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战21-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400211)
end,
			},
		},
		[400212] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400212)
end,
			},
			["Demo"] = "极限挑战教学62",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400212)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400212)
end,
			},
			["HireType"] = 7,
			["Id"] = 400212,
			["MapPath"] = "scene_6",
			["MonsterId"] = 400212,
			["Name"] = "极限挑战21-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战21-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400212)
end,
			},
		},
		[400213] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400213)
end,
			},
			["Demo"] = "极限挑战教学63",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400213)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400213)
end,
			},
			["HireType"] = 8,
			["Id"] = 400213,
			["MapPath"] = "scene_7",
			["MonsterId"] = 400213,
			["Name"] = "极限挑战21-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战21-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400213)
end,
			},
		},
		[400221] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400221)
end,
			},
			["Demo"] = "极限挑战教学64",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400221)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400221)
end,
			},
			["HireType"] = 9,
			["Id"] = 400221,
			["MapPath"] = "scene_8",
			["MonsterId"] = 400221,
			["Name"] = "极限挑战22-1",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战22-1",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400221)
end,
			},
		},
		[400222] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400222)
end,
			},
			["Demo"] = "极限挑战教学65",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400222)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400222)
end,
			},
			["HireType"] = 10,
			["Id"] = 400222,
			["MapPath"] = "scene_9",
			["MonsterId"] = 400222,
			["Name"] = "极限挑战22-2",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战22-2",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400222)
end,
			},
		},
		[400223] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[11](OP,400223)
end,
			},
			["Demo"] = "极限挑战教学66",
			["EndAccount"] = {
				function (API, OP)
	return API[12](OP,400223)
end,
			},
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 400223)
end,
			},
			["HireType"] = 11,
			["Id"] = 400223,
			["MapPath"] = "scene_10",
			["MonsterId"] = 400223,
			["Name"] = "极限挑战22-3",
			["NeedPower"] = 0,
			["ShowName"] = "极限挑战22-3",
			["StageType"] = "2",
			["StartEvents"] = {
				function (API, OP)
	return API[13](OP,400223)
end,
			},
		},
		[500001] = {
			["BaseNeedPower"] = 0,
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101042)
end,
				function (API, OP)
	return API[1](OP, 101043)
end,
			},
			["Id"] = 500001,
			["MapPath"] = "scene_4",
			["MonsterId"] = 107013,
			["Name"] = "公会副本多人战斗1",
			["NeedPower"] = 0,
			["ShowName"] = "公会副本多人战斗1",
			["StageType"] = "1",
			["StartEvents"] = {
			},
		},
		[500002] = {
			["BaseNeedPower"] = 0,
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101042)
end,
				function (API, OP)
	return API[1](OP, 101043)
end,
			},
			["Id"] = 500002,
			["MapPath"] = "scene_4",
			["MonsterId"] = 107023,
			["Name"] = "公会副本多人战斗2",
			["NeedPower"] = 0,
			["ShowName"] = "公会副本多人战斗2",
			["StageType"] = "1",
			["StartEvents"] = {
			},
		},
		[700001] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600001)
end,
			},
			["Id"] = 700001,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 201013,
			["Name"] = "遗迹探索1级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "1级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700002] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600002)
end,
			},
			["Id"] = 700002,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 201023,
			["Name"] = "遗迹探索2级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "2级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700003] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600003)
end,
			},
			["Id"] = 700003,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 201033,
			["Name"] = "遗迹探索3级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "3级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700004] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600004)
end,
			},
			["Id"] = 700004,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 201043,
			["Name"] = "遗迹探索4级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "4级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700005] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600005)
end,
			},
			["Id"] = 700005,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 201053,
			["Name"] = "遗迹探索5级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "5级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700006] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600006)
end,
			},
			["Id"] = 700006,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 201063,
			["Name"] = "遗迹探索6级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "6级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700007] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600007)
end,
			},
			["Id"] = 700007,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 202023,
			["Name"] = "遗迹探索7级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "7级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700008] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600008)
end,
			},
			["Id"] = 700008,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 202023,
			["Name"] = "遗迹探索8级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "8级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700009] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600009)
end,
			},
			["Id"] = 700009,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 202033,
			["Name"] = "遗迹探索9级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "9级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700010] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600010)
end,
			},
			["Id"] = 700010,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 202043,
			["Name"] = "遗迹探索10级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "10级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700011] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600011)
end,
			},
			["Id"] = 700011,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 202053,
			["Name"] = "遗迹探索11级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "11级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700012] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600012)
end,
			},
			["Id"] = 700012,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 202063,
			["Name"] = "遗迹探索12级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "12级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700013] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600013)
end,
			},
			["Id"] = 700013,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 203013,
			["Name"] = "遗迹探索13级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "13级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700014] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600014)
end,
			},
			["Id"] = 700014,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 203023,
			["Name"] = "遗迹探索14级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "14级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700015] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600015)
end,
			},
			["Id"] = 700015,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 203033,
			["Name"] = "遗迹探索15级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "15级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700016] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600016)
end,
			},
			["Id"] = 700016,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 203043,
			["Name"] = "遗迹探索16级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "16级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700017] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600017)
end,
			},
			["Id"] = 700017,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 203053,
			["Name"] = "遗迹探索17级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "17级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700018] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600018)
end,
			},
			["Id"] = 700018,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 203063,
			["Name"] = "遗迹探索18级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "18级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700019] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600019)
end,
			},
			["Id"] = 700019,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 204013,
			["Name"] = "遗迹探索19级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "19级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700020] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600020)
end,
			},
			["Id"] = 700020,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 204023,
			["Name"] = "遗迹探索20级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "20级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700021] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600021)
end,
			},
			["Id"] = 700021,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 204033,
			["Name"] = "遗迹探索21级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "21级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700022] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600022)
end,
			},
			["Id"] = 700022,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 204043,
			["Name"] = "遗迹探索22级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "22级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700023] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600023)
end,
			},
			["Id"] = 700023,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 204053,
			["Name"] = "遗迹探索23级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "23级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700024] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600024)
end,
			},
			["Id"] = 700024,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 204063,
			["Name"] = "遗迹探索24级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "24级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700025] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600025)
end,
			},
			["Id"] = 700025,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 205013,
			["Name"] = "遗迹探索25级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "25级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700026] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600026)
end,
			},
			["Id"] = 700026,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 205023,
			["Name"] = "遗迹探索26级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "26级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700027] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600027)
end,
			},
			["Id"] = 700027,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 205033,
			["Name"] = "遗迹探索27级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "27级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700028] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600028)
end,
			},
			["Id"] = 700028,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 205043,
			["Name"] = "遗迹探索28级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "28级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700029] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600029)
end,
			},
			["Id"] = 700029,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 205053,
			["Name"] = "遗迹探索29级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "29级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700030] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600030)
end,
			},
			["Id"] = 700030,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 205063,
			["Name"] = "遗迹探索30级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "30级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700031] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600031)
end,
			},
			["Id"] = 700031,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 206013,
			["Name"] = "遗迹探索31级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "31级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700032] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600032)
end,
			},
			["Id"] = 700032,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 206023,
			["Name"] = "遗迹探索32级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "32级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700033] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600033)
end,
			},
			["Id"] = 700033,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 206033,
			["Name"] = "遗迹探索33级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "33级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700034] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600034)
end,
			},
			["Id"] = 700034,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 206043,
			["Name"] = "遗迹探索34级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "34级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700035] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600035)
end,
			},
			["Id"] = 700035,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 206053,
			["Name"] = "遗迹探索35级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "35级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700036] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600036)
end,
			},
			["Id"] = 700036,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 206063,
			["Name"] = "遗迹探索36级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "36级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700037] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600037)
end,
			},
			["Id"] = 700037,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 207013,
			["Name"] = "遗迹探索37级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "37级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700038] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600038)
end,
			},
			["Id"] = 700038,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 207023,
			["Name"] = "遗迹探索38级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "38级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700039] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600039)
end,
			},
			["Id"] = 700039,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 207033,
			["Name"] = "遗迹探索39级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "39级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700040] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600040)
end,
			},
			["Id"] = 700040,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 207043,
			["Name"] = "遗迹探索40级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "40级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700041] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600041)
end,
			},
			["Id"] = 700041,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 207053,
			["Name"] = "遗迹探索41级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "41级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700042] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600042)
end,
			},
			["Id"] = 700042,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 207063,
			["Name"] = "遗迹探索42级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "42级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700043] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600043)
end,
			},
			["Id"] = 700043,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 208013,
			["Name"] = "遗迹探索43级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "43级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700044] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600044)
end,
			},
			["Id"] = 700044,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 208023,
			["Name"] = "遗迹探索44级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "44级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700045] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600045)
end,
			},
			["Id"] = 700045,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 208033,
			["Name"] = "遗迹探索45级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "45级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700046] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600046)
end,
			},
			["Id"] = 700046,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 208043,
			["Name"] = "遗迹探索46级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "46级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700047] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600047)
end,
			},
			["Id"] = 700047,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 208053,
			["Name"] = "遗迹探索47级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "47级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700048] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600048)
end,
			},
			["Id"] = 700048,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 208063,
			["Name"] = "遗迹探索48级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "48级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700049] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600049)
end,
			},
			["Id"] = 700049,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 209013,
			["Name"] = "遗迹探索49级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "49级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700050] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600050)
end,
			},
			["Id"] = 700050,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 209023,
			["Name"] = "遗迹探索50级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "50级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700051] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600051)
end,
			},
			["Id"] = 700051,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 209033,
			["Name"] = "遗迹探索51级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "51级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700052] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600052)
end,
			},
			["Id"] = 700052,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 209043,
			["Name"] = "遗迹探索52级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "52级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700053] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600053)
end,
			},
			["Id"] = 700053,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 209053,
			["Name"] = "遗迹探索53级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "53级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700054] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600054)
end,
			},
			["Id"] = 700054,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 209063,
			["Name"] = "遗迹探索54级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "54级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700055] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600055)
end,
			},
			["Id"] = 700055,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 210013,
			["Name"] = "遗迹探索55级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "55级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700056] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600056)
end,
			},
			["Id"] = 700056,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 210023,
			["Name"] = "遗迹探索56级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "56级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700057] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600057)
end,
			},
			["Id"] = 700057,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 210033,
			["Name"] = "遗迹探索57级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "57级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700058] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600058)
end,
			},
			["Id"] = 700058,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 210043,
			["Name"] = "遗迹探索58级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "58级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700059] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600059)
end,
			},
			["Id"] = 700059,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 210053,
			["Name"] = "遗迹探索59级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "59级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700060] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600060)
end,
			},
			["Id"] = 700060,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 210063,
			["Name"] = "遗迹探索60级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "60级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700061] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600061)
end,
			},
			["Id"] = 700061,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 211013,
			["Name"] = "遗迹探索61级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "61级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700062] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600062)
end,
			},
			["Id"] = 700062,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 211023,
			["Name"] = "遗迹探索62级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "62级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700063] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600063)
end,
			},
			["Id"] = 700063,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 211033,
			["Name"] = "遗迹探索63级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "63级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700064] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600064)
end,
			},
			["Id"] = 700064,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 211043,
			["Name"] = "遗迹探索64级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "64级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700065] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600065)
end,
			},
			["Id"] = 700065,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 211053,
			["Name"] = "遗迹探索65级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "65级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700066] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600066)
end,
			},
			["Id"] = 700066,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 211063,
			["Name"] = "遗迹探索66级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "66级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700067] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600067)
end,
			},
			["Id"] = 700067,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 212013,
			["Name"] = "遗迹探索67级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "67级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700068] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600068)
end,
			},
			["Id"] = 700068,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 212023,
			["Name"] = "遗迹探索68级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "68级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700069] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600069)
end,
			},
			["Id"] = 700069,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 212033,
			["Name"] = "遗迹探索69级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "69级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700070] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600070)
end,
			},
			["Id"] = 700070,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 212043,
			["Name"] = "遗迹探索70级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "70级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700071] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600071)
end,
			},
			["Id"] = 700071,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 212053,
			["Name"] = "遗迹探索71级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "71级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700072] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600072)
end,
			},
			["Id"] = 700072,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 212063,
			["Name"] = "遗迹探索72级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "72级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700073] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600073)
end,
			},
			["Id"] = 700073,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 213013,
			["Name"] = "遗迹探索73级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "73级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700074] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600074)
end,
			},
			["Id"] = 700074,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 213023,
			["Name"] = "遗迹探索74级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "74级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700075] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600075)
end,
			},
			["Id"] = 700075,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 213033,
			["Name"] = "遗迹探索75级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "75级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700076] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600076)
end,
			},
			["Id"] = 700076,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 213043,
			["Name"] = "遗迹探索76级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "76级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700077] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600077)
end,
			},
			["Id"] = 700077,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 213053,
			["Name"] = "遗迹探索77级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "77级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700078] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600078)
end,
			},
			["Id"] = 700078,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 213063,
			["Name"] = "遗迹探索78级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "78级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700079] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600079)
end,
			},
			["Id"] = 700079,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 214013,
			["Name"] = "遗迹探索79级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "79级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700080] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600080)
end,
			},
			["Id"] = 700080,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 214023,
			["Name"] = "遗迹探索80级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "80级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700081] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600081)
end,
			},
			["Id"] = 700081,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 214033,
			["Name"] = "遗迹探索81级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "81级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700082] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600082)
end,
			},
			["Id"] = 700082,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 214043,
			["Name"] = "遗迹探索82级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "82级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700083] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600083)
end,
			},
			["Id"] = 700083,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 214053,
			["Name"] = "遗迹探索83级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "83级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700084] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600084)
end,
			},
			["Id"] = 700084,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 214063,
			["Name"] = "遗迹探索84级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "84级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700085] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600085)
end,
			},
			["Id"] = 700085,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 215013,
			["Name"] = "遗迹探索85级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "85级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700086] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600086)
end,
			},
			["Id"] = 700086,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 215023,
			["Name"] = "遗迹探索86级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "86级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700087] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600087)
end,
			},
			["Id"] = 700087,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 215033,
			["Name"] = "遗迹探索87级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "87级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700088] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600088)
end,
			},
			["Id"] = 700088,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 215043,
			["Name"] = "遗迹探索88级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "88级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700089] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600089)
end,
			},
			["Id"] = 700089,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 215053,
			["Name"] = "遗迹探索89级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "89级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700090] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600090)
end,
			},
			["Id"] = 700090,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 215063,
			["Name"] = "遗迹探索90级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "90级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700091] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600091)
end,
			},
			["Id"] = 700091,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 216013,
			["Name"] = "遗迹探索91级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "91级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700092] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600092)
end,
			},
			["Id"] = 700092,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 216023,
			["Name"] = "遗迹探索92级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "92级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700093] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600093)
end,
			},
			["Id"] = 700093,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 216033,
			["Name"] = "遗迹探索93级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "93级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700094] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600094)
end,
			},
			["Id"] = 700094,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 216043,
			["Name"] = "遗迹探索94级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "94级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700095] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600095)
end,
			},
			["Id"] = 700095,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 216053,
			["Name"] = "遗迹探索95级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "95级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700096] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600096)
end,
			},
			["Id"] = 700096,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 216063,
			["Name"] = "遗迹探索96级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "96级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700097] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600097)
end,
			},
			["Id"] = 700097,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 217013,
			["Name"] = "遗迹探索97级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "97级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700098] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600098)
end,
			},
			["Id"] = 700098,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 217023,
			["Name"] = "遗迹探索98级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "98级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
		[700099] = {
			["BaseNeedPower"] = 0,
			["Desc"] = "遗迹怪物，会释放毒气。增加探宝仪消耗。快击败它们",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 600099)
end,
			},
			["Id"] = 700099,
			["ItemDesc"] = {
				["Item"] = {
					5000010,
					5000001,
					5000002,
					5000003,
				},
			},
			["MapPath"] = "scene_11",
			["MonsterId"] = 217033,
			["Name"] = "遗迹探索99级怪物",
			["NeedPower"] = 0,
			["ShowName"] = "99级遗迹怪物",
			["StageType"] = "2",
			["StartEvents"] = {
			},
			["SubType"] = 1,
		},
	},
	["ActStageName2Id"] = {
		["公会副本多人战斗1"] = 500001,
		["公会副本多人战斗2"] = 500002,
		["木属性限定（难度1）"] = 200025,
		["木属性限定（难度2）"] = 200026,
		["木属性限定（难度3）"] = 200027,
		["木属性限定（难度4）"] = 200028,
		["木属性限定（难度5）"] = 200029,
		["木属性限定（难度6）"] = 200030,
		["极限挑战1-1"] = 400011,
		["极限挑战1-2"] = 400012,
		["极限挑战1-3"] = 400013,
		["极限挑战10-1"] = 400101,
		["极限挑战10-2"] = 400102,
		["极限挑战10-3"] = 400103,
		["极限挑战11-1"] = 400111,
		["极限挑战11-2"] = 400112,
		["极限挑战11-3"] = 400113,
		["极限挑战12-1"] = 400121,
		["极限挑战12-2"] = 400122,
		["极限挑战12-3"] = 400123,
		["极限挑战13-1"] = 400131,
		["极限挑战13-2"] = 400132,
		["极限挑战13-3"] = 400133,
		["极限挑战14-1"] = 400141,
		["极限挑战14-2"] = 400142,
		["极限挑战14-3"] = 400143,
		["极限挑战15-1"] = 400151,
		["极限挑战15-2"] = 400152,
		["极限挑战15-3"] = 400153,
		["极限挑战16-1"] = 400161,
		["极限挑战16-2"] = 400162,
		["极限挑战16-3"] = 400163,
		["极限挑战17-1"] = 400171,
		["极限挑战17-2"] = 400172,
		["极限挑战17-3"] = 400173,
		["极限挑战18-1"] = 400181,
		["极限挑战18-2"] = 400182,
		["极限挑战18-3"] = 400183,
		["极限挑战19-1"] = 400191,
		["极限挑战19-2"] = 400192,
		["极限挑战19-3"] = 400193,
		["极限挑战2-1"] = 400021,
		["极限挑战2-2"] = 400022,
		["极限挑战2-3"] = 400023,
		["极限挑战20-1"] = 400201,
		["极限挑战20-2"] = 400202,
		["极限挑战20-3"] = 400203,
		["极限挑战21-1"] = 400211,
		["极限挑战21-2"] = 400212,
		["极限挑战21-3"] = 400213,
		["极限挑战22-1"] = 400221,
		["极限挑战22-2"] = 400222,
		["极限挑战22-3"] = 400223,
		["极限挑战3-1"] = 400031,
		["极限挑战3-2"] = 400032,
		["极限挑战3-3"] = 400033,
		["极限挑战4-1"] = 400041,
		["极限挑战4-2"] = 400042,
		["极限挑战4-3"] = 400043,
		["极限挑战5-1"] = 400051,
		["极限挑战5-2"] = 400052,
		["极限挑战5-3"] = 400053,
		["极限挑战6-1"] = 400061,
		["极限挑战6-2"] = 400062,
		["极限挑战6-3"] = 400063,
		["极限挑战7-1"] = 400071,
		["极限挑战7-2"] = 400072,
		["极限挑战7-3"] = 400073,
		["极限挑战8-1"] = 400081,
		["极限挑战8-2"] = 400082,
		["极限挑战8-3"] = 400083,
		["极限挑战9-1"] = 400091,
		["极限挑战9-2"] = 400092,
		["极限挑战9-3"] = 400093,
		["水属性限定（难度1）"] = 200013,
		["水属性限定（难度2）"] = 200014,
		["水属性限定（难度3）"] = 200015,
		["水属性限定（难度4）"] = 200016,
		["水属性限定（难度5）"] = 200017,
		["水属性限定（难度6）"] = 200018,
		["法术免疫（难度1）"] = 200007,
		["法术免疫（难度2）"] = 200008,
		["法术免疫（难度3）"] = 200009,
		["法术免疫（难度4）"] = 200010,
		["法术免疫（难度5）"] = 200011,
		["法术免疫（难度6）"] = 200012,
		["火属性限定（难度1）"] = 200019,
		["火属性限定（难度2）"] = 200020,
		["火属性限定（难度3）"] = 200021,
		["火属性限定（难度4）"] = 200022,
		["火属性限定（难度5）"] = 200023,
		["火属性限定（难度6）"] = 200024,
		["物理免疫（难度1）"] = 200001,
		["物理免疫（难度2）"] = 200002,
		["物理免疫（难度3）"] = 200003,
		["物理免疫（难度4）"] = 200004,
		["物理免疫（难度5）"] = 200005,
		["物理免疫（难度6）"] = 200006,
		["遗迹探索10级怪物"] = 700010,
		["遗迹探索11级怪物"] = 700011,
		["遗迹探索12级怪物"] = 700012,
		["遗迹探索13级怪物"] = 700013,
		["遗迹探索14级怪物"] = 700014,
		["遗迹探索15级怪物"] = 700015,
		["遗迹探索16级怪物"] = 700016,
		["遗迹探索17级怪物"] = 700017,
		["遗迹探索18级怪物"] = 700018,
		["遗迹探索19级怪物"] = 700019,
		["遗迹探索1级怪物"] = 700001,
		["遗迹探索20级怪物"] = 700020,
		["遗迹探索21级怪物"] = 700021,
		["遗迹探索22级怪物"] = 700022,
		["遗迹探索23级怪物"] = 700023,
		["遗迹探索24级怪物"] = 700024,
		["遗迹探索25级怪物"] = 700025,
		["遗迹探索26级怪物"] = 700026,
		["遗迹探索27级怪物"] = 700027,
		["遗迹探索28级怪物"] = 700028,
		["遗迹探索29级怪物"] = 700029,
		["遗迹探索2级怪物"] = 700002,
		["遗迹探索30级怪物"] = 700030,
		["遗迹探索31级怪物"] = 700031,
		["遗迹探索32级怪物"] = 700032,
		["遗迹探索33级怪物"] = 700033,
		["遗迹探索34级怪物"] = 700034,
		["遗迹探索35级怪物"] = 700035,
		["遗迹探索36级怪物"] = 700036,
		["遗迹探索37级怪物"] = 700037,
		["遗迹探索38级怪物"] = 700038,
		["遗迹探索39级怪物"] = 700039,
		["遗迹探索3级怪物"] = 700003,
		["遗迹探索40级怪物"] = 700040,
		["遗迹探索41级怪物"] = 700041,
		["遗迹探索42级怪物"] = 700042,
		["遗迹探索43级怪物"] = 700043,
		["遗迹探索44级怪物"] = 700044,
		["遗迹探索45级怪物"] = 700045,
		["遗迹探索46级怪物"] = 700046,
		["遗迹探索47级怪物"] = 700047,
		["遗迹探索48级怪物"] = 700048,
		["遗迹探索49级怪物"] = 700049,
		["遗迹探索4级怪物"] = 700004,
		["遗迹探索50级怪物"] = 700050,
		["遗迹探索51级怪物"] = 700051,
		["遗迹探索52级怪物"] = 700052,
		["遗迹探索53级怪物"] = 700053,
		["遗迹探索54级怪物"] = 700054,
		["遗迹探索55级怪物"] = 700055,
		["遗迹探索56级怪物"] = 700056,
		["遗迹探索57级怪物"] = 700057,
		["遗迹探索58级怪物"] = 700058,
		["遗迹探索59级怪物"] = 700059,
		["遗迹探索5级怪物"] = 700005,
		["遗迹探索60级怪物"] = 700060,
		["遗迹探索61级怪物"] = 700061,
		["遗迹探索62级怪物"] = 700062,
		["遗迹探索63级怪物"] = 700063,
		["遗迹探索64级怪物"] = 700064,
		["遗迹探索65级怪物"] = 700065,
		["遗迹探索66级怪物"] = 700066,
		["遗迹探索67级怪物"] = 700067,
		["遗迹探索68级怪物"] = 700068,
		["遗迹探索69级怪物"] = 700069,
		["遗迹探索6级怪物"] = 700006,
		["遗迹探索70级怪物"] = 700070,
		["遗迹探索71级怪物"] = 700071,
		["遗迹探索72级怪物"] = 700072,
		["遗迹探索73级怪物"] = 700073,
		["遗迹探索74级怪物"] = 700074,
		["遗迹探索75级怪物"] = 700075,
		["遗迹探索76级怪物"] = 700076,
		["遗迹探索77级怪物"] = 700077,
		["遗迹探索78级怪物"] = 700078,
		["遗迹探索79级怪物"] = 700079,
		["遗迹探索7级怪物"] = 700007,
		["遗迹探索80级怪物"] = 700080,
		["遗迹探索81级怪物"] = 700081,
		["遗迹探索82级怪物"] = 700082,
		["遗迹探索83级怪物"] = 700083,
		["遗迹探索84级怪物"] = 700084,
		["遗迹探索85级怪物"] = 700085,
		["遗迹探索86级怪物"] = 700086,
		["遗迹探索87级怪物"] = 700087,
		["遗迹探索88级怪物"] = 700088,
		["遗迹探索89级怪物"] = 700089,
		["遗迹探索8级怪物"] = 700008,
		["遗迹探索90级怪物"] = 700090,
		["遗迹探索91级怪物"] = 700091,
		["遗迹探索92级怪物"] = 700092,
		["遗迹探索93级怪物"] = 700093,
		["遗迹探索94级怪物"] = 700094,
		["遗迹探索95级怪物"] = 700095,
		["遗迹探索96级怪物"] = 700096,
		["遗迹探索97级怪物"] = 700097,
		["遗迹探索98级怪物"] = 700098,
		["遗迹探索99级怪物"] = 700099,
		["遗迹探索9级怪物"] = 700009,
	},
	["ChatTbl"] = {
		[10001] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "你是谁",
					["Delay"] = 5000,
					["Model"] = 1001,
				},
				{
					["Action"] = "run",
					["Chat"] = "o，蓝蘑菇，你好，我是红蘑菇",
					["Delay"] = 5000,
					["Model"] = 1002,
				},
				{
					["Action"] = "skill_1",
					["Chat"] = "蘑菇可以走路吗？",
					["Delay"] = 5000,
					["Model"] = 1001,
				},
				{
					["Action"] = "skill_1",
					["Chat"] = "蘑菇可以吃饭吗？",
					["Delay"] = 5000,
					["Model"] = 1002,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1001,
				1002,
			},
		},
		[10101] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "年轻的时候",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "千万不要因为没钱而绝望",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你要知道",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "以后没钱的日子还很多",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是我听过最残忍的一句话了(x___x)",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10102] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如果有人嘲笑你胖",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要怎么反击才能让对方无言以对",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "我只是胖着玩玩",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哪像你丑得那么认真",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10103] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "男生学什么技能会让女生眼前一亮",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "电焊",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别说眼前一亮",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亮瞎都可以",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10104] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "年轻的时候",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "千万不要因为没钱而绝望",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你要知道",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "以后没钱的日子还很多",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是我听过最残忍的一句话了(x___x)",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果有人嘲笑你胖",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要怎么反击才能让对方无言以对",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "我只是胖着玩玩",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哪像你丑得那么认真",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "男生学什么技能会让女生眼前一亮",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "电焊",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别说眼前一亮",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亮瞎都可以",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10105] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果你觉得自己",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一个人过情人节很可怜",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别忘了",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "反正也不是只是情人节",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你其他日子也都是自己一个人过",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哥不是布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人总是好奇",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我长了400年了",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是没有长高",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为我得了恐高症吧",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你问我，长得好看是什么体验？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概就是照镜子的时候",
					["Model"] = 2014,
				},
				{
					["Action"] = "win",
					["Chat"] = "能把自己美哭吧",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2014,
			},
		},
		[10106] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道秦朝统一六国的顺序吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "韩赵魏楚燕齐",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "记不住",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你只需记得:喊赵薇去演戏",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好办法",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				10000,
			},
		},
		[10107] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "为什么古老的山脉比年轻的山脉发生地震要少一些，弱一些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为震够了吧",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				10000,
			},
		},
		[10108] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道秦朝统一六国的顺序吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "韩赵魏楚燕齐",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "记不住",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你只需记得:喊赵薇去演戏",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好办法",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么古老的山脉比年轻的山脉发生地震要少一些，弱一些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为震够了吧",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我考试总是零分？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为没有比零分更低的分数了！",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				10000,
			},
		},
		[10109] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人长得不怎么好看",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像您一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人非常聪明",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像我一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容开心",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "含笑九泉",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3006,
				10000,
			},
		},
		[10110] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人长得不怎么好看",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像您一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人非常聪明",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像我一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容开心",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "含笑九泉",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好记的英文单词是哪个？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "WIFI",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "自拍要拍得好看需要什么技巧？",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "长得好看",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3006,
				10000,
			},
		},
		[10111] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "东风不与周郎便，下句是什么？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "赔了夫人又折兵",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "清水出芙蓉，下一句呢？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "乱世出英雄",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10112] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "问君能有几多愁？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恰似一壶二锅头",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "穷则独善其身",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "富则妻妾成群",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10113] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "东风不与周郎便，下句是什么？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "赔了夫人又折兵",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "清水出芙蓉，下一句呢？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "乱世出英雄",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "问君能有几多愁？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恰似一壶二锅头",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "穷则独善其身",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "富则妻妾成群",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你赢了",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10114] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老师，请问你喜欢怎样的男生？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "投缘的",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "头扁的行不？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				10000,
			},
		},
		[10115] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老师，请问你喜欢怎样的男生？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "投缘的",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "头扁的行不？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我找女朋友呢不一定要漂亮的，喜欢就好",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你喜欢怎样的？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我喜欢漂亮的",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "滚",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你叫我滚哦",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那我柔软的滚了哦",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = " (._.) ( l: )( .-. ) ( :l ) (._.) ( l: )( .-. ) ( :l ) (._.) ( l: )( .-. ) ( :l ) (._.) ",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				10000,
			},
		},
		[10201] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "从今往后，我要做个萌妹子O(∩_∩)O",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啊哈？你说啥？",
					["Model"] = 1004,
				},
				{
					["Action"] = "win",
					["Chat"] = "我要做萌妹子！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没听错吧？再重复一遍",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我要做萌妹子！！！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你敢再说一遍吗",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妈蛋！老娘要做萌妹子",
					["Model"] = 2005,
				},
				{
					["Action"] = "skill_3",
					["Chat"] = "要老娘说多少遍啊！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2005,
				1004,
			},
		},
		[10202] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说你胸那么平",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么就不肯丰胸呢",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不平胸何以平天下",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你见过那个平胸女人平了天下",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "平天下的女人只有一个",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是个波霸",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叫武媚娘",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2005,
				1004,
			},
		},
		[10203] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "从今往后，我要做个萌妹子O(∩_∩)O",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啊哈？你说啥？",
					["Model"] = 1004,
				},
				{
					["Action"] = "win",
					["Chat"] = "我要做萌妹子！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没听错吧？再重复一遍",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我要做萌妹子！！！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你敢再说一遍吗",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妈蛋！老娘要做萌妹子",
					["Model"] = 2005,
				},
				{
					["Action"] = "skill_3",
					["Chat"] = "要老娘说多少遍啊",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说你胸那么平",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么就不肯丰胸呢",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不平胸何以平天下",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你见过那个平胸女人平了天下",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "平天下的女人只有一个",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是个波霸",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叫武媚娘",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2005,
				1004,
			},
		},
		[10204] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每当我遇到极度讨厌的人时",
					["Delay"] = 8000,
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我的脑海里便会浮现出一句",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "“老天又派傻逼来考验你了”",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "然后一想到这",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我也就随之释然了",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2016,
			},
		},
		[10205] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "世界变化太快",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每天都有着无数的东西被重新定义",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我们的三观也一直被毁",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "下限也一直被刷新",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每当我遇到极度讨厌的人时",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我的脑海里便会浮现出一句",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "“老天又派傻逼来考验你了”",
					["Model"] = 2016,
				},
				{
					["Action"] = "win",
					["Chat"] = "然后一想到这",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我也就随之释然了",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2016,
			},
		},
		[10206] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我总是交不到女朋友",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "莫非是我要求太高了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别傻了",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "其实是别人要求高",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10207] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说这是为什么呢？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得丑，你先说",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为丑话说在前面",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10208] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我总是交不到女朋友",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "莫非是我要求太高了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别傻了",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "其实是别人要求高",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说这是为什么呢？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得丑，你先说",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为丑话说在前面",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10209] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帅锅",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "把电话给我呗",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你有毛病吧",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我这手机新买的",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你误会啦",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是说你的手机号码",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "号码也不行啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我号里还有很多话费没用完呢",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "再……见……(+_+)..P",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3011,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3011,
				2009,
			},
		},
		[10210] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "遇到喜欢的人",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要不要表白呢？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一定要表白呀",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你丑真不要紧",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "万一她瞎呢",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帅锅",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "把电话给我呗",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你有毛病吧",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我这手机新买的",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你误会啦",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是说你的手机号码",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "号码也不行啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我号里还有很多话费没用完呢",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "再……见……(+_+)..P",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3011,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3011,
				2009,
			},
		},
		[10211] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "兄弟，我跟你说",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女人说的话不能信",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "比如？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我就逛逛，什么都不买",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我讲讲你和她的事，我不生气",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "都老夫老妻了，不用送礼物啦",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看来人家需要减肥了",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我真的没事，你忙去吧",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你没错，你什么错都没有",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1005,
			},
		},
		[10212] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你这个假期回不回家？",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "按道理是要回家的",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帮我……",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我是个不讲道理的人",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1005,
			},
		},
		[10213] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "兄弟，我跟你说",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女人说的话不能信",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "比如？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我就逛逛，什么都不买",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我讲讲你和她的事，我不生气",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "都老夫老妻了，不用送礼物啦",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看来人家需要减肥了",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我真的没事，你忙去吧",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你没错，你什么错都没有",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你这个假期回不回家？",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "按道理是要回家的",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帮我……",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我是个不讲道理的人",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1005,
			},
		},
		[10214] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我今年又有没赚到钱回家",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真的一无所有",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你并不是一无所有",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "至少，你还有脸回家呀",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[10215] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男神，男闺蜜，蓝颜这三者有什么区别？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有钱有脸叫男神",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有钱没脸叫男闺蜜",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有脸没钱叫蓝颜",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那没钱没脸呢？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "对不起，你是个好人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我今年又有没赚到钱回家",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真的一无所有",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你并不是一无所有",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "至少，你还有脸回家呀",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[10301] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长这么大没有人夸过我",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要不你夸夸我吧？",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好呀，不过你得先夸我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "行，老婆你真是冰雪聪明，人见人爱",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老公，你眼光真好",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1008,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1008,
				3007,
			},
		},
		[10302] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，你最大的愿望是什么",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最大的愿望就是",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你爱我惯我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "工资上交",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我买好多好吃的",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "傻瓜，愿望说出来就不灵啦",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1008,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1008,
				3007,
			},
		},
		[10303] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长这么大没有人夸过我",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要不你夸夸我吧？",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好呀，不过你得先夸我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "行，老婆你真是冰雪聪明，人见人爱",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老公，你眼光真好",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，你最大的愿望是什么",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最大的愿望就是",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你爱我惯我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "工资上交",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我买好多好吃的",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "傻瓜，愿望说出来就不灵啦",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1008,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1008,
				3007,
			},
		},
		[10304] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道为什么廉颇和蔺相如这俩死对头能够和好吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "严肃点，跟你说历史呢",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没说错呀",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱国之情，简称爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				3006,
			},
		},
		[10305] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你有时间简史吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我有病啊，我有时间也不捡屎呀",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道为什么廉颇和蔺相如这俩死对头能够和好吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "严肃点，跟你说历史呢",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没说错呀",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱国之情，简称爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				3006,
			},
		},
		[10306] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妞，给爷唱个歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我在唱什么什么都觉得",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "原来原来你是我的猪大哥",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……换个",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "相爱没有那么容易",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每个人都有他的鼻涕",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3012,
				3006,
			},
		},
		[10307] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妞，给爷唱个歌，这次来点经典老歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能想到最浪漫的事",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就是和你一起卖卖电脑",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……儿歌……来个儿歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爷爷想起妈妈的话",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "闪闪的泪光鲁冰花",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……还有吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大河向东流呀",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "tomato啊potato啊",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3012,
				3006,
			},
		},
		[10308] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妞，给爷唱个歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我在唱什么什么都觉得",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "原来原来你是我的猪大哥",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……换个",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "相爱没有那么容易",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每个人都有他的鼻涕",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……换点经典歌曲",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能想到最浪漫的事",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就是和你一起卖卖电脑",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……儿歌……来个儿歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爷爷想起妈妈的话",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "闪闪的泪光鲁冰花",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……还有吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大河向东流呀",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "tomato啊potato啊",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3012,
				3006,
			},
		},
		[10309] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四百年的游移，因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝的信仰是他给人的迷眼",
					["Model"] = 2008,
				},
				{
					["Action"] = "skill_2",
					["Chat"] = "我，只是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望。",
					["Model"] = 2008,
				},
				{
					["Action"] = "win",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不会在乎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[10310] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四百年的游移，因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝的信仰是他给人的迷眼",
					["Model"] = 2008,
				},
				{
					["Action"] = "skill_2",
					["Chat"] = "我，只是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望。",
					["Model"] = 2008,
				},
				{
					["Action"] = "win",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不会在乎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "感谢你，我的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你的眼泪融进了我的心脏",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝，请原谅我的罪行吧",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我愿付出所有的一切",
					["Model"] = 2008,
				},
				{
					["Action"] = "abn",
					["Chat"] = "只求给我一个世纪",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "与我的伊丽莎白白头到老",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[10311] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么很多女生喜欢说自己是吃货？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果不说自己是吃货",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家会以为她胖是天生的",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				1004,
			},
		},
		[10312] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				1004,
			},
		},
		[10313] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么很多女生喜欢说自己是吃货？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果不说自己是吃货",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家会以为她胖是天生的",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				1004,
			},
		},
		[10314] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "朋友圈有人总有些人炫富",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能适度打他们的脸",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "问他借钱",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1004,
			},
		},
		[10315] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "朋友圈有人总有些人炫富",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能适度打他们的脸",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "问他借钱",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的暗示欠钱不还的朋友还钱",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直接跟他说都不还",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还暗示毛线啊",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1004,
			},
		},
		[10401] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只从他的世界删除了你",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而你为他删除了你的整个世界",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[10402] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "过去这些年来",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "访问得最多的网站",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想大概就是",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404，Not Found 吧",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[10403] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只从他的世界删除了你",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而你为他删除了你的整个世界",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "过去这些年来",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "访问得最多的网站",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想大概就是",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404，Not Found 吧",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[10404] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "专业收费设计死亡slogan",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恩，通常人们也叫墓志铭",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "以下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一居室，求合租，价格面议",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404 Not Found",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "小事儿招魂，大事儿挖坟",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我觉得我还可以抢救一下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没什么事我就先挂了啊",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高级副本，冥王哈迪斯，求组队",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3006,
			},
		},
		[10405] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "专业收费设计死亡slogan",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恩，通常人们也叫墓志铭",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "以下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一居室，求合租，价格面议",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404 Not Found",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "小事儿招魂，大事儿挖坟",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我觉得我还可以抢救一下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没什么事我就先挂了啊",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高级副本，冥王哈迪斯，求组队",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此地有wifi，磕头可见",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "陪聊，提供夜间上门服务",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "记得帮我收快递",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "终于可以做个安静的美男子",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3006,
			},
		},
		[10406] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，请您告诉我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我老是找不到对象？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你的长相配不上你的眼光",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[10407] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，你说，一个人外出吃饭",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么才能装得一点都不寂寞的样子？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "想多了吧",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没人会注意到你的",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[10408] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，请您告诉我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我老是找不到对象？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你的长相配不上你的眼光",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说，一个人外出吃饭",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么才能装得一点都不寂寞的样子？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "想多了吧",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没人会注意到你的",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还有",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你那么丑，怎么老爱自拍呀",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我长这样子，不自拍，谁会拍我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[10409] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法叫醒一个装睡的人",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远看不到女人素颜的一面",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远不可能敲开所有女人的门",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法让女神接你的电话",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么都能，你谁呀，你",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "本人从事基于互联网的电子商务平台的线下跟踪定位服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说人话",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "送快递的……",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				2016,
			},
		},
		[10410] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你是做什么的？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我从事it行业，主要负责通讯设备的周边服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哦哇，好高端的样子，能不能具体点",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就是智能高端数字通讯设备表面高分子化合物线性处理",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这么牛逼，但是我还是不懂，能不能通俗一点",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手机贴膜",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你呢？",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "利用计算机二级技术和文字艺术为客户提供口碑保障服务",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说得简单点？",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "淘宝刷好评",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法叫醒一个装睡的人",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远看不到女人素颜的一面",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远不可能敲开所有女人的门",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法让女神接你的电话",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么都能，你谁呀，你",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "本人从事基于互联网的电子商务平台的线下跟踪定位服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说人话",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "送快递的……",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				2016,
			},
		},
		[10411] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我还有一个问题……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不约",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不造",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱过",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不后悔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "明天有事",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没多少钱了",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这题不会",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "蓝翔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "保大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不会游泳",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道安利",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道鸽子为什么那么大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此刻我对你的伤害造成你心里阴影部分的面积约9平方厘米",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请问还有什么要问的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10412] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女生受欢迎的特性都有哪些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "可爱，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "声音好听，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有爱心，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "身材好，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有酒窝，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手指纤长，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "独立，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就没其他的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10413] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我有个问题",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女生受欢迎的特性都有哪些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "可爱，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "声音好听，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有爱心，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "身材好，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有酒窝，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手指纤长，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "独立，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就没其他的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "男生受欢迎的特性呢？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "体贴，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帅，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我还有一个问题……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不约",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不造",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱过",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不后悔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "明天有事",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没多少钱了",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这题不会",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "蓝翔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "保大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不会游泳",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道安利",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道鸽子为什么那么大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此刻我对你的伤害造成你心里阴影部分的面积约9平方厘米",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请问还有什么要问的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10414] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "~~~~(>_<)~~~~ ",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，怎么了？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么事你说呀",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我以为你会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不说我怎么会懂",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不懂的人，说了也不会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "能懂的人，不说也会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你要说出来我才知道我懂不懂啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有些东西不需要说",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你不要说了",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不在乎我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我……",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				3007,
			},
		},
		[10415] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么男生都喜欢长头发的女生？",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "头发长短不重要。",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是看脸。",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "醒醒吧，",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不要觉得自己留长了头发，",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就不用减肥了。",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "~~~~(>_<)~~~~ ",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，怎么了？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么事你说呀",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我以为你会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不说我怎么会懂",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不懂的人，说了也不会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "能懂的人，不说也会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你要说出来我才知道我懂不懂啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有些东西不需要说",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你不要说了",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不在乎我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我……",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				3007,
			},
		},
		[10501] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "真的好男人",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并不是不玩游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不打LOL",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不玩魔兽的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而是他在玩游戏的时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "只要对方一个电话",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "或是一条消息",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他就会为她直接退出游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这种男人叫做……",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "猪一样的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[10502] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "玩游戏时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "队友总骂我傻逼",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "该怎么办？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给他说:",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你好，傻逼的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[10503] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "玩游戏时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "队友总骂我傻逼",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "该怎么办？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给他说:",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你好，傻逼的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真的好男人",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并不是不玩游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不打LOL",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不玩魔兽的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而是他在玩游戏的时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "只要对方一个电话",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "或是一条消息",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他就会为她直接退出游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这种男人叫做……",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "猪一样的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[10504] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说我长得怎么样？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得跟身份证一模一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一看你就是块读书的料",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请讲人话",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家都说红颜薄命",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我觉得你一定长命百岁",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啥意思？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10505] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说我长得怎么样？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得跟身份证一模一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一看你就是块读书的料",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请讲人话",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家都说红颜薄命",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我觉得你一定长命百岁",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啥意思？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你们老说我长得丑",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑怎么了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是病得治",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这也算病？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "当然算，不然整容医院为什么会叫医院呢",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10506] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的回复别人问:你为什么单身",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为太爱自己",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舍得也不放心把自己交给别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[10507] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何高冷回答:你为什么没有恋爱过？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "懒",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[10508] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的回复别人问:你为什么单身",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为太爱自己",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舍得也不放心把自己交给别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如何高冷回答:你为什么没有恋爱过？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "懒",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "寂寞和孤独有什么区别?",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "寂寞是别人不想搭理你",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "孤独是你不想搭理别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[10509] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "只要能让我能瘦下来",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我什么都愿意做啊",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那么，你愿意少吃一点吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10510] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "只要能让我能瘦下来",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我什么都愿意做啊",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那么，你愿意少吃一点吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不是说要减肥吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还不停的吃吃吃！",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不过是说出来吓唬吓唬一身肉罢了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10511] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[10512] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "四百多年的游移",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不懂怜悯",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最挚爱的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[10513] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四百多年的游移",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不懂怜悯",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最挚爱的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直到我见到公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她告诉我:",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱是用感性的方式，活着",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "生活是用理性的方式，爱着",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我这一辈子",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "忙着生，忙着爱，忙着恨",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "却忘记了生活原来是用来享受的",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[10514] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "有些人明明靠长相和家世就可以一生无忧",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "但是他偏偏要靠努力",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真不知道一些长得丑的人",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还好意思赖床晚起",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3017,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3017,
			},
		},
		[10515] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "有些人明明靠长相和家世就可以一生无忧",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "但是他偏偏要靠努力",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真不知道一些长得丑的人",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还好意思赖床晚起",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "所以，",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "脑残就要少动口",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人丑就要多读书",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是个看脸的世界",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "其实这是普遍现象",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看国外，facebook，face也在book前面",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3017,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3017,
			},
		},
		[10601] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "挨饿这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫减肥",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "掐人这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫按摩",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[10602] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "发呆这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫深沉",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "偷懒这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫享受",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[10603] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "挨饿这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫减肥",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "掐人这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫按摩",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "发呆这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫深沉",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "偷懒这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫享受",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "死皮赖脸这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫执著",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "装傻这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果干的好，那叫大智若愚",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[10604] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "求朋友们推荐一款400万到800万的跑车",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好是两座的",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "必须要求外观时尚",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "性能强",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舒适度高",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "起步快",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "马力大",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "颜色的话不是很重要",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好看就行",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我用来做手机壁纸",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1011,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				1011,
			},
		},
		[10605] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "求朋友们推荐一款400万到800万的跑车",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好是两座的",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "必须要求外观时尚",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "性能强",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舒适度高",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "起步快",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "马力大",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "颜色的话不是很重要",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好看就行",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我用来做手机壁纸",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "和喜欢的人聊天",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "和讨厌的人撕逼",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "以及考试",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并称人生三大，事后总感觉没发挥好的事",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1011,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				1011,
			},
		},
		[10606] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫暖男，而你叫炙热哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高冷男，而你叫冰霜哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫忧郁男，而你叫阴暗哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫潇洒男，而你叫暴风哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫阳光男，而你叫烈日哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[10607] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫多情男，而你叫淫邪哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高富帅，而你叫黄金哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫颓男，而你叫虚弱哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫运动男神，而你叫活跃哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[10608] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫暖男，而你叫炙热哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高冷男，而你叫冰霜哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫忧郁男，而你叫阴暗哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫潇洒男，而你叫暴风哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫阳光男，而你叫烈日哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫多情男，而你叫淫邪哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高富帅，而你叫黄金哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫颓男，而你叫虚弱哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫运动男神，而你叫活跃哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫霸道总裁，而你叫哥布林首领",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "泥垢了！我是地精不是哥布林！",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哦，地精哥布林！",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[10609] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "我想买辆坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那就买呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "买不起啊，那么贵",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "拿信用卡刷呀",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "刷信用卡要还的",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还不起咋办",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怕什么，你有坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3010,
				1012,
			},
		},
		[10610] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "唐老鸭为什么姓唐？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为他喜欢吃糖",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "米老鼠为什么姓米？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "喜欢吃米呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那史莱克呢？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想买辆坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那就买呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "买不起啊，那么贵",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "拿信用卡刷呀",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "刷信用卡要还的",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还不起咋办",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怕什么，你有坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3010,
				1012,
			},
		},
		[10611] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "在书店如何跟女生搭讪？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你就说:美女，你喜欢书吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她说喜欢你就说",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叔也喜欢你",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[10612] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能让女孩子追我呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "去女孩子的店里买东西",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不给钱就跑",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[10613] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "在书店如何跟女生搭讪？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你就说:美女，你喜欢书吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她说喜欢你就说",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叔也喜欢你",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能让女孩子追我呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "去女孩子的店里买东西",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不给钱就跑",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看到一个漂亮MM",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道怎么上去搭讪",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直接上去亲她一口",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "万一她正好也对你有意思",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这事不就成了？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那万一她把我推开呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "管她呢，反正你已经亲过了",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这叫#论流氓的修养#",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[10614] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "英雄联盟什么英雄最厉害？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么英雄最垃圾？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人用的英雄最厉害",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你队友用的最垃圾",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				1010,
			},
		},
		[10615] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "英雄联盟什么英雄最厉害？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么英雄最垃圾？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人用的英雄最厉害",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你队友用的最垃圾",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你妈叫我帮你找对象",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有没有什么要求啊？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "满级满符文的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啊？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好不吭不送的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				1010,
			},
		},
		[10701] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "年轻的时候",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "千万不要因为没钱而绝望",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你要知道",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "以后没钱的日子还很多",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是我听过最残忍的一句话了(x___x)",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10702] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如果有人嘲笑你胖",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要怎么反击才能让对方无言以对",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "我只是胖着玩玩",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哪像你丑得那么认真",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10703] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "男生学什么技能会让女生眼前一亮",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "电焊",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别说眼前一亮",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亮瞎都可以",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10704] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "年轻的时候",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "千万不要因为没钱而绝望",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你要知道",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "以后没钱的日子还很多",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是我听过最残忍的一句话了(x___x)",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果有人嘲笑你胖",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要怎么反击才能让对方无言以对",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "我只是胖着玩玩",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哪像你丑得那么认真",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "男生学什么技能会让女生眼前一亮",
					["Model"] = 1005,
				},
				{
					["Action"] = "win",
					["Chat"] = "电焊",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别说眼前一亮",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亮瞎都可以",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				10000,
			},
		},
		[10705] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果你觉得自己",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一个人过情人节很可怜",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别忘了",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "反正也不是只是情人节",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你其他日子也都是自己一个人过",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哥不是布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人总是好奇",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我长了400年了",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是没有长高",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为我得了恐高症吧",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你问我，长得好看是什么体验？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概就是照镜子的时候",
					["Model"] = 2014,
				},
				{
					["Action"] = "win",
					["Chat"] = "能把自己美哭吧",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2014,
			},
		},
		[10706] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道秦朝统一六国的顺序吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "韩赵魏楚燕齐",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "记不住",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你只需记得:喊赵薇去演戏",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好办法",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				10000,
			},
		},
		[10707] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "为什么古老的山脉比年轻的山脉发生地震要少一些，弱一些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为震够了吧",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				10000,
			},
		},
		[10708] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道秦朝统一六国的顺序吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "韩赵魏楚燕齐",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "记不住",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你只需记得:喊赵薇去演戏",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好办法",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么古老的山脉比年轻的山脉发生地震要少一些，弱一些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为震够了吧",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我考试总是零分？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为没有比零分更低的分数了！",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				10000,
			},
		},
		[10709] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人长得不怎么好看",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像您一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人非常聪明",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像我一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容开心",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "含笑九泉",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3006,
				10000,
			},
		},
		[10710] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人长得不怎么好看",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像您一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容一个人非常聪明",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "像我一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请用一个词形容开心",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "含笑九泉",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好记的英文单词是哪个？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "WIFI",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "自拍要拍得好看需要什么技巧？",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "长得好看",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3006,
				10000,
			},
		},
		[10711] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "东风不与周郎便，下句是什么？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "赔了夫人又折兵",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "清水出芙蓉，下一句呢？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "乱世出英雄",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10712] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "问君能有几多愁？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恰似一壶二锅头",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "穷则独善其身",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "富则妻妾成群",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10713] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "东风不与周郎便，下句是什么？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "赔了夫人又折兵",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "清水出芙蓉，下一句呢？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "乱世出英雄",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "问君能有几多愁？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恰似一壶二锅头",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "穷则独善其身",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "富则妻妾成群",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你赢了",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[10714] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老师，请问你喜欢怎样的男生？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "投缘的",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "头扁的行不？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				10000,
			},
		},
		[10715] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老师，请问你喜欢怎样的男生？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "投缘的",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "头扁的行不？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我找女朋友呢不一定要漂亮的，喜欢就好",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你喜欢怎样的？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我喜欢漂亮的",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "滚",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你叫我滚哦",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那我柔软的滚了哦",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = " (._.) ( l: )( .-. ) ( :l ) (._.) ( l: )( .-. ) ( :l ) (._.) ( l: )( .-. ) ( :l ) (._.) ",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				10000,
			},
		},
		[10801] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "从今往后，我要做个萌妹子O(∩_∩)O",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啊哈？你说啥？",
					["Model"] = 1004,
				},
				{
					["Action"] = "win",
					["Chat"] = "我要做萌妹子！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没听错吧？再重复一遍",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我要做萌妹子！！！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你敢再说一遍吗",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妈蛋！老娘要做萌妹子",
					["Model"] = 2005,
				},
				{
					["Action"] = "skill_3",
					["Chat"] = "要老娘说多少遍啊！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2005,
				1004,
			},
		},
		[10802] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说你胸那么平",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么就不肯丰胸呢",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不平胸何以平天下",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你见过那个平胸女人平了天下",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "平天下的女人只有一个",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是个波霸",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叫武媚娘",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2005,
				1004,
			},
		},
		[10803] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "从今往后，我要做个萌妹子O(∩_∩)O",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啊哈？你说啥？",
					["Model"] = 1004,
				},
				{
					["Action"] = "win",
					["Chat"] = "我要做萌妹子！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没听错吧？再重复一遍",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我要做萌妹子！！！",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你敢再说一遍吗",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妈蛋！老娘要做萌妹子",
					["Model"] = 2005,
				},
				{
					["Action"] = "skill_3",
					["Chat"] = "要老娘说多少遍啊",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说你胸那么平",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么就不肯丰胸呢",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不平胸何以平天下",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你见过那个平胸女人平了天下",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "平天下的女人只有一个",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是个波霸",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叫武媚娘",
					["Model"] = 2005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2005,
				1004,
			},
		},
		[10804] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每当我遇到极度讨厌的人时",
					["Delay"] = 8000,
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我的脑海里便会浮现出一句",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "“老天又派傻逼来考验你了”",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "然后一想到这",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我也就随之释然了",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2016,
			},
		},
		[10805] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "世界变化太快",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每天都有着无数的东西被重新定义",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我们的三观也一直被毁",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "下限也一直被刷新",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每当我遇到极度讨厌的人时",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我的脑海里便会浮现出一句",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "“老天又派傻逼来考验你了”",
					["Model"] = 2016,
				},
				{
					["Action"] = "win",
					["Chat"] = "然后一想到这",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我也就随之释然了",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2016,
			},
		},
		[10806] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我总是交不到女朋友",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "莫非是我要求太高了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别傻了",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "其实是别人要求高",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10807] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说这是为什么呢？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得丑，你先说",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为丑话说在前面",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10808] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我总是交不到女朋友",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "莫非是我要求太高了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别傻了",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "其实是别人要求高",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说这是为什么呢？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得丑，你先说",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为丑话说在前面",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[10809] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帅锅",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "把电话给我呗",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你有毛病吧",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我这手机新买的",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你误会啦",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是说你的手机号码",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "号码也不行啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我号里还有很多话费没用完呢",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "再……见……(+_+)..P",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3011,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3011,
				2009,
			},
		},
		[10810] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "遇到喜欢的人",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要不要表白呢？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一定要表白呀",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你丑真不要紧",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "万一她瞎呢",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帅锅",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "把电话给我呗",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你有毛病吧",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我这手机新买的",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你误会啦",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是说你的手机号码",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "号码也不行啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我号里还有很多话费没用完呢",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "再……见……(+_+)..P",
					["Model"] = 3011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3011,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3011,
				2009,
			},
		},
		[10811] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "兄弟，我跟你说",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女人说的话不能信",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "比如？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我就逛逛，什么都不买",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我讲讲你和她的事，我不生气",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "都老夫老妻了，不用送礼物啦",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看来人家需要减肥了",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我真的没事，你忙去吧",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你没错，你什么错都没有",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1005,
			},
		},
		[10812] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你这个假期回不回家？",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "按道理是要回家的",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帮我……",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我是个不讲道理的人",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1005,
			},
		},
		[10813] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "兄弟，我跟你说",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女人说的话不能信",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "比如？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我就逛逛，什么都不买",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我讲讲你和她的事，我不生气",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "都老夫老妻了，不用送礼物啦",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看来人家需要减肥了",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我真的没事，你忙去吧",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你没错，你什么错都没有",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你这个假期回不回家？",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "按道理是要回家的",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帮我……",
					["Model"] = 1006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我是个不讲道理的人",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1005,
			},
		},
		[10814] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我今年又有没赚到钱回家",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真的一无所有",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你并不是一无所有",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "至少，你还有脸回家呀",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[10815] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男神，男闺蜜，蓝颜这三者有什么区别？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有钱有脸叫男神",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有钱没脸叫男闺蜜",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有脸没钱叫蓝颜",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那没钱没脸呢？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "对不起，你是个好人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我今年又有没赚到钱回家",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真的一无所有",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你并不是一无所有",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "至少，你还有脸回家呀",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[10901] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长这么大没有人夸过我",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要不你夸夸我吧？",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好呀，不过你得先夸我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "行，老婆你真是冰雪聪明，人见人爱",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老公，你眼光真好",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1008,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1008,
				3007,
			},
		},
		[10902] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，你最大的愿望是什么",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最大的愿望就是",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你爱我惯我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "工资上交",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我买好多好吃的",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "傻瓜，愿望说出来就不灵啦",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1008,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1008,
				3007,
			},
		},
		[10903] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长这么大没有人夸过我",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "要不你夸夸我吧？",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好呀，不过你得先夸我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "行，老婆你真是冰雪聪明，人见人爱",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "老公，你眼光真好",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，你最大的愿望是什么",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最大的愿望就是",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你爱我惯我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "工资上交",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给我买好多好吃的",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "傻瓜，愿望说出来就不灵啦",
					["Model"] = 1008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1008,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1008,
				3007,
			},
		},
		[10904] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道为什么廉颇和蔺相如这俩死对头能够和好吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "严肃点，跟你说历史呢",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没说错呀",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱国之情，简称爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				3006,
			},
		},
		[10905] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你有时间简史吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我有病啊，我有时间也不捡屎呀",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你知道为什么廉颇和蔺相如这俩死对头能够和好吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "严肃点，跟你说历史呢",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我没说错呀",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱国之情，简称爱情",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				3006,
			},
		},
		[10906] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妞，给爷唱个歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我在唱什么什么都觉得",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "原来原来你是我的猪大哥",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……换个",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "相爱没有那么容易",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每个人都有他的鼻涕",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3012,
				3006,
			},
		},
		[10907] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妞，给爷唱个歌，这次来点经典老歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能想到最浪漫的事",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就是和你一起卖卖电脑",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……儿歌……来个儿歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爷爷想起妈妈的话",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "闪闪的泪光鲁冰花",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……还有吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大河向东流呀",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "tomato啊potato啊",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3012,
				3006,
			},
		},
		[10908] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "妞，给爷唱个歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我在唱什么什么都觉得",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "原来原来你是我的猪大哥",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……换个",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "相爱没有那么容易",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "每个人都有他的鼻涕",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……换点经典歌曲",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能想到最浪漫的事",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就是和你一起卖卖电脑",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……儿歌……来个儿歌",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爷爷想起妈妈的话",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "闪闪的泪光鲁冰花",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……还有吗？",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大河向东流呀",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "tomato啊potato啊",
					["Model"] = 3012,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3012,
				3006,
			},
		},
		[10909] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四百年的游移，因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝的信仰是他给人的迷眼",
					["Model"] = 2008,
				},
				{
					["Action"] = "skill_2",
					["Chat"] = "我，只是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望。",
					["Model"] = 2008,
				},
				{
					["Action"] = "win",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不会在乎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[10910] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四百年的游移，因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝的信仰是他给人的迷眼",
					["Model"] = 2008,
				},
				{
					["Action"] = "skill_2",
					["Chat"] = "我，只是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望。",
					["Model"] = 2008,
				},
				{
					["Action"] = "win",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎。",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不会在乎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "感谢你，我的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你的眼泪融进了我的心脏",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "上帝，请原谅我的罪行吧",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我愿付出所有的一切",
					["Model"] = 2008,
				},
				{
					["Action"] = "abn",
					["Chat"] = "只求给我一个世纪",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "与我的伊丽莎白白头到老",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[10911] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么很多女生喜欢说自己是吃货？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果不说自己是吃货",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家会以为她胖是天生的",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				1004,
			},
		},
		[10912] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				1004,
			},
		},
		[10913] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么很多女生喜欢说自己是吃货？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果不说自己是吃货",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家会以为她胖是天生的",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2007,
				1004,
			},
		},
		[10914] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "朋友圈有人总有些人炫富",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能适度打他们的脸",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "问他借钱",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1004,
			},
		},
		[10915] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "朋友圈有人总有些人炫富",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能适度打他们的脸",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "问他借钱",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的暗示欠钱不还的朋友还钱",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直接跟他说都不还",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还暗示毛线啊",
					["Model"] = 2007,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2007,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1006,
				1004,
			},
		},
		[11001] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只从他的世界删除了你",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而你为他删除了你的整个世界",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11002] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "过去这些年来",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "访问得最多的网站",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想大概就是",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404，Not Found 吧",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11003] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只从他的世界删除了你",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而你为他删除了你的整个世界",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "过去这些年来",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "访问得最多的网站",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想大概就是",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404，Not Found 吧",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11004] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "专业收费设计死亡slogan",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恩，通常人们也叫墓志铭",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "以下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一居室，求合租，价格面议",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404 Not Found",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "小事儿招魂，大事儿挖坟",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我觉得我还可以抢救一下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没什么事我就先挂了啊",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高级副本，冥王哈迪斯，求组队",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3006,
			},
		},
		[11005] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "专业收费设计死亡slogan",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恩，通常人们也叫墓志铭",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "以下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一居室，求合租，价格面议",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404 Not Found",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "小事儿招魂，大事儿挖坟",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我觉得我还可以抢救一下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没什么事我就先挂了啊",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高级副本，冥王哈迪斯，求组队",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此地有wifi，磕头可见",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "陪聊，提供夜间上门服务",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "记得帮我收快递",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "终于可以做个安静的美男子",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3006,
			},
		},
		[11006] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，请您告诉我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我老是找不到对象？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你的长相配不上你的眼光",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[11007] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，你说，一个人外出吃饭",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么才能装得一点都不寂寞的样子？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "想多了吧",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没人会注意到你的",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[11008] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，请您告诉我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我老是找不到对象？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你的长相配不上你的眼光",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说，一个人外出吃饭",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么才能装得一点都不寂寞的样子？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "想多了吧",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没人会注意到你的",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还有",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你那么丑，怎么老爱自拍呀",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我长这样子，不自拍，谁会拍我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[11009] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法叫醒一个装睡的人",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远看不到女人素颜的一面",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远不可能敲开所有女人的门",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法让女神接你的电话",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么都能，你谁呀，你",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "本人从事基于互联网的电子商务平台的线下跟踪定位服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说人话",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "送快递的……",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				2016,
			},
		},
		[11010] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你是做什么的？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我从事it行业，主要负责通讯设备的周边服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哦哇，好高端的样子，能不能具体点",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就是智能高端数字通讯设备表面高分子化合物线性处理",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这么牛逼，但是我还是不懂，能不能通俗一点",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手机贴膜",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你呢？",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "利用计算机二级技术和文字艺术为客户提供口碑保障服务",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说得简单点？",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "淘宝刷好评",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法叫醒一个装睡的人",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远看不到女人素颜的一面",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远不可能敲开所有女人的门",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法让女神接你的电话",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么都能，你谁呀，你",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "本人从事基于互联网的电子商务平台的线下跟踪定位服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说人话",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "送快递的……",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				2016,
			},
		},
		[11011] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我还有一个问题……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不约",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不造",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱过",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不后悔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "明天有事",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没多少钱了",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这题不会",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "蓝翔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "保大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不会游泳",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道安利",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道鸽子为什么那么大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此刻我对你的伤害造成你心里阴影部分的面积约9平方厘米",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请问还有什么要问的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[11012] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女生受欢迎的特性都有哪些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "可爱，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "声音好听，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有爱心，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "身材好，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有酒窝，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手指纤长，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "独立，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就没其他的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[11013] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我有个问题",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女生受欢迎的特性都有哪些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "可爱，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "声音好听，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有爱心，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "身材好，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有酒窝，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手指纤长，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "独立，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就没其他的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "男生受欢迎的特性呢？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "体贴，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帅，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我还有一个问题……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不约",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不造",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱过",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不后悔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "明天有事",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没多少钱了",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这题不会",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "蓝翔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "保大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不会游泳",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道安利",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道鸽子为什么那么大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此刻我对你的伤害造成你心里阴影部分的面积约9平方厘米",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请问还有什么要问的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[11014] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "~~~~(>_<)~~~~ ",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，怎么了？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么事你说呀",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我以为你会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不说我怎么会懂",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不懂的人，说了也不会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "能懂的人，不说也会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你要说出来我才知道我懂不懂啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有些东西不需要说",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你不要说了",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不在乎我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我……",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				3007,
			},
		},
		[11015] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么男生都喜欢长头发的女生？",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "头发长短不重要。",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是看脸。",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "醒醒吧，",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不要觉得自己留长了头发，",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就不用减肥了。",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "~~~~(>_<)~~~~ ",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，怎么了？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么事你说呀",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我以为你会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不说我怎么会懂",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不懂的人，说了也不会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "能懂的人，不说也会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你要说出来我才知道我懂不懂啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有些东西不需要说",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你不要说了",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不在乎我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我……",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				3007,
			},
		},
		[11101] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "真的好男人",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并不是不玩游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不打LOL",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不玩魔兽的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而是他在玩游戏的时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "只要对方一个电话",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "或是一条消息",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他就会为她直接退出游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这种男人叫做……",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "猪一样的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[11102] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "玩游戏时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "队友总骂我傻逼",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "该怎么办？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给他说:",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你好，傻逼的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[11103] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "玩游戏时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "队友总骂我傻逼",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "该怎么办？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给他说:",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你好，傻逼的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真的好男人",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并不是不玩游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不打LOL",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不玩魔兽的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而是他在玩游戏的时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "只要对方一个电话",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "或是一条消息",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他就会为她直接退出游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这种男人叫做……",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "猪一样的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[11104] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说我长得怎么样？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得跟身份证一模一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一看你就是块读书的料",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请讲人话",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家都说红颜薄命",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我觉得你一定长命百岁",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啥意思？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11105] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说我长得怎么样？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得跟身份证一模一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一看你就是块读书的料",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请讲人话",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家都说红颜薄命",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我觉得你一定长命百岁",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啥意思？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你们老说我长得丑",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑怎么了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是病得治",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这也算病？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "当然算，不然整容医院为什么会叫医院呢",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11106] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的回复别人问:你为什么单身",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为太爱自己",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舍得也不放心把自己交给别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[11107] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何高冷回答:你为什么没有恋爱过？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "懒",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[11108] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的回复别人问:你为什么单身",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为太爱自己",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舍得也不放心把自己交给别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如何高冷回答:你为什么没有恋爱过？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "懒",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "寂寞和孤独有什么区别?",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "寂寞是别人不想搭理你",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "孤独是你不想搭理别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[11109] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "只要能让我能瘦下来",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我什么都愿意做啊",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那么，你愿意少吃一点吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11110] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "只要能让我能瘦下来",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我什么都愿意做啊",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那么，你愿意少吃一点吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不是说要减肥吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还不停的吃吃吃！",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不过是说出来吓唬吓唬一身肉罢了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11111] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[11112] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "四百多年的游移",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不懂怜悯",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最挚爱的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[11113] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四百多年的游移",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不懂怜悯",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最挚爱的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直到我见到公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她告诉我:",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱是用感性的方式，活着",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "生活是用理性的方式，爱着",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我这一辈子",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "忙着生，忙着爱，忙着恨",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "却忘记了生活原来是用来享受的",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[11114] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "有些人明明靠长相和家世就可以一生无忧",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "但是他偏偏要靠努力",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真不知道一些长得丑的人",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还好意思赖床晚起",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3017,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3017,
			},
		},
		[11115] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "有些人明明靠长相和家世就可以一生无忧",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "但是他偏偏要靠努力",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真不知道一些长得丑的人",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还好意思赖床晚起",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "所以，",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "脑残就要少动口",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人丑就要多读书",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是个看脸的世界",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "其实这是普遍现象",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看国外，facebook，face也在book前面",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3017,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3017,
			},
		},
		[11201] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "挨饿这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫减肥",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "掐人这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫按摩",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11202] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "发呆这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫深沉",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "偷懒这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫享受",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11203] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "挨饿这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫减肥",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "掐人这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫按摩",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "发呆这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫深沉",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "偷懒这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫享受",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "死皮赖脸这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫执著",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "装傻这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果干的好，那叫大智若愚",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11204] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "求朋友们推荐一款400万到800万的跑车",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好是两座的",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "必须要求外观时尚",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "性能强",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舒适度高",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "起步快",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "马力大",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "颜色的话不是很重要",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好看就行",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我用来做手机壁纸",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1011,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				1011,
			},
		},
		[11205] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "求朋友们推荐一款400万到800万的跑车",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好是两座的",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "必须要求外观时尚",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "性能强",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舒适度高",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "起步快",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "马力大",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "颜色的话不是很重要",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好看就行",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我用来做手机壁纸",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "和喜欢的人聊天",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "和讨厌的人撕逼",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "以及考试",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并称人生三大，事后总感觉没发挥好的事",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1011,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				1011,
			},
		},
		[11206] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫暖男，而你叫炙热哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高冷男，而你叫冰霜哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫忧郁男，而你叫阴暗哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫潇洒男，而你叫暴风哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫阳光男，而你叫烈日哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[11207] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫多情男，而你叫淫邪哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高富帅，而你叫黄金哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫颓男，而你叫虚弱哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫运动男神，而你叫活跃哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[11208] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫暖男，而你叫炙热哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高冷男，而你叫冰霜哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫忧郁男，而你叫阴暗哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫潇洒男，而你叫暴风哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫阳光男，而你叫烈日哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫多情男，而你叫淫邪哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高富帅，而你叫黄金哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫颓男，而你叫虚弱哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫运动男神，而你叫活跃哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫霸道总裁，而你叫哥布林首领",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "泥垢了！我是地精不是哥布林！",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哦，地精哥布林！",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[11209] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "我想买辆坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那就买呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "买不起啊，那么贵",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "拿信用卡刷呀",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "刷信用卡要还的",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还不起咋办",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怕什么，你有坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3010,
				1012,
			},
		},
		[11210] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "唐老鸭为什么姓唐？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为他喜欢吃糖",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "米老鼠为什么姓米？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "喜欢吃米呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那史莱克呢？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想买辆坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那就买呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "买不起啊，那么贵",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "拿信用卡刷呀",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "刷信用卡要还的",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还不起咋办",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怕什么，你有坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3010,
				1012,
			},
		},
		[11211] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "在书店如何跟女生搭讪？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你就说:美女，你喜欢书吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她说喜欢你就说",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叔也喜欢你",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[11212] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能让女孩子追我呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "去女孩子的店里买东西",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不给钱就跑",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[11213] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "在书店如何跟女生搭讪？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你就说:美女，你喜欢书吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她说喜欢你就说",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叔也喜欢你",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能让女孩子追我呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "去女孩子的店里买东西",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不给钱就跑",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看到一个漂亮MM",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道怎么上去搭讪",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直接上去亲她一口",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "万一她正好也对你有意思",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这事不就成了？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那万一她把我推开呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "管她呢，反正你已经亲过了",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这叫#论流氓的修养#",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[11214] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "英雄联盟什么英雄最厉害？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么英雄最垃圾？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人用的英雄最厉害",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你队友用的最垃圾",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				1010,
			},
		},
		[11215] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "英雄联盟什么英雄最厉害？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么英雄最垃圾？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人用的英雄最厉害",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你队友用的最垃圾",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你妈叫我帮你找对象",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有没有什么要求啊？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "满级满符文的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啊？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好不吭不送的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				1010,
			},
		},
		[11301] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只从他的世界删除了你",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而你为他删除了你的整个世界",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11302] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "过去这些年来",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "访问得最多的网站",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想大概就是",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404，Not Found 吧",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11303] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只从他的世界删除了你",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而你为他删除了你的整个世界",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "过去这些年来",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "访问得最多的网站",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想大概就是",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404，Not Found 吧",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11304] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "专业收费设计死亡slogan",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恩，通常人们也叫墓志铭",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "以下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一居室，求合租，价格面议",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404 Not Found",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "小事儿招魂，大事儿挖坟",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我觉得我还可以抢救一下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没什么事我就先挂了啊",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高级副本，冥王哈迪斯，求组队",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3006,
			},
		},
		[11305] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "专业收费设计死亡slogan",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "恩，通常人们也叫墓志铭",
					["Model"] = 3006,
				},
				{
					["Action"] = "win",
					["Chat"] = "以下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一居室，求合租，价格面议",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "404 Not Found",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "小事儿招魂，大事儿挖坟",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我觉得我还可以抢救一下",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没什么事我就先挂了啊",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高级副本，冥王哈迪斯，求组队",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此地有wifi，磕头可见",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "陪聊，提供夜间上门服务",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "记得帮我收快递",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "终于可以做个安静的美男子",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3006,
			},
		},
		[11306] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，请您告诉我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我老是找不到对象？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你的长相配不上你的眼光",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[11307] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，你说，一个人外出吃饭",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么才能装得一点都不寂寞的样子？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "想多了吧",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没人会注意到你的",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[11308] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "先知，请您告诉我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么我老是找不到对象？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为你的长相配不上你的眼光",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说，一个人外出吃饭",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么才能装得一点都不寂寞的样子？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "想多了吧",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没人会注意到你的",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还有",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你那么丑，怎么老爱自拍呀",
					["Model"] = 3006,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我长这样子，不自拍，谁会拍我",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3006,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				3006,
			},
		},
		[11309] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法叫醒一个装睡的人",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远看不到女人素颜的一面",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远不可能敲开所有女人的门",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法让女神接你的电话",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么都能，你谁呀，你",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "本人从事基于互联网的电子商务平台的线下跟踪定位服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说人话",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "送快递的……",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				2016,
			},
		},
		[11310] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你是做什么的？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我从事it行业，主要负责通讯设备的周边服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哦哇，好高端的样子，能不能具体点",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就是智能高端数字通讯设备表面高分子化合物线性处理",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这么牛逼，但是我还是不懂，能不能通俗一点",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手机贴膜",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你呢？",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "利用计算机二级技术和文字艺术为客户提供口碑保障服务",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说得简单点？",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "淘宝刷好评",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法叫醒一个装睡的人",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远看不到女人素颜的一面",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远不可能敲开所有女人的门",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你永远无法让女神接你的电话",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我能",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么都能，你谁呀，你",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "本人从事基于互联网的电子商务平台的线下跟踪定位服务",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "说人话",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Chat"] = "送快递的……",
					["Model"] = 2016,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2016,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				2016,
			},
		},
		[11311] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我还有一个问题……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不约",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不造",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱过",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不后悔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "明天有事",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没多少钱了",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这题不会",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "蓝翔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "保大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不会游泳",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道安利",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道鸽子为什么那么大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此刻我对你的伤害造成你心里阴影部分的面积约9平方厘米",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请问还有什么要问的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[11312] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女生受欢迎的特性都有哪些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "可爱，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "声音好听，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有爱心，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "身材好，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有酒窝，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手指纤长，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "独立，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就没其他的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[11313] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我有个问题",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "女生受欢迎的特性都有哪些？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "可爱，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "声音好听，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有爱心，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "身材好，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有酒窝，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "手指纤长，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "独立，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就没其他的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有，长得漂亮",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "男生受欢迎的特性呢？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "温柔，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "体贴，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "高，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "帅，有钱",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我还有一个问题……",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不约",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不造",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱过",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不后悔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "明天有事",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "没多少钱了",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这题不会",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "蓝翔",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "保大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不会游泳",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道安利",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道鸽子为什么那么大",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "此刻我对你的伤害造成你心里阴影部分的面积约9平方厘米",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请问还有什么要问的吗？",
					["Model"] = 2010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2010,
				10000,
			},
		},
		[11314] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "~~~~(>_<)~~~~ ",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，怎么了？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么事你说呀",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我以为你会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不说我怎么会懂",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不懂的人，说了也不会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "能懂的人，不说也会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你要说出来我才知道我懂不懂啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有些东西不需要说",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你不要说了",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不在乎我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我……",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				3007,
			},
		},
		[11315] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为什么男生都喜欢长头发的女生？",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "头发长短不重要。",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还是看脸。",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "醒醒吧，",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不要觉得自己留长了头发，",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "就不用减肥了。",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "~~~~(>_<)~~~~ ",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "亲爱的，怎么了？",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么事你说呀",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我以为你会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不说我怎么会懂",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不懂的人，说了也不会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "能懂的人，不说也会懂",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你要说出来我才知道我懂不懂啊",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有些东西不需要说",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那你不要说了",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不在乎我",
					["Model"] = 3007,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我……",
					["Model"] = 2009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2009,
				3007,
			},
		},
		[11401] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "真的好男人",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并不是不玩游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不打LOL",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不玩魔兽的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而是他在玩游戏的时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "只要对方一个电话",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "或是一条消息",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他就会为她直接退出游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这种男人叫做……",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "猪一样的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[11402] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "玩游戏时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "队友总骂我傻逼",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "该怎么办？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给他说:",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你好，傻逼的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[11403] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "玩游戏时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "队友总骂我傻逼",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "该怎么办？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "给他说:",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你好，傻逼的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真的好男人",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并不是不玩游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不打LOL",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不玩魔兽的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "而是他在玩游戏的时候",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "只要对方一个电话",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "或是一条消息",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他就会为她直接退出游戏",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这种男人叫做……",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "猪一样的队友",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1010,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1010,
				3009,
			},
		},
		[11404] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说我长得怎么样？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得跟身份证一模一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一看你就是块读书的料",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请讲人话",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家都说红颜薄命",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我觉得你一定长命百岁",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啥意思？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11405] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "你说，男女之间有纯洁的友谊吗？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有呀，只要长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四海之内皆朋友",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你说我长得怎么样？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你长得跟身份证一模一样",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "一看你就是块读书的料",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "请讲人话",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人家都说红颜薄命",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不过我觉得你一定长命百岁",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啥意思？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "丑",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你们老说我长得丑",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "长得丑怎么了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是病得治",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这也算病？",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "当然算，不然整容医院为什么会叫医院呢",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11406] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的回复别人问:你为什么单身",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为太爱自己",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舍得也不放心把自己交给别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[11407] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何高冷回答:你为什么没有恋爱过？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "懒",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[11408] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "如何机智的回复别人问:你为什么单身",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为太爱自己",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舍得也不放心把自己交给别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如何高冷回答:你为什么没有恋爱过？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "懒",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "寂寞和孤独有什么区别?",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "寂寞是别人不想搭理你",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "孤独是你不想搭理别人",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1004,
				10000,
			},
		},
		[11409] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "只要能让我能瘦下来",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我什么都愿意做啊",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那么，你愿意少吃一点吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11410] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "只要能让我能瘦下来",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我什么都愿意做啊",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那么，你愿意少吃一点吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你不是说要减肥吗？",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还不停的吃吃吃！",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不过是说出来吓唬吓唬一身肉罢了",
					["Model"] = 1014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1014,
				10000,
			},
		},
		[11411] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[11412] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "四百多年的游移",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不懂怜悯",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最挚爱的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[11413] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "上帝就是这样",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他不懂爱",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他只是按照他自己的意愿去安排众生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "于是，我结识了魔鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "他给了我希望",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我会效忠于他",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "为了他去杀戮，无休止的屠戮",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "信仰里没有了光明，没有了自由",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "黑暗里只有血在流，只有哀号与挣扎",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "四百多年的游移",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我不再需要灵魂",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我只与风雨雷电共生",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我是强大而永生的吸血鬼",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我不懂怜悯",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "因为我知道多一点死亡的血",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "距离我的爱就会近一些",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我最挚爱的公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直到我见到公主",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她告诉我:",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "爱是用感性的方式，活着",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "生活是用理性的方式，爱着",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我这一辈子",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "忙着生，忙着爱，忙着恨",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "却忘记了生活原来是用来享受的",
					["Model"] = 2008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				2008,
			},
		},
		[11414] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "有些人明明靠长相和家世就可以一生无忧",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "但是他偏偏要靠努力",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真不知道一些长得丑的人",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还好意思赖床晚起",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3017,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3017,
			},
		},
		[11415] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "有些人明明靠长相和家世就可以一生无忧",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "但是他偏偏要靠努力",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "真不知道一些长得丑的人",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎么还好意思赖床晚起",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "所以，",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "脑残就要少动口",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "人丑就要多读书",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这是个看脸的世界",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "其实这是普遍现象",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看国外，facebook，face也在book前面",
					["Model"] = 3017,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3017,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3017,
			},
		},
		[11501] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "挨饿这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫减肥",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "掐人这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫按摩",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11502] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "发呆这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫深沉",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "偷懒这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫享受",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11503] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "挨饿这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫减肥",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "掐人这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫按摩",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "发呆这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫深沉",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "偷懒这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫享受",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "死皮赖脸这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "干得好就叫执著",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "装傻这事",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Chat"] = "如果干的好，那叫大智若愚",
					["Model"] = 3008,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3008,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				3008,
			},
		},
		[11504] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "求朋友们推荐一款400万到800万的跑车",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好是两座的",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "必须要求外观时尚",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "性能强",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舒适度高",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "起步快",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "马力大",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "颜色的话不是很重要",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好看就行",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我用来做手机壁纸",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1011,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				1011,
			},
		},
		[11505] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "求朋友们推荐一款400万到800万的跑车",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好是两座的",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "必须要求外观时尚",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "性能强",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "舒适度高",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "起步快",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "马力大",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "颜色的话不是很重要",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "好看就行",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我用来做手机壁纸",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "和喜欢的人聊天",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "和讨厌的人撕逼",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "以及考试",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Chat"] = "并称人生三大，事后总感觉没发挥好的事",
					["Model"] = 1011,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1011,
				},
			},
			["ModelLevel"] = {
				4,
			},
			["ModelList"] = {
				1011,
			},
		},
		[11506] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫暖男，而你叫炙热哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高冷男，而你叫冰霜哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫忧郁男，而你叫阴暗哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫潇洒男，而你叫暴风哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫阳光男，而你叫烈日哥布林",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[11507] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫多情男，而你叫淫邪哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高富帅，而你叫黄金哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫颓男，而你叫虚弱哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫运动男神，而你叫活跃哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 10000,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[11508] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "男生长得好看有什么意义呢？",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "举个例子",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫暖男，而你叫炙热哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高冷男，而你叫冰霜哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫忧郁男，而你叫阴暗哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫潇洒男，而你叫暴风哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫阳光男，而你叫烈日哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫多情男，而你叫淫邪哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫高富帅，而你叫黄金哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫颓男，而你叫虚弱哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫运动男神，而你叫活跃哥布林",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人长得帅可以叫霸道总裁，而你叫哥布林首领",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "泥垢了！我是地精不是哥布林！",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Chat"] = "哦，地精哥布林！",
					["Model"] = 10000,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 2014,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 2014,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				2014,
				10000,
			},
		},
		[11509] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "我想买辆坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那就买呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "买不起啊，那么贵",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "拿信用卡刷呀",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "刷信用卡要还的",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还不起咋办",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怕什么，你有坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3010,
				1012,
			},
		},
		[11510] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "唐老鸭为什么姓唐？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "大概是因为他喜欢吃糖",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "米老鼠为什么姓米？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "喜欢吃米呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那史莱克呢？",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "我想买辆坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那就买呗",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "买不起啊，那么贵",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "拿信用卡刷呀",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "刷信用卡要还的",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "还不起咋办",
					["Model"] = 1012,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怕什么，你有坦克",
					["Model"] = 3010,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1012,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3010,
				1012,
			},
		},
		[11511] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "在书店如何跟女生搭讪？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你就说:美女，你喜欢书吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她说喜欢你就说",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叔也喜欢你",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[11512] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能让女孩子追我呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "去女孩子的店里买东西",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不给钱就跑",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1004,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[11513] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "在书店如何跟女生搭讪？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你就说:美女，你喜欢书吗？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "她说喜欢你就说",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "叔也喜欢你",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "怎样才能让女孩子追我呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "去女孩子的店里买东西",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不给钱就跑",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "看到一个漂亮MM",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "不知道怎么上去搭讪",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "直接上去亲她一口",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "万一她正好也对你有意思",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这事不就成了？",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "那万一她把我推开呢？",
					["Model"] = 1005,
				},
				{
					["Action"] = "stand",
					["Chat"] = "管她呢，反正你已经亲过了",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Chat"] = "这叫#论流氓的修养#",
					["Model"] = 1004,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 1005,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				1005,
				1004,
			},
		},
		[11514] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "英雄联盟什么英雄最厉害？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么英雄最垃圾？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人用的英雄最厉害",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你队友用的最垃圾",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Model"] = 3009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				1010,
			},
		},
		[11515] = {
			["ChatTbl"] = {
				{
					["Action"] = "stand",
					["Chat"] = "英雄联盟什么英雄最厉害？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "什么英雄最垃圾？",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "别人用的英雄最厉害",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你队友用的最垃圾",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 8000,
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "你妈叫我帮你找对象",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "有没有什么要求啊？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "满级满符文的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "啊？",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Chat"] = "最好不吭不送的",
					["Model"] = 1010,
				},
				{
					["Action"] = "stand",
					["Chat"] = "……",
					["Model"] = 3009,
				},
				{
					["Action"] = "stand",
					["Delay"] = 15000,
					["Model"] = 3009,
				},
			},
			["ModelLevel"] = {
				4,
				4,
			},
			["ModelList"] = {
				3009,
				1010,
			},
		},
	},
	["CheckList"] = {
		["Level"] = {
			{
				101001,
			},
			[14] = {
				10307,
				10308,
				10309,
				10310,
				10311,
				10312,
				10401,
				10402,
				10403,
				10404,
				10405,
				10406,
				104061,
				10407,
				10408,
				10409,
				10410,
				10411,
				10412,
			},
			[16] = {
				104121,
				10413,
				10414,
				10415,
				10416,
				10417,
				10418,
				104181,
				10501,
				10502,
				10503,
			},
			[20] = {
				10504,
				10505,
				10506,
				105061,
				10507,
				10508,
				10509,
				10510,
				10511,
				10512,
				105121,
				10513,
				10514,
				10515,
				10516,
				10517,
				10518,
				105181,
				10601,
				10602,
				10603,
			},
			[25] = {
				10604,
				10605,
				10606,
				10607,
				10608,
				10609,
				10610,
				10611,
				10612,
				10613,
				10614,
				10615,
				10616,
				10617,
				10618,
				10701,
				10702,
				10703,
			},
			[30] = {
				10704,
				10705,
				10706,
				10707,
				10708,
				10709,
				10710,
				10711,
				10712,
				10713,
				10714,
				10715,
				10716,
				10717,
				10718,
				10801,
				10802,
				10803,
			},
			[35] = {
				10804,
				10805,
				10806,
				10807,
				10808,
				10809,
				10810,
				10811,
				10812,
				10813,
				10814,
				10815,
				10816,
				10817,
				10818,
				10901,
				10902,
				10903,
				10904,
			},
			[40] = {
				10905,
				10906,
				10907,
				10908,
				10909,
				10910,
				10911,
				10912,
				10913,
				10914,
				10915,
				10916,
				10917,
				10918,
				11001,
			},
			[45] = {
				11002,
				11003,
				11004,
				11005,
				11006,
				11007,
				11008,
				11009,
				11010,
				11011,
				11012,
				11013,
				11014,
				11015,
				11016,
				11017,
				11018,
				11101,
				11102,
				11103,
				11104,
			},
			[50] = {
				11105,
				11106,
				11107,
				11108,
				11109,
				11110,
				11111,
				11112,
				11113,
				11114,
				11115,
				11116,
				11117,
				11118,
				11201,
				11202,
				11203,
			},
			[55] = {
				11204,
				11205,
				11206,
				11207,
				11208,
				11209,
				11210,
				11211,
				11212,
				11213,
				11214,
				11215,
				11216,
				11217,
				11218,
				11301,
				11302,
				11303,
			},
			[60] = {
				11304,
				11305,
				11306,
				11307,
				11308,
				11309,
				11310,
				11311,
				11312,
				11313,
				11314,
				11315,
				11316,
				11317,
				11318,
				11401,
				11402,
				11403,
			},
			[65] = {
				11404,
				11405,
				11406,
				11407,
				11408,
				11409,
				11410,
				11411,
				11412,
				11413,
				11414,
				11415,
				11416,
				11417,
				11418,
				11501,
				11502,
				11503,
			},
			[70] = {
				11504,
				11505,
				11506,
				11507,
				11508,
				11509,
				11510,
				11511,
				11512,
				11513,
				11514,
				11515,
				11516,
				11517,
				11518,
			},
		},
		["Special"] = {
		},
		["Stage"] = {
			[101001] = {
				101002,
			},
			[101002] = {
				101003,
			},
			[101003] = {
				10101,
			},
			[10101] = {
				101010,
				20101,
			},
			[101010] = {
				10102,
			},
			[10102] = {
				10103,
			},
			[10103] = {
				101030,
			},
			[101030] = {
				10104,
			},
			[10104] = {
				10105,
			},
			[10105] = {
				10106,
			},
			[10106] = {
				10107,
			},
			[10107] = {
				10108,
			},
			[10108] = {
				10201,
			},
			[10201] = {
				10202,
			},
			[10202] = {
				10203,
			},
			[10203] = {
				10204,
			},
			[10204] = {
				10205,
			},
			[10205] = {
				10206,
			},
			[10206] = {
				10207,
			},
			[10207] = {
				10208,
			},
			[10208] = {
				10209,
			},
			[10209] = {
				10210,
				20201,
			},
			[10210] = {
				10211,
			},
			[10211] = {
				10212,
			},
			[10212] = {
				10301,
			},
			[10301] = {
				10302,
			},
			[10302] = {
				10303,
			},
			[10303] = {
				10304,
			},
			[10304] = {
				10305,
			},
			[10305] = {
				10306,
			},
			[10306] = {
				10307,
			},
			[10307] = {
				10308,
			},
			[10308] = {
				10309,
			},
			[10309] = {
				10310,
			},
			[10310] = {
				10311,
				20301,
			},
			[10311] = {
				10312,
			},
			[10312] = {
				10401,
			},
			[10401] = {
				10402,
			},
			[10402] = {
				10403,
			},
			[10403] = {
				10404,
			},
			[10404] = {
				10405,
			},
			[10405] = {
				10406,
			},
			[10406] = {
				104061,
			},
			[104061] = {
				10407,
			},
			[10407] = {
				10408,
			},
			[10408] = {
				10409,
			},
			[10409] = {
				10410,
			},
			[10410] = {
				10411,
			},
			[10411] = {
				10412,
			},
			[10412] = {
				104121,
			},
			[104121] = {
				10413,
			},
			[10413] = {
				10414,
			},
			[10414] = {
				10415,
			},
			[10415] = {
				10416,
			},
			[10416] = {
				10417,
			},
			[10417] = {
				10418,
			},
			[10418] = {
				104181,
			},
			[104181] = {
				10501,
				20401,
			},
			[10501] = {
				10502,
			},
			[10502] = {
				10503,
			},
			[10503] = {
				10504,
			},
			[10504] = {
				10505,
			},
			[10505] = {
				10506,
			},
			[10506] = {
				105061,
			},
			[105061] = {
				10507,
			},
			[10507] = {
				10508,
			},
			[10508] = {
				10509,
			},
			[10509] = {
				10510,
			},
			[10510] = {
				10511,
			},
			[10511] = {
				10512,
			},
			[10512] = {
				105121,
			},
			[105121] = {
				10513,
			},
			[10513] = {
				10514,
			},
			[10514] = {
				10515,
			},
			[10515] = {
				10516,
			},
			[10516] = {
				10517,
			},
			[10517] = {
				10518,
			},
			[10518] = {
				105181,
			},
			[105181] = {
				10601,
				20501,
			},
			[10601] = {
				10602,
			},
			[10602] = {
				10603,
			},
			[10603] = {
				10604,
			},
			[10604] = {
				10605,
			},
			[10605] = {
				10606,
			},
			[10606] = {
				10607,
			},
			[10607] = {
				10608,
			},
			[10608] = {
				10609,
			},
			[10609] = {
				10610,
			},
			[10610] = {
				10611,
			},
			[10611] = {
				10612,
			},
			[10612] = {
				10613,
			},
			[10613] = {
				10614,
			},
			[10614] = {
				10615,
			},
			[10615] = {
				10616,
			},
			[10616] = {
				10617,
			},
			[10617] = {
				10618,
			},
			[10618] = {
				10701,
				20601,
			},
			[10701] = {
				10702,
			},
			[10702] = {
				10703,
			},
			[10703] = {
				10704,
			},
			[10704] = {
				10705,
			},
			[10705] = {
				10706,
			},
			[10706] = {
				10707,
			},
			[10707] = {
				10708,
			},
			[10708] = {
				10709,
			},
			[10709] = {
				10710,
			},
			[10710] = {
				10711,
			},
			[10711] = {
				10712,
			},
			[10712] = {
				10713,
			},
			[10713] = {
				10714,
			},
			[10714] = {
				10715,
			},
			[10715] = {
				10716,
			},
			[10716] = {
				10717,
			},
			[10717] = {
				10718,
			},
			[10718] = {
				10801,
				20701,
			},
			[10801] = {
				10802,
			},
			[10802] = {
				10803,
			},
			[10803] = {
				10804,
			},
			[10804] = {
				10805,
			},
			[10805] = {
				10806,
			},
			[10806] = {
				10807,
			},
			[10807] = {
				10808,
			},
			[10808] = {
				10809,
			},
			[10809] = {
				10810,
			},
			[10810] = {
				10811,
			},
			[10811] = {
				10812,
			},
			[10812] = {
				10813,
			},
			[10813] = {
				10814,
			},
			[10814] = {
				10815,
			},
			[10815] = {
				10816,
			},
			[10816] = {
				10817,
			},
			[10817] = {
				10818,
			},
			[10818] = {
				10901,
				20801,
			},
			[10901] = {
				10902,
			},
			[10902] = {
				10903,
			},
			[10903] = {
				10904,
			},
			[10904] = {
				10905,
			},
			[10905] = {
				10906,
			},
			[10906] = {
				10907,
			},
			[10907] = {
				10908,
			},
			[10908] = {
				10909,
			},
			[10909] = {
				10910,
			},
			[10910] = {
				10911,
			},
			[10911] = {
				10912,
			},
			[10912] = {
				10913,
			},
			[10913] = {
				10914,
			},
			[10914] = {
				10915,
			},
			[10915] = {
				10916,
			},
			[10916] = {
				10917,
			},
			[10917] = {
				10918,
			},
			[10918] = {
				11001,
				20901,
			},
			[11001] = {
				11002,
			},
			[11002] = {
				11003,
			},
			[11003] = {
				11004,
			},
			[11004] = {
				11005,
			},
			[11005] = {
				11006,
			},
			[11006] = {
				11007,
			},
			[11007] = {
				11008,
			},
			[11008] = {
				11009,
			},
			[11009] = {
				11010,
			},
			[11010] = {
				11011,
			},
			[11011] = {
				11012,
			},
			[11012] = {
				11013,
			},
			[11013] = {
				11014,
			},
			[11014] = {
				11015,
			},
			[11015] = {
				11016,
			},
			[11016] = {
				11017,
			},
			[11017] = {
				11018,
			},
			[11018] = {
				11101,
				21001,
			},
			[11101] = {
				11102,
			},
			[11102] = {
				11103,
			},
			[11103] = {
				11104,
			},
			[11104] = {
				11105,
			},
			[11105] = {
				11106,
			},
			[11106] = {
				11107,
			},
			[11107] = {
				11108,
			},
			[11108] = {
				11109,
			},
			[11109] = {
				11110,
			},
			[11110] = {
				11111,
			},
			[11111] = {
				11112,
			},
			[11112] = {
				11113,
			},
			[11113] = {
				11114,
			},
			[11114] = {
				11115,
			},
			[11115] = {
				11116,
			},
			[11116] = {
				11117,
			},
			[11117] = {
				11118,
			},
			[11118] = {
				11201,
				21101,
			},
			[11201] = {
				11202,
			},
			[11202] = {
				11203,
			},
			[11203] = {
				11204,
			},
			[11204] = {
				11205,
			},
			[11205] = {
				11206,
			},
			[11206] = {
				11207,
			},
			[11207] = {
				11208,
			},
			[11208] = {
				11209,
			},
			[11209] = {
				11210,
			},
			[11210] = {
				11211,
			},
			[11211] = {
				11212,
			},
			[11212] = {
				11213,
			},
			[11213] = {
				11214,
			},
			[11214] = {
				11215,
			},
			[11215] = {
				11216,
			},
			[11216] = {
				11217,
			},
			[11217] = {
				11218,
			},
			[11218] = {
				11301,
				21201,
			},
			[11301] = {
				11302,
			},
			[11302] = {
				11303,
			},
			[11303] = {
				11304,
			},
			[11304] = {
				11305,
			},
			[11305] = {
				11306,
			},
			[11306] = {
				11307,
			},
			[11307] = {
				11308,
			},
			[11308] = {
				11309,
			},
			[11309] = {
				11310,
			},
			[11310] = {
				11311,
			},
			[11311] = {
				11312,
			},
			[11312] = {
				11313,
			},
			[11313] = {
				11314,
			},
			[11314] = {
				11315,
			},
			[11315] = {
				11316,
			},
			[11316] = {
				11317,
			},
			[11317] = {
				11318,
			},
			[11318] = {
				11401,
				21301,
			},
			[11401] = {
				11402,
			},
			[11402] = {
				11403,
			},
			[11403] = {
				11404,
			},
			[11404] = {
				11405,
			},
			[11405] = {
				11406,
			},
			[11406] = {
				11407,
			},
			[11407] = {
				11408,
			},
			[11408] = {
				11409,
			},
			[11409] = {
				11410,
			},
			[11410] = {
				11411,
			},
			[11411] = {
				11412,
			},
			[11412] = {
				11413,
			},
			[11413] = {
				11414,
			},
			[11414] = {
				11415,
			},
			[11415] = {
				11416,
			},
			[11416] = {
				11417,
			},
			[11417] = {
				11418,
			},
			[11418] = {
				11501,
				21401,
			},
			[11501] = {
				11502,
			},
			[11502] = {
				11503,
			},
			[11503] = {
				11504,
			},
			[11504] = {
				11505,
			},
			[11505] = {
				11506,
			},
			[11506] = {
				11507,
			},
			[11507] = {
				11508,
			},
			[11508] = {
				11509,
			},
			[11509] = {
				11510,
			},
			[11510] = {
				11511,
			},
			[11511] = {
				11512,
			},
			[11512] = {
				11513,
			},
			[11513] = {
				11514,
			},
			[11514] = {
				11515,
			},
			[11515] = {
				11516,
			},
			[11516] = {
				11517,
			},
			[11517] = {
				11518,
			},
			[11518] = {
				21501,
			},
			[20101] = {
				20102,
			},
			[20102] = {
				20103,
			},
			[20103] = {
				20104,
			},
			[20104] = {
				20105,
			},
			[20105] = {
				20106,
			},
			[20106] = {
				20201,
			},
			[20201] = {
				20202,
			},
			[20202] = {
				20203,
			},
			[20203] = {
				20204,
			},
			[20204] = {
				20205,
			},
			[20205] = {
				20206,
			},
			[20206] = {
				20301,
			},
			[20301] = {
				20302,
			},
			[20302] = {
				20303,
			},
			[20303] = {
				20304,
			},
			[20304] = {
				20305,
			},
			[20305] = {
				20306,
			},
			[20306] = {
				20401,
			},
			[20401] = {
				20402,
			},
			[20402] = {
				20403,
			},
			[20403] = {
				20404,
			},
			[20404] = {
				20405,
			},
			[20405] = {
				20406,
			},
			[20406] = {
				20501,
			},
			[20501] = {
				20502,
			},
			[20502] = {
				20503,
			},
			[20503] = {
				20504,
			},
			[20504] = {
				20505,
			},
			[20505] = {
				20506,
			},
			[20506] = {
				20601,
			},
			[20601] = {
				20602,
			},
			[20602] = {
				20603,
			},
			[20603] = {
				20604,
			},
			[20604] = {
				20605,
			},
			[20605] = {
				20606,
			},
			[20606] = {
				20701,
			},
			[20701] = {
				20702,
			},
			[20702] = {
				20703,
			},
			[20703] = {
				20704,
			},
			[20704] = {
				20705,
			},
			[20705] = {
				20706,
			},
			[20706] = {
				20801,
			},
			[20801] = {
				20802,
			},
			[20802] = {
				20803,
			},
			[20803] = {
				20804,
			},
			[20804] = {
				20805,
			},
			[20805] = {
				20806,
			},
			[20806] = {
				20901,
			},
			[20901] = {
				20902,
			},
			[20902] = {
				20903,
			},
			[20903] = {
				20904,
			},
			[20904] = {
				20905,
			},
			[20905] = {
				20906,
			},
			[20906] = {
				21001,
			},
			[21001] = {
				21002,
			},
			[21002] = {
				21003,
			},
			[21003] = {
				21004,
			},
			[21004] = {
				21005,
			},
			[21005] = {
				21006,
			},
			[21006] = {
				21101,
			},
			[21101] = {
				21102,
			},
			[21102] = {
				21103,
			},
			[21103] = {
				21104,
			},
			[21104] = {
				21105,
			},
			[21105] = {
				21106,
			},
			[21106] = {
				21201,
			},
			[21201] = {
				21202,
			},
			[21202] = {
				21203,
			},
			[21203] = {
				21204,
			},
			[21204] = {
				21205,
			},
			[21205] = {
				21206,
			},
			[21206] = {
				21301,
			},
			[21301] = {
				21302,
			},
			[21302] = {
				21303,
			},
			[21303] = {
				21304,
			},
			[21304] = {
				21305,
			},
			[21305] = {
				21306,
			},
			[21306] = {
				21401,
			},
			[21401] = {
				21402,
			},
			[21402] = {
				21403,
			},
			[21403] = {
				21404,
			},
			[21404] = {
				21405,
			},
			[21405] = {
				21406,
			},
			[21406] = {
				21501,
			},
			[21501] = {
				21502,
			},
			[21502] = {
				21503,
			},
			[21503] = {
				21504,
			},
			[21504] = {
				21505,
			},
			[21505] = {
				21506,
			},
		},
	},
	["EventApi"] = {
		function (OP, ...)
	local ARGS={...} if EVENT_API.IS_PRELOAD_CALL then     return ARGS[1] else     return EVENT_API:StartCombat(OP,ARGS[1]) end
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:CondiNeedLevel(OP,ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:CondiFinishStage(OP,ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:CheckTrialActCanEnter(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:TrialAccount(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:OpenStageScore(OP, ARGS[1], ARGS[2])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:CheckWeekendActCanEnter(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:WeekendAccount(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:WeekendEnter(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:TrialEnter(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:CheckUCCanEnter(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:UCAccount(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:UCEnter(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:CheckAchieveStatus(OP, ARGS[1], ARGS[2])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsWin(OP)
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsComboHigher(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsDeathCardLess(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsUseCard(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsRoundLess(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsHpMore(OP, ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsChapterRoundLess(OP, ARGS[1], ARGS[2])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:IsKillNumHigher(OP,ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:StartMiniGame(OP,ARGS[1])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:CheckEnterLevel(OP, ARGS[1], ARGS[2], ARGS[3])
end,
		function (OP, ...)
	local ARGS={...} return EVENT_API:StarLevel(OP,ARGS[1])
end,
	},
	["EventType"] = {
		1,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
	},
	["MapCfg"] = {
		{
			["BonusPreShow"] = {
				[18] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[5] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第1-5章三星奖励2",
				},
				[18] = {
					"精英副本第1-5章三星奖励3",
				},
				[6] = {
					"精英副本第1-5章三星奖励1",
				},
			},
			["Id"] = 1,
			["Name"] = "关卡地图1",
			["Offset"] = 0,
			["ShowName"] = "1.珊瑚曲境",
			["StageList"] = {
				101001,
				101002,
				101003,
				10101,
				101010,
				10102,
				10103,
				101030,
				10104,
				10105,
				10106,
				10107,
				10108,
				20101,
				20102,
				20103,
				20104,
				20105,
				20106,
			},
			["StarBonus"] = {
				[18] = {
					"普通副本第1-5章三星奖励2",
				},
				[5] = {
					"普通副本第1-5章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView1",
		},
		{
			["BonusPreShow"] = {
				[18] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[9] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第1-5章三星奖励2",
				},
				[18] = {
					"精英副本第1-5章三星奖励3",
				},
				[6] = {
					"精英副本第1-5章三星奖励1",
				},
			},
			["Id"] = 2,
			["Name"] = "关卡地图2",
			["Offset"] = 340,
			["ShowName"] = "2.精灵沼泽",
			["StageList"] = {
				10201,
				10202,
				10203,
				10204,
				10205,
				10206,
				10207,
				10208,
				10209,
				10210,
				10211,
				10212,
				20201,
				20202,
				20203,
				20204,
				20205,
				20206,
			},
			["StarBonus"] = {
				[18] = {
					"普通副本第1-5章三星奖励2",
				},
				[9] = {
					"普通副本第1-5章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView1",
		},
		{
			["BonusPreShow"] = {
				[18] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[9] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第1-5章三星奖励2",
				},
				[18] = {
					"精英副本第1-5章三星奖励3",
				},
				[6] = {
					"精英副本第1-5章三星奖励1",
				},
			},
			["Id"] = 3,
			["Name"] = "关卡地图3",
			["Offset"] = 770,
			["ShowName"] = "3.帕雅神庙",
			["StageList"] = {
				10301,
				10302,
				10303,
				10304,
				10305,
				10306,
				10307,
				10308,
				10309,
				10310,
				10311,
				10312,
				20301,
				20302,
				20303,
				20304,
				20305,
				20306,
			},
			["StarBonus"] = {
				[18] = {
					"普通副本第1-5章三星奖励2",
				},
				[9] = {
					"普通副本第1-5章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView2",
		},
		{
			["BonusPreShow"] = {
				[18] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[27] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[9] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第1-5章三星奖励2",
				},
				[18] = {
					"精英副本第1-5章三星奖励3",
				},
				[6] = {
					"精英副本第1-5章三星奖励1",
				},
			},
			["Id"] = 4,
			["Name"] = "关卡地图4",
			["Offset"] = 330,
			["ShowName"] = "4.圣光之巢",
			["StageList"] = {
				10401,
				10402,
				10403,
				10404,
				10405,
				10406,
				104061,
				10407,
				10408,
				10409,
				10410,
				10411,
				10412,
				104121,
				10413,
				10414,
				10415,
				10416,
				10417,
				10418,
				104181,
				20401,
				20402,
				20403,
				20404,
				20405,
				20406,
			},
			["StarBonus"] = {
				[18] = {
					"普通副本第1-5章三星奖励2",
				},
				[27] = {
					"普通副本第1-5章三星奖励3",
				},
				[9] = {
					"普通副本第1-5章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView2",
		},
		{
			["BonusPreShow"] = {
				[18] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[27] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[9] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500003,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500002,
					},
					{
						["Amount"] = "2",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第1-5章三星奖励2",
				},
				[18] = {
					"精英副本第1-5章三星奖励3",
				},
				[6] = {
					"精英副本第1-5章三星奖励1",
				},
			},
			["Id"] = 5,
			["Name"] = "关卡地图5",
			["Offset"] = -240,
			["ShowName"] = "5.蒲英魔都",
			["StageList"] = {
				10501,
				10502,
				10503,
				10504,
				10505,
				10506,
				105061,
				10507,
				10508,
				10509,
				10510,
				10511,
				10512,
				105121,
				10513,
				10514,
				10515,
				10516,
				10517,
				10518,
				105181,
				20501,
				20502,
				20503,
				20504,
				20505,
				20506,
			},
			["StarBonus"] = {
				[18] = {
					"普通副本第1-5章三星奖励2",
				},
				[27] = {
					"普通副本第1-5章三星奖励3",
				},
				[9] = {
					"普通副本第1-5章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView2",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第6-10章三星奖励2",
				},
				[18] = {
					"精英副本第6-10章三星奖励3",
				},
				[6] = {
					"精英副本第6-10章三星奖励1",
				},
			},
			["Id"] = 6,
			["Name"] = "关卡地图6",
			["Offset"] = 625,
			["ShowName"] = "6.赤鹿之林",
			["StageList"] = {
				10601,
				10602,
				10603,
				10604,
				10605,
				10606,
				10607,
				10608,
				10609,
				10610,
				10611,
				10612,
				10613,
				10614,
				10615,
				10616,
				10617,
				10618,
				20601,
				20602,
				20603,
				20604,
				20605,
				20606,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第6-10章三星奖励2",
				},
				[18] = {
					"普通副本第6-10章三星奖励3",
				},
				[6] = {
					"普通副本第6-10章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView2",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第6-10章三星奖励2",
				},
				[18] = {
					"精英副本第6-10章三星奖励3",
				},
				[6] = {
					"精英副本第6-10章三星奖励1",
				},
			},
			["Id"] = 7,
			["Name"] = "关卡地图7",
			["Offset"] = -50,
			["ShowName"] = "7.彩虹栈道",
			["StageList"] = {
				10701,
				10702,
				10703,
				10704,
				10705,
				10706,
				10707,
				10708,
				10709,
				10710,
				10711,
				10712,
				10713,
				10714,
				10715,
				10716,
				10717,
				10718,
				20701,
				20702,
				20703,
				20704,
				20705,
				20706,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第6-10章三星奖励2",
				},
				[18] = {
					"普通副本第6-10章三星奖励3",
				},
				[6] = {
					"普通副本第6-10章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView3",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第6-10章三星奖励2",
				},
				[18] = {
					"精英副本第6-10章三星奖励3",
				},
				[6] = {
					"精英副本第6-10章三星奖励1",
				},
			},
			["Id"] = 8,
			["Name"] = "关卡地图8",
			["Offset"] = -540,
			["ShowName"] = "8.菲斯学院",
			["StageList"] = {
				10801,
				10802,
				10803,
				10804,
				10805,
				10806,
				10807,
				10808,
				10809,
				10810,
				10811,
				10812,
				10813,
				10814,
				10815,
				10816,
				10817,
				10818,
				20801,
				20802,
				20803,
				20804,
				20805,
				20806,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第6-10章三星奖励2",
				},
				[18] = {
					"普通副本第6-10章三星奖励3",
				},
				[6] = {
					"普通副本第6-10章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView3",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第6-10章三星奖励2",
				},
				[18] = {
					"精英副本第6-10章三星奖励3",
				},
				[6] = {
					"精英副本第6-10章三星奖励1",
				},
			},
			["Id"] = 9,
			["Name"] = "关卡地图9",
			["Offset"] = 580,
			["ShowName"] = "9.雷霆崖",
			["StageList"] = {
				10901,
				10902,
				10903,
				10904,
				10905,
				10906,
				10907,
				10908,
				10909,
				10910,
				10911,
				10912,
				10913,
				10914,
				10915,
				10916,
				10917,
				10918,
				20901,
				20902,
				20903,
				20904,
				20905,
				20906,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第6-10章三星奖励2",
				},
				[18] = {
					"普通副本第6-10章三星奖励3",
				},
				[6] = {
					"普通副本第6-10章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView3",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500009,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500023,
					},
					{
						["Amount"] = "3",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第6-10章三星奖励2",
				},
				[18] = {
					"精英副本第6-10章三星奖励3",
				},
				[6] = {
					"精英副本第6-10章三星奖励1",
				},
			},
			["Id"] = 10,
			["Name"] = "关卡地图10",
			["Offset"] = -45,
			["ShowName"] = "10.乞罗涧",
			["StageList"] = {
				11001,
				11002,
				11003,
				11004,
				11005,
				11006,
				11007,
				11008,
				11009,
				11010,
				11011,
				11012,
				11013,
				11014,
				11015,
				11016,
				11017,
				11018,
				21001,
				21002,
				21003,
				21004,
				21005,
				21006,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第6-10章三星奖励2",
				},
				[18] = {
					"普通副本第6-10章三星奖励3",
				},
				[6] = {
					"普通副本第6-10章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView3",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第11-15章三星奖励2",
				},
				[18] = {
					"精英副本第11-15章三星奖励3",
				},
				[6] = {
					"精英副本第11-15章三星奖励1",
				},
			},
			["Id"] = 11,
			["Name"] = "关卡地图11",
			["Offset"] = 780,
			["ShowName"] = "11.神女峰",
			["StageList"] = {
				11101,
				11102,
				11103,
				11104,
				11105,
				11106,
				11107,
				11108,
				11109,
				11110,
				11111,
				11112,
				11113,
				11114,
				11115,
				11116,
				11117,
				11118,
				21101,
				21102,
				21103,
				21104,
				21105,
				21106,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第11-15章三星奖励2",
				},
				[18] = {
					"普通副本第11-15章三星奖励3",
				},
				[6] = {
					"普通副本第11-15章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView3",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第11-15章三星奖励2",
				},
				[18] = {
					"精英副本第11-15章三星奖励3",
				},
				[6] = {
					"精英副本第11-15章三星奖励1",
				},
			},
			["Id"] = 12,
			["Name"] = "关卡地图12",
			["Offset"] = 180,
			["ShowName"] = "12.曼陀罗渊",
			["StageList"] = {
				11201,
				11202,
				11203,
				11204,
				11205,
				11206,
				11207,
				11208,
				11209,
				11210,
				11211,
				11212,
				11213,
				11214,
				11215,
				11216,
				11217,
				11218,
				21201,
				21202,
				21203,
				21204,
				21205,
				21206,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第11-15章三星奖励2",
				},
				[18] = {
					"普通副本第11-15章三星奖励3",
				},
				[6] = {
					"普通副本第11-15章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView4",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第11-15章三星奖励2",
				},
				[18] = {
					"精英副本第11-15章三星奖励3",
				},
				[6] = {
					"精英副本第11-15章三星奖励1",
				},
			},
			["Id"] = 13,
			["Name"] = "关卡地图13",
			["Offset"] = 0,
			["ShowName"] = "13.失却荒原",
			["StageList"] = {
				11301,
				11302,
				11303,
				11304,
				11305,
				11306,
				11307,
				11308,
				11309,
				11310,
				11311,
				11312,
				11313,
				11314,
				11315,
				11316,
				11317,
				11318,
				21301,
				21302,
				21303,
				21304,
				21305,
				21306,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第11-15章三星奖励2",
				},
				[18] = {
					"普通副本第11-15章三星奖励3",
				},
				[6] = {
					"普通副本第11-15章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView4",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第11-15章三星奖励2",
				},
				[18] = {
					"精英副本第11-15章三星奖励3",
				},
				[6] = {
					"精英副本第11-15章三星奖励1",
				},
			},
			["Id"] = 14,
			["Name"] = "关卡地图14",
			["Offset"] = 730,
			["ShowName"] = "14.兽人山脉",
			["StageList"] = {
				11401,
				11402,
				11403,
				11404,
				11405,
				11406,
				11407,
				11408,
				11409,
				11410,
				11411,
				11412,
				11413,
				11414,
				11415,
				11416,
				11417,
				11418,
				21401,
				21402,
				21403,
				21404,
				21405,
				21406,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第11-15章三星奖励2",
				},
				[18] = {
					"普通副本第11-15章三星奖励3",
				},
				[6] = {
					"普通副本第11-15章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView4",
		},
		{
			["BonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "60",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "50000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500008,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroBonusPreShow"] = {
				[12] = {
					{
						["Amount"] = "30",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "30000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[18] = {
					{
						["Amount"] = "100",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "100000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "6",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
				[6] = {
					{
						["Amount"] = "20",
						["BonusType"] = "Item",
						["SubType"] = 200019,
					},
					{
						["Amount"] = "20000",
						["BonusType"] = "Item",
						["SubType"] = 200016,
					},
					{
						["Amount"] = "1",
						["BonusType"] = "Item",
						["SubType"] = 500006,
					},
					{
						["Amount"] = "4",
						["BonusType"] = "Item",
						["SubType"] = 200007,
					},
				},
			},
			["HeroStarBonus"] = {
				[12] = {
					"精英副本第11-15章三星奖励2",
				},
				[18] = {
					"精英副本第11-15章三星奖励3",
				},
				[6] = {
					"精英副本第11-15章三星奖励1",
				},
			},
			["Id"] = 15,
			["Name"] = "关卡地图15",
			["Offset"] = 360,
			["ShowName"] = "15.暴风之眼",
			["StageList"] = {
				11501,
				11502,
				11503,
				11504,
				11505,
				11506,
				11507,
				11508,
				11509,
				11510,
				11511,
				11512,
				11513,
				11514,
				11515,
				11516,
				11517,
				11518,
				21501,
				21502,
				21503,
				21504,
				21505,
				21506,
			},
			["StarBonus"] = {
				[12] = {
					"普通副本第11-15章三星奖励2",
				},
				[18] = {
					"普通副本第11-15章三星奖励3",
				},
				[6] = {
					"普通副本第11-15章三星奖励1",
				},
			},
			["ViewPath"] = "main/itemView5",
		},
		["MapIdList"] = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
		},
	},
	["MapName2Id"] = {
		["关卡地图1"] = 1,
		["关卡地图10"] = 10,
		["关卡地图11"] = 11,
		["关卡地图12"] = 12,
		["关卡地图13"] = 13,
		["关卡地图14"] = 14,
		["关卡地图15"] = 15,
		["关卡地图2"] = 2,
		["关卡地图3"] = 3,
		["关卡地图4"] = 4,
		["关卡地图5"] = 5,
		["关卡地图6"] = 6,
		["关卡地图7"] = 7,
		["关卡地图8"] = 8,
		["关卡地图9"] = 9,
	},
	["StageCfg"] = {
		[101001] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[2](OP,1)
end,
			},
			["ChatInfo"] = 10101,
			["Desc"] = "基本战斗教学——普攻，连击",
			["Drama"] = "新奥义教学_短",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 100029)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						2,
					},
					{
						610201,
						2,
					},
					{
						610301,
						2,
					},
					{
						610001,
						4,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 101001,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 1200,
			["MonsterId"] = 101012,
			["Name"] = "关卡地图0_1",
			["NeedPower"] = 6,
			["PassShow"] = 1,
			["ShapeId"] = 10000,
			["ShowName"] = "普攻，连击",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
		},
		[101002] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,101001)
end,
			},
			["ChatInfo"] = 10101,
			["Desc"] = "基本战斗教学——连击，奥义",
			["Drama"] = "新奥义教学_25",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 100030)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 101002,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 1200,
			["MonsterId"] = 101012,
			["Name"] = "关卡地图0_2",
			["NeedPower"] = 6,
			["PassShow"] = 1,
			["ShapeId"] = 10000,
			["ShowName"] = "连击，奥义",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
		},
		[101003] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,101002)
end,
			},
			["ChatInfo"] = 10101,
			["Desc"] = "BOSS战，三星目标为高连击",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 100031)
end,
				function (API, OP)
	return API[1](OP, 100032)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 101003,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 1200,
			["MonsterId"] = 101012,
			["Name"] = "关卡地图0_3",
			["NeedPower"] = 6,
			["PassShow"] = 1,
			["ShapeId"] = 10000,
			["ShowName"] = "BOSS战",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
		},
		[10101] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,101003)
end,
			},
			["ChatInfo"] = 10101,
			["Desc"] = "“圣城郊外出现了狂躁精怪，打败他们，这是你们的第一课！”",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101012)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10101,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 1200,
			["MonsterId"] = 101012,
			["Name"] = "关卡地图1_1",
			["NeedPower"] = 6,
			["PassShow"] = 1,
			["ShapeId"] = 10000,
			["ShowName"] = "圣城郊区",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
		},
		[101010] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10101)
end,
			},
			["ChatInfo"] = 10101,
			["Desc"] = "“我的奥义一定很厉害！”#r罗宾顶了顶毡帽，露出标志性的邪笑。",
			["Drama"] = "新奥义教学_罗宾",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 100027)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 101010,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 1200,
			["MonsterId"] = 101012,
			["Name"] = "关卡地图1_100",
			["NeedPower"] = 6,
			["PassShow"] = 1,
			["ShapeId"] = 10000,
			["ShowName"] = "罗宾奥义",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
		},
		[10102] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,101010)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "圣城图书馆发生了爆炸，调查员在爆炸现发现地精踪迹。",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101023)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10102,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 1300,
			["MonsterId"] = 101023,
			["Name"] = "关卡地图1_2",
			["NeedPower"] = 6,
			["ShapeId"] = 4004,
			["ShowName"] = "爆炸事件",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
		},
		[10103] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10102)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "小分队带着玲珑的手谕找到了吕布，试图从吕布处得到有效信息。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101031)
end,
				function (API, OP)
	return API[1](OP, 101033)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
					{
						200000,
						5,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10103,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 1483,
			["MonsterId"] = 101033,
			["Name"] = "关卡地图1_3",
			["NeedPower"] = 6,
			["ShapeId"] = 1019,
			["ShowName"] = "吕布",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关总回合数少于20",
				"总剩余血量大于10%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[19](OP,20)
end,
				function (API, OP)
	return API[20](OP,0)
end,
			},
		},
		[101030] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10103)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "“塞拉大叔说我的风里有治愈破碎之心的力量！”#r西鲁芙睁大了双眼跃跃欲试。",
			["Drama"] = "新奥义教学_西鲁芙",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 100028)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
					{
						610001,
						10,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 101030,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 1483,
			["MonsterId"] = 101043,
			["Name"] = "关卡地图1_300",
			["NeedPower"] = 6,
			["PassShow"] = 1,
			["ShapeId"] = 4005,
			["ShowName"] = "西鲁芙奥义",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
		},
		[10104] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,101030)
end,
			},
			["ChatInfo"] = 10111,
			["Desc"] = "众人追踪地精的踪迹，进入珊瑚曲径腹地。",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101043)
end,
			},
			["ExpBonus"] = 100,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
					{
						610001,
						10,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10104,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610101,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 1540,
			["MonsterId"] = 101043,
			["Name"] = "关卡地图1_4",
			["NeedPower"] = 6,
			["ShapeId"] = 4005,
			["ShowName"] = "追踪卷轴",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 100,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于50%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,50)
end,
			},
		},
		[10105] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10104)
end,
			},
			["ChatInfo"] = 10102,
			["Desc"] = "在一筹莫展之际，小分队遇到了同样追寻地精的赏金猎人关银屏。",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101053)
end,
			},
			["ExpBonus"] = 110,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
					{
						610001,
						10,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10105,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610201,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 1540,
			["MonsterId"] = 101053,
			["Name"] = "关卡地图1_5",
			["NeedPower"] = 6,
			["ShapeId"] = 2012,
			["ShowName"] = "关银屏",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 110,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于50%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,50)
end,
			},
		},
		[10106] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10105)
end,
			},
			["ChatInfo"] = 10105,
			["Desc"] = "众人在关银屏的帮助下找到了地精，却意外地发现了事情的真相。",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101063)
end,
			},
			["ExpBonus"] = 110,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
					{
						500001,
						20,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10106,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610201,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 2239,
			["MonsterId"] = 101063,
			["Name"] = "关卡地图1_6",
			["NeedPower"] = 6,
			["ShapeId"] = 4004,
			["ShowName"] = "交易",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["StoryHeroList"] = {
				20010001,
			},
			["SweepItem"] = {
				["CardExp"] = 110,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于50%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,50)
end,
			},
		},
		[10107] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10106)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "洛基承认这场爆炸是他的计划，自此，帝国与圣盟之间的微妙平衡被打破。",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101073)
end,
			},
			["ExpBonus"] = 120,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
					{
						610001,
						10,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10107,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610301,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 2319,
			["MonsterId"] = 101073,
			["Name"] = "关卡地图1_7",
			["NeedPower"] = 6,
			["ShapeId"] = 2006,
			["ShowName"] = "洛基",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["StoryHeroList"] = {
				20010001,
			},
			["SweepItem"] = {
				["CardExp"] = 120,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于50%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,50)
end,
			},
		},
		[10108] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10107)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "关羽与因与其二弟闹出命案而一直逃亡，居然被小分队在珊瑚曲径遇到。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 101082)
end,
				function (API, OP)
	return API[1](OP, 101083)
end,
			},
			["ExpBonus"] = 120,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						1,
					},
					{
						610201,
						1,
					},
					{
						610301,
						1,
					},
					{
						610001,
						10,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10108,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610301,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 2319,
			["MonsterId"] = 101083,
			["Name"] = "关卡地图1_8",
			["NeedPower"] = 6,
			["ShapeId"] = 1017,
			["ShowName"] = "关羽",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["StoryHeroList"] = {
				20010001,
			},
			["SweepItem"] = {
				["CardExp"] = 120,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于50%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,50)
end,
			},
		},
		[10201] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10108)
end,
			},
			["ChatInfo"] = 10203,
			["Desc"] = "小分队收到求助信后进入精灵森林，却发现昔日的森林已经变成沼泽。",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102013)
end,
			},
			["ExpBonus"] = 120,
			["FirstBonus"] = {
				["Item"] = {
					{
						610101,
						2,
					},
					{
						610201,
						2,
					},
					{
						610301,
						2,
					},
					{
						610001,
						10,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10201,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610102,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 2399,
			["MonsterId"] = 102013,
			["Name"] = "关卡地图2_1",
			["NeedPower"] = 6,
			["ShapeId"] = 6005,
			["ShowName"] = "腐坏的森林",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["StoryHeroList"] = {
				20010001,
			},
			["SweepItem"] = {
				["CardExp"] = 120,
			},
		},
		[10202] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10201)
end,
			},
			["ChatInfo"] = 10205,
			["Desc"] = "在精灵嘉里的带领下，小分队找到了发出求救信之人。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102022)
end,
				function (API, OP)
	return API[1](OP, 102023)
end,
			},
			["ExpBonus"] = 120,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10202,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610102,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 2479,
			["MonsterId"] = 102023,
			["Name"] = "关卡地图2_2",
			["NeedPower"] = 6,
			["ShapeId"] = 2005,
			["ShowName"] = "雅典娜",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 120,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关总回合数少于20",
				"总剩余血量大于50%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[19](OP,10)
end,
				function (API, OP)
	return API[20](OP,50)
end,
			},
		},
		[10203] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10202)
end,
			},
			["ChatInfo"] = 10208,
			["Desc"] = "在精灵古道中，西鲁芙意外地发现了有两个罗宾汉的身影。",
			["EventTypes"] = {
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102033)
end,
			},
			["ExpBonus"] = 120,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10203,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610102,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 2559,
			["MonsterId"] = 102033,
			["Name"] = "关卡地图2_3",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "精灵古道",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 120,
			},
		},
		[10204] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10203)
end,
			},
			["ChatInfo"] = 10209,
			["Desc"] = "在雅典娜的口述中得知，精灵女王遇到了危险，而目前却失去了与其联系。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102042)
end,
				function (API, OP)
	return API[1](OP, 102043)
end,
			},
			["ExpBonus"] = 120,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10204,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610102,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 3087,
			["MonsterId"] = 102043,
			["Name"] = "关卡地图2_4",
			["NeedPower"] = 6,
			["ShapeId"] = 2016,
			["ShowName"] = "强尼",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 120,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关总回合数少于20",
				"总剩余血量大于50%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[19](OP,10)
end,
				function (API, OP)
	return API[20](OP,50)
end,
			},
		},
		[10205] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10204)
end,
			},
			["ChatInfo"] = 10210,
			["Desc"] = "在精灵古道，众人居然遇到了帝国将军沙拉曼。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102052)
end,
				function (API, OP)
	return API[1](OP, 102053)
end,
			},
			["ExpBonus"] = 120,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10205,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610202,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 3732,
			["MonsterId"] = 102053,
			["Name"] = "关卡地图2_5",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "精灵古道",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 120,
			},
		},
		[10206] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10205)
end,
			},
			["ChatInfo"] = 10211,
			["Desc"] = "精灵古道出现秘宝的消息引来了各路夺宝者，只是精灵女王的下落依旧不明。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102062)
end,
				function (API, OP)
	return API[1](OP, 102063)
end,
			},
			["ExpBonus"] = 130,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10206,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610202,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 5233,
			["MonsterId"] = 102063,
			["Name"] = "关卡地图2_6",
			["NeedPower"] = 6,
			["ShapeId"] = 1014,
			["ShowName"] = "沙拉曼",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 130,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时最多三个英雄阵亡",
				"总剩余血量大于10%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,3)
end,
				function (API, OP)
	return API[20](OP,10)
end,
			},
		},
		[10207] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10206)
end,
			},
			["ChatInfo"] = 10213,
			["Desc"] = "自沙拉曼处一无所获，罗宾想起了一桩传言，或许对精灵女王的下落有所帮助。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102072)
end,
				function (API, OP)
	return API[1](OP, 102073)
end,
			},
			["ExpBonus"] = 130,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
					{
						200000,
						20,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10207,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610202,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 4574,
			["MonsterId"] = 102073,
			["Name"] = "关卡地图2_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "出发",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 130,
			},
		},
		[10208] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10207)
end,
			},
			["ChatInfo"] = 10214,
			["Desc"] = "小分队很幸运地在沼泽腹地找到了瓦尔基里，在这里找寻到了精灵女王的踪迹。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102082)
end,
				function (API, OP)
	return API[1](OP, 102083)
end,
			},
			["ExpBonus"] = 130,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10208,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610202,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 4995,
			["MonsterId"] = 102083,
			["Name"] = "关卡地图2_8",
			["NeedPower"] = 6,
			["ShapeId"] = 2007,
			["ShowName"] = "瓦尔基里",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 130,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时最多三个英雄阵亡",
				"总剩余血量大于10%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,3)
end,
				function (API, OP)
	return API[20](OP,10)
end,
			},
		},
		[10209] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10208)
end,
			},
			["ChatInfo"] = 10215,
			["Desc"] = "沿着在瓦尔基里处找到的线索，小分队找到了囚禁精灵女王之所。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102092)
end,
				function (API, OP)
	return API[1](OP, 102093)
end,
			},
			["ExpBonus"] = 130,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10209,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610302,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 5416,
			["MonsterId"] = 102093,
			["Name"] = "关卡地图2_9",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "寻找线索",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 130,
			},
		},
		[10210] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10209)
end,
			},
			["ChatInfo"] = 10215,
			["Desc"] = "小分队解救出了精灵女王，精灵女王对小分队表示感谢。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102102)
end,
				function (API, OP)
	return API[1](OP, 102103)
end,
			},
			["ExpBonus"] = 130,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10210,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610302,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 5416,
			["MonsterId"] = 102103,
			["Name"] = "关卡地图2_10",
			["NeedPower"] = 6,
			["ShapeId"] = 6002,
			["ShowName"] = "精灵女王",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 130,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时最多三个英雄阵亡",
				"总剩余血量大于10%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,3)
end,
				function (API, OP)
	return API[20](OP,10)
end,
			},
		},
		[10211] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10210)
end,
			},
			["ChatInfo"] = 10215,
			["Desc"] = "众人来到水源试图解决精灵森林腐烂之谜，西鲁芙却在此有了意想不到的发现。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102112)
end,
				function (API, OP)
	return API[1](OP, 102113)
end,
			},
			["ExpBonus"] = 130,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						11,
					},
					{
						200000,
						30,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10211,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610302,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 5416,
			["MonsterId"] = 102113,
			["Name"] = "关卡地图2_11",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "宁福河水源",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 130,
			},
		},
		[10212] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10211)
end,
			},
			["ChatInfo"] = 10215,
			["Desc"] = "当西鲁芙拿到埋在水源的阿卡西珠宝，精灵女王突然出现，牵引出另一个隐秘。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 102122)
end,
				function (API, OP)
	return API[1](OP, 102123)
end,
			},
			["ExpBonus"] = 130,
			["FirstBonus"] = {
				["Item"] = {
					{
						610102,
						1,
					},
					{
						610202,
						1,
					},
					{
						610302,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10212,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610302,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 6800,
			["MonsterId"] = 102123,
			["Name"] = "关卡地图2_12",
			["NeedPower"] = 6,
			["ShapeId"] = 6002,
			["ShowName"] = "阿卡西珠宝",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 130,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时最多一个英雄阵亡",
				"总剩余血量大于10%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,1)
end,
				function (API, OP)
	return API[20](OP,10)
end,
			},
		},
		[10301] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10212)
end,
			},
			["ChatInfo"] = 10301,
			["Desc"] = "众人在玲珑的指引下，去往帕雅神庙寻找解决大祭司。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103012)
end,
				function (API, OP)
	return API[1](OP, 103013)
end,
			},
			["ExpBonus"] = 140,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
					{
						3000201,
						6,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10301,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 5600,
			["MonsterId"] = 103013,
			["Name"] = "关卡地图3_1",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "初入神庙",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 140,
			},
		},
		[10302] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10301)
end,
			},
			["ChatInfo"] = 10303,
			["Desc"] = "帝国军队已经在此地驻扎，亚瑟意外地发现对方居然是自己族人。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103032)
end,
				function (API, OP)
	return API[1](OP, 103033)
end,
			},
			["ExpBonus"] = 140,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10302,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 5784,
			["MonsterId"] = 103033,
			["Name"] = "关卡地图3_3",
			["NeedPower"] = 6,
			["ShapeId"] = 1008,
			["ShowName"] = "拉琪亚",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 140,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10303] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10302)
end,
			},
			["ChatInfo"] = 10304,
			["Desc"] = "当走到帕雅神庙附近时，却发现进入神庙的道路已经被截断。",
			["EnterCheck"] = {
				function (API, OP, CardUidList)
	return API[24](OP,CardUidList,13,8)
end,
			},
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103042)
end,
				function (API, OP)
	return API[1](OP, 103043)
end,
			},
			["ExpBonus"] = 140,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10303,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 5968,
			["MonsterId"] = 103042,
			["Name"] = "关卡地图3_4",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "道路被封",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 140,
			},
		},
		[10304] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10303)
end,
			},
			["ChatInfo"] = 10305,
			["Desc"] = "受到神秘人的委托，地灵诺姆带着小分队潜入到了神庙内部。",
			["EnterCheck"] = {
				function (API, OP, CardUidList)
	return API[24](OP,CardUidList,13,8)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103061)
end,
				function (API, OP)
	return API[1](OP, 103062)
end,
				function (API, OP)
	return API[1](OP, 103063)
end,
			},
			["ExpBonus"] = 140,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
					{
						4000001,
						2,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10304,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 6152,
			["MonsterId"] = 103063,
			["Name"] = "关卡地图3_6",
			["NeedPower"] = 6,
			["ShapeId"] = 1010,
			["ShowName"] = "接引人诺姆",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 140,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10305] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10304)
end,
			},
			["ChatInfo"] = 10306,
			["Desc"] = "将小分队护送到安全之地后，盖布告诉了小分队神秘人留下的另一个线索。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103072)
end,
				function (API, OP)
	return API[1](OP, 103073)
end,
			},
			["ExpBonus"] = 145,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10305,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 6836,
			["MonsterId"] = 103072,
			["Name"] = "关卡地图3_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "旧殿地宫",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 145,
			},
		},
		[10306] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10305)
end,
			},
			["ChatInfo"] = 10308,
			["Desc"] = "众人决议再相信神秘人一次，按照线索进入地宫，却发现驻守在此地的是老熟人吕布。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103091)
end,
				function (API, OP)
	return API[1](OP, 103092)
end,
				function (API, OP)
	return API[1](OP, 103093)
end,
			},
			["ExpBonus"] = 145,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10306,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 7538,
			["MonsterId"] = 103093,
			["Name"] = "关卡地图3_9",
			["NeedPower"] = 6,
			["ShapeId"] = 1019,
			["ShowName"] = "酒鬼吕布",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 145,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10307] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10306)
end,
			},
			["ChatInfo"] = 10309,
			["Desc"] = "吕布已经成日与酒为伴，对外事不闻不问。不过这次放过了小分队，不知是有意无意？",
			["EnterCheck"] = {
				function (API, OP, CardUidList)
	return API[24](OP,CardUidList,13,10)
end,
			},
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103102)
end,
				function (API, OP)
	return API[1](OP, 103103)
end,
			},
			["ExpBonus"] = 145,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10307,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 7804,
			["MonsterId"] = 103102,
			["Name"] = "关卡地图3_10",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "陷阱",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 145,
			},
		},
		[10308] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10307)
end,
			},
			["ChatInfo"] = 10310,
			["Desc"] = "在一筹莫展的时候，西鲁芙发现了一个很熟悉的身影……",
			["EnterCheck"] = {
				function (API, OP, CardUidList)
	return API[24](OP,CardUidList,13,10)
end,
			},
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103121)
end,
				function (API, OP)
	return API[1](OP, 103122)
end,
				function (API, OP)
	return API[1](OP, 103123)
end,
			},
			["ExpBonus"] = 145,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10308,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 8070,
			["MonsterId"] = 103123,
			["Name"] = "关卡地图3_12",
			["NeedPower"] = 6,
			["ShapeId"] = 2014,
			["ShowName"] = "窃贼斯德尼",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 145,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10309] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10308)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10311,
			["Desc"] = "从诺姆口里得知地牢的存在，小分队决定前方碰碰运气。当然这个消息必须是有代价。",
			["EnterCheck"] = {
				function (API, OP, CardUidList)
	return API[24](OP,CardUidList,13,10)
end,
			},
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103132)
end,
				function (API, OP)
	return API[1](OP, 103133)
end,
			},
			["ExpBonus"] = 150,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
					{
						5000001,
						20,
					},
					{
						5000006,
						2,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10309,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 8636,
			["MonsterId"] = 103132,
			["Name"] = "关卡地图3_13",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "去往牢笼",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 150,
			},
		},
		[10310] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10309)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10313,
			["Desc"] = "从地牢深处传来声响，众人屏住呼吸，听到的名字似乎很有点熟悉……",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103151)
end,
				function (API, OP)
	return API[1](OP, 103152)
end,
				function (API, OP)
	return API[1](OP, 103153)
end,
			},
			["ExpBonus"] = 150,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10310,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 9602,
			["MonsterId"] = 103153,
			["Name"] = "关卡地图3_15",
			["NeedPower"] = 6,
			["ShapeId"] = 1005,
			["ShowName"] = "嗜血阿瑞斯",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 150,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10311] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10310)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10314,
			["Desc"] = "众人在阿瑞斯的手下救下了雅染，发现雅染也是暗中一路相助的神秘人。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103172)
end,
				function (API, OP)
	return API[1](OP, 103173)
end,
			},
			["ExpBonus"] = 150,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10311,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 9982,
			["MonsterId"] = 103172,
			["Name"] = "关卡地图3_17",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "逃离牢笼",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 150,
			},
		},
		[10312] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10311)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10315,
			["Desc"] = "众人被追赶至帕雅山巅，前方是通往圣光之巢的唯一道路。在古道旁，夏侯将军扶刀而立。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 103181)
end,
				function (API, OP)
	return API[1](OP, 103182)
end,
				function (API, OP)
	return API[1](OP, 103183)
end,
			},
			["ExpBonus"] = 150,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10312,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 10534,
			["MonsterId"] = 103183,
			["Name"] = "关卡地图3_18",
			["NeedPower"] = 6,
			["ShapeId"] = 1003,
			["ShowName"] = "夏侯惇",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 150,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10401] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10312)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10401,
			["Desc"] = "西鲁芙一行赶回圣光之巢，却意外地发现原本隐于结界后的巢穴出现在了世人面前。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104012)
end,
				function (API, OP)
	return API[1](OP, 104013)
end,
			},
			["ExpBonus"] = 160,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10401,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 10624,
			["MonsterId"] = 104012,
			["Name"] = "关卡地图4_1",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "初入巢穴",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 160,
			},
		},
		[10402] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10401)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10402,
			["Desc"] = "得知斑斓被入侵者抓捕的消息，西鲁芙焦灼而坚定地表示要去救斑斓。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104022)
end,
				function (API, OP)
	return API[1](OP, 104023)
end,
			},
			["ExpBonus"] = 160,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10402,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 10714,
			["MonsterId"] = 104022,
			["Name"] = "关卡地图4_2",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "追寻线索",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 160,
			},
		},
		[10403] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10402)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10403,
			["Desc"] = "当众人追着线索追到孙尚香处，泰瑞认出是孙尚香带着军队抓捕了斑斓。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104031)
end,
				function (API, OP)
	return API[1](OP, 104032)
end,
				function (API, OP)
	return API[1](OP, 104033)
end,
			},
			["ExpBonus"] = 160,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10403,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 10804,
			["MonsterId"] = 104033,
			["Name"] = "关卡地图4_3",
			["NeedPower"] = 6,
			["ShapeId"] = 3008,
			["ShowName"] = "营救斑斓",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 160,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10404] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10403)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10404,
			["Desc"] = "阔别已久的故乡被外敌肆意践踏得已看不出昔日的模样，西鲁芙哼出了德鲁伊古老歌谣。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104042)
end,
				function (API, OP)
	return API[1](OP, 104043)
end,
			},
			["ExpBonus"] = 160,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10404,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 10894,
			["MonsterId"] = 104042,
			["Name"] = "关卡地图4_4",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "失去宁静",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 160,
			},
		},
		[10405] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10404)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10404,
			["Desc"] = "一路上有四处游走的巡逻者，帝国军队的分布也越密集。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104052)
end,
				function (API, OP)
	return API[1](OP, 104053)
end,
			},
			["ExpBonus"] = 160,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10405,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 10984,
			["MonsterId"] = 104052,
			["Name"] = "关卡地图4_5",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "斑斓下落",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 160,
			},
		},
		[10406] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10405)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10405,
			["Desc"] = "自珊瑚曲径事件后，众人在此地再次见到了洛基。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104061)
end,
				function (API, OP)
	return API[1](OP, 104062)
end,
				function (API, OP)
	return API[1](OP, 104063)
end,
			},
			["ExpBonus"] = 160,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10406,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 11074,
			["MonsterId"] = 104063,
			["Name"] = "关卡地图4_6",
			["NeedPower"] = 6,
			["ShapeId"] = 2006,
			["ShowName"] = "洛基",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 160,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[104061] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10406)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10405,
			["Desc"] = "我发现我真的很适合吐槽。",
			["EventTypes"] = {
				0,
			},
			["Events"] = {
				function (API, OP)
	return API[23](OP, 500002)
end,
			},
			["ExpBonus"] = 0,
			["FirstBonus"] = {
				["Gold"] = 20,
				["Money"] = 10000,
			},
			["Id"] = 104061,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610103,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 100,
			["MiniType"] = 1,
			["MonsterId"] = 104053,
			["Name"] = "关卡地图4_61",
			["NeedPower"] = 0,
			["ShapeId"] = 10001,
			["ShowName"] = "奖励关卡I",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 0,
			},
			["WinCondiDesc"] = {
				"进入小游戏",
				"斩杀个数达到5",
				"斩杀个数达到8",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[22](OP,0)
end,
				function (API, OP)
	return API[22](OP,5)
end,
				function (API, OP)
	return API[22](OP,8)
end,
			},
		},
		[10407] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,104061)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10406,
			["Desc"] = "众人救出了斑斓，并从斑斓口中得知了事情的始末。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104072)
end,
				function (API, OP)
	return API[1](OP, 104073)
end,
			},
			["ExpBonus"] = 170,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10407,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 11262,
			["MonsterId"] = 104072,
			["Name"] = "关卡地图4_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "被驱逐",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 170,
			},
		},
		[10408] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10407)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10407,
			["Desc"] = "而令西鲁芙没料到的是，斑斓并不想让他们插手圣光之巢之事。西鲁芙决定自己寻找失踪的塞拉族长。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104082)
end,
				function (API, OP)
	return API[1](OP, 104083)
end,
			},
			["ExpBonus"] = 170,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10408,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 11528,
			["MonsterId"] = 104082,
			["Name"] = "关卡地图4_8",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "寻找塞拉",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 170,
			},
		},
		[10409] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10408)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10408,
			["Desc"] = "西鲁芙不相信塞拉族长会这样做，决定离开寻找真相。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104091)
end,
				function (API, OP)
	return API[1](OP, 104092)
end,
				function (API, OP)
	return API[1](OP, 104093)
end,
			},
			["ExpBonus"] = 170,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10409,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 11794,
			["MonsterId"] = 104093,
			["Name"] = "关卡地图4_9",
			["NeedPower"] = 6,
			["ShapeId"] = 3017,
			["ShowName"] = "贾诩",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 170,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10410] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10409)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10409,
			["Desc"] = "斑斓利用魔法石作为交易让贾诩将众人赶出圣光之巢，得知真相后众人震惊无比。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104102)
end,
				function (API, OP)
	return API[1](OP, 104103)
end,
			},
			["ExpBonus"] = 170,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10410,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 12060,
			["MonsterId"] = 104102,
			["Name"] = "关卡地图4_10",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "深入",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 170,
			},
		},
		[10411] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10410)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10409,
			["Desc"] = "塞拉下落不明，而斑斓却让众人离开。这更加坚定了西鲁芙寻找下去的决心。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104112)
end,
				function (API, OP)
	return API[1](OP, 104113)
end,
			},
			["ExpBonus"] = 170,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10411,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 12326,
			["MonsterId"] = 104112,
			["Name"] = "关卡地图4_11",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "斑斓的用意",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 170,
			},
		},
		[10412] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10411)
end,
				function (API, OP)
	return API[2](OP,14)
end,
			},
			["ChatInfo"] = 10410,
			["Desc"] = "再次与小分队碰面，瓦尔基里表现得十分感兴趣。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104121)
end,
				function (API, OP)
	return API[1](OP, 104122)
end,
				function (API, OP)
	return API[1](OP, 104123)
end,
			},
			["ExpBonus"] = 170,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10412,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 12592,
			["MonsterId"] = 104123,
			["Name"] = "关卡地图4_12",
			["NeedPower"] = 6,
			["ShapeId"] = 2007,
			["ShowName"] = "瓦尔基里",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 170,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[104121] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10412)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10410,
			["Desc"] = "我就是一个奖励关卡，非常好玩的奖励关卡！",
			["EventTypes"] = {
				0,
			},
			["Events"] = {
				function (API, OP)
	return API[23](OP, 500002)
end,
			},
			["ExpBonus"] = 0,
			["FirstBonus"] = {
				["Gold"] = 20,
				["Money"] = 10000,
			},
			["Id"] = 104121,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610203,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 100,
			["MiniType"] = 2,
			["MonsterId"] = 104103,
			["Name"] = "关卡地图4_121",
			["NeedPower"] = 0,
			["ShapeId"] = 10001,
			["ShowName"] = "奖励关卡II",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 0,
			},
			["WinCondiDesc"] = {
				"进入小游戏",
				"没被花吃掉",
				"拿到第一名",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[25](OP,1)
end,
				function (API, OP)
	return API[25](OP,2)
end,
				function (API, OP)
	return API[25](OP,3)
end,
			},
		},
		[10413] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,104121)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10411,
			["Desc"] = "“我想到了一个地方。”西鲁芙突然停下来，说道。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104132)
end,
				function (API, OP)
	return API[1](OP, 104133)
end,
			},
			["ExpBonus"] = 180,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10413,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 13260,
			["MonsterId"] = 104132,
			["Name"] = "关卡地图4_13",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "巢穴深处",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 180,
			},
		},
		[10414] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10413)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10412,
			["Desc"] = "塞拉祭坛原名为月光祭坛，后来族长塞拉以自己的名称命名。罗宾汉嘟囔了几句，惹来西鲁芙白眼。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104142)
end,
				function (API, OP)
	return API[1](OP, 104143)
end,
			},
			["ExpBonus"] = 180,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10414,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 13520,
			["MonsterId"] = 104142,
			["Name"] = "关卡地图4_14",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "塞拉祭坛",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 180,
			},
		},
		[10415] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10414)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10413,
			["Desc"] = "塞拉的意志太强，一时无法得到德鲁伊之石的下落。此时，号称三国第一美人的甄姬出场……",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104151)
end,
				function (API, OP)
	return API[1](OP, 104152)
end,
				function (API, OP)
	return API[1](OP, 104153)
end,
			},
			["ExpBonus"] = 180,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10415,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 13780,
			["MonsterId"] = 104153,
			["Name"] = "关卡地图4_15",
			["NeedPower"] = 6,
			["ShapeId"] = 2004,
			["ShowName"] = "甄姬",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 180,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10416] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10415)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10414,
			["Desc"] = "众人在甄姬的诱惑下将塞拉救出，清醒后的塞拉让西鲁芙召集族人。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104162)
end,
				function (API, OP)
	return API[1](OP, 104163)
end,
			},
			["ExpBonus"] = 180,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10416,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 14040,
			["MonsterId"] = 104162,
			["Name"] = "关卡地图4_16",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "救出塞拉",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 180,
			},
		},
		[10417] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10416)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10414,
			["Desc"] = "只是没料到，对于力量的追求已经扭曲了人心。在塞拉拿出德鲁伊之石之时，斑斓闯入。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104172)
end,
				function (API, OP)
	return API[1](OP, 104173)
end,
			},
			["ExpBonus"] = 180,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10417,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 14300,
			["MonsterId"] = 104172,
			["Name"] = "关卡地图4_17",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "绿叶崖",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 180,
			},
		},
		[10418] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10417)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10415,
			["Desc"] = "西鲁芙夺回了能量石，并按照塞拉的要求打开了传送门。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 104181)
end,
				function (API, OP)
	return API[1](OP, 104182)
end,
				function (API, OP)
	return API[1](OP, 104183)
end,
			},
			["ExpBonus"] = 180,
			["FirstBonus"] = {
				["Item"] = {
					{
						610103,
						1,
					},
					{
						610203,
						1,
					},
					{
						610303,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10418,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 16560,
			["MonsterId"] = 104183,
			["Name"] = "关卡地图4_18",
			["NeedPower"] = 6,
			["ShapeId"] = 3005,
			["ShowName"] = "黄月英",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 180,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[104181] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10418)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10415,
			["Desc"] = "我就是一个奖励关卡，非常好玩的奖励关卡！",
			["EventTypes"] = {
				0,
			},
			["Events"] = {
				function (API, OP)
	return API[23](OP, 500002)
end,
			},
			["ExpBonus"] = 0,
			["FirstBonus"] = {
				["Gold"] = 20,
				["Money"] = 10000,
			},
			["Id"] = 104181,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610303,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 100,
			["MiniType"] = 1,
			["MonsterId"] = 104153,
			["Name"] = "关卡地图4_181",
			["NeedPower"] = 0,
			["ShapeId"] = 10001,
			["ShowName"] = "奖励关卡III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 0,
			},
			["WinCondiDesc"] = {
				"进入小游戏",
				"斩杀个数达到8",
				"斩杀个数达到14",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[22](OP,0)
end,
				function (API, OP)
	return API[22](OP,8)
end,
				function (API, OP)
	return API[22](OP,14)
end,
			},
		},
		[10501] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,104181)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10501,
			["Desc"] = "带着解开“蒲英失踪谜案”的目的，小分队来到了荒原。正当西鲁芙感叹路程顺利之时，前方传来呼叫声。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105011)
end,
				function (API, OP)
	return API[1](OP, 105012)
end,
				function (API, OP)
	return API[1](OP, 105013)
end,
			},
			["ExpBonus"] = 190,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10501,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610104,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 14560,
			["MonsterId"] = 105012,
			["Name"] = "关卡地图5_1",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "进入蒲英",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 190,
			},
		},
		[10502] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10501)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10502,
			["Desc"] = "小分队救下受到追击的陌生少女，从她口中得知是出来寻找失踪的未婚夫。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105021)
end,
				function (API, OP)
	return API[1](OP, 105022)
end,
				function (API, OP)
	return API[1](OP, 105023)
end,
			},
			["ExpBonus"] = 190,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10502,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610104,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 14984,
			["MonsterId"] = 105022,
			["Name"] = "关卡地图5_2",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "荒原少女",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 190,
			},
		},
		[10503] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10502)
end,
				function (API, OP)
	return API[2](OP,16)
end,
			},
			["ChatInfo"] = 10503,
			["Desc"] = "沙拉曼将军的士兵也卷入了失踪谜案。对于出现在荒原附近的人，其做法是统统抓起来拷问。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105031)
end,
				function (API, OP)
	return API[1](OP, 105032)
end,
				function (API, OP)
	return API[1](OP, 105033)
end,
			},
			["ExpBonus"] = 190,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10503,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610104,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 15408,
			["MonsterId"] = 105033,
			["Name"] = "关卡地图5_3",
			["NeedPower"] = 6,
			["ShapeId"] = 1014,
			["ShowName"] = "沙拉曼",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 190,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10504] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10503)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10504,
			["Desc"] = "在玛亚的热情建议下，小分队跟随她去往农庄歇息。刚进入农庄，就接到又有人失踪的消息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105041)
end,
				function (API, OP)
	return API[1](OP, 105042)
end,
				function (API, OP)
	return API[1](OP, 105043)
end,
			},
			["ExpBonus"] = 190,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10504,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610104,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 15832,
			["MonsterId"] = 105042,
			["Name"] = "关卡地图5_4",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "农庄",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 190,
			},
		},
		[10505] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10504)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10504,
			["Desc"] = "带着玛亚热切的渴望，小分队再次来到原野进行调查。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105051)
end,
				function (API, OP)
	return API[1](OP, 105052)
end,
				function (API, OP)
	return API[1](OP, 105053)
end,
			},
			["ExpBonus"] = 190,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10505,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610104,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 16256,
			["MonsterId"] = 105052,
			["Name"] = "关卡地图5_5",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "荒原",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 190,
			},
		},
		[10506] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10505)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10506,
			["Desc"] = "在地精哈斯的指引下，众人来到了地精曾经的家园，却见到了一个意想不到的人。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105061)
end,
				function (API, OP)
	return API[1](OP, 105062)
end,
				function (API, OP)
	return API[1](OP, 105063)
end,
			},
			["ExpBonus"] = 190,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10506,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610104,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 16680,
			["MonsterId"] = 105063,
			["Name"] = "关卡地图5_6",
			["NeedPower"] = 6,
			["ShapeId"] = 1005,
			["ShowName"] = "阿瑞斯",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 190,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[105061] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10506)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10506,
			["Desc"] = "我就是一个奖励关卡，非常好玩的奖励关卡！",
			["EventTypes"] = {
				0,
			},
			["Events"] = {
				function (API, OP)
	return API[23](OP, 500002)
end,
			},
			["ExpBonus"] = 0,
			["FirstBonus"] = {
				["Gold"] = 20,
				["Money"] = 10000,
			},
			["Id"] = 105061,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610104,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 100,
			["MiniType"] = 1,
			["MonsterId"] = 105063,
			["Name"] = "关卡地图5_61",
			["NeedPower"] = 0,
			["ShapeId"] = 10001,
			["ShowName"] = "奖励关卡I",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 0,
			},
			["WinCondiDesc"] = {
				"进入小游戏",
				"斩杀个数达到6",
				"斩杀个数达到10",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[22](OP,0)
end,
				function (API, OP)
	return API[22](OP,6)
end,
				function (API, OP)
	return API[22](OP,10)
end,
			},
		},
		[10507] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,105061)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10507,
			["Desc"] = "当得知是玛亚拜托众人来寻找自己之时，鲁夫放弃了逃走的机会。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105071)
end,
				function (API, OP)
	return API[1](OP, 105072)
end,
				function (API, OP)
	return API[1](OP, 105073)
end,
			},
			["ExpBonus"] = 200,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10507,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610204,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 17528,
			["MonsterId"] = 105072,
			["Name"] = "关卡地图5_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "巨魔山脉",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 200,
			},
		},
		[10508] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10507)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10508,
			["Desc"] = "玛亚得知了鲁夫的位置后，决定独自前往寻找鲁夫。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105081)
end,
				function (API, OP)
	return API[1](OP, 105082)
end,
				function (API, OP)
	return API[1](OP, 105083)
end,
			},
			["ExpBonus"] = 200,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10508,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610204,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 17952,
			["MonsterId"] = 105082,
			["Name"] = "关卡地图5_8",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "寻找鲁夫",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 200,
			},
		},
		[10509] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10508)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10509,
			["Desc"] = "玛亚离开了众人独自寻找鲁夫的踪迹。#r“她会不会遇到危险呀？”西鲁芙显得十分揪心。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105091)
end,
				function (API, OP)
	return API[1](OP, 105092)
end,
				function (API, OP)
	return API[1](OP, 105093)
end,
			},
			["ExpBonus"] = 200,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10509,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610204,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 21376,
			["MonsterId"] = 105093,
			["Name"] = "关卡地图5_9",
			["NeedPower"] = 6,
			["ShapeId"] = 1013,
			["ShowName"] = "周泰",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 200,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10510] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10509)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10510,
			["Desc"] = "周泰的要塞遭受爆炸袭击，所有的劳工都趁机逃脱。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105101)
end,
				function (API, OP)
	return API[1](OP, 105102)
end,
				function (API, OP)
	return API[1](OP, 105103)
end,
			},
			["ExpBonus"] = 200,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10510,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610204,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 18800,
			["MonsterId"] = 105102,
			["Name"] = "关卡地图5_10",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "要塞爆炸",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 200,
			},
		},
		[10511] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10510)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10511,
			["Desc"] = "罗宾离队探寻得到的消息是，地灵诺姆也在调查要塞爆炸事件。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105111)
end,
				function (API, OP)
	return API[1](OP, 105112)
end,
				function (API, OP)
	return API[1](OP, 105113)
end,
			},
			["ExpBonus"] = 200,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10511,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610204,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 19224,
			["MonsterId"] = 105112,
			["Name"] = "关卡地图5_11",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "罗宾调查",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 200,
			},
		},
		[10512] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10511)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10512,
			["Desc"] = "地灵诺姆见到西西很高兴，同时也告诉了他们一个震撼的消息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105121)
end,
				function (API, OP)
	return API[1](OP, 105122)
end,
				function (API, OP)
	return API[1](OP, 105123)
end,
			},
			["ExpBonus"] = 200,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10512,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610204,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 19648,
			["MonsterId"] = 105123,
			["Name"] = "关卡地图5_12",
			["NeedPower"] = 6,
			["ShapeId"] = 1010,
			["ShowName"] = "诺姆",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 200,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[105121] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10512)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10512,
			["Desc"] = "我就是一个奖励关卡，非常好玩的奖励关卡！",
			["EventTypes"] = {
				0,
			},
			["Events"] = {
				function (API, OP)
	return API[23](OP, 500002)
end,
			},
			["ExpBonus"] = 0,
			["FirstBonus"] = {
				["Gold"] = 20,
				["Money"] = 10000,
			},
			["Id"] = 105121,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610204,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 100,
			["MiniType"] = 2,
			["MonsterId"] = 105123,
			["Name"] = "关卡地图5_121",
			["NeedPower"] = 0,
			["ShapeId"] = 10001,
			["ShowName"] = "奖励关卡II",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 0,
			},
			["WinCondiDesc"] = {
				"进入小游戏",
				"没被花吃掉",
				"拿到第一名",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[25](OP,1)
end,
				function (API, OP)
	return API[25](OP,2)
end,
				function (API, OP)
	return API[25](OP,3)
end,
			},
		},
		[10513] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,105121)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10513,
			["Desc"] = "听到地灵诺姆的描述，众人想起了玛亚。于是众人决议回到蒲英小镇。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105131)
end,
				function (API, OP)
	return API[1](OP, 105132)
end,
				function (API, OP)
	return API[1](OP, 105133)
end,
			},
			["ExpBonus"] = 210,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10513,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610304,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 20496,
			["MonsterId"] = 105132,
			["Name"] = "关卡地图5_13",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "返回小镇",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 210,
			},
		},
		[10514] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10513)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10514,
			["Desc"] = "此时玛亚出现，很焦急地说找到了鲁夫的下落。请求小分队去帮忙救助鲁夫。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105141)
end,
				function (API, OP)
	return API[1](OP, 105142)
end,
				function (API, OP)
	return API[1](OP, 105143)
end,
			},
			["ExpBonus"] = 210,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10514,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610304,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 20920,
			["MonsterId"] = 105142,
			["Name"] = "关卡地图5_14",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "玛亚出现",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 210,
			},
		},
		[10515] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10514)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10515,
			["Desc"] = "当众人在玛亚的带领下找到了鲁夫，鲁夫却昏迷着，而贾诩似乎在他体内取什么宝贝。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105151)
end,
				function (API, OP)
	return API[1](OP, 105152)
end,
				function (API, OP)
	return API[1](OP, 105153)
end,
			},
			["ExpBonus"] = 210,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10515,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610304,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 21344,
			["MonsterId"] = 105153,
			["Name"] = "关卡地图5_15",
			["NeedPower"] = 6,
			["ShapeId"] = 3017,
			["ShowName"] = "贾诩",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 210,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10516] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10515)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10513,
			["Desc"] = "“……”鲁夫被救醒后转头就走，玛亚追随而去。见着两人消失的背影，罗宾神情晦暗不明。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105161)
end,
				function (API, OP)
	return API[1](OP, 105162)
end,
				function (API, OP)
	return API[1](OP, 105163)
end,
			},
			["ExpBonus"] = 210,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10516,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610304,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 21768,
			["MonsterId"] = 105162,
			["Name"] = "关卡地图5_16",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "逃离的鲁夫",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 210,
			},
		},
		[10517] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10516)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10514,
			["Desc"] = "当众人追随而上时，发现玛亚已经拦住了鲁夫。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105171)
end,
				function (API, OP)
	return API[1](OP, 105172)
end,
				function (API, OP)
	return API[1](OP, 105173)
end,
			},
			["ExpBonus"] = 210,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10517,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610304,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 22192,
			["MonsterId"] = 105172,
			["Name"] = "关卡地图5_17",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "追逐",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 210,
			},
		},
		[10518] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10517)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10515,
			["Desc"] = "见着消散的鲁夫，玛亚哭着哭着却渐渐地大笑了起来，声声入耳，摧心泣血。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 105181)
end,
				function (API, OP)
	return API[1](OP, 105182)
end,
				function (API, OP)
	return API[1](OP, 105183)
end,
			},
			["ExpBonus"] = 210,
			["FirstBonus"] = {
				["Item"] = {
					{
						610104,
						1,
					},
					{
						610204,
						1,
					},
					{
						610304,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10518,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610304,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 27286,
			["MonsterId"] = 105183,
			["Name"] = "关卡地图5_18",
			["NeedPower"] = 6,
			["ShapeId"] = 3004,
			["ShowName"] = "哭泣的玛亚",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 210,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[105181] = {
			["BaseNeedPower"] = 0,
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10518)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10515,
			["Desc"] = "我就是一个奖励关卡，非常好玩的奖励关卡！",
			["EventTypes"] = {
				0,
			},
			["Events"] = {
				function (API, OP)
	return API[23](OP, 500002)
end,
			},
			["ExpBonus"] = 0,
			["FirstBonus"] = {
				["Gold"] = 20,
				["Money"] = 10000,
			},
			["Id"] = 105181,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610304,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 100,
			["MiniType"] = 1,
			["MonsterId"] = 105183,
			["Name"] = "关卡地图5_181",
			["NeedPower"] = 0,
			["ShapeId"] = 10001,
			["ShowName"] = "奖励关卡III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 0,
			},
			["WinCondiDesc"] = {
				"进入小游戏",
				"斩杀个数达到10",
				"斩杀个数达到14",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[22](OP,0)
end,
				function (API, OP)
	return API[22](OP,10)
end,
				function (API, OP)
	return API[22](OP,14)
end,
			},
		},
		[10601] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,105181)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10601,
			["Desc"] = "小分队赤鹿之林，恰巧救下了被追捕的赤鹿人。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106011)
end,
				function (API, OP)
	return API[1](OP, 106012)
end,
				function (API, OP)
	return API[1](OP, 106013)
end,
			},
			["ExpBonus"] = 220,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10601,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 22192,
			["MonsterId"] = 106013,
			["Name"] = "关卡地图6_1",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "庇佑之地",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 220,
			},
		},
		[10602] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10601)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10602,
			["Desc"] = "赤鹿族长为了寻找出逃的族人而离开了庇佑之地。在此，向小分队达成了一个协议。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106021)
end,
				function (API, OP)
	return API[1](OP, 106022)
end,
				function (API, OP)
	return API[1](OP, 106023)
end,
			},
			["ExpBonus"] = 220,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10602,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 22698,
			["MonsterId"] = 106023,
			["Name"] = "关卡地图6_2",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "寻找罗宁",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 220,
			},
		},
		[10603] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10602)
end,
				function (API, OP)
	return API[2](OP,20)
end,
			},
			["ChatInfo"] = 10603,
			["Desc"] = "小分队找到了罗宁的踪迹，却发现其为一个陌生人所引诱。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106031)
end,
				function (API, OP)
	return API[1](OP, 106032)
end,
				function (API, OP)
	return API[1](OP, 106033)
end,
			},
			["ExpBonus"] = 220,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10603,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 23204,
			["MonsterId"] = 106033,
			["Name"] = "关卡地图6_3",
			["NeedPower"] = 6,
			["ShapeId"] = 2008,
			["ShowName"] = "德古拉",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 220,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10604] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10603)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10604,
			["Desc"] = "赤鹿族长对小分队表示感谢，将自己知道的关于宝藏的消息说了出来。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106041)
end,
				function (API, OP)
	return API[1](OP, 106042)
end,
				function (API, OP)
	return API[1](OP, 106043)
end,
			},
			["ExpBonus"] = 220,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10604,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 23710,
			["MonsterId"] = 106043,
			["Name"] = "关卡地图6_4",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "宝藏传闻",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 220,
			},
		},
		[10605] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10604)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10605,
			["Desc"] = "小分队对赤鹿族长提供的消息很失望，正准备离开，亚瑟觉察有点不对劲。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106051)
end,
				function (API, OP)
	return API[1](OP, 106052)
end,
				function (API, OP)
	return API[1](OP, 106053)
end,
			},
			["ExpBonus"] = 220,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10605,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 24216,
			["MonsterId"] = 106053,
			["Name"] = "关卡地图6_5",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "失信",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 220,
			},
		},
		[10606] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10605)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10606,
			["Desc"] = "就在小分队离开时，赤鹿小胖墩急匆匆地跑过来，向众人求助。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106061)
end,
				function (API, OP)
	return API[1](OP, 106062)
end,
				function (API, OP)
	return API[1](OP, 106063)
end,
			},
			["ExpBonus"] = 230,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10606,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 24722,
			["MonsterId"] = 106063,
			["Name"] = "关卡地图6_6",
			["NeedPower"] = 6,
			["ShapeId"] = 3017,
			["ShowName"] = "贾诩",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 230,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10607] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10606)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10607,
			["Desc"] = "在小胖墩的带领下，小分队再次来到庇佑之地之外。此地似乎遭受到了劫难，赤鹿断尾颓然地坐在地上。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106071)
end,
				function (API, OP)
	return API[1](OP, 106072)
end,
				function (API, OP)
	return API[1](OP, 106073)
end,
			},
			["ExpBonus"] = 230,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10607,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 25228,
			["MonsterId"] = 106073,
			["Name"] = "关卡地图6_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "获救的断尾",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 230,
			},
		},
		[10608] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10607)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10608,
			["Desc"] = "在罗宾汉的逼问下，赤鹿断尾才将赤鹿宝藏的真正秘密说了出来。而打开废弃宫殿的钥匙，被罗宁偷走。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106081)
end,
				function (API, OP)
	return API[1](OP, 106082)
end,
				function (API, OP)
	return API[1](OP, 106083)
end,
			},
			["ExpBonus"] = 230,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10608,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 25734,
			["MonsterId"] = 106083,
			["Name"] = "关卡地图6_8",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "密室钥匙",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 230,
			},
		},
		[10609] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10608)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10609,
			["Desc"] = "洛基也被这个消息吸引而来，在大肆搜捕赤鹿人的踪迹。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106091)
end,
				function (API, OP)
	return API[1](OP, 106092)
end,
				function (API, OP)
	return API[1](OP, 106093)
end,
			},
			["ExpBonus"] = 230,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10609,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 26240,
			["MonsterId"] = 106093,
			["Name"] = "关卡地图6_9",
			["NeedPower"] = 6,
			["ShapeId"] = 2006,
			["ShowName"] = "洛基",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 230,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10610] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10609)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10610,
			["Desc"] = "众人在洛基的手里夺回了罗宁后逃走，在前路却被孙尚香所阻拦。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106101)
end,
				function (API, OP)
	return API[1](OP, 106102)
end,
				function (API, OP)
	return API[1](OP, 106103)
end,
			},
			["ExpBonus"] = 230,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10610,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 26746,
			["MonsterId"] = 106103,
			["Name"] = "关卡地图6_10",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "摆脱追捕",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 230,
			},
		},
		[10611] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10610)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10611,
			["Desc"] = "孙尚香如实告诉了众人是奉洛基之命来阻拦众人，她却出乎意料地将众人放走。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106111)
end,
				function (API, OP)
	return API[1](OP, 106112)
end,
				function (API, OP)
	return API[1](OP, 106113)
end,
			},
			["ExpBonus"] = 230,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10611,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 27252,
			["MonsterId"] = 106113,
			["Name"] = "关卡地图6_11",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "宝藏真相",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 230,
			},
		},
		[10612] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10611)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10612,
			["Desc"] = "众人逃脱了险境，赤鹿断尾将众人带到了约定之地。此时罗宾却警觉了起来。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106121)
end,
				function (API, OP)
	return API[1](OP, 106122)
end,
				function (API, OP)
	return API[1](OP, 106123)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10612,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 27758,
			["MonsterId"] = 106123,
			["Name"] = "关卡地图6_12",
			["NeedPower"] = 6,
			["ShapeId"] = 2001,
			["ShowName"] = "孙尚香",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10613] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10612)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10613,
			["Desc"] = "众人摆脱了跟踪的孙尚香后，利用钥匙进入到了赤鹿的神圣之所。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106131)
end,
				function (API, OP)
	return API[1](OP, 106132)
end,
				function (API, OP)
	return API[1](OP, 106133)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10613,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 28264,
			["MonsterId"] = 106133,
			["Name"] = "关卡地图6_13",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "废殿密室",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
		},
		[10614] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10613)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10614,
			["Desc"] = "当进入密室后，却发现里边空空入也。断尾即将对罗宁发火，而罗宾却发现了地面上有新鲜的脚印。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106141)
end,
				function (API, OP)
	return API[1](OP, 106142)
end,
				function (API, OP)
	return API[1](OP, 106143)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10614,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 28770,
			["MonsterId"] = 106143,
			["Name"] = "关卡地图6_14",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "被盗",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
		},
		[10615] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10614)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10615,
			["Desc"] = "追寻着足迹来到废殿之外，意外地发现了喝得烂醉的吕布。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106151)
end,
				function (API, OP)
	return API[1](OP, 106152)
end,
				function (API, OP)
	return API[1](OP, 106153)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10615,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 29276,
			["MonsterId"] = 106153,
			["Name"] = "关卡地图6_15",
			["NeedPower"] = 6,
			["ShapeId"] = 1019,
			["ShowName"] = "吕布",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10616] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10615)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10615,
			["Desc"] = "吕布已经完全醉死过去，但是在其副官的口中得知，宝藏已经交给了瓦尔基里。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106161)
end,
				function (API, OP)
	return API[1](OP, 106162)
end,
				function (API, OP)
	return API[1](OP, 106163)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10616,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 29782,
			["MonsterId"] = 106163,
			["Name"] = "关卡地图6_16",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "宝藏下落",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
		},
		[10617] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10616)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10615,
			["Desc"] = "断尾一言不发，罗宁感受到了越来越重的压迫感。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106171)
end,
				function (API, OP)
	return API[1](OP, 106172)
end,
				function (API, OP)
	return API[1](OP, 106173)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10617,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 30288,
			["MonsterId"] = 106173,
			["Name"] = "关卡地图6_17",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "解谜",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
		},
		[10618] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10617)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10615,
			["Desc"] = "就在瓦尔基里打败众人后，一个意想不到的人出现……",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 106181)
end,
				function (API, OP)
	return API[1](OP, 106182)
end,
				function (API, OP)
	return API[1](OP, 106183)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10618,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 33337,
			["MonsterId"] = 106183,
			["Name"] = "关卡地图6_18",
			["NeedPower"] = 6,
			["ShapeId"] = 2007,
			["ShowName"] = "永恒之爱",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10701] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10618)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10701,
			["Desc"] = "彩虹商团在圣盟境内的据点近期突然遭受多起袭击，而圣盟迟迟未能找到凶手。为了保护雇员，彩虹商团关闭了与圣盟的交易通道。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107011)
end,
				function (API, OP)
	return API[1](OP, 107012)
end,
				function (API, OP)
	return API[1](OP, 107013)
end,
			},
			["ExpBonus"] = 250,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10701,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 33826,
			["MonsterId"] = 107013,
			["Name"] = "关卡地图7_1",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "彩虹商团",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 250,
			},
		},
		[10702] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10701)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10702,
			["Desc"] = "听完商团描述，西鲁芙以为这只是普通的商团。可罗宾汉提醒西鲁芙不要把商团想的太简单。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107021)
end,
				function (API, OP)
	return API[1](OP, 107022)
end,
				function (API, OP)
	return API[1](OP, 107023)
end,
			},
			["ExpBonus"] = 250,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10702,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 34315,
			["MonsterId"] = 107023,
			["Name"] = "关卡地图7_2",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "彩虹栈道",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 250,
			},
		},
		[10703] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10702)
end,
				function (API, OP)
	return API[2](OP,25)
end,
			},
			["ChatInfo"] = 10703,
			["Desc"] = "众人遇到了迷失的拉琪亚，在众人的引导下，拉琪亚找到了彩虹栈道。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107031)
end,
				function (API, OP)
	return API[1](OP, 107032)
end,
				function (API, OP)
	return API[1](OP, 107033)
end,
			},
			["ExpBonus"] = 250,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10703,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 34804,
			["MonsterId"] = 107033,
			["Name"] = "关卡地图7_3",
			["NeedPower"] = 6,
			["ShapeId"] = 1008,
			["ShowName"] = "拉琪亚",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 250,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10704] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10703)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10704,
			["Desc"] = "到达彩虹栈道后，拉琪亚与众人告别。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107041)
end,
				function (API, OP)
	return API[1](OP, 107042)
end,
				function (API, OP)
	return API[1](OP, 107043)
end,
			},
			["ExpBonus"] = 250,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10704,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 35293,
			["MonsterId"] = 107043,
			["Name"] = "关卡地图7_4",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "枯栈径",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 250,
			},
		},
		[10705] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10704)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10705,
			["Desc"] = "众人突然受到袭击，此时得知小商贩帕尼亚遇袭的消息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107051)
end,
				function (API, OP)
	return API[1](OP, 107052)
end,
				function (API, OP)
	return API[1](OP, 107053)
end,
			},
			["ExpBonus"] = 250,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10705,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 35982,
			["MonsterId"] = 107053,
			["Name"] = "关卡地图7_5",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "帕尼亚受袭",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 250,
			},
		},
		[10706] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10705)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10706,
			["Desc"] = "神农氏告诉众人原委，原来为了保障彩小贩的安全，他们每人都会随身携带记忆水晶，能记录所有的事情。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107061)
end,
				function (API, OP)
	return API[1](OP, 107062)
end,
				function (API, OP)
	return API[1](OP, 107063)
end,
			},
			["ExpBonus"] = 260,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10706,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610105,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 36671,
			["MonsterId"] = 107063,
			["Name"] = "关卡地图7_6",
			["NeedPower"] = 6,
			["ShapeId"] = 3006,
			["ShowName"] = "神农氏",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 260,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10707] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10706)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10707,
			["Desc"] = "摆脱了神农氏的追捕，小分队试图找到案件负责人：孙策。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107071)
end,
				function (API, OP)
	return API[1](OP, 107072)
end,
				function (API, OP)
	return API[1](OP, 107073)
end,
			},
			["ExpBonus"] = 260,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10707,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 37360,
			["MonsterId"] = 107073,
			["Name"] = "关卡地图7_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "银松林",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 260,
			},
		},
		[10708] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10707)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10708,
			["Desc"] = "当小分队试图前往商团内部，却意外地发现一个熟悉的身影。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107081)
end,
				function (API, OP)
	return API[1](OP, 107082)
end,
				function (API, OP)
	return API[1](OP, 107083)
end,
			},
			["ExpBonus"] = 260,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10708,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 38049,
			["MonsterId"] = 107083,
			["Name"] = "关卡地图7_8",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "潜入",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 260,
			},
		},
		[10709] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10708)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10709,
			["Desc"] = "蒲英城的玛亚出现在彩虹商团，是要与脱脱女王达成什么样的交易？",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107091)
end,
				function (API, OP)
	return API[1](OP, 107092)
end,
				function (API, OP)
	return API[1](OP, 107093)
end,
			},
			["ExpBonus"] = 260,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10709,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 38738,
			["MonsterId"] = 107093,
			["Name"] = "关卡地图7_9",
			["NeedPower"] = 6,
			["ShapeId"] = 3004,
			["ShowName"] = "蒲英城玛亚",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 260,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10710] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10709)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10710,
			["Desc"] = "“只要把你们交给脱脱女王，鲁夫就会回到我的身边！”",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107101)
end,
				function (API, OP)
	return API[1](OP, 107102)
end,
				function (API, OP)
	return API[1](OP, 107103)
end,
			},
			["ExpBonus"] = 260,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10710,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 39427,
			["MonsterId"] = 107103,
			["Name"] = "关卡地图7_10",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "被捕",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 260,
			},
		},
		[10711] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10710)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10711,
			["Desc"] = "“不行，一定要找到记忆水晶，这样才能知道真相！”",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107111)
end,
				function (API, OP)
	return API[1](OP, 107112)
end,
				function (API, OP)
	return API[1](OP, 107113)
end,
			},
			["ExpBonus"] = 270,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10711,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 40116,
			["MonsterId"] = 107113,
			["Name"] = "关卡地图7_11",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "记忆水晶",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 270,
			},
		},
		[10712] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10711)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10712,
			["Desc"] = "“等你们很久了，渣子们！”信心满满的孙策站在众人前，仿佛能一拳击碎这些卑劣的杀人狂。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107121)
end,
				function (API, OP)
	return API[1](OP, 107122)
end,
				function (API, OP)
	return API[1](OP, 107123)
end,
			},
			["ExpBonus"] = 270,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10712,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610205,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 40805,
			["MonsterId"] = 107123,
			["Name"] = "关卡地图7_12",
			["NeedPower"] = 6,
			["ShapeId"] = 1009,
			["ShowName"] = "孙策",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 270,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10713] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10712)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10713,
			["Desc"] = "当罗宾偷到孙策记忆水晶后，发现已经有魔法渗入的痕迹。于是亚瑟写信给玲珑试图得到帮助。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107131)
end,
				function (API, OP)
	return API[1](OP, 107132)
end,
				function (API, OP)
	return API[1](OP, 107133)
end,
			},
			["ExpBonus"] = 270,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10713,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 41494,
			["MonsterId"] = 107133,
			["Name"] = "关卡地图7_13",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "彩虹酒馆",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 270,
			},
		},
		[10714] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10713)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10714,
			["Desc"] = "玲珑回信让小分队去寻找地精斯德尼，或许能给小分队提供帮助。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107141)
end,
				function (API, OP)
	return API[1](OP, 107142)
end,
				function (API, OP)
	return API[1](OP, 107143)
end,
			},
			["ExpBonus"] = 270,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10714,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 41883,
			["MonsterId"] = 107143,
			["Name"] = "关卡地图7_14",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "酒馆偶遇",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 270,
			},
		},
		[10715] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10714)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10715,
			["Desc"] = "当众人去往斯德尼常去的小酒馆，却没发现他的踪迹。此时一个小姑娘找到了小分队。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107151)
end,
				function (API, OP)
	return API[1](OP, 107152)
end,
				function (API, OP)
	return API[1](OP, 107153)
end,
			},
			["ExpBonus"] = 270,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10715,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 42272,
			["MonsterId"] = 107153,
			["Name"] = "关卡地图7_15",
			["NeedPower"] = 6,
			["ShapeId"] = 2014,
			["ShowName"] = "地精斯德尼",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 270,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10716] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10715)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10715,
			["Desc"] = "斯德尼很不耐烦地说他也没办法消除记忆水晶上的魔法盾，反而让小分队去寻找当时指路的小姑娘。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107161)
end,
				function (API, OP)
	return API[1](OP, 107162)
end,
				function (API, OP)
	return API[1](OP, 107163)
end,
			},
			["ExpBonus"] = 270,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10716,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 42661,
			["MonsterId"] = 107163,
			["Name"] = "关卡地图7_16",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "返回酒馆",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 270,
			},
		},
		[10717] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10716)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10715,
			["Desc"] = "夜幕下的酒馆沉浸在一片狂欢之中，而在暗角，却有罪恶如吐信的毒蛇等待着猎物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107171)
end,
				function (API, OP)
	return API[1](OP, 107172)
end,
				function (API, OP)
	return API[1](OP, 107173)
end,
			},
			["ExpBonus"] = 270,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10717,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 43050,
			["MonsterId"] = 107173,
			["Name"] = "关卡地图7_17",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "遭遇袭击",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 270,
			},
		},
		[10718] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10717)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10715,
			["Desc"] = "脱脱女王给了小分队限定时间，在玲珑的指引下，众人去往了菲斯学院。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 107181)
end,
				function (API, OP)
	return API[1](OP, 107182)
end,
				function (API, OP)
	return API[1](OP, 107183)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						610105,
						1,
					},
					{
						610205,
						1,
					},
					{
						610305,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10718,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610305,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 43439,
			["MonsterId"] = 107183,
			["Name"] = "关卡地图7_18",
			["NeedPower"] = 6,
			["ShapeId"] = 1001,
			["ShowName"] = "脱脱女王",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10801] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10715)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10801,
			["Desc"] = "传说荆棘峦是一头魔枭的脊背所化。沉睡中的魔枭一直等待它的主人出现，睁眼之时大陆因他们而颤栗。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108011)
end,
				function (API, OP)
	return API[1](OP, 108012)
end,
				function (API, OP)
	return API[1](OP, 108013)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10801,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610106,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 43828,
			["MonsterId"] = 108013,
			["Name"] = "关卡地图8_1",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "荆棘峦I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
		},
		[10802] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10801)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10802,
			["Desc"] = "传说荆棘峦是一头魔枭的脊背所化。沉睡中的魔枭一直等待它的主人出现，睁眼之时大陆因他们而颤栗。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108021)
end,
				function (API, OP)
	return API[1](OP, 108022)
end,
				function (API, OP)
	return API[1](OP, 108023)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10802,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610106,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 44217,
			["MonsterId"] = 108023,
			["Name"] = "关卡地图8_2",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "荆棘峦II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
		},
		[10803] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10802)
end,
				function (API, OP)
	return API[2](OP,30)
end,
			},
			["ChatInfo"] = 10803,
			["Desc"] = "传说荆棘峦是一头魔枭的脊背所化。沉睡中的魔枭一直等待它的主人出现，睁眼之时大陆因他们而颤栗。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108031)
end,
				function (API, OP)
	return API[1](OP, 108032)
end,
				function (API, OP)
	return API[1](OP, 108033)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10803,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610106,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 44606,
			["MonsterId"] = 108033,
			["Name"] = "关卡地图8_3",
			["NeedPower"] = 6,
			["ShapeId"] = 1001,
			["ShowName"] = "荆棘峦III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10804] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10803)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10804,
			["Desc"] = "数十年前还是一片泽国的这里，流浪画师途径此地感这里人贫苦，将画卷至于水中而一道道山岭拔地而起。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108041)
end,
				function (API, OP)
	return API[1](OP, 108042)
end,
				function (API, OP)
	return API[1](OP, 108043)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10804,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610106,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 44995,
			["MonsterId"] = 108043,
			["Name"] = "关卡地图8_4",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "苍莽岭I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
		},
		[10805] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10804)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10805,
			["Desc"] = "数十年前还是一片泽国的这里，流浪画师途径此地感这里人贫苦，将画卷至于水中而一道道山岭拔地而起。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108051)
end,
				function (API, OP)
	return API[1](OP, 108052)
end,
				function (API, OP)
	return API[1](OP, 108053)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10805,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610106,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 45384,
			["MonsterId"] = 108053,
			["Name"] = "关卡地图8_5",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "苍莽岭II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
		},
		[10806] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10805)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10806,
			["Desc"] = "数十年前还是一片泽国的这里，流浪画师途径此地感这里人贫苦，将画卷至于水中而一道道山岭拔地而起。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108061)
end,
				function (API, OP)
	return API[1](OP, 108062)
end,
				function (API, OP)
	return API[1](OP, 108063)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10806,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610106,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 45773,
			["MonsterId"] = 108063,
			["Name"] = "关卡地图8_6",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "苍莽岭III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10807] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10806)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10807,
			["Desc"] = "山谷中悄然升起一图腾柱，似乎连接天际。奇怪的地方在于攀爬掉落下来的人不会有任何损伤。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108071)
end,
				function (API, OP)
	return API[1](OP, 108072)
end,
				function (API, OP)
	return API[1](OP, 108073)
end,
			},
			["ExpBonus"] = 290,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10807,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610206,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 46162,
			["MonsterId"] = 108073,
			["Name"] = "关卡地图8_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "天梯谷I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 290,
			},
		},
		[10808] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10807)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10808,
			["Desc"] = "山谷中悄然升起一图腾柱，似乎连接天际。奇怪的地方在于攀爬掉落下来的人不会有任何损伤。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108081)
end,
				function (API, OP)
	return API[1](OP, 108082)
end,
				function (API, OP)
	return API[1](OP, 108083)
end,
			},
			["ExpBonus"] = 290,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10808,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610206,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 46551,
			["MonsterId"] = 108083,
			["Name"] = "关卡地图8_8",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "天梯谷II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 290,
			},
		},
		[10809] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10808)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10809,
			["Desc"] = "山谷中悄然升起一图腾柱，似乎连接天际。奇怪的地方在于攀爬掉落下来的人不会有任何损伤。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108091)
end,
				function (API, OP)
	return API[1](OP, 108092)
end,
				function (API, OP)
	return API[1](OP, 108093)
end,
			},
			["ExpBonus"] = 290,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10809,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610206,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 50940,
			["MonsterId"] = 108093,
			["Name"] = "关卡地图8_9",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "天梯谷III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 290,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10810] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10809)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10810,
			["Desc"] = "神圣联盟第一次西征异物外族时的战场，但计划被洞悉遭遇伏击。血脉军团十万众全部遇难，此地因而闻名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108101)
end,
				function (API, OP)
	return API[1](OP, 108102)
end,
				function (API, OP)
	return API[1](OP, 108103)
end,
			},
			["ExpBonus"] = 290,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10810,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610206,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 47329,
			["MonsterId"] = 108103,
			["Name"] = "关卡地图8_10",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "匹斯原I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 290,
			},
		},
		[10811] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10810)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10811,
			["Desc"] = "神圣联盟第一次西征异物外族时的战场，但计划被洞悉遭遇伏击。血脉军团十万众全部遇难，此地因而闻名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108111)
end,
				function (API, OP)
	return API[1](OP, 108112)
end,
				function (API, OP)
	return API[1](OP, 108113)
end,
			},
			["ExpBonus"] = 290,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10811,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610206,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 47718,
			["MonsterId"] = 108113,
			["Name"] = "关卡地图8_11",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "匹斯原II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 290,
			},
		},
		[10812] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10811)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10812,
			["Desc"] = "神圣联盟第一次西征异物外族时的战场，但计划被洞悉遭遇伏击。血脉军团十万众全部遇难，此地因而闻名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108121)
end,
				function (API, OP)
	return API[1](OP, 108122)
end,
				function (API, OP)
	return API[1](OP, 108123)
end,
			},
			["ExpBonus"] = 300,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10812,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610206,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 48107,
			["MonsterId"] = 108123,
			["Name"] = "关卡地图8_12",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "匹斯原III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 300,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10813] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10812)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10813,
			["Desc"] = "山壑中奇形怪状的土质构筑物已违自然规则，唯独有的山羚如履平地。别的生命则在不断坍塌构筑物中前行。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108131)
end,
				function (API, OP)
	return API[1](OP, 108132)
end,
				function (API, OP)
	return API[1](OP, 108133)
end,
			},
			["ExpBonus"] = 300,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10813,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610306,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 48496,
			["MonsterId"] = 108133,
			["Name"] = "关卡地图8_13",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "崎羚壑I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 300,
			},
		},
		[10814] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10813)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10814,
			["Desc"] = "山壑中奇形怪状的土质构筑物已违自然规则，唯独有的山羚如履平地。别的生命则在不断坍塌构筑物中前行。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108141)
end,
				function (API, OP)
	return API[1](OP, 108142)
end,
				function (API, OP)
	return API[1](OP, 108143)
end,
			},
			["ExpBonus"] = 300,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10814,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610306,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 48885,
			["MonsterId"] = 108143,
			["Name"] = "关卡地图8_14",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "崎羚壑II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 300,
			},
		},
		[10815] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10814)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10815,
			["Desc"] = "上古巨魔死亡的身躯演化成腐烂的淤泥，长时间发酵孕育出一奇香。吸引动植物投进这深渊巨口之中。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108151)
end,
				function (API, OP)
	return API[1](OP, 108152)
end,
				function (API, OP)
	return API[1](OP, 108153)
end,
			},
			["ExpBonus"] = 300,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10815,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610306,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 49274,
			["MonsterId"] = 108153,
			["Name"] = "关卡地图8_15",
			["NeedPower"] = 6,
			["ShapeId"] = 1001,
			["ShowName"] = "冤魔域",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 300,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10816] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10815)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10815,
			["Desc"] = "上古巨魔死亡的身躯演化成腐烂的淤泥，长时间发酵孕育出一奇香。吸引动植物投进这深渊巨口之中。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108161)
end,
				function (API, OP)
	return API[1](OP, 108162)
end,
				function (API, OP)
	return API[1](OP, 108163)
end,
			},
			["ExpBonus"] = 300,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10816,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610306,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 49663,
			["MonsterId"] = 108163,
			["Name"] = "关卡地图8_16",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "冤魔域I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 300,
			},
		},
		[10817] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10816)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10815,
			["Desc"] = "上古巨魔死亡的身躯演化成腐烂的淤泥，长时间发酵孕育出一奇香。吸引动植物投进这深渊巨口之中。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108171)
end,
				function (API, OP)
	return API[1](OP, 108172)
end,
				function (API, OP)
	return API[1](OP, 108173)
end,
			},
			["ExpBonus"] = 300,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10817,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610306,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 50052,
			["MonsterId"] = 108173,
			["Name"] = "关卡地图8_17",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "冤魔域II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 300,
			},
		},
		[10818] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10817)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10815,
			["Desc"] = "上古巨魔死亡的身躯演化成腐烂的淤泥，长时间发酵孕育出一奇香。吸引动植物投进这深渊巨口之中。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 108181)
end,
				function (API, OP)
	return API[1](OP, 108182)
end,
				function (API, OP)
	return API[1](OP, 108183)
end,
			},
			["ExpBonus"] = 300,
			["FirstBonus"] = {
				["Item"] = {
					{
						610106,
						1,
					},
					{
						610206,
						1,
					},
					{
						610306,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10818,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610306,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 56245,
			["MonsterId"] = 108183,
			["Name"] = "关卡地图8_18",
			["NeedPower"] = 6,
			["ShapeId"] = 1001,
			["ShowName"] = "冤魔域III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 300,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10901] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10815)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10901,
			["Desc"] = "伸入云际的一段锁链，通往神院的唯一通道。血脉自主识别功能是它杜绝异族奸细潜入的重要屏障。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109011)
end,
				function (API, OP)
	return API[1](OP, 109012)
end,
				function (API, OP)
	return API[1](OP, 109013)
end,
			},
			["ExpBonus"] = 310,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10901,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610107,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 54944,
			["MonsterId"] = 109013,
			["Name"] = "关卡地图9_1",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "索引道I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 310,
			},
		},
		[10902] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10901)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10902,
			["Desc"] = "伸入云际的一段锁链，通往神院的唯一通道。血脉自主识别功能是它杜绝异族奸细潜入的重要屏障。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109021)
end,
				function (API, OP)
	return API[1](OP, 109022)
end,
				function (API, OP)
	return API[1](OP, 109023)
end,
			},
			["ExpBonus"] = 310,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10902,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610107,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 55643,
			["MonsterId"] = 109023,
			["Name"] = "关卡地图9_2",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "索引道II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 310,
			},
		},
		[10903] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10902)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10903,
			["Desc"] = "伸入云际的一段锁链，通往神院的唯一通道。血脉自主识别功能是它杜绝异族奸细潜入的重要屏障。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109031)
end,
				function (API, OP)
	return API[1](OP, 109032)
end,
				function (API, OP)
	return API[1](OP, 109033)
end,
			},
			["ExpBonus"] = 310,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10903,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610107,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 56342,
			["MonsterId"] = 109033,
			["Name"] = "关卡地图9_3",
			["NeedPower"] = 6,
			["ShapeId"] = 1001,
			["ShowName"] = "索引道III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 310,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10904] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10903)
end,
				function (API, OP)
	return API[2](OP,35)
end,
			},
			["ChatInfo"] = 10904,
			["Desc"] = "围绕在神院四周的数座漂浮岛屿，浮岛上天雷闪烁漂浮接连，杜绝一切企图通过天空云层进入的外来者。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109041)
end,
				function (API, OP)
	return API[1](OP, 109042)
end,
				function (API, OP)
	return API[1](OP, 109043)
end,
			},
			["ExpBonus"] = 310,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10904,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610107,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 57041,
			["MonsterId"] = 109043,
			["Name"] = "关卡地图9_4",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "浮雷岛I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 310,
			},
		},
		[10905] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10904)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10905,
			["Desc"] = "围绕在神院四周的数座漂浮岛屿，浮岛上天雷闪烁漂浮接连，杜绝一切企图通过天空云层进入的外来者。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109051)
end,
				function (API, OP)
	return API[1](OP, 109052)
end,
				function (API, OP)
	return API[1](OP, 109053)
end,
			},
			["ExpBonus"] = 310,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10905,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610107,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 57740,
			["MonsterId"] = 109053,
			["Name"] = "关卡地图9_5",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "浮雷岛II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 310,
			},
		},
		[10906] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10905)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10906,
			["Desc"] = "围绕在神院四周的数座漂浮岛屿，浮岛上天雷闪烁漂浮接连，杜绝一切企图通过天空云层进入的外来者。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109061)
end,
				function (API, OP)
	return API[1](OP, 109062)
end,
				function (API, OP)
	return API[1](OP, 109063)
end,
			},
			["ExpBonus"] = 310,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10906,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610107,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 58439,
			["MonsterId"] = 109063,
			["Name"] = "关卡地图9_6",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "浮雷岛III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 310,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10907] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10906)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10907,
			["Desc"] = "传说最接近天的地方，也是神界重临人间第一站。曾经一度被异域外族夺取屯驻重军团，但最终被联盟夺回。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109071)
end,
				function (API, OP)
	return API[1](OP, 109072)
end,
				function (API, OP)
	return API[1](OP, 109073)
end,
			},
			["ExpBonus"] = 320,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10907,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610207,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 59138,
			["MonsterId"] = 109073,
			["Name"] = "关卡地图9_7",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "子午路I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 320,
			},
		},
		[10908] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10907)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10908,
			["Desc"] = "传说最接近天的地方，也是神界重临人间第一站。曾经一度被异域外族夺取屯驻重军团，但最终被联盟夺回。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109081)
end,
				function (API, OP)
	return API[1](OP, 109082)
end,
				function (API, OP)
	return API[1](OP, 109083)
end,
			},
			["ExpBonus"] = 320,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10908,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610207,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 59837,
			["MonsterId"] = 109083,
			["Name"] = "关卡地图9_8",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "子午路II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 320,
			},
		},
		[10909] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10908)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10909,
			["Desc"] = "传说最接近天的地方，也是神界重临人间第一站。曾经一度被异域外族夺取屯驻重军团，但最终被联盟夺回。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109091)
end,
				function (API, OP)
	return API[1](OP, 109092)
end,
				function (API, OP)
	return API[1](OP, 109093)
end,
			},
			["ExpBonus"] = 320,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10909,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610207,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 60536,
			["MonsterId"] = 109093,
			["Name"] = "关卡地图9_9",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "子午路III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 320,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10910] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10909)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10910,
			["Desc"] = "子午路的末端，布局呈“回”字形。神圣联盟祭天祈谷或者西征请佑的地方，又名“神穹宇”。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109101)
end,
				function (API, OP)
	return API[1](OP, 109102)
end,
				function (API, OP)
	return API[1](OP, 109103)
end,
			},
			["ExpBonus"] = 320,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10910,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610207,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 61235,
			["MonsterId"] = 109103,
			["Name"] = "关卡地图9_10",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "祀星台I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 320,
			},
		},
		[10911] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10910)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10911,
			["Desc"] = "子午路的末端，布局呈“回”字形。神圣联盟祭天祈谷或者西征请佑的地方，又名“神穹宇”。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109111)
end,
				function (API, OP)
	return API[1](OP, 109112)
end,
				function (API, OP)
	return API[1](OP, 109113)
end,
			},
			["ExpBonus"] = 320,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10911,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610207,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 61934,
			["MonsterId"] = 109113,
			["Name"] = "关卡地图9_11",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "祀星台II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 320,
			},
		},
		[10912] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10911)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10912,
			["Desc"] = "子午路的末端，布局呈“回”字形。神圣联盟祭天祈谷或者西征请佑的地方，又名“神穹宇”。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109121)
end,
				function (API, OP)
	return API[1](OP, 109122)
end,
				function (API, OP)
	return API[1](OP, 109123)
end,
			},
			["ExpBonus"] = 320,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10912,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610207,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 62633,
			["MonsterId"] = 109123,
			["Name"] = "关卡地图9_12",
			["NeedPower"] = 6,
			["ShapeId"] = 4001,
			["ShowName"] = "祀星台III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 320,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10913] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10912)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10913,
			["Desc"] = "菲斯神院中最大的藏书馆，但它非一处独立的建筑。按照礼、乐、射、御、书、数划分，以六芒星对角布局。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109131)
end,
				function (API, OP)
	return API[1](OP, 109132)
end,
				function (API, OP)
	return API[1](OP, 109133)
end,
			},
			["ExpBonus"] = 330,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10913,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610307,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 63332,
			["MonsterId"] = 109133,
			["Name"] = "关卡地图9_13",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "通灵院I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 330,
			},
		},
		[10914] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10913)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10914,
			["Desc"] = "菲斯神院中最大的藏书馆，但它非一处独立的建筑。按照礼、乐、射、御、书、数划分，以六芒星对角布局。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109141)
end,
				function (API, OP)
	return API[1](OP, 109142)
end,
				function (API, OP)
	return API[1](OP, 109143)
end,
			},
			["ExpBonus"] = 330,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10914,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610307,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 64031,
			["MonsterId"] = 109143,
			["Name"] = "关卡地图9_14",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "通灵院II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 330,
			},
		},
		[10915] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10914)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10915,
			["Desc"] = "祀星台往外延伸至断崖下降百米的一处凸壁，埋骨那些为文艺复兴的付出生命的先贤之地；逝者已矣，生者如斯。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109151)
end,
				function (API, OP)
	return API[1](OP, 109152)
end,
				function (API, OP)
	return API[1](OP, 109153)
end,
			},
			["ExpBonus"] = 330,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10915,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610307,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 64730,
			["MonsterId"] = 109153,
			["Name"] = "关卡地图9_15",
			["NeedPower"] = 6,
			["ShapeId"] = 1001,
			["ShowName"] = "古神庙",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 330,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[10916] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10915)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10915,
			["Desc"] = "祀星台往外延伸至断崖下降百米的一处凸壁，埋骨那些为文艺复兴的付出生命的先贤之地；逝者已矣，生者如斯。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109161)
end,
				function (API, OP)
	return API[1](OP, 109162)
end,
				function (API, OP)
	return API[1](OP, 109163)
end,
			},
			["ExpBonus"] = 330,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10916,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610307,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 65429,
			["MonsterId"] = 109163,
			["Name"] = "关卡地图9_16",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "古神庙I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 330,
			},
		},
		[10917] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10916)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10915,
			["Desc"] = "祀星台往外延伸至断崖下降百米的一处凸壁，埋骨那些为文艺复兴的付出生命的先贤之地；逝者已矣，生者如斯。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109171)
end,
				function (API, OP)
	return API[1](OP, 109172)
end,
				function (API, OP)
	return API[1](OP, 109173)
end,
			},
			["ExpBonus"] = 330,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10917,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610307,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 66128,
			["MonsterId"] = 109173,
			["Name"] = "关卡地图9_17",
			["NeedPower"] = 6,
			["ShapeId"] = 10000,
			["ShowName"] = "古神庙II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 330,
			},
		},
		[10918] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 6,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10917)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 10915,
			["Desc"] = "祀星台往外延伸至断崖下降百米的一处凸壁，埋骨那些为文艺复兴的付出生命的先贤之地；逝者已矣，生者如斯。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 109181)
end,
				function (API, OP)
	return API[1](OP, 109182)
end,
				function (API, OP)
	return API[1](OP, 109183)
end,
			},
			["ExpBonus"] = 330,
			["FirstBonus"] = {
				["Item"] = {
					{
						610107,
						1,
					},
					{
						610207,
						1,
					},
					{
						610307,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 10918,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610307,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 66827,
			["MonsterId"] = 109183,
			["Name"] = "关卡地图9_18",
			["NeedPower"] = 6,
			["ShapeId"] = 1001,
			["ShowName"] = "古神庙III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 330,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11001] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10915)
end,
				function (API, OP)
	return API[2](OP,40)
end,
			},
			["ChatInfo"] = 11001,
			["Desc"] = "五百年前的雪域王国遗址。传闻曾经的雪域日月不分，充斥着各种混乱的魔法元素，是魔法师的天堂。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110011)
end,
				function (API, OP)
	return API[1](OP, 110012)
end,
				function (API, OP)
	return API[1](OP, 110013)
end,
			},
			["ExpBonus"] = 340,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11001,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 67526,
			["MonsterId"] = 110013,
			["Name"] = "关卡地图10_1",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "雪域垒I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 340,
			},
		},
		[11002] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11001)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11002,
			["Desc"] = "五百年前的雪域王国遗址。传闻曾经的雪域日月不分，充斥着各种混乱的魔法元素，是魔法师的天堂。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110021)
end,
				function (API, OP)
	return API[1](OP, 110022)
end,
				function (API, OP)
	return API[1](OP, 110023)
end,
			},
			["ExpBonus"] = 340,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11002,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 68225,
			["MonsterId"] = 110023,
			["Name"] = "关卡地图10_2",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "雪域垒II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 340,
			},
		},
		[11003] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11002)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11003,
			["Desc"] = "五百年前的雪域王国遗址。传闻曾经的雪域日月不分，充斥着各种混乱的魔法元素，是魔法师的天堂。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110031)
end,
				function (API, OP)
	return API[1](OP, 110032)
end,
				function (API, OP)
	return API[1](OP, 110033)
end,
			},
			["ExpBonus"] = 340,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11003,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 68924,
			["MonsterId"] = 110033,
			["Name"] = "关卡地图10_3",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "雪域垒III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 340,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11004] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11003)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11004,
			["Desc"] = "曾经贯穿雪域的一道河流，现已剩下冰痕晶晶的河床。不论是白天、黑夜，在有光的地方总闪烁斑斓色彩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110041)
end,
				function (API, OP)
	return API[1](OP, 110042)
end,
				function (API, OP)
	return API[1](OP, 110043)
end,
			},
			["ExpBonus"] = 340,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11004,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 69623,
			["MonsterId"] = 110043,
			["Name"] = "关卡地图10_4",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "琉绯渠I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 340,
			},
		},
		[11005] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11004)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11005,
			["Desc"] = "曾经贯穿雪域的一道河流，现已剩下冰痕晶晶的河床。不论是白天、黑夜，在有光的地方总闪烁斑斓色彩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110051)
end,
				function (API, OP)
	return API[1](OP, 110052)
end,
				function (API, OP)
	return API[1](OP, 110053)
end,
			},
			["ExpBonus"] = 340,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11005,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 70322,
			["MonsterId"] = 110053,
			["Name"] = "关卡地图10_5",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "琉绯渠II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 340,
			},
		},
		[11006] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11005)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11006,
			["Desc"] = "曾经贯穿雪域的一道河流，现已剩下冰痕晶晶的河床。不论是白天、黑夜，在有光的地方总闪烁斑斓色彩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110061)
end,
				function (API, OP)
	return API[1](OP, 110062)
end,
				function (API, OP)
	return API[1](OP, 110063)
end,
			},
			["ExpBonus"] = 350,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11006,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 71021,
			["MonsterId"] = 110063,
			["Name"] = "关卡地图10_6",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "琉绯渠III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 350,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11007] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11006)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11007,
			["Desc"] = "雪域魔法创造的小世界，传说储存有历代雪域王族传承财富和世界轴心。神圣联盟、异域外族交战的第三战场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110071)
end,
				function (API, OP)
	return API[1](OP, 110072)
end,
				function (API, OP)
	return API[1](OP, 110073)
end,
			},
			["ExpBonus"] = 350,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11007,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 71720,
			["MonsterId"] = 110073,
			["Name"] = "关卡地图10_7",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "齿月界I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 350,
			},
		},
		[11008] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11007)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11008,
			["Desc"] = "雪域魔法创造的小世界，传说储存有历代雪域王族传承财富和世界轴心。神圣联盟、异域外族交战的第三战场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110081)
end,
				function (API, OP)
	return API[1](OP, 110082)
end,
				function (API, OP)
	return API[1](OP, 110083)
end,
			},
			["ExpBonus"] = 350,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11008,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 72419,
			["MonsterId"] = 110083,
			["Name"] = "关卡地图10_8",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "齿月界II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 350,
			},
		},
		[11009] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11008)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11009,
			["Desc"] = "雪域魔法创造的小世界，传说储存有历代雪域王族传承财富和世界轴心。神圣联盟、异域外族交战的第三战场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110091)
end,
				function (API, OP)
	return API[1](OP, 110092)
end,
				function (API, OP)
	return API[1](OP, 110093)
end,
			},
			["ExpBonus"] = 350,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11009,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 73118,
			["MonsterId"] = 110093,
			["Name"] = "关卡地图10_9",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "齿月界III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 350,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11010] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11009)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11010,
			["Desc"] = "第一工匠追随流浪画师时的陨落之地，匠神之心随着热血铸造此崖；匠神崖的一粒石砾都能提升锻造成功率。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110101)
end,
				function (API, OP)
	return API[1](OP, 110102)
end,
				function (API, OP)
	return API[1](OP, 110103)
end,
			},
			["ExpBonus"] = 350,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11010,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 73817,
			["MonsterId"] = 110103,
			["Name"] = "关卡地图10_10",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "匠神崖I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 350,
			},
		},
		[11011] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11010)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11011,
			["Desc"] = "第一工匠追随流浪画师时的陨落之地，匠神之心随着热血铸造此崖；匠神崖的一粒石砾都能提升锻造成功率。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110111)
end,
				function (API, OP)
	return API[1](OP, 110112)
end,
				function (API, OP)
	return API[1](OP, 110113)
end,
			},
			["ExpBonus"] = 350,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11011,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 74516,
			["MonsterId"] = 110113,
			["Name"] = "关卡地图10_11",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "匠神崖II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 350,
			},
		},
		[11012] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11011)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11012,
			["Desc"] = "第一工匠追随流浪画师时的陨落之地，匠神之心随着热血铸造此崖；匠神崖的一粒石砾都能提升锻造成功率。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110121)
end,
				function (API, OP)
	return API[1](OP, 110122)
end,
				function (API, OP)
	return API[1](OP, 110123)
end,
			},
			["ExpBonus"] = 350,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11012,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 75215,
			["MonsterId"] = 110123,
			["Name"] = "关卡地图10_12",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "匠神崖III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 350,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11013] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11012)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11013,
			["Desc"] = "通往司命神殿中心位置，漂浮在空中的无规则石阶。每个石阶被踩一次就掉落消散，间隔24度时重新随机刷新。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110131)
end,
				function (API, OP)
	return API[1](OP, 110132)
end,
				function (API, OP)
	return API[1](OP, 110133)
end,
			},
			["ExpBonus"] = 360,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11013,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 75914,
			["MonsterId"] = 110133,
			["Name"] = "关卡地图10_13",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "横断阶I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 360,
			},
		},
		[11014] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11013)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11014,
			["Desc"] = "通往司命神殿中心位置，漂浮在空中的无规则石阶。每个石阶被踩一次就掉落消散，间隔24度时重新随机刷新。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110141)
end,
				function (API, OP)
	return API[1](OP, 110142)
end,
				function (API, OP)
	return API[1](OP, 110143)
end,
			},
			["ExpBonus"] = 360,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11014,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 76613,
			["MonsterId"] = 110143,
			["Name"] = "关卡地图10_14",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "横断阶II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 360,
			},
		},
		[11015] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11014)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11015,
			["Desc"] = "司命神殿的中央行宫，辉映着淡淡星光；没有人进去过，传说是月神的诞生之地，具体无从考证。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110151)
end,
				function (API, OP)
	return API[1](OP, 110152)
end,
				function (API, OP)
	return API[1](OP, 110153)
end,
			},
			["ExpBonus"] = 360,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11015,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 77312,
			["MonsterId"] = 110153,
			["Name"] = "关卡地图10_15",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "星云宫",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 360,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11016] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11015)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11015,
			["Desc"] = "司命神殿的中央行宫，辉映着淡淡星光；没有人进去过，传说是月神的诞生之地，具体无从考证。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110161)
end,
				function (API, OP)
	return API[1](OP, 110162)
end,
				function (API, OP)
	return API[1](OP, 110163)
end,
			},
			["ExpBonus"] = 360,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11016,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 78011,
			["MonsterId"] = 110163,
			["Name"] = "关卡地图10_16",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "星云宫I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 360,
			},
		},
		[11017] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11016)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11015,
			["Desc"] = "司命神殿的中央行宫，辉映着淡淡星光；没有人进去过，传说是月神的诞生之地，具体无从考证。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110171)
end,
				function (API, OP)
	return API[1](OP, 110172)
end,
				function (API, OP)
	return API[1](OP, 110173)
end,
			},
			["ExpBonus"] = 360,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11017,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 78710,
			["MonsterId"] = 110173,
			["Name"] = "关卡地图10_17",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "星云宫II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 360,
			},
		},
		[11018] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11017)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11015,
			["Desc"] = "司命神殿的中央行宫，辉映着淡淡星光；没有人进去过，传说是月神的诞生之地，具体无从考证。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 110181)
end,
				function (API, OP)
	return API[1](OP, 110182)
end,
				function (API, OP)
	return API[1](OP, 110183)
end,
			},
			["ExpBonus"] = 360,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11018,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 79409,
			["MonsterId"] = 110183,
			["Name"] = "关卡地图10_18",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "星云宫III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 360,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11101] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11015)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11101,
			["Desc"] = "北进雪域的主要通道，目前掌握在神圣联盟辖下的几个大的公会手中，已签订连同攻防、治理等条约。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111011)
end,
				function (API, OP)
	return API[1](OP, 111012)
end,
				function (API, OP)
	return API[1](OP, 111013)
end,
			},
			["ExpBonus"] = 370,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11101,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 80108,
			["MonsterId"] = 111013,
			["Name"] = "关卡地图11_1",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "唐古道I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 370,
			},
		},
		[11102] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11101)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11102,
			["Desc"] = "北进雪域的主要通道，目前掌握在神圣联盟辖下的几个大的公会手中，已签订连同攻防、治理等条约。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111021)
end,
				function (API, OP)
	return API[1](OP, 111022)
end,
				function (API, OP)
	return API[1](OP, 111023)
end,
			},
			["ExpBonus"] = 370,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11102,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 80807,
			["MonsterId"] = 111023,
			["Name"] = "关卡地图11_2",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "唐古道II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 370,
			},
		},
		[11103] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11102)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11103,
			["Desc"] = "北进雪域的主要通道，目前掌握在神圣联盟辖下的几个大的公会手中，已签订连同攻防、治理等条约。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111031)
end,
				function (API, OP)
	return API[1](OP, 111032)
end,
				function (API, OP)
	return API[1](OP, 111033)
end,
			},
			["ExpBonus"] = 370,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11103,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 81506,
			["MonsterId"] = 111033,
			["Name"] = "关卡地图11_3",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "唐古道III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 370,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11104] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11103)
end,
				function (API, OP)
	return API[2](OP,45)
end,
			},
			["ChatInfo"] = 11104,
			["Desc"] = "第二道构筑的防线，因几大公会私立冲突导致原本的山丘被轰平，沟壑相错已成山坡。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111041)
end,
				function (API, OP)
	return API[1](OP, 111042)
end,
				function (API, OP)
	return API[1](OP, 111043)
end,
			},
			["ExpBonus"] = 370,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11104,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 82205,
			["MonsterId"] = 111043,
			["Name"] = "关卡地图11_4",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "诃德丘I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 370,
			},
		},
		[11105] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11104)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11105,
			["Desc"] = "第二道构筑的防线，因几大公会私立冲突导致原本的山丘被轰平，沟壑相错已成山坡。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111051)
end,
				function (API, OP)
	return API[1](OP, 111052)
end,
				function (API, OP)
	return API[1](OP, 111053)
end,
			},
			["ExpBonus"] = 370,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11105,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 82904,
			["MonsterId"] = 111053,
			["Name"] = "关卡地图11_5",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "诃德丘II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 370,
			},
		},
		[11106] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11105)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11106,
			["Desc"] = "第二道构筑的防线，因几大公会私立冲突导致原本的山丘被轰平，沟壑相错已成山坡。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111061)
end,
				function (API, OP)
	return API[1](OP, 111062)
end,
				function (API, OP)
	return API[1](OP, 111063)
end,
			},
			["ExpBonus"] = 370,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11106,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610108,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 83603,
			["MonsterId"] = 111063,
			["Name"] = "关卡地图11_6",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "诃德丘III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 370,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11107] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11106)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11107,
			["Desc"] = "像是从远处挪移过来的一块，空地中央有一缺口，不知通往何处。传闻上古山河倒转天演地时，本为天缺。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111071)
end,
				function (API, OP)
	return API[1](OP, 111072)
end,
				function (API, OP)
	return API[1](OP, 111073)
end,
			},
			["ExpBonus"] = 380,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11107,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 84302,
			["MonsterId"] = 111073,
			["Name"] = "关卡地图11_7",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "魔眼地I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 380,
			},
		},
		[11108] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11107)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11108,
			["Desc"] = "像是从远处挪移过来的一块，空地中央有一缺口，不知通往何处。传闻上古山河倒转天演地时，本为天缺。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111081)
end,
				function (API, OP)
	return API[1](OP, 111082)
end,
				function (API, OP)
	return API[1](OP, 111083)
end,
			},
			["ExpBonus"] = 380,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11108,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 85001,
			["MonsterId"] = 111083,
			["Name"] = "关卡地图11_8",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "魔眼地II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 380,
			},
		},
		[11109] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11108)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11109,
			["Desc"] = "像是从远处挪移过来的一块，空地中央有一缺口，不知通往何处。传闻上古山河倒转天演地时，本为天缺。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111091)
end,
				function (API, OP)
	return API[1](OP, 111092)
end,
				function (API, OP)
	return API[1](OP, 111093)
end,
			},
			["ExpBonus"] = 380,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11109,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 85700,
			["MonsterId"] = 111093,
			["Name"] = "关卡地图11_9",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "魔眼地III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 380,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11110] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11109)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11110,
			["Desc"] = "又名“梦媾地”，盛产一种可入梦的堕落妖姬。不论是神圣联盟还是异域外族都渴望得到这种生物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111101)
end,
				function (API, OP)
	return API[1](OP, 111102)
end,
				function (API, OP)
	return API[1](OP, 111103)
end,
			},
			["ExpBonus"] = 380,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11110,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 86399,
			["MonsterId"] = 111103,
			["Name"] = "关卡地图11_10",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "妖姬岭I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 380,
			},
		},
		[11111] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11110)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11111,
			["Desc"] = "又名“梦媾地”，盛产一种可入梦的堕落妖姬。不论是神圣联盟还是异域外族都渴望得到这种生物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111111)
end,
				function (API, OP)
	return API[1](OP, 111112)
end,
				function (API, OP)
	return API[1](OP, 111113)
end,
			},
			["ExpBonus"] = 380,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11111,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 87098,
			["MonsterId"] = 111113,
			["Name"] = "关卡地图11_11",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "妖姬岭II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 380,
			},
		},
		[11112] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11111)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11112,
			["Desc"] = "又名“梦媾地”，盛产一种可入梦的堕落妖姬。不论是神圣联盟还是异域外族都渴望得到这种生物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111121)
end,
				function (API, OP)
	return API[1](OP, 111122)
end,
				function (API, OP)
	return API[1](OP, 111123)
end,
			},
			["ExpBonus"] = 380,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11112,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610208,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 87797,
			["MonsterId"] = 111123,
			["Name"] = "关卡地图11_12",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "妖姬岭III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 380,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11113] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11112)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11113,
			["Desc"] = "天外陨石坠落砸出来的天坑，陨石被当年的雪域王国运走。但地磁效果导致天坑被隔绝，常人无法靠近。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111131)
end,
				function (API, OP)
	return API[1](OP, 111132)
end,
				function (API, OP)
	return API[1](OP, 111133)
end,
			},
			["ExpBonus"] = 390,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11113,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 88496,
			["MonsterId"] = 111133,
			["Name"] = "关卡地图11_13",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "天陨坑I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 390,
			},
		},
		[11114] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11113)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11114,
			["Desc"] = "天外陨石坠落砸出来的天坑，陨石被当年的雪域王国运走。但地磁效果导致天坑被隔绝，常人无法靠近。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111141)
end,
				function (API, OP)
	return API[1](OP, 111142)
end,
				function (API, OP)
	return API[1](OP, 111143)
end,
			},
			["ExpBonus"] = 390,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11114,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 89195,
			["MonsterId"] = 111143,
			["Name"] = "关卡地图11_14",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "天陨坑II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 390,
			},
		},
		[11115] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11114)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11115,
			["Desc"] = "一望无际的地坎丘陵，唯一特殊的地方在于任何生物行走于此，都没有办法生出一丝恶念，算是一片乐园。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111151)
end,
				function (API, OP)
	return API[1](OP, 111152)
end,
				function (API, OP)
	return API[1](OP, 111153)
end,
			},
			["ExpBonus"] = 390,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11115,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 89894,
			["MonsterId"] = 111153,
			["Name"] = "关卡地图11_15",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "堕龙原",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 390,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11116] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11115)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11115,
			["Desc"] = "一望无际的地坎丘陵，唯一特殊的地方在于任何生物行走于此，都没有办法生出一丝恶念，算是一片乐园。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111161)
end,
				function (API, OP)
	return API[1](OP, 111162)
end,
				function (API, OP)
	return API[1](OP, 111163)
end,
			},
			["ExpBonus"] = 390,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11116,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 90593,
			["MonsterId"] = 111163,
			["Name"] = "关卡地图11_16",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "堕龙原I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 390,
			},
		},
		[11117] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11116)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11115,
			["Desc"] = "一望无际的地坎丘陵，唯一特殊的地方在于任何生物行走于此，都没有办法生出一丝恶念，算是一片乐园。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111171)
end,
				function (API, OP)
	return API[1](OP, 111172)
end,
				function (API, OP)
	return API[1](OP, 111173)
end,
			},
			["ExpBonus"] = 390,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11117,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 91292,
			["MonsterId"] = 111173,
			["Name"] = "关卡地图11_17",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "堕龙原II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 390,
			},
		},
		[11118] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11117)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11115,
			["Desc"] = "一望无际的地坎丘陵，唯一特殊的地方在于任何生物行走于此，都没有办法生出一丝恶念，算是一片乐园。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 111181)
end,
				function (API, OP)
	return API[1](OP, 111182)
end,
				function (API, OP)
	return API[1](OP, 111183)
end,
			},
			["ExpBonus"] = 390,
			["FirstBonus"] = {
				["Item"] = {
					{
						610108,
						1,
					},
					{
						610208,
						1,
					},
					{
						610308,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11118,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610308,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 91991,
			["MonsterId"] = 111183,
			["Name"] = "关卡地图11_18",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "堕龙原III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 390,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11201] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11115)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11201,
			["Desc"] = "世界屋脊，它的神秘在于存在一群守护诸神庙宇的修士团。信仰所致，凡企图侵占庙宇都会受到誓死驱逐。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112011)
end,
				function (API, OP)
	return API[1](OP, 112012)
end,
				function (API, OP)
	return API[1](OP, 112013)
end,
			},
			["ExpBonus"] = 400,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11201,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 92690,
			["MonsterId"] = 112013,
			["Name"] = "关卡地图12_1",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "蚀余山I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 400,
			},
		},
		[11202] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11201)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11202,
			["Desc"] = "世界屋脊，它的神秘在于存在一群守护诸神庙宇的修士团。信仰所致，凡企图侵占庙宇都会受到誓死驱逐。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112021)
end,
				function (API, OP)
	return API[1](OP, 112022)
end,
				function (API, OP)
	return API[1](OP, 112023)
end,
			},
			["ExpBonus"] = 400,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11202,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 93389,
			["MonsterId"] = 112023,
			["Name"] = "关卡地图12_2",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "蚀余山II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 400,
			},
		},
		[11203] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11202)
end,
				function (API, OP)
	return API[2](OP,50)
end,
			},
			["ChatInfo"] = 11203,
			["Desc"] = "世界屋脊，它的神秘在于存在一群守护诸神庙宇的修士团。信仰所致，凡企图侵占庙宇都会受到誓死驱逐。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112031)
end,
				function (API, OP)
	return API[1](OP, 112032)
end,
				function (API, OP)
	return API[1](OP, 112033)
end,
			},
			["ExpBonus"] = 400,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11203,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 94088,
			["MonsterId"] = 112033,
			["Name"] = "关卡地图12_3",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "蚀余山III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 400,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11204] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11203)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11204,
			["Desc"] = "深涧之中有守护狮鹫栖息，也有避世神人居住。让人诟病的是这群人不懂唇亡齿的道路。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112041)
end,
				function (API, OP)
	return API[1](OP, 112042)
end,
				function (API, OP)
	return API[1](OP, 112043)
end,
			},
			["ExpBonus"] = 400,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11204,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 94787,
			["MonsterId"] = 112043,
			["Name"] = "关卡地图12_4",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "乞罗涧I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 400,
			},
		},
		[11205] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11204)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11205,
			["Desc"] = "深涧之中有守护狮鹫栖息，也有避世神人居住。让人诟病的是这群人不懂唇亡齿的道路。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112051)
end,
				function (API, OP)
	return API[1](OP, 112052)
end,
				function (API, OP)
	return API[1](OP, 112053)
end,
			},
			["ExpBonus"] = 400,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11205,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 95486,
			["MonsterId"] = 112053,
			["Name"] = "关卡地图12_5",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "乞罗涧II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 400,
			},
		},
		[11206] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11205)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11206,
			["Desc"] = "深涧之中有守护狮鹫栖息，也有避世神人居住。让人诟病的是这群人不懂唇亡齿的道路。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112061)
end,
				function (API, OP)
	return API[1](OP, 112062)
end,
				function (API, OP)
	return API[1](OP, 112063)
end,
			},
			["ExpBonus"] = 400,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11206,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 96185,
			["MonsterId"] = 112063,
			["Name"] = "关卡地图12_6",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "乞罗涧III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 400,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11207] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11206)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11207,
			["Desc"] = "一念天堂、一念地狱在这世界代表神性。如果选择踏上浊云，没有神性将永坠地狱，消失在这个世界。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112071)
end,
				function (API, OP)
	return API[1](OP, 112072)
end,
				function (API, OP)
	return API[1](OP, 112073)
end,
			},
			["ExpBonus"] = 410,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11207,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 96884,
			["MonsterId"] = 112073,
			["Name"] = "关卡地图12_7",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "浊云台I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 410,
			},
		},
		[11208] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11207)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11208,
			["Desc"] = "一念天堂、一念地狱在这世界代表神性。如果选择踏上浊云，没有神性将永坠地狱，消失在这个世界。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112081)
end,
				function (API, OP)
	return API[1](OP, 112082)
end,
				function (API, OP)
	return API[1](OP, 112083)
end,
			},
			["ExpBonus"] = 410,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11208,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 97583,
			["MonsterId"] = 112083,
			["Name"] = "关卡地图12_8",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "浊云台II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 410,
			},
		},
		[11209] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11208)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11209,
			["Desc"] = "一念天堂、一念地狱在这世界代表神性。如果选择踏上浊云，没有神性将永坠地狱，消失在这个世界。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112091)
end,
				function (API, OP)
	return API[1](OP, 112092)
end,
				function (API, OP)
	return API[1](OP, 112093)
end,
			},
			["ExpBonus"] = 410,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11209,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 98282,
			["MonsterId"] = 112093,
			["Name"] = "关卡地图12_9",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "浊云台III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 410,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11210] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11209)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11210,
			["Desc"] = "每个修士临终时都独自踏出蚀余山，进入比伦塔内依照阶梯镶阁的构造等待坐化，据说代表永生守护。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112101)
end,
				function (API, OP)
	return API[1](OP, 112102)
end,
				function (API, OP)
	return API[1](OP, 112103)
end,
			},
			["ExpBonus"] = 410,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11210,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 98981,
			["MonsterId"] = 112103,
			["Name"] = "关卡地图12_10",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "比伦塔I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 410,
			},
		},
		[11211] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11210)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11211,
			["Desc"] = "每个修士临终时都独自踏出蚀余山，进入比伦塔内依照阶梯镶阁的构造等待坐化，据说代表永生守护。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112111)
end,
				function (API, OP)
	return API[1](OP, 112112)
end,
				function (API, OP)
	return API[1](OP, 112113)
end,
			},
			["ExpBonus"] = 410,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11211,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 99680,
			["MonsterId"] = 112113,
			["Name"] = "关卡地图12_11",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "比伦塔II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 410,
			},
		},
		[11212] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11211)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11212,
			["Desc"] = "每个修士临终时都独自踏出蚀余山，进入比伦塔内依照阶梯镶阁的构造等待坐化，据说代表永生守护。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112121)
end,
				function (API, OP)
	return API[1](OP, 112122)
end,
				function (API, OP)
	return API[1](OP, 112123)
end,
			},
			["ExpBonus"] = 410,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11212,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 100379,
			["MonsterId"] = 112123,
			["Name"] = "关卡地图12_12",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "比伦塔III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 410,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11213] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11212)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11213,
			["Desc"] = "古籍记载转轮壁是动态的，按照某种摆动规则在运行；间隔千年，如果壁内部指针停滞，世界将等待一次审判。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112131)
end,
				function (API, OP)
	return API[1](OP, 112132)
end,
				function (API, OP)
	return API[1](OP, 112133)
end,
			},
			["ExpBonus"] = 420,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11213,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 101078,
			["MonsterId"] = 112133,
			["Name"] = "关卡地图12_13",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "转轮壁I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 420,
			},
		},
		[11214] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11213)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11214,
			["Desc"] = "古籍记载转轮壁是动态的，按照某种摆动规则在运行；间隔千年，如果壁内部指针停滞，世界将等待一次审判。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112141)
end,
				function (API, OP)
	return API[1](OP, 112142)
end,
				function (API, OP)
	return API[1](OP, 112143)
end,
			},
			["ExpBonus"] = 420,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11214,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 101777,
			["MonsterId"] = 112143,
			["Name"] = "关卡地图12_14",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "转轮壁II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 420,
			},
		},
		[11215] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11214)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11215,
			["Desc"] = "诸神庙宇译志中记录的虚幻一处。记录中描述:辉印贯穿血脉，诸神意志苏醒，云冕重现登顶。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112151)
end,
				function (API, OP)
	return API[1](OP, 112152)
end,
				function (API, OP)
	return API[1](OP, 112153)
end,
			},
			["ExpBonus"] = 420,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11215,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 102476,
			["MonsterId"] = 112153,
			["Name"] = "关卡地图12_15",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "云冕都",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 420,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11216] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11215)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11215,
			["Desc"] = "诸神庙宇译志中记录的虚幻一处。记录中描述:辉印贯穿血脉，诸神意志苏醒，云冕重现登顶。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112161)
end,
				function (API, OP)
	return API[1](OP, 112162)
end,
				function (API, OP)
	return API[1](OP, 112163)
end,
			},
			["ExpBonus"] = 420,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11216,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 103175,
			["MonsterId"] = 112163,
			["Name"] = "关卡地图12_16",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "云冕都I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 420,
			},
		},
		[11217] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11216)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11215,
			["Desc"] = "诸神庙宇译志中记录的虚幻一处。记录中描述:辉印贯穿血脉，诸神意志苏醒，云冕重现登顶。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112171)
end,
				function (API, OP)
	return API[1](OP, 112172)
end,
				function (API, OP)
	return API[1](OP, 112173)
end,
			},
			["ExpBonus"] = 420,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11217,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 103874,
			["MonsterId"] = 112173,
			["Name"] = "关卡地图12_17",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "云冕都II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 420,
			},
		},
		[11218] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11217)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11215,
			["Desc"] = "诸神庙宇译志中记录的虚幻一处。记录中描述:辉印贯穿血脉，诸神意志苏醒，云冕重现登顶。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 112181)
end,
				function (API, OP)
	return API[1](OP, 112182)
end,
				function (API, OP)
	return API[1](OP, 112183)
end,
			},
			["ExpBonus"] = 420,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11218,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 104573,
			["MonsterId"] = 112183,
			["Name"] = "关卡地图12_18",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "云冕都III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 420,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11301] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11215)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11301,
			["Desc"] = "流沙犹如瀑布一样沿着山岭的脉络倒垂而下。四季交替、山峦倒转却始终如一，奇怪的是山底高度未曾变化。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113011)
end,
				function (API, OP)
	return API[1](OP, 113012)
end,
				function (API, OP)
	return API[1](OP, 113013)
end,
			},
			["ExpBonus"] = 430,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11301,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 105272,
			["MonsterId"] = 113013,
			["Name"] = "关卡地图13_1",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "断沙岭I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 430,
			},
		},
		[11302] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11301)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11302,
			["Desc"] = "流沙犹如瀑布一样沿着山岭的脉络倒垂而下。四季交替、山峦倒转却始终如一，奇怪的是山底高度未曾变化。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113021)
end,
				function (API, OP)
	return API[1](OP, 113022)
end,
				function (API, OP)
	return API[1](OP, 113023)
end,
			},
			["ExpBonus"] = 430,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11302,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 105971,
			["MonsterId"] = 113023,
			["Name"] = "关卡地图13_2",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "断沙岭II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 430,
			},
		},
		[11303] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11302)
end,
				function (API, OP)
	return API[2](OP,55)
end,
			},
			["ChatInfo"] = 11303,
			["Desc"] = "流沙犹如瀑布一样沿着山岭的脉络倒垂而下。四季交替、山峦倒转却始终如一，奇怪的是山底高度未曾变化。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113031)
end,
				function (API, OP)
	return API[1](OP, 113032)
end,
				function (API, OP)
	return API[1](OP, 113033)
end,
			},
			["ExpBonus"] = 430,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11303,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 106670,
			["MonsterId"] = 113033,
			["Name"] = "关卡地图13_3",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "断沙岭III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 430,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11304] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11303)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11304,
			["Desc"] = "是否有风，沙丘总是如同波浪一样随着时间，变化着不同的纹路。不知从哪里来的枯骨在沙海中逐渐增多。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113041)
end,
				function (API, OP)
	return API[1](OP, 113042)
end,
				function (API, OP)
	return API[1](OP, 113043)
end,
			},
			["ExpBonus"] = 430,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11304,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 107369,
			["MonsterId"] = 113043,
			["Name"] = "关卡地图13_4",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "漠沙海I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 430,
			},
		},
		[11305] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11304)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11305,
			["Desc"] = "是否有风，沙丘总是如同波浪一样随着时间，变化着不同的纹路。不知从哪里来的枯骨在沙海中逐渐增多。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113051)
end,
				function (API, OP)
	return API[1](OP, 113052)
end,
				function (API, OP)
	return API[1](OP, 113053)
end,
			},
			["ExpBonus"] = 430,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11305,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 108068,
			["MonsterId"] = 113053,
			["Name"] = "关卡地图13_5",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "漠沙海II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 430,
			},
		},
		[11306] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11305)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11306,
			["Desc"] = "是否有风，沙丘总是如同波浪一样随着时间，变化着不同的纹路。不知从哪里来的枯骨在沙海中逐渐增多。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113061)
end,
				function (API, OP)
	return API[1](OP, 113062)
end,
				function (API, OP)
	return API[1](OP, 113063)
end,
			},
			["ExpBonus"] = 430,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11306,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610109,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 108767,
			["MonsterId"] = 113063,
			["Name"] = "关卡地图13_6",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "漠沙海III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 430,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11307] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11306)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11307,
			["Desc"] = "漩状沙虫眼在脱水的旅者渴望中如期而至。进入且付出一定代价就能换取生存，到底是什么代价没人愿意提及。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113071)
end,
				function (API, OP)
	return API[1](OP, 113072)
end,
				function (API, OP)
	return API[1](OP, 113073)
end,
			},
			["ExpBonus"] = 440,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11307,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 109466,
			["MonsterId"] = 113073,
			["Name"] = "关卡地图13_7",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "沙虫眼I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 440,
			},
		},
		[11308] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11307)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11308,
			["Desc"] = "漩状沙虫眼在脱水的旅者渴望中如期而至。进入且付出一定代价就能换取生存，到底是什么代价没人愿意提及。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113081)
end,
				function (API, OP)
	return API[1](OP, 113082)
end,
				function (API, OP)
	return API[1](OP, 113083)
end,
			},
			["ExpBonus"] = 440,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11308,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 110165,
			["MonsterId"] = 113083,
			["Name"] = "关卡地图13_8",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "沙虫眼II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 440,
			},
		},
		[11309] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11308)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11309,
			["Desc"] = "漩状沙虫眼在脱水的旅者渴望中如期而至。进入且付出一定代价就能换取生存，到底是什么代价没人愿意提及。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113091)
end,
				function (API, OP)
	return API[1](OP, 113092)
end,
				function (API, OP)
	return API[1](OP, 113093)
end,
			},
			["ExpBonus"] = 440,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11309,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 110864,
			["MonsterId"] = 113093,
			["Name"] = "关卡地图13_9",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "沙虫眼III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 440,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11310] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11309)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11310,
			["Desc"] = "神圣联盟元年，异域外族在此屠戮了上百万民众，鲜血让戈壁润成荒原，为纪念逝去亡灵故此更名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113101)
end,
				function (API, OP)
	return API[1](OP, 113102)
end,
				function (API, OP)
	return API[1](OP, 113103)
end,
			},
			["ExpBonus"] = 440,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11310,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 111563,
			["MonsterId"] = 113103,
			["Name"] = "关卡地图13_10",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "英灵原I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 440,
			},
		},
		[11311] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11310)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11311,
			["Desc"] = "神圣联盟元年，异域外族在此屠戮了上百万民众，鲜血让戈壁润成荒原，为纪念逝去亡灵故此更名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113111)
end,
				function (API, OP)
	return API[1](OP, 113112)
end,
				function (API, OP)
	return API[1](OP, 113113)
end,
			},
			["ExpBonus"] = 440,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11311,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 112262,
			["MonsterId"] = 113113,
			["Name"] = "关卡地图13_11",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "英灵原II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 440,
			},
		},
		[11312] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11311)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11312,
			["Desc"] = "神圣联盟元年，异域外族在此屠戮了上百万民众，鲜血让戈壁润成荒原，为纪念逝去亡灵故此更名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113121)
end,
				function (API, OP)
	return API[1](OP, 113122)
end,
				function (API, OP)
	return API[1](OP, 113123)
end,
			},
			["ExpBonus"] = 440,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11312,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610209,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 112961,
			["MonsterId"] = 113123,
			["Name"] = "关卡地图13_12",
			["NeedPower"] = 8,
			["ShapeId"] = 4001,
			["ShowName"] = "英灵原III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 440,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11313] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11312)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11313,
			["Desc"] = "盘卧一头炎魔，即便异域现已控制整个炎沙崖窟地区，但都不敢进入。据传炎魔身死之日，大陆也将和平。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113131)
end,
				function (API, OP)
	return API[1](OP, 113132)
end,
				function (API, OP)
	return API[1](OP, 113133)
end,
			},
			["ExpBonus"] = 450,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11313,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 113660,
			["MonsterId"] = 113133,
			["Name"] = "关卡地图13_13",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "炎门窟I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 450,
			},
		},
		[11314] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11313)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11314,
			["Desc"] = "盘卧一头炎魔，即便异域现已控制整个炎沙崖窟地区，但都不敢进入。据传炎魔身死之日，大陆也将和平。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113141)
end,
				function (API, OP)
	return API[1](OP, 113142)
end,
				function (API, OP)
	return API[1](OP, 113143)
end,
			},
			["ExpBonus"] = 450,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11314,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 114359,
			["MonsterId"] = 113143,
			["Name"] = "关卡地图13_14",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "炎门窟II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 450,
			},
		},
		[11315] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11314)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11315,
			["Desc"] = "炎沙崖窟的最高处，也是炎门窟的主体山峦。传闻每百年炎魔要蜕变一次，而蜕变产物逐渐石化成山。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113151)
end,
				function (API, OP)
	return API[1](OP, 113152)
end,
				function (API, OP)
	return API[1](OP, 113153)
end,
			},
			["ExpBonus"] = 450,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11315,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 115058,
			["MonsterId"] = 113153,
			["Name"] = "关卡地图13_15",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "望欲崖",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 450,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11316] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11315)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11315,
			["Desc"] = "炎沙崖窟的最高处，也是炎门窟的主体山峦。传闻每百年炎魔要蜕变一次，而蜕变产物逐渐石化成山。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113161)
end,
				function (API, OP)
	return API[1](OP, 113162)
end,
				function (API, OP)
	return API[1](OP, 113163)
end,
			},
			["ExpBonus"] = 450,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11316,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 115757,
			["MonsterId"] = 113163,
			["Name"] = "关卡地图13_16",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "望欲崖I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 450,
			},
		},
		[11317] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11316)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11315,
			["Desc"] = "炎沙崖窟的最高处，也是炎门窟的主体山峦。传闻每百年炎魔要蜕变一次，而蜕变产物逐渐石化成山。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113171)
end,
				function (API, OP)
	return API[1](OP, 113172)
end,
				function (API, OP)
	return API[1](OP, 113173)
end,
			},
			["ExpBonus"] = 450,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11317,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 116456,
			["MonsterId"] = 113173,
			["Name"] = "关卡地图13_17",
			["NeedPower"] = 8,
			["ShapeId"] = 10000,
			["ShowName"] = "望欲崖II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 450,
			},
		},
		[11318] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 8,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11317)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11315,
			["Desc"] = "炎沙崖窟的最高处，也是炎门窟的主体山峦。传闻每百年炎魔要蜕变一次，而蜕变产物逐渐石化成山。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 113181)
end,
				function (API, OP)
	return API[1](OP, 113182)
end,
				function (API, OP)
	return API[1](OP, 113183)
end,
			},
			["ExpBonus"] = 450,
			["FirstBonus"] = {
				["Item"] = {
					{
						610109,
						1,
					},
					{
						610209,
						1,
					},
					{
						610309,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11318,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610309,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 117155,
			["MonsterId"] = 113183,
			["Name"] = "关卡地图13_18",
			["NeedPower"] = 8,
			["ShapeId"] = 1001,
			["ShowName"] = "望欲崖III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 450,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11401] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11315)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11401,
			["Desc"] = "左右相对的两座连体山峰，是魔都外域的有效天然屏障，同样也是异域外族豢养魔兽的牧场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114011)
end,
				function (API, OP)
	return API[1](OP, 114012)
end,
				function (API, OP)
	return API[1](OP, 114013)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11401,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 117854,
			["MonsterId"] = 114013,
			["Name"] = "关卡地图14_1",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "域魔峰I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
		},
		[11402] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11401)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11402,
			["Desc"] = "左右相对的两座连体山峰，是魔都外域的有效天然屏障，同样也是异域外族豢养魔兽的牧场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114021)
end,
				function (API, OP)
	return API[1](OP, 114022)
end,
				function (API, OP)
	return API[1](OP, 114023)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11402,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 118553,
			["MonsterId"] = 114023,
			["Name"] = "关卡地图14_2",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "域魔峰II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
		},
		[11403] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11402)
end,
				function (API, OP)
	return API[2](OP,60)
end,
			},
			["ChatInfo"] = 11403,
			["Desc"] = "左右相对的两座连体山峰，是魔都外域的有效天然屏障，同样也是异域外族豢养魔兽的牧场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114031)
end,
				function (API, OP)
	return API[1](OP, 114032)
end,
				function (API, OP)
	return API[1](OP, 114033)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11403,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 119252,
			["MonsterId"] = 114033,
			["Name"] = "关卡地图14_3",
			["NeedPower"] = 10,
			["ShapeId"] = 1001,
			["ShowName"] = "域魔峰III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11404] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11403)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11404,
			["Desc"] = "境内山笋林立，道路曲折诡异。驻扎着异域十大军团，虽然彼此泾渭分明，但在布防上却无懈可击。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114041)
end,
				function (API, OP)
	return API[1](OP, 114042)
end,
				function (API, OP)
	return API[1](OP, 114043)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11404,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 119951,
			["MonsterId"] = 114043,
			["Name"] = "关卡地图14_4",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "炽藤境I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
		},
		[11405] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11404)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11405,
			["Desc"] = "境内山笋林立，道路曲折诡异。驻扎着异域十大军团，虽然彼此泾渭分明，但在布防上却无懈可击。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114051)
end,
				function (API, OP)
	return API[1](OP, 114052)
end,
				function (API, OP)
	return API[1](OP, 114053)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11405,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 120650,
			["MonsterId"] = 114053,
			["Name"] = "关卡地图14_5",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "炽藤境II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
		},
		[11406] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11405)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11406,
			["Desc"] = "境内山笋林立，道路曲折诡异。驻扎着异域十大军团，虽然彼此泾渭分明，但在布防上却无懈可击。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114061)
end,
				function (API, OP)
	return API[1](OP, 114062)
end,
				function (API, OP)
	return API[1](OP, 114063)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11406,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 121349,
			["MonsterId"] = 114063,
			["Name"] = "关卡地图14_6",
			["NeedPower"] = 10,
			["ShapeId"] = 4001,
			["ShowName"] = "炽藤境III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11407] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11406)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11407,
			["Desc"] = "始终在上演被异域族驱使血脉者斗兽般虐杀的戏码；又是地脉四方阵的魔演之地很难逃脱或者攻入。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114071)
end,
				function (API, OP)
	return API[1](OP, 114072)
end,
				function (API, OP)
	return API[1](OP, 114073)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11407,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 122048,
			["MonsterId"] = 114073,
			["Name"] = "关卡地图14_7",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "焚尸谷I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
		},
		[11408] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11407)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11408,
			["Desc"] = "始终在上演被异域族驱使血脉者斗兽般虐杀的戏码；又是地脉四方阵的魔演之地很难逃脱或者攻入。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114081)
end,
				function (API, OP)
	return API[1](OP, 114082)
end,
				function (API, OP)
	return API[1](OP, 114083)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11408,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 122747,
			["MonsterId"] = 114083,
			["Name"] = "关卡地图14_8",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "焚尸谷II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
		},
		[11409] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11408)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11409,
			["Desc"] = "始终在上演被异域族驱使血脉者斗兽般虐杀的戏码；又是地脉四方阵的魔演之地很难逃脱或者攻入。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114091)
end,
				function (API, OP)
	return API[1](OP, 114092)
end,
				function (API, OP)
	return API[1](OP, 114093)
end,
			},
			["ExpBonus"] = 460,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11409,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 123446,
			["MonsterId"] = 114093,
			["Name"] = "关卡地图14_9",
			["NeedPower"] = 10,
			["ShapeId"] = 4001,
			["ShowName"] = "焚尸谷III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 460,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11410] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11409)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11410,
			["Desc"] = "异域外族建立的第一座机械堡垒，封存有异族掠夺的重要资源。也是异种贵族的日常起居之地。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114101)
end,
				function (API, OP)
	return API[1](OP, 114102)
end,
				function (API, OP)
	return API[1](OP, 114103)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11410,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 124145,
			["MonsterId"] = 114103,
			["Name"] = "关卡地图14_10",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "机械窟I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11411] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11410)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11411,
			["Desc"] = "异域外族建立的第一座机械堡垒，封存有异族掠夺的重要资源。也是异种贵族的日常起居之地。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114111)
end,
				function (API, OP)
	return API[1](OP, 114112)
end,
				function (API, OP)
	return API[1](OP, 114113)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11411,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 124844,
			["MonsterId"] = 114113,
			["Name"] = "关卡地图14_11",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "机械窟II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11412] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11411)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11412,
			["Desc"] = "异域外族建立的第一座机械堡垒，封存有异族掠夺的重要资源。也是异种贵族的日常起居之地。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114121)
end,
				function (API, OP)
	return API[1](OP, 114122)
end,
				function (API, OP)
	return API[1](OP, 114123)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11412,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 125543,
			["MonsterId"] = 114123,
			["Name"] = "关卡地图14_12",
			["NeedPower"] = 10,
			["ShapeId"] = 4001,
			["ShowName"] = "机械窟III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11413] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11412)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11413,
			["Desc"] = "天外巨魔的头颅所化，乃是异域族群的镇命神物。曾屡次被血脉冒险者偷袭，但都惨遇失败。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114131)
end,
				function (API, OP)
	return API[1](OP, 114132)
end,
				function (API, OP)
	return API[1](OP, 114133)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11413,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 126242,
			["MonsterId"] = 114133,
			["Name"] = "关卡地图14_13",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "神渊口I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11414] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11413)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11414,
			["Desc"] = "天外巨魔的头颅所化，乃是异域族群的镇命神物。曾屡次被血脉冒险者偷袭，但都惨遇失败。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114141)
end,
				function (API, OP)
	return API[1](OP, 114142)
end,
				function (API, OP)
	return API[1](OP, 114143)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11414,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 126941,
			["MonsterId"] = 114143,
			["Name"] = "关卡地图14_14",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "神渊口II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11415] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11414)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11415,
			["Desc"] = "魔都外域的至高建筑，异域外族执权中心。对于神圣联盟来说，至今都没有刺探到任何内部信息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114151)
end,
				function (API, OP)
	return API[1](OP, 114152)
end,
				function (API, OP)
	return API[1](OP, 114153)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11415,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 127640,
			["MonsterId"] = 114153,
			["Name"] = "关卡地图14_15",
			["NeedPower"] = 10,
			["ShapeId"] = 1001,
			["ShowName"] = "皇爵殿",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11416] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11415)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11415,
			["Desc"] = "魔都外域的至高建筑，异域外族执权中心。对于神圣联盟来说，至今都没有刺探到任何内部信息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114161)
end,
				function (API, OP)
	return API[1](OP, 114162)
end,
				function (API, OP)
	return API[1](OP, 114163)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11416,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 128339,
			["MonsterId"] = 114163,
			["Name"] = "关卡地图14_16",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "皇爵殿I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11417] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11416)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11415,
			["Desc"] = "魔都外域的至高建筑，异域外族执权中心。对于神圣联盟来说，至今都没有刺探到任何内部信息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114171)
end,
				function (API, OP)
	return API[1](OP, 114172)
end,
				function (API, OP)
	return API[1](OP, 114173)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11417,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 129038,
			["MonsterId"] = 114173,
			["Name"] = "关卡地图14_17",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "皇爵殿II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11418] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11417)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11415,
			["Desc"] = "魔都外域的至高建筑，异域外族执权中心。对于神圣联盟来说，至今都没有刺探到任何内部信息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 114181)
end,
				function (API, OP)
	return API[1](OP, 114182)
end,
				function (API, OP)
	return API[1](OP, 114183)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11418,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 129737,
			["MonsterId"] = 114183,
			["Name"] = "关卡地图14_18",
			["NeedPower"] = 10,
			["ShapeId"] = 1001,
			["ShowName"] = "皇爵殿III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11501] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11415)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11501,
			["Desc"] = "不属于这个世界的山峰，由域外而来时遭遇不明碰撞导致断裂坍塌，对异域外族有着非常重要的作用。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115011)
end,
				function (API, OP)
	return API[1](OP, 115012)
end,
				function (API, OP)
	return API[1](OP, 115013)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11501,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 130436,
			["MonsterId"] = 115013,
			["Name"] = "关卡地图15_1",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "穹符山I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11502] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11501)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11502,
			["Desc"] = "不属于这个世界的山峰，由域外而来时遭遇不明碰撞导致断裂坍塌，对异域外族有着非常重要的作用。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115021)
end,
				function (API, OP)
	return API[1](OP, 115022)
end,
				function (API, OP)
	return API[1](OP, 115023)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11502,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 131135,
			["MonsterId"] = 115023,
			["Name"] = "关卡地图15_2",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "穹符山II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11503] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11502)
end,
				function (API, OP)
	return API[2](OP,65)
end,
			},
			["ChatInfo"] = 11503,
			["Desc"] = "不属于这个世界的山峰，由域外而来时遭遇不明碰撞导致断裂坍塌，对异域外族有着非常重要的作用。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115031)
end,
				function (API, OP)
	return API[1](OP, 115032)
end,
				function (API, OP)
	return API[1](OP, 115033)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11503,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 131834,
			["MonsterId"] = 115033,
			["Name"] = "关卡地图15_3",
			["NeedPower"] = 10,
			["ShapeId"] = 1001,
			["ShowName"] = "穹符山III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11504] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11503)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11504,
			["Desc"] = "由于地磁不符合大陆的变化规律，不断遭受天雷的轰击，这对异族出入空间桥眼造成严重的威胁。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115041)
end,
				function (API, OP)
	return API[1](OP, 115042)
end,
				function (API, OP)
	return API[1](OP, 115043)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11504,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 132533,
			["MonsterId"] = 115043,
			["Name"] = "关卡地图15_4",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "天堑层I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11505] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11504)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11505,
			["Desc"] = "由于地磁不符合大陆的变化规律，不断遭受天雷的轰击，这对异族出入空间桥眼造成严重的威胁。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115051)
end,
				function (API, OP)
	return API[1](OP, 115052)
end,
				function (API, OP)
	return API[1](OP, 115053)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11505,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 133232,
			["MonsterId"] = 115053,
			["Name"] = "关卡地图15_5",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "天堑层II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
		},
		[11506] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11505)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11506,
			["Desc"] = "由于地磁不符合大陆的变化规律，不断遭受天雷的轰击，这对异族出入空间桥眼造成严重的威胁。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115061)
end,
				function (API, OP)
	return API[1](OP, 115062)
end,
				function (API, OP)
	return API[1](OP, 115063)
end,
			},
			["ExpBonus"] = 470,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11506,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610110,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 133931,
			["MonsterId"] = 115063,
			["Name"] = "关卡地图15_6",
			["NeedPower"] = 10,
			["ShapeId"] = 4001,
			["ShowName"] = "天堑层III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 470,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11507] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11506)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11507,
			["Desc"] = "笼罩在空间桥眼上层的一团有毒云雾层，并不是地理环境演化而成，而是异族的结界防护罩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115071)
end,
				function (API, OP)
	return API[1](OP, 115072)
end,
				function (API, OP)
	return API[1](OP, 115073)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11507,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 134630,
			["MonsterId"] = 115073,
			["Name"] = "关卡地图15_7",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "魔云海I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11508] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11507)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11508,
			["Desc"] = "笼罩在空间桥眼上层的一团有毒云雾层，并不是地理环境演化而成，而是异族的结界防护罩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115081)
end,
				function (API, OP)
	return API[1](OP, 115082)
end,
				function (API, OP)
	return API[1](OP, 115083)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11508,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 135329,
			["MonsterId"] = 115083,
			["Name"] = "关卡地图15_8",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "魔云海II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11509] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11508)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11509,
			["Desc"] = "笼罩在空间桥眼上层的一团有毒云雾层，并不是地理环境演化而成，而是异族的结界防护罩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115091)
end,
				function (API, OP)
	return API[1](OP, 115092)
end,
				function (API, OP)
	return API[1](OP, 115093)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11509,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 136028,
			["MonsterId"] = 115093,
			["Name"] = "关卡地图15_9",
			["NeedPower"] = 10,
			["ShapeId"] = 4001,
			["ShowName"] = "魔云海III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11510] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11509)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11510,
			["Desc"] = "不断翻腾着地火岩浆，但凡有人兽接近都直接化为飞灰。唯独特殊材质的空间桥不受影响，似乎还能汲取魔力",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115101)
end,
				function (API, OP)
	return API[1](OP, 115102)
end,
				function (API, OP)
	return API[1](OP, 115103)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11510,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 136727,
			["MonsterId"] = 115103,
			["Name"] = "关卡地图15_10",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "地焰渊I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11511] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11510)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11511,
			["Desc"] = "不断翻腾着地火岩浆，但凡有人兽接近都直接化为飞灰。唯独特殊材质的空间桥不受影响，似乎还能汲取魔力",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115111)
end,
				function (API, OP)
	return API[1](OP, 115112)
end,
				function (API, OP)
	return API[1](OP, 115113)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11511,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 137426,
			["MonsterId"] = 115113,
			["Name"] = "关卡地图15_11",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "地焰渊II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11512] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11511)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11512,
			["Desc"] = "不断翻腾着地火岩浆，但凡有人兽接近都直接化为飞灰。唯独特殊材质的空间桥不受影响，似乎还能汲取魔力",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115121)
end,
				function (API, OP)
	return API[1](OP, 115122)
end,
				function (API, OP)
	return API[1](OP, 115123)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11512,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610210,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 138125,
			["MonsterId"] = 115123,
			["Name"] = "关卡地图15_12",
			["NeedPower"] = 10,
			["ShapeId"] = 4001,
			["ShowName"] = "地焰渊III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11513] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11512)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11513,
			["Desc"] = "不断有异族生物穿梭其中，应该是域外通往大陆的一处通道。目前神圣联盟正在谋划破坏。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115131)
end,
				function (API, OP)
	return API[1](OP, 115132)
end,
				function (API, OP)
	return API[1](OP, 115133)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11513,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 138824,
			["MonsterId"] = 115133,
			["Name"] = "关卡地图15_13",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "溯洄缝I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11514] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11513)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11514,
			["Desc"] = "不断有异族生物穿梭其中，应该是域外通往大陆的一处通道。目前神圣联盟正在谋划破坏。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115141)
end,
				function (API, OP)
	return API[1](OP, 115142)
end,
				function (API, OP)
	return API[1](OP, 115143)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11514,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 139523,
			["MonsterId"] = 115143,
			["Name"] = "关卡地图15_14",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "溯洄缝II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11515] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11514)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11515,
			["Desc"] = "溯洄缝周围的网纹状壁垒，作用目前尚未探明。不过据神圣联盟高层猜测应该是魔力储存和防护层一体物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115151)
end,
				function (API, OP)
	return API[1](OP, 115152)
end,
				function (API, OP)
	return API[1](OP, 115153)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11515,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 140222,
			["MonsterId"] = 115153,
			["Name"] = "关卡地图15_15",
			["NeedPower"] = 10,
			["ShapeId"] = 1001,
			["ShowName"] = "异境垒",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[11516] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11515)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11515,
			["Desc"] = "溯洄缝周围的网纹状壁垒，作用目前尚未探明。不过据神圣联盟高层猜测应该是魔力储存和防护层一体物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115161)
end,
				function (API, OP)
	return API[1](OP, 115162)
end,
				function (API, OP)
	return API[1](OP, 115163)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11516,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 140921,
			["MonsterId"] = 115163,
			["Name"] = "关卡地图15_16",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "异境垒I",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11517] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11516)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11515,
			["Desc"] = "溯洄缝周围的网纹状壁垒，作用目前尚未探明。不过据神圣联盟高层猜测应该是魔力储存和防护层一体物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115171)
end,
				function (API, OP)
	return API[1](OP, 115172)
end,
				function (API, OP)
	return API[1](OP, 115173)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11517,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 141620,
			["MonsterId"] = 115173,
			["Name"] = "关卡地图15_17",
			["NeedPower"] = 10,
			["ShapeId"] = 10000,
			["ShowName"] = "异境垒II",
			["StageType"] = 1,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
		},
		[11518] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 10,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,11517)
end,
				function (API, OP)
	return API[2](OP,70)
end,
			},
			["ChatInfo"] = 11515,
			["Desc"] = "溯洄缝周围的网纹状壁垒，作用目前尚未探明。不过据神圣联盟高层猜测应该是魔力储存和防护层一体物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 115181)
end,
				function (API, OP)
	return API[1](OP, 115182)
end,
				function (API, OP)
	return API[1](OP, 115183)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						610110,
						1,
					},
					{
						610210,
						1,
					},
					{
						610310,
						1,
					},
				},
				["Money"] = 2000,
			},
			["Id"] = 11518,
			["ItemDesc"] = {
				["Item"] = {
					610001,
					610310,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 142319,
			["MonsterId"] = 115183,
			["Name"] = "关卡地图15_18",
			["NeedPower"] = 10,
			["ShapeId"] = 1001,
			["ShowName"] = "异境垒III",
			["StageType"] = 2,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20101] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,10101)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "神圣联盟“遗族计划”初探的一段珊瑚通道，已暂时搁浅；有心人总想找到些蛛丝马迹，窥的一丝际遇。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 201012)
end,
				function (API, OP)
	return API[1](OP, 201013)
end,
			},
			["ExpBonus"] = 200,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110201,
						1,
					},
					{
						2210201,
						1,
					},
					{
						3000201,
						20,
					},
					{
						500006,
						2,
					},
				},
			},
			["Id"] = 20101,
			["ItemDesc"] = {
				["Item"] = {
					2110201,
					2210201,
					3000201,
					500006,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 3860,
			["MonsterId"] = 201013,
			["Name"] = "英雄关卡地图1_1",
			["NeedPower"] = 12,
			["ShapeId"] = 1019,
			["ShowName"] = "厄尔湾",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 200,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500006,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于60%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,60)
end,
			},
		},
		[20102] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20101)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "曲境内的前沿地带，目前已被完全开放。偶有异域外族探子进入窃取地标，似乎在执行什么秘密计划。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 201022)
end,
				function (API, OP)
	return API[1](OP, 201023)
end,
			},
			["ExpBonus"] = 208,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110201,
						1,
					},
					{
						2310201,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500004,
						2,
					},
				},
			},
			["Id"] = 20102,
			["ItemDesc"] = {
				["Item"] = {
					2110201,
					2310201,
					3000201,
					500004,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 4260,
			["MonsterId"] = 201023,
			["Name"] = "英雄关卡地图1_2",
			["NeedPower"] = 12,
			["ShapeId"] = 2012,
			["ShowName"] = "无垠滩",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 208,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500004,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于60%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,60)
end,
			},
		},
		[20103] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20102)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "珊瑚礁岩嶙峋，将全部位置标注在图纸上，不难发现其构成某种特殊的阵势，是曲境的门户。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 201032)
end,
				function (API, OP)
	return API[1](OP, 201033)
end,
			},
			["ExpBonus"] = 216,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210201,
						1,
					},
					{
						2310201,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500009,
						2,
					},
				},
			},
			["Id"] = 20103,
			["ItemDesc"] = {
				["Item"] = {
					2210201,
					2310201,
					3000201,
					500009,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 5620,
			["MonsterId"] = 201033,
			["Name"] = "英雄关卡地图1_3",
			["NeedPower"] = 12,
			["ShapeId"] = 2004,
			["ShowName"] = "琅琊沟",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 216,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500009,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于60%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,60)
end,
			},
		},
		[20104] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20103)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "死寂的水域，没有光源映射但海水透着奇异的光彩，定时转换不同色泽，也没有水生物存在。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 201042)
end,
				function (API, OP)
	return API[1](OP, 201043)
end,
			},
			["ExpBonus"] = 224,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210201,
						1,
					},
					{
						2410201,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500016,
						2,
					},
				},
			},
			["Id"] = 20104,
			["ItemDesc"] = {
				["Item"] = {
					2210201,
					2410201,
					3000201,
					500016,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 6660,
			["MonsterId"] = 201043,
			["Name"] = "英雄关卡地图1_4",
			["NeedPower"] = 12,
			["ShapeId"] = 2001,
			["ShowName"] = "彩虹域",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 224,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500016,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于60%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,60)
end,
			},
		},
		[20105] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20104)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "通往曲境六层的一段转折，海草交错，空间不稳定。稍不注意就被挪移到别的空间，再也无法回来。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 201052)
end,
				function (API, OP)
	return API[1](OP, 201053)
end,
			},
			["ExpBonus"] = 232,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410201,
						1,
					},
					{
						2310201,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500008,
						2,
					},
				},
			},
			["Id"] = 20105,
			["ItemDesc"] = {
				["Item"] = {
					2410201,
					2310201,
					3000201,
					500008,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 6800,
			["MonsterId"] = 201053,
			["Name"] = "英雄关卡地图1_5",
			["NeedPower"] = 12,
			["ShapeId"] = 2006,
			["ShowName"] = "悼亡境",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 232,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500008,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于60%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,60)
end,
			},
		},
		[20106] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20105)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "尚未探索一段珊瑚林，据说有大型的海兽蜗居在此。也是血脉冒险者经常游历的一段重要区域。",
			["EventTypes"] = {
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 201062)
end,
				function (API, OP)
	return API[1](OP, 201063)
end,
			},
			["ExpBonus"] = 240,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410201,
						1,
					},
					{
						2110201,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500007,
						2,
					},
				},
			},
			["Id"] = 20106,
			["ItemDesc"] = {
				["Item"] = {
					2410201,
					2110201,
					3000201,
					500007,
				},
			},
			["MapId"] = 1,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 7240,
			["MonsterId"] = 201063,
			["Name"] = "英雄关卡地图1_6",
			["NeedPower"] = 12,
			["ShapeId"] = 2014,
			["ShowName"] = "魔龙岭",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 240,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500007,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于60%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,60)
end,
			},
		},
		[20201] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20106)
end,
				function (API, OP)
	return API[3](OP,10209)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "毗邻珊瑚曲境以北，潮汐变化让曲境中的腐物长期不断冲刷堆积向雷泽而逐渐演化的一段湿地。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 202011)
end,
				function (API, OP)
	return API[1](OP, 202012)
end,
				function (API, OP)
	return API[1](OP, 202013)
end,
			},
			["ExpBonus"] = 248,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110301,
						1,
					},
					{
						2210301,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500005,
						2,
					},
				},
			},
			["Id"] = 20201,
			["ItemDesc"] = {
				["Item"] = {
					2110301,
					2210301,
					3000201,
					500005,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 8247,
			["MonsterId"] = 202013,
			["Name"] = "英雄关卡地图2_1",
			["NeedPower"] = 12,
			["ShapeId"] = 2005,
			["ShowName"] = "上淤泽",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 248,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500005,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20202] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20201)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "传说曾经一魔兽蜕变入神界失败，而心生怨恨。盘踞在海中对着天空嘶吼，临死时不敢而化为沙滩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 202021)
end,
				function (API, OP)
	return API[1](OP, 202022)
end,
				function (API, OP)
	return API[1](OP, 202023)
end,
			},
			["ExpBonus"] = 256,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110301,
						1,
					},
					{
						2310301,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 20202,
			["ItemDesc"] = {
				["Item"] = {
					2110301,
					2310301,
					3000201,
					500011,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 8492,
			["MonsterId"] = 202023,
			["Name"] = "英雄关卡地图2_2",
			["NeedPower"] = 12,
			["ShapeId"] = 1014,
			["ShowName"] = "海问滩",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 256,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20203] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20202)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "神圣联盟戒严的一段区域，常年雷电暴虐。据说是雷电的发源地，产雷鸣石，有助于血脉者的修炼。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 202031)
end,
				function (API, OP)
	return API[1](OP, 202032)
end,
				function (API, OP)
	return API[1](OP, 202033)
end,
			},
			["ExpBonus"] = 264,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210301,
						1,
					},
					{
						2310301,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500018,
						2,
					},
				},
			},
			["Id"] = 20203,
			["ItemDesc"] = {
				["Item"] = {
					2210301,
					2310301,
					3000201,
					500018,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 8736,
			["MonsterId"] = 202033,
			["Name"] = "英雄关卡地图2_3",
			["NeedPower"] = 12,
			["ShapeId"] = 2007,
			["ShowName"] = "雷临池",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 264,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500018,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20204] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20203)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "一群精灵幻化的翠竹林，但没有有遇到过。传说只有心灵纯净的人们才能有幸看到它们，可以让心得到救赎。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 202041)
end,
				function (API, OP)
	return API[1](OP, 202042)
end,
				function (API, OP)
	return API[1](OP, 202043)
end,
			},
			["ExpBonus"] = 272,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210301,
						1,
					},
					{
						2410301,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500003,
						2,
					},
				},
			},
			["Id"] = 20204,
			["ItemDesc"] = {
				["Item"] = {
					2210301,
					2410301,
					3000201,
					500003,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 8981,
			["MonsterId"] = 202043,
			["Name"] = "英雄关卡地图2_4",
			["NeedPower"] = 12,
			["ShapeId"] = 2016,
			["ShowName"] = "化灵林",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 272,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500003,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20205] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20204)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "被翠竹林隔离出，地表蒙着层层薄雾的一座崎岖起伏的岛屿，看似可一窥全貌；但置身其中往往就迷失方向。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 202051)
end,
				function (API, OP)
	return API[1](OP, 202052)
end,
				function (API, OP)
	return API[1](OP, 202053)
end,
			},
			["ExpBonus"] = 280,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410301,
						1,
					},
					{
						2310301,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500012,
						2,
					},
				},
			},
			["Id"] = 20205,
			["ItemDesc"] = {
				["Item"] = {
					2410301,
					2310301,
					3000201,
					500012,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 9225,
			["MonsterId"] = 202053,
			["Name"] = "英雄关卡地图2_5",
			["NeedPower"] = 12,
			["ShapeId"] = 1003,
			["ShowName"] = "迷雾岛",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 280,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500012,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20206] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20205)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "终年被黑云翻腾，被雷临池上空雷电包围着。神圣联盟消息:盘踞着一群魔鬼，有幸进入者，都已化为魔鬼的血食。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 202061)
end,
				function (API, OP)
	return API[1](OP, 202062)
end,
				function (API, OP)
	return API[1](OP, 202063)
end,
			},
			["ExpBonus"] = 288,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410301,
						1,
					},
					{
						2110301,
						1,
					},
					{
						3000201,
						3,
					},
					{
						500022,
						2,
					},
				},
			},
			["Id"] = 20206,
			["ItemDesc"] = {
				["Item"] = {
					2410301,
					2110301,
					3000201,
					500022,
				},
			},
			["MapId"] = 2,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 13033,
			["MonsterId"] = 202063,
			["Name"] = "英雄关卡地图2_6",
			["NeedPower"] = 12,
			["ShapeId"] = 2015,
			["ShowName"] = "东崖廷",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 288,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500022,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20301] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20206)
end,
				function (API, OP)
	return API[3](OP,10310)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "神圣教廷时代追随圣女的十万计圣仆被天火埋葬在帕雅山脚，怨气腐蚀着鲜血灌入地心坍塌成渊。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 203011)
end,
				function (API, OP)
	return API[1](OP, 203012)
end,
				function (API, OP)
	return API[1](OP, 203013)
end,
			},
			["ExpBonus"] = 296,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110301,
						1,
					},
					{
						2210301,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500001,
						2,
					},
				},
			},
			["Id"] = 20301,
			["ItemDesc"] = {
				["Item"] = {
					2110301,
					2210301,
					3000202,
					500001,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 13033,
			["MonsterId"] = 203013,
			["Name"] = "英雄关卡地图3_1",
			["NeedPower"] = 12,
			["ShapeId"] = 1008,
			["ShowName"] = "冥魇渊",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 296,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500001,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20302] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20301)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "山脊终年腾烟翻灼，随风而来的枯草在空中就已化为灰烬。奇怪的是山脊中却遍布某种幽兰色的野花。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 203021)
end,
				function (API, OP)
	return API[1](OP, 203022)
end,
				function (API, OP)
	return API[1](OP, 203023)
end,
			},
			["ExpBonus"] = 304,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110301,
						1,
					},
					{
						2310301,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500015,
						2,
					},
				},
			},
			["Id"] = 20302,
			["ItemDesc"] = {
				["Item"] = {
					2110301,
					2310301,
					3000202,
					500015,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 13277,
			["MonsterId"] = 203023,
			["Name"] = "英雄关卡地图3_2",
			["NeedPower"] = 12,
			["ShapeId"] = 1010,
			["ShowName"] = "狱火境",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 304,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500015,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20303] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20302)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "延伸盘旋到帕雅女峰山腰的小道，不知道是野兽还是人踩出来的。行走需注意提防随时从周围窜出来的虫蚁。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 203031)
end,
				function (API, OP)
	return API[1](OP, 203032)
end,
				function (API, OP)
	return API[1](OP, 203033)
end,
			},
			["ExpBonus"] = 312,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210301,
						1,
					},
					{
						2310301,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500006,
						2,
					},
				},
			},
			["Id"] = 20303,
			["ItemDesc"] = {
				["Item"] = {
					2210301,
					2310301,
					3000202,
					500006,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 13522,
			["MonsterId"] = 203033,
			["Name"] = "英雄关卡地图3_3",
			["NeedPower"] = 12,
			["ShapeId"] = 1019,
			["ShowName"] = "蛇盘道",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 312,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500006,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20304] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20303)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "女神围巾般的断壁层，覆盖着皑皑的积雪映射在阳光下伴随沙沙的滑雪声和一群小孩子嬉笑的欢语。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 203041)
end,
				function (API, OP)
	return API[1](OP, 203042)
end,
				function (API, OP)
	return API[1](OP, 203043)
end,
			},
			["ExpBonus"] = 320,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210301,
						1,
					},
					{
						2410301,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500007,
						2,
					},
				},
			},
			["Id"] = 20304,
			["ItemDesc"] = {
				["Item"] = {
					2210301,
					2410301,
					3000202,
					500007,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 13766,
			["MonsterId"] = 203043,
			["Name"] = "英雄关卡地图3_4",
			["NeedPower"] = 12,
			["ShapeId"] = 2014,
			["ShowName"] = "喀斯径",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 320,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500007,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20305] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20304)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "帕雅山巅分叉出的一段峰岭，起伏的山峦犹如女神那涵纱而遮的酥胸唯美而又充满危机。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 203051)
end,
				function (API, OP)
	return API[1](OP, 203052)
end,
				function (API, OP)
	return API[1](OP, 203053)
end,
			},
			["ExpBonus"] = 328,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410301,
						1,
					},
					{
						2310301,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500014,
						2,
					},
				},
			},
			["Id"] = 20305,
			["ItemDesc"] = {
				["Item"] = {
					2410301,
					2310301,
					3000202,
					500014,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 14011,
			["MonsterId"] = 203053,
			["Name"] = "英雄关卡地图3_5",
			["NeedPower"] = 12,
			["ShapeId"] = 1005,
			["ShowName"] = "钟乳峰",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 328,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500014,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20306] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20305)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "冰雪覆盖的山巅，一道飓风围绕山壁逆时针自转。紧随其运转轨迹呈现一片仙境挽画的海市蜃楼光幕。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 203061)
end,
				function (API, OP)
	return API[1](OP, 203062)
end,
				function (API, OP)
	return API[1](OP, 203063)
end,
			},
			["ExpBonus"] = 336,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410301,
						1,
					},
					{
						2110301,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500012,
						2,
					},
				},
			},
			["Id"] = 20306,
			["ItemDesc"] = {
				["Item"] = {
					2410301,
					2110301,
					3000202,
					500012,
				},
			},
			["MapId"] = 3,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 18043,
			["MonsterId"] = 203063,
			["Name"] = "英雄关卡地图3_6",
			["NeedPower"] = 12,
			["ShapeId"] = 1003,
			["ShowName"] = "圣灵巅",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 336,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500012,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20401] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20306)
end,
				function (API, OP)
	return API[3](OP,104181)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "深海巨藻适应地壳碰撞,海沟被抬成陆地的环境，以涡轮状延长寿元、汲取合适元素进行蜕变。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 204011)
end,
				function (API, OP)
	return API[1](OP, 204012)
end,
				function (API, OP)
	return API[1](OP, 204013)
end,
			},
			["ExpBonus"] = 344,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110401,
						1,
					},
					{
						2210401,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500016,
						2,
					},
				},
			},
			["Id"] = 20401,
			["ItemDesc"] = {
				["Item"] = {
					2110401,
					2210401,
					3000202,
					500016,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 18043,
			["MonsterId"] = 204013,
			["Name"] = "英雄关卡地图4_1",
			["NeedPower"] = 12,
			["ShapeId"] = 2001,
			["ShowName"] = "涡藻坎",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 344,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500016,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20402] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20401)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "月弧状的崖壁蕴含奇特的物质，夜晚能够牵引月华将其转化成莹粉状的物质嵌在崖壁内等待有缘人萃取。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 204021)
end,
				function (API, OP)
	return API[1](OP, 204022)
end,
				function (API, OP)
	return API[1](OP, 204023)
end,
			},
			["ExpBonus"] = 352,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110401,
						1,
					},
					{
						2310401,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500008,
						2,
					},
				},
			},
			["Id"] = 20402,
			["ItemDesc"] = {
				["Item"] = {
					2110401,
					2310401,
					3000202,
					500008,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 24763,
			["MonsterId"] = 204023,
			["Name"] = "英雄关卡地图4_2",
			["NeedPower"] = 12,
			["ShapeId"] = 2006,
			["ShowName"] = "月轮壁",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 352,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500008,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20403] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20402)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "无垠地域被一群蚯蚓状的遁地魔兽犁成渔网状，方便伏击或者躲避猎物，但他们视乎更对月轮壁感兴趣。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 204031)
end,
				function (API, OP)
	return API[1](OP, 204032)
end,
				function (API, OP)
	return API[1](OP, 204033)
end,
			},
			["ExpBonus"] = 360,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210401,
						1,
					},
					{
						2310401,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500017,
						2,
					},
				},
			},
			["Id"] = 20403,
			["ItemDesc"] = {
				["Item"] = {
					2210401,
					2310401,
					3000202,
					500017,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 25192,
			["MonsterId"] = 204033,
			["Name"] = "英雄关卡地图4_3",
			["NeedPower"] = 12,
			["ShapeId"] = 3017,
			["ShowName"] = "渔网地",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 360,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500017,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20404] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20403)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "碧波荡漾的湖水清澈如斯，没有源头的它更显神秘；就是这种诱惑隐藏了它不能浮起一片羽毛的危险。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 204041)
end,
				function (API, OP)
	return API[1](OP, 204042)
end,
				function (API, OP)
	return API[1](OP, 204043)
end,
			},
			["ExpBonus"] = 368,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210401,
						1,
					},
					{
						2410401,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500009,
						2,
					},
				},
			},
			["Id"] = 20404,
			["ItemDesc"] = {
				["Item"] = {
					2210401,
					2410401,
					3000202,
					500009,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 25620,
			["MonsterId"] = 204043,
			["Name"] = "英雄关卡地图4_4",
			["NeedPower"] = 12,
			["ShapeId"] = 2004,
			["ShowName"] = "伯莱湖",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 368,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500009,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20405] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20404)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "所有植物的果实成熟时都会爬出一种可以净化血脉的昆虫。这种非凡的特性吸引着无数血脉冒险者光顾。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 204051)
end,
				function (API, OP)
	return API[1](OP, 204052)
end,
				function (API, OP)
	return API[1](OP, 204053)
end,
			},
			["ExpBonus"] = 376,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410401,
						1,
					},
					{
						2310401,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500018,
						2,
					},
				},
			},
			["Id"] = 20405,
			["ItemDesc"] = {
				["Item"] = {
					2410401,
					2310401,
					3000202,
					500018,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 26047,
			["MonsterId"] = 204053,
			["Name"] = "英雄关卡地图4_5",
			["NeedPower"] = 12,
			["ShapeId"] = 2007,
			["ShowName"] = "圣甲巢",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 376,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500018,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20406] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20405)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "悦耳的歌声传自圣甲巢中心的一口井，催熟着果实的绽开。但倘若有人走近，皆迷失自我投井而亡。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 204061)
end,
				function (API, OP)
	return API[1](OP, 204062)
end,
				function (API, OP)
	return API[1](OP, 204063)
end,
			},
			["ExpBonus"] = 384,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410401,
						1,
					},
					{
						2110401,
						1,
					},
					{
						3000202,
						3,
					},
					{
						500031,
						2,
					},
				},
			},
			["Id"] = 20406,
			["ItemDesc"] = {
				["Item"] = {
					2410401,
					2110401,
					3000202,
					500031,
				},
			},
			["MapId"] = 4,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 31422,
			["MonsterId"] = 204063,
			["Name"] = "英雄关卡地图4_6",
			["NeedPower"] = 12,
			["ShapeId"] = 1021,
			["ShowName"] = "巫魔井",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 384,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500031,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20501] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20406)
end,
				function (API, OP)
	return API[3](OP,105181)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "黑色的湿地常年被朦朦瘴气附着在地表，唯一避让却凸显醒目的是，湿地中有两串不同造型的巨型脚印。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 205011)
end,
				function (API, OP)
	return API[1](OP, 205012)
end,
				function (API, OP)
	return API[1](OP, 205013)
end,
			},
			["ExpBonus"] = 392,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110401,
						1,
					},
					{
						2210401,
						1,
					},
					{
						3000203,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 20501,
			["ItemDesc"] = {
				["Item"] = {
					2110401,
					2210401,
					3000203,
					500011,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 31422,
			["MonsterId"] = 205013,
			["Name"] = "英雄关卡地图5_1",
			["NeedPower"] = 12,
			["ShapeId"] = 1014,
			["ShowName"] = "神魔沼",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 392,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20502] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20501)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "不知名的香味在谷内蔓延，让人的头脑无法清洗的思考；不小心碰触到树枝、花簇都会有漫天的蝴蝶飞起。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 205021)
end,
				function (API, OP)
	return API[1](OP, 205022)
end,
				function (API, OP)
	return API[1](OP, 205023)
end,
			},
			["ExpBonus"] = 400,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110401,
						1,
					},
					{
						2310401,
						1,
					},
					{
						3000203,
						3,
					},
					{
						500014,
						2,
					},
				},
			},
			["Id"] = 20502,
			["ItemDesc"] = {
				["Item"] = {
					2110401,
					2310401,
					3000203,
					500014,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 31850,
			["MonsterId"] = 205023,
			["Name"] = "英雄关卡地图5_2",
			["NeedPower"] = 12,
			["ShapeId"] = 1005,
			["ShowName"] = "蝴蝶谷",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 400,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500014,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20503] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20502)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "梯形的山丘相互重叠犹如回廊，如果没活跃在当地的猎人当向导，往往都会原路返回无法进一步。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 205031)
end,
				function (API, OP)
	return API[1](OP, 205032)
end,
				function (API, OP)
	return API[1](OP, 205033)
end,
			},
			["ExpBonus"] = 408,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210401,
						1,
					},
					{
						2310401,
						1,
					},
					{
						3000203,
						3,
					},
					{
						500013,
						2,
					},
				},
			},
			["Id"] = 20503,
			["ItemDesc"] = {
				["Item"] = {
					2210401,
					2310401,
					3000203,
					500013,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 32277,
			["MonsterId"] = 205033,
			["Name"] = "英雄关卡地图5_3",
			["NeedPower"] = 12,
			["ShapeId"] = 1013,
			["ShowName"] = "迷人丘",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 408,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500013,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20504] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20503)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "据说是上古战场中千万尸骸演化的山峦。置身山中，神智不坚的话会尸海幻象影响而导致癫狂而无法自拔。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 205041)
end,
				function (API, OP)
	return API[1](OP, 205042)
end,
				function (API, OP)
	return API[1](OP, 205043)
end,
			},
			["ExpBonus"] = 416,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210401,
						1,
					},
					{
						2410401,
						1,
					},
					{
						3000203,
						3,
					},
					{
						500015,
						2,
					},
				},
			},
			["Id"] = 20504,
			["ItemDesc"] = {
				["Item"] = {
					2210401,
					2410401,
					3000203,
					500015,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 32705,
			["MonsterId"] = 205043,
			["Name"] = "英雄关卡地图5_4",
			["NeedPower"] = 12,
			["ShapeId"] = 1010,
			["ShowName"] = "浮屠山",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 416,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500015,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20505] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20504)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "完全被异域外族占领的地方，峡谷之外被重兵把守。从俘虏记忆中获悉是培养异族女性伪装人的秘密基地。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 205051)
end,
				function (API, OP)
	return API[1](OP, 205052)
end,
				function (API, OP)
	return API[1](OP, 205053)
end,
			},
			["ExpBonus"] = 424,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410401,
						1,
					},
					{
						2310401,
						1,
					},
					{
						3000203,
						3,
					},
					{
						500017,
						2,
					},
				},
			},
			["Id"] = 20505,
			["ItemDesc"] = {
				["Item"] = {
					2410401,
					2310401,
					3000203,
					500017,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 33132,
			["MonsterId"] = 205053,
			["Name"] = "英雄关卡地图5_5",
			["NeedPower"] = 12,
			["ShapeId"] = 3017,
			["ShowName"] = "幻魔峡",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 424,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500017,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20506] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20505)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "异端人族首领的居住之地，同时豢养着各种异种魔物。但凡进入者是都要递交证明身份的投名状。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 205061)
end,
				function (API, OP)
	return API[1](OP, 205062)
end,
				function (API, OP)
	return API[1](OP, 205063)
end,
			},
			["ExpBonus"] = 432,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410401,
						1,
					},
					{
						2110401,
						1,
					},
					{
						3000203,
						3,
					},
					{
						500019,
						2,
					},
				},
			},
			["Id"] = 20506,
			["ItemDesc"] = {
				["Item"] = {
					2410401,
					2110401,
					3000203,
					500019,
				},
			},
			["MapId"] = 5,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 35212,
			["MonsterId"] = 205063,
			["Name"] = "英雄关卡地图5_6",
			["NeedPower"] = 12,
			["ShapeId"] = 3004,
			["ShowName"] = "魔蛇窟",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 432,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500019,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20601] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20506)
end,
				function (API, OP)
	return API[3](OP,10618)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "天上的月亮呈现血色之时，上游奔流而下河水将化为血液；舀一瓢待到血月恢复正常，但河水依旧是血液。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 206011)
end,
				function (API, OP)
	return API[1](OP, 206012)
end,
				function (API, OP)
	return API[1](OP, 206013)
end,
			},
			["ExpBonus"] = 440,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110501,
						1,
					},
					{
						2210501,
						1,
					},
					{
						3000301,
						3,
					},
					{
						500021,
						2,
					},
				},
			},
			["Id"] = 20601,
			["ItemDesc"] = {
				["Item"] = {
					2110501,
					2210501,
					3000301,
					500021,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 37212,
			["MonsterId"] = 206013,
			["Name"] = "英雄关卡地图6_1",
			["NeedPower"] = 12,
			["ShapeId"] = 2008,
			["ShowName"] = "赤月涧",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 440,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500021,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20602] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20601)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "神圣联盟和异域外族的冲突地之一，起因是枫丹林中传闻有这个世界唯一一只赤牡鹿出没。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 206021)
end,
				function (API, OP)
	return API[1](OP, 206022)
end,
				function (API, OP)
	return API[1](OP, 206023)
end,
			},
			["ExpBonus"] = 448,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110501,
						1,
					},
					{
						2310501,
						1,
					},
					{
						3000301,
						3,
					},
					{
						500017,
						2,
					},
				},
			},
			["Id"] = 20602,
			["ItemDesc"] = {
				["Item"] = {
					2110501,
					2310501,
					3000301,
					500017,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 38090,
			["MonsterId"] = 206023,
			["Name"] = "英雄关卡地图6_2",
			["NeedPower"] = 12,
			["ShapeId"] = 3017,
			["ShowName"] = "枫丹林",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 448,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500017,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20603] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20602)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "赤月涧溪水的上游地段，不论白天黑夜水面都散着莹莹的金光，吸引着无数的野兽来河中饮水沐浴。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 206031)
end,
				function (API, OP)
	return API[1](OP, 206032)
end,
				function (API, OP)
	return API[1](OP, 206033)
end,
			},
			["ExpBonus"] = 456,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210501,
						1,
					},
					{
						2310501,
						1,
					},
					{
						3000301,
						3,
					},
					{
						500008,
						2,
					},
				},
			},
			["Id"] = 20603,
			["ItemDesc"] = {
				["Item"] = {
					2210501,
					2310501,
					3000301,
					500008,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 38968,
			["MonsterId"] = 206033,
			["Name"] = "英雄关卡地图6_3",
			["NeedPower"] = 12,
			["ShapeId"] = 2006,
			["ShowName"] = "金阳溪",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 456,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500008,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20604] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20603)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "因形似鹿角而闻名的崖体，堪称大陆上最坚固的地域；山崖的根部常年被地火灼烧，地震频繁但却依然如初。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 206041)
end,
				function (API, OP)
	return API[1](OP, 206042)
end,
				function (API, OP)
	return API[1](OP, 206043)
end,
			},
			["ExpBonus"] = 464,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210501,
						1,
					},
					{
						2410501,
						1,
					},
					{
						3000302,
						3,
					},
					{
						500016,
						2,
					},
				},
			},
			["Id"] = 20604,
			["ItemDesc"] = {
				["Item"] = {
					2210501,
					2410501,
					3000302,
					500016,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 39846,
			["MonsterId"] = 206043,
			["Name"] = "英雄关卡地图6_4",
			["NeedPower"] = 12,
			["ShapeId"] = 2001,
			["ShowName"] = "鹿角崖",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 464,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500016,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20605] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20604)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "鹿角崖向外延伸的岩体低洼处经地火熏烧与空中寒流逆转成的小水潭，可打捞到英雄的记忆晶石。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 206051)
end,
				function (API, OP)
	return API[1](OP, 206052)
end,
				function (API, OP)
	return API[1](OP, 206053)
end,
			},
			["ExpBonus"] = 472,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410501,
						1,
					},
					{
						2310501,
						1,
					},
					{
						3000302,
						3,
					},
					{
						500006,
						2,
					},
				},
			},
			["Id"] = 20605,
			["ItemDesc"] = {
				["Item"] = {
					2410501,
					2310501,
					3000302,
					500006,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 40724,
			["MonsterId"] = 206053,
			["Name"] = "英雄关卡地图6_5",
			["NeedPower"] = 12,
			["ShapeId"] = 1019,
			["ShowName"] = "地汤泉",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 472,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500006,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20606] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20605)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "淡淡萤光的湖水，注视超过一秒就会看到一美貌女子的幻象在湖面上轻舞飞扬，吸引走兽掉落入地火深渊。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 206061)
end,
				function (API, OP)
	return API[1](OP, 206062)
end,
				function (API, OP)
	return API[1](OP, 206063)
end,
			},
			["ExpBonus"] = 480,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410501,
						1,
					},
					{
						2110501,
						1,
					},
					{
						3000302,
						3,
					},
					{
						500018,
						2,
					},
				},
			},
			["Id"] = 20606,
			["ItemDesc"] = {
				["Item"] = {
					2410501,
					2110501,
					3000302,
					500018,
				},
			},
			["MapId"] = 6,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 42602,
			["MonsterId"] = 206063,
			["Name"] = "英雄关卡地图6_6",
			["NeedPower"] = 12,
			["ShapeId"] = 2007,
			["ShowName"] = "萤火湖",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 480,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500018,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20701] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20606)
end,
				function (API, OP)
	return API[3](OP,10718)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "古之商道，连通东西之地，仅可一匹骡马通行。一侧峭壁一侧悬崖，不知埋葬多少商骨。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 207011)
end,
				function (API, OP)
	return API[1](OP, 207012)
end,
				function (API, OP)
	return API[1](OP, 207013)
end,
			},
			["ExpBonus"] = 488,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110601,
						1,
					},
					{
						2210601,
						1,
					},
					{
						3000303,
						3,
					},
					{
						500001,
						2,
					},
				},
			},
			["Id"] = 20701,
			["ItemDesc"] = {
				["Item"] = {
					2110601,
					2210601,
					3000303,
					500001,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 44480,
			["MonsterId"] = 207013,
			["Name"] = "英雄关卡地图7_1",
			["NeedPower"] = 12,
			["ShapeId"] = 1008,
			["ShowName"] = "摩洛道",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 488,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500001,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20702] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20701)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "横跨两座悬崖之间，腐朽的吊桥在不知名力量的撑托下，日出日落新旧蔓藤、杂草相互纠缠而形成的栈道。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 207021)
end,
				function (API, OP)
	return API[1](OP, 207022)
end,
				function (API, OP)
	return API[1](OP, 207023)
end,
			},
			["ExpBonus"] = 496,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110601,
						1,
					},
					{
						2310601,
						1,
					},
					{
						3000303,
						3,
					},
					{
						500023,
						2,
					},
				},
			},
			["Id"] = 20702,
			["ItemDesc"] = {
				["Item"] = {
					2110601,
					2310601,
					3000303,
					500023,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 46358,
			["MonsterId"] = 207023,
			["Name"] = "英雄关卡地图7_2",
			["NeedPower"] = 12,
			["ShapeId"] = 3006,
			["ShowName"] = "枯栈径",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 496,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500023,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20703] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20702)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "青翠的松树林没有被任何其他植被点缀，土地松软像被犁过。阳光折射下闪烁着银色的光泽，安静且祥和。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 207031)
end,
				function (API, OP)
	return API[1](OP, 207032)
end,
				function (API, OP)
	return API[1](OP, 207033)
end,
			},
			["ExpBonus"] = 504,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210601,
						1,
					},
					{
						2310601,
						1,
					},
					{
						3000303,
						3,
					},
					{
						500019,
						2,
					},
				},
			},
			["Id"] = 20703,
			["ItemDesc"] = {
				["Item"] = {
					2210601,
					2310601,
					3000303,
					500019,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 48236,
			["MonsterId"] = 207033,
			["Name"] = "英雄关卡地图7_3",
			["NeedPower"] = 12,
			["ShapeId"] = 3004,
			["ShowName"] = "银松林",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 504,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500019,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20704] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20703)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "因雾岚花而得名的坡岭，它的危险往往就在不经意间。采摘一朵雾岚花，一道魔骷万象生。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 207041)
end,
				function (API, OP)
	return API[1](OP, 207042)
end,
				function (API, OP)
	return API[1](OP, 207043)
end,
			},
			["ExpBonus"] = 512,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210601,
						1,
					},
					{
						2410601,
						1,
					},
					{
						3000304,
						3,
					},
					{
						500024,
						2,
					},
				},
			},
			["Id"] = 20704,
			["ItemDesc"] = {
				["Item"] = {
					2210601,
					2410601,
					3000304,
					500024,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 50114,
			["MonsterId"] = 207043,
			["Name"] = "英雄关卡地图7_4",
			["NeedPower"] = 12,
			["ShapeId"] = 3009,
			["ShowName"] = "雾岚坡",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 512,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500024,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20705] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20704)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "冠以清泉湾，但实际上眼中却是曲折的山丘。传闻真正看到水湾的人，能够在水倒影中解答心中一个疑问。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 207051)
end,
				function (API, OP)
	return API[1](OP, 207052)
end,
				function (API, OP)
	return API[1](OP, 207053)
end,
			},
			["ExpBonus"] = 520,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410601,
						1,
					},
					{
						2310601,
						1,
					},
					{
						3000304,
						3,
					},
					{
						500001,
						2,
					},
				},
			},
			["Id"] = 20705,
			["ItemDesc"] = {
				["Item"] = {
					2410601,
					2310601,
					3000304,
					500001,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 51095,
			["MonsterId"] = 207053,
			["Name"] = "英雄关卡地图7_5",
			["NeedPower"] = 12,
			["ShapeId"] = 1008,
			["ShowName"] = "清泉湾",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 520,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500001,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20706] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20705)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "葱葱松林宇外山，皑皑慕士日头竿。移莲神王银湖会，不是仙人也感叹。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 207061)
end,
				function (API, OP)
	return API[1](OP, 207062)
end,
				function (API, OP)
	return API[1](OP, 207063)
end,
			},
			["ExpBonus"] = 528,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410601,
						1,
					},
					{
						2110601,
						1,
					},
					{
						3000304,
						3,
					},
					{
						500007,
						2,
					},
				},
			},
			["Id"] = 20706,
			["ItemDesc"] = {
				["Item"] = {
					2410601,
					2110601,
					3000304,
					500007,
				},
			},
			["MapId"] = 7,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 56338,
			["MonsterId"] = 207063,
			["Name"] = "英雄关卡地图7_6",
			["NeedPower"] = 12,
			["ShapeId"] = 2014,
			["ShowName"] = "仙王湖",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 528,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500007,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20801] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20706)
end,
				function (API, OP)
	return API[3](OP,10818)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "传说荆棘峦是一头魔枭的脊背所化。沉睡中的魔枭一直等待它的主人出现，睁眼之时大陆因他们而颤栗。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 208011)
end,
				function (API, OP)
	return API[1](OP, 208012)
end,
				function (API, OP)
	return API[1](OP, 208013)
end,
			},
			["ExpBonus"] = 536,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110701,
						1,
					},
					{
						2210701,
						1,
					},
					{
						3000401,
						3,
					},
					{
						500025,
						2,
					},
				},
			},
			["Id"] = 20801,
			["ItemDesc"] = {
				["Item"] = {
					2110701,
					2210701,
					3000401,
					500025,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 58338,
			["MonsterId"] = 208013,
			["Name"] = "英雄关卡地图8_1",
			["NeedPower"] = 12,
			["ShapeId"] = 2011,
			["ShowName"] = "荆棘峦",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 536,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500025,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20802] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20801)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "数十年前还是一片泽国的这里，流浪画师途径此地感这里人贫苦，将画卷至于水中而一道道山岭拔地而起。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 208021)
end,
				function (API, OP)
	return API[1](OP, 208022)
end,
				function (API, OP)
	return API[1](OP, 208023)
end,
			},
			["ExpBonus"] = 544,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110701,
						1,
					},
					{
						2310701,
						1,
					},
					{
						3000401,
						3,
					},
					{
						500002,
						2,
					},
				},
			},
			["Id"] = 20802,
			["ItemDesc"] = {
				["Item"] = {
					2110701,
					2310701,
					3000401,
					500002,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 60338,
			["MonsterId"] = 208023,
			["Name"] = "英雄关卡地图8_2",
			["NeedPower"] = 12,
			["ShapeId"] = 3011,
			["ShowName"] = "苍莽岭",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 544,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500002,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20803] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20802)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "山谷中悄然升起一图腾柱，似乎连接天际。奇怪的地方在于攀爬掉落下来的人不会有任何损伤。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 208031)
end,
				function (API, OP)
	return API[1](OP, 208032)
end,
				function (API, OP)
	return API[1](OP, 208033)
end,
			},
			["ExpBonus"] = 552,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210701,
						1,
					},
					{
						2310701,
						1,
					},
					{
						3000401,
						3,
					},
					{
						500008,
						2,
					},
				},
			},
			["Id"] = 20803,
			["ItemDesc"] = {
				["Item"] = {
					2210701,
					2310701,
					3000401,
					500008,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 62338,
			["MonsterId"] = 208033,
			["Name"] = "英雄关卡地图8_3",
			["NeedPower"] = 12,
			["ShapeId"] = 2006,
			["ShowName"] = "天梯谷",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 552,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500008,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20804] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20803)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "神圣联盟第一次西征异物外族时的战场，但计划被洞悉遭遇伏击。血脉军团十万众全部遇难，此地因而闻名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 208041)
end,
				function (API, OP)
	return API[1](OP, 208042)
end,
				function (API, OP)
	return API[1](OP, 208043)
end,
			},
			["ExpBonus"] = 560,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210701,
						1,
					},
					{
						2410701,
						1,
					},
					{
						3000402,
						3,
					},
					{
						500003,
						2,
					},
				},
			},
			["Id"] = 20804,
			["ItemDesc"] = {
				["Item"] = {
					2210701,
					2410701,
					3000402,
					500003,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 64338,
			["MonsterId"] = 208043,
			["Name"] = "英雄关卡地图8_4",
			["NeedPower"] = 12,
			["ShapeId"] = 2016,
			["ShowName"] = "匹斯原",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 560,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500003,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20805] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20804)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "山壑中奇形怪状的土质构筑物已违自然规则，唯独有的山羚如履平地。别的生命则在不断坍塌构筑物中前行。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 208051)
end,
				function (API, OP)
	return API[1](OP, 208052)
end,
				function (API, OP)
	return API[1](OP, 208053)
end,
			},
			["ExpBonus"] = 568,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410701,
						1,
					},
					{
						2310701,
						1,
					},
					{
						3000402,
						3,
					},
					{
						500002,
						2,
					},
				},
			},
			["Id"] = 20805,
			["ItemDesc"] = {
				["Item"] = {
					2410701,
					2310701,
					3000402,
					500002,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 66338,
			["MonsterId"] = 208053,
			["Name"] = "英雄关卡地图8_5",
			["NeedPower"] = 12,
			["ShapeId"] = 3011,
			["ShowName"] = "崎羚壑",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 568,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500002,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20806] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20805)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "上古巨魔死亡的身躯演化成腐烂的淤泥，长时间发酵孕育出一奇香。吸引动植物投进这深渊巨口之中。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 208061)
end,
				function (API, OP)
	return API[1](OP, 208062)
end,
				function (API, OP)
	return API[1](OP, 208063)
end,
			},
			["ExpBonus"] = 576,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410701,
						1,
					},
					{
						2110701,
						1,
					},
					{
						3000402,
						3,
					},
					{
						500009,
						2,
					},
				},
			},
			["Id"] = 20806,
			["ItemDesc"] = {
				["Item"] = {
					2410701,
					2110701,
					3000402,
					500009,
				},
			},
			["MapId"] = 8,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 68338,
			["MonsterId"] = 208063,
			["Name"] = "英雄关卡地图8_6",
			["NeedPower"] = 12,
			["ShapeId"] = 2004,
			["ShowName"] = "冤魔域",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 576,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500009,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20901] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20806)
end,
				function (API, OP)
	return API[3](OP,10918)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "伸入云际的一段锁链，通往神院的唯一通道。血脉自主识别功能是它杜绝异族奸细潜入的重要屏障。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 209011)
end,
				function (API, OP)
	return API[1](OP, 209012)
end,
				function (API, OP)
	return API[1](OP, 209013)
end,
			},
			["ExpBonus"] = 584,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110801,
						1,
					},
					{
						2210801,
						1,
					},
					{
						3000401,
						3,
					},
					{
						500028,
						2,
					},
				},
			},
			["Id"] = 20901,
			["ItemDesc"] = {
				["Item"] = {
					2110801,
					2210801,
					3000401,
					500028,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 70338,
			["MonsterId"] = 209013,
			["Name"] = "英雄关卡地图9_1",
			["NeedPower"] = 12,
			["ShapeId"] = 3007,
			["ShowName"] = "索引道",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 584,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500028,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20902] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20901)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "围绕在神院四周的数座漂浮岛屿，浮岛上天雷闪烁漂浮接连，杜绝一切企图通过天空云层进入的外来者。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 209021)
end,
				function (API, OP)
	return API[1](OP, 209022)
end,
				function (API, OP)
	return API[1](OP, 209023)
end,
			},
			["ExpBonus"] = 592,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110801,
						1,
					},
					{
						2310801,
						1,
					},
					{
						3000401,
						3,
					},
					{
						500004,
						2,
					},
				},
			},
			["Id"] = 20902,
			["ItemDesc"] = {
				["Item"] = {
					2110801,
					2310801,
					3000401,
					500004,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 72338,
			["MonsterId"] = 209023,
			["Name"] = "英雄关卡地图9_2",
			["NeedPower"] = 12,
			["ShapeId"] = 1009,
			["ShowName"] = "浮雷岛",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 592,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500004,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20903] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20902)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "传说最接近天的地方，也是神界重临人间第一站。曾经一度被异域外族夺取屯驻重军团，但最终被联盟夺回。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 209031)
end,
				function (API, OP)
	return API[1](OP, 209032)
end,
				function (API, OP)
	return API[1](OP, 209033)
end,
			},
			["ExpBonus"] = 600,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210801,
						1,
					},
					{
						2310801,
						1,
					},
					{
						3000401,
						3,
					},
					{
						500016,
						2,
					},
				},
			},
			["Id"] = 20903,
			["ItemDesc"] = {
				["Item"] = {
					2210801,
					2310801,
					3000401,
					500016,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 74338,
			["MonsterId"] = 209033,
			["Name"] = "英雄关卡地图9_3",
			["NeedPower"] = 12,
			["ShapeId"] = 2013,
			["ShowName"] = "子午路",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 600,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500016,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20904] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20903)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "子午路的末端，布局呈“回”字形。神圣联盟祭天祈谷或者西征请佑的地方，又名“神穹宇”。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 209041)
end,
				function (API, OP)
	return API[1](OP, 209042)
end,
				function (API, OP)
	return API[1](OP, 209043)
end,
			},
			["ExpBonus"] = 608,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210801,
						1,
					},
					{
						2410801,
						1,
					},
					{
						3000402,
						3,
					},
					{
						500005,
						2,
					},
				},
			},
			["Id"] = 20904,
			["ItemDesc"] = {
				["Item"] = {
					2210801,
					2410801,
					3000402,
					500005,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 76362,
			["MonsterId"] = 209043,
			["Name"] = "英雄关卡地图9_4",
			["NeedPower"] = 12,
			["ShapeId"] = 2012,
			["ShowName"] = "祀星台",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 608,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500005,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20905] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20904)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "菲斯神院中最大的藏书馆，但它非一处独立的建筑。按照礼、乐、射、御、书、数划分，以六芒星对角布局。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 209051)
end,
				function (API, OP)
	return API[1](OP, 209052)
end,
				function (API, OP)
	return API[1](OP, 209053)
end,
			},
			["ExpBonus"] = 616,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410801,
						1,
					},
					{
						2310801,
						1,
					},
					{
						3000402,
						3,
					},
					{
						500017,
						2,
					},
				},
			},
			["Id"] = 20905,
			["ItemDesc"] = {
				["Item"] = {
					2410801,
					2310801,
					3000402,
					500017,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_2",
			["MinFightPower"] = 76864,
			["MonsterId"] = 209053,
			["Name"] = "英雄关卡地图9_5",
			["NeedPower"] = 12,
			["ShapeId"] = 2001,
			["ShowName"] = "通灵院",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 616,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500017,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[20906] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 12,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20905)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "祀星台往外延伸至断崖下降百米的一处凸壁，埋骨那些为文艺复兴的付出生命的先贤之地；逝者已矣，生者如斯。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 209061)
end,
				function (API, OP)
	return API[1](OP, 209062)
end,
				function (API, OP)
	return API[1](OP, 209063)
end,
			},
			["ExpBonus"] = 624,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410801,
						1,
					},
					{
						2110801,
						1,
					},
					{
						3000402,
						3,
					},
					{
						500018,
						2,
					},
				},
			},
			["Id"] = 20906,
			["ItemDesc"] = {
				["Item"] = {
					2410801,
					2110801,
					3000402,
					500018,
				},
			},
			["MapId"] = 9,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 82725,
			["MonsterId"] = 209063,
			["Name"] = "英雄关卡地图9_6",
			["NeedPower"] = 12,
			["ShapeId"] = 2005,
			["ShowName"] = "古神庙",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 624,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500018,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21001] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,20906)
end,
				function (API, OP)
	return API[3](OP,11018)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "五百年前的雪域王国遗址。传闻曾经的雪域日月不分，充斥着各种混乱的魔法元素，是魔法师的天堂。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 210011)
end,
				function (API, OP)
	return API[1](OP, 210012)
end,
				function (API, OP)
	return API[1](OP, 210013)
end,
			},
			["ExpBonus"] = 632,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110901,
						1,
					},
					{
						2210901,
						1,
					},
					{
						3000403,
						3,
					},
					{
						500029,
						2,
					},
				},
			},
			["Id"] = 21001,
			["ItemDesc"] = {
				["Item"] = {
					2110901,
					2210901,
					3000403,
					500029,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 82725,
			["MonsterId"] = 210013,
			["Name"] = "英雄关卡地图10_1",
			["NeedPower"] = 16,
			["ShapeId"] = 3017,
			["ShowName"] = "雪域垒",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 632,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500029,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21002] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21001)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "曾经贯穿雪域的一道河流，现已剩下冰痕晶晶的河床。不论是白天、黑夜，在有光的地方总闪烁斑斓色彩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 210021)
end,
				function (API, OP)
	return API[1](OP, 210022)
end,
				function (API, OP)
	return API[1](OP, 210023)
end,
			},
			["ExpBonus"] = 640,
			["FirstBonus"] = {
				["Item"] = {
					{
						2110901,
						1,
					},
					{
						2310901,
						1,
					},
					{
						3000403,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21002,
			["ItemDesc"] = {
				["Item"] = {
					2110901,
					2310901,
					3000403,
					500011,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_5",
			["MinFightPower"] = 83227,
			["MonsterId"] = 210023,
			["Name"] = "英雄关卡地图10_2",
			["NeedPower"] = 16,
			["ShapeId"] = 2007,
			["ShowName"] = "琉绯渠",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 640,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21003] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21002)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "雪域魔法创造的小世界，传说储存有历代雪域王族传承财富和世界轴心。神圣联盟、异域外族交战的第三战场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 210031)
end,
				function (API, OP)
	return API[1](OP, 210032)
end,
				function (API, OP)
	return API[1](OP, 210033)
end,
			},
			["ExpBonus"] = 648,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210901,
						1,
					},
					{
						2310901,
						1,
					},
					{
						3000403,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21003,
			["ItemDesc"] = {
				["Item"] = {
					2210901,
					2310901,
					3000403,
					500011,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_6",
			["MinFightPower"] = 83728,
			["MonsterId"] = 210033,
			["Name"] = "英雄关卡地图10_3",
			["NeedPower"] = 16,
			["ShapeId"] = 3005,
			["ShowName"] = "齿月界",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 648,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21004] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21003)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "第一工匠追随流浪画师时的陨落之地，匠神之心随着热血铸造此崖；匠神崖的一粒石砾都能提升锻造成功率。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 210041)
end,
				function (API, OP)
	return API[1](OP, 210042)
end,
				function (API, OP)
	return API[1](OP, 210043)
end,
			},
			["ExpBonus"] = 656,
			["FirstBonus"] = {
				["Item"] = {
					{
						2210901,
						1,
					},
					{
						2410901,
						1,
					},
					{
						3000404,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21004,
			["ItemDesc"] = {
				["Item"] = {
					2210901,
					2410901,
					3000404,
					500011,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 84230,
			["MonsterId"] = 210043,
			["Name"] = "英雄关卡地图10_4",
			["NeedPower"] = 16,
			["ShapeId"] = 3004,
			["ShowName"] = "匠神崖",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 656,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21005] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21004)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "通往司命神殿中心位置，漂浮在空中的无规则石阶。每个石阶被踩一次就掉落消散，间隔24度时重新随机刷新。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 210051)
end,
				function (API, OP)
	return API[1](OP, 210052)
end,
				function (API, OP)
	return API[1](OP, 210053)
end,
			},
			["ExpBonus"] = 664,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410901,
						1,
					},
					{
						2310901,
						1,
					},
					{
						3000404,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21005,
			["ItemDesc"] = {
				["Item"] = {
					2410901,
					2310901,
					3000404,
					500011,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 84733,
			["MonsterId"] = 210053,
			["Name"] = "英雄关卡地图10_5",
			["NeedPower"] = 16,
			["ShapeId"] = 1008,
			["ShowName"] = "横断阶",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 664,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21006] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21005)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "司命神殿的中央行宫，辉映着淡淡星光；没有人进去过，传说是月神的诞生之地，具体无从考证。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 210061)
end,
				function (API, OP)
	return API[1](OP, 210062)
end,
				function (API, OP)
	return API[1](OP, 210063)
end,
			},
			["ExpBonus"] = 672,
			["FirstBonus"] = {
				["Item"] = {
					{
						2410901,
						1,
					},
					{
						2110901,
						1,
					},
					{
						3000404,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21006,
			["ItemDesc"] = {
				["Item"] = {
					2410901,
					2110901,
					3000404,
					500011,
				},
			},
			["MapId"] = 10,
			["MapPath"] = "scene_9",
			["MinFightPower"] = 94840,
			["MonsterId"] = 210063,
			["Name"] = "英雄关卡地图10_6",
			["NeedPower"] = 16,
			["ShapeId"] = 3014,
			["ShowName"] = "星云宫",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 672,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21101] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21006)
end,
				function (API, OP)
	return API[3](OP,11118)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "北进雪域的主要通道，目前掌握在神圣联盟辖下的几个大的公会手中，已签订连同攻防、治理等条约。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 211011)
end,
				function (API, OP)
	return API[1](OP, 211012)
end,
				function (API, OP)
	return API[1](OP, 211013)
end,
			},
			["ExpBonus"] = 680,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111001,
						1,
					},
					{
						2211001,
						1,
					},
					{
						3000403,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21101,
			["ItemDesc"] = {
				["Item"] = {
					2111001,
					2211001,
					3000403,
					500011,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_10",
			["MinFightPower"] = 94840,
			["MonsterId"] = 211013,
			["Name"] = "英雄关卡地图11_1",
			["NeedPower"] = 16,
			["ShapeId"] = 3016,
			["ShowName"] = "唐古道",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 680,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21102] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21101)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "第二道构筑的防线，因几大公会私立冲突导致原本的山丘被轰平，沟壑相错已成山坡。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 211021)
end,
				function (API, OP)
	return API[1](OP, 211022)
end,
				function (API, OP)
	return API[1](OP, 211023)
end,
			},
			["ExpBonus"] = 688,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111001,
						1,
					},
					{
						2311001,
						1,
					},
					{
						3000403,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21102,
			["ItemDesc"] = {
				["Item"] = {
					2111001,
					2311001,
					3000403,
					500011,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_11",
			["MinFightPower"] = 100193,
			["MonsterId"] = 211023,
			["Name"] = "英雄关卡地图11_2",
			["NeedPower"] = 16,
			["ShapeId"] = 1008,
			["ShowName"] = "诃德丘",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 688,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21103] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21102)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "像是从远处挪移过来的一块，空地中央有一缺口，不知通往何处。传闻上古山河倒转天演地时，本为天缺。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 211031)
end,
				function (API, OP)
	return API[1](OP, 211032)
end,
				function (API, OP)
	return API[1](OP, 211033)
end,
			},
			["ExpBonus"] = 696,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211001,
						1,
					},
					{
						2311001,
						1,
					},
					{
						3000403,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21103,
			["ItemDesc"] = {
				["Item"] = {
					2211001,
					2311001,
					3000403,
					500011,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_12",
			["MinFightPower"] = 100695,
			["MonsterId"] = 211033,
			["Name"] = "英雄关卡地图11_3",
			["NeedPower"] = 16,
			["ShapeId"] = 2008,
			["ShowName"] = "魔眼地",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 696,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21104] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21103)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "又名“梦媾地”，盛产一种可入梦的堕落妖姬。不论是神圣联盟还是异域外族都渴望得到这种生物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 211041)
end,
				function (API, OP)
	return API[1](OP, 211042)
end,
				function (API, OP)
	return API[1](OP, 211043)
end,
			},
			["ExpBonus"] = 704,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211001,
						1,
					},
					{
						2411001,
						1,
					},
					{
						3000404,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21104,
			["ItemDesc"] = {
				["Item"] = {
					2211001,
					2411001,
					3000404,
					500011,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 101197,
			["MonsterId"] = 211043,
			["Name"] = "英雄关卡地图11_4",
			["NeedPower"] = 16,
			["ShapeId"] = 3007,
			["ShowName"] = "妖姬岭",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 704,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21105] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21104)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "天外陨石坠落砸出来的天坑，陨石被当年的雪域王国运走。但地磁效果导致天坑被隔绝，常人无法靠近。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 211051)
end,
				function (API, OP)
	return API[1](OP, 211052)
end,
				function (API, OP)
	return API[1](OP, 211053)
end,
			},
			["ExpBonus"] = 712,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411001,
						1,
					},
					{
						2311001,
						1,
					},
					{
						3000404,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21105,
			["ItemDesc"] = {
				["Item"] = {
					2411001,
					2311001,
					3000404,
					500011,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 101699,
			["MonsterId"] = 211053,
			["Name"] = "英雄关卡地图11_5",
			["NeedPower"] = 16,
			["ShapeId"] = 3011,
			["ShowName"] = "天陨坑",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 712,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21106] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21105)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "一望无际的地坎丘陵，唯一特殊的地方在于任何生物行走于此，都没有办法生出一丝恶念，算是一片乐园。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 211061)
end,
				function (API, OP)
	return API[1](OP, 211062)
end,
				function (API, OP)
	return API[1](OP, 211063)
end,
			},
			["ExpBonus"] = 720,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411001,
						1,
					},
					{
						2111001,
						1,
					},
					{
						3000404,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21106,
			["ItemDesc"] = {
				["Item"] = {
					2411001,
					2111001,
					3000404,
					500011,
				},
			},
			["MapId"] = 11,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 121487,
			["MonsterId"] = 211063,
			["Name"] = "英雄关卡地图11_6",
			["NeedPower"] = 16,
			["ShapeId"] = 2015,
			["ShowName"] = "堕龙原",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 720,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21201] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21106)
end,
				function (API, OP)
	return API[3](OP,11218)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "世界屋脊，它的神秘在于存在一群守护诸神庙宇的修士团。信仰所致，凡企图侵占庙宇都会受到誓死驱逐。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 212011)
end,
				function (API, OP)
	return API[1](OP, 212012)
end,
				function (API, OP)
	return API[1](OP, 212013)
end,
			},
			["ExpBonus"] = 728,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111101,
						1,
					},
					{
						2211101,
						1,
					},
					{
						3000501,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21201,
			["ItemDesc"] = {
				["Item"] = {
					2111101,
					2211101,
					3000501,
					500011,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 121487,
			["MonsterId"] = 212013,
			["Name"] = "英雄关卡地图12_1",
			["NeedPower"] = 16,
			["ShapeId"] = 1014,
			["ShowName"] = "蚀余山",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 728,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21202] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21201)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "深涧之中有守护狮鹫栖息，也有避世神人居住。让人诟病的是这群人不懂唇亡齿的道路。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 212021)
end,
				function (API, OP)
	return API[1](OP, 212022)
end,
				function (API, OP)
	return API[1](OP, 212023)
end,
			},
			["ExpBonus"] = 736,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111101,
						1,
					},
					{
						2311101,
						1,
					},
					{
						3000501,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21202,
			["ItemDesc"] = {
				["Item"] = {
					2111101,
					2311101,
					3000501,
					500011,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 122114,
			["MonsterId"] = 212023,
			["Name"] = "英雄关卡地图12_2",
			["NeedPower"] = 16,
			["ShapeId"] = 2013,
			["ShowName"] = "乞罗涧",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 736,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21203] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21202)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "一念天堂、一念地狱在这世界代表神性。如果选择踏上浊云，没有神性将永坠地狱，消失在这个世界。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 212031)
end,
				function (API, OP)
	return API[1](OP, 212032)
end,
				function (API, OP)
	return API[1](OP, 212033)
end,
			},
			["ExpBonus"] = 744,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211101,
						1,
					},
					{
						2311101,
						1,
					},
					{
						3000501,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21203,
			["ItemDesc"] = {
				["Item"] = {
					2211101,
					2311101,
					3000501,
					500011,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 122742,
			["MonsterId"] = 212033,
			["Name"] = "英雄关卡地图12_3",
			["NeedPower"] = 16,
			["ShapeId"] = 1003,
			["ShowName"] = "浊云台",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 744,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21204] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21203)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "每个修士临终时都独自踏出蚀余山，进入比伦塔内依照阶梯镶阁的构造等待坐化，据说代表永生守护。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 212041)
end,
				function (API, OP)
	return API[1](OP, 212042)
end,
				function (API, OP)
	return API[1](OP, 212043)
end,
			},
			["ExpBonus"] = 752,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211101,
						1,
					},
					{
						2411101,
						1,
					},
					{
						3000502,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21204,
			["ItemDesc"] = {
				["Item"] = {
					2211101,
					2411101,
					3000502,
					500011,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 123369,
			["MonsterId"] = 212043,
			["Name"] = "英雄关卡地图12_4",
			["NeedPower"] = 16,
			["ShapeId"] = 1013,
			["ShowName"] = "比伦塔",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 752,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21205] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21204)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "古籍记载转轮壁是动态的，按照某种摆动规则在运行；间隔千年，如果壁内部指针停滞，世界将等待一次审判。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 212051)
end,
				function (API, OP)
	return API[1](OP, 212052)
end,
				function (API, OP)
	return API[1](OP, 212053)
end,
			},
			["ExpBonus"] = 760,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411101,
						1,
					},
					{
						2311101,
						1,
					},
					{
						3000502,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21205,
			["ItemDesc"] = {
				["Item"] = {
					2411101,
					2311101,
					3000502,
					500011,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 123996,
			["MonsterId"] = 212053,
			["Name"] = "英雄关卡地图12_5",
			["NeedPower"] = 16,
			["ShapeId"] = 3006,
			["ShowName"] = "转轮壁",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 760,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21206] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21205)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "诸神庙宇译志中记录的虚幻一处。记录中描述:辉印贯穿血脉，诸神意志苏醒，云冕重现登顶。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 212061)
end,
				function (API, OP)
	return API[1](OP, 212062)
end,
				function (API, OP)
	return API[1](OP, 212063)
end,
			},
			["ExpBonus"] = 768,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411101,
						1,
					},
					{
						2111101,
						1,
					},
					{
						3000502,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21206,
			["ItemDesc"] = {
				["Item"] = {
					2411101,
					2111101,
					3000502,
					500011,
				},
			},
			["MapId"] = 12,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 124624,
			["MonsterId"] = 212063,
			["Name"] = "英雄关卡地图12_6",
			["NeedPower"] = 16,
			["ShapeId"] = 3005,
			["ShowName"] = "云冕都",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 768,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21301] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21206)
end,
				function (API, OP)
	return API[3](OP,11318)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "流沙犹如瀑布一样沿着山岭的脉络倒垂而下。四季交替、山峦倒转却始终如一，奇怪的是山底高度未曾变化。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 213011)
end,
				function (API, OP)
	return API[1](OP, 213012)
end,
				function (API, OP)
	return API[1](OP, 213013)
end,
			},
			["ExpBonus"] = 776,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111201,
						1,
					},
					{
						2211201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21301,
			["ItemDesc"] = {
				["Item"] = {
					2111201,
					2211201,
					3000503,
					500011,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 124624,
			["MonsterId"] = 213013,
			["Name"] = "英雄关卡地图13_1",
			["NeedPower"] = 16,
			["ShapeId"] = 3009,
			["ShowName"] = "断沙岭",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 776,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21302] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21301)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "是否有风，沙丘总是如同波浪一样随着时间，变化着不同的纹路。不知从哪里来的枯骨在沙海中逐渐增多。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 213021)
end,
				function (API, OP)
	return API[1](OP, 213022)
end,
				function (API, OP)
	return API[1](OP, 213023)
end,
			},
			["ExpBonus"] = 784,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21302,
			["ItemDesc"] = {
				["Item"] = {
					2111201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 125251,
			["MonsterId"] = 213023,
			["Name"] = "英雄关卡地图13_2",
			["NeedPower"] = 16,
			["ShapeId"] = 2011,
			["ShowName"] = "漠沙海",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 784,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21303] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21302)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "漩状沙虫眼在脱水的旅者渴望中如期而至。进入且付出一定代价就能换取生存，到底是什么代价没人愿意提及。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 213031)
end,
				function (API, OP)
	return API[1](OP, 213032)
end,
				function (API, OP)
	return API[1](OP, 213033)
end,
			},
			["ExpBonus"] = 792,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21303,
			["ItemDesc"] = {
				["Item"] = {
					2211201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 125878,
			["MonsterId"] = 213033,
			["Name"] = "英雄关卡地图13_3",
			["NeedPower"] = 16,
			["ShapeId"] = 2016,
			["ShowName"] = "沙虫眼",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 792,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21304] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21303)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "神圣联盟元年，异域外族在此屠戮了上百万民众，鲜血让戈壁润成荒原，为纪念逝去亡灵故此更名。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 213041)
end,
				function (API, OP)
	return API[1](OP, 213042)
end,
				function (API, OP)
	return API[1](OP, 213043)
end,
			},
			["ExpBonus"] = 800,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211201,
						1,
					},
					{
						2411201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21304,
			["ItemDesc"] = {
				["Item"] = {
					2211201,
					2411201,
					3000503,
					500011,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 126506,
			["MonsterId"] = 213043,
			["Name"] = "英雄关卡地图13_4",
			["NeedPower"] = 16,
			["ShapeId"] = 3014,
			["ShowName"] = "英灵原",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 800,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21305] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 16,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21304)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "盘卧一头炎魔，即便异域现已控制整个炎沙崖窟地区，但都不敢进入。据传炎魔身死之日，大陆也将和平。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 213051)
end,
				function (API, OP)
	return API[1](OP, 213052)
end,
				function (API, OP)
	return API[1](OP, 213053)
end,
			},
			["ExpBonus"] = 808,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21305,
			["ItemDesc"] = {
				["Item"] = {
					2411201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 127133,
			["MonsterId"] = 213053,
			["Name"] = "英雄关卡地图13_5",
			["NeedPower"] = 16,
			["ShapeId"] = 2008,
			["ShowName"] = "炎门窟",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 808,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21306] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21305)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "炎沙崖窟的最高处，也是炎门窟的主体山峦。传闻每百年炎魔要蜕变一次，而蜕变产物逐渐石化成山。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 213061)
end,
				function (API, OP)
	return API[1](OP, 213062)
end,
				function (API, OP)
	return API[1](OP, 213063)
end,
			},
			["ExpBonus"] = 816,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411201,
						1,
					},
					{
						2111201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21306,
			["ItemDesc"] = {
				["Item"] = {
					2411201,
					2111201,
					3000503,
					500011,
				},
			},
			["MapId"] = 13,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 134845,
			["MonsterId"] = 213063,
			["Name"] = "英雄关卡地图13_6",
			["NeedPower"] = 20,
			["ShapeId"] = 3016,
			["ShowName"] = "望欲崖",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 816,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21401] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21306)
end,
				function (API, OP)
	return API[3](OP,11418)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "左右相对的两座连体山峰，是魔都外域的有效天然屏障，同样也是异域外族豢养魔兽的牧场。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 214011)
end,
				function (API, OP)
	return API[1](OP, 214012)
end,
				function (API, OP)
	return API[1](OP, 214013)
end,
			},
			["ExpBonus"] = 824,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111201,
						1,
					},
					{
						2211201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21401,
			["ItemDesc"] = {
				["Item"] = {
					2111201,
					2211201,
					3000503,
					500011,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 134845,
			["MonsterId"] = 214013,
			["Name"] = "英雄关卡地图14_1",
			["NeedPower"] = 20,
			["ShapeId"] = 1005,
			["ShowName"] = "域魔峰",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 824,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21402] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21401)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "境内山笋林立，道路曲折诡异。驻扎着异域十大军团，虽然彼此泾渭分明，但在布防上却无懈可击。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 214021)
end,
				function (API, OP)
	return API[1](OP, 214022)
end,
				function (API, OP)
	return API[1](OP, 214023)
end,
			},
			["ExpBonus"] = 832,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21402,
			["ItemDesc"] = {
				["Item"] = {
					2111201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 146512,
			["MonsterId"] = 214023,
			["Name"] = "英雄关卡地图14_2",
			["NeedPower"] = 20,
			["ShapeId"] = 2015,
			["ShowName"] = "炽藤境",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 832,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21403] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21402)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "始终在上演被异域族驱使血脉者斗兽般虐杀的戏码；又是地脉四方阵的魔演之地很难逃脱或者攻入。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 214031)
end,
				function (API, OP)
	return API[1](OP, 214032)
end,
				function (API, OP)
	return API[1](OP, 214033)
end,
			},
			["ExpBonus"] = 840,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21403,
			["ItemDesc"] = {
				["Item"] = {
					2211201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 147140,
			["MonsterId"] = 214033,
			["Name"] = "英雄关卡地图14_3",
			["NeedPower"] = 20,
			["ShapeId"] = 3007,
			["ShowName"] = "焚尸谷",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 840,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21404] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21403)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "异域外族建立的第一座机械堡垒，封存有异族掠夺的重要资源。也是异种贵族的日常起居之地。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 214041)
end,
				function (API, OP)
	return API[1](OP, 214042)
end,
				function (API, OP)
	return API[1](OP, 214043)
end,
			},
			["ExpBonus"] = 848,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211201,
						1,
					},
					{
						2411201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21404,
			["ItemDesc"] = {
				["Item"] = {
					2211201,
					2411201,
					3000503,
					500011,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 147767,
			["MonsterId"] = 214043,
			["Name"] = "英雄关卡地图14_4",
			["NeedPower"] = 20,
			["ShapeId"] = 2012,
			["ShowName"] = "机械窟",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 848,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21405] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21404)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "天外巨魔的头颅所化，乃是异域族群的镇命神物。曾屡次被血脉冒险者偷袭，但都惨遇失败。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 214051)
end,
				function (API, OP)
	return API[1](OP, 214052)
end,
				function (API, OP)
	return API[1](OP, 214053)
end,
			},
			["ExpBonus"] = 856,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21405,
			["ItemDesc"] = {
				["Item"] = {
					2411201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 148395,
			["MonsterId"] = 214053,
			["Name"] = "英雄关卡地图14_5",
			["NeedPower"] = 20,
			["ShapeId"] = 2013,
			["ShowName"] = "神渊口",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 856,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21406] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21405)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "魔都外域的至高建筑，异域外族执权中心。对于神圣联盟来说，至今都没有刺探到任何内部信息。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 214061)
end,
				function (API, OP)
	return API[1](OP, 214062)
end,
				function (API, OP)
	return API[1](OP, 214063)
end,
			},
			["ExpBonus"] = 864,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411201,
						1,
					},
					{
						2111201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21406,
			["ItemDesc"] = {
				["Item"] = {
					2411201,
					2111201,
					3000503,
					500011,
				},
			},
			["MapId"] = 14,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 149022,
			["MonsterId"] = 214063,
			["Name"] = "英雄关卡地图14_6",
			["NeedPower"] = 20,
			["ShapeId"] = 2005,
			["ShowName"] = "皇爵殿",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 864,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21501] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21406)
end,
				function (API, OP)
	return API[3](OP,11518)
end,
			},
			["ChatInfo"] = 10104,
			["Desc"] = "不属于这个世界的山峰，由域外而来时遭遇不明碰撞导致断裂坍塌，对异域外族有着非常重要的作用。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 215011)
end,
				function (API, OP)
	return API[1](OP, 215012)
end,
				function (API, OP)
	return API[1](OP, 215013)
end,
			},
			["ExpBonus"] = 872,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111201,
						1,
					},
					{
						2211201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21501,
			["ItemDesc"] = {
				["Item"] = {
					2111201,
					2211201,
					3000503,
					500011,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 149022,
			["MonsterId"] = 215013,
			["Name"] = "英雄关卡地图15_1",
			["NeedPower"] = 20,
			["ShapeId"] = 1010,
			["ShowName"] = "穹符山",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 872,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21502] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21501)
end,
			},
			["ChatInfo"] = 10108,
			["Desc"] = "由于地磁不符合大陆的变化规律，不断遭受天雷的轰击，这对异族出入空间桥眼造成严重的威胁。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 215021)
end,
				function (API, OP)
	return API[1](OP, 215022)
end,
				function (API, OP)
	return API[1](OP, 215023)
end,
			},
			["ExpBonus"] = 880,
			["FirstBonus"] = {
				["Item"] = {
					{
						2111201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21502,
			["ItemDesc"] = {
				["Item"] = {
					2111201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_1",
			["MinFightPower"] = 156132,
			["MonsterId"] = 215023,
			["Name"] = "英雄关卡地图15_2",
			["NeedPower"] = 20,
			["ShapeId"] = 3006,
			["ShowName"] = "天堑层",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 880,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21503] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21502)
end,
			},
			["ChatInfo"] = 10110,
			["Desc"] = "笼罩在空间桥眼上层的一团有毒云雾层，并不是地理环境演化而成，而是异族的结界防护罩。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 215031)
end,
				function (API, OP)
	return API[1](OP, 215032)
end,
				function (API, OP)
	return API[1](OP, 215033)
end,
			},
			["ExpBonus"] = 888,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21503,
			["ItemDesc"] = {
				["Item"] = {
					2211201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_3",
			["MinFightPower"] = 156761,
			["MonsterId"] = 215033,
			["Name"] = "英雄关卡地图15_3",
			["NeedPower"] = 20,
			["ShapeId"] = 3005,
			["ShowName"] = "魔云海",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 888,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21504] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21503)
end,
			},
			["ChatInfo"] = 10113,
			["Desc"] = "不断翻腾着地火岩浆，但凡有人兽接近都直接化为飞灰。唯独特殊材质的空间桥不受影响，似乎还能汲取魔力。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 215041)
end,
				function (API, OP)
	return API[1](OP, 215042)
end,
				function (API, OP)
	return API[1](OP, 215043)
end,
			},
			["ExpBonus"] = 896,
			["FirstBonus"] = {
				["Item"] = {
					{
						2211201,
						1,
					},
					{
						2411201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21504,
			["ItemDesc"] = {
				["Item"] = {
					2211201,
					2411201,
					3000503,
					500011,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_4",
			["MinFightPower"] = 167802,
			["MonsterId"] = 215043,
			["Name"] = "英雄关卡地图15_4",
			["NeedPower"] = 20,
			["ShapeId"] = 3009,
			["ShowName"] = "地焰渊",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 896,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21505] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21504)
end,
			},
			["ChatInfo"] = 10114,
			["Desc"] = "不断有异族生物穿梭其中，应该是域外通往大陆的一处通道。目前神圣联盟正在谋划破坏。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 215051)
end,
				function (API, OP)
	return API[1](OP, 215052)
end,
				function (API, OP)
	return API[1](OP, 215053)
end,
			},
			["ExpBonus"] = 904,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411201,
						1,
					},
					{
						2311201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21505,
			["ItemDesc"] = {
				["Item"] = {
					2411201,
					2311201,
					3000503,
					500011,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_7",
			["MinFightPower"] = 179180,
			["MonsterId"] = 215053,
			["Name"] = "英雄关卡地图15_5",
			["NeedPower"] = 20,
			["ShapeId"] = 2011,
			["ShowName"] = "溯洄缝",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 904,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
		[21506] = {
			["BaseNeedPower"] = 1,
			["BonusDesc"] = {
				["Exp"] = 20,
			},
			["CanEnterChecker"] = {
				function (API, OP)
	return API[3](OP,21505)
end,
			},
			["ChatInfo"] = 10115,
			["Desc"] = "溯洄缝周围的网纹状壁垒，作用目前尚未探明。不过据神圣联盟高层猜测应该是魔力储存和防护层一体物。",
			["EventTypes"] = {
				1,
				1,
				1,
			},
			["Events"] = {
				function (API, OP)
	return API[1](OP, 215061)
end,
				function (API, OP)
	return API[1](OP, 215062)
end,
				function (API, OP)
	return API[1](OP, 215063)
end,
			},
			["ExpBonus"] = 912,
			["FirstBonus"] = {
				["Item"] = {
					{
						2411201,
						1,
					},
					{
						2111201,
						1,
					},
					{
						3000503,
						3,
					},
					{
						500011,
						2,
					},
				},
			},
			["Id"] = 21506,
			["ItemDesc"] = {
				["Item"] = {
					2411201,
					2111201,
					3000503,
					500011,
				},
			},
			["MapId"] = 15,
			["MapPath"] = "scene_8",
			["MinFightPower"] = 179933,
			["MonsterId"] = 215063,
			["Name"] = "英雄关卡地图15_6",
			["NeedPower"] = 20,
			["ShapeId"] = 3014,
			["ShowName"] = "异境垒",
			["StageType"] = 3,
			["StartEvents"] = {
			},
			["SweepItem"] = {
				["CardExp"] = 912,
			},
			["ThreeTimesBonus"] = {
				["Item"] = {
					{
						500011,
						1,
					},
				},
			},
			["TimesLimit"] = 3,
			["TimesUpdateType"] = "day",
			["WinCondiDesc"] = {
				"通关",
				"通关时无英雄阵亡",
				"总剩余血量大于65%",
			},
			["WinCondition"] = {
				function (API, OP)
	return API[15](OP)
end,
				function (API, OP)
	return API[17](OP,0)
end,
				function (API, OP)
	return API[20](OP,65)
end,
			},
		},
	},
	["StageName2Id"] = {
		["关卡地图0_1"] = 101001,
		["关卡地图0_2"] = 101002,
		["关卡地图0_3"] = 101003,
		["关卡地图10_1"] = 11001,
		["关卡地图10_10"] = 11010,
		["关卡地图10_11"] = 11011,
		["关卡地图10_12"] = 11012,
		["关卡地图10_13"] = 11013,
		["关卡地图10_14"] = 11014,
		["关卡地图10_15"] = 11015,
		["关卡地图10_16"] = 11016,
		["关卡地图10_17"] = 11017,
		["关卡地图10_18"] = 11018,
		["关卡地图10_2"] = 11002,
		["关卡地图10_3"] = 11003,
		["关卡地图10_4"] = 11004,
		["关卡地图10_5"] = 11005,
		["关卡地图10_6"] = 11006,
		["关卡地图10_7"] = 11007,
		["关卡地图10_8"] = 11008,
		["关卡地图10_9"] = 11009,
		["关卡地图11_1"] = 11101,
		["关卡地图11_10"] = 11110,
		["关卡地图11_11"] = 11111,
		["关卡地图11_12"] = 11112,
		["关卡地图11_13"] = 11113,
		["关卡地图11_14"] = 11114,
		["关卡地图11_15"] = 11115,
		["关卡地图11_16"] = 11116,
		["关卡地图11_17"] = 11117,
		["关卡地图11_18"] = 11118,
		["关卡地图11_2"] = 11102,
		["关卡地图11_3"] = 11103,
		["关卡地图11_4"] = 11104,
		["关卡地图11_5"] = 11105,
		["关卡地图11_6"] = 11106,
		["关卡地图11_7"] = 11107,
		["关卡地图11_8"] = 11108,
		["关卡地图11_9"] = 11109,
		["关卡地图12_1"] = 11201,
		["关卡地图12_10"] = 11210,
		["关卡地图12_11"] = 11211,
		["关卡地图12_12"] = 11212,
		["关卡地图12_13"] = 11213,
		["关卡地图12_14"] = 11214,
		["关卡地图12_15"] = 11215,
		["关卡地图12_16"] = 11216,
		["关卡地图12_17"] = 11217,
		["关卡地图12_18"] = 11218,
		["关卡地图12_2"] = 11202,
		["关卡地图12_3"] = 11203,
		["关卡地图12_4"] = 11204,
		["关卡地图12_5"] = 11205,
		["关卡地图12_6"] = 11206,
		["关卡地图12_7"] = 11207,
		["关卡地图12_8"] = 11208,
		["关卡地图12_9"] = 11209,
		["关卡地图13_1"] = 11301,
		["关卡地图13_10"] = 11310,
		["关卡地图13_11"] = 11311,
		["关卡地图13_12"] = 11312,
		["关卡地图13_13"] = 11313,
		["关卡地图13_14"] = 11314,
		["关卡地图13_15"] = 11315,
		["关卡地图13_16"] = 11316,
		["关卡地图13_17"] = 11317,
		["关卡地图13_18"] = 11318,
		["关卡地图13_2"] = 11302,
		["关卡地图13_3"] = 11303,
		["关卡地图13_4"] = 11304,
		["关卡地图13_5"] = 11305,
		["关卡地图13_6"] = 11306,
		["关卡地图13_7"] = 11307,
		["关卡地图13_8"] = 11308,
		["关卡地图13_9"] = 11309,
		["关卡地图14_1"] = 11401,
		["关卡地图14_10"] = 11410,
		["关卡地图14_11"] = 11411,
		["关卡地图14_12"] = 11412,
		["关卡地图14_13"] = 11413,
		["关卡地图14_14"] = 11414,
		["关卡地图14_15"] = 11415,
		["关卡地图14_16"] = 11416,
		["关卡地图14_17"] = 11417,
		["关卡地图14_18"] = 11418,
		["关卡地图14_2"] = 11402,
		["关卡地图14_3"] = 11403,
		["关卡地图14_4"] = 11404,
		["关卡地图14_5"] = 11405,
		["关卡地图14_6"] = 11406,
		["关卡地图14_7"] = 11407,
		["关卡地图14_8"] = 11408,
		["关卡地图14_9"] = 11409,
		["关卡地图15_1"] = 11501,
		["关卡地图15_10"] = 11510,
		["关卡地图15_11"] = 11511,
		["关卡地图15_12"] = 11512,
		["关卡地图15_13"] = 11513,
		["关卡地图15_14"] = 11514,
		["关卡地图15_15"] = 11515,
		["关卡地图15_16"] = 11516,
		["关卡地图15_17"] = 11517,
		["关卡地图15_18"] = 11518,
		["关卡地图15_2"] = 11502,
		["关卡地图15_3"] = 11503,
		["关卡地图15_4"] = 11504,
		["关卡地图15_5"] = 11505,
		["关卡地图15_6"] = 11506,
		["关卡地图15_7"] = 11507,
		["关卡地图15_8"] = 11508,
		["关卡地图15_9"] = 11509,
		["关卡地图1_1"] = 10101,
		["关卡地图1_100"] = 101010,
		["关卡地图1_2"] = 10102,
		["关卡地图1_3"] = 10103,
		["关卡地图1_300"] = 101030,
		["关卡地图1_4"] = 10104,
		["关卡地图1_5"] = 10105,
		["关卡地图1_6"] = 10106,
		["关卡地图1_7"] = 10107,
		["关卡地图1_8"] = 10108,
		["关卡地图2_1"] = 10201,
		["关卡地图2_10"] = 10210,
		["关卡地图2_11"] = 10211,
		["关卡地图2_12"] = 10212,
		["关卡地图2_2"] = 10202,
		["关卡地图2_3"] = 10203,
		["关卡地图2_4"] = 10204,
		["关卡地图2_5"] = 10205,
		["关卡地图2_6"] = 10206,
		["关卡地图2_7"] = 10207,
		["关卡地图2_8"] = 10208,
		["关卡地图2_9"] = 10209,
		["关卡地图3_1"] = 10301,
		["关卡地图3_10"] = 10307,
		["关卡地图3_12"] = 10308,
		["关卡地图3_13"] = 10309,
		["关卡地图3_15"] = 10310,
		["关卡地图3_17"] = 10311,
		["关卡地图3_18"] = 10312,
		["关卡地图3_3"] = 10302,
		["关卡地图3_4"] = 10303,
		["关卡地图3_6"] = 10304,
		["关卡地图3_7"] = 10305,
		["关卡地图3_9"] = 10306,
		["关卡地图4_1"] = 10401,
		["关卡地图4_10"] = 10410,
		["关卡地图4_11"] = 10411,
		["关卡地图4_12"] = 10412,
		["关卡地图4_121"] = 104121,
		["关卡地图4_13"] = 10413,
		["关卡地图4_14"] = 10414,
		["关卡地图4_15"] = 10415,
		["关卡地图4_16"] = 10416,
		["关卡地图4_17"] = 10417,
		["关卡地图4_18"] = 10418,
		["关卡地图4_181"] = 104181,
		["关卡地图4_2"] = 10402,
		["关卡地图4_3"] = 10403,
		["关卡地图4_4"] = 10404,
		["关卡地图4_5"] = 10405,
		["关卡地图4_6"] = 10406,
		["关卡地图4_61"] = 104061,
		["关卡地图4_7"] = 10407,
		["关卡地图4_8"] = 10408,
		["关卡地图4_9"] = 10409,
		["关卡地图5_1"] = 10501,
		["关卡地图5_10"] = 10510,
		["关卡地图5_11"] = 10511,
		["关卡地图5_12"] = 10512,
		["关卡地图5_121"] = 105121,
		["关卡地图5_13"] = 10513,
		["关卡地图5_14"] = 10514,
		["关卡地图5_15"] = 10515,
		["关卡地图5_16"] = 10516,
		["关卡地图5_17"] = 10517,
		["关卡地图5_18"] = 10518,
		["关卡地图5_181"] = 105181,
		["关卡地图5_2"] = 10502,
		["关卡地图5_3"] = 10503,
		["关卡地图5_4"] = 10504,
		["关卡地图5_5"] = 10505,
		["关卡地图5_6"] = 10506,
		["关卡地图5_61"] = 105061,
		["关卡地图5_7"] = 10507,
		["关卡地图5_8"] = 10508,
		["关卡地图5_9"] = 10509,
		["关卡地图6_1"] = 10601,
		["关卡地图6_10"] = 10610,
		["关卡地图6_11"] = 10611,
		["关卡地图6_12"] = 10612,
		["关卡地图6_13"] = 10613,
		["关卡地图6_14"] = 10614,
		["关卡地图6_15"] = 10615,
		["关卡地图6_16"] = 10616,
		["关卡地图6_17"] = 10617,
		["关卡地图6_18"] = 10618,
		["关卡地图6_2"] = 10602,
		["关卡地图6_3"] = 10603,
		["关卡地图6_4"] = 10604,
		["关卡地图6_5"] = 10605,
		["关卡地图6_6"] = 10606,
		["关卡地图6_7"] = 10607,
		["关卡地图6_8"] = 10608,
		["关卡地图6_9"] = 10609,
		["关卡地图7_1"] = 10701,
		["关卡地图7_10"] = 10710,
		["关卡地图7_11"] = 10711,
		["关卡地图7_12"] = 10712,
		["关卡地图7_13"] = 10713,
		["关卡地图7_14"] = 10714,
		["关卡地图7_15"] = 10715,
		["关卡地图7_16"] = 10716,
		["关卡地图7_17"] = 10717,
		["关卡地图7_18"] = 10718,
		["关卡地图7_2"] = 10702,
		["关卡地图7_3"] = 10703,
		["关卡地图7_4"] = 10704,
		["关卡地图7_5"] = 10705,
		["关卡地图7_6"] = 10706,
		["关卡地图7_7"] = 10707,
		["关卡地图7_8"] = 10708,
		["关卡地图7_9"] = 10709,
		["关卡地图8_1"] = 10801,
		["关卡地图8_10"] = 10810,
		["关卡地图8_11"] = 10811,
		["关卡地图8_12"] = 10812,
		["关卡地图8_13"] = 10813,
		["关卡地图8_14"] = 10814,
		["关卡地图8_15"] = 10815,
		["关卡地图8_16"] = 10816,
		["关卡地图8_17"] = 10817,
		["关卡地图8_18"] = 10818,
		["关卡地图8_2"] = 10802,
		["关卡地图8_3"] = 10803,
		["关卡地图8_4"] = 10804,
		["关卡地图8_5"] = 10805,
		["关卡地图8_6"] = 10806,
		["关卡地图8_7"] = 10807,
		["关卡地图8_8"] = 10808,
		["关卡地图8_9"] = 10809,
		["关卡地图9_1"] = 10901,
		["关卡地图9_10"] = 10910,
		["关卡地图9_11"] = 10911,
		["关卡地图9_12"] = 10912,
		["关卡地图9_13"] = 10913,
		["关卡地图9_14"] = 10914,
		["关卡地图9_15"] = 10915,
		["关卡地图9_16"] = 10916,
		["关卡地图9_17"] = 10917,
		["关卡地图9_18"] = 10918,
		["关卡地图9_2"] = 10902,
		["关卡地图9_3"] = 10903,
		["关卡地图9_4"] = 10904,
		["关卡地图9_5"] = 10905,
		["关卡地图9_6"] = 10906,
		["关卡地图9_7"] = 10907,
		["关卡地图9_8"] = 10908,
		["关卡地图9_9"] = 10909,
		["英雄关卡地图10_1"] = 21001,
		["英雄关卡地图10_2"] = 21002,
		["英雄关卡地图10_3"] = 21003,
		["英雄关卡地图10_4"] = 21004,
		["英雄关卡地图10_5"] = 21005,
		["英雄关卡地图10_6"] = 21006,
		["英雄关卡地图11_1"] = 21101,
		["英雄关卡地图11_2"] = 21102,
		["英雄关卡地图11_3"] = 21103,
		["英雄关卡地图11_4"] = 21104,
		["英雄关卡地图11_5"] = 21105,
		["英雄关卡地图11_6"] = 21106,
		["英雄关卡地图12_1"] = 21201,
		["英雄关卡地图12_2"] = 21202,
		["英雄关卡地图12_3"] = 21203,
		["英雄关卡地图12_4"] = 21204,
		["英雄关卡地图12_5"] = 21205,
		["英雄关卡地图12_6"] = 21206,
		["英雄关卡地图13_1"] = 21301,
		["英雄关卡地图13_2"] = 21302,
		["英雄关卡地图13_3"] = 21303,
		["英雄关卡地图13_4"] = 21304,
		["英雄关卡地图13_5"] = 21305,
		["英雄关卡地图13_6"] = 21306,
		["英雄关卡地图14_1"] = 21401,
		["英雄关卡地图14_2"] = 21402,
		["英雄关卡地图14_3"] = 21403,
		["英雄关卡地图14_4"] = 21404,
		["英雄关卡地图14_5"] = 21405,
		["英雄关卡地图14_6"] = 21406,
		["英雄关卡地图15_1"] = 21501,
		["英雄关卡地图15_2"] = 21502,
		["英雄关卡地图15_3"] = 21503,
		["英雄关卡地图15_4"] = 21504,
		["英雄关卡地图15_5"] = 21505,
		["英雄关卡地图15_6"] = 21506,
		["英雄关卡地图1_1"] = 20101,
		["英雄关卡地图1_2"] = 20102,
		["英雄关卡地图1_3"] = 20103,
		["英雄关卡地图1_4"] = 20104,
		["英雄关卡地图1_5"] = 20105,
		["英雄关卡地图1_6"] = 20106,
		["英雄关卡地图2_1"] = 20201,
		["英雄关卡地图2_2"] = 20202,
		["英雄关卡地图2_3"] = 20203,
		["英雄关卡地图2_4"] = 20204,
		["英雄关卡地图2_5"] = 20205,
		["英雄关卡地图2_6"] = 20206,
		["英雄关卡地图3_1"] = 20301,
		["英雄关卡地图3_2"] = 20302,
		["英雄关卡地图3_3"] = 20303,
		["英雄关卡地图3_4"] = 20304,
		["英雄关卡地图3_5"] = 20305,
		["英雄关卡地图3_6"] = 20306,
		["英雄关卡地图4_1"] = 20401,
		["英雄关卡地图4_2"] = 20402,
		["英雄关卡地图4_3"] = 20403,
		["英雄关卡地图4_4"] = 20404,
		["英雄关卡地图4_5"] = 20405,
		["英雄关卡地图4_6"] = 20406,
		["英雄关卡地图5_1"] = 20501,
		["英雄关卡地图5_2"] = 20502,
		["英雄关卡地图5_3"] = 20503,
		["英雄关卡地图5_4"] = 20504,
		["英雄关卡地图5_5"] = 20505,
		["英雄关卡地图5_6"] = 20506,
		["英雄关卡地图6_1"] = 20601,
		["英雄关卡地图6_2"] = 20602,
		["英雄关卡地图6_3"] = 20603,
		["英雄关卡地图6_4"] = 20604,
		["英雄关卡地图6_5"] = 20605,
		["英雄关卡地图6_6"] = 20606,
		["英雄关卡地图7_1"] = 20701,
		["英雄关卡地图7_2"] = 20702,
		["英雄关卡地图7_3"] = 20703,
		["英雄关卡地图7_4"] = 20704,
		["英雄关卡地图7_5"] = 20705,
		["英雄关卡地图7_6"] = 20706,
		["英雄关卡地图8_1"] = 20801,
		["英雄关卡地图8_2"] = 20802,
		["英雄关卡地图8_3"] = 20803,
		["英雄关卡地图8_4"] = 20804,
		["英雄关卡地图8_5"] = 20805,
		["英雄关卡地图8_6"] = 20806,
		["英雄关卡地图9_1"] = 20901,
		["英雄关卡地图9_2"] = 20902,
		["英雄关卡地图9_3"] = 20903,
		["英雄关卡地图9_4"] = 20904,
		["英雄关卡地图9_5"] = 20905,
		["英雄关卡地图9_6"] = 20906,
	},
}