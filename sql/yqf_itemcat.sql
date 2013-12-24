-- Table structure for `onethink_yqf_itemcat`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_yqf_itemcat`;
CREATE TABLE `onethink_yqf_itemcat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `catid` char(64) NOT NULL DEFAULT '' COMMENT '商品类别ID',
  `cname` char(64) NOT NULL DEFAULT '' COMMENT '类别中文名称',
  `parent_id` char(64) NOT NULL DEFAULT '' COMMENT '该类目的父类id',
  `is_parent` char(64) NOT NULL DEFAULT ''  COMMENT '该类目是否为父类',
  `alias` char(128) NOT NULL DEFAULT '' COMMENT '类目名称的别名',
  `modified_time` char(64) NOT NULL DEFAULT '' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_itemcat_id` (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='单个商家网站的详细信息\r\n@author   和蔼的木Q\r\n@version  2013-12-07';
