#!/bin/bash
# 需要执行获取log命令时，参数必须不能小于3个，参数依次为：
# HostID:服ID，FileName:文件名
HELP="使用方法：.get_log.sh <HostID:服ID> <FileName:文件名> <StartTime:开始时间> <EndTime:结束时间>"
if [ $# -lt 3 ];then #参数小于3，退出
	echo "args length erro, need at least 3 args\n $HELP"
fi
#跳转到对应的服目录
LOG_DIR="/home/wgame/$1/logic/log" 
if [ -d $LOG_DIR ];then
	#根据开始时间和结束时间判断获得要统计的文件列表 
	cd $LOG_DIR
    START_TIME="$3"
    END_TIME="$4"
    LOG_FILE=""
    TEMP_LINE_FILE=""
    if [ -z "$END_TIME" ];then #结束时间为空则取现在的时间为结束时间
        END_TIME=`date +"%Y-%m-%d %H:%M:%S"`
    fi
    #根据开始时间和结束时间获得所需读取的文件列表
    TODAY=`date +"%Y-%m-%d"`
    START_DAY=`echo "$START_TIME" | cut -b 1-10`
	END_DAY=`echo "$END_TIME" | cut -b 1-10`
    #如果开始时间都比今天大直接返回
    if [[ "$TODAY" > "$START_DAY" ]] || [[ "$TODAY" == "$START_DAY" ]];then
        #转变成时间戳
		STIMESTAMP=`date -d "$START_DAY" +%s`
		ETIMESTAMP=`date -d "$END_DAY" +%s`
		while [ $STIMESTAMP -le $ETIMESTAMP ]
		do
			DATE=`date -d "1970-01-01 UTC $STIMESTAMP seconds" "+%F"`
			DATE_FILE=${DATE//-/}
			if [[ "$DATE" < "$TODAY" ]];then
				if [ -f "$2.$DATE_FILE" ];then #文件存在才添加
					LOG_FILE="$LOG_FILE $2.$DATE_FILE"
				fi
			elif [[ "$DATE" = "$TODAY" ]];then
				if [ -f "$2" ];then #文件存在才添加
					LOG_FILE="$LOG_FILE $2"
				fi
			fi
			STIMESTAMP=`expr $STIMESTAMP + 86400`
		done
	fi
	if [ "$LOG_FILE" == "" ]; then ##需要查找的文件为空也直接返回
		echo ""
		exit
	fi
	##开始解析文件了，先解析出行数
	START_TIME="[$START_TIME"
	END_TIME="[$END_TIME"
	LINE_NUMS=$(awk -v TM1="$START_TIME" -v TM2="$END_TIME" -v ST="" -v ED="" -F']' '/^\[/ { if($1>=TM1) {if(ST=="") {ST=NR}} if($1>TM2) {ED=NR; exit}};END{print ST" "ED}' $LOG_FILE) 	
	ST_NUM=${LINE_NUMS% *}
	ED_NUM=${LINE_NUMS#* }
	if [ "$ED_NUM" == "" ]; then
		ED_NUM="$"
	else
		ED_NUM=$(($ED_NUM-1))
	fi
	#根据行数解析文件
	if [ "$ST_NUM" == "" ]; then
		echo ""
	else
		if [ "$ED_NUM" == "$" ]; then
			echo | awk "NR>=$ST_NUM {print}" $LOG_FILE
		else
			if [ $ED_NUM -lt $ST_NUM ]; then
				echo "" 
			else
				echo | awk "NR==$ST_NUM,NR==$ED_NUM {print}" $LOG_FILE
			fi
		fi
	fi
	exit
fi
#否则返回为空
echo ""
