local Env = getfenv()

Viewer = require("base.viewer")
iconv = require("iconv")
json = require("base.json")
json_decoder = require('base.json_decoder').new()
utf2gbk = iconv.new("gbk","utf8")
DB = require("base.database")
RedisDB = require("base.redis")
CommonData = require("base.common_const")
CommonFunc = require("base.common_func")
--加载DB数据库模块
local ModelLoad = require("base.model_load")
for Name, Model in pairs(ModelLoad) do
	Env[Name] = Model
end
--加载游戏的配置表
local GameCfg = require("base.game_cfg")
for Name, Cfg in pairs(GameCfg) do
	Env[Name] = Cfg
end

--加载lua第三方库
local LuaLibs = require("base.lua_lib_cfg")
for Name, Lib in pairs(LuaLibs) do
	Env[Name] = Lib
end
--加载全局函数集
local FuncMap = require("base.global_func")
for Name, Func in pairs(FuncMap) do
	Env[Name] = Func
end
--设置random seed
math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6)))




