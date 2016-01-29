#!/bin/bash
# 需要执行GM命令时，参数必须不能小于5个，参数依次为：
# HostID:服ID，GsID：进程号,Cmd：需要执行的命令,ExecuteTime：执行时间（如果是立即执行则为空）,TransID：执行流水号

HELP="使用方法：.gm_cmd.sh <HostID:服ID> <GsID:进程号> <Cmd:执行命令> <Time:执行时间> <TransID:执行流水号>"
if [ $# -lt 5 ];then #参数小于5，退出
	echo "args length erro, need 5 args\n $HELP"
fi
#跳转到对应的服目录
cd "/home/wgame/$1/logic/shell"
./addcmd.sh "$2" "$3" "$4" "$5"


