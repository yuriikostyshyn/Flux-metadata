/*
Navicat MySQL Data Transfer

Source Server         : flux
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : flux-bank

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2012-07-01 23:40:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `bank_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `security_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '1', '12133');

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
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL DEFAULT '0',
  `status_message` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of status
-- ----------------------------

-- ----------------------------
-- Table structure for `transaction`
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `transaction_id` bigint(20) NOT NULL DEFAULT '0',
  `account_id_from` bigint(20) DEFAULT NULL,
  `account_id_to` bigint(20) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `amount` double(20,0) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id_from` (`account_id_from`),
  KEY `account_id_to` (`account_id_to`),
  KEY `status_id` (`status_id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_id_from`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`account_id_to`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transaction
-- ----------------------------
