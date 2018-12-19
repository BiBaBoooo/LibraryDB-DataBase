/*
Navicat MySQL Data Transfer

Source Server         : qwer
Source Server Version : 50722
Source Host           : 127.0.0.1:3306
Source Database       : librarydb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-18 21:31:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `barcode` varchar(10) NOT NULL,
  `userid` varchar(10) NOT NULL,
  `borrowdate` date DEFAULT NULL,
  `backdate` date DEFAULT NULL,
  PRIMARY KEY (`barcode`,`userid`),
  KEY `FK_borrow2` (`userid`),
  CONSTRAINT `FK_borrow` FOREIGN KEY (`barcode`) REFERENCES `specificbook` (`barcode`),
  CONSTRAINT `FK_borrow2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `barcode` varchar(10) NOT NULL,
  `userid` varchar(10) NOT NULL,
  `collectdate` date DEFAULT NULL,
  PRIMARY KEY (`barcode`,`userid`),
  KEY `FK_collect2` (`userid`),
  CONSTRAINT `FK_collect` FOREIGN KEY (`barcode`) REFERENCES `specificbook` (`barcode`),
  CONSTRAINT `FK_collect2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for kindbook
-- ----------------------------
DROP TABLE IF EXISTS `kindbook`;
CREATE TABLE `kindbook` (
  `callnumer` varchar(10) NOT NULL,
  `bookname` varchar(15) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`callnumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kindbook
-- ----------------------------
INSERT INTO `kindbook` VALUES ('001', 'java程序设计', '李刚', '1');
INSERT INTO `kindbook` VALUES ('002', '数据库原理及应用教程', '陈志泊', '2');
INSERT INTO `kindbook` VALUES ('003', '计算机网络', '吴功宜', '3');
INSERT INTO `kindbook` VALUES ('004', '数据结构', '严蔚敏', '4');
INSERT INTO `kindbook` VALUES ('005', '软件工程导论', '张海藩', '3');

-- ----------------------------
-- Table structure for specificbook
-- ----------------------------
DROP TABLE IF EXISTS `specificbook`;
CREATE TABLE `specificbook` (
  `barcode` varchar(10) NOT NULL,
  `callnumer` varchar(10) NOT NULL,
  `buydate` date DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  PRIMARY KEY (`barcode`),
  KEY `FK_包含` (`callnumer`),
  CONSTRAINT `FK_包含` FOREIGN KEY (`callnumer`) REFERENCES `kindbook` (`callnumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specificbook
-- ----------------------------
INSERT INTO `specificbook` VALUES ('A001', '001', '2018-12-01', '303-1', '未借');
INSERT INTO `specificbook` VALUES ('B001', '002', '2018-12-06', '303-2', '未借');
INSERT INTO `specificbook` VALUES ('B002', '002', '2018-11-29', '303-2', '未借');
INSERT INTO `specificbook` VALUES ('C001', '003', '2018-12-05', '303-3', '未借');
INSERT INTO `specificbook` VALUES ('C002', '003', '2018-12-02', '303-3', '未借');
INSERT INTO `specificbook` VALUES ('C003', '003', '2018-12-12', '303-3', '未借');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `maxborrow` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('001', '123', '20');
INSERT INTO `user` VALUES ('002', '123', '20');
INSERT INTO `user` VALUES ('003', '123', '20');
INSERT INTO `user` VALUES ('admin', '123', null);