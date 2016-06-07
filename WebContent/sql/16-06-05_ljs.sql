锘�# Host: localhost  (Version: 5.1.49-community)
# Date: 2016-06-05 20:25:37
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "goods_type"
#

DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `SORT_PRIORITY` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "goods_type"
#


#
# Structure for table "replenish"
#

DROP TABLE IF EXISTS `replenish`;
CREATE TABLE `replenish` (
  `ID` varchar(32) DEFAULT NULL,
  `SN` varchar(20) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `TOTAL_MONEY` double DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "replenish"
#


#
# Structure for table "replenish_b"
#

DROP TABLE IF EXISTS `replenish_b`;
CREATE TABLE `replenish_b` (
  `ID` varchar(32) DEFAULT NULL,
  `REPLENISH_ID` varchar(32) DEFAULT NULL,
  `GOODS_ID` varchar(32) DEFAULT NULL,
  `NUM` varchar(11) DEFAULT NULL,
  `GOODS_MONEY` double DEFAULT NULL,
  `SUPPLIER_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "replenish_b"
#


#
# Structure for table "role"
#

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PERMISSION` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "role"
#


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` varchar(32) NOT NULL,
  `ACCOUNT` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `NAME` varchar(10) DEFAULT NULL,
  `ID_CARD` varchar(20) DEFAULT NULL,
  `SEX` varchar(3) DEFAULT NULL,
  `AGE` varchar(3) DEFAULT NULL,
  `PHONE` varchar(12) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

