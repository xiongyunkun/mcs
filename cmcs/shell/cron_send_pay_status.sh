#!/bin/bash
#发送充值状态结果给gservice
#参数类型: start, stop
if [ $1 == "start" ]; then #启动定时器
	while true;do
		wget -q "http://127.0.0.1:7633/do_cron_get_pay_result" -O /dev/null 
		sleep 5 #等待5秒
		continue
	done
fi
if [ $1 == "stop" ]; then 
	kill -9 `ps -ef|grep -v "grep"|grep "cron_send_pay_status.sh start"|awk '{print $2}'`
fi

