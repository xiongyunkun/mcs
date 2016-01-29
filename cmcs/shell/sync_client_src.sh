#!/bin/bash
IPATH=`pwd`

SHPATH=`echo ${0%/*}`

IDX=`echo $SHPATH|awk '{i=match($0,/\//);print i}'`
if [ $IDX = 1 ];then
	IPATH=$SHPATH
else
	IPATH=$IPATH/$SHPATH
fi
cd $IPATH/syncclient
./rsync2res.sh cli_res cli_res
