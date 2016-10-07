CREATE DATABASE  IF NOT EXISTS `noida` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `noida`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: noida
-- ------------------------------------------------------
-- Server version 5.7.15

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
-- Table structure for table `amc`
--

DROP TABLE IF EXISTS `amc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amc` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `po`
--

DROP TABLE IF EXISTS `po`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPANY` varchar(100) NOT NULL,
  `PO_DATE` datetime NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_main_type`
--

DROP TABLE IF EXISTS `asset_main_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_main_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAIN_TYPE` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MAIN_TYPE_UNIQUE` (`MAIN_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_sub_type`
--

DROP TABLE IF EXISTS `asset_sub_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_sub_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAIN_TYPE_ID` int(11) NOT NULL,
  `SUB_TYPE` varchar(45) NOT NULL,
  `MAKE` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MAIN_TYPE_ID_FK_idx` (`MAIN_TYPE_ID`),
  CONSTRAINT `MAIN_TYPE_ID_FK` FOREIGN KEY (`MAIN_TYPE_ID`) REFERENCES `asset_main_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(512) NOT NULL,
  `ENABLED` tinyint(4) NOT NULL DEFAULT '1',
  `FIRST_NAME` varchar(45) NOT NULL,
  `LAST_NAME` varchar(45) DEFAULT NULL,
  `DEPT_ID` int(11) NOT NULL,
  `EMP_CODE` varchar(45) NOT NULL,
  `CONTACT_NO` varchar(45) DEFAULT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`USERNAME`),
  UNIQUE KEY `EMP_CODE_UNIQUE` (`EMP_CODE`),
  KEY `DEPT_ID_idx` (`DEPT_ID`),
  CONSTRAINT `DEPT_ID_FK` FOREIGN KEY (`DEPT_ID`) REFERENCES `department` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `USER_ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `ROLE` varchar(45) NOT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  UNIQUE KEY `uni_username_role` (`ROLE`,`USERNAME`),
  KEY `fk_username_idx` (`USERNAME`),
  CONSTRAINT `USER_NAME_FK` FOREIGN KEY (`USERNAME`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_detail`
--

DROP TABLE IF EXISTS `asset_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERIAL_NO` varchar(45) NOT NULL,
  `BARCODE` varchar(45) NOT NULL,
  `AMC_ID` int(11) NOT NULL,
  `PO_ID` int(11) NOT NULL,
  `ASSET_MAIN_TYPE_ID` int(11) NOT NULL,
  `ASSET_SUB_TYPE_ID` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SERIAL_NO_UNIQUE` (`SERIAL_NO`),
  UNIQUE KEY `BARCODE_UNIQUE` (`BARCODE`),
  KEY `AMC_ID_FK_idx` (`AMC_ID`),
  KEY `PO_ID_FK_idx` (`PO_ID`),
  KEY `ASSET_TYPE_ID_FK_idx` (`ASSET_MAIN_TYPE_ID`),
  KEY `ASSET_SUB_TYPE_ID_FK_idx` (`ASSET_SUB_TYPE_ID`),
  CONSTRAINT `AMC_ID_FK` FOREIGN KEY (`AMC_ID`) REFERENCES `amc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ASSET_MAIN_TYPE_ID_FK2` FOREIGN KEY (`ASSET_MAIN_TYPE_ID`) REFERENCES `asset_main_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ASSET_SUB_TYPE_ID_FK2` FOREIGN KEY (`ASSET_SUB_TYPE_ID`) REFERENCES `asset_sub_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PO_ID_FK` FOREIGN KEY (`PO_ID`) REFERENCES `po` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_detail`
--

DROP TABLE IF EXISTS `request_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_detail` (
  `REQUEST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_MAIN_TYPE_ID` int(11) NOT NULL,
  `ASSET_SUB_TYPE_ID` int(11) DEFAULT NULL,
  `REQUESTER` varchar(45) NOT NULL,
  `REQUEST_DATE` varchar(45) NOT NULL,
  `REQUEST_TYPE` varchar(45) NOT NULL,
  `ASSET_QUANTITY` int(2) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`REQUEST_ID`),
  KEY `ASSET_MAIN_TYPE_ID_FK_idx` (`ASSET_MAIN_TYPE_ID`),
  KEY `ASSET_SUB_TYPE_ID_FK_idx` (`ASSET_SUB_TYPE_ID`),
  KEY `REQUESTER_FK_idx` (`REQUESTER`),
  CONSTRAINT `ASSET_MAIN_TYPE_ID_FK` FOREIGN KEY (`ASSET_MAIN_TYPE_ID`) REFERENCES `asset_main_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ASSET_SUB_TYPE_ID_FK` FOREIGN KEY (`ASSET_SUB_TYPE_ID`) REFERENCES `asset_sub_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `REQUESTER_FK` FOREIGN KEY (`REQUESTER`) REFERENCES `users` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_history`
--

DROP TABLE IF EXISTS `request_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQUEST_ID` int(11) NOT NULL,
  `STATUS` varchar(45) NOT NULL,
  `BY_USER` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQUEST_ID_FK_idx` (`REQUEST_ID`),
  KEY `BY_USER_FK_idx` (`BY_USER`),
  CONSTRAINT `BY_USER_FK` FOREIGN KEY (`BY_USER`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `REQUEST_ID_FK2` FOREIGN KEY (`REQUEST_ID`) REFERENCES `request_detail` (`REQUEST_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_issue_detail`
--

DROP TABLE IF EXISTS `asset_issue_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_issue_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) NOT NULL,
  `ISSUE_TYPE` varchar(45) NOT NULL,
  `REQUEST_ID` int(11) NOT NULL,
  `ISSUE_DATE` datetime NOT NULL,
  `RETURN_DATE` datetime DEFAULT NULL,
  `ISSUED_BY` varchar(45) NOT NULL,
  `RETURNED_BY` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQUEST_ID_FK_idx` (`REQUEST_ID`),
  KEY `ISSUER_ID_FK_idx` (`ISSUED_BY`),
  KEY `RETURNED_BY_FK_idx` (`RETURNED_BY`),
  CONSTRAINT `ASSET_ID_FK` FOREIGN KEY (`ID`) REFERENCES `asset_detail` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ISSUED_BY_FK` FOREIGN KEY (`ISSUED_BY`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `REQUEST_ID_FK` FOREIGN KEY (`REQUEST_ID`) REFERENCES `request_detail` (`REQUEST_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RETURNED_BY_FK` FOREIGN KEY (`RETURNED_BY`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-01 17:14:59
INSERT INTO DEPARTMENT(NAME,DESCRIPTION) VALUES ('IT', 'IT DESC');
INSERT INTO users(username,password,enabled,FIRST_NAME,EMP_CODE,DEPT_ID) VALUES ('admin','$2a$10$cInPBbKm1DDIO0vMWW0qr.VdVRgIBrHuIcfheg7ggW2/p07EgS58O', true,'admin','admin',1);
INSERT INTO users(username,password,enabled,FIRST_NAME,EMP_CODE,DEPT_ID) VALUES ('user','$2a$10$h.4MUPdv5O.4ppeiXQhlouGAU8BSmD0ma7roXbcnHkcKRoH1EQGsy', true, 'user','user',1);
INSERT INTO users(username,password,enabled,FIRST_NAME,EMP_CODE,DEPT_ID) VALUES ('approver','$2a$10$QNTbNytQiYFap9mDY9Q2SOFjLLHMrf3fXNny3/crGszvJjI9FOoZW', true, 'approver','approver',1);
INSERT INTO users(username,password,enabled,FIRST_NAME,EMP_CODE,DEPT_ID) VALUES ('issuer','$2a$10$OqcAYAJ79i.XWUf9oKn0FOw/zlYdHFQW4MOB912CczuClOcb23cAG', true,'issuer','issuer',1);

INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('user', 'ROLE_USER');
INSERT INTO user_roles (username, role) VALUES ('ISSUER', 'ROLE_ISSUER');
INSERT INTO user_roles (username, role) VALUES ('APPROVER', 'ROLE_APPROVER');


-- Dump completed on 2016-10-06 21:40:49
