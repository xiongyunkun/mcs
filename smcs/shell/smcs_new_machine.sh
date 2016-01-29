ENDSTR="progress done"
CURPATH=`pwd`
OUTFILE=$CURPATH/new_machine_ret
PUBLISHER=/home/wgame/publisher
if [ ! -d $PUBLISHER ]; then
	echo "no publisher found" > $OUTFILE
	echo $ENDSTR >> $OUTFILE
	exit
fi

if [ ! -f $PUBLISHER/new_machine.sh ]; then
	echo "no new machine shell found" > $OUTFILE
	echo $ENDSTR >> $OUTFILE
	exit
fi

cd $PUBLISHER
./new_machine.sh -f $1 > $OUTFILE 2>&1
echo $ENDSTR >> $OUTFILE
