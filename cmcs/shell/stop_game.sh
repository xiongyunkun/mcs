#!/bin/bash
HOSTID=$1
cd "/home/wgame/$1/logic/shell"
#先关闭游戏
./game_start.sh stop
sleep 5
#关闭引擎
./game_service.sh stop


