-- Table structure for `jgjsys_yqf_hotweb`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_hotweb`;
CREATE TABLE `jgjsys_yqf_hotweb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `web_id` char(64) NOT NULL DEFAULT '' COMMENT '特卖网站ID',
  `web_name` char(64) NOT NULL DEFAULT '' COMMENT '特卖网站名称',
  `web_o_url` char(64) NOT NULL DEFAULT '' COMMENT '特卖活动网站的计费URL',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_hot_webid` (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='特卖活动的商家网站信息\r\n@author   和蔼的木Q\r\n@version  2013-12-07';
