#!/bin/bash
#获取脚本所在路径
IPATH=`pwd`

SHPATH=`echo ${0%/*}`

IDX=`echo $SHPATH|awk '{i=match($0,/\//);print i}'`
echo $IDX
if [ $IDX = 1 ];then
	IPATH=$SHPATH
else
	IPATH=$IPATH/$SHPATH
fi

IPATH=`echo $IPATH|sed -e 's/\/\.//g'`
SPATH=`echo $IPATH|sed -e 's/\//\\\\\//g'`
cat smcs.conf.org |sed -e 's/\$workpath\$/'$SPATH'/g' > smcs.conf
cat nginx.conf.org |sed -e 's/\$workpath\$/'$SPATH'/g' > conf/nginx.conf
cat admin_modules.conf.org > custom_conf/admin_modules.conf