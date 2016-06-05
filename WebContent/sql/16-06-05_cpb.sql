# Host: localhost  (Version: 5.1.49-community)
# Date: 2016-06-05 17:26:08
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "supplier"
#

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `LINKMAN` varchar(20) DEFAULT NULL,
  `MAIL` varchar(20) DEFAULT NULL,
  `PHONE` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "supplier"
#

INSERT INTO `supplier` VALUES ('830e4d34fa354ed89a4504e129f89a99','三国','批','8479847@qq.com','13519005636'),('9e858d5683e84caf9c76ce502d117363','陈培斌','陈晓','361833127@qq.com','18319005634');
