IPATH=$(cd "$(dirname "$0")"; pwd)
cd "$IPATH/../game_logs"
LOGFILE="game_erro.log$1"
vim $LOGFILE
