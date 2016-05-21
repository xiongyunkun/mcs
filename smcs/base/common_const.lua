----------------------------------------
--$Id: common.lua 21449 2014-10-22 06:46:41Z xiongyunkun $
----------------------------------------
--[[
-- 常量配置，用于全局都需要配置的逻辑
--
--]]

module(...,package.seeall)

--操作类型对应的执行脚本名称
ShellMap = {
	"svn_game.sh",
	"start_game.sh",
	"stop_game.sh",
	"gm_cmd.sh",
}

--系统名称
SystemMap = {
	["oss"] = "运营后台",
}
--钻石类型
GoldTypes = {
	Gold = 1,
	CreditGold = 2,
}
GoldTypeNames = {"非绑定钻石", "绑定钻石"}
--钻石统计类型
GoldStaticsTypes = {
	Sub = 1,
	Add = 2,
}
--VIP等级
VipLevels = {1,2,3,4,5,6,7,8,9,10} 
--战斗力排名最大数
FightingRankNum = 100
--最大等级数
MaxLevel = 70
--公告ID映射表
BroadcastList = {3001,3002,3003,3004,3005}
--聊天频道
ChatChannels = {"世界","场景","活动"}
--cdkey激活码使用类型
KeyTypes = {"一个角色使用一次","使用一次不限制角色","每个服只使用一次","微信礼包"}
--奖励类型
RewardMap = {
	Gold = "钻石",
	CreditGold = "绑钻",
	Money = "金币",
	Item = "物品",
}
--登陆过程分析
LoginStaticsStep = {
	["登陆接口"] = 1, --登陆接口
	["下载资源包"] = 2, --下载资源包
	["创角页面展示"] = 3, -- 创角页面展示
	["创角成功"] = 4,  -- 创角成功
	["进入游戏"] = 5, -- 进入游戏
}

--可以指定进程执行的GM指令ID列表
--ParamIndex表示GSID参数的位置，在gmmgr中执行，如果该位置没有值，GsID则不指定进程，统一采用GM默认进程0
GMGsIDList = {
	[1] = {ParamIndex = 2},
	[22] = {ParamIndex = 2, MultiExecute = true},
}


--系统编号，用于区别是来自哪个系统
SysMap = {[""] = 1, ["oss"] = 2}
--奖励类型编号，必须与游戏那边一致
mBONUS_ITEM = 1
mBONUS_MONEY = 2
mBONUS_GOLD = 3
mBONUS_CREDITGOLD = 6
--奖励映射表
mBONUS_MAP = {
	["金币"] = mBONUS_MONEY,
	["钻石"] = mBONUS_GOLD,
	["绑钻"] = mBONUS_CREDITGOLD,
}
BONUS_ID2NAME = {"物品","金币","钻石","经验","魔魂","绑钻","星钻","宠物","Feat","功勋","城邦繁荣度",
	"体力", "城邦资金", "家园经验", "英灵卡1", "英灵卡2", "英灵卡3", "英灵卡4", "英灵卡5", "2星神格",
	"3星神格", "4星神格", "5星神格", "钻石"}

--禁言封号操作列表
BanOperationTypes = {"禁言", "解除禁言", "封号", "解除封号", "禁言封禁IP"}
RTX_URL = "192.168.1.99:8012/sendNotify.cgi?" --RTX地址
ERRO_LOG_STATICS_URL = "ht2.zszs.game.yy.com/api/get_run_erro"
--ERRO_LOG_STATICS_URL = "192.168.1.98:8081/api/get_run_erro"
--活动名称列表
ActivityList = {"旅行商人活动","英雄试炼_运营火","英雄试炼_运营水",
	"英雄试炼_运营木","金玉满堂", "财运亨通", "一掷千金", "积善成福"} 

--系统玩法
SYS_INSTANCES = {
	[1] = "冒险之路", [2] = "剧情副本", [3] = "魔神试炼", [6] = "元素之怒",
	[11] = "诸神黄昏",[12] = "洋葱与蘑菇", [13] = "龙珠秘境",[14] = "城邦悬赏",
	[15] = "方舟之战",[16] = "众神之门",[17] = "魔法炼金",
	[18] = "魔法炼魂",[19] = "七天豪礼",[20] = "每日签到",[21] = "收益追回",[22] = "家族战",
}
--时间玩法
TIMER_INSTANCES = {
	[51] = "魔神大赛",
	[52] = "世界boss",
	[53] = "水晶战场",
	[54] = "神域争霸赛",
	[55] = "暮光之战积分赛",
}
--邮件内容多语言配置
MAIL_LANGUAGES = {
	["pl"] = {
		["Title"] = "Nagroda GM", 
		["Content"] = "Ta wiadomość jest wysyłana przez GM，dziękujemy za wsparcie!",
	},
	["es"] = {
		["Title"] = "GM oficial", 
		["Content"] = "Agradecemos por su apoyo，este correo fue enviado por GM！",
	},
}

