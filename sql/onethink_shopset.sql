/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : onethink

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-12-17 01:59:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_shopset`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_shopset`;
CREATE TABLE `onethink_shopset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sname` char(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '可用状态',
  `vname0` char(64) DEFAULT '' COMMENT 'KEY0名称',
  `vval0` char(64) DEFAULT '' COMMENT 'KEY0值',
  `vname1` char(64) DEFAULT '' COMMENT 'KEY1名称',
  `vval1` char(64) DEFAULT '' COMMENT 'KEY1值',
  `vname2` char(64) DEFAULT '' COMMENT 'KEY2名称',
  `vval2` char(64) DEFAULT '' COMMENT 'KEY2值',
  `vname3` char(64) DEFAULT '' COMMENT 'KEY3名称',
  `vval3` char(64) DEFAULT '' COMMENT 'KEY3值',
  `vname4` char(64) DEFAULT '' COMMENT 'KEY4名称',
  `vval4` char(64) DEFAULT '' COMMENT 'KEY4值',
  `vname5` char(64) DEFAULT '' COMMENT 'KEY5名称',
  `vval5` char(64) DEFAULT '' COMMENT 'KEY5值',
  `vname6` char(64) DEFAULT '' COMMENT 'KEY6名称',
  `vval6` char(64) DEFAULT '' COMMENT 'KEY6值',
  `vname7` char(64) DEFAULT '' COMMENT 'KEY7名称',
  `vval7` char(64) DEFAULT '' COMMENT 'KEY7值',
  `vname8` char(64) DEFAULT '' COMMENT 'KEY8名称',
  `vval8` char(64) DEFAULT '' COMMENT 'KEY8值',
  `vname9` char(64) DEFAULT '' COMMENT 'KEY9名称',
  `vval9` char(64) DEFAULT '' COMMENT 'KEY9值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_sname` (`sname`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='商城appkey设置\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- ----------------------------
-- Records of onethink_shopset
-- ----------------------------
INSERT INTO `onethink_shopset` VALUES ('26', '亿起发', '1', 'appkey', '138655627865015183', 'appsecret', '6652180706dd0f96559d4204970392b6', 'uname', '138655627865015183', 'secret', '6652180706dd0f96559d4204970392b6', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_shopset` VALUES ('27', '拍拍', '1', 'uin', '545038947', 'userId', '55006', 'appOAuthID', '700155269', 'secretOAuthKey', '123123123123123', 'accessToken', 'c4b9f95298ee19e2f36d93086a3b1751', 'defaultKey', '手机', 'goodsnum', '20', 'order', '1', 'cacheTime', '2', 'errLog', '0');
