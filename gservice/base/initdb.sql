DROP TABLE IF EXISTS roleinfo;

CREATE TABLE IF NOT EXISTS roleinfo (
	account varchar(255),
	name varchar(32),
	hostid int(8),
	userid int(64),
	lasttime TIMESTAMP,
	isdel  int(1),
	INDEX (account),
	primary key(hostid,userid)
) CHARACTER SET gbk;

