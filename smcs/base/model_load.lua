--[[
-- model里面的model文件在这里配置加载
-- 注意下顺序，最好把model都放到相应的模块注释下
]]
return {
	--user
	UserData = require("model.user.user_data"),
	PermissionData = require("model.user.permission_data"),
	UserModuleData = require("model.user.user_module_perm_data"),
	UserPlatformData = require("model.user.user_platform_perm_data"),

	--module
	ModulesData = require("model.module.modules_data"),
	ModuleLogData = require("model.module.module_log_data"),
	OperationLogData = require("model.module.operation_log_data"),

	--server
	ServerData = require("model.server.server_data"),
	CroServerData = require("model.server.cro_server_data"),
	PlatformData = require("model.server.platform_data"),
	ServerOperationData = require("model.server.server_operation_data"),
	InterfaceKeyData = require("model.server.interface_key_data"),
	SimulateLoginData = require("model.server.simulate_login_data"),
	IPWhiteListData = require("model.server.ip_white_list_data"),--IP白名单
	ServerMergeData = require("model.server.server_merge_data"),
	StartServerInfoData = require("model.server.start_server_info_data"), --独代后台开服信息表

	--gm
	GMRuleData = require("model.gm.gm_rule_data"),
	GMOperationData = require("model.gm.gm_operation_data"),
	--statics.statics_cfg
	StaticsIndexData = require("model.statics.statics_cfg.statics_index_data"),
	StaticsModuleData = require("model.statics.statics_cfg.statics_module_data"),
	StaticsErrData = require("model.statics.statics_cfg.statics_serr_data"),
	StaticsRunErrTimeData = require("model.statics.statics_cfg.run_erro_time_data"),
	KeyValueData = require("model.statics.statics_cfg.key_value_data"),
	PayStaticsCfgData = require("model.statics.statics_cfg.pay_statics_cfg_data"),

	--statics.statics
	OnlineData = require("model.statics.statics.online_data"),
	AddPlayerData = require("model.statics.statics.add_player_data"),
	RetentionData = require("model.statics.statics.retention_data"),
	OnlineTimeData = require("model.statics.statics.online_time_data"),
	GoldData = require("model.statics.statics.gold_data"),
	VipData = require("model.statics.statics.vip_data"),
	FightRankData = require("model.statics.statics.fighting_rank_data"),
	HistoryOnlineData = require("model.statics.statics.history_online_data"),
	HistoryRegData = require("model.statics.statics.history_reg_data"),
	LevelData = require("model.statics.statics.level_data"),
	LevelStaticsData = require("model.statics.statics.level_statics_data"),
	LoginAnalysisData = require("model.statics.statics.login_analysis_data"),
	LoginStaticsData = require("model.statics.statics.login_statics_data"),
	UserInfoData = require("model.statics.statics.user_info_data"),
	PlayWayStaticsData = require("model.statics.statics.play_way_statics_data"),
	PayOrderData = require("model.statics.statics.pay_order_data"),
	UserPayStaticsData = require("model.statics.statics.user_pay_statics_data"),
	UserPayDayStaticsData = require("model.statics.statics.user_pay_day_statics_data"),
	PayActualTimeData = require("model.statics.statics.pay_actual_time_data"),
	PayDayStaticsData = require("model.statics.statics.pay_day_statics_data"),
	PayZoneStaticsData = require("model.statics.statics.pay_zone_statics_data"),
	PayDayFrequencyStaticsData = require("model.statics.statics.pay_day_frequency_statics_data"),
	InstanceStaticsData = require("model.statics.statics.instance_statics_data"),
	PayRetentionData = require("model.statics.statics.pay_retention_data"),
	PetDayStaticsData = require("model.statics.statics.pet_day_statics_data"),

	-- statics.log
	AddPlayerLogData = require("model.statics.log.add_player_log_data"),
	LoginLogData = require("model.statics.log.login_log_data"),
	LogoutLogData = require("model.statics.log.logout_log_data"),
	GoldLogData = require("model.statics.log.gold_log_data"),
	MoneyLogData = require("model.statics.log.money_log_data"),
	LevelUpLogData = require("model.statics.log.level_up_log_data"),
	ClientLoadLogData = require("model.statics.log.clientload_log_data"),
	ChatLogData = require("model.statics.log.chat_log_data"),
	TaskLogData = require("model.statics.log.task_log_data"),
	ActLogData = require("model.statics.log.act_log_data"),
	ShopBuyLogData = require("model.statics.log.shop_buy_log_data"),
	RenameLogData = require("model.statics.log.rename_log_data"),
	MountLevelData = require("model.statics.log.mount_level_data"),
	ItemLogData = require("model.statics.log.item_log_data"),
	InstanceLogData = require("model.statics.log.instance_log_data"),
	MessageLogData = require("model.statics.log.message_log_data"),
	BanLogData = require("model.statics.log.ban_log_data"),
	ExpLogData = require("model.statics.log.exp_log_data"),
	GodDoorLogData = require("model.statics.log.god_door_log_data"),
	PetLogData = require("model.statics.log.pet_log_data"),
	PetEquipLogData = require("model.statics.log.pet_equip_log_data"),
	PetBrandLogData = require("model.statics.log.pet_brand_log_data"),
	TeamInstLogData = require("model.statics.log.team_inst_log_data"),
	MountLevelLogData = require("model.statics.log.mount_level_log_data"),
	PetSoulLogData = require("model.statics.log.pet_soul_log_data"),
	EndlessBattleLogData = require("model.statics.log.endless_battle_log_data"),
	LottoLogData = require("model.statics.log.lotto_log_data"),

	--game
	BroadcastData = require("model.game.broadcast_cfg_data"),
	ActivityData = require("model.game.activity_cfg_data"),
	SuperPlayerData = require("model.game.super_player_data"),
	SuperPlayerServerData = require("model.game.super_player_server_data"),
	PlayerGMData = require("model.game.player_gm_data"),
	CDKeyActivityData = require("model.game.cdkey_activity_data"),
	CDKeyData = require("model.game.cdkey_data"),
	CDKeyExchangeData = require("model.game.cdkey_exchange_data"),
	CDKeyErrData = require("model.game.cdkey_err_data"),
	ItemApplyData = require("model.game.item_apply_data"),
	AllHistoryOnlineData = require("model.game.all_history_online_data"),
}















