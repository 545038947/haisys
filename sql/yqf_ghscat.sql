-- Table structure for `jgjsys_yqf_ghscat`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_ghscat`;
CREATE TABLE `jgjsys_yqf_ghscat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ghs_catid` char(64) NOT NULL DEFAULT '' COMMENT '购划算商品所属的类目ID',
  `ghs_cname` char(64) NOT NULL DEFAULT '' COMMENT '购划算商品所属类目名称',
  `sort_order` char(64) NOT NULL DEFAULT '' COMMENT '排序序号，表示同级类目的展现次序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_ghs_catid` (`ghs_catid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='购划算的商品分类信息\r\n@author   和蔼的木Q\r\n@version  2013-12-07';
