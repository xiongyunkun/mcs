DROP TABLE IF EXISTS groups;

CREATE TABLE IF NOT EXISTS groups (
	id int(8) AUTO_INCREMENT KEY,
	name varchar(20)
) CHARACTER SET utf8;

INSERT INTO groups SET name="管理员";
INSERT INTO groups SET name="策划";
INSERT INTO groups SET name="客户端程序";
INSERT INTO groups SET name="服务器程序";

CREATE TABLE IF NOT EXISTS users (
	id int(8) AUTO_INCREMENT KEY,
	account varchar(20) UNIQUE,
	name varchar(10),
	mail varchar(30),
	rtx varchar(10),
	mobile varchar(11),
	qq varchar(15),
	password varchar(32),
	INDEX (account)
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS groupinfo (
	userid int(8),
	groupid int(8),
	INDEX (userid, groupid)
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS modules (
	name varchar(20) PRIMARY KEY,
	uri varchar(255), 
	module varchar(255),
	procfunc varchar(30),
	parent varchar(20),
	isshow varchar(10),
	descinfo varchar(120)
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS permission (
	groupid int(8),
	module varchar(20),
	INDEX (groupid)
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS servers (
	hostid int(8) PRIMARY KEY,
	name varchar(20),
	address varchar(20),
	ports varchar(32),
	version int(8),
	status varchar(10) default 0,
	servmark varchar(10),
	descinfo varchar(120)
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS servergroup (
	id int(8) AUTO_INCREMENT KEY,
	name varchar(20),
	weight int(8),
	flag int(8)
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS srvgroupinfo (
	serverid int(8),
	groupid int(8),
	weight int(8),
	INDEX (serverid, groupid)
) CHARACTER SET utf8;

-- 区分类表
CREATE TABLE IF NOT EXISTS groupclass (
	id int(8) AUTO_INCREMENT KEY,
	name varchar(20) comment '分类名字',
	descinfo varchar(120) comment '分类说明'
) CHARACTER SET utf8;

-- 区与区分类关系表
CREATE TABLE IF NOT EXISTS groupclassinfo (
	classid int(8) comment '分类ID',
	groupid int(8) comment '分区ID',
	INDEX (classid, groupid)
) CHARACTER SET utf8;

