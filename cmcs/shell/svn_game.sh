#!/bin/bash
SVN_HOME="http://p1.yhsvn.com/svn/workspace/webgame/program/server/trunk" #svn地址
ENGINE_HOME="http://p1.yhsvn.com/svn/workspace/webgame/program/server/enginesrc/enginebin" #引擎地址
#获取脚本所在路径
IPATH=$(cd "$(dirname "$0")"; pwd)
ROOT="$IPATH/../../.."
HOSTID=$1
HOSTID=${HOSTID:?"undefined"} #HOSTID不能为空
GAME_PATH="$ROOT/$HOSTID/"
if [ ! -x $GAME_PATH ];then
	mkdir $GAME_PATH #不存在该game文件夹，新建该文件夹
	svn co $SVN_HOME $GAME_PATH
	#更新引擎文件
	ENGIN_DIR="${GAME_PATH}engine"
	svn co $ENGINE_HOME $ENGIN_DIR

	LOGIC_PATH="${GAME_PATH}logic"
	#在该game路径下面创建dat和log
	GAME_DATA="${LOGIC_PATH}/dat"
	GAME_LOG="${LOGIC_PATH}/log"
	mkdir $GAME_DATA
	mkdir $GAME_LOG
	chmod +x $GAME_DATA
	chmod +x $GAME_LOG
	#在data和log文件夹中建立软连接
	DAT_PATH="${ROOT}/data/$HOSTID"
	LOG_PATH="${ROOT}/log/$HOSTID"
	ln -s $GAME_DATA $DAT_PATH
	ln -s $GAME_LOG $LOG_PATH
else
	svn up $GAME_PATH
fi
#更新端口配置信息
CONF_SHELL_PATH="${GAME_PATH}logic/shell"
cd $CONF_SHELL_PATH
./update_conf.sh $HOSTID "remote"


