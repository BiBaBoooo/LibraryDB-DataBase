/*
Navicat MySQL Data Transfer

Source Server         : qwer
Source Server Version : 50722
Source Host           : 127.0.0.1:3306
Source Database       : librarydb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-20 19:31:09
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
  `status` varchar(10) DEFAULT '已借',
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
  `callnumber` varchar(10) NOT NULL,
  `bookname` varchar(15) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '书的简介',
  `catalog` varchar(255) DEFAULT NULL COMMENT '目录',
  `publish` varchar(255) DEFAULT NULL COMMENT '出版社',
  `topic` varchar(255) DEFAULT NULL COMMENT '学科主题',
  PRIMARY KEY (`callnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kindbook
-- ----------------------------
INSERT INTO `kindbook` VALUES ('001', 'java程序设计', '李刚', '1', null, null, null, null);
INSERT INTO `kindbook` VALUES ('002', '数据库原理及应用教程', '陈志泊', '2', null, null, null, null);
INSERT INTO `kindbook` VALUES ('003', '计算机网络', '吴功宜', '3', null, null, null, null);
INSERT INTO `kindbook` VALUES ('004', '数据结构', '严蔚敏', '4', null, null, null, null);
INSERT INTO `kindbook` VALUES ('005', '软件工程导论', '张海藩', '3', null, null, null, null);

-- ----------------------------
-- Table structure for specificbook
-- ----------------------------
DROP TABLE IF EXISTS `specificbook`;
CREATE TABLE `specificbook` (
  `barcode` varchar(10) NOT NULL,
  `callnumber` varchar(10) NOT NULL,
  `buydate` date DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT '未借',
  PRIMARY KEY (`barcode`),
  KEY `FK_包含` (`callnumber`),
  CONSTRAINT `FK_包含` FOREIGN KEY (`callnumber`) REFERENCES `kindbook` (`callnumber`)
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
  `userid` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(10) NOT NULL,
  `maxborrow` int(11) DEFAULT '20',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('001', '123', '20');
INSERT INTO `user` VALUES ('002', '123', '20');
INSERT INTO `user` VALUES ('003', '123', '20');
INSERT INTO `user` VALUES ('admin', '123', null);
