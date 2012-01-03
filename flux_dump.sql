/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2012-01-04 00:56:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `idAccount` bigint(20) NOT NULL AUTO_INCREMENT,
  `idBank` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `idCurrency` int(11) NOT NULL,
  PRIMARY KEY (`idAccount`,`idCurrency`),
  UNIQUE KEY `idAccount_UNIQUE` (`idAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `idCurrency` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fullName` varchar(45) NOT NULL DEFAULT '""',
  PRIMARY KEY (`idCurrency`),
  UNIQUE KEY `idCurrency_UNIQUE` (`idCurrency`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `fullName_UNIQUE` (`fullName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of currency
-- ----------------------------

-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(45) NOT NULL,
  PRIMARY KEY (`idStatus`),
  UNIQUE KEY `idStatus_UNIQUE` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of status
-- ----------------------------

-- ----------------------------
-- Table structure for `transaction`
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `idTransaction` bigint(20) NOT NULL AUTO_INCREMENT,
  `idAccountFrom` bigint(20) NOT NULL,
  `idAccountTo` bigint(20) NOT NULL,
  `dateStart` datetime NOT NULL,
  `dateEnd` datetime NOT NULL,
  `idStatus` int(11) NOT NULL,
  `idAccount` bigint(20) NOT NULL,
  `idCurrency` int(11) NOT NULL,
  `Status_idStatus` int(11) NOT NULL,
  PRIMARY KEY (`idTransaction`),
  UNIQUE KEY `idTransaction_UNIQUE` (`idTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `idUser` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `keyBank` bigint(20) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
