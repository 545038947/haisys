SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_yqf_webcat`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_yqf_webcat`;
CREATE TABLE `onethink_yqf_webcat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `web_catid` char(64) NOT NULL DEFAULT '' COMMENT '商家网站分类的编号',
  `web_cname` char(64) NOT NULL DEFAULT '' COMMENT '商家网站分类的中文名称',
  `amount` char(64) NOT NULL DEFAULT '' COMMENT '商家该类目下的商家网站数量',
  `web_type` char(64) NOT NULL DEFAULT '' COMMENT '商家网站的类型',
  `modified_time` char(64) NOT NULL DEFAULT '' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_wcat_id` (`web_catid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商家网站分类\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- Table structure for `onethink_yqf_website`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_yqf_website`;
CREATE TABLE `onethink_yqf_website` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `web_id` char(64) NOT NULL DEFAULT '' COMMENT '商家网站的站点ID',
  `web_name` char(64) NOT NULL DEFAULT '' COMMENT '商家网站的中文名称',
  `information` text COMMENT '商家网站的描述信息',
  `web_catid` char(64) NOT NULL DEFAULT '' COMMENT '商家网站所属分类的分类id',
  `logo_url` text COMMENT '网站LOGO图片的URL',
  `web_url` text COMMENT '商家网站的计费URL',
  `commission` char(128) NOT NULL DEFAULT '' COMMENT '推广佣金比例信息',
  `begin_date` char(64) NOT NULL DEFAULT '' COMMENT '网站推广开始时间',
  `end_date` char(64) NOT NULL DEFAULT '' COMMENT '网站推广结束时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '网站可用状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_web_id` (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='单个商家网站的详细信息\r\n@author   和蔼的木Q\r\n@version  2013-12-07';
