#!/bin/bash
# 需要执行初始化平台数据库时，参数必须为3个，参数依次为：
# PlatformID:平台ID，StartTime:Log日志记录开始时间，EndTime:日志记录结束时间
IPATH=`pwd`
echo $IPATH
SHPATH=`echo ${0%/*}`
echo $SHPATH
IDX=`echo $SHPATH|awk '{i=match($0,/\//);print i}'`
echo $IDX
if [ $IDX = 1 ];then
	IPATH=$SHPATH
else
	IPATH=$IPATH/$SHPATH
fi
SQL_PATH=$IPATH/../updatesql/statics.sql
mysql -u smcs -h 127.0.0.1 -psmcsdb -e "
tee /tmp/temp.log
create database "$1_log";
create database "$1_statics";
use "$1_statics";
source $SQL_PATH;
quit"
wget -q "http://127.0.0.1:8081/log/create_table_sql?pf=$1&startdate=$2&enddate=$3" -O /dev/null 

