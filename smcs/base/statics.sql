-- MySQL dump 10.13  Distrib 5.5.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: 360_statics
-- ------------------------------------------------------
-- Server version	5.5.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblAddPlayer`
--

DROP TABLE IF EXISTS `tblAddPlayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblAddPlayer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `RegNum` int(11) DEFAULT '0' COMMENT '注册人数',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Male` int(11) DEFAULT '0' COMMENT '男性人数',
  `Female` int(11) DEFAULT '0' COMMENT '女性人数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实时注册统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblFigtingRank`
--

DROP TABLE IF EXISTS `tblFigtingRank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblFigtingRank` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '角色名',
  `Fighting` int(11) NOT NULL DEFAULT '0' COMMENT '战斗力',
  `VipLevel` int(11) DEFAULT '0' COMMENT 'VIP等级',
  PRIMARY KEY (`PlatformID`,`HostID`,`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='战斗力排行榜表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblGold`
--

DROP TABLE IF EXISTS `tblGold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblGold` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `Channel` varchar(64) NOT NULL DEFAULT '' COMMENT '渠道',
  `GoldType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '钻石类型,1:gold,2:creditgold',
  `StaticsType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '统计类型,1:消耗,2:产出',
  `Value` int(11) NOT NULL DEFAULT '0' COMMENT '钻石值',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Uids` varchar(20000) DEFAULT '' COMMENT 'uid列表',
  `ConsumeNum` int(11) DEFAULT '0' COMMENT '消费次数',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`Channel`,`GoldType`,`StaticsType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钻石统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblHistoryOnline`
--

DROP TABLE IF EXISTS `tblHistoryOnline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblHistoryOnline` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `MaxOnline` int(11) NOT NULL DEFAULT '0' COMMENT '最高在线人数',
  `AveOnline` int(11) NOT NULL DEFAULT '0' COMMENT '平均在线人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `MinOnline` int(11) NOT NULL DEFAULT '0' COMMENT '最低在线人数',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史在线统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblHistoryReg`
--

DROP TABLE IF EXISTS `tblHistoryReg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblHistoryReg` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `RegNum` int(11) NOT NULL DEFAULT '0' COMMENT '当日注册人数',
  `Male` int(11) NOT NULL DEFAULT '0' COMMENT '男角色注册人数',
  `Female` int(11) NOT NULL DEFAULT '0' COMMENT '女角色注册人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `TotalRegNum` int(11) NOT NULL DEFAULT '0' COMMENT '总注册人数，开服到现在',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史注册统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblInstanceStatics`
--

DROP TABLE IF EXISTS `tblInstanceStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblInstanceStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `InstanceType` int(11) NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `PlayNum` int(11) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `UidNum` int(11) NOT NULL DEFAULT '0' COMMENT '参与人次',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`InstanceType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='副本统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblLevelStatics`
--

DROP TABLE IF EXISTS `tblLevelStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblLevelStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Level` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `TotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '总人数',
  `TotalLostNum` int(11) NOT NULL DEFAULT '0' COMMENT '流失人数',
  `LivelNum` int(11) NOT NULL DEFAULT '0' COMMENT '活跃用户数',
  `LiveLostNum` int(11) NOT NULL DEFAULT '0' COMMENT '活跃用户流失数',
  `PayNum` int(11) NOT NULL DEFAULT '0' COMMENT '付费用户数',
  `PayLostNum` int(11) NOT NULL DEFAULT '0' COMMENT '付费用户流失数',
  `PayLivelNum` int(11) NOT NULL DEFAULT '0' COMMENT '付费活跃用户数',
  `PayLiveLostNum` int(11) NOT NULL DEFAULT '0' COMMENT '付费活跃用户流失数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`Level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家等级统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblLoginStatics`
--

DROP TABLE IF EXISTS `tblLoginStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblLoginStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Hour` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小时',
  `Step` int(11) NOT NULL DEFAULT '0' COMMENT '统计指标ID',
  `Num` int(11) NOT NULL DEFAULT '0' COMMENT '统计值',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`Hour`,`Step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆流程统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblMountLevel`
--

DROP TABLE IF EXISTS `tblMountLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblMountLevel` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `RegTime` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01' COMMENT '玩家注册',
  `LoginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上一次登陆时间',
  `UpdateTime` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01' COMMENT '上一次更新时间',
  `MountID` int(11) NOT NULL DEFAULT '1' COMMENT '坐骑ID',
  `EvoLevel` int(11) NOT NULL DEFAULT '1' COMMENT '等阶',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Level` int(11) NOT NULL DEFAULT '1' COMMENT '星级',
  PRIMARY KEY (`Uid`),
  KEY `index1` (`UpdateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='坐骑等阶表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblOnline`
--

DROP TABLE IF EXISTS `tblOnline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOnline` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '跨服配置ID',
  `OnlineNum` int(11) DEFAULT '0' COMMENT '在线人数',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  PRIMARY KEY (`HostID`,`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线人数统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblOnlineTime`
--

DROP TABLE IF EXISTS `tblOnlineTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOnlineTime` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `Time0` int(11) NOT NULL DEFAULT '0' COMMENT '{0,1}',
  `Time5` int(11) NOT NULL DEFAULT '0' COMMENT '{5, 10}',
  `Time10` int(11) NOT NULL DEFAULT '0' COMMENT '{10, 15}',
  `Time15` int(11) NOT NULL DEFAULT '0' COMMENT '{15, 30}',
  `Time30` int(11) NOT NULL DEFAULT '0' COMMENT '{30, 45}',
  `Time45` int(11) NOT NULL DEFAULT '0' COMMENT '{45, 60}',
  `Time60` int(11) NOT NULL DEFAULT '0' COMMENT '{60, 90}',
  `Time90` int(11) NOT NULL DEFAULT '0' COMMENT '{90, 120}',
  `Time120` int(11) NOT NULL DEFAULT '0' COMMENT '{120, 150}',
  `Time150` int(11) NOT NULL DEFAULT '0' COMMENT '{150, 180}',
  `Time180` int(11) NOT NULL DEFAULT '0' COMMENT '{180, 240}',
  `Time240` int(11) NOT NULL DEFAULT '0' COMMENT '{240, 300}',
  `Time300` int(11) NOT NULL DEFAULT '0' COMMENT '{300, 360}',
  `Time360` int(11) NOT NULL DEFAULT '0' COMMENT '{360, 420}',
  `Time420` int(11) NOT NULL DEFAULT '0' COMMENT '{420,600}',
  `TotalTimes` int(11) NOT NULL DEFAULT '0' COMMENT '总在线时间',
  `TotalPlayers` int(11) NOT NULL DEFAULT '0' COMMENT '总人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Time1` int(11) NOT NULL DEFAULT '0' COMMENT '{1, 5}',
  `Time600` int(11) NOT NULL DEFAULT '0' COMMENT '{600, 900}',
  `Time900` int(11) NOT NULL DEFAULT '0' COMMENT '{900, 1200}',
  `Time1200` int(11) NOT NULL DEFAULT '0' COMMENT '{1200}',
  `UserType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:老用户,2:新用户',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`UserType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家在线时长统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPayActualTime`
--

DROP TABLE IF EXISTS `tblPayActualTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayActualTime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `PayCashNum` int(11) DEFAULT '0' COMMENT '充值金额',
  `PayUserNum` int(11) DEFAULT '0' COMMENT '充值人数',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实时充值统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPayDayFrequencyStatics`
--

DROP TABLE IF EXISTS `tblPayDayFrequencyStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayDayFrequencyStatics` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `PayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值人数',
  `Pay1Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值1次人数',
  `Pay2Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值2次人数',
  `Pay3Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值3次人数',
  `Pay4Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值4次人数',
  `Pay5Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值5次人数',
  `Pay6Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值6-10次人数',
  `Pay11Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值11-20次人数',
  `Pay20Num` int(11) NOT NULL DEFAULT '0' COMMENT '充值20次以上人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日充值频率统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPayDayStatics`
--

DROP TABLE IF EXISTS `tblPayDayStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayDayStatics` (
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `CashNum` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `PayGold` int(11) NOT NULL DEFAULT '0' COMMENT '充值钻石数量',
  `PayNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值次数',
  `PayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值人数',
  `FirstPayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '首冲人数',
  `GoldConsume` int(11) NOT NULL DEFAULT '0' COMMENT '非绑钻钻石消耗数',
  `GoldProduce` int(11) NOT NULL DEFAULT '0' COMMENT '非绑钻钻石产出数',
  `TotalCashNum` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '总充值金额',
  `TotalPayGold` bigint(20) NOT NULL DEFAULT '0' COMMENT '总充值钻石',
  `TotalGoldProduce` bigint(20) NOT NULL DEFAULT '0' COMMENT '总非绑钻钻石产出数',
  `TotalGoldConsume` bigint(20) NOT NULL DEFAULT '0' COMMENT '总非绑钻钻石消耗数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `TotalCreditGoldProduce` bigint(20) NOT NULL DEFAULT '0' COMMENT '总绑钻钻石产出数',
  `TotalCreditGoldConsume` bigint(20) NOT NULL DEFAULT '0' COMMENT '总绑钻钻石消耗数',
  `CreditGoldProduce` int(11) NOT NULL DEFAULT '0' COMMENT '绑钻钻石产出数',
  `CreditGoldConsume` int(11) NOT NULL DEFAULT '0' COMMENT '绑钻钻石消耗数',
  PRIMARY KEY (`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日充值统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPayOrder`
--

DROP TABLE IF EXISTS `tblPayOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayOrder` (
  `OrderID` varchar(32) NOT NULL DEFAULT '' COMMENT '订单ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `Level` int(11) NOT NULL DEFAULT '1' COMMENT '玩家等级',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `CashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '货币数量',
  `PayChannel` varchar(32) NOT NULL DEFAULT '' COMMENT '充值渠道',
  `Gold` int(11) NOT NULL DEFAULT '0' COMMENT '钻石数量',
  `Time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '充值时间',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '充值状态，-1:充值失败,0:已发送充值请求,1:已充值',
  `LastUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近更新时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`OrderID`),
  KEY `index1` (`Urs`),
  KEY `index2` (`Uid`),
  KEY `index3` (`LastUpdateTime`),
  KEY `index4` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPayRetention`
--

DROP TABLE IF EXISTS `tblPayRetention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayRetention` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `FirstPayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '当日首充人数',
  `LoginNum` int(11) DEFAULT '0' COMMENT '当日登陆人数',
  `1Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '次日留存',
  `2Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '2日留存',
  `3Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '3日留存',
  `4Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '4日留存',
  `5Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '5日留存',
  `6Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '6日留存',
  `7Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '7日留存',
  `10Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '10日留存',
  `15Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '15日留存',
  `30Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '30日留存',
  `13Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '13日留存',
  `29Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '29日留存',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付费留存率统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPayZone`
--

DROP TABLE IF EXISTS `tblPayZone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayZone` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `ZoneID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `PayUserNum` int(11) NOT NULL DEFAULT '0' COMMENT '充值人数',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`ZoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值区间人数统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPlayWayStatics`
--

DROP TABLE IF EXISTS `tblPlayWayStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPlayWayStatics` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `StaticsIndex` varchar(32) NOT NULL DEFAULT '' COMMENT '统计指标',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `Level` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `DayOnline` int(11) NOT NULL DEFAULT '0' COMMENT '近*天活跃',
  `NotDayReg` int(11) NOT NULL DEFAULT '0' COMMENT '非近*天注册',
  `PlayerNum` int(11) NOT NULL DEFAULT '0' COMMENT '人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `ChildLevel` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  PRIMARY KEY (`PlatformID`,`HostID`,`StaticsIndex`,`Date`,`Level`,`ChildLevel`,`DayOnline`,`NotDayReg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩法统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblRetention`
--

DROP TABLE IF EXISTS `tblRetention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblRetention` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `NewNum` int(11) NOT NULL DEFAULT '0' COMMENT '当然新增',
  `1Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '次日留存',
  `2Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '2日留存',
  `3Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '3日留存',
  `4Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '4日留存',
  `5Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '5日留存',
  `6Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '6日留存',
  `7Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '7日留存',
  `10Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '10日留存',
  `15Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '15日留存',
  `30Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '30日留存',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `LoginNum` int(11) DEFAULT '0' COMMENT '当日登陆人数',
  `13Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '13日留存',
  `29Days` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '29日留存',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留存率统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblUserInfo`
--

DROP TABLE IF EXISTS `tblUserInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserInfo` (
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家账号ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Urs` varchar(64) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(64) NOT NULL DEFAULT '' COMMENT '角色名',
  `LastLoginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上一次登陆时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  `Level` int(11) NOT NULL DEFAULT '1' COMMENT '玩家等级',
  `RegTime` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01' COMMENT '注册时间',
  `Sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `LastLogoutTime` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `SceneUid` int(11) NOT NULL DEFAULT '0' COMMENT '场景ID',
  `OnlineFlag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '在线标志，1：在线，0：不在线',
  `TotalOnlineTime` int(11) NOT NULL DEFAULT '0' COMMENT '总在线时间',
  `Fighting` int(11) NOT NULL DEFAULT '0' COMMENT '战斗力',
  `Gold` int(11) NOT NULL DEFAULT '0' COMMENT '非绑钻钻石数',
  `TotalGold` int(11) NOT NULL DEFAULT '0' COMMENT '总钻石数（绑钻+非绑钻）',
  `Money` int(11) NOT NULL DEFAULT '0' COMMENT '总金币数',
  `LastUpdateTime` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `VipLevel` tinyint(4) DEFAULT '0' COMMENT 'VIP等级',
  `IsVip` tinyint(4) DEFAULT '0' COMMENT '是否VIP，1：是，0：否',
  PRIMARY KEY (`Uid`),
  KEY `index1` (`Urs`),
  KEY `index2` (`Name`),
  KEY `index4` (`LastUpdateTime`),
  KEY `index3` (`HostID`,`RegTime`),
  KEY `index5` (`HostID`,`Level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblUserPayDayStatics`
--

DROP TABLE IF EXISTS `tblUserPayDayStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserPayDayStatics` (
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '充值日期',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `TotalCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '总充值金额',
  `TotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '总充值次数',
  `TotalGold` int(11) NOT NULL DEFAULT '0' COMMENT '总钻石数量',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`Uid`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家日充值统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblUserPayStatics`
--

DROP TABLE IF EXISTS `tblUserPayStatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserPayStatics` (
  `Uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `Urs` varchar(32) NOT NULL DEFAULT '' COMMENT '平台账号',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Currency` varchar(16) NOT NULL DEFAULT '' COMMENT '货币类型',
  `TotalCashNum` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总充值金额',
  `TotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '总充值次数',
  `TotalGold` int(11) NOT NULL DEFAULT '0' COMMENT '总钻石数量',
  `MinCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '单次最小充值金额',
  `MaxCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '单次最大充值金额',
  `FirstCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '首充充值金额',
  `FirstCashTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首充时间',
  `LastCashNum` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '最后充值金额',
  `LastCashTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后充值时间',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`Uid`),
  KEY `index1` (`Urs`),
  KEY `index3` (`HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家充值统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblVIP`
--

DROP TABLE IF EXISTS `tblVIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblVIP` (
  `PlatformID` varchar(32) NOT NULL DEFAULT '' COMMENT '平台ID',
  `HostID` int(11) NOT NULL DEFAULT '0' COMMENT '服ID',
  `Date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `VipLevel` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'VIP等级',
  `VipNum` int(11) NOT NULL DEFAULT '0' COMMENT 'VIP人数',
  `NowVipNum` int(11) NOT NULL DEFAULT '0' COMMENT '当前Vip人数',
  `LostNum` int(11) NOT NULL DEFAULT '0' COMMENT '同级VIP流失人数',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`PlatformID`,`HostID`,`Date`,`VipLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='VIP统计表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-05 11:33:06
