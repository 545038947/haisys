-- Table structure for `onethink_yqf_itemcat`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_59m_itemcat`;
CREATE TABLE `jgjsys_59m_itemcat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` char(64) NOT NULL DEFAULT '' COMMENT '商品所属类目ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '类目名称',
  `is_parent` char(64) NOT NULL DEFAULT '' COMMENT '该类目是否为父类目(即：该类目是否还有子类目)',
  `parent_id` char(64) NOT NULL DEFAULT ''  COMMENT '父商品类目 id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态。可选值:1(启用),0(禁用)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_59itemcat_id` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品所属类目\r\n@author   和蔼的木Q\r\n@version  2013-12-07';
