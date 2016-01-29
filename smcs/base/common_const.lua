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
--	CreditGold = 2,
}
GoldTypeNames = {"非绑定钻石", } -- "绑定钻石"}
--钻石统计类型
GoldStaticsTypes = {
	Sub = 1,
	Add = 2,
}
--VIP等级
VipLevels = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} 
--战斗力排名最大数
FightingRankNum = 100
--最大等级数
MaxLevel = 100
--公告ID映射表
BroadcastList = {3, 4, 5} --{3001,3002,3003,3004,3005}
--聊天频道
ChatChannels = {"弹幕","公会","世界", "系统", "系统滚屏", "私聊"}
--cdkey激活码使用类型
KeyTypes = {"一个角色使用一次","使用一次不限制角色","每个服只使用一次","微信礼包"}
--奖励类型
RewardMap = {
	Gold = "钻石",
--	CreditGold = "绑钻",
	Money = "金币",
	Item = "物品",
}

--登陆过程分析
LoginStaticsStep = {
	["点击游戏图标"] = 1, --点击游戏图标
	["账号登陆界面"] = 2, -- 账号登陆界面
	["点击系统公告"] = 3,  -- 点击系统公告
	["达到选服界面"] = 4, --达到选服界面
}

--可以指定进程执行的GM指令ID列表
--ParamIndex表示GSID参数的位置，在gmmgr中执行，如果该位置没有值，GsID则不指定进程，统一采用GM默认进程0
--目前暂时为update指令
GMGsIDList = {
	[1] = {ParamIndex = 2}
}

--系统编号，用于区别是来自哪个系统
SysMap = {[""] = 1, ["oss"] = 2}
--奖励类型编号，必须与游戏那边一致
NUS_NONE = "空"
mBONUS_ITEM = "物品"
mBONUS_CARD = "卡片"
mBONUS_RULE = "规则"
mBONUS_GOLD = "金币"
mBONUS_CREDIT = "钻石" --没用到这个，所以改成钻石
mBONUS_EXP = "经验"                                                
mBONUS_SFSCORE = "街头霸王功勋"
mBONUS_POWER = "体力"

--奖励映射表
mBONUS_MAP = {
	["金币"] = mBONUS_GOLD,
	["钻石"] = mBONUS_CREDIT,
}

-- 货币/等价物类型, 必须与游戏那边一致
CURRENCY_TYPE = {
    MONEY = 0, -- 铜币/金钱, 即银两
    ARENASCORE = 2, -- 竞技场功勋
    EXPLOIT = 3, -- 街头霸王
    GOLD = 4,  --钻石
    FACCONTRI = 5, -- 公会贡献
} 

MAIL_TYPE2NAME = {"金币", "钻石", "公会贡献", "竞技场功勋", "街霸功勋", "卡牌", "物品" }

-- BONUS_ID2NAME = {"物品","金币","钻石","经验","魔魂","绑钻","星钻","宠物","Feat","功勋","城邦繁荣度",	"体力", "城邦资金"}

--禁言封号操作列表
BanOperationTypes = {"禁言", "解除禁言", "封号", "解除封号"}
RTX_URL = "192.168.1.99:8012/sendNotify.cgi?" --RTX地址
MAIL_URL = "192.168.1.97:882/www/sendmail.php?" -- Mail地址

-- ERRO_LOG_STATICS_URL_INTER = "192.168.1.97:8081/api/get_run_erro"
-- CLIENT_LOG_STATICS_URL_INTER = "192.168.1.97:8081/api/get_client_erro"

ERRO_LOG_STATICS_URL = "ht.sh.yh.com/api/get_run_erro"
CLIENT_LOG_STATICS_URL = "ht.sh.yh.com/api/get_client_erro"
W3_HOSTID = 666 --3w服务器上默认的HostID

--[[
-- IP白名单操作列表
if ERRO_LOG_STATICS_URL_INTER then
	WWW_URL = "192.168.1.97:882"
else
	WWW_URL = "sh.game12580.com"
end

ENV_MGR_URL = WWW_URL .. "/www/env_mgr.php?"
IP_WHITE_LIST_URL = ENV_MGR_URL .. "func=WriteWhiteList&List="
ACCOUNT_WHITE_LIST_URL = ENV_MGR_URL .. "func=WriteAccountList&accountlist="
--]]

