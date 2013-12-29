-- Table structure for `jgjsys_autocade`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_autocade`;
CREATE TABLE `jgjsys_autocade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '配置名称',
  `ctrtmpl` char(100) NOT NULL DEFAULT '' COMMENT '控制器模板路径',
  `modeltmpl` char(100) NOT NULL DEFAULT '' COMMENT '模型模板路径',
  `tmpltmpl` char(100) NOT NULL DEFAULT '' COMMENT '模板模板路径',
  `ctrpath` char(100) NOT NULL DEFAULT '' COMMENT '生成控制器路径',
  `modelpath` char(100) NOT NULL DEFAULT '' COMMENT '生成模型路径',
  `tmplpath` char(100) NOT NULL DEFAULT '' COMMENT '生成模板路径',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_autocodecfg_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='代码生成配置信息\r\n@author   和蔼的木Q\r\n@version  2013-12-07';
