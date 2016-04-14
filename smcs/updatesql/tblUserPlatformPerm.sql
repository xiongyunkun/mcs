-- MySQL dump 10.13  Distrib 5.5.27, for Linux (x86_64)
--
-- Host: localhost    Database: smcs
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
-- Table structure for table `tblUserPlatformPerm`
--

DROP TABLE IF EXISTS `tblUserPlatformPerm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserPlatformPerm` (
  `UserID` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `PlatfromID` varchar(16) NOT NULL DEFAULT '' COMMENT '平台ID',
  `Flag` varchar(8) NOT NULL DEFAULT 'true' COMMENT '标志位',
  PRIMARY KEY (`UserID`,`PlatfromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户平台权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUserPlatformPerm`
--

LOCK TABLES `tblUserPlatformPerm` WRITE;
/*!40000 ALTER TABLE `tblUserPlatformPerm` DISABLE KEYS */;
INSERT INTO `tblUserPlatformPerm` VALUES (10,'37','true');
INSERT INTO `tblUserPlatformPerm` VALUES (10,'4399','true');
INSERT INTO `tblUserPlatformPerm` VALUES (10,'dw','true');
INSERT INTO `tblUserPlatformPerm` VALUES (10,'test','true');
INSERT INTO `tblUserPlatformPerm` VALUES (29,'37','true');
INSERT INTO `tblUserPlatformPerm` VALUES (29,'4399','true');
INSERT INTO `tblUserPlatformPerm` VALUES (29,'dw','true');
INSERT INTO `tblUserPlatformPerm` VALUES (29,'test','true');
INSERT INTO `tblUserPlatformPerm` VALUES (30,'test','true');
INSERT INTO `tblUserPlatformPerm` VALUES (33,'37','true');
INSERT INTO `tblUserPlatformPerm` VALUES (33,'4399','true');
INSERT INTO `tblUserPlatformPerm` VALUES (33,'dw','true');
INSERT INTO `tblUserPlatformPerm` VALUES (33,'test','true');
INSERT INTO `tblUserPlatformPerm` VALUES (35,'test','true');
INSERT INTO `tblUserPlatformPerm` VALUES (36,'dw','false');
INSERT INTO `tblUserPlatformPerm` VALUES (36,'test','true');
INSERT INTO `tblUserPlatformPerm` VALUES (37,'test','true');
INSERT INTO `tblUserPlatformPerm` VALUES (38,'test','true');
/*!40000 ALTER TABLE `tblUserPlatformPerm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smcs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-08 19:33:06
