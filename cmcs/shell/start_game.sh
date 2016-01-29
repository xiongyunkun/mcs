#!/bin/bash
HOSTID=$1
cd "/home/wgame/$1/logic/shell"
#先启动引擎
./game_service.sh start
#启动游戏
./game_start.sh start
#等待5秒，等待把log全部输出
sleep 5


