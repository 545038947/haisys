/*
name : department 部门表
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_department`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_department`;
CREATE TABLE `onethink_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(30) NOT NULL COMMENT '标志/英文唯一标识',
  `title` varchar(50) NOT NULL COMMENT '名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道类模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表类模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情类模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑类模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dpt_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='部门表\r\n@author   和蔼的木Q\r\n@version  2013-12-07';



/*
name : users 前台用户表
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_users`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_users`;
CREATE TABLE `onethink_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL DEFAULT '' COMMENT '登录账号',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称-姓名',
  `ptid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属部门ID',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '1949-10-01' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `mobile` char(10) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `ix_uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='前台会员表\r\n@author   和蔼的木Q\r\n@version  2013-12-07';


/*
name : 商城appkey设置
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_users`
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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='商城appkey设置\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

