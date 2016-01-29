#!/bin/bash
#每天0点定时将文件后缀为.log的文件名自动加上昨天的日期

LOG_DIR="/home/statics/666/logic/log" 
if [ -d $LOG_DIR ];then
	cd $LOG_DIR
	FILE_LIST=`ls`
	for FILE in $FILE_LIST;do
		SUFFIX=`echo ${FILE##*.}`
		if [ $SUFFIX == "log" ]; then #将后缀名为log的文件重命名加上昨天的日期
			YESTERDAY=`date -d "yesterday" +%Y%m%d`
			#echo "$FILE.$YESTERDAY"
			mv $FILE "$FILE.$YESTERDAY"
		fi
	done
fi
