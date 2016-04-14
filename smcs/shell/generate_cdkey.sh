#!/bin/bash
# 需要执行生成CDKey时，参数必须为2个，参数依次为：
# ActivityID:活动ID, Num:生成数量

randstr() {
	index=0
	str=""
	for i in {a..z}; do arr[index]=$i; index=`expr ${index} + 1`; done
	for i in {A..Z}; do arr[index]=$i; index=`expr ${index} + 1`; done
	for i in {0..9}; do arr[index]=$i; index=`expr ${index} + 1`; done
	for i in {1..10}; do str="$str${arr[$RANDOM%$index]}"; done
	echo $str
}

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
ORG_CDKEY_PATH="/tmp/org_cdkey_$1.txt"
echo $ORG_CDKEY_PATH
RESULT_CDKEY_PATH=$IPATH/../shell/result_cdkey.txt
touch $RESULT_CDKEY_PATH #新生成文件
#先把数据库中的激活码导出来
#mysqldump -usmcs -h127.0.0.1 -psmcsdb smcs tblCDKey > $ORG_CDKEY_PATH
#先把数据库中的激活码导出来
mysql -u smcs -h 127.0.0.1 -psmcsdb -e "
tee /tmp/temp.log
use "smcs";
select CDKey from tblCDKey into outfile '$ORG_CDKEY_PATH';
quit"
#生成激活码
i=1
while [[ $i -le $2 ]]; do
	CDKEY=$(randstr)
	#CDKEY="YRoxsykRVY"
	#echo $CDKEY
	if ! grep -q "$CDKEY" $ORG_CDKEY_PATH  && ! grep -q "$CDKEY" $RESULT_CDKEY_PATH; then
		echo $CDKEY >> $RESULT_CDKEY_PATH  #放入文件中
		((i=$i+1))  #计数加1
	fi
done
#拼接sql语句
sql="insert into smcs.tblCDKey(CDKey,ActivityID)values"
num=0
while read line; do
	#echo $line
	sql="$sql('$line','$1'),"
	((num=$num+1))
	if [[ $num -gt 100 ]]; then
		sql=`echo ${sql%,*}`
		mysql -u smcs -h 127.0.0.1 -psmcsdb -e "
		tee /tmp/temp.log
		use smcs;
		$sql;
		quit"
		#重置sql和num值
		sql="insert into smcs.tblCDKey(CDKey,ActivityID)values"
		num=0
	fi
done < $RESULT_CDKEY_PATH
#其他的也照样执行
sql=`echo ${sql%,*}`
#echo $sql
mysql -u smcs -h 127.0.0.1 -psmcsdb -e "
tee /tmp/temp.log
use smcs;
$sql;
quit"
#rm $ORG_CDKEY_PATH
rm $RESULT_CDKEY_PATH
echo "done"



