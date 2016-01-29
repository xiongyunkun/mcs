#!/bin/bash
IPATH=`pwd`
echo $IPATH
SHPATH=`echo ${0%/*}`
echo $SHPATH
IDX=`echo $SHPATH|awk '{i=match($0,/\//);print i}'`
Str="521415361527"
Str2=${Str:2}
Str2=`date -d @$Str2  "+%Y%m%d"` 
echo $Str2
date "+{Time=\"%Y-%m-%d %H:%M:%S\",Process=\"$1\",Cmd=\"$2\"},"

