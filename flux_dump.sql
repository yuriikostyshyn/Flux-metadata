/*
Navicat MySQL Data Transfer

Source Server         : flux
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : flux

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2012-07-01 23:41:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `security_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `account_ibfk_1` (`user_id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '1', '1', '12133');

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `long_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('1', 'UAH', 'Ukrainian hryvnia');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `surname` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `security_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'flux@flux.com', 'Flux1', 'Flux', 'Flux', '0');
INSERT INTO `user` VALUES ('2', 'yuriywert@gmail.com', 'password', 'Yurii', 'Kostyshyn', '1341342332e23242');
