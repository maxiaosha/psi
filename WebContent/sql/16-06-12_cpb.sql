# Host: localhost  (Version: 5.1.49-community)
# Date: 2016-06-12 16:50:05
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` varchar(32) NOT NULL,
  `ACCOUNT` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
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

