/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : haisys

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-12-24 10:55:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jgjsys_action`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_action`;
CREATE TABLE `jgjsys_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of jgjsys_action
-- ----------------------------
INSERT INTO `jgjsys_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `jgjsys_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `jgjsys_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `jgjsys_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `jgjsys_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `jgjsys_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `jgjsys_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `jgjsys_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `jgjsys_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `jgjsys_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `jgjsys_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for `jgjsys_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_action_log`;
CREATE TABLE `jgjsys_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of jgjsys_action_log
-- ----------------------------
INSERT INTO `jgjsys_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-19 12:33登录了后台', '1', '1387427593');
INSERT INTO `jgjsys_action_log` VALUES ('2', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-19 12:47登录了后台', '1', '1387428426');
INSERT INTO `jgjsys_action_log` VALUES ('3', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-19 12:48登录了后台', '1', '1387428488');
INSERT INTO `jgjsys_action_log` VALUES ('4', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-19 13:28登录了后台', '1', '1387430907');
INSERT INTO `jgjsys_action_log` VALUES ('5', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-19 13:32登录了后台', '1', '1387431161');
INSERT INTO `jgjsys_action_log` VALUES ('6', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-19 15:35登录了后台', '1', '1387438556');
INSERT INTO `jgjsys_action_log` VALUES ('7', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-22 11:30登录了后台', '1', '1387683005');
INSERT INTO `jgjsys_action_log` VALUES ('8', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-22 15:34登录了后台', '1', '1387697694');
INSERT INTO `jgjsys_action_log` VALUES ('9', '1', '1', '2130706433', 'member', '1', 'admin在2013-12-23 02:46登录了后台', '1', '1387738012');

-- ----------------------------
-- Table structure for `jgjsys_addons`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_addons`;
CREATE TABLE `jgjsys_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of jgjsys_addons
-- ----------------------------
INSERT INTO `jgjsys_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `jgjsys_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `jgjsys_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `jgjsys_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `jgjsys_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `jgjsys_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `jgjsys_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for `jgjsys_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_attachment`;
CREATE TABLE `jgjsys_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of jgjsys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_attribute`;
CREATE TABLE `jgjsys_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of jgjsys_attribute
-- ----------------------------
INSERT INTO `jgjsys_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `jgjsys_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `jgjsys_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `jgjsys_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `jgjsys_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `jgjsys_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for `jgjsys_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_auth_extend`;
CREATE TABLE `jgjsys_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of jgjsys_auth_extend
-- ----------------------------
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `jgjsys_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for `jgjsys_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_auth_group`;
CREATE TABLE `jgjsys_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_auth_group
-- ----------------------------
INSERT INTO `jgjsys_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `jgjsys_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for `jgjsys_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_auth_group_access`;
CREATE TABLE `jgjsys_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_auth_rule`;
CREATE TABLE `jgjsys_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`module`,`name`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_auth_rule
-- ----------------------------
INSERT INTO `jgjsys_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('6', 'admin', '1', 'Admin/Index/index', '首页', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `jgjsys_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');

-- ----------------------------
-- Table structure for `jgjsys_category`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_category`;
CREATE TABLE `jgjsys_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
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
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of jgjsys_category
-- ----------------------------
INSERT INTO `jgjsys_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0');
INSERT INTO `jgjsys_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '31');

-- ----------------------------
-- Table structure for `jgjsys_channel`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_channel`;
CREATE TABLE `jgjsys_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_channel
-- ----------------------------
INSERT INTO `jgjsys_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `jgjsys_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `jgjsys_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for `jgjsys_config`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_config`;
CREATE TABLE `jgjsys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_config
-- ----------------------------
INSERT INTO `jgjsys_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'HaiSys-内容管理框架', '0');
INSERT INTO `jgjsys_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'HaiSys内容管理框架', '1');
INSERT INTO `jgjsys_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'HaiSys,和蔼的木Q', '8');
INSERT INTO `jgjsys_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `jgjsys_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `jgjsys_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `jgjsys_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `jgjsys_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `jgjsys_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'blue_color', '10');
INSERT INTO `jgjsys_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `jgjsys_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `jgjsys_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `jgjsys_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `jgjsys_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `jgjsys_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '20', '10');
INSERT INTO `jgjsys_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `jgjsys_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `jgjsys_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `jgjsys_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `jgjsys_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `jgjsys_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `jgjsys_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `jgjsys_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname', '0');
INSERT INTO `jgjsys_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `jgjsys_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `jgjsys_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `jgjsys_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for `jgjsys_document`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_document`;
CREATE TABLE `jgjsys_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`type`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of jgjsys_document
-- ----------------------------
INSERT INTO `jgjsys_document` VALUES ('1', '1', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '9', '0', '0', '0', '1387260660', '1387683516', '-1');

-- ----------------------------
-- Table structure for `jgjsys_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_document_article`;
CREATE TABLE `jgjsys_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of jgjsys_document_article
-- ----------------------------
INSERT INTO `jgjsys_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');

-- ----------------------------
-- Table structure for `jgjsys_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_document_download`;
CREATE TABLE `jgjsys_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of jgjsys_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_file`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_file`;
CREATE TABLE `jgjsys_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of jgjsys_file
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_hooks`;
CREATE TABLE `jgjsys_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `搜索索引` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_hooks
-- ----------------------------
INSERT INTO `jgjsys_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `jgjsys_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `jgjsys_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `jgjsys_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `jgjsys_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `jgjsys_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `jgjsys_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `jgjsys_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `jgjsys_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `jgjsys_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `jgjsys_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for `jgjsys_member`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_member`;
CREATE TABLE `jgjsys_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of jgjsys_member
-- ----------------------------
INSERT INTO `jgjsys_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '20', '10', '0', '1387427567', '2130706433', '1387738012', '1');

-- ----------------------------
-- Table structure for `jgjsys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_menu`;
CREATE TABLE `jgjsys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_menu
-- ----------------------------
INSERT INTO `jgjsys_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('2', '内容', '0', '2', 'Article/mydocument', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `jgjsys_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `jgjsys_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `jgjsys_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `jgjsys_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `jgjsys_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `jgjsys_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `jgjsys_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `jgjsys_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `jgjsys_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `jgjsys_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `jgjsys_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `jgjsys_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `jgjsys_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `jgjsys_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `jgjsys_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `jgjsys_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `jgjsys_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `jgjsys_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');

-- ----------------------------
-- Table structure for `jgjsys_model`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_model`;
CREATE TABLE `jgjsys_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of jgjsys_model
-- ----------------------------
INSERT INTO `jgjsys_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `jgjsys_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `jgjsys_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for `jgjsys_picture`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_picture`;
CREATE TABLE `jgjsys_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_shopset`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_shopset`;
CREATE TABLE `jgjsys_shopset` (
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
-- Records of jgjsys_shopset
-- ----------------------------
INSERT INTO `jgjsys_shopset` VALUES ('26', '亿起发', '1', 'appkey', '138655627865015183', 'appsecret', '6652180706dd0f96559d4204970392b6', 'uname', '138655627865015183', 'secret', '6652180706dd0f96559d4204970392b6', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `jgjsys_shopset` VALUES ('27', '拍拍', '1', 'uin', '545038947', 'userId', '55006', 'appOAuthID', '700155269', 'secretOAuthKey', '123123123123123', 'accessToken', 'c4b9f95298ee19e2f36d93086a3b1751', 'defaultKey', '手机', 'goodsnum', '20', 'order', '1', 'cacheTime', '2', 'errLog', '0');

-- ----------------------------
-- Table structure for `jgjsys_ucenter_admin`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_ucenter_admin`;
CREATE TABLE `jgjsys_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of jgjsys_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_ucenter_app`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_ucenter_app`;
CREATE TABLE `jgjsys_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of jgjsys_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_ucenter_member`;
CREATE TABLE `jgjsys_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jgjsys_ucenter_member
-- ----------------------------
INSERT INTO `jgjsys_ucenter_member` VALUES ('1', 'admin', '6cc437c212bbd45531647e74f60f4743', '545038947@qq.com', '', '1387427567', '2130706433', '1387738012', '2130706433', '1387427567', '1');

-- ----------------------------
-- Table structure for `jgjsys_ucenter_setting`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_ucenter_setting`;
CREATE TABLE `jgjsys_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of jgjsys_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_url`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_url`;
CREATE TABLE `jgjsys_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of jgjsys_url
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_userdata`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_userdata`;
CREATE TABLE `jgjsys_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgjsys_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_yqf_city`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_city`;
CREATE TABLE `jgjsys_yqf_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `city_id` char(64) NOT NULL DEFAULT '' COMMENT '城市区域id',
  `name_cn` char(64) NOT NULL DEFAULT '' COMMENT '城市区域的中文名称',
  `name_py` char(64) NOT NULL DEFAULT '' COMMENT '城市下辖区域的拼音',
  `is_parent` char(64) NOT NULL DEFAULT '' COMMENT '是否是父类级城市（是否拥有下级单位）',
  `level` char(64) NOT NULL DEFAULT '' COMMENT '城市区域等级',
  `tag` char(64) NOT NULL DEFAULT '' COMMENT '团购城市标签',
  `head` char(64) NOT NULL DEFAULT '' COMMENT '城市名称的拼音的首字母',
  `type` char(64) NOT NULL DEFAULT '' COMMENT '为1和2。2表示全国的城市表；1表示只返回有商品信息的团购城市，包括全国。',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_city_id` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2251 DEFAULT CHARSET=utf8 COMMENT='yiqifa团购城市数据表\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- ----------------------------
-- Records of jgjsys_yqf_city
-- ----------------------------
INSERT INTO `jgjsys_yqf_city` VALUES ('2250', '540100', '拉萨', 'LASA', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2249', '533400', '迪庆州', 'DIQING', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2248', '650200', '克拉玛依', 'KELAMAYI', 'true', '21', '', 'K', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2247', '650100', '乌鲁木齐', 'WULUMUQI', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2246', '640500', '中卫', 'ZHONGWEI', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2245', '640300', '吴忠', 'WUZHONG', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2244', '640200', '石嘴山', 'SHIZUISHAN', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2243', '640181', '灵武', 'LINGWU', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2242', '640100', '银川', 'YINCHUAN', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2241', '630100', '西宁', 'XINING', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2240', '620100', '兰州', 'LANZHOU', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2239', '610900', '安康', 'ANKANG', 'true', '21', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2238', '610800', '榆林', 'YULIN', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2237', '610700', '汉中', 'HANZHONG', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2236', '610600', '延安', 'YANAN', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2235', '610582', '华阴', 'HUAYIN', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2234', '610581', '韩城', 'HANCHENG', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2233', '610481', '兴平', 'XINGPING', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2232', '610400', '咸阳', 'XIANYANG', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2231', '610300', '宝鸡', 'BAOJI', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2230', '610100', '西安', 'XIAN', 'true', '21', '1', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2229', '511900', '巴中', 'BAZHONG', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2228', '511700', '达州', 'DAZHOU', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2227', '511500', '宜宾', 'YIBIN', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2226', '511381', '阆中', 'LANGZHONG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2225', '511300', '南充', 'NANCHONG', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2224', '511181', '峨眉山', 'EMEISHAN', 'true', '33', '', 'E', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2223', '511100', '乐山', 'LESHAN', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2222', '511000', '内江', 'NEIJIANG', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2221', '510900', '遂宁', 'SUINING', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2220', '510781', '江油', 'JIANGYOU', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2219', '510700', '绵阳', 'MIANYANG', 'true', '21', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2218', '510683', '绵竹', 'MIANZHU', 'true', '33', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2217', '510682', '什邡', 'SHIFANG', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2216', '510681', '广汉', 'GUANGHAN', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2215', '510600', '德阳', 'DEYANG', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2214', '510400', '攀枝花', 'PANZHIHUA', 'true', '21', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2213', '510300', '自贡', 'ZIGONG', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2212', '510184', '崇州', 'CHONGZHOU', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2211', '510183', '邛崃', 'QIONGLAI', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2210', '510182', '彭州', 'PENGZHOU', 'true', '33', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2209', '510181', '都江堰', 'DUJIANGYAN', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2208', '530900', '临沧', 'LINCANG', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2207', '530800', '普洱', 'PUER', 'true', '21', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2206', '530700', '丽江', 'LIJIANG', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2205', '530600', '昭通', 'ZHAOTONG', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2204', '530500', '保山', 'BAOSHAN', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2203', '530300', '曲靖', 'QUJING', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2202', '530181', '安宁', 'ANNING', 'true', '33', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2201', '530100', '昆明', 'KUNMING', 'true', '21', '1', 'K', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2200', '522702', '福泉', 'FUQUAN', 'true', '33', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2199', '522701', '都匀', 'DUYUN', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2198', '522601', '凯里', 'KAILI', 'true', '33', '', 'K', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2197', '520600', '铜仁', 'TONGREN', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2196', '520500', '毕节', 'BIJIE', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2195', '520400', '安顺', 'ANSHUN', 'true', '21', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2194', '520382', '仁怀', 'RENHUAI', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2193', '520381', '赤水', 'CHISHUI', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2192', '520300', '遵义', 'ZUNYI', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2191', '520200', '六盘水', 'LIUPANSHUI', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2190', '520181', '清镇', 'QINGZHEN', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2189', '520100', '贵阳', 'GUIYANG', 'true', '21', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2188', '510100', '成都', 'CHENGDU', 'true', '21', '1', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2187', '500000', '重庆', 'CHONGQING', 'true', '13', '1', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2186', '460200', '三亚', 'SANYA', 'true', '21', '1', 'SY', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2185', '460100', '海口', 'HAIKOU', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2184', '451200', '河池', 'HECHI', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2183', '450800', '贵港', 'GUIGUANG', 'true', '21', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2182', '450700', '钦州', 'QINZHOU', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2181', '450600', '防城港', 'FANGCHENGGANG', 'true', '21', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2180', '450500', '北海', 'BEIHAI', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2179', '450400', '梧州', 'WUZHOU', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2178', '411381', '邓州', 'DENGZHOU', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2177', '411300', '南阳', 'NANYANG', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2176', '411082', '长葛', 'CHANGGE', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2175', '411081', '禹州', 'YUZHOU', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2174', '411000', '许昌', 'XUCHANG', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2173', '410900', '濮阳', 'PUYANG', 'true', '21', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2172', '410883', '孟州', 'MENGZHOU', 'true', '33', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2171', '410882', '沁阳', 'QINGYANG', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2170', '410800', '焦作', 'JIAOZUO', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2169', '410782', '辉县', 'HUIXIAN', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2168', '410781', '卫辉', 'WEIHUI', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2167', '410700', '新乡', 'XINXIANG', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2166', '410581', '林州', 'LINZHOU', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2165', '410500', '安阳', 'ANYANG', 'true', '21', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2164', '410381', '偃师', 'YANSHI', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2163', '410300', '洛阳', 'LUOYANG', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2162', '410200', '开封', 'KAIFENG', 'true', '21', '', 'K', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2161', '410185', '登封', 'DENGFENG', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2160', '410184', '新郑', 'XINZHENG', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2159', '410183', '新密', 'XINMI', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2158', '410182', '荥阳', 'XINGYANG', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2157', '410181', '巩义', 'GONGYI', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2156', '410122', '中牟', 'ZHONGMOU', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2155', '410100', '郑州', 'ZHENGZHOU', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2154', '450300', '桂林', 'GUILIN', 'true', '21', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2153', '450200', '柳州', 'LIUZHOU', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2152', '450100', '南宁', 'NANNING', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2151', '442000', '中山', 'ZHONGSHAN', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2150', '441900', '东莞', 'DONGGUAN', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2149', '441882', '连州', 'LIANZHOU', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2148', '441881', '英德', 'YINGDE', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2147', '441800', '清远', 'QINGYUAN', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2146', '441700', '阳江', 'YANGJIANG', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2145', '441600', '河源', 'HEYUAN', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2144', '441500', '汕尾', 'SHANWEI', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2143', '441400', '梅州', 'MEIZHOU', 'true', '21', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2142', '441300', '惠州', 'HUIZHOU', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2141', '441284', '四会', 'SIHUI', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2140', '441283', '高要', 'GAOYAO', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2139', '441200', '肇庆', 'ZHAOQING', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2138', '440900', '茂名', 'MAOMING', 'true', '21', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2137', '440883', '吴川', 'WUCHUAN', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2136', '440882', '雷州', 'LEIZHOU', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2135', '440881', '廉江', 'LIANJIANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2134', '440800', '湛江', 'ZHANJIANG', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2133', '440785', '恩平', 'EPING', 'true', '33', '', 'E', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2132', '440784', '鹤山', 'HESHAN', 'true', '33', '', 'HS', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2131', '440783', '开平', 'KAIPING', 'true', '33', '', 'KP', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2130', '440781', '台山', 'TAISHAN', 'true', '33', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2129', '440700', '江门', 'JIANGMEN', 'true', '21', '', 'JM', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2128', '440600', '佛山', 'FOSHAN', 'true', '21', '', 'FS', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2127', '440500', '汕头市', 'SHANTOU', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2126', '440400', '珠海', 'ZHUHAI', 'true', '21', '', 'ZH', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2125', '440300', '深圳', 'SHENZHEN', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2124', '440282', '南雄', 'NANXIONG', 'true', '33', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2123', '440281', '乐昌', 'LECHANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2122', '440200', '韶关', 'SHAOGUAN', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2121', '440184', '从化', 'CONGHUA', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2120', '440183', '增城', 'ZENGCHENG', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2119', '440100', '广州', 'GUANGZHOU', 'true', '21', '1', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2118', '433100', '湘西州', 'XIANGXI', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2117', '431382', '涟源', 'LIANYUAN', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2116', '431381', '冷水江', 'LENGSHUIJIANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2115', '431300', '娄底', 'LOUDI', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2114', '431200', '怀化', 'HUAIHUA', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2113', '431000', '郴州', 'CHENZHOU', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2112', '430900', '益阳', 'YIYANG', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2111', '430800', '张家界', 'ZHANGJIAJIE', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2110', '430781', '津市', 'JINSHI', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2109', '430700', '常德', 'CHANGDE', 'true', '21', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2108', '430682', '临湘', 'LINXIANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2107', '430681', '汨罗', 'MILUO', 'true', '33', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2106', '430600', '岳阳', 'YUEYANG', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2105', '430482', '常宁', 'CHANGNING', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2104', '430481', '耒阳', 'LEIYANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2103', '430400', '衡阳', 'HENGYANG', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2102', '430382', '韶山', 'SHAOSHAN', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2101', '430300', '湘潭', 'XIANGTAN', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2100', '430281', '醴陵', 'LILING', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2099', '430200', '株洲', 'ZHUZHOU', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2098', '430181', '浏阳', 'LIUYANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2097', '430100', '长沙', 'CHANGSHA', 'true', '21', '1', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2096', '422800', '恩施州', 'ESHI', 'true', '21', '', 'E', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2095', '421281', '赤壁', 'CHIBI', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2094', '421200', '咸宁', 'XIANNING', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2093', '421087', '松滋', 'SONGZI', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2092', '421083', '洪湖', 'HONGHU', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2091', '421081', '石首', 'SHISHOU', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2090', '421000', '荆州', 'JINGZHOU', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2089', '420900', '孝感', 'XIAOGAN', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2088', '420700', '鄂州', 'EZHOU', 'true', '21', '', 'E', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2087', '420684', '宜城', 'YICHENG', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2086', '420683', '枣阳', 'ZAOYANG', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2085', '420682', '老河口', 'LAOHEKOU', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2084', '420600', '襄樊', 'XIANGFAN', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2083', '420300', '十堰', 'SHIYAN', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2082', '420200', '黄石', 'HUANGSHI', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2081', '420100', '武汉', 'WUHAN', 'true', '21', '1', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2080', '419001', '济源', 'JIYUAN', 'true', '24', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2079', '360400', '九江', 'JIUJIANG', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2078', '360200', '景德镇', 'JINGDEZHEN', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2077', '360100', '南昌', 'NANCHANG', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2076', '350900', '宁德', 'NINGDE', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2075', '350881', '漳平', 'ZHANGPING', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2074', '350800', '龙岩', 'LONGYAN', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2073', '350784', '建阳', 'JIANYANG', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2072', '350783', '建瓯', 'JIANOU', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2071', '350782', '武夷山', 'WUYISHAN', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2070', '350781', '邵武', 'SHAOWU', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2069', '350700', '南平', 'NANPING', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2068', '350681', '龙海', 'LONGHAI', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2067', '350600', '漳州', 'ZHANGZHOU', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2066', '350583', '南安', 'NANAN', 'true', '33', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2065', '350582', '晋江', 'JINJIANG', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2064', '350581', '石狮', 'SHISHI', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2063', '350500', '泉州', 'QUANZHOU', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2062', '350481', '永安', 'YONGAN', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2061', '350400', '三明', 'SANMING', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2060', '350300', '莆田', 'PUTIAN', 'true', '21', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2059', '350200', '厦门', 'XIAMEN', 'true', '21', '1', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2058', '350182', '长乐', 'CHANGLE', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2057', '350181', '福清', 'FUQING', 'true', '33', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2056', '350100', '福州', 'FUZHOU', 'true', '21', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2055', '341700', '池州', 'CHIZHOU', 'true', '21', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2054', '341500', '六安', 'LUAN', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2053', '371700', '菏泽', 'HEZE', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2052', '371600', '滨州', 'BINZHOU', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2051', '371581', '临清', 'LINQING', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2050', '371500', '聊城', 'LIAOCHENG', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2049', '371482', '禹城', 'YUCHENG', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2048', '371481', '乐陵', 'LELING', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2047', '371400', '德州', 'DEZHOU', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2046', '371300', '临沂', 'LINYI', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2045', '371200', '莱芜', 'WUHU', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2044', '371100', '日照', 'RIZHAO', 'true', '21', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2043', '371083', '乳山', 'RUSHAN', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2042', '371082', '荣成', 'RONGCHENG', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2041', '371081', '文登', 'WENDENG', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2040', '371000', '威海', 'WEIHAI', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2039', '370983', '肥城', 'FEICHENG', 'true', '33', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2038', '370982', '新泰', 'XINTAI', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2037', '370900', '泰安', 'TAIAN', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2036', '370883', '邹城', 'ZOUCHENG', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2035', '370882', '兖州', 'YANZHOU', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2034', '370881', '曲阜', 'QUFU', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2033', '370800', '济宁', 'JINING', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2032', '370786', '昌邑', 'CHANGYI', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2031', '370785', '高密', 'GAOMI', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2030', '370784', '安丘', 'ANQIU', 'true', '33', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2029', '370783', '寿光', 'SHOUGUANG', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2028', '370782', '诸城', 'ZHUCHENG', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2027', '370781', '青州', '[', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2026', '370700', '潍坊', 'WEIFANG', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2025', '370687', '海阳', 'HAIYANG', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2024', '370686', '栖霞', 'QIXIA', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2023', '370685', '招远', 'ZHAOYUAN', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2022', '370684', '蓬莱', 'PENGLAI', 'true', '33', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2021', '370683', '莱州', 'LAIZHOU', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2020', '370682', '莱阳', 'LAIYANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2019', '370681', '龙口', 'LONGKOU', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2018', '370600', '烟台', 'YANTAI', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2017', '370500', '东营', 'DONGYING', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2016', '370481', '滕州', 'TENGZHOU', 'true', '33', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2015', '370400', '枣庄', 'ZAOZHUANG', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2014', '370300', '淄博', 'ZIBO', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2013', '370285', '莱西', 'LAIXI', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2012', '370284', '胶南', 'JIAONAN', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2011', '370283', '平度', 'PINGDU', 'true', '33', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2010', '370282', '即墨', 'JIMO', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2009', '370281', '胶州', 'JIAOZHOU', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2008', '370200', '青岛', 'QINGDAO', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2007', '370181', '章丘', 'ZHANGQIU', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2006', '370100', '济南', 'JINAN', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2005', '361100', '上饶', 'SHANGRAO', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2004', '360983', '高安', 'GAOAN', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2003', '360982', '樟树', 'ZHANGSHU', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2002', '360981', '丰城', 'FENGCHENG', 'true', '33', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2001', '360900', '宜春', 'YICHUN', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('2000', '360881', '井冈山', 'JINGGANGSHAN', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1999', '360800', '吉安', 'JIAN', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1998', '360782', '南康', 'NANKANG', 'true', '33', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1997', '360781', '瑞金', 'RUIJIN', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1996', '360700', '赣州', 'GANZHOU', 'true', '21', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1995', '360600', '鹰潭', 'YINGTAN', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1994', '360481', '瑞昌', 'RUICHANG', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1993', '341000', '黄山', 'HUANGSHAN', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1992', '340881', '桐城', 'TONGCHENG', 'true', '33', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1991', '340800', '安庆', 'ANQING', 'true', '21', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1990', '340700', '铜陵', 'TONGLING', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1989', '340600', '淮北', 'HUAIBEI', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1988', '340500', '马鞍山', 'MAANSHAN', 'true', '21', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1987', '340400', '淮南', 'HUAINAN', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1986', '340300', '蚌埠', 'BENGBU', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1985', '340200', '芜湖', 'WUHU', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1984', '340100', '合肥', 'HEFEI', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1983', '331100', '丽水', 'LISHUI', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1982', '331082', '临海', 'LINHAI', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1981', '331081', '温岭', 'WENLING', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1980', '331000', '台州', 'TAIZHOU', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1979', '330900', '舟山', 'ZHOUSHAN', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1978', '330881', '江山', 'JIANGSHAN', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1977', '330800', '衢州', 'QUZHOU', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1976', '330784', '永康', 'YONGKANG', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1975', '330783', '东阳', 'DONGYANG', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1974', '330782', '义乌', 'YIWU', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1973', '330781', '兰溪', 'LANXI', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1972', '330700', '金华', 'JINHUA', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1971', '330683', '嵊州', 'SHENGZHOU', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1970', '330682', '上虞', 'SHANGYU', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1969', '330681', '诸暨', 'ZHUJI', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1968', '330600', '绍兴', 'SHAOXING', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1967', '330500', '湖州', 'HUZHOU', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1966', '330483', '桐乡', 'TONGXIANG', 'true', '33', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1965', '330482', '平湖', 'PINGHU', 'true', '33', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1964', '330481', '海宁', 'HAINING', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1963', '210500', '本溪', 'BENXI', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1962', '210400', '抚顺', 'FUSHUN', 'true', '21', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1961', '210381', '海城', 'HAICHENG', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1960', '210300', '鞍山', 'ANSHAN', 'true', '21', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1959', '210283', '庄河', 'ZHUANGHE', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1958', '210282', '普兰店', 'PULANDIAN', 'true', '33', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1957', '210281', '瓦房店', 'WUFANGDIAN', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1956', '210200', '大连', 'DALIAN', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1955', '210181', '新民', 'XINMIN', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1954', '210100', '沈阳', 'SHENYANG', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1953', '152502', '锡林浩特', 'XILINHAOTE', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1952', '152501', '二连浩特', 'ERLIANHAOTE', 'true', '33', '', 'E', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1951', '152202', '阿尔山', 'AERSHA', 'true', '33', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1950', '152201', '乌兰浩特', 'WULANHAOTE', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1949', '150785', '根河', 'GENHE', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1948', '150784', '额尔古纳', 'EERGUNA', 'true', '33', '', 'E', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1947', '150783', '扎兰屯', 'ZHALANTUN', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1946', '150782', '牙克石', 'YAKESHI', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1945', '150781', '满洲里', 'MANZHOULI', 'true', '33', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1944', '150700', '呼伦贝尔', 'HULUNBEIER', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1943', '150600', '鄂尔多斯', 'EERDUOSI', 'true', '21', '', 'E', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1942', '330400', '嘉兴', 'JIAXING', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1941', '330382', '乐清', 'LEQIING', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1940', '330381', '瑞安', 'RUIAN', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1939', '330300', '温州', 'WENZHOU', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1938', '330283', '奉化', 'FENGHUA', 'true', '33', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1937', '330282', '慈溪', 'CIXI', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1936', '330281', '余姚', 'YUYAO', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1935', '330200', '宁波', 'NINGBO', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1934', '330185', '临安', 'LINAN', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1933', '330183', '富阳', 'FUYANG', 'true', '33', '', 'F', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1932', '330182', '建德', 'JIANDE', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1931', '330100', '杭州', 'HANGZHOU', 'true', '21', '1', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1930', '321300', '宿迁', 'SUQIAN', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1929', '321284', '姜堰', 'JIANGYAN', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1928', '321283', '泰兴', 'TAIXING', 'true', '33', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1927', '321282', '靖江', 'JINGJIANG', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1926', '321281', '兴化', 'XINGHUA', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1925', '321200', '泰州', 'TAIZHOU', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1924', '321183', '句容', 'JURONG', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1923', '321182', '扬中', 'YANGZHONG', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1922', '321181', '丹阳', 'DANYANG', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1921', '321100', '镇江', 'ZHENJIANG', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1920', '321088', '江都', 'JIANGDU', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1919', '321084', '高邮', 'GAOYOU', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1918', '321081', '仪征', 'YIZHENG', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1917', '321000', '扬州', 'YANGZHOU', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1916', '320982', '大丰', 'DAFENG', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1915', '320981', '东台', 'DONGTAI', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1914', '320900', '盐城', 'YANCHENG', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1913', '320800', '淮安', 'HUAIAN', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1912', '320700', '连云港', 'LIANYUNGANG', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1911', '320684', '海门', 'HAIMEN', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1910', '320682', '如皋', 'RUGAO', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1909', '320681', '启东', 'QIDONG', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1908', '320623', '如东', 'RUDONG', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1907', '320621', '海安', 'HAIAN', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1906', '320600', '南通', 'NANTONG', 'true', '21', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1905', '320585', '太仓', 'TAICANG', 'true', '33', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1904', '320584', '吴江', 'WUJIANG', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1903', '320583', '昆山', 'KUNSHAN', 'true', '33', '', 'K', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1902', '320582', '张家港', 'ZHANGJIAGANG', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1901', '320581', '常熟', 'CHANGSHU', 'true', '33', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1900', '320500', '苏州', 'SUZHOU', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1899', '320482', '金坛', 'JINTAN', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1898', '320481', '溧阳', 'LIYANG', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1897', '320400', '常州', 'CHANGZHOU', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1896', '320382', '邳州', 'PIZHOU', 'true', '33', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1895', '320381', '新沂', 'XINYI', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1894', '320300', '徐州', 'XUZHOU', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1893', '320282', '宜兴', 'YIXING', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1892', '320281', '江阴', 'JIANGYIN', 'true', '33', '', 'JS', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1891', '320200', '无锡', 'WUXI', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1890', '320100', '南京', 'NANJING', 'true', '21', '1', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1889', '310000', '上海', 'SHANGHAI', 'true', '13', '1', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1888', '231200', '绥化', 'SUIHUA', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1887', '231100', '黑河', 'HEIHE', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1886', '231085', '穆棱', 'MULING', 'true', '33', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1885', '231084', '宁安', 'NINGAN', 'true', '33', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1884', '231083', '海林', 'HAILIN', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1883', '231081', '绥芬河', 'SUIFENHE', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1882', '231000', '牡丹江', 'MUDANJIANG', 'true', '21', '', 'M', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1881', '230600', '大庆', 'DAQING', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1880', '230400', '鹤岗', 'HEGANG', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1879', '230281', '讷河', 'NEHE', 'true', '33', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1878', '230200', '齐齐哈尔', 'QIQIHAER', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1877', '230184', '五常', 'WUCHANG', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1876', '230183', '尚志', 'SHANGZHI', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1875', '230182', '双城', 'SHUANGCHENG', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1874', '230100', '哈尔滨', 'HAERBIN', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1873', '220700', '松原', 'SONGYUAN', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1872', '220600', '白山', 'BAISHAN', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1871', '220500', '通化', 'TONGHUA', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1870', '220400', '辽源', 'LIAOYUAN', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1869', '220300', '四平', 'SIPING', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1868', '220183', '德惠', 'DEHUI', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1867', '220182', '榆树', 'YUSHU', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1866', '220181', '九台', 'JIUTAI', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1865', '220100', '长春', 'CHANGCHUN', 'true', '21', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1864', '211481', '兴城', 'XINGCHENG', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1863', '211400', '葫芦岛', 'HULUDAO', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1862', '211300', '朝阳', 'CHAOYANG', 'true', '21', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1861', '211200', '铁岭', 'TIELING', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1860', '211100', '盘锦', 'PANJIN', 'true', '21', '', 'P', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1859', '211000', '辽阳', 'LIAOYANG', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1858', '210782', '北镇', 'BEIZHEN', 'true', '33', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1857', '210781', '凌海', 'LINGHAI', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1856', '210700', '锦州', 'JINZHOU', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1855', '210600', '丹东', 'DANDONG', 'true', '21', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1854', '140800', '运城', 'YUNCHENG', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1853', '140781', '介休', 'JIEXIU', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1852', '140700', '晋中', 'JINZHOU', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1851', '140500', '晋城', 'JINCHENG', 'true', '21', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1850', '140400', '长治', 'CHANGZHI', 'true', '21', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1849', '140300', '阳泉', 'YANGQUAN', 'true', '21', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1848', '140181', '古交', 'GUJIAO', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1847', '140100', '太原', 'TAIYUAN', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1846', '131100', '衡水', 'HENGSHUI', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1845', '131082', '三河', 'SANHE', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1844', '131081', '霸州', 'BAZOU', 'true', '33', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1843', '131000', '廊坊', 'LANGFANG', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1842', '130984', '河间', 'HEJIAN', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1841', '130983', '黄骅', 'HUANGHUA', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1840', '130982', '任丘', 'RENQIU', 'true', '33', '', 'R', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1839', '130981', '泊头', 'BOTOU', 'true', '33', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1838', '130900', '沧州', 'CANGZHOU', 'true', '21', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1837', '130800', '承德', 'CHENGDE', 'true', '21', '', 'C', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1836', '150300', '乌海', 'WUHAI', 'true', '21', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1835', '150200', '包头', 'BAOTOU', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1834', '150100', '呼和浩特', 'HUHEHAOTE', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1833', '141082', '霍州', 'HUOZHOU', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1832', '141081', '侯马', 'HOUMA', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1831', '141000', '临汾', 'LINFEN', 'true', '21', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1830', '140882', '河津', 'HEJIN', 'true', '33', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1829', '140881', '永济', 'YONGJI', 'true', '33', '', 'Y', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1828', '130700', '张家口', 'ZHANGJIAKOU', 'true', '21', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1827', '130684', '高碑店', 'GAOBEIDIAN', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1826', '130683', '安国', 'ANGUO', 'true', '33', '', 'A', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1825', '130682', '定州', 'DINGZHOU', 'true', '33', '', 'D', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1824', '130681', '涿州', 'ZHUOZHOU', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1823', '130600', '保定', 'BAODING', 'true', '21', '', 'B', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1822', '130582', '沙河', 'SHAHE', 'true', '33', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1821', '130581', '南宫', 'NANGONG', 'true', '33', '', 'N', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1820', '130500', '邢台', 'XINGTAI', 'true', '21', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1819', '130481', '武安', 'WUAN', 'true', '33', '', 'W', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1818', '130400', '邯郸', 'HANDAN', 'true', '21', '', 'H', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1817', '130300', '秦皇岛', 'QINGHUANGDAO', 'true', '21', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1816', '130283', '迁安', 'QIANAN', 'true', '33', '', 'Q', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1815', '130281', '遵化', 'ZUNHUA', 'true', '33', '', 'Z', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1814', '130200', '唐山', 'TANGSHAN', 'true', '21', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1813', '130185', '鹿泉', 'LUQUAN', 'true', '33', '', 'L', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1812', '130184', '新乐', 'XINYUE', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1811', '130183', '晋州', 'JINZHOU', 'true', '33', '', 'J', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1810', '130182', '藁城', 'GAOCHENG', 'true', '33', '', 'G', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1809', '130181', '辛集', 'XINJI', 'true', '33', '', 'X', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1808', '130100', '石家庄', 'SHIJIAZHUANG', 'true', '21', '', 'S', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1807', '120000', '天津', 'TIANJIN', 'true', '13', '', 'T', '1');
INSERT INTO `jgjsys_yqf_city` VALUES ('1806', '110000', '北京', 'BEIJING', 'true', '13', '1', 'B', '1');

-- ----------------------------
-- Table structure for `jgjsys_yqf_itemcat`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_itemcat`;
CREATE TABLE `jgjsys_yqf_itemcat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `catid` char(64) NOT NULL DEFAULT '' COMMENT '商品类别ID',
  `cname` char(64) NOT NULL DEFAULT '' COMMENT '类别中文名称',
  `parent_id` char(64) NOT NULL DEFAULT '' COMMENT '该类目的父类id',
  `is_parent` char(64) NOT NULL DEFAULT '' COMMENT '该类目是否为父类',
  `alias` char(128) NOT NULL DEFAULT '' COMMENT '类目名称的别名',
  `modified_time` char(64) NOT NULL DEFAULT '' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_itemcat_id` (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='单个商家网站的详细信息\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- ----------------------------
-- Records of jgjsys_yqf_itemcat
-- ----------------------------
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('70', '136000000', '其他鞋', '1', 'true', '其他鞋', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('69', '135000000', '其他服装', '1', 'true', '其他服装', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('68', '134000000', '美容护理', '1', 'true', '美容护理', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('67', '133000000', '宠物用品', '1', 'true', '宠物用品', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('66', '132000000', '医药保健', '1', 'true', '医药保健', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('65', '131000000', '汽车用品', '1', 'true', '汽车用品', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('64', '130000000', '食品粮油', '1', 'true', '食品粮油', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('63', '129000000', '鲜花礼品', '1', 'true', '鲜花礼品', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('62', '128000000', '成人用品', '1', 'true', '成人用品', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('61', '127000000', '运动户外', '1', 'true', '运动户外', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('60', '126000000', '母婴/玩具', '1', 'true', '母婴/玩具', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('59', '125000000', '家居', '1', 'true', '家居', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('58', '124000000', '珠宝', '1', 'true', '珠宝', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('57', '123000000', '眼镜', '1', 'true', '眼镜', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('56', '122000000', '服装配饰', '1', 'true', '服装配饰', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('55', '121000000', '手表', '1', 'true', '手表', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('54', '120000000', '女包/男包/箱包', '1', 'true', '女包/男包/箱包', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('53', '119000000', '运动鞋', '1', 'true', '运动鞋', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('52', '118000000', '男鞋', '1', 'true', '男鞋', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('51', '117000000', '女鞋', '1', 'true', '女鞋', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('50', '116000000', '内衣', '1', 'true', '内衣', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('49', '115000000', '童装/童鞋/孕妇装', '1', 'true', '童装/童鞋/孕妇装', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('48', '114000000', '男装', '1', 'true', '男装', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('47', '113000000', '女装', '1', 'true', '女装', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('46', '112000000', '保健护理电器', '1', 'true', '保健护理电器', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('45', '111000000', '厨房电器', '1', 'true', '厨房电器', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('44', '110000000', '生活小电器', '1', 'true', '生活小电器', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('43', '109000000', '大家电', '1', 'true', '大家电', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('42', '108000000', '办公用品', '1', 'true', '办公用品', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('41', '107000000', '影音设备', '1', 'true', '影音设备', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('40', '106000000', '数码相机', '1', 'true', '数码相机', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('39', '105000000', '电脑软件', '1', 'true', '电脑软件', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('38', '103000000', '电脑', '1', 'true', '电脑', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('37', '102000000', '图书音像', '1', 'true', '图书音像', '2013-03-21 11:27:36');
INSERT INTO `jgjsys_yqf_itemcat` VALUES ('36', '101000000', '手机通讯', '1', 'true', '手机通讯', '2013-03-21 11:27:36');

-- ----------------------------
-- Table structure for `jgjsys_yqf_region`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_region`;
CREATE TABLE `jgjsys_yqf_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `region_id` char(64) NOT NULL DEFAULT '' COMMENT '城市下辖区域的ID',
  `name_cn` char(64) NOT NULL DEFAULT '' COMMENT '城市下辖区域的名称',
  `name_py` char(64) NOT NULL DEFAULT '' COMMENT '城市下辖区域的拼音',
  `level` char(64) NOT NULL DEFAULT '' COMMENT '区域等级',
  `parent_id` char(64) NOT NULL DEFAULT '' COMMENT '该区域的父类城市ID',
  `type` char(64) NOT NULL DEFAULT '' COMMENT '值为1和2。2表示城市的所有区域；1表示只返回有商品信息的区域。',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_region_id` (`region_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='yiqifa团购城市的下辖区域\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- ----------------------------
-- Records of jgjsys_yqf_region
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_yqf_tuancategory`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_tuancategory`;
CREATE TABLE `jgjsys_yqf_tuancategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `catid` char(64) NOT NULL DEFAULT '' COMMENT '类目id',
  `cat_name` char(64) NOT NULL DEFAULT '' COMMENT '类目名称',
  `alias` char(64) NOT NULL DEFAULT '' COMMENT '类目名称的别名',
  `is_parent` char(64) NOT NULL DEFAULT '' COMMENT '是否是父类',
  `parent_id` char(64) NOT NULL DEFAULT '' COMMENT '该类目的父类id',
  `create_time` char(64) NOT NULL DEFAULT '' COMMENT '类目创建的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_tuancategory_id` (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='yiqifa团购的商品分类\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- ----------------------------
-- Records of jgjsys_yqf_tuancategory
-- ----------------------------

-- ----------------------------
-- Table structure for `jgjsys_yqf_webcat`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_webcat`;
CREATE TABLE `jgjsys_yqf_webcat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `web_catid` char(64) NOT NULL DEFAULT '' COMMENT '商家网站分类的编号',
  `web_cname` char(64) NOT NULL DEFAULT '' COMMENT '商家网站分类的中文名称',
  `amount` char(64) NOT NULL DEFAULT '' COMMENT '商家该类目下的商家网站数量',
  `web_type` char(64) NOT NULL DEFAULT '' COMMENT '商家网站的类型',
  `modified_time` char(64) NOT NULL DEFAULT '' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_wcat_id` (`web_catid`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='商家网站分类\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- ----------------------------
-- Records of jgjsys_yqf_webcat
-- ----------------------------
INSERT INTO `jgjsys_yqf_webcat` VALUES ('78', '26', '奢侈品', '12', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('77', '25', '名品特卖', '5', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('76', '24', '网络服务/其他', '43', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('75', '23', '娱乐交友', '2', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('74', '22', '网络游戏', '1', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('73', '21', '金融理财', '2', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('72', '20', '票务旅游', '35', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('71', '19', '教育培训', '13', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('70', '18', '电视购物', '6', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('69', '17', '团购', '52', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('68', '16', '箱包/眼镜/鞋类', '38', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('67', '15', '运动户外', '5', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('66', '14', '汽车用品', '4', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('65', '13', '成人保健', '10', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('64', '12', '医药健康', '34', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('63', '11', '食品/茶叶/酒水', '44', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('62', '10', '珠宝首饰', '22', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('61', '9', '鲜花礼品', '11', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('60', '8', '图书音像', '12', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('59', '7', '母婴/儿童用品', '16', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('58', '6', '女性/内衣', '5', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('57', '5', '家居家饰', '24', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('56', '4', '美容化妆', '41', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('55', '3', '手机/数码/家电', '36', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('54', '2', '服装服饰', '61', '1', '2013-02-02 11:09:00');
INSERT INTO `jgjsys_yqf_webcat` VALUES ('53', '1', '综合商城', '55', '1', '2013-02-02 11:09:00');

-- ----------------------------
-- Table structure for `jgjsys_yqf_website`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_yqf_website`;
CREATE TABLE `jgjsys_yqf_website` (
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
) ENGINE=MyISAM AUTO_INCREMENT=551 DEFAULT CHARSET=utf8 COMMENT='单个商家网站的详细信息\r\n@author   和蔼的木Q\r\n@version  2013-12-07';

-- ----------------------------
-- Records of jgjsys_yqf_website
-- ----------------------------
INSERT INTO `jgjsys_yqf_website` VALUES ('1', '3690', 'FragranceNet', '海淘客户，详见活动介绍', '26', 'http://image.yiqifa.com/ad_images/reguser/24/2/2/1374044338494.jpg', 'http://p.yiqifa.com/n?k=pm4vKnXKrI6HWlwLWnUH2mquUZgL18H_UmUmf9MS35US35eEM5eyUIeEYOsH2mLErntmWEKern3FWEz71ZLLrI6HYmLErJPE6ERLWNWerIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('2', '3611', '魅力惠', '魅力惠是一个会员邀请制的在线购物社区，每天都会推出一个或多个以某品牌为主题，乐趣横生的限时抢购活动。活动中销售的商品价格仅为其市场价格的3至7折。在日本和中国，有350多个国际知名品牌已经授权魅力惠作为其网上零售的合作伙伴，因此，您在购买了超值商品之后，更能同时享受品牌专柜完全相同的售后服务。在魅力惠，有时尚采购专家致力于为您精心挑选最优质的商品，有专业时尚顾问为您提出购买和使用建议，我们共同的使命是为会员提供便捷、快乐的超值购物体验。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/38/6/1308133620847.jpg', 'http://p.yiqifa.com/n?k=MBPqNBU2rI6HWNDF6E4H2mquUZgL18H_UmUmf9Ux35s_UQ2VROBxMQWd3OoVf96drI6H2mLs6l2srn3FWEz71ZLLrI6HYmLErnjm3N68W9gbrIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2011-06-04 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('3', '3612', '优E网', '优e网-100%正品保证。优e网优品生活优e购中国首家优品生活购物网站-优e网网满足的是高端精英消费群体的优品生活需求，承诺的是从衣食住行的全方面优质产品系列。同时，优E网结合线上线下复合型的零售渠道，规避了电子商务只在后台运作而不直接接触客户的弱点，从产品体验和售后服务方面为客人提供了从屏幕后到柜台前的强有力支持。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/36/60/1324433879077.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6l3lrI6HCZg7Rnu_fmUmUSesM5sbYJLd3OoVfmLErI6H6NwFWZLO1n2F6nbHWZLErJoH2mLeM5KeMn3F6ZqDYn47YmyH&e=API090507&spm=138655627865015183.1.1.1', '2%-14%', '2011-08-03 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('4', '3613', '赛特春天', '赛特春天/SAITE.COM是赛特集团的官方电子时尚精品百货店，是时尚、零售与互联网三强联手打造的电子商务平台。赛特春天是由中国高端百货连锁业界的零售巨头中国春天百货集团领衔，前微软亚洲研究院的互联网精英开发，联袂资深的时尚人士，精心打造的网络时尚的新天地。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/47/15/1323848911388.jpg', 'http://p.yiqifa.com/n?k=p54gC9b5rI6HWNw76E4H2mquUZgL18H_UmUmfc6bCQgyf96_YpoH2mLErn37WNPH6EzS1nDFrnXH2mq_rI6H65DeM9Wq6J6H2L--&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2011-12-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('5', '3602', '寺库', '寺库中国以”让天下没有闲置资源”为己任，是中国首家奢侈品寄卖交流专业平台，也是目前国内规模最大、品类最全的高端奢侈品折扣平台。由库会所、寺库奢侈品网（secoo.com）、库支付、secoo奢侈品鉴定评估技术中心、奢侈品职业技能培训中心、奢侈品售后服务技术中心组成。寺库中国由美国IDG资本和香港寺库投资集团联合投资经营，是全国寄卖工作委员会会长单位。目前平台拥有实名制高端会员超过50万。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/42/10/1314184928881.jpg', 'http://p.yiqifa.com/n?k=2mLErntO1NzSrI6HCZg7Rnu_fmUmUSelM56_YSeEYO7_rI6H2mLOWnRern3FWEz71ZLLrI6HYmLErnj7396wWJMyrtVy6Oye5ZL-&e=API090507&spm=138655627865015183.1.1.1', '3.0%', '2011-08-25 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('6', '3604', '有好网', '中国最大的国际名牌购物网站-有好网。以具有丰富的海外和国内电子商务经验的职业经理人为管理核心致力于打造中国最诚信的时尚名牌的购物网站。通过成熟的网络和快捷的服务取得了良好的口碑和丰富的经验。公司在国外拥有最先进的电子商务平台，让中国消费者体验前所未有的知名品牌的优惠价格以及专业先进的电子购物服务。', '26', 'http://image.yiqifa.com/ad_images/reguser/56/24/40/1301706960421.JPG', 'http://p.yiqifa.com/n?k=2mLErntS6nDSrI6HCZg7Rnu_fmUmUSe8UQy9C5eyf9eyUZLErI6H6NDFWcLO1n2F6nbHWZLErJoH2mLlWOPy1NK73QqyRyBhMEbH&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2011-03-31 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('7', '3605', '美西时尚', '美西时尚作为国内领先的高端时尚电子商务网站，引进众多国际顶级品牌的新款商品，如:芬迪、古奇、缪缪等，其中包括时尚包包、配件鞋帽、男女服饰等，让用户以中等价位就能享受奢华品质，体验尊贵生活。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1322550938465.jpg', 'http://p.yiqifa.com/n?k=2mLErntF1njlrI6HCZg7Rnu_fmUmUSeVM5yECpeEYOsH2mLErn3l1NPH6EzS1nDFrnXHCBbKWsAlrJoH2mLF3Ey8ME696ZLE&e=API090507&spm=138655627865015183.1.1.1', '6.0%', '2011-11-30 00:00:00', '2013-11-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('8', '3606', '尚品网', '尚品网（shangpin.com）是一家专注国际顶级奢侈品品牌经营的大型B2C电子商务网站，通过搭建中国真正的会员邀请制私卖平台，致力于让每一位会员享受奢侈品带来的最新时尚潮流和惊喜价格，秉承”尚奢华，品人生”的理念，用最奢华的风格去呈现高端生活品质，用最尊享的服务体验去诠释顶级奢侈品文化。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/51/51/1330060811514.jpg', 'http://p.yiqifa.com/n?k=2mLErnRmWE4H2mquUZgL18H_UmUmfc6u35ecRJydf96_YQLErI6H6nzs1ZLO1n2F6nbHWZLErJoH2mLqW9Bw3OtsWcq71tPmpJoH&e=API090507&spm=138655627865015183.1.1.1', '0.0%-10.5%', '2010-07-28 00:00:00', '2013-07-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('9', '3607', '珍品网', '珍品网（http://www.zhenpin.com/），国内首家专注于全球潮流奢品的网络零售商，致力于打造成一个以销售全球最新、潮流和经典奢侈品为主的网络购物平台，并最终将成为一个知名的全球潮流奢品网络零售商。网站由纽交所上市公司学而思教育集团创始人曹允东先生投资创办，注册资本1000万人民币，2011年6月，珍品网正式上线，初期投资2000万美金，创始团队由来自北京大学、清华大学、浙江大学和香港中文大学等名校的热血青年组成，大部分拥有大型B2C公司或者上市公司经验，如京东、腾讯、金山等。目前团队已发展至70多人。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1318138473766.jpg', 'http://p.yiqifa.com/n?k=2mLErntm1NzSrI6HCZg7Rnu_fmUmUSevCJPdRJydf96_YQLErtVwgn4MRcLOWEzLrn3FWEz71ZLLrI6HYmLErnRe1JKFMNy9rIW-&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2011-10-10 00:00:00', '2013-10-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('10', '3608', '商品奥莱', '尚品——中国领先的奢侈品与高端时尚全购物平台，旗下拥有尚品网（www.shangpin.com）和尚品奥莱两家网站。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1345198818506.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWl3SrI6HCZg7Rnu_fmUmUSebYOqbCpeEYOsH2mLErn3m1NbH6EzS1nDFrnXHYyBupEUArJoH2mqwWEP9ME693QLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-10.5%', '2012-08-19 00:00:00', '2013-08-18 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('11', '3609', '第五大道', '第五大道奢侈品网（www.5LUX.COM）中国最大的全球知名品牌在线销售中心，与欧美数百家国际时尚品牌倾力合作，通过品牌商、代理商官方正式授权或从授权经销商买断销售的方式，向中国都市白领提供包括LouisVuitton，ChanelGucciPradaVersaceCoach等500余个从顶级到一二线国际时尚品牌商品，产品囊括服装、箱包、珠宝、手表、时尚家居、顶级红酒等，为注册会员提供3-8折尊享折扣，让中国消费者能以合理的价格，享受世界一流品牌的高贵品质。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/58/6/1337652665237.jpg', 'http://p.yiqifa.com/n?k=D5A65NysrI6HWE2S6n4H2mquUZgL18H_UmUmfEPxUQzd3OoVrI6H2mLO6EWFrn3FWEz71ZLLrI6HYmLErJBbWEWLMNw7rIW-&e=API090507&spm=138655627865015183.1.1.1', '1.4%-4.2%', '2012-05-23 00:00:00', '2013-05-22 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('12', '3610', '走秀网', '走秀网是一家以服装、鞋类、化妆品、箱包、配饰等时尚用品为主营方向的零售电子商务企业，是华南区最大的b2c网站，中国时尚类商品电子商务第一名。利用公司在海内外的采购能力，同时供应超过万种比传统百货商店便宜的超值商品，并针对网络购买行为进行了购物流程优化，提升购买率。欢迎站长投放。', '26', 'http://image.yiqifa.com/ad_images/reguser/24/59/5/1355907732409.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WQLErJb7UZjvfSomUmRdkJysf96_YQLErJBFUnbNMmLlWn4H6EzS1nDFrnXH2mq_rI6H6nD7M94E3lgH2L--&e=API090507&spm=138655627865015183.1.1.1', '0%-9%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('13', '3695', '奥特莱斯', '奥特莱斯是一家品牌折扣商场，每月都会精选各种知名品牌做各种低价活动。商品包括：商务男装、时装、箱包、皮具、配饰等琳琅满目。', '25', 'http://image.yiqifa.com/ad_images/reguser/24/63/1/1378885912537.jpg', 'http://p.yiqifa.com/n?k=CtyLDczFrI6HWlwm1NbH2mquUZgL18H_UmUmf9osUJqyUZWl6EKd3OoVrI6H2mLq6lDLWZLO1n2F6nbHWZLErJoH2mqy6J2s1nBw3cLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-21%', '2013-08-30 00:00:00', '2014-08-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('14', '3501', '天品网', '天品网（tianpin.com）”天天品牌特价”是上海赢富电子商务有限公司旗下网站，2012年6月成立于上海漕河泾高新技术开发区。公司现有商品、内容、市场、产品、技术、UED、客服等多个部门，团队成员大多来自于淘宝、凡客、盛大、腾讯等国内知名互联网以及电子商务企业，并由全球知名的风险投资机构投资组建。天品网致力于打造成为消费者喜闻乐见的时尚消费网站，以超低折扣给消费者提供品牌正品为经营理念，争取五年内成为中国电子商务行业中的佼佼者。', '25', 'http://image.yiqifa.com/ad_images/reguser/24/25/57/1345026371160.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWNzSrI6HCZg7Rnu_fmUmUSe7C5BdRJydf96_YQLErI6H6ERF1QLO1n2F6nbHWZLErJoH2mL7W96b6l4y1Qqf1ZuqRtyH&e=API090507&spm=138655627865015183.1.1.1', '0.03%-15.0%', '2012-08-16 00:00:00', '2013-08-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('15', '3502', '唯品会', 'vipshop.com名牌时尚折扣网，一个新型的网上购物平台，我们每周为您精选3~4个国际知名品牌，商品折扣低至2折限时限量售卖，商品囊括时装、护肤品、箱包、皮具、配饰、香水等等，琳琅满目。', '25', 'http://image.yiqifa.com/ad_images/reguser/24/24/8/1356855266742.jpg', 'http://p.yiqifa.com/n?k=UlMXMQBZrI6HWEzFWcLErJb7UZjvfSomUmRdU9yLROb_RIeEYO7_C5ewMQzdRJbLrI6H2mL7WntFrn3FWEz71ZLLrI6HYmLErnRqWn2FWE4wrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.77%-4.62%', '2009-06-25 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('16', '3503', '聚尚网', '聚尚网是中国首家国际名品限时特卖的购物网站，于2009年7月正式成立，总部位于上海，在香港、广州分别舍友分支机构。聚尚网收集全球时尚资源，经品牌商授权以正价1-5折的价格为消费者提供服装、鞋帽、饰品、箱包皮具等折扣品牌商品。', '25', 'http://image.yiqifa.com/ad_images/reguser/24/43/11/1331779257642.jpg', 'http://p.yiqifa.com/n?k=MsA8Ym4PrI6H1NRLWcLErJb7UZjvfSomUmRdM96xU52d3OeH2mLErnD7WNBH6EzS1nDFrnXH2mq_rI6H1NweW9g81ngH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.5%', '2010-01-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('17', '3504', '上品折扣网', '上品折扣连锁门店和上品折扣网销售网站，是北京市上品商业发展有限责任公司(BeijingShopinRetailDevelopmentCo.Ltd.)旗下专门从事零售百货业中名牌商品折扣价格销售的连锁实体门店和网络销售平台。上品折扣的经营门类涵盖百货业态的主要商品品类，包括各种知名品牌的服装、服饰、鞋、运动用品、休闲户外用品、儿童用品、家居生活用品、皮具箱包、化妆品、钟表、珠宝、各类饰品等，其销售价格是一般百货商场或购物中心中相同品牌商品的2-5折。', '25', 'http://image.yiqifa.com/ad_images/reguser/24/30/62/1294906748659.jpg', 'http://p.yiqifa.com/n?k=2mLErntqWnjSrI6HCZg7Rnu_fmUmUSelCJoLC5FdY9P7rI6H2mLsWljSrn3FWEz71ZLLrJA!5QjsCZq_rI6H35WFMn2eWOgH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2011-01-14 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('18', '3659', '雅昌影像', '雅昌影艺，国内首家专注影像艺术的电子商务平台。轻松鼠标一点，花上几十元到几百元，您就可以将世界各地摄影大师的作品带回家，妆点家居环境或馈赠亲友。更有数百万级的作品，在网站和实体连锁画廊，供您自由挑选并用于典藏与投资！', '24', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1376643810386.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6nDOrI6HCZg7Rnu_fmUmUSebRcgsRIeEYOsH2mLErntmWl2mrn3FWEz71ZLLrI6HYmLErnWOWlDsM9PyrnPl39tOkcL-&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2013-08-01 00:00:00', '2014-07-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('19', '3673', '优彩网', '优彩网(www.228cai.com)是专注竞技类体育彩票（竞彩，北单，足彩）的专业彩票代购平台，全网首个提供返点与加奖的购彩网站，新用户充值20送20，加奖达至11%（全年支持），购彩有返点优惠等。开奖快，提现30分钟到账，免手续费，24小时在线服务，多项的服务为彩民提供一个专业，贴心，优惠的购彩平台。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/26/6/1375145423735.jpg', 'http://p.yiqifa.com/n?k=RNbhWJeDrI6HWlwS6nbH2mquUZgL18H_UmUmfE2S1J6bCpeEYOsH2mLErntmWl2Lrn3FWEz71ZLLrI6HYmLErnB86JBE3EKSrIW-&e=API090507&spm=138655627865015183.1.1.1', '4.5%', '2013-07-31 00:00:00', '2014-07-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('20', '3674', '139彩票网', '139彩票网是彩民中奖的福地，专业安全的彩票代购合买平台，涵盖福彩、体彩、足彩、竞彩、快频等彩种，奖金优化、智能过滤功能齐全，专家预测、足球数据资讯丰富，不仅线上投注截止时间最晚，而且即时开奖、随时提现，提现无需手续费服务更贴心。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1375146051050.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6E2SrI6HCZg7Rnu_fmUmUSFqWlyE35wd3OoVrI6HMByn6E4_rntmWl2qrn3FWEz71ZLLrI6HYmLErJtl153L6ODFrIW-&e=API090507&spm=138655627865015183.1.1.1', '4.2%', '2013-07-31 00:00:00', '2014-07-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('21', '3677', '中国电信(北京)', '北京电信作为中国电信北京地区的子公司可以有效的整合区域内资源，为合作提供便利。北京电信电子渠道专注于互联网平台的移动产品销售服务，主营产品包括C网合约机、预付费、后付费号卡以及无线宽带产品', '24', 'http://image.yiqifa.com/ad_images/reguser/24/12/12/1373440888716.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6NKOrI6HCZg7Rnu_fO4hfEtF1peEYcLErJ4B1ZAMKmLq6l2F1ZLO1n2F6nbHWZLErJoH2mLFM92e3N2O3cLE&e=API090507&spm=138655627865015183.1.1.1', '0-210元', '2013-07-11 00:00:00', '2014-07-10 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('22', '3721', '万仟堂cps(天猫店)', '<p>万仟堂艺术品有限公司善用陶土诠释东方美学，籍以众多陶艺大师与能工巧匠代代相传。她致力于还原陶艺产品实用形象，传承宋朝&quot;四艺生活&quot;,并在艺术与生活之间寻找到合理的平衡。万仟堂旗下四大产品体系：茶器、香器、花器、艺术品，无一不在设计上表达出一种超越豪华奢侈的简洁，倡导质朴优雅的生活格调。集研发、生产、销售为一体的商业模式，保证其产品及品牌的生命力；通过商铺和网络与顾客保持交流，忠实地表达万仟堂的品牌精神，时时关心艺术，刻刻关注生活</p>', '24', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1384244739524.jpg', 'http://p.yiqifa.com/n?k=2mLErnDL6nKFrI6HCZg7Rnu_fmUbYcBA35e735ecfcgV35qxf96_YpoH2mLErntm6nzern3FWEz71ZLLrBgvWQbJ1Qq_rI6HMN696NRS69gH2L--&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的5%', '2013-11-05 00:00:00', '2014-11-04 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('23', '3710', '中国电信(江苏)', '<p>&nbsp;中国电信江苏网上营业厅（js.189.cn）是为了方便客户办理和查询各类业务而开办的专用网站，用户登录网上营业厅可以自助办理各种业务，进行业务查询、充值交费、购买手机、办理宽带、在线入网、积分兑换等，还可参加各项精彩的促销活动。尽享多快好省、7*24小时不打烊的优质服务。</p>', '24', 'http://image.yiqifa.com/ad_images/reguser/24/51/51/1378888601973.jpg', 'http://p.yiqifa.com/n?k=2mLErnDLWn3lrI6HCZg7Rnu_fOAlfEtF1peEY8o8UQ6lC5eyRmW_RJBcMpodMQR_C5ewMQzdCZgVYZLErI6HWNR7WEgH6EzS1nDFrnXH1PBuRwM7rJoH2mLsWlMEWlMwWmLE&e=API090507&spm=138655627865015183.1.1.1', '4.9%-5.6%  14-35元/单', '2013-09-12 00:00:00', '2014-09-11 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('24', '3701', '彩票宝', '彩票宝（www.cpbao.com）秉承“娱乐 公益 诚信 责任”服务宗旨，为全国广大彩民提供更快速的体育竞技资讯、彩票资讯；立志成为最值得信赖的互联网、移动互联网彩票信息服务平台', '24', 'http://image.yiqifa.com/ad_images/reguser/24/62/62/1378359251224.jpg', 'http://p.yiqifa.com/n?k=p56nNyULrI6HWlweWNXH2mquUZgL18H_UmUmf96L39B_f96_YQLErI6HWNR7WnPH6EzS1nDFrnXH2mq_rI6HWJDS3lwO6lgH2L--&e=API090507&spm=138655627865015183.1.1.1', '4.9%', '2013-09-03 00:00:00', '2014-09-02 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('25', '3615', '每天一荐', '每天一荐于2013年5月18日上线，是目前中国最新上线的化妆品电商购物网站，提出‘每天限单销售’经营模式，提供独一无二的优质客户体验，并成为国内第一家每天限单销售的电商网站。网站经营国内外知名化妆品牌，所有销售单品，均为爆款。每天一荐正在向成为中国最受欢迎的化妆品垂直B2C电商网站跑步前进，让我们共同期待！', '24', 'http://image.yiqifa.com/ad_images/reguser/24/25/57/1371709058460.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6EKOrI6HCZg7Rnu_fmUmUSeVM5y7C5Bdk5yhC5Bdf96_YpoH2mLErntmWE2qrn3FWEz71ZLLrJy_KsjqMcq_rI6HMERs6ODsWOPH2L--&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2013-06-06 00:00:00', '2014-06-05 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('26', '3624', 'webitraderCPS', '', '24', 'http://image.yiqifa.com/ad_images/reguser/24/31/1/1373364598257.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF1nwmrI6HCZg7Rnu_fmUmUSemM54AUZ4bMJPSf96_YQLErI6HWNRS6E4H6EzS1nDFrnXHRts3YsXxrJoH2mqwWJgy1NBw6cLE&e=API090507&spm=138655627865015183.1.1.1', '140元', '2013-06-28 00:00:00', '2014-06-27 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('27', '3628', '我秀', '我秀是一个开放、免费的网络直播平台；主播利用视频方式进行网上现场直播，可以将才艺展示、交友聊天、互动游戏发布在直播间。粉丝可进行礼物赠送、文字聊天、观看视频、点歌等互动方式与主播加深交流。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/52/12/1373964097805.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6lzmrI6HCZg7Rnu_fmUmUSemYmbAUpeEYOsH2mLErntmWE3Orn3FWEz71ZLLrnUTMZBnCcq_rI6H6lRFWlywMEXH2L--&e=API090507&spm=138655627865015183.1.1.1', '16.1%', '2013-07-02 00:00:00', '2014-07-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('28', '3630', '有道翻译', '有道专业翻译是网易旗下的人工翻译平台，是有道词典和有道翻译的增值服务，目前提供英日俄法和中文的笔译服务，专业译员在线翻译，最快一分钟反馈翻译结果，专家译员多重审校，保障质量，是国内最快最具性价比的人工翻译。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/43/11/1372902210215.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF1nwOrI6HCZg7Rnu_fO3dk5osMJB_f96_YQLErI6HWNRS6lMH6EzS1nDFrnXHkPAZPto8rJoH2mqwWOWO3O2FWZLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-7%', '2013-07-05 00:00:00', '2014-07-04 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('29', '3634', '彩客彩票', '彩客网(www.310win.com)是肇庆市创威发展有限公司旗下的专业彩票网站，以互联网彩票资讯业务和彩票电话交易业务为核心，为中国彩票爱好者提供 365×24 小时的彩票代购服务。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/52/12/1373016917321.jpg', 'http://p.yiqifa.com/n?k=gBylKOq9rI6HWlze1ngH2mquUZgL18H_UmUmfEWqWZUAY8eEYOsH2mLErntmWERern3FWEz71ZLLrI6HYmLErJteWnBb6NWsrIW-&e=API090507&spm=138655627865015183.1.1.1', '4.2%', '2013-07-06 00:00:00', '2014-07-05 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('30', '3637', '砭道网', '砭道网以泗玥石（泗玥石）为载体开发相关产业，经多年发展已先后成立“北京京港澳中医药研究院砭石科技开发部”（2004年）、“北京泗玥石复古皇家乐队——东方石乐”（2005年）、“泗玥石医疗器械有限公司”（2007年）、“北京泗玥砭道文化传播有限责任公司”（2009年）、“北京泗玥石美容有限公司”（2010年）五家专业公司', '24', 'http://image.yiqifa.com/ad_images/reguser/24/58/6/1374637206157.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWn2FrI6HCZg7Rnu_fmUmUSe8C5BdRObAWl3Lf96_YQLErI6HWNRS6EBH6EzS1nDFrnXHC9U2YlBCrJoH2mqwWEXy1NWS3cLE&e=API090507&spm=138655627865015183.1.1.1', '5.6%——7%', '2013-06-27 00:00:00', '2014-06-26 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('31', '3638', 'colornameCPS', '創立於97年12月18日，由三位創業伙伴著眼於web2.0發展趨勢，以「大家一起合資買禮物送給壽星」的概念，提出全球第一個「網路合資金流電子商務平台」。這個概念與pchome的直接購買、代購、groupon的大家一起揪團以量制價的團購都不同，這個電子商務平台的著眼點是「大家一起出錢買東西送給收禮物的那個朋友，可以應用在生日、彌月、結婚、入厝等場合」。在這些時機，藉由買願望的合資送禮平台，可以省去誰去買？誰收錢？誰將禮物帶給收禮者的問題。因為這個概念，mywish團隊參加了資策會舉辦的第二屆web2.0培育團隊選拔，獲選為遠傳電信培育團隊，從此一頭栽進了網路創業的不歸路。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1366712776666.jpg', 'http://p.yiqifa.com/n?k=PNbTR7gprI6HWlzm1nbH2mquUZgL18H_UmUmf96_YJoSY9BVMpeEYO7d3OeH2mLErntmWNWlrn3FWEz71ZLLrI6HYmLErn6wMEU8M53LrIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-04-24 00:00:00', '2014-04-23 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('32', '3639', '卡卡印', '卡卡印成立于2006年9月，由万户集团旗下北京万户名媒科技有限公司研发和运营的互联网设计和印刷服务网站，通过整合互联网技术和数字印刷和胶印技术，向广大用户提供创新的、专业的自助设计和印刷服务', '24', 'http://image.yiqifa.com/ad_images/reguser/24/7/57/1374116472131.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWNtOrI6HCZg7Rnu_fmUmUSei35Vbk5ydf96_YQLErJV1MJeDUZLq6l2eWQLO1n2F6nbHWZLErJoH2mLe6O2S1nWeWmLE&e=API090507&spm=138655627865015183.1.1.1', '17.5%', '2013-07-12 00:00:00', '2014-07-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('33', '3640', 'PICC人保车险', '中国人民财产保险股份有限公司（PICC P&C，简称“中国人保财险”）是经国务院同意、中国保监会批准，于2003年7月由中国人民保险集团公司发起设立的、目前中国内地最大的财产保险公司，注册资本122.5598亿元。其前身是1949年10月20日经中国人民银行报政务院财经委员会批准成立的中国人民保险公司。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/28/4/1375342799523.jpg', 'http://p.yiqifa.com/n?k=U94_NJ64rI6HWlwS6lXH2mquUZgL18H_UmUmf9PLC56Ef96_YpeEYcLErI6HWNRSWEXH6EzS1nDFrnXH2mq_rI6H3OWlWEyyW9BH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-06-06 00:00:00', '2014-06-05 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('34', '3650', '易彩网', '易彩网（www.yicaiwang.com.cn）是一家通过互联网为广大彩民服务的彩票娱乐平台。我们致力于为彩民提供更快、更全、更优的各类彩票服务，倾力打造方便、诚信、好玩的大型彩票交流平台。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1375252757968.jpg', 'http://p.yiqifa.com/n?k=6cUER7gcrI6HWlwq6nBH2mquUZgL18H_UmUmfcyA3OBA6NjLf96_YQLErI6HWNRlWngH6EzS1nDFrnXH2mq_rI6HWN48W5KmWnPH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2013-07-25 00:00:00', '2014-07-24 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('35', '3651', 'PICC人保车险', '中国人民财产保险股份有限公司（PICC P&C，简称“中国人保财险”）是经国务院同意、中国保监会批准，于2003年7月由中国人民保险集团公司发起设立的、目前中国内地最大的财产保险公司，注册资本122.5598亿元。其前身是1949年10月20日经中国人民银行报政务院财经委员会批准成立的中国人民保险公司。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/28/4/1375342799523.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWERLrI6HCZg7Rnu_fmUmUSeyRJyE3SeEYO7d3OeH2mLErntmWE2Lrn3FWEz71ZLLrZBIKJgtMcq_rI6H3OWlWEyyW9BH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-07-25 00:00:00', '2014-06-05 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('36', '3406', '365翻译', '365翻译隶于2011年正式上线。现已逐步成长为国内领先的新一代语言服务提供商。它由海归学子及国际顶级投资机构共同倾力打造。前身是一家具有近十年翻译服务经验的工作室，主要依托于北京、上海、广州等各大外语学院的专家团队，向中国政府、国内外大型企业提供笔译口译服务。我们的目标从互联网的高度诠释语言服务，打造新一代语言服务商业模式。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/47/15/1357782810108.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWE2SrI6HCZg7Rnu_fmUmUSFl6EP935eeCpeEYOsH2mLErnRLWnMH6EzS1nDFrnXH6my31tsMrJoH2mLF352qW548WQLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-7.0%', '2013-01-11 00:00:00', '2014-01-10 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('37', '3407', '必赢网', '必赢彩票是广州乐投科技有限公司旗下一个高端的彩票投注网站。广州乐投信息科技有限公司成立于2010年，是中国电子商务领域最受欢迎和最具影响力的电子商务运营商之一。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/13/51/1346728848341.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6NDSrI6HCZg7Rnu_fmUmUSFs39yeC5ecf96_YpH0ROy7MN7q1NXH2mLErn3FWlBH6EzS1nDFrnXH2mq_rI6HW568Wl2OWOMHpOMVKOASrj--&e=API090507&spm=138655627865015183.1.1.1', '4.2%-5.5%', '2012-09-05 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('38', '3408', '发彩网', '发彩科技信息有限公司（”发彩”）是由浙江大型集团与海外著名彩票运营公司联合投资创建的专业型彩票运营公司，是一家专注于中国公益彩票事业的高科技公司。公司自创建起，一直致力于互联网、移动设备的彩票平台开发和运营，传统彩票销售门店的管理和营销，凭借现代化的服务理念、精细化的产品思路、成熟化的技术平台，积极稳健的推动中国公益彩票事业的发展。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/56/56/1344397280917.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWl2SrI6HCZg7Rnu_fmUmUSFF6lwqf96_YQLErI6H6ERmWQLO1n2F6nbHWZq1UKUpDKqHYmLErJM86l6w6nzFrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2012-08-07 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('39', '3409', '我中啦彩票网', '北京睿朗阳光网络科技有限公司是一家多年完全致力于中国公益彩票事业，提供全方位彩票及彩票相关服务的提供商。睿朗阳光是国内提供综合性彩票服务的龙头企业。睿朗阳光以中国市场为技术研发基地以互联网技术、电信技术、无线应用技术为依托，将创新的技术与传统的彩票产业相结合，面向全球彩票服务市场，提供一揽子彩票相关服务，包括彩票系统的研发、电话与手机彩票销售系统建设，及彩票产品创新等。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/17/15/1317110896871.jpg', 'http://p.yiqifa.com/n?k=2mLErntmWlDSrI6HCZg7Rnu_fmUmUSemYmAuYOecYJtd3OoVfmLErBb_UmPMDQLOWNRsrn3FWEz71ZLLrI6HYmLErnb9MNRmWNDqrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.5%-9.0%', '2011-09-15 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('40', '3410', '新网', '北京新网数码信息技术有限公司成立于1993年，是香港联交所上市公司中国数码集团旗下的国内顶级的互联网基础应用服务提供商。业务范围包括域名注册服务、主机服务和电子邮箱服务等', '24', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1360049224428.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6NjSrI6HCZg7Rnu_fmUmUSeFC5edMQDd3OeH2mLErnRLWNgH6EzS1nDFrnXHN5y!gy4erJoH2mLLMNKLWNDS1ZLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-11.2%', '2013-01-18 00:00:00', '2014-01-17 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('41', '3411', '128彩票网', '上海德彩誉富网络科技有限公司(以下简称”德彩”)，总部位于上海，为全国数亿主流彩民提供全方位、多领域的咨询及服务，是彩票行业领先的无纸化多媒体门户矩阵平台，集彩民娱乐、交流，提供全国各大联销型彩票在线合买、代购等服务为一体的综合性彩票网络平台', '24', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1348638650573.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WEjlrI6HCZg7Rnu_fmUmUSFqWEbE35wd3OoVrI6Hg7eCP5omrn3F1nBH6EzS1nDFrnXH2mq_rI6H6O4EWN27WnBH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.0%-6.5%', '2012-09-27 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('42', '3412', '改图网', '改图网（gaitu.com），是国内最早的图像创意网站，一直致力于图像设计和印刷领域。凭借”快速设计，快速印刷，快速配送”的产品服务特性，充分满足用户日益增长的印刷需求及多元化设计体验，现已成为中国最具影响力、最受用户喜爱的网络设计印刷平台。目前的产品有名片，宣传单，logo，喜帖。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/58/58/1347507525252.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1N3SrI6HCZg7Rnu_fmUmUSec35y7UpeEYO7_rI6H2mLO1nDern3FWEz71ZLLrJxs5w6_pmq_rI6H3EDlWEtlMnPH2L--&e=API090507&spm=138655627865015183.1.1.1', '4.2%-14%', '2012-09-15 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('43', '3414', '史泰博', '史泰博(Staples)是全球领先的办公用品公司，世界500强企业。经营纸张、耗材、文具、设备、日常用品等十大类数万种办公用品。100%正品承诺，可开增票，网站、电话、门店多种订购渠道，为企业和个人提供送货上门的一站式服务。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/18/50/1325043138172.jpg', 'http://p.yiqifa.com/n?k=2mLErn271NzSrI6HCZg7Rnu_fmUmUSelUJBLYJPlf96dfmLErI6H6ED71ZLO1n2F6nbHWZLErJoH2mLe6OgE6NzOMQqmPmt7PEMH&e=API090507&spm=138655627865015183.1.1.1', '3.5%-7.0%', '2011-12-29 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('44', '3416', '中国足彩网', '中国足彩网于2001年11月上线运营，隶属于民政部中国社工协会国企上市公司第一视频集团(香港主板股票代码00082.HK)旗下的专业彩票资讯网站，公司拥有雄厚的资本实力、强大的研发能力、丰富的运营经验、精湛的技术能力、人性化的客户服务能力，是目前国内彩票行业内唯一一家具有国企上市公司背景的专业彩票资讯网站。中国足彩网在国家政策的指引下，一直致力于公益事业及公益彩票的宣传推广，结合视频传播、专家说彩、彩民微博、专家推荐、专家预测、软件等产品，通过手机和互联网为彩民构建了一个360度的彩民生活圈。得到各界的一致好评，连续三年获得彩票行业品牌冠军，多次被评为”网上交易保障单位”、”可信网站”等荣誉称号。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/7/57/1333683116509.jpg', 'http://p.yiqifa.com/n?k=2mLErn2qWn2SrI6HCZg7Rnu_fmUmUSevMmAEUSeEYO7_rI6H2mLO6N37rn3FWEz71ZLLrI6HYmLErnwO6NBw1nyyrZg_KnBE5QL-&e=API090507&spm=138655627865015183.1.1.1', '2.0%-5.5%', '2012-04-07 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('45', '3417', '易淘食', '易淘食是国内首家一站式网络餐饮功能性平台，为顾客提供订位、订餐、支付、配送等一站式服务。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/55/9/1337572741861.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWnDSrI6HCZg7Rnu_fmUmUSeyUJB_RObAf96_YQLErI6H6E3l6cLO1n2F6nbHWZqq6OVmPmbHYmLErnKS6ntl6N3SrIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%-14.0%', '2012-05-22 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('46', '3419', '保网', '保网是泛华保险销售服务集团（纳斯达克股票代码：CISG）旗下的专业第三方保险交易与服务平台，是国家级高新技术企业。该平台集合了人保、太保、阳光、美亚等众多保险公司的特色产品，涵盖意外险、旅游险、签证险等多类型险种，成为可供客户按需自助选择的保险超市，能为消费者提供一站式的在线查询、比较和投保等功能。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/54/54/1367023954406.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1n3SrI6HCZg7Rnu_fmUmUSe835oFC5Bdf96_YpoH2mqP6QUNYOAH6ltL6mLO1n2F6nbHWZLErJoH2mL7W9gyMnDq6mLE&e=API090507&spm=138655627865015183.1.1.1', '2.1%-14%', '2013-04-10 00:00:00', '2014-04-09 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('47', '3421', '金山快盘', '金山快盘是金山软件基于云存储推出的免费同步网盘服务，服务用户超过1500万。 金山快盘具备文件同步、文件备份和文件共享功能，平台覆盖Windows / Mac / Android / iPhone / iPad / Web等六大平台，只要安装快盘各客户端，电脑、手机、平板、网站之间都能够直接跨平台互通互联，彻底抛弃U盘、移动硬盘和数据线，随时随地轻松访问您的个人文件。公司电脑和家里电脑自动同步文件，再也不用U盘硬盘了。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/55/55/1366013795635.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1nDLrI6HCZg7Rnu_fmUmUSeiU5BARJBdf96drI6H5tReYZBNrntmWNtern3FWEz71ZLLrI6HYmLErJ3s1NWm6NDmrIW-&e=API090507&spm=138655627865015183.1.1.1', '2.1%-14%', '2013-05-13 00:00:00', '2014-04-15 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('48', '3422', '七天连锁酒店', '7天连锁酒店集团创立于2005年，2009年11月20日在美国纽约证券交易所上市（股票代码：SVN）。作为第一家登陆纽交所的中国酒店集团，7天连锁酒店秉承让顾客“天天睡好觉”的愿景，以直销低价模式，快乐自主的服务理念，致力为会员提供干净、舒适、快乐的住宿环境和氛围，满足客户的核心住宿需求。目前已拥有分店超过1000家，覆盖全国127个主要城市，业已建成经济型连锁酒店全国网络体系。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/19/51/1365581307688.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1NjerI6HCZg7Rnu_fOKd6OgbkQ6AY9Fd3OF_Y5BSCOP7fmgS356ifcXuRZLErI6H6ltqWcLO1n2F6nbHWZqfP7tqR7MHYmLErnMyWnzs1NUErIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2013-05-14 00:00:00', '2014-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('49', '3423', '华阳彩票', '华阳彩票是第一家国企投资的彩票网站，隶属中国华阳经贸集团(成立于1984)，华阳彩票网（http://www.198tc.com）专注彩票信息服务，提供及时权威的开奖号码、详实清晰的数据图表、安全稳定的交易平台、自动化分票系统。网站拥有一支彩票资深人士，和IT精英骨干组成的高效团队，使华阳彩票网成为彩民喜爱的中奖福地。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/11/11/1366947045213.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWnWFrI6HCZg7Rnu_fmUmUSFq1Nb73SeEYO7_rI6H2mLq6lt76QLO1n2F6nbHWZLErJoH2mLL3O3e1J6E3QqBk5gTgEBH&e=API090507&spm=138655627865015183.1.1.1', '4.2%', '2013-05-13 00:00:00', '2014-04-26 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('50', '3424', '达人工', '达人工由原58同城CTO崔金峰先生创立，达人个性化服务的买卖平台，线上服务买卖的超级市场！网站已获著名天使投资人徐小平旗下的真格基金百万美元投资。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/41/9/1368504351256.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWn3SrI6HCZg7Rnu_fmUmUSew3Q4yY9U_Y9Rd3OoVfmLErI6HWNRq6NyH6EzS1nDFrnXHUsbgY5yZrJoH2mLFWNgb1nzmWcLE&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2013-05-14 00:00:00', '2014-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('51', '3425', '龙泉宝剑', '龙泉宝剑厂创建于1956年，集生产、销售、科研为一体， 2003年龙泉宝剑厂主厂区进入龙泉大沙经济开发区，扩大了生产规模。并成立了龙泉宝剑厂有限公司。龙泉宝剑厂在1979年和1984年，分别向国家工商局分别注册了“ 龙泉宝剑”商标和“龙、凤、七星”图案商标。成为唯一正宗拥有此商标的专业生产厂家。龙泉宝剑厂有限公司下设有龙泉宝剑厂、龙泉刀剑厂、现有员工将近200人，其中专业铸剑技师58人，厂房占地面积18000平方，是继承中国历史传统产品“龙泉宝剑”的正宗专业厂家。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/38/58/1366860908108.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWntmrI6HCZg7Rnu_fmUmUSexYOecRQPbY8s835ohC5Bdf96_YQLErI6HWNRq6nBH6EzS1nDFrnXH2mq_rI6HM9De15Dq3lBHNl4EP9Vcrj--&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2013-05-10 00:00:00', '2014-05-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('52', '3426', '小邻居', '邻居以售卖原创正品为行动，以分享好东西为理念，反对品质差劣或影响健康的盗版产品充斥市场，希望减少伤害原创者和客户的双输局面，守护商家和客户的利益。目的是把高品质又价格合理的正品分享给大众，让更多人可以享受到富原创精神的生活品味和安全品质。小邻居创立网站至今的短短日子，已经获得不少知名的品牌和达人支持，例如大家耳熟能详的乐高、原型师、nanoblock、迪斯尼和NBA等等国际原创正品。小邻居的名字源自于原始的人际关系，希望线上的商家和客户之间，就像儿时邻居一样，关系轻松且亲切，有着互相守望的友善互动关系，当很多小邻居聚在一起，便会变成一个如村庄一样的社区，邻居之间互相交流生活点子和品味，商家亦能提供贴近客户需求的产品，造就良好沟通的平台。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1368519336540.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWNwSrI6HCZg7Rnu_fOsbYJLdY5Bdk5BxCQg7YJKd3OoVfmLErI6HWNRq6EbH6EzS1nDFrnXH2mq_rI6HMnUE1NbE1J6H5QBVpm4Nrj--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-05-24 00:00:00', '2014-05-24 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('53', '3401', '蚂蚁短租', '蚂蚁短租是赶集网旗下的一个高性价比和特色短租房的在线交易平台。蚂蚁短租有以下特色：1.性价比高：同样的价格可以享受更高品质的居住服务。2.安全放心：蚂蚁千万资金担保，租房安全无忧。3.租用期限：很灵活，可以按日、周、月等计算。4.短租特色：房间数量众多，分布广泛，并且很多极具特色。如：商业核心区高品质公寓、高校周边民居或宿舍、海景楼房、花园别墅、林间小屋等。如果您是租客：可以通过搜索找到满足您要求的房屋租住。租客预定房间后经过房东确认、支付订金即可看到双方的联系方式并进行入住。订金会在每天入住完成后支付给房东，以确保您的利益。如果您是房东：您也可以将自己的房间发布到蚂蚁短租进行出租，在享受缤纷生活的同时还可以获得不错的经济回报，何乐而不为？并且相比于传统的长租，短租形式将为您带来更多的经济回报。蚂蚁短租，啥短租房都有', '24', 'http://image.yiqifa.com/ad_images/reguser/24/4/4/1323069701297.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWnjSrI6HCZg7Rnu_fmUmUSeV3QyAf96_YpoH2mLErn37Wn4H6EzS1nDFrnXHWKg1Mc4brJoH2mq96nU9M9KqWcLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-12.0%', '2011-12-06 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('54', '3403', '5173', '5173是全中国最大的虚拟物品交易平台!5173成立于2002年11月，是一家专业提供网络游戏电子商务服务的高新技术企业，是中国领先，以规范化运营为己任的大型专业网游及数字产品在线交易电子商务平台。客服与运营中心在浙江金华，公司总部在上海，主要负责市场和产品的运营。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/27/59/1343617253262.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1Nj7rI6HCZg7Rnu_fmUmUSFsWNRlf96_YQLErI6H6ERs6cLO1n2F6nbHWZLErJoH2mLl1J69Wn49MQqBkZMQgngH&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2012-07-31 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('55', '3404', '猪八戒网', '猪八戒网由重庆猪八戒网络有限公司运营，是中国最大的一站式服务业电子商务网站。猪八戒网的目标是要做成全球最大的服务业交易平台，让每个人每个企业都能获得更诚信、更有保障的服务。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/50/14/1346903247474.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6N2SrI6HCZg7Rnu_fmUmUSevCZP835AAMpeEYOsH2mqd6mMTPPBH6ERm1QLO1n2F6nbHWZLErJoH2mLO352s39DmWcLE&e=API090507&spm=138655627865015183.1.1.1', '10.0%-13.0%', '2012-08-09 00:00:00', '2013-08-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('56', '3405', '彩票大赢家', '”彩票大赢家”是广大彩民家喻户晓的品牌。历时10年发展，已经成为中国领先的彩票销售服务商，拥有成熟的彩票销售平台、软件及客户端产品，覆盖网络、电话、手机、电视等各种媒体渠道，是彩票行业内公认的明星企业。是集彩民娱乐、交流，提供全国各大联销型彩票在线合买、代购和软件开发等服务为一体的大型彩票门户矩阵平台。', '24', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1350618508326.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWNDSrI6HCZg7Rnu_fmUmUSeERJgeC8eEYOsH2mLErn3eWnbH6EzS1nDFrnXH2mq_rI6H352S6ljOMEbHgEyWPy4irj--&e=API090507&spm=138655627865015183.1.1.1', '4.2%-6.3%', '2012-10-22 00:00:00', '2013-11-18 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('57', '3706', '百合网', '百合网是中国第一家实名制婚恋服务商，以“帮助亿万中国人拥有幸福的婚姻和家庭”为己任。2005年5月，百合网正式发布，并在中国首次推出“心灵匹配，成就幸福婚姻”的独特婚恋服务模式', '23', 'http://image.yiqifa.com/ad_images/reguser/24/63/1/1380265617811.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe1NwOrI6HCZg7Rnu_fmUmUSe835yuMpeEYOsH2mLErntm6nDLrn3FWEz71ZLLrI6HYmLErntm3ODSMEPErJPAknU!NcL-&e=API090507&spm=138655627865015183.1.1.1', '7%-11.9%', '2013-09-24 00:00:00', '2015-09-23 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('58', '3301', '六间房', '六间房秀场是获得国家文化部颁发的网络演出许可证的群众演艺网络平台, 秀场呈现形式是以主播和网友互动产生购买虚拟礼物分成的商务模式。在同行业领先且取得很好的商业回报。', '23', 'http://image.yiqifa.com/ad_images/reguser/24/46/50/1365647469650.jpg', 'http://p.yiqifa.com/n?k=2mLErn2m6nDSrI6HCZg7Rnu_fmUmUSFOf96dflolR9Wok5yqC5MbUZLErBXegPP2gmLmWNjLrn3FWEz71ZLLrI6HYmLErnDsWJW7WEb8rIW-&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2013-04-07 00:00:00', '2014-04-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('59', '3709', '7881游戏', '<p><font size=\'2\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\'http://www.7881.com\'>www.7881.com</a></font><span style=\'font-size: 9pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\'>隶属于江苏猎宝网络科技有限公司旗下网站<span lang=\'EN-US\'>,</span>致力于打造中国最受欢迎的网络游戏及数字产品交易的电子商务交易平台。为用户提供价廉物美的虚拟商品和完美的用户体验。同时提供手游交易，多种交易软件、自动化交易处理等行业独创的特色服务。</span></p>', '22', 'http://image.yiqifa.com/ad_images/reguser/24/4/4/1379516011877.jpg', 'http://p.yiqifa.com/n?k=2mLErnDLWnDLrI6HCZg7Rnu_fmUmUSFm1nzqf96_YQLErI6HWNR7WlMH6EzS1nDFrnXHDsMXgljSrJoH2mLm3OKs6nybMcLE&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的0.84%', '2013-09-19 00:00:00', '2014-09-18 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('60', '3418', '开心保保险网', '开心保网是全国性保险专业代理公司网金保险销售服务有限公司旗下网站，是目前中国技术领先的大型保险电子商务网站之一，同时也是网金保险销售服务有限公司面向全国范围内进行保险类产品销售与服务提供的综合性保险电子商务平台。', '21', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1355197437825.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWE3SrI6HCZg7Rnu_fmUmUSei35yFC5e835Hd3OoVfmLErI6H6EwO1ZLO1n2F6nbHWZqdNNbiptoHYmLErnPb6nKSWlzsrIW-&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2013-04-09 00:00:00', '2014-04-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('61', '3101', '阳光车险', '阳光保险(http://chexian.sinosig.com/)集团股份有限公司是国内七大保险集团之一，曾获亚洲500最具价值品牌、亚洲十大最具影响力品牌、中国金融企业慈善榜保险业突出贡献奖、理赔最迅速保险公司最佳成长性保险公司、中国企业500强（2011年度第307位）等多项荣誉，阳光保险秉承”打造最具品质和实力的保险公司”的公司愿景，致力于成为国际领先的保险金融集团。财险、寿险业绩名列前茅。阳光车险最近在行业内率先推出”阳光闪赔服务标准”（5千以下（非人伤），免单证，报案24小时内赔付，延时百倍罚息），同时与中国消费者协会成立”全国车险闪赔服务专项保证金”，全力打造保险行业最优服务平台。近期，阳光网上车险重拳出击，不断推出价格更省、理赔更快、奖品更丰富的活动，真诚服务广大客户。', '21', 'http://image.yiqifa.com/ad_images/reguser/24/44/52/1318475500215.jpg', 'http://p.yiqifa.com/n?k=2mLErntF1nDsrI6HCZg7Rnu_fO6uMQbA35FdROydYm6AMSeEYO7_rI6H2mLOWEwern3FWEz71ZLLrJPIPlgtKZq_rI6HMn3S3EbyWJMH2L--&e=API090507&spm=138655627865015183.1.1.1', '4.0%', '2011-10-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('62', '3661', '温泉之家', '温泉之家是目前我国唯一一家专业、系统、全方位推广温泉文化与养生、汇集温泉旅游资源，以最优惠的价格、最专业的服务是您温泉订房订票好帮手！', '20', 'http://image.yiqifa.com/ad_images/reguser/24/34/62/1370420441406.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6NDOrI6HCZg7Rnu_fmUmUSemR5b_Y5Kd3OoVrI6HgZ4upsXyrntmWE2Orn3FWEz71ZLLrI6HYmLErJ6E1J2eMnjOrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2013-06-06 00:00:00', '2014-08-21 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('63', '3678', '星期八团游网', '星期八团游网正式营运于2010年5月，专业以垂直团购形式提供最低价的旅游线路、景点门票销售预定,采用先进的OTO电商运营模式，整合全国3500家旅行社，15000家酒店宾馆，3000个著名景点等商家。为消费者发现最值得信赖的商家，让消费者享受超低折扣的优质服务。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1378265719406.jpg', 'http://p.yiqifa.com/n?k=gOALpcb8rI6HWlwm6NgH2mquUZgL18H_UmUmf9PAMOb7UpeEYOsH2mLErntmWlwqrn3FWEz71ZLLrI6HYmLErJg9WlRl3NzOrIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-08-27 00:00:00', '2014-08-26 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('64', '3686', 'Globester', '海淘客户，详见活动介绍', '20', 'http://image.yiqifa.com/ad_images/reguser/24/27/59/1378292120033.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWltmrI6HCZg7Rnu_fmUmUSecYJo8MQ67MQ2d3OoVrI6H2mLq6lWsWZLO1n2F6nbHWZqdUByWCPAHYmLErn4b3EjF65DsrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5元-10.5元', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('65', '3715', '风景网', '<p><span style=\'widows: 2; text-transform: none; background-color: rgb(245,250,254); text-indent: 24px; letter-spacing: normal; display: inline !important; font: 12px/24px Arial, Helvetica, sans-serif; white-space: normal; orphans: 2; float: none; color: rgb(102,102,102); word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px\'>&ldquo;风景网&rdquo;是由中国风景名胜区协会指导下开办的门户网站，集电子政务与宣传推介、在线电子商务为一体的行业共享服务平台。风景名胜区通过加盟该平台形成规模效应，同时汇集国际知名网站，提升中国风景名胜区的整体品牌形象和国际市场竞争力，从而地推动风景名胜区工作。</span></p>', '20', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1384501882903.jpg', 'http://p.yiqifa.com/n?k=2mLErnDL6NjlrI6HCZg7Rnu_fmUmUSe9M5ecC9ydMSeEYOsH2mLErntm6nwLrn3FWEz71ZLLrnMngNb4Ccq_rI6H3N4y6NyEW9BH2L--&e=API090507&spm=138655627865015183.1.1.1', '效销售额的1.4%', '2013-11-05 00:00:00', '2014-11-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('66', '3641', '途风网', '途风网（ToursForFun by Webeez ，Inc.），即途风海外旅游网，总公司设在美国西海岸南加州洛杉矶（Los Angeles County），拥有合法的加州旅行社执照(State of California of Travel Certificate of Registration)及营业执照(Business Tax Certificate)。是北美旅游行业首屈一指的先锋旅游公司，提供以北美地区为核心的全球景点旅游行程在线预订服务。 承接包括北美（以美国，加拿大为主）、欧洲、澳洲、南美等在内的境内外的旅游项目，包括各种个人或团体旅游、机票、酒店、及多样的门票预订等。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/38/6/1373345947309.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWNtmrI6HCZg7Rnu_fO6dfcg_UQ4lM9oSMcPdf96_YQLErB4ND5FS6QLq6l2FWcLO1n2F6nbHWZLErJoH2mLLWNBw3O49MQLE&e=API090507&spm=138655627865015183.1.1.1', '2.8%', '2013-07-10 00:00:00', '2014-08-01 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('67', '3001', '卖座网', '从合作影城的数量、规模及分布看，卖座网的市场规模国内第一，且发展迅猛。从2008年创立伊始到2010年2月份，卖座网已经在国内覆盖了37个一、二线城市，合作的电影院数量规模也处于国内领先的地位，同时还具有独特的影票价格优势。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/43/53/1337045982973.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6ljSrI6HCZg7Rnu_fmUmUSeV35yvU5Hd3OoVrI6H2mLO6E2mrn3FWEz71ZLLrZB5Ut6ERcq_rI6H1nyy6EWq15BH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2012-05-16 00:00:00', '2013-05-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('68', '3002', '艺龙', '艺龙旅行网是中国领先的在线旅行服务商之一。佣有强大的地图搜索、酒店360度全景、国内外热点目的地指南和用户真实点评等功能、服务，为用户提供全国全国500个城市15000多家酒店在线预订。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/37/5/1269503964969.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s1nDSrI6HCZg7Rnu_fmUmUSeyYJodMSeEYO7_MJP93QPxUIebRmXFrI6H2mLS6lMH6EzS1nDFrnXH2mq_rI6H65Dm15Kl6l6HRKBlMZ3srj--&e=API090507&spm=138655627865015183.1.1.1', '5.5%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('69', '3003', '携程', '作为中国领先的在线旅行服务公司，携程旅行网成功整合了高科技产业与传统旅行业，向超过2000万会员提供集酒店预订、机票预订、度假预订、商旅管理、特约商户及旅游资讯在内的全方位旅行服务，被誉为互联网和传统旅游无缝结合的典范。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/14/50/1257424059232.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWl27rI6HCZg7Rnu_fmKd3mgSCQjd3OoVfmPdC5odfm4yMJySM567f9BlRZbH2mLErn2e6mLO1n2F6nbHWZq76wPP6tAHYmLErnME3E2qW9ByrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.35%-3.5%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('70', '3004', '快乐E行', '快乐e行集团成立于2005年4月，集团致力于建设融汇高科技与全新生活理念于一体的跨行业综合社会服务平台，业务涵盖互联网及移动通信、电子商务、国际/国内旅游、酒店管理、航空服务、文化传媒等多种领域。目前，集团在国内拥有20家分支机构，并在不断发展，业务遍布全国，辐射海外。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/53/11/1257422334239.jpg', 'http://p.yiqifa.com/n?k=2mLErnW7WmLErJb7UZjvfSomUmRdMQgL3Q6lf96_YpoH2mqyUODqNmyHWERFrn3FWEz71ZLLrI6HYmLErnjqMNX83NWmrIW-&e=API090507&spm=138655627865015183.1.1.1', '3%-8%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('71', '3005', '驴妈妈', '驴妈妈旅游网创立于2008年，是中国领先的新型B2C旅游电子商务网站，中国最大的自助游产品预订及资讯服务平台。成立之初，驴妈妈就以自助游服务商定位市场，经过数年发展，形成了以打折门票、自由行、特色酒店为核心，同时兼顾跟团游的巴士自由行、长线游、出境游等网络旅游业务，为游客出行提供一站式服务便利。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1308196422301.jpg', 'http://p.yiqifa.com/n?k=59bQpBXMrI6HWN3mWE4H2mquUZgL18H_UmUmf9qOY5BV3peEYOsH2mLErnKm6nXH6EzS1nDFrnXH2mq_rI6H3lz76O4b6NPH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.1%-5.6%', '2011-06-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('72', '3006', '青芒果', '青芒果旅行网是芒果网旗下专门从事廉价旅店预订的旅行网站，同时附带机票、旅游产品和票券的预订。青芒果旅行网集合了中国内地及港澳众多的廉价旅店，可提供全国几千家10-300元的旅社、客栈、公寓、招待所、香港、澳门平价持牌宾馆等经济旅店的预订服务，是中国第一家纯网络、部分预付、快速确认的订房网络。更优惠的价格，更便捷的订房，是年轻人、自助游、驴友一族出行觅宿的绝好选择。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/15/15/1289800289352.jpg', 'http://p.yiqifa.com/n?k=2mLErntLWl2SrI6HCZg7Rnu_fmUmUSeqY5BdMOHd3OoVfmLErI6H6NtqWmLO1n2F6nbHWZLErJoH2mLqMEKsWJtO6ZLekwA6KQbH&e=API090507&spm=138655627865015183.1.1.1', '1.5%-6.0%', '2010-11-01 00:00:00', '2013-11-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('73', '3007', '住哪儿', '住哪网于2007年6月初正式上线，是目前国内领先的酒店预订网站之一。覆盖全国450个城市的17000多家签约酒店，涵盖了星级宾馆、经济型酒店、自助公寓、特色客栈、度假村等多种形式的休闲经济住宿。住哪网先后开展了机票预订和租车在线预订，拥有全国各大航空机票最新折扣价格信息，以及国内100多个城市的汽车租赁价格数据，立志为用户提供全面的出行服务与指导。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1301465606363.jpg', 'http://p.yiqifa.com/n?k=2mLErntS6NzSrI6HCZg7Rnu_fmUmUSevCZPd3peEY8oH2mLErnK71NBH6EzS1nDFrnXHgl6sP9B4rJoH2mLsMJte3Ntm3QLE&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2011-03-31 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('74', '3008', '布丁', '布丁酒店连锁是中国第一家全新概念、时尚酒店连锁。布丁酒店致力于为顾客创造快乐、自由、时尚的休息体验，通过产品的创新、高效的管理、团队的努力为顾客提供高性价比的酒店产品。我们立志成为全球年轻人最喜爱的品牌。布丁酒店连锁是全国快捷连锁酒店前10强为客户提供经济型客房接受在线预订和电话预定。目前酒店在杭州宁波嘉兴上海西安武汉北京天津苏州无锡济南南京丽江成都沈阳哈尔滨等城市拥有门店。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/61/3/1321267106721.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6N3SrI6HCZg7Rnu_fmUmUSeLYOgAY9elf96_YpoH2mqXK9bd6JgH6EWmWZLO1n2F6nbHWZLErJoH2mq91NWq6nb83QLE&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2011-11-15 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('75', '3009', '悠哉旅游网', '悠哉旅游网（www.uzai.com）成立于2005年，是最早从事网络销售旅游线路的网站。悠哉旅游网选择了差异化发展道路，专注于旅游度假产品，主推随团旅游线路和自由行套餐，并着力于对销售人员专业技能和素质方面的培养，以提供更为细致的人性化贴心服务。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1304651681081.jpg', 'http://p.yiqifa.com/n?k=2mLErntlWl3SrI6HCZg7Rnu_fmUmUSesk9BAf96_YQLErJVpWs6M1ZLs6N2Frn3FWEz71ZLLrI6HYmLErnWLWNyE35B8rIW-&e=API090507&spm=138655627865015183.1.1.1', '1.4%-2.8%', '2011-04-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('76', '3010', '芒果旅游网', '芒果网有限公司是中国港中旅集团的附属子公司、香港中旅国际投资有限公司的全资子公司，是港中旅集团顺应现代旅游发展趋势建立的、以独立品牌专门从事在线旅游业务的电子商务平台，旨在充分发挥港中旅集团丰富的旅游资源、订房、订票资源和客户资源的协同效应。公司于2006年3月31日正式开业，管理、运营及研发中心设在深圳，目前已在北京、广州、上海、深圳、南京、武汉、成都、香港设立分公司。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/8/8/1289799994469.jpg', 'http://p.yiqifa.com/n?k=2mLErnws6n4H2mquUZgL18H_UmUmf9sbY9U_3Oy7kpeEYO7_rI6H2mLsWNtSrn3FWEz71ZLLrnP35EX6CZq_rI6H1JWFWlWs1JgH2L--&e=API090507&spm=138655627865015183.1.1.1', '1.5%-4%', '2010-11-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('77', '3011', '米胖旅游网', '米胖旅游商城是国内领先的旅游在线自助预订平台，通过直接从专业发团社批量采购，不设400电话，只提供在线自助预订的独有模式，降低中间环节成本，最大程度让利给用户。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/17/49/1319005485658.jpg', 'http://p.yiqifa.com/n?k=2mLErntm6n2SrI6HCZg7Rnu_fmUmUSeVCQXbY9Rd3OoVfmLErBbENy4B6QLOWNwlrn3FWEz71ZLLrI6HYmLErJ6b1JKL3ODFrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.1%-6.0%', '2011-09-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('78', '3012', '网票网', '网票网”网票网”电子影票业务正是结合了国际先进的二维码认证技术，用户可以通过网站或手机方便快捷购票，免除排队之苦，提前预定紧俏座位，避免影票遗失。用户只需要在选定影票并支付成功后收到电子影票，即可到影院现场的”自助出票机”前，体验时尚自助验票，入场观影。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/1/63/1306311401023.jpg', 'http://p.yiqifa.com/n?k=gcAIpJVArI6HWNDS1n4H2mquUZgL18H_UmUmfcUbY9ULC5B_f96_YpoH2mLErnKO1NgH6EzS1nDFrnXH2mq_rI6H1Nze15K73OPH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2011-05-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('79', '3013', '国家大剧院', '2007年12月22日，国家大剧院正式运营的大幕徐徐拉开。大幕开启的同时，大剧院人也创造和书写着自己的历史。借鉴国内外知名大剧院的成功经验，依据中国特有的社会文化背景，大剧院对自己的发展愿景做出了清晰规划。国家大剧院（网址：Http://www.chncpa.org），作为中国最高表演艺术中心，始终秉承人民性、艺术性、国际性的办院宗旨以”艺术改变生活”为核心价值观持续为公众提供高水平的文化艺术精品让更多的人感受艺术魅力。</div><div>欢迎走进大剧院，感受大剧院。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/3/61/1334822091675.jpg', 'http://p.yiqifa.com/n?k=YPXQpN65rI6HWEtL6E4H2mquUZgL18H_UmUmf96uY96L3pe_R9R_rI6H2mLO6Nzqrn3FWEz71ZLLrI6HYmLErnt7WOPy6nUwrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.5%', '2012-04-25 00:00:00', '2013-04-24 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('80', '3015', '趣旅网', '趣旅网是一个精英团队，我们的核心高层人员均来自于全国最优秀的互联网公司之一。我们的团队集合了多方人才，除了有海外留学归来拥有多年互联网行业经验的管理专才，以及互联网技术开发人才外，还拥资深经验的旅游产品策划专家、网络公关及传讯等方面的专业人士，而这个团队还在吸纳各方人才并不断壮大当中。2012年，趣旅网扩建了销售中心，壮大的客服团队为用户们提供更完善的旅游咨询、电话预定服务，让我们的热情陪伴您踏上旅程的第一步吧。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1359537666901.jpg', 'http://p.yiqifa.com/n?k=kZ6qRnUnrI6HWE376E4H2mquUZgL18H_UmUmfcB7YmPSf96_YQLErI6H6ljS1QLO1n2F6nbHWZLErJoH2mqwWlM8MNB8WcLE&e=API090507&spm=138655627865015183.1.1.1', '0.84%-2.1%', '2013-01-31 00:00:00', '2014-01-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('81', '3016', '壹游酷', '壹游酷旅游网是国内领先的自助旅游交易及担保平台，是以创新的C2B定制化服务为运营模式的旅游电子商务网站。创立伊始就凭借”先旅游后付费”的商业模式，保证了游客的旅游服务品质，”定制旅游行程”满足了不同人群的出行要求、众多旅行社比价确保了”超高性价比”、独特的商业模式获得了获得了广大游客的高度认可，成交量迅速上升。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/43/11/1360054499558.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6N2lrI6HCZg7Rnu_fmUmUSFqk5osCmKd3OoVrI6HWlROCKsLrnRLWl4H6EzS1nDFrnXH2mq_rI6HMEg81nzFW5gH2L--&e=API090507&spm=138655627865015183.1.1.1', '2.4%', '2013-02-06 00:00:00', '2014-02-05 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('82', '3017', '维也纳酒店', '维也纳精品连锁酒店创立于1993年，是全球首家配套养生食疗自助餐的连锁酒店', '20', 'http://image.yiqifa.com/ad_images/reguser/24/12/52/1350960331263.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWnjSrI6HCZg7Rnu_fmUmUSemk5FF1IeEYO7_rI6H2mLO1NtLrn3FWEz71ZLLrI6HYmLErn371nXwMNtSrtgPgOPwNQL-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2012-10-24 00:00:00', '2013-10-23 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('83', '3019', '春秋旅游', '春秋集团，是春秋航空的母公司。成立于1981年，目前已拥有四千余名员工和导游，年营业收入六十亿元，业务涉及旅游、航空、酒店预订、机票、会议、展览、商务、因私出入境、体育赛事等行业，是国际会议协会（ICCA）在中国旅行社中最早的会员，是第53、54、55届世界小姐大赛组委会指定接待单位，是世界顶级赛事F1赛车中国站的境内外门票代理，被授予上海市旅行社中唯一著名商标企业。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1343815830524.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWlzSrI6HCZg7Rnu_fmUmUSelRZ4AY9U7YmPSf96_YQLErI6H6EROWmLO1n2F6nbHWZLErJoH2mLO1NKSWJtL6mqfUtzFDy4H&e=API090507&spm=138655627865015183.1.1.1', '2.1%', '2012-08-02 00:00:00', '2013-08-01 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('84', '3021', '腾邦旅行网', '深圳市腾邦国际票务股份有限公司是商旅服务领域首家登陆国内资本市场的上市公司（股票简称：腾邦国际；股票代码：300178）。腾邦国际专注从事电子商务业务13年，并持续为电子商务领域提供信息处理服务，在人才、技术、经验、设施等方面具备强有力的保障条件，业务网络覆盖全球。作为中国个性化出行服务领域的开创者与引领者，腾邦国际成功整合了现代高科技产业与传统商旅行业，自主研发的第三方支付平台”腾付通”获颁互联网支付、移动电话支付全国性《支付业务许可证》，建立了以腾邦国际飞人网为窗口、呼叫中心为运营载体、电子支付为支撑的新型电子商务模式，实现了机票销售、酒店预订、商务管理、度假旅游等商旅服务细分市场的全面覆盖。是国内各大航空公司金牌合作商、80多家国际航空公司战略合作伙伴。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/20/12/1352976124334.jpg', 'http://p.yiqifa.com/n?k=YtAh3Kx7rI6HWEDSWE4H2mquUZgL18H_UmUmf9MyCQ4yY8eEYOsH2mLErn3m6l6H6EzS1nDFrnXH2mq_rI6HWO2OW9WqM9gH2L--&e=API090507&spm=138655627865015183.1.1.1', '1.4%-5.6%', '2012-08-08 00:00:00', '2013-10-12 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('85', '3022', '长白山度假区', '世界独一无二的原始保留地，这里有温带到极寒地区，半个北半球的原生植被体系；这里是千万年环境感应大师-----中华秋沙鸭的最佳栖息地；这里是皇族的发祥地，福佑华夏强盛。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/41/55/1355897453481.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6E2SrI6HCZg7Rnu_fmUmUSeECJyd3psE3cWd3OoVfO68RsoLYm4735qH2mqJ5nPiMZ4H6Ew71ZLO1n2F6nbHWZLErJoH2mLLW56bMN3S6mLE&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2012-12-01 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('86', '3023', '去吧旅行网', '去吧旅行网www.trip8.com成立于2009年初，由北京瑞风新程航空服务有限公司全力打造，立足于为广大商务和自助出行人士提供个性化差旅服务，包括机票、酒店、度假、旅游等产品。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/38/58/1354774133121.jpg', 'http://p.yiqifa.com/n?k=3cM46OoPrI6HWEK76n4H2mquUZgL18H_UmUmfcgSCQjFf96_YQLErI6H6EzsWmLO1n2F6nbHWZLErJoH2mLLMJ3OWN2FMZLE&e=API090507&spm=138655627865015183.1.1.1', '0.7%-2.1%', '2012-09-18 00:00:00', '2013-09-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('87', '3024', '途家在线', '途家在线信息技术北京有限公司简称途家网是一家高品质度假公寓预订平台，提供旅游地度假公寓的在线搜索、查询和交易服务。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1354262935989.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6NzSrI6HCZg7Rnu_fmUmUSe7U5AA3peEYO7_KZ4_Y5o7C5odfmgsC9ybMJBECJosC9ybY9RdCZgVrI6H2mLO1NKFrn3FWEz71ZLLrZAIMNUBNZq_rI6H3EReWlPbW5gH2L--&e=API090507&spm=138655627865015183.1.1.1', '17.5元每单', '2012-12-01 00:00:00', '2013-11-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('88', '3025', '格林豪泰酒店', '格林豪泰酒店管理集团是由徐曙光先生携多家美国公司在中国创办的高品位、高性价比的商务型连锁酒店，是目前在中国市场排名第一位的全外资经济型连锁酒店，也是目前前五强的经济型连锁酒店。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/15/49/1348725322231.jpg', 'http://p.yiqifa.com/n?k=3EUfgEXDrI6HWEDL6E4H2mquUZgL18H_UmUmfEwe1IeEYOsH2mLErn3F6E4H6EzS1nDFrnXH2mq_rI6HW9K7WEweWn6H2L--&e=API090507&spm=138655627865015183.1.1.1', '4.2%', '2012-09-24 00:00:00', '2013-09-23 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('89', '3026', '永乐票务', '永乐票务隶属于北京春秋永乐文化传播有限公司，是以商业演出活动及体育比赛项目运营和相关票务营销为主体业务的文化公司，具有超过50000场文化演出、体育活动的票务运营经验，为超过3000万人次的用户提供优质购票服务，已成为中国LIVE娱乐票务领域的翘楚。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/61/3/1355392920176.jpg', 'http://p.yiqifa.com/n?k=kwe7NPUZrI6HWEKO6E4H2mquUZgL18H_UmUmfE2S1IeEYO7d3OeH2mLErn3e6lPH6EzS1nDFrnXH2mq_rI6H3l2OWE2eME4H2L--&e=API090507&spm=138655627865015183.1.1.1', '2.1%', '2012-12-14 00:00:00', '2013-12-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('90', '3028', '锦江国际', '锦江国际（集团）有限公司是中国规模最大的综合性旅游企业集团之一。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1342078097645.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWEj7rI6HCZg7Rnu_fmUmUSehC5ehC5BdMSeEYOsH2mqLUnbcpygH6ERSWcLO1n2F6nbHWZLErJoH2mq9MJPwWEtqMQLE&e=API090507&spm=138655627865015183.1.1.1', '0.35%-8.4%', '2012-07-13 00:00:00', '2013-07-12 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('91', '3029', '中青旅遨游网', '中青旅遨游网：中青旅旗下专业度假网站，我国旅行社行业首家A股上市公司、北京市首批5A级旅行社，致力于为中高端客户奉献性价比最高的度假体验，优质的服务、品牌的信赖，给你舒适、安心的保障。提供自由行/参团线路、酒店等的查询和预订服务。北京、上海、广州、西安…新疆等十余个分站点，随时随地，出发度假！', '20', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1351508288971.jpg', 'http://p.yiqifa.com/n?k=pBXL35bOrI6HWEDO6E4H2mquUZgL18H_UmUmf9B_k5osf96_YpoH2mLErn3F1NyH6EzS1nDFrnXH2mq_rI6H6n3m3ltmMJMH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.9%-1.8%', '2012-10-16 00:00:00', '2013-10-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('92', '3030', '麦厂网', '麦厂网www.muchm.com隶属于北京美多美信息技术有限公司，于2010年11月18日上线运营，是中国领先的新型B2C旅游电子商务网站。基于”散客时代”中国旅游市场的现状和趋势，麦厂网以景区票务及国内外旅游路线为切入点，融合景区”精准营销”和”网络分销”的需求，使景区以”零投入”的方式拥有了自己的景区门票网上预订平台；根据”自由行”游客的行为特征，麦厂网通过电子商务”便捷、优惠及个性化”的定制服务，满足了”自由行”游客的需求。麦厂网将成为国内最好的自由行产品设计和自助游服务平台及景区整合营销平台。目前麦厂网已和多家旅游景点、旅游社及演出单位合作，并展开一系列景区票务分销和在线营销合作。合作景区中包括AAAAA评级的景区。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/36/60/1346121595490.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWlz7rI6HCZg7Rnu_fmUmUSeVU56uYpeEYO7_rI6H2mLO1ntmrn3FWEz71ZLLrI6HYmLErnDs6JM9MnMbrtsV65AmMcL-&e=API090507&spm=138655627865015183.1.1.1', '0.7%-5.6%', '2012-08-29 00:00:00', '2013-08-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('93', '3034', '同程网', '同程网(www.17u.cn)： 中国一流的一站式旅游预订平台，网站拥有国内海量的旅游产品线，提供国内30000余家及海外100000余家酒店预订，覆盖全国所有航线的机票预 订，8000余家景区门票预订，200多个城市租车预订，境内外品质旅游度假预订。提供互联网预订（www.17u.cn）、手机无线预订 （m.17u.cn）和365X24小时电话预订（4007-777-777），网站秉持“有保障的低价”原则，在行业内首创“先行赔付”和“点评返奖 金”等特色增值服务，成为目前中国增长速度极快的旅游预订平台。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/39/7/1366615599707.jpg', 'http://p.yiqifa.com/n?k=2mLErn2m6njSrI6HCZg7Rnu_fmUmUSFq6mKd3OeH2mqyMcXsRK6H6ljl6cLO1n2F6nbHWZLErJoH2mLOWEWLW9WmWcLE&e=API090507&spm=138655627865015183.1.1.1', '1.4%-7.4%', '2013-02-17 00:00:00', '2014-02-16 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('94', '3035', '酒店之家', '酒店之家（hotelhotel）是广州致和网络科技有限公司旗下的网站，是国内首家订酒店全返佣金的在线自助预订平台，凭借现代化的通信系统、在线电子商务技术和完善的客户管理系统，通过一体化的专业呼叫中心，向国内外自助游者提供酒店预订的自助旅行服务。酒店之家现在提供国内600多个城市35000多家酒店2-7折的优惠预订服务。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/19/13/1364879053096.jpg', 'http://p.yiqifa.com/n?k=2mLErn2m6n3SrI6HCZg7Rnu_fmUmUSeuYmgyYJb_UJPxf96drI6HWPRskB2ernRL1N4H6EzS1nDFrnXH2mq_rI6H6l2lWJDL6lUH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.6%-7%', '2013-04-15 00:00:00', '2014-04-14 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('95', '3037', '游多多旅行网', '多多驿站为游多多旅行网2008年推出，通过对旅行驿站文化的宣扬诠释，以营造旅行者在路上的家园为目标。汇集了国内所有景区目的地及大中城市极富特色的青年旅社、民宿客栈、家庭旅馆等，树立起商家自主经营、自主管理、直接销售的住宿预订模式。目前已成为国内旅游住宿预订行业颇具影响力的大型网络预订服务平台。', '20', 'http://image.yiqifa.com/ad_images/reguser/24/11/11/1366794776722.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1NwOrI6HCZg7Rnu_fmUmUSeeYOg_MJHd3OF_rI6H2mLq6ltlWcLO1n2F6nbHWZLErJoH2mLF1NBbWOD76mqIU54QNlXH&e=API090507&spm=138655627865015183.1.1.1', '4.9%', '2013-05-20 00:00:00', '2014-05-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('96', '3720', '中华会计网校', '<p>中华会计网校是正保远程教育（美国纽交所上市公司，股票代码：DL）旗下知名主打品牌网站之一，中华会计网校是目前国内权威、专业的超大型会计远程教育网站，中华会计网校同时也是联合国教科文组织技术与职业教育培训在中国的试点项目，国际四大会计师事务所员工的网上培训基地，十佳网络教育机构。拥有注册学员数百万</p>', '19', 'http://image.yiqifa.com/ad_images/reguser/24/9/9/1383789097965.jpg', 'http://p.yiqifa.com/n?k=2mLErnDL6nKerI6HCZg7Rnu_fmUmUSeECJyd35BE3SeEYOsH2mLErntm6n3Lrn3FWEz71ZLLrBAl3cy!Ycq_rI6HWNDSWlzl6O4H2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-17.5%', '2013-10-18 00:00:00', '2014-10-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('97', '3625', '红黄蓝教育', '红黄蓝教育机构荣誉出品，国内首创全面解决入园焦虑的早教套装，共4大装备36件组合产品，有效做好入园前心理准备、自理能力培养和物质准备，从此让宝宝爱上幼儿园', '19', 'http://image.yiqifa.com/ad_images/reguser/24/57/7/1372757589517.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF1NDLrI6HCZg7Rnu_fmUmUSevCZPwYmKd3OoVrI6HK9V8YJbWrntmWERLrn3FWEz71ZLLrI6HYmLErJB869tO3E6brIW-&e=API090507&spm=138655627865015183.1.1.1', '10.5%-14%', '2013-07-03 00:00:00', '2014-07-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('98', '3657', '好学教育', '好学教育是华图教育集团、达晨创投共同投资控股创办的教育平台，目前业务涉及考研、建筑、公务员、语言、教师、财会、中小学、司法、医学等方面的考试辅导。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/6/58/1369637784473.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWnw7rI6HCZg7Rnu_fmUmUSFsCJB_kZPyf9eyUZLErI6HWNRq1NUH6EzS1nDFrnXH2mq_rI6HMJB865WeMnyHUwRlKnX_rj--&e=API090507&spm=138655627865015183.1.1.1', '35.0%', '2013-05-28 00:00:00', '2014-05-27 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('99', '2901', '新东方在线', '新东方在线（www.koolearn.com）是国内最著名的私立综合教育机构、美国纽约证交所上市公司——新东方教育科技集团（NYSE:EDU）旗下专业的在线教育网站。自2000年上线以来，经过十年的发展，新东方在线已经成为中国最强大的网络教育服务平台和最领先的外语培训类网络教育品牌。新东方在线依托于新东方教育科技集团的强大师资力量与教学资源，拥有中国最先进的教学内容开发与制作团队，致力于为广大用户提供个性化、互动化、智能化的卓越在线学习体验。新东方在线的网络课程服务横跨留学考试、学历考试、职业教育、英语充电、多种语言、中学教育等6大类60余小类，共计1200多门课程，为各类用户提供全面的在线教育服务，截止至2010年10月，新东方在线网站个人注册用户已逾800万，移动学习用户超过100万。2008年，新东方在线作为唯一的综合网络培训机构入选中国互联网协会正式公布的首批“绿色网络文化产品”名单。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/44/12/1297928263667.jpg', 'http://p.yiqifa.com/n?k=2mLErntSWl2SrI6HCZg7Rnu_fmUmUSeiYOoxM5BSY8eEYOsH2mLErnKl6EMH6EzS1nDFrnXH2mq_rI6H6OBb69tq39BHUyUJ6JVmrj--&e=API090507&spm=138655627865015183.1.1.1', '14.0%-21.0%', '2011-02-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('100', '2903', '高学网', '高学网隶属于高学网络科技(上海)有限公司，由全球规模最大的在线教育集团Megastudy和上海交大昂立教育集团共同投资创办，致力于打造中国领先的个性化在线自主学习平台，为广大学员提供最优质的教育资源、最多样化的课程选择、最便捷的学习方式。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/49/49/1336015150846.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6EjSrI6HCZg7Rnu_fmUmUSe_Y9qeRmgsMZwd3OeH2mLErn3OWnMH6EzS1nDFrnXHUOyTC7BWrJoH2mL7MJWlWn273mLE&e=API090507&spm=138655627865015183.1.1.1', '21.0%', '2012-05-04 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('101', '2904', '跨考教育', '跨考网校是跨考教育集团旗下考研类远程教育高端品牌，是上千万考研人的在线学习平台，集授课名师、高清视频、线上辅导答疑、图书资料快递于一体，权威、专业的解决学员考研的所有问题，立志打造成为考研远程教育的门户网站。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/63/63/1362030897440.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6NDSrI6HCZg7Rnu_fmUmUSeiU5Bi35HdY9P7fmLErtqyK9AOgmLmWn2Lrn3FWEz71ZLLrI6HYmLErnz76n4yMEzSrIW-&e=API090507&spm=138655627865015183.1.1.1', '28.0%', '2013-01-25 00:00:00', '2014-01-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('102', '2905', '学海网校', 'Dict.cn（海词网）创始于2003年，是互联网上第一个中文在线词典网站。Dict.cn提供专业的词典服务，涵盖英汉、汉英、缩略语、汉语、方言等各类词典。同时提供围绕词汇学习的各项学习工具：生词本、背单词、单词测试等。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/58/58/1343271709803.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWN27rI6HCZg7Rnu_fO6x3Q6lf9gA3mDd3OF_rI6H2mLO6lKlrn3FWEz71ZLLrt4ckKAVKZq_rI6HM5Km6lWqWNBH2L--&e=API090507&spm=138655627865015183.1.1.1', '14.0%-28.0%', '2012-07-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('103', '2906', '优米网', '优米网，它的宗旨－－优米网-与年轻人一同成长Umiwi是由You（你）、Me（我）和We（我们）三个人称代词构成，寓意无论在哪个人生阶段，你和我都是学习者，同时也是知识和经验的传播者，个体间的交流互动将快速推动我们整个群体文明程度的进步。网站定位为”服务于国家和知识群体”的网络电视。优米网的标识（Logo）是由两片正在进行对话的银杏叶组成，其原型是一棵植根于北京大学校园内的百年银杏树。春天的银杏绿意盎然，象征着希望，秋天的银杏吟华绚烂，寓意每个人最精彩的人生。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/46/50/1340695562098.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6N2OrI6HCZg7Rnu_fmUmUSesY5ymCpeEYOsH2mLErn3O1n4H6EzS1nDFrnXHRQwS5ZjsrJoH2mqbWO3OMNWL1QLE&e=API090507&spm=138655627865015183.1.1.1', '28.0%', '2012-06-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('104', '2908', '精华在线', '精华在线是精华学校旗下的网上课堂，精华在线是选用一线名师，其中更有高考命题制定者，北大博士后，四中、人大附等一线教师，根据精华学校的授课特点，同步课堂录制，学生在一周之内就可以看到最新的名师授课视频。值得一提的是，精华在线更有最牛历史老师袁腾飞授课，让更多的孩子能够接受名师的点拨', '19', 'http://image.yiqifa.com/ad_images/reguser/24/44/12/1330397056540.jpg', 'http://p.yiqifa.com/n?k=2mLErnte1nzlrI6HCZg7Rnu_fmUmUSehC5ecCZPbf96_YQLErBBfM5qi5ZLO6Njlrn3FWEz71ZLLrI6HYmLErJM81nW76Jg9rIW-&e=API090507&spm=138655627865015183.1.1.1', '35.0%', '2012-03-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('105', '2909', '简单学习网', '北京简单科技有限公司坚持”科技使学习更简单”的理念，专注于网络辅导业务。简单学习网由简单科技创办。简单学习网依托与北京大学共同研发的”CAT&nbsp;智能引领互动教学国家专利技术”，在全国首创”互动封闭拟真课堂”。其独特之处在于：模拟真实课堂，基于智能错题本、课后练习和快速网络答疑，融名师系统讲授和”1对1”个别辅导为一体。旨在帮助全国的中学生”反复享受高考研究专家针对性辅导”，提高学习效率，节省学习时间，实现理想。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/6/6/1337651529086.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q1n3lrI6HCZg7Rnu_fmUmUSehC5BdMJBdWNjLf96dfmLErI6H6E3l6mLO1n2F6nbHWZLErJoH2mLqW9DlWEW7WcqLkyy2KlMH&e=API090507&spm=138655627865015183.1.1.1', '17.5%', '2012-05-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('106', '2910', '51Talk无忧英语网', '51Talk是新东方创始人、著名投资人徐小平投资的网络英语教育品牌。主打真人外教一对一、一节课最低15元的平价英语培训模式。堪称网络英语教育行业的”凡客诚品”。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/27/5/1338366270495.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6l3SrI6HCZg7Rnu_fmUmUSFsWQgbYJxd3OoVrI6HK7g!WtR7rn3O6n6H6EzS1nDFrnXH2mq_rI6HWltO652s6O6H2L--&e=API090507&spm=138655627865015183.1.1.1', '25.0%', '2012-05-24 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('107', '2911', '茶树网', '茶树网学院是由企业任职的中高级专业人士担任导师，从基本的技能和工具使用开始，通过独特的视频和YY远程在线授课辅导平台，引导你一步步进入专业的世界，帮助你完成就职的\'最后一公里\'。无论你身在何处，在茶树网学院培训导师和就业团队的共同努力下，终究会为你打开职业的成功大门！', '19', 'http://image.yiqifa.com/ad_images/reguser/24/26/6/1366010005013.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWljSrI6HCZg7Rnu_fmUmUSe7M5B7R9PykZwd3OoVfs4yROosR96yfs4yROosR96yKJBcMpebRmXF!7yt!N2O4w6xC56igc4_YPo4gn7qWIMnYJyEC7qAY9VrpKDo6cLErJyyRKWspcLmWnR7rn3FWEz71ZLLrI6HYmLErJ6y6NzmWEzLrIW-&e=API090507&spm=138655627865015183.1.1.1', '28.0%', '2013-03-20 00:00:00', '2014-03-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('108', '2912', '华图网校', '华图网校于2007年3月20日由华图教育投资创立，是华图教育旗下的远程教育高端品牌。专注于公职培训，目前拥有遍及全国各地500万注册用户，已成为公职类考生学习提高的专业门户网站。', '19', 'http://image.yiqifa.com/ad_images/reguser/24/34/62/1369637894192.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWl27rI6HCZg7Rnu_fm3dCZPbUZKd3OoVfmLErJtSUKPNWmLq6lte1QLO1n2F6nbHWZLErJoH2mLmM5De3O6y3mLE&e=API090507&spm=138655627865015183.1.1.1', '28.0%', '2013-06-05 00:00:00', '2013-06-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('109', '2801', '橡果国际', '橡果国际秉承客户至上、永远创新的理念，主要从事产品研发、生产、营销策划、商品零售等业务的大型技工贸一体化企业。公司以电视、网络等多种媒体为推广手段，以计算机信息管理系统为辅助工具，成功创立起多媒体的商业推广平台。', '18', 'http://image.yiqifa.com/ad_images/reguser/24/31/63/1257422817800.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WE3srI6HCZg7Rnu_fmUmUSeECJyd35gSUZ3d3OoVrI6H2mLq6EzLrn3FWEz71ZLLrngO5QXKMQq_rI6HWE3SW5B91nBH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2009-03-05 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('110', '2802', '快乐购', '快乐购是一家以电视、网络、型录等多媒体通路为销售平台的现代流通企业。专注开拓中国蓬勃发展之新一代家庭购物市场由中国内地最具影响力之电视传媒机构之一——湖南卫视与湖南广播影视集团共同注资一亿元人民币，在中国国家工商总局注册成立，公司住所地位于湖南省长沙市。“快乐购”集结电视、网络、型录三大通路向消费者展示精挑细选、琳琅满目的商品信息，让广大消费者足不出户，尽览丰富、实用的商品资讯，享受全天候、无忧的、精彩的家庭购物体验！', '18', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1266897897771.jpg', 'http://p.yiqifa.com/n?k=2mLErnK7Wn4H2mquUZgL18H_UmUmf9bbRZXAMOHd3OoVrI6H2mL76ntsrn3FWEz71ZLLrB6VkEB_DQq_rI6HWOWO6JK7MN6H2L--&e=API090507&spm=138655627865015183.1.1.1', '1%-3%', '2010-01-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('111', '2803', '好享商城', '江苏省广播电视总台（集团）旗下好享购物网上商城。', '18', 'http://image.yiqifa.com/ad_images/reguser/24/6/6/1338364039530.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6lzSrI6HCZg7Rnu_fmUmUSeu35HS6IeEYcLErI6H6EDO1QLO1n2F6nbHWZqlpPDs3syHYmLErJ6wMEzSMJgwrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.0%-10.5%', '2012-02-01 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('112', '2804', '央广购物', '央广购物系中央人民广播电台倾力打造的专业居家购物公司，是以电视购物频道为主体，辅助于广播、网络、手机电视、型录的全媒体无店铺购物运营平台。央广购物依托中央人民广播电台国家电台的品牌优势，整合央广媒体通道资源，（三套全国性广播频率四套北京广播频率，手机电视央广视讯频道，全球最大的中文音频门户网站），面向全国观众提供优质的居家购物服务。力争用三到五年的时间，成为国内一流居家购物企业。', '18', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1318474382789.jpg', 'http://p.yiqifa.com/n?k=D5LL3NbWrI6HWNzlWn6H2mquUZgL18H_UmUmf96dR9sbYJLd3OoVrI6H2mLOWEwFrn3FWEz71ZLLrI6HYmLErJKSM92sMnwFrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10.5%', '2011-10-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('113', '2805', '优购物', '优购物是中国领先的居家购物品牌，秉承“诚信、共赢”的经营理念，以“务实开放拼搏超越”为行为准则，从消费者的消费习惯和实际需求出发，提供以家庭生活为核心的日常用品、生活家电、数码电子、美容护肤、服装饰品、营养保健、文化礼品等优质精选的商品。优购物拥有严格规范的商品开发体系、阵容强大的呼叫中心及便捷通达的自建物流配送系统，集合电视、网站两大优势销售媒体，将品质优、价格优、服务优的三优理念传达给广大消费者！', '18', 'http://image.yiqifa.com/ad_images/reguser/24/44/12/1361085675156.jpg', 'http://p.yiqifa.com/n?k=2mLErnReWEbH2mquUZgL18H_UmUmfEtmU5U_f96_YpoH2mLErnDeWNyH6EzS1nDFrnXHW5qFM7ANrJoH2mLmWl2FWnWL6cLE&e=API090507&spm=138655627865015183.1.1.1', '1.0%-10.0%', '2010-08-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('114', '2806', '东方cj购物', '东方CJ家庭购物节目已于2004年4月1日起，正式在上海东方电视台戏剧频道播出。每晚八点至凌晨一点连续五小时的家庭购物节目，面向上海等地区350万个可视听家庭，传达全新的购物理念。2004年11月22日，东方CJ家庭购物网站全新改版，开展互联网经营业务，顾客可在东方CJ网站上方便的进行商品信息查询、订购及预订，并可查询个人订购/配送/积分详情，或对已购商品进行使用评价。', '18', 'http://image.yiqifa.com/ad_images/reguser/24/12/52/1257422990496.jpg', 'http://p.yiqifa.com/n?k=2mLErnzl1n4H2mquUZgL18H_UmUmf9oEC8eEYO7d3OeH2mLErnWOWZLO1n2F6nbHWZLErJoH2mLqMn3mMNWL6cqW3OeKCmBH&e=API090507&spm=138655627865015183.1.1.1', '1.5%-3%', '2008-11-22 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('115', '2701', '奇贝团购网', '', '17', 'http://image.yiqifa.com/ad_images/reguser/24/18/14/1347257005329.jpg', 'http://p.yiqifa.com/n?k=DmUTPculrI6HWEWOWn4H2mquUZgL18H_UmUmfcBAC54ACpeEYO7_rI6H2mLO1nDlrn3FWEz71ZLLrI6HYmLErnzS1N2s3OWsrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.0%-7.0%', '2012-09-11 00:00:00', '2013-09-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('116', '2702', '红绣团', '红绣团（hongxiutuan.net）是北京龙运天祥商贸有限公司旗下团购网站，于2010年10月开团，是国内较早专业提供休闲办公室零食团购的网站，上线仅仅半年时间，就因实惠的价格，优质的品质以及快捷的发货速度在同行业获得较高的口碑，网站注册会员超过50万！日发订单过千！。不断的扩展，现在已经增加了各地的本地精品服务团购和针对女性团友的服饰化妆品类精品团购！', '17', 'http://image.yiqifa.com/ad_images/reguser/24/34/62/1348904770605.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WN2SrI6HCZg7Rnu_fmUmUSeuYOeckJysUZPbY8edMQD_rI6H2mLO1nz7rn3FWEz71ZLLrZyCNBg!Mcq_rI6H653l1J4bM5gH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-12.0%', '2012-09-28 00:00:00', '2013-09-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('117', '2703', '团乐购', '团乐购倡导”热爱生活，快乐购物”的理念，每天在全国各大城市组织推出多款低折扣精品团购，致力于为广大用户提供健康优质的生活方式和简单愉悦的购物体验', '17', 'http://image.yiqifa.com/ad_images/reguser/24/14/14/1332913514884.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6NjSrI6HCZg7Rnu_fmUmUSe7U5BdYJPcYSeEYO7_rI6H2mLO6NDSrn3FWEz71ZLLrI6HYmLErnzm69gw6n2mrB465J4BCQL-&e=API090507&spm=138655627865015183.1.1.1', '0.03%-12.0%', '2012-03-29 00:00:00', '2013-03-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('118', '2706', '闺蜜团', '与闺蜜一起团购美丽！将美丽分享，成就更多闺蜜美丽快乐的团购体验之旅！闺蜜团是中国团购潮流第一批兴起的最早的专注于化妆品的专业团购网站，致力于利用自身强有力的化妆品资源集价格与物美之优势于一体为闺蜜们提供专业的团购产品。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/41/55/1308827209722.jpg', 'http://p.yiqifa.com/n?k=2mLErntsWN3SrI6HCZg7Rnu_fmUmUSeVCQ6lUZPbY8eEYOsH2mLErnKm1NPH6EzS1nDFrnXHPOVT3KPprJoH2mLFMNU86JWS6QLE&e=API090507&spm=138655627865015183.1.1.1', '0.03%-15.0%', '2011-06-24 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('119', '2707', '秀团网', '秀团是深圳走秀网络科技有限公司旗下的一家高端时尚商品团购网站。每周一、四秀团会为您准备超值的时尚精品，或是国际一流的奢侈大牌，或是最潮最IN的流行品牌，包括服装、鞋帽、包包、配饰，无所不及！而且保证是100%正品，凑够最低团购人数即可享受超低折扣！', '17', 'http://image.yiqifa.com/ad_images/reguser/24/35/61/1313566857295.jpg', 'http://p.yiqifa.com/n?k=pm4VNcAWrI6HWN3mWn4H2mquUZgL18H_UmUmfcbAUQgs35Fd3OoVrI6H2mLOWnKSrn3FWEz71ZLLrI6HYmLErnyE6Nze6EBErIW-&e=API090507&spm=138655627865015183.1.1.1', '0%-6.6%', '2011-08-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('120', '2708', '维客尚品', '维客尚品，高性价比生活类产品，时尚选择，最好的用户体验。维客尚品的使命就是，维系生活，以客为本，崇尚品质', '17', 'http://image.yiqifa.com/ad_images/reguser/24/31/63/1342422156166.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6l2lrI6HCZg7Rnu_fmUmUSemCOoxf96drI6H2mLO6l2srn3FWEz71ZLLrI6HYmLErng8Wljq1NB8rJy9RKRLRmL-&e=API090507&spm=138655627865015183.1.1.1', '12.6%-15.0%', '2012-07-17 00:00:00', '2013-07-16 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('121', '2709', '哪拍网', '哪拍网【www.napai.cn】隶属玩美益邦（北京）科技有限公司。是一家专门为摄影消费者提供消费保障的网站。2008年上线运营至今（前身玩美网），已与1000多个摄影商家合作，服务超过10万摄影顾客！为了打破摄影行业潜规则，让摄影消费者明白花钱，享受高质量的摄影服务，哪拍网制定并恪守三大服务准则：1.100%透明消费如遇商家陷阱，哪拍先行赔付！2.100%拍摄满意重拍仍不满意退还80%服务费！3.100%自由退款无条件退款，一个工作日到账！', '17', 'http://image.yiqifa.com/ad_images/reguser/24/30/2/1346317669851.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWlzlrI6HCZg7Rnu_fmUmUSed3QXbCpeEYcLErJeXCtytWcLO1njSrn3FWEz71ZLLrI6HYmLErnwF1NXyM5tsrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2012-08-21 00:00:00', '2013-08-20 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('122', '2710', '拉手', '拉手网：每天团购一次，为你推荐超低折扣的优质服务。拉手每天为您推荐一种优质的本地生活服务；拉手的推荐一定物超所值；拉手致力于帮您发现最好玩，最新鲜的生活方式', '17', 'http://image.yiqifa.com/ad_images/reguser/24/53/53/1311216224381.jpg', 'http://p.yiqifa.com/n?k=pNMDC5PerI6HWNje6n4H2mquUZgL18H_UmUmf9qbROb_UpeEYOsH2mLErnKS1NbH6EzS1nDFrnXH2mq_rI6H1Jts65DF3NBH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-3.5%', '2011-01-13 00:00:00', '2014-01-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('123', '2711', '唯美团', '唯美团---唯独你最美，团队美丽新生活。<br/>作为资深买家，我们深知在网上寻找一款可靠又好用的化妆品的不易，相信您也有过这样的困惑。<br/>我们根据多年网购的经验，在网络浩如烟海的商品和厂家中为您精选出最优秀的产品，最可靠的厂家。<br/>我们以限时团购的方式，聚集大家的力量，为大家争取到最优的折扣。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/50/50/1333591975228.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6nDSrI6HCZg7Rnu_fmUmUSemM5yVM5y7U5Bdf96_YQLErZPcPlbhgZLO6NWlrn3FWEz71ZLLrI6HYmLErJD7WEjFMEgwrIW-&e=API090507&spm=138655627865015183.1.1.1', '15.0%', '2012-03-26 00:00:00', '2013-03-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('124', '2712', '私房团', '私房团是北京亚太恒美科技有限公司旗下致力于以相当低的价格团购商品来服务于大众的电子商务网站', '17', 'http://image.yiqifa.com/ad_images/reguser/24/47/49/1324952789881.jpg', 'http://p.yiqifa.com/n?k=NOb41KBBrI6HWNwLWngH2mquUZgL18H_UmUmfc6AM9BdMmgs35Fd3OoVrI6H2mLO6nDlrn3FWEz71ZLLrI6HYmLErnjSWOWeMnterIW-&e=API090507&spm=138655627865015183.1.1.1', '0.03%-10.5%', '2011-12-28 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('125', '2713', '宝贝婚团', '宝贝婚团致力于为客户提供婚纱照团购艺术照团购写真团购婚礼策划婚车租赁婚礼用品-专业婚嫁团购服务平台。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/54/54/1337571751349.jpg', 'http://p.yiqifa.com/n?k=2mLErn2qWl2SrI6HCZg7Rnu_fmUmUSe839bsY8eEYOsH2mLErn3OWNUH6EzS1nDFrnXH2mq_rI6H6OBy15gw6EMH6PyyRnMFrj--&e=API090507&spm=138655627865015183.1.1.1', '0.03%-28.0%', '2012-05-14 00:00:00', '2013-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('126', '2714', '高朋', '', '17', 'http://image.yiqifa.com/ad_images/reguser/24/42/54/1355370320285.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWEzSrI6HCZg7Rnu_fmUmUSec35oLM5ecf96_YpH0D7yt!K61Q7BJgyHqWlbr1BHqQlBH2mLsMQBIWcgH6E3F6QLO1n2F6nbHWZLErJoH2mL73ljLWEB9WmLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-5.6%', '2012-06-28 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('127', '2716', '58团购', '58团购是58同城(北京五八信息技术有限公司)创办的团购模式在线生活服务消费网站：超低折扣、便捷消费，结合58同城海量本地生活服务商家资源，每天一单团购，为消费者提供贴心、便利的在线消费方式，享受超低折扣的优质服务，为商家找到最合适的消费者并获得最大收益的互联网推广。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/54/54/1301380328009.jpg', 'http://p.yiqifa.com/n?k=2mLErntlWn2SrI6HCZg7Rnu_fmDd6Nzd3OoVfmLErteyRBMhUQLs6nzOrn3FWEz71ZLLrI6HYmLErJW73lb815B9rIW-&e=API090507&spm=138655627865015183.1.1.1', '1.75%-7%', '2011-03-30 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('128', '2717', '米奇网', '米奇网致力于高端品牌的推广，便于广大爱美女性以平民价格收到最适合自身的产品。2010年10月米奇网正式上线，秉承高端、优质、平价的理念，将发展、合作、品牌作为网站的战略，一方面积极与相关品牌资源包括代理商、厂家等建立紧密合作关系，另一方面打造自身品牌，建立拥有良好信誉度的交易平台，为广大爱美女性创造一个融合团购、购物、咨询等多方面的优质网站。米奇网与多个化妆品品牌建立了良好的合作关系，在彩妆、护肤、身体护理及相关食品、保健品等方面都有良好的品牌基础。米奇网的核心管理团队拥有电子商务及高端化妆品领域多年管理经验的顶尖人士，拥有众多高端品牌的合作关系，我们无论从管理理念、还是行业经验都处于同行业的顶端。我们将提供给客户人性化及专业化的良好体验与服务', '17', 'http://image.yiqifa.com/ad_images/reguser/24/50/14/1334729304736.jpg', 'http://p.yiqifa.com/n?k=2mLErntq6nzSrI6HCZg7Rnu_fmUmUSeVCQBAf96drI6H2mLsWlK7rn3FWEz71ZLLrJu7UtbNkZq_rI6H6Et7WnwLMJMH2L--&e=API090507&spm=138655627865015183.1.1.1', '15.0%', '2011-02-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('129', '2718', '满座网', '满座网，倡导聪明消费，每天推出一个限时团购活动帮您从海量信息中解脱出来，每天只看到一个被精选后的消费信息通过提前预订和团购的形式，倡导聪明、时尚的计划消费理念帮助您把握本地最IN、最潮、最好玩的消费动态，轻松享受都市生活我们喜欢美食，谈起饮食文化滔滔不绝；我们热爱旅游，追求性价比极高的酒店和航班线路DIY方式；我们爱惜自己的身体，经常去健身和SPA。最重要的，我们知道要做一个聪明的消费。我们将在满座网和您一起分享这些经验。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/3/3/1295947227377.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q1n2lrI6HCZg7Rnu_fmUmUSeV35evU5Hd3OoVrI6HPtPANKyNrnKlWlXH6EzS1nDFrnXH2mq_rI6H6JBbMN3SMJBH2L--&e=API090507&spm=138655627865015183.1.1.1', '3%-6%', '2011-01-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('130', '2719', '赶团网', '赶团网（www.gantuan.com）是一家专业的女性团购网站。网站汇聚国内外知名化妆品牌，并且以限时团购的方式，让各位女性朋友低价购买到心中渴望已久的大牌明星化妆品，降低您美丽的代价！我们希望带给您美丽惊喜和时尚气息的同时，更重要的是带给您热爱生活，崇尚美丽的生活方式。随着我们进一步的发展，日后赶团网将打造成一个全方位的女性垂直性团购网站。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/50/50/1303280304642.jpg', 'http://p.yiqifa.com/n?k=2mLErntlWE2SrI6HCZg7Rnu_fmUmUSec35e7U5Bdf96_YpoH2mqxNOyT69VH6NKm6ZLO1n2F6nbHWZLErJoH2mLs1J276lteMZLE&e=API090507&spm=138655627865015183.1.1.1', '10.0%-12.0%', '2011-04-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('131', '2720', '嘀嗒团', '嘀嗒团是中国成长最迅速的精品限时团购网站，由谷歌前中国区销售总经理宋中杰先生及其团队于2010年7月创立。目前已经开通北京，上海，广州，深圳，杭州，南京，武汉，成都，西安，天津，青岛，郑州，济南，长沙等二十个城市，并还在积极的拓展中。目前，嘀嗒团已经成长成为全国最大的团购网站之一，交易额稳居全国前五。嘀嗒团是第一批获批通过商务部信用认证的团购网站之一，并且也是互联网信用评价中心网信认证的网站；11月获得了IDG注资后更是发展迅猛。获得了各权威机构的肯定和表彰，先后获得了2010年中国重信用团购网站2010年度最值得期待团购网站2010年度互联网产业百强2010年最受女性喜爱的团购网站2010年团购网站十大领军品牌等奖项，可谓硕果累累。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/63/1/1307441405107.jpg', 'http://p.yiqifa.com/n?k=RPR7kPAVrI6HWNWF1n4H2mquUZgL18H_UmUmf9gAMJB7U5Bdf96_YQLErI6H6N3qWZLO1n2F6nbHWZLErJoH2mqEM5DOWnzSMcLE&e=API090507&spm=138655627865015183.1.1.1', '1%-4%', '2011-05-05 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('132', '2721', '热卖团', '热卖团，在这一年里每天订单稳定，我司把产品质量和服务放在首位，全心全意为客户服务。热卖团-以热卖为主，热卖团为响应广大客户的需求而诞生，并且汇集众多网络技术骨干，根据大批多年从事的网上购物消费引荐，收集了数百家经过长期合作的厂家直销产品，为客户提供目前市场最新潮，最受客户喜欢的产品，我们以限时团购的方式，聚集大家的力量，为大家争取到最优的折扣。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/35/61/1314701470636.jpg', 'http://p.yiqifa.com/n?k=2mLErntO1nzSrI6HCZg7Rnu_fmUmUSFsWQ4yY5BAf96_YQLErBPgW9yZ6mLOWNjern3FWEz71ZLLrI6HYmLErnts1Nyw1NbwrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.03%-13.0%', '2011-08-31 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('133', '2723', '美团', '美团每天帮您推荐一种优质的本地生活服务；美团的推荐一定物超所值；美团同时致力于帮您发现最好玩，最新鲜的生活方式', '17', 'http://image.yiqifa.com/ad_images/reguser/24/20/12/1298874871944.jpg', 'http://p.yiqifa.com/n?k=2mLErntq6EDSrI6HCZg7Rnu_fmUmUSeVM5y7U5Bdf96_YpoH2mLErnK7Wn4H6EzS1nDFrnXH2mq_rI6H1JWl1nwqWOgHpcbQ6mU3rj--&e=API090507&spm=138655627865015183.1.1.1', '0.7%-3.15%', '2011-03-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('134', '2724', '极致时尚', '2010年6月，选择Groupon的团购商业模式，发布极致时尚。目前已是根植中国互联网上，遥遥领先的时尚类团购网站。据最新的调查报告，极致时尚已跻身中国网上服饰团购网站前10强。其所取得的成绩，不但被视为电子商务行业的一个创新，更被传统服装业称赞。2010年12月被认定为电子商务诚信企业（BCP认证）。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/33/1/1320202818174.jpg', 'http://p.yiqifa.com/n?k=2mLErntF1nz7rI6HCZg7Rnu_fOAvUZ4yY9Dd3OoVfmLErI6H6EW76mLO1n2F6nbHWZLErJoH2mLq3lX8WOtqMcqJPcy9R9qH&e=API090507&spm=138655627865015183.1.1.1', '7.5%-11.0%', '2011-11-03 00:00:00', '2013-12-01 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('135', '2726', '窝窝团', '窝窝团是国内第二家上线的知名团购网站，始终重视服务品质和消费者体验，为消费者提供贴心、贴身的团购服务，同时以顾问营销方式为商家提供本地化网络广告服务。如果您是消费者：窝窝团陪您玩儿转吃喝玩乐窝窝团带您用最少银子淘尽最时尚生活窝窝团让您体验最贴心、贴身的服务如果您是商家：窝窝团集合了您需要的消费者窝窝团拥有最专业贴心的营销顾问窝窝团帮您实现广告效果最大化', '17', 'http://image.yiqifa.com/ad_images/reguser/24/54/54/1310030119199.jpg', 'http://p.yiqifa.com/n?k=k5gn1ZAMrI6HWNWeWE4H2mquUZgL18H_6NP7U5Bdf96_YpH0Mc4_YNsxC5BdY5PdMSseCQBAM9BH2mLErnKlWNbH6EzS1nDFrnXH2mq_rI6H3N3LWEBwMEMH2L--&e=API090507&spm=138655627865015183.1.1.1', '1.2%-7.2%', '2011-01-22 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('136', '2727', '团购王', '团购王（www.go.cn）隶属于北京联动在线通讯科技有限公司，联动在线是一家拥有15年互联网运作经验的媒体集团。旗下包括《时装LOFFICIEL》、《CITYGUIDE城市指南》、”看天下读书”“团购王”等十余家平面媒体和专业网站。团购王是创建于2010年的国内知名团购网站倡导”省钱才是硬道理”，每天为用户精挑细选最优质的商品和服务。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/57/57/1314785849951.jpg', 'http://p.yiqifa.com/n?k=2mLErntO1N2SrI6HCZg7Rnu_fmUmUSecYSeEYcLErI6H6Etq6cLO1n2F6nbHWZqpUc4DkE4HYmLErJMw35tS3NPbrIW-&e=API090507&spm=138655627865015183.1.1.1', '4%-9.5%', '2011-09-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('137', '2728', '知我药妆商城', '2011年11月，36团正式更名为”知我药妆”http://www.zhiwo.com，转型为涵盖限时抢购、团购等模块的电子商城平台，目前知我网已经提供了近万余种化妆品品牌产品，更全面的满足女性网购群体对于化妆品的需求。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/18/14/1356421486617.jpg', 'http://p.yiqifa.com/n?k=C7qlgnterI6HWNWOWn4H2mquUZgL18H_UmUmfcAuCQU_f96_YpoH2mLErnKs6EMH6EzS1nDFrnXH2mq_rI6H6O2OW9tq3lyH2L--&e=API090507&spm=138655627865015183.1.1.1', '3%-10.5%', '2011-04-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('138', '2729', '糯米网', '糯米网（www.nuomi.com）-中国第一个具有上市背景的团购网站（隶属人人公司），真正高品质低折扣，零风险，值得信赖。全国已覆盖500个城市，每天都有新惊喜。美食，娱乐，生活，旅游，网购，件件精品，样样实惠。按时付款无拖欠，与合作站共赢是我们推广的目标。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/35/3/1317281467496.jpg', 'http://p.yiqifa.com/n?k=2mLErntm6njSrI6HCZg7Rnu_fmUmUSedU5oVCpeEYO7_rI6Hp7q5K9PCrn3SWEMH6EzS1nDFrnXH2mq_rI6HMJBb1n3m15PH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-5.0%', '2011-09-24 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('139', '2730', '品质团', '品质团是专业的高端化妆品团购网站，致力于让广大爱美女性以最低的价格买到最具品质的产品。品质团售出所有商品均为正品，假一赔三，三十天内无条件退换货。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1320742909586.jpg', 'http://p.yiqifa.com/n?k=M7VNCwqbrI6HWNzsWE4H2mquUZgL18H_UmUmfcXvUZPbY8eEYO7_rI6H2mLOWl3qrn3FWEz71ZLLrI6HYmLErJMyWNKqWJByrIW-&e=API090507&spm=138655627865015183.1.1.1', '3%-18%', '2011-11-09 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('140', '2731', 'D8婚团网', 'D8婚团(d8wed.com)是中国最大的结婚垂直电子商务平台！创新打造结婚消费商业新模型，现已逐步覆盖国内各大中小城市，为新人提供专业优质超值的摄影、婚庆及婚纱礼服团购服务。要结婚，就上D8婚团！', '17', 'http://image.yiqifa.com/ad_images/reguser/24/45/13/1315303877256.jpg', 'http://p.yiqifa.com/n?k=2mLErntmWNDSrI6HCZg7Rnu_fmUmUSew1ZUyMIeEYOsH2mLErn3q6nXH6EzS1nDFrnXH2mq_rI6HM9Ke6EUy6nbHgZzlPOLmrj--&e=API090507&spm=138655627865015183.1.1.1', '24.0%', '2011-09-07 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('141', '2734', '大众点评团', '大众点评网首创的第三方点评模式吸引了千万网友的积极参与，由用户点评的包括餐饮、休闲、娱乐等生活服务商户已覆盖全国2000多个城市100多万家，且信息量和覆盖范围在不断地快速增长和自主更新中。其中，餐饮点评是其发展最早也是目前消费者最为喜爱并聚集信息量最多的内容之一', '17', 'http://image.yiqifa.com/ad_images/reguser/24/5/59/1316426987523.jpg', 'http://p.yiqifa.com/n?k=2mLErntm1NjSrI6HCZg7Rnu_fmDdMJybYcXAY9Rd3OoVrI6HWBzF6QU_rn3q1NbH6EzS1nDFrnXH2mq_rI6H39t76JKO3lBH2L--&e=API090507&spm=138655627865015183.1.1.1', '1.2%-4.6%', '2011-09-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('142', '2736', '亲亲网', '亲亲网是国内最早一批专业化妆品团购网站，网站汇集了互联网、电子商务、化妆品、时尚等领域的顶尖人士，我们来自各地，希望带给您的不只是最高质量的产品，而更重要的是一种向往美丽，热爱生活的生活方式；我们希望并且相信在我们的不懈努力下，亲亲网会成为中国女性的时尚美丽消费圣经，帮助更多的女性变得更加美丽自信，提升自我价值；我们深爱着我们的用户，我们相信互联网的力量，相信一群充满梦想、认真且执着的人能让世界变得更美好，让您变得更美丽。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/33/1/1319617078879.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6n3SrI6HCZg7Rnu_fmUmUSeqC5eqC5FdY9P7fmLErI6H6EWl1ZLO1n2F6nbHWZLErJoH2mLFWE6w1JWO3cqekE4QYyXH&e=API090507&spm=138655627865015183.1.1.1', '11.0%', '2011-10-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('143', '2737', '买好网', '买好网网是中国最大也是最专业的女性团购网站买好网为您每天提供超值的化妆品护肤品和美妆团购，保证正品、假一赔三、三十天无条件退换。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/60/4/1345450030700.jpg', 'http://p.yiqifa.com/n?k=2mLErntSWljSrI6HCZg7Rnu_fmUmUSFq6Osuf96_YpoH2mqpUKxFDPyH6NDmWQLO1n2F6nbHWZLErJoH2mqE6OBbWJ3sWmLE&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2011-03-24 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('144', '2738', '聚美优品', '聚美优品的前身是团美网，中国第一家专业化妆品团购网站，也是中国最大的化妆品团购网站。在2010年9月，为了进一步强调团美在女性团购网站领域的领头地位，深度拓展品牌内涵与外延，团美网正式全面启用聚美优品新品牌，并且启用Jumei.com全新顶级域名', '17', 'http://image.yiqifa.com/ad_images/reguser/24/25/57/1291614825736.jpg', 'http://p.yiqifa.com/n?k=2mLErntL6n3SrI6HCZg7Rnu_fmUmUSehU5syCpeEYO7_rI6H2mLsWE2mrn3FWEz71ZLLrI6HYmLErJK7W5ts6N48rJsFgc4nNZL-&e=API090507&spm=138655627865015183.1.1.1', '2.2-4.8%', '2010-12-07 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('145', '2739', '荷包团', '荷包团网，每天推出一单精品消费，以限时团购的方式，聚集大家的力量，为消费者发现最值得信赖的商家和最可靠又好用的商品，让消费者享受超低折扣的优质服务。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/50/14/1324951706747.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWEzSrI6HCZg7Rnu_fmUmUSeuM54bYmgs35Fd3OoVrI6H2mLO6nDSrn3FWEz71ZLLrI6HYmLErJKO3lKqWNzmrJb7g9s1pcL-&e=API090507&spm=138655627865015183.1.1.1', '4.0%-22.0%', '2011-12-28 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('146', '2740', '77座', '77座（原给力网）汇集吃，喝，玩，乐，旅游出行，专业美妆，的团购网站，最早一批的限时团购网站<br/>77座网每天推出数十款精彩团购活动，涵盖：餐厅、影剧院、酒吧、美发美体、KTV、SPA、夜店、户外运动、旅游、体育赛事，音乐会，体育健身，等各种各样的消费场所。77座提供不可思议的折扣价格！通过77座，能购得超低折扣的品牌商品，还能购得最新的潮流活动，周末让你和朋友不再为寻找活动和如何省下花销烦恼', '17', 'http://image.yiqifa.com/ad_images/reguser/24/38/58/1324436551462.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWEDSrI6HCZg7Rnu_fmUmUSecR9PbUJqeY9P7f96_YpoH2mLErn3lWl4H6EzS1nDFrnXH2mq_rI6HMnBbMJ3OW5gHKOqm5JAFrj--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-17.5%', '2011-10-25 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('147', '2741', '阿窝团', '阿窝团密集推出精选的餐饮美食、休闲娱乐、精品购物等，给顾客更多选择空间并提供更精彩的网上购物生活。具强力的竞争优势，具有多家全国最大的精品供货商，提供全面多种精品，有质量保证、价格优惠。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1343640407215.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S1NzlrI6HCZg7Rnu_fmUmUSebUOo7U5Bdf96_YpoH2mLErn3m6NbH6EzS1nDFrnXHPygiNyROrJoH2mL715KLMNwqMQLE&e=API090507&spm=138655627865015183.1.1.1', '9.0%', '2012-07-31 00:00:00', '2013-07-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('148', '2743', '卖座网团购', '从合作影城的数量、规模及分布看，卖座网的市场规模国内第一，且发展迅猛。从2008年创立伊始到2010年2月份，卖座网已经在国内覆盖了37个一、二线城市，合作的电影院数量规模也处于国内领先的地位，同时还具有独特的影票价格优势。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/56/56/1348457639349.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1NDSrI6HCZg7Rnu_fmgs35FdY5BAkcP_f96_YQLErBUdK5bWPQLO1n3ern3FWEz71ZLLrI6HYmLErnPyMnX8693lrIW-&e=API090507&spm=138655627865015183.1.1.1', '2.4%', '2012-09-25 00:00:00', '2013-09-23 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('149', '2744', '团委会', '', '17', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1332933301208.jpg', 'http://p.yiqifa.com/n?k=2mLErn2LWlj7rI6HCZg7Rnu_fmUmUSe7U5BdUOPACZPAf96_YpoH2mLErn3sWE6H6EzS1nDFrnXHRlUh5QXXrJoH2mLO6ngw35By1ZLE&e=API090507&spm=138655627865015183.1.1.1', '5%-12%', '2012-03-08 00:00:00', '2013-03-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('150', '2745', '明星团', '明星团是汇聚了护肤品、彩妆、香水等各大明星品牌的化妆品团购/打折网站。打造明星美妆，展现明星风采，超值正品化妆品团购，尽在明星团购网。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1353470027572.jpg', 'http://p.yiqifa.com/n?k=RPUiNnbBrI6HWEDO6EgH2mquUZgL18H_UmUmf9sFMOocYSeEYO7_rI6H2mLO1N2Srn3FWEz71ZLLrI6HYmLErJWe15M93l3lrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.0%', '2012-10-26 00:00:00', '2013-10-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('151', '2747', '5173团', '5173团最具地方特色，是国内权威的女性团购网站，经营国内最大婚纱照团购、品牌化妆品团购', '17', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1352444944193.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWn2SrI6HCZg7Rnu_fmUmUSFsWNRlUZPbY8eEYOsH2mLErn3eWlPH6EzS1nDFrnXH2mq_rI6HWEDm392e65gHpB6h65UIrj--&e=API090507&spm=138655627865015183.1.1.1', '9.6%-24.0%', '2012-11-10 00:00:00', '2013-11-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('152', '2749', 'VE实体团', 'VE实体团是国内最早一批专业化妆品团购网站，网站汇集了互联网、电子商务、化妆品、时尚等领域的顶尖人士，我们在全国分布多个库房和实体商城，力争让用户在最短时间内收的自己心爱的宝贝。我们来自各地，希望带给您的不只是最高质量的产品，而更重要的是一种向往美丽，热爱生活的生活方式；我们深爱着我们的用户，我们相信互联网的力量，相信一群充满梦想、认真且执着的人能让世界变得更美好，让您变得更美丽。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/46/14/1356419632789.jpg', 'http://p.yiqifa.com/n?k=DE6EpNy1rI6HWEKS6E4H2mquUZgL18H_UmUmfcMyUZPbY8eEYOsH2mLErn3eWlMH6EzS1nDFrnXH2mq_rI6HM9PwMnU86J4H2L--&e=API090507&spm=138655627865015183.1.1.1', '4.2%-17.5%', '2012-11-10 00:00:00', '2013-11-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('153', '2750', '88乐购', '88乐购是一个专业时尚的购物平台，88乐购立志以其高品质的产品和优惠的价格，回馈给所有顾客。88乐购全心全意为顾客提供360度、24小时的全方位购物服务，为所有顾客带来全新的、便捷的、放心的购物体验。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/56/8/1356684532072.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s1N3SrI6HCZg7Rnu_fmUmUSFF1JqyMOosf96drI6HkwA7gPAOrn3e1N4H6EzS1nDFrnXH2mq_rI6H1JWsMnM9WNBH2L--&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-12-29 00:00:00', '2013-12-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('154', '2751', '米薇名品', '米薇美妆化妆品公司于2001年6月成立于浙江杭州，是国内最早一批经营国内外知名化妆品销售的公司。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/53/11/1353396061530.jpg', 'http://p.yiqifa.com/n?k=UsKON9PLrI6HWEKq1n4H2mquUZgL18H_UmUmf9sAUOPAf96_YQLErI6H6Ew7WcLO1n2F6nbHWZLErJoH2mLq69My6JM86cLE&e=API090507&spm=138655627865015183.1.1.1', '12.6%', '2012-11-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('155', '2752', '爱拼团', '爱拼团是以为消费者提供高品质生活服务为宗旨的团购网站，爱拼团开设西安美食、情侣专场、爸妈天地、母婴之家等服务频道，每天为广大会员献上意向不到的产品和惊喜。每日拼一下，生活更精彩。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/36/60/1328846101150.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6NzSrI6HCZg7Rnu_fmgs35FdWERd3OeH2mLErn376lUH6EzS1nDFrnXH2mq_rI6H6J3l3Eyw39BH69M2RKofrj--&e=API090507&spm=138655627865015183.1.1.1', '5.0%-8.0%', '2012-02-11 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('156', '2755', '好淘团', '好淘团中视风尚(北京)文化传播有限公司旗下网站2010.10.28上线，每天团购一次，为你推荐超低折扣的优质服务。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/39/7/1355209273813.jpg', 'http://p.yiqifa.com/n?k=PJAO1KtqrI6HWEKsWn4H2mquUZgL18H_UmUmf9bbYmgbYmgs35Fd3OoVrI6H2mLO1NRLrn3FWEz71ZLLrI6HYmLErnPb3EMb6nzLrIW-&e=API090507&spm=138655627865015183.1.1.1', '6.3%', '2012-12-12 00:00:00', '2013-12-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('157', '2756', '犀利团', '犀利团是国内最早一批专业化妆品特卖网站隶属于南昌起望科技有限公司旗下，网站汇集了互联网、电子商务、化妆品、时尚等领域的顶尖人士，我们来自各地，希望带给您的不只是最高质量的产品，而更重要的是一种向往美丽，热爱生活的生活方式；犀利团每天为您精选一款优质的美妆类产品；犀利团为您争取到最优的团购价格；犀利团让网购变得更加有姿有色', '17', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1357629878292.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWEjSrI6HCZg7Rnu_fmUmUSeFC5qAUZPbY8eEYO7_rI6H2mLmWnjqrn3FWEz71ZLLrI6HYmLErJ6E6lt7153ertKFCZgiUcL-&e=API090507&spm=138655627865015183.1.1.1', '11.2%-18.2%', '2013-01-09 00:00:00', '2014-01-08 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('158', '2758', '俏皮儿', '俏皮儿是消费者最可信赖的时尚精品团购网站！秉承专业、创新、高品质的理念，为消费者发现最值得信赖的商家，让消费者享受超低折扣的优质服务。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/45/51/1358934945644.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6NDSrI6HCZg7Rnu_fmUmUSeqC5B_RJyyR8eEYOsH2mqA3wWOWZPH6EwsWcLO1n2F6nbHWZLErJoH2mqb1n3L6nP9WmLE&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-11-29 00:00:00', '2013-11-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('159', '2759', '尚购名品', '尚购名品（sgmpsc.com）中国最专业的美妆团购网之一，也是国内最早出现的美妆团购网，网站汇聚国内外知名化妆品牌，并且以限时团购的方式，让各位女性朋友低价购买到心中渴望已久的大牌明星化妆品，降低您美丽的代价！尚购名品目前已获得千万元融资，即将发力电子商务，期待与大家共创辉煌！', '17', 'http://image.yiqifa.com/ad_images/reguser/24/36/4/1353656337257.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWlDSrI6HCZg7Rnu_fmUmUSelMOsLROWd3OoVrI6H6wA9g7oCrn3e6nUH6EzS1nDFrnXH2mq_rI6H6E2eMEUb1J6H2L--&e=API090507&spm=138655627865015183.1.1.1', '18.2%', '2012-11-24 00:00:00', '2013-11-23 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('160', '2761', '棒主妇', '棒主妇成立于2010年10月，是国内领先的电子商务网站。棒主妇目前总部位于北京市海淀区高科技园区。基于多年的行业积累，棒主妇拥有几十个厂家的直接供货商，有自己的销售团队和仓储物流体系，所以商品成本可以达到最低，为每一个客户带来最实惠的商品。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/24/8/1323338787595.jpg', 'http://p.yiqifa.com/n?k=pKPPM7uOrI6HWNzFWE6H2mquUZgL18H_UmUmf94bY9UvCZP9UpeEYOsH2mLErn37WnMH6EzS1nDFrnXH2mq_rI6H1nws6lP9WJMH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.03%-10.5%', '2011-12-09 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('161', '2762', '给力团', '给力团（www.glituan.com）是一家专业的女性团购网站。网站汇聚国内外知名化妆品牌，并且以限时团购的方式，让各位女性朋友低价购买到心中渴望已久的大牌明星化妆品，降低您美丽的代价！我们希望带给您美丽惊喜和时尚气息的同时，更重要的是带给您热爱生活，崇尚美丽的生活方式。随着我们进一步的发展，日后给力团将打造成一个全方位的女性垂直性团购网站。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/57/57/1308110204810.jpg', 'http://p.yiqifa.com/n?k=2mLErnt76nDSrI6HCZg7Rnu_fmUmUSecYJy7U5Bdf96_YQLErI6H6NRl6ZLO1n2F6nbHWZLErJoH2mq969tlWn3lMZqB67V8gcbH&e=API090507&spm=138655627865015183.1.1.1', '0.03%-19.6%', '2011-06-09 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('162', '2763', '奥莱团', '奥莱团成立于2010年，是国内较早期的团购网站，网站主要从事化妆品、日用品，服装服饰等全国范围内邮购团购业务。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/22/54/1353390191492.jpg', 'http://p.yiqifa.com/n?k=WQP5YKeprI6HWEKS1n6H2mquUZgL18H_UmUmf9B_YJBAUZPbY8eEYOsH2mLErn3e6nBH6EzS1nDFrnXH2mq_rI6HMnDs3N2mWNbH2L--&e=API090507&spm=138655627865015183.1.1.1', '10.5%—28%', '2012-11-21 00:00:00', '2013-11-20 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('163', '2764', '高朋QQ团', '', '17', 'http://image.yiqifa.com/ad_images/reguser/24/55/55/1366794008975.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1NjOrI6HCZg7Rnu_fOUbYmXyY9RdRQtd3OoVfmLErI6HWNRqWlbH6EzS1nDFrnXH2mq_rI6HWO3L1nM9WnMHNw3ONPyyrj--&e=API090507&spm=138655627865015183.1.1.1', '2.1%-5.6%', '2013-04-25 00:00:00', '2014-04-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('164', '2765', '秀购网', '秀购网创立于2010年6月份，自创立起就秉承着\'高端\'、\'优质\'、\'平价\'的理念，致力于为广大爱美女性创造一家优质高效的化妆品网购平台。秀出你的美，是秀购网的最高诉求，因此我们只卖用户口碑较好，市场热卖的化妆品。相信爱美的您，必定能在秀购网找到最适合您的产品。此外，我们\'100%正品保证\'、\'30天无条件退货\'的服务承诺，必能让您放心购买，放心使用。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1321501460536.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6NzSrI6HCZg7Rnu_fmbAU5U_UpeEYOsH2mLErn3l6l6H6EzS1nDFrnXHMs37kBylrJoH2mLSWlRL6E2O3cLE&e=API090507&spm=138655627865015183.1.1.1', '11.0%', '2011-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('165', '2766', '聚悦网', '聚悦网是一个团购网站，网站自2012年成立以来，经过不到一年时间的发展，已成为国内规模较大、影响力较强的综合型团购平台。目前，聚悦网上的团购商品主要分为“服装配饰”“化妆品”“居家生活”“箱包鞋靴”“生活娱乐”等。', '17', 'http://image.yiqifa.com/ad_images/reguser/24/25/57/1368683318428.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWNjsrI6HCZg7Rnu_fmUmUSehUQysMQUbY9Rd3OoVfmLErJPJ1tqQKZLq6lts6mLO1n2F6nbHWZLErJoH2mLq3lROME3F6QLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-14%', '2013-05-20 00:00:00', '2014-05-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('166', '3698', 'Koolaburra', 'Koolaburra起源于羊皮靴及其它鞋履的欧洲风格品牌，具有19年历史，以流苏羊皮靴造型闻名。结合真正澳洲血统与悠闲的加州风情，经典，简洁的款式渗透最新的时尚感觉，让时尚年轻人的双脚体验舒适低调的奢华，是随性配搭的完美皮靴。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/21/11/1378434967528.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe1n2LrI6HCZg7Rnu_fOV_YOqb3cPSR9tdUJsbYJLd3OoVrI6H2mLq6lDq6ZLO1n2F6nbHWZLErJoH2mq839Wm3NK7McqmUcXNCKsH&e=API090507&spm=138655627865015183.1.1.1', '5%-7%', '2013-09-07 00:00:00', '2014-09-06 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('167', '2606', '李宁', '北京李宁体育用品有限公司由体操王子李宁先生始创于1990年。十余年来，李宁公司由最初单一的运动服装发展到拥有运动服装、运动鞋、运动器材等多个产品系列的专业化体育用品公司。目前，李宁产品有3大类，5000余种，产品结构日趋完善，销售额稳步增长。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/35/61/1338793966950.jpg', 'http://p.yiqifa.com/n?k=2mLErn3OWn6H2mquUZgL18H_UmUmf9KVYJydC5ecf96_YQLErZ4wgPjLgcL76Etqrn3FWEz71ZLLrI6HYmLErnKeW5gyWOKFrIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%-14.0%', '2010-04-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('168', '2607', '古缇女包', 'CT古缇--是国内时尚女性门户妆点网旗下箱包品牌；它特殊的简约风格在全球手袋界可谓独树一帜。古缇倡导时尚不息、追求不止的品牌理念，专为年轻个性、热爱生活、追求时尚的职场女性而设计。旨在以更为平民的价格、高端时尚的品牌价值全面赋予现代女性的充分自信、生活自由化、个性化', '16', 'http://image.yiqifa.com/ad_images/reguser/24/46/14/1273823754501.jpg', 'http://p.yiqifa.com/n?k=67oOgs6FrI6H6l2SWcLErJb7UZjvfSomUmRd3ObSCQWVUJyd3peEYOsH2mLErnDO6lUH6EzS1nDFrnXH2mq_rI6H1549M9g9354H2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-11.0%', '2010-05-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('169', '2609', '视客眼镜', '视客眼镜网成立于2008年，由南京视客品牌推广策划有限公司运营，依托公司强大的光学产品生产能力及集约化的采购优势，结合先进的互联网技术，为您提供最新最全最便捷的眼镜类产品购买及咨询服务。整合资源、合作共赢。视客眼镜网与国内外上百家生产厂家及供应商建立了平等互惠，分工协作的战略关系，与博士伦、视康、强生、海昌、奥克拉、卫康光学、金可集团等知名公司签订了长期代理及供货协议。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/63/63/1348646619777.jpg', 'http://p.yiqifa.com/n?k=2mLErnW76n4H2mquUZgL18H_UmUmfc6AMOHd3OF_rI6H2mL7WnwSrn3FWEz71ZLLrI6HYmLErJtsW52LMn3OrnUf1QXXUZL-&e=API090507&spm=138655627865015183.1.1.1', '0%-21%、37.5元', '2009-08-13 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('170', '2610', 'CAMEL骆驼官方商城', 'Camel骆驼官方商城，是Camel骆驼旗下唯一的官方网络销售平台，销售Camel骆驼登山鞋、男鞋、女鞋、皮具及服装商品。100%专柜正品，品类齐全，价格优惠。支持货到付款，享受7天无理由退换，周到的售后服务让购买更放心。品牌官方商城，绝对正品保证！', '16', 'http://image.yiqifa.com/ad_images/reguser/24/49/15/1318502439359.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWnDSrI6HCZg7Rnu_fmUmUSeE35syYIeEYO7d3OeH2mLErn3lWnPH6EzS1nDFrnXHWmPLWwq3rJoH2mqwMNRS3E2m1QLE&e=API090507&spm=138655627865015183.1.1.1', '6--16%', '2011-10-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('171', '2611', '爱定客', 'IDX爱定客创立于2012年，专业经营及制造个性化定制鞋类的国际品牌，针对全球化市场首发的B2C运动潮流设计平台，将分别在美国、中国、日本、台湾、香港、新加坡等地上市，启动全新产销双重革命的i时尚商业模式。IDX爱定客是全球第一家专为个性化定制鞋而诞生的国际品牌，让您真正做主，让每个人都拥有属于自己个性和ID的潮鞋。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/26/58/1338452950233.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q1N3SrI6HCZg7Rnu_fmUmUSeAMZzd3OoVf96dfmLErI6H6E3SWZLO1n2F6nbHWZLErJoH2mLmME3S353O3QqpgtVQ6lXH&e=API090507&spm=138655627865015183.1.1.1', '0.85%-30.8%', '2012-05-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('172', '2612', '诚镜眼镜网', 'TRIOO诚镜眼镜网_专业一站式设计师品牌眼镜网上商城_网上配眼镜_统一售价258元_7天整镜退换货保障', '16', 'http://image.yiqifa.com/ad_images/reguser/24/60/4/1330415663127.jpg', 'http://p.yiqifa.com/n?k=6NgmKsXcrI6HWEjl6n4H2mquUZgL18H_UmUmfcgSC5o_f96_YpoH2mLErn3sWnPH6EzS1nDFrnXH2mq_rI6H6EUyWE4b3EUH2L--&e=API090507&spm=138655627865015183.1.1.1', '.0%-28.0%', '2012-02-29 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('173', '2613', '何金昌', '何金昌内增高鞋是中国最专业的内增高鞋购物商城，是集研发、生产、销售、品牌战略为一体的内增高鞋专业性企业。公司旗下拥有何金昌、金墨瑞、赫升、乐昂等品牌。从1996年起，专注内增高鞋、坚持不断创新，素有内增高鞋王的美誉。何金昌——寻找高人一点的感觉，立即增高5—13CM。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/6/58/1339059087078.jpg', 'http://p.yiqifa.com/n?k=pcPQYcyfrI6HWE2L1n4H2mquUZgL18H_UmUmfcAcROb_MQWd3OoVrI6H2mLO6EDSrn3FWEz71ZLLrI6HYmLErJDLWnP83NU9rIW-&e=API090507&spm=138655627865015183.1.1.1', '8.4%-15%', '2012-05-28 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('174', '2615', '优乐视', '彩色隐形眼镜专业的隐形眼镜商城30天无条件退货让您安心购物全国服务热线:400-600-5020支持支付宝付款.', '16', 'http://image.yiqifa.com/ad_images/reguser/24/41/9/1282788157402.jpg', 'http://p.yiqifa.com/n?k=2mLErnzL6n4H2mquUZgL18H_UmUmfcPyYZPFf96_YQLErI6H6nwl6QLO1n2F6nbHWZLErJoH2mLs1ngb3Nwl3cq5Cy44PngH&e=API090507&spm=138655627865015183.1.1.1', '1.0%-15.0%', '2010-08-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('175', '2617', '可得眼镜', '可得网（www.keede.com）利用强大的眼镜行业集约采购价格优势、专业的电子商务管理服务经验和最先进的互联网技术为您提供最新最好的隐形眼镜、太阳眼镜及眼镜相关附件产品。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/59/5/1295261990973.jpg', 'http://p.yiqifa.com/n?k=2mLErntsWmLErJb7UZjvfSomUmRdCOPyMJKd3OoVfmLErI6HWE3lrn3FWEz71ZLLrI6HYmLErnKl1NjO6NWSrZXm5tPg6cL-&e=API090507&spm=138655627865015183.1.1.1', '2%-21%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('176', '2618', '麦包包', '麦包包（www.mbaobao.com）中国领先的时尚箱包在线直销网站。目前，麦包包已和国内外60多个品牌商建立了合作，包括米奇、库库、steed、香港金鱼、ailisa、金利来等。网站拥有近万款箱包品种及数量。产品线涉及时尚女包、商务休闲、户外运动、奢侈品等多个系列。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1283138949950.jpg', 'http://p.yiqifa.com/n?k=2mLErntl6mLErJb7UZjvfSomUmRdY54bYO4bYSeEYO7_rI6H2mLS6l4H6EzS1nDFrnXH2mq_rI6H394wWlzm6n6HYweT1B4Frj--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-11%', '2008-11-16 00:00:00', '2014-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('177', '2619', '胡桃夹子', '胡桃夹子品牌箱包商城（HTJZ.com）是正品品牌箱包购物网站和目录销售商以现代化网络销售平台和呼叫中心为服务核心以为用户选品为责任组织产品线品牌正品授权快递送货上门崇尚质量为先客户体验至上。业务模式为品牌直供模式业务范围涵盖了国内外近百个箱包品牌及时尚品牌商品均由国内外品牌厂商授权销售致力于为消费者提供款式、质量、价格均具有优势的箱包产品。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1312275977875.jpg', 'http://p.yiqifa.com/n?k=kKbN3QAErI6HWN2mWn4H2mquUZgL18H_UmUmf9b7Ccud3OoVrI6H2mLs6N2lrn3FWEz71ZLLrI6HYmLErJK76ODq1nterIW-&e=API090507&spm=138655627865015183.1.1.1', '优惠券和特价商品4%，其他12%', '2011-04-07 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('178', '3619', 'mr.ing', 'Mr.ing是广州羊皮堂鞋贸有限公司旗下的的品牌。该公司是一家专注于鞋类的模仿开发和销售网络贸易公司，该公司起家于淘宝。致力于通过低成本的电子商务网络平台向消费者提供低价的鞋类产品，始终倡导：先销售，后生产的低成本运营模式！以低价诱使消费者产生购买欲望，从而打造零库存低成本的全新的网络销售模式。 广州羊皮堂鞋贸有限公司旗下品牌“Mr.ing”无专属工厂，所有产品均找当地小厂贴牌生产，这可以进一步的为消费者降低成本。致力将Mr.ing打造成网络平台最物廉价美鞋类品牌。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/18/14/1371114485027.jpg', '', '4.5%-15%', '2013-06-14 00:00:00', '2014-06-13 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('179', '2631', '爱莱网', '爱莱网是官方授权的正品名牌隐形眼镜折扣商城，产品全部来自博士伦、强生、卫康、海昌、科莱博等知名企业，并且是卓越亚马逊隐形眼镜合作供应商，为用户提供优质的货品和服务，首创团购活动式购物模式，让你随时享受团购式低价的同时，更有意想不到的促销活动和礼品，惊喜不断！花点时间好好挑选，好好算算，每次都会有聚划算的购物组合。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1333004730104.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6N2SrI6HCZg7Rnu_fmUmUSebC5qAM54yf96_YQLErI6H6EK76cLO1n2F6nbHWZLErJoH2mq86NzS3O68MZq7WmP53cyH&e=API090507&spm=138655627865015183.1.1.1', '2%-14%', '2012-03-30 00:00:00', '2013-03-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('180', '2632', '特步', '特步，时尚运动第一品牌，其特步官方网店在线销售最新最全的特步（XTEP）、迪士尼（DISNEY）运动鞋服商品，会员专享购物特权，与明星同搭，让运动与众不同！', '16', 'http://image.yiqifa.com/ad_images/reguser/24/9/55/1315547385410.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWN3SrI6HCZg7Rnu_fmUmUSeFUJPLf96_YpeEYcLErZy4YyB!McLOWNKlrn3FWEz71ZLLrI6HYmLErJ496EReWnWerIW-&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2011-09-10 00:00:00', '2013-10-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('181', '2634', '买包去', '买包去商城成立于2011年，是一家经营时尚包包、品牌包包、包包个性化定制等箱包产品的B2C电子商务公司，致力于为16-35岁的时尚青年提供能够彰显个性、物超所值的产品。包包网拥有自己的箱包生产工厂，2012年6月份仅工厂工人就已经达到600人包包网商城期待买家们能用最低的价格，体验最新时尚趋势。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/9/9/1346728559942.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6N3SrI6HCZg7Rnu_fmUmUSeV35y835oqUpeEYcLErBX8YngcRcLO1nWLrn3FWEz71ZLLrI6HYmLErJ6w65tL6nB9rIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2012-09-06 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('182', '2635', '包包树', '包包树购物商城（www.bagtree.com）成立于2007年，是一家经营时尚包包、品牌包包、包包个性化定制等箱包产品的B2C电子商务公司，致力于为16-35岁的时尚青年提供能够彰显个性、物超所值的产品。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/43/11/1344396636224.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWNjsrI6HCZg7Rnu_fmUmUSe835U7R9Pyf96_YQLErJb45QAC3QLO6lRsrn3FWEz71ZLLrI6HYmLErn3mM9gw354brIW-&e=API090507&spm=138655627865015183.1.1.1', '0.85%-12.0%', '2012-08-08 00:00:00', '2013-08-07 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('183', '2636', '红蜻蜓官方商城', '红蜻蜓官方商城是浙江红蜻蜓电子商务有限公司旗下官方销售网站，销售红蜻蜓集团旗下品牌的鞋、包、服饰等产品。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1349775133826.jpg', 'http://p.yiqifa.com/n?k=2mLErn276EDSrI6HCZg7Rnu_fmUmUSFsW5bqUIeEYOsH2mLErn3F1N4H6EzS1nDFrnXH2mq_rI6HMEwq3NDS1NgHNZXxpcgBrj--&e=API090507&spm=138655627865015183.1.1.1', '2.8%-10.5%', '2012-10-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('184', '2637', '安踏', '1994年，在福建晋江的一家制鞋作坊门口第一次挂上了安踏的标志，经过十几年的发展，安踏体育用品有限公司现已成为国内最大的综合体育用品品牌公司之一，并于2007年在香港成功挂牌上市。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/21/11/1352277427179.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6nDlrI6HCZg7Rnu_fmUmUSebYcgbf96dfmLErI6H6EwlWZLO1n2F6nbHWZLErJoH2mq9653qMEts3cqTkwVMRy6H&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2012-11-09 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('185', '2638', '爱戴眼镜网', '爱戴网是国内领先的网上眼镜商城，主要针对白领用户提供时尚的高品质眼镜产品。关爱（Icare）、配戴（Iwear）是爱戴网的关注重心。基于细致专业的视力关爱才会有时尚自由的眼镜配戴，这就是爱戴的品牌涵义。我们希望通过努力，让您在享受专业眼健康呵护的同时，又让您选用的眼镜产品更符合您的气质和品位。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1342083028474.jpg', 'http://p.yiqifa.com/n?k=CB6FWBULrI6H1N27WcLErJb7UZjvfSomUmRd35yw35wd3OoVfmLErI6H6NjFWmLO1n2F6nbHWZLErJoH2mqwWJ4E6lU96ZLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-24.0%', '2010-10-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('186', '2639', '晶品网', '晶品网专业从事框架眼镜、隐形眼镜、美瞳、墨镜等眼镜全系列产品网络销售。是迄今为止中国互联网上最年轻、最尊重消费者权益、最专业、最全面、上新速度最快、最时尚、最值得信赖的B2C式网上购物商城。晶品网联合国内最大眼镜生产基地着力于为消费者提供验光、配镜、调试、返修一站式贴心服务，足不出户即您可拥有量身定做、独一无二的眼镜。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1298020160745.jpg', 'http://p.yiqifa.com/n?k=2mLErntq6NzSrI6HCZg7Rnu_fmUmUSehRJPyY8eEYO7_rI6H2mLsWlRSrn3FWEz71ZLLrI6HYmLErJWFMJKFW5g8rZAf6yWl3mL-&e=API090507&spm=138655627865015183.1.1.1', '3.5%-21.0%', '2011-02-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('187', '2640', '意大利零度', '零度是意大利零度(集团)控股有限公司旗下的一个鞋品牌，其授权厦门零度尚品商贸有限公司为中国的品牌运营商。零度品牌的亮相无疑为国内意式商务休闲增添了浓墨重彩的一笔，她将把意大利2000余年的鞋文化原滋原味的传送给中国消费者，让消费者切身感受到意大利制鞋的精湛工艺以及其渗透的文化习俗和鞋履演变出的人类行走的艺术和历史，决意在中国引领欧味时尚！正如零度公司创始人的格言——我们一直被模仿，但我们从未被超越！', '16', 'http://image.yiqifa.com/ad_images/reguser/24/9/9/1283224795387.jpg', 'http://p.yiqifa.com/n?k=2mLErnzq6n4H2mquUZgL18H_MQAyR9olCJoLf96_YpoH2mLErnDe6NXH6EzS1nDFrnXH2mq_rI6HWEP96JDe6nUHPwtqR7gDrj--&e=API090507&spm=138655627865015183.1.1.1', '1.0%-14.0%', '2010-09-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('188', '2641', '易视眼镜网', '易视隐形眼镜EaseEyes是由上海明庭贸易有限公司倾力推出的专业在线购物平台。利用强大的隐形眼镜集约采购价格优势、专业的电子商务管理服务经验和最先进的互联网技术为用户提供最新最好的隐形眼镜和眼镜相关附件产品。以及最方便快捷的配送渠道和优质售后服务。易视与各大隐形眼镜制造商有着良好的合作关系，经营的产品皆为正规渠道引进的原厂正品，有着完善的换货、退货与售后服务制度。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/10/54/1355899689599.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WNDSrI6HCZg7Rnu_fmUmUSey3Q6yMQyyRSeEYO7_rI6H2mLO1nRmrn3FWEz71ZLLrI6HYmLErnjSM92l65KlrBAwg5ovPmL-&e=API090507&spm=138655627865015183.1.1.1', '1.05%-19.6%', '2012-09-27 00:00:00', '2013-09-26 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('189', '2643', '优购网上鞋城', '优购网上鞋城由行业巨头投资，依托资方强大的供应链、资金及品牌优势，目前与Nike、Adidas、Kappa、Converse、Belle、Teenmix、Tata、Staccato等众多知名商家达成销售协议，保证所销售产品的质量、品类、价格强大的竞争力，同时完善的网络技术为消费者提供更方便的产品查询、更全面的产品介绍，为满足消费者个性化需求提供强有力的保障。优购网上鞋城秉承买好鞋上优购的网站定位，依托强大的供应链、资金及品牌优势，与众多知名商家达成销售协议，经营范围涵盖了男鞋、女鞋、童鞋、运动鞋、运动服、箱包、户外七大品类，众多时尚潮流新品。优购网上鞋城在质量、品类、价格等方面具有强大市场竞争力的同时正在不断完善网络技术为消费者提供更方便的查询、更全面的介绍，更周到的服务以及个性化的购物需求。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/17/15/1309349239330.jpg', 'http://p.yiqifa.com/n?k=2mLErnts1n3SrI6HCZg7Rnu_fmUmUSeeYmPcYmKd3OoVrI6H2mLs1n2Lrn3FWEz71ZLLrnU!W5gNUZq_rI6H3Ejs393SMEMH2L--&e=API090507&spm=138655627865015183.1.1.1', '4.0%', '2011-06-30 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('190', '2644', '龙凤商城', '龙凤商城是一家专注于休闲皮鞋，女士皮鞋，男式商务皮鞋，男士正装皮鞋等产品的国内最大全品类鞋服箱包类购物商城，于2012年8月正式上线，产品涵盖男鞋、女鞋、皮包、钱包、特色皮带等范围，主推龙派与凤族这两款商城自营品牌，是中国职场白领最喜爱的十大购物平台之一。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/14/14/1368075657161.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWnzlrI6HCZg7Rnu_fmUmUSexYOecM9PdMSeEYO7_rI6HYEXmRsBvrntmWN3Lrn3FWEz71ZLLrI6HYmLErJBb6EWmMnRlrIW-&e=API090507&spm=138655627865015183.1.1.1', '14%', '2013-05-16 00:00:00', '2014-05-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('191', '2621', '佑一良品', '佑一良品，原创服饰领航者！风格定位：精练、唯美、实用。目前在线销售的产品线包括女包、男包、时尚数码包、休闲背包、皮具和儿童包6大系列，并代理经销首饰、服饰等商品，首创国际品牌在线直销和线下专卖店双渠道分销模式。佑一良品信奉诚意具足+创意无限+资本雄厚=无往不利三位一体的成功公式，正在引领原创服饰品牌在中国的线上市场。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/19/51/1298600079775.jpg', 'http://p.yiqifa.com/n?k=2mLErntq6ljSrI6HCZg7Rnu_fmUmUSesCQyAf96df7gyM9BsYZDd3Q6LkZLErJV6UtPDYZLsWlwLrn3FWEz71ZLLrI6HYmLErnPw3EzeWNUwrIW-&e=API090507&spm=138655627865015183.1.1.1', '3%-12%', '2011-02-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('192', '2623', 'RAX户外', '厦门市瑞行电子商务有限公司，是泰亚鞋业股份有限公司（股票代码：002517）斥巨资新成立的全资子公司，全权负责旗下户外品牌RAX的研发、生产、经营。公司秉承上市公众公司完善治理结构、规范运作方面经验，发挥集团公司产业链优势、资源优势、产品技术优势，目标将RAX打造成为微户外第一品牌。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/31/63/1326855341469.jpg', 'http://p.yiqifa.com/n?k=2mLErntF1NjSrI6HCZg7Rnu_fmUmUSeS3Qzd3OeH2mqEYB4fPEUH6EDSWZLO1n2F6nbHWZLErJoH2mL73EUE653S6mLE&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2011-12-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('193', '2626', '拍鞋网', '拍鞋网，总部位于福建晋江，2007年10月上线，是中国最早一批正品鞋类B2C企业之一，积极倡导乐趣、互动、分享全新的正品网购理念。目前，拍鞋网注册用户突破150万，页面点击数超过300万次/天。拍鞋网始终以提高顾客满意度为宗旨，在国内率先实行全网最低差价返还政策，为消费者努力打造一站式的轻松购鞋网络商城而努力！', '16', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1338168706995.jpg', 'http://p.yiqifa.com/n?k=WcgZ3KHLrI6H6EzSWcLErJb7UZjvfSomUmRdRJBAkJyyf9eyUIoH2mLErnDmWnyH6EzS1nDFrnXH2mq_rI6HWJDSW9M869BH2L--&e=API090507&spm=138655627865015183.1.1.1', '4-20.8%', '2010-05-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('194', '2627', '亿超眼镜', '杭州亿超电子商务有限公司，成立于2005年5月，注册资金500万，是一家通过网上电子商务平台与眼镜店实体相结合的创新型眼镜零售企业。目前在杭州已拥有多家专业配镜实体店，网络总部坐落于杭州东方电子商务园，公司总规模达1000多平方米。亿超旗下独立运营的网站包括亿超配镜网，是目前国内最专业的网上配镜商城。商城内经营包括镜架、镜片、隐形眼镜、太阳镜、游泳镜、老花镜等的批发零售。范围囊括了各大知名品牌，如古驰、海昌、卫康、博士伦、海豚、派丽蒙等。还有亿超原创品牌：亿超、品秀、37度、安踏。亿超眼镜提出不同场合佩戴不同眼镜，把传统的分类方法融合进自己独创的按场合划分，使顾客在寻找产品是更方便快捷。经过多年的努力，我们在眼镜行业已得到了很大的发展和进步，客户遍布中国各地，甚至美国、新加坡等国家。作为最早的提供在线配镜的公司，亿超眼镜更会走在行业的最前端，将网络配镜发展的更专业更便捷更有品质。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/18/14/1329284222328.jpg', 'http://p.yiqifa.com/n?k=kPAqKOAsrI6HWNws6n4H2mquUZgL18H_UmUmfcyA3ObbYSeEYcLErI6H6EDF6cLO1n2F6nbHWZLErJoH2mqyM9K73NbyMZLE&e=API090507&spm=138655627865015183.1.1.1', '3%-14%', '2012-02-16 00:00:00', '2014-02-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('195', '2628', '麦鞋趣', '麦鞋趣由上海钧钛电子商务有限公司倾力打造的网购平台成立于2011年7月份，并于11月8日正式上线试运营。麦鞋趣是一专注于为女性提供时尚鞋品的购物平台，利用创新的主题导购模式，让购物无比简单，深信无论任何场合的搭配，都能在麦鞋趣快速找到合适的鞋款。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/27/5/1348824600098.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWN2SrI6HCZg7Rnu_fmUmUSeVkQbAMQBsf96_YQLErI6H6EDeWmLO1n2F6nbHWZLErJoH2mLmMN4965Kq6QqWPlMgM5BH&e=API090507&spm=138655627865015183.1.1.1', '0.0%-28.0%', '2012-02-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('196', '2629', '美睛眼镜网', '美睛网是国内领先的专注于眼睛行业的垂直B2C网上眼睛商城，由一群来自中国人民大学的年轻人联合浸润眼镜行业多年的业内人士发起创办。凭借集约采购形成的突出价格优势、领先的平台技术能力、强大的互联网运营推广能力以及完善的电商服务体系。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/45/13/1335354169979.jpg', 'http://p.yiqifa.com/n?k=pB4ypmXXrI6HWNweWn4H2mquUZgL18H_UmUmf9syC5AAY9Rd3OoVfmLErI6H6EDe6QLO1n2F6nbHWZLErJoH2mq86OPbWJD7McLE&e=API090507&spm=138655627865015183.1.1.1', '2%-21%', '2012-02-24 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('197', '2630', '哇咕哇咕', '哇咕哇咕---品牌、品质、时尚网上商城是由广东苹果实业有限公司投资成立的中国F2C市场最大的皮具商城之一，是中国电子商务领域最受消费者欢迎和最具影响力的电子商务网站之一，涵盖皮包、皮鞋、钱夹、手包、雪茄盒、手机套等多项皮具系列产品，致力于为中国消费者提供最优质的皮具产品为己任，提供高性价比的商品，以不断创新的科技与服务，努力让每一位有品位的商务人士更加自信。哇咕哇咕网上商城秉承以人为本的服务理念，全程为个人用户和企业用户提供人性化的全方位服务，努力为用户创造亲切、轻松和愉悦的购物环境；不断丰富产品结构，以期最大化地满足消费者日趋多样的购物需求。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/45/51/1323253489580.jpg', 'http://p.yiqifa.com/n?k=2mLErntF1nzFrI6HCZg7Rnu_fmUmUSFsWQUbMmKd3OoVfmLErI6H6EDLWmLO1n2F6nbHWZLErJoH2mq9MNDO1NDO1ZqZYwH7gEMH&e=API090507&spm=138655627865015183.1.1.1', '3.5%-14.0%', '2011-12-08 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('198', '2507', '买买鞋', '买买鞋创立于2012年12月，由拥有雄厚实力的陕西驼城投资管理集团公司投资创办，注册资本1000万元，自有营业办公面积1100平方米。总部设在妈祖故乡莆田。为打造最具影响力的互联网鞋类时尚品牌，买买鞋提出了体验式营销理念：线上商城网购，线下实体店试穿体验，引领了新一代的时尚新名词：“一起上街网购吧！”买买鞋以诚信、整合、锁定、公平、分享、共赢为关键理念，为消费者提供“正品保障”、“7*24小时服务”、“7天无理由退换货”的服务承诺，定位于一站式服务平台，实现体验式网购。买买鞋商城以经营优质名品鞋类为主，产品囊括男鞋、女鞋、运动鞋、户外鞋、童鞋五大品类，全面满足消费者多样化的个性购物需求，买买鞋希望通过整合多方资源，在带给消费者优质海量时尚产品的同时，也让购物变得更简单、更轻松、更愉快。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1361164628038.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWnjSrI6HCZg7Rnu_fmUmUSevCJPdkJyyUOBdMSeEYOsH2mLErnRLWlbH6EzS1nDFrnXH2mq_rI6H6E2FW5496J4HUsbBpwb8rj--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10.5%', '2013-03-25 00:00:00', '2014-03-20 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('199', '2602', '名鞋库', 's.cn名鞋库（前身skomart名鞋库）中国最高性价比名牌鞋的倡导者和先行者。专业网络销售Nike、Adidas、Puma、Kappa、Converse、Reebok、Lining等国际名牌的折扣正品鞋。s.cn名鞋库的使命：让年轻人买得起正品名牌鞋！全力为顾客朋友提供超值好鞋及亲切便捷的购物体验！', '16', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1280367269666.jpg', 'http://p.yiqifa.com/n?k=2mLErnDq6E4H2mquUZgL18H_UmUmfcWd3OeH2mLErnDq6NMH6EzS1nDFrnXH2mq_rI6HWJWsWNRL6NyH5Qg5YKefrj--&e=API090507&spm=138655627865015183.1.1.1', '3.2-9%', '2009-09-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('200', '2603', '维思诺', '维思诺(北京)科技有限公司旗下的维思诺品牌源于典雅而深邃的意大利风情，融入了后现代的浪漫主义基调，经由世界顶尖设计大师们的精心演绎，形成了维思诺特有的尊贵气质和经典韵致。维思诺目前以男式系列皮鞋为核心产品，面向崇尚自然、追求现代、热衷个性的都市商务族群。', '16', 'http://image.yiqifa.com/ad_images/reguser/24/29/3/1312853265096.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWn4H2mquUZgL18H_UmUmfcMlY9o_Y8e_R9UH2mq!CZBQYyAH6ntlWZLO1n2F6nbHWZLErJoH2mLOM5tm15K7MZLE&e=API090507&spm=138655627865015183.1.1.1', '14.0%-20.0%', '2009-09-09 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('201', '2501', '海泰客', 'HI-TEC(海泰客)-英国第一的户外运动品牌2009全球销量第一，专业制造户外鞋徒步鞋登山鞋溯溪鞋及其他户外运动装备高科技成就更舒适的户外运动', '15', 'http://image.yiqifa.com/ad_images/reguser/24/6/6/1291198182949.jpg', 'http://p.yiqifa.com/n?k=2mLErnwL1n4H2mquUZgL18H_UmUmf9bAfQgy3SeEYcLErI6H6Njs1QLO1n2F6nbHWZLErJoH2mL7W5WSWNwl6cqgCZ6BkwsH&e=API090507&spm=138655627865015183.1.1.1', '13.0%-14.0%', '2010-10-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('202', '2502', '抠抠网', '抠抠网自成立之初，无论是商品供应还是销售渠道的构建，都坚持”时尚正品”路线，一直引领国内户外运动时尚潮流。公司不仅具有丰富的商品线，同时充分发挥自身优势，不断引进国际一线品牌。', '15', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1328601030649.jpg', 'http://p.yiqifa.com/n?k=2mLErn2LWNjSrI6HCZg7Rnu_fmUmUSeiYmPEYJHd3OoVrI6HKQU21BKsrn376l6H6EzS1nDFrnXH2mq_rI6HWlUw1JWq65gH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-14.0%', '2012-02-08 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('203', '2504', '优个网', '优个网是中国领先的运动用品专业商城，B2C明日之星TOP30榜唯一一家运动用品网上商城。优个网经营羽毛球、乒乓球、网球、户外运动所需商品，涉及李宁、YONEX、Wilson、Prince、Butterfly、Stiga、Columbia、凯乐石、LP等诸多中高端运动品牌，客单价显著高于同类网站。优个网秉持正品低价经营策略，经4年发展目前已成为运动爱好者心目中的知名网站。', '15', 'http://image.yiqifa.com/ad_images/reguser/56/26/38/1321428549892.JPG', 'http://p.yiqifa.com/n?k=2mLErntFWl3SrI6HCZg7Rnu_fmUmUSeeYOUyR8eEYO7d3OeH2mq5RZzqR76H6EW76ZLO1n2F6nbHWZLErJoH2mqyWO4E6Ey86cLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2011-11-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('204', '2505', '乐活360', 'M360乐活户外生活馆打造的是一个平民化户外生活用品的消费平台，旨在向中国消费者传达一种健康的乐活户外的生活理念，提供家庭乐活户外生活休闲用品的全案解决。', '15', 'http://image.yiqifa.com/ad_images/reguser/24/42/10/1303810300021.jpg', 'http://p.yiqifa.com/n?k=2mLErnt7WlzSrI6HCZg7Rnu_fmUmUSeVWl3Lf96_YpeEY8oH2mqZCws2K74H6NKF1ZLO1n2F6nbHWZLErJoH2mq8MNMyMJtm6ZLE&e=API090507&spm=138655627865015183.1.1.1', '1.0%-9.0%', '2011-04-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('205', '2506', '极限户外', '极限户外商城隶属于极限户外网是由专职户外人士，为大众户外爱好者，提供专业、高品质户外用品的Ｂ2Ｃ商城。商城经销全系列户外用品，产品涵盖帐篷、睡袋、户外服饰、登山鞋、户外背包等全系列户外装备及配件。极限户外商城自2010年11月28日上线以来，秉承”推动中国户外事业全面发展”的服务宗旨，致力于将”极限户外”打造成为中国大众的世界顶级户外用品品牌，是中国户外用品领域最具影响力和最受消费者欢迎的电子商城网站，同时也是户外爱好者心中高品质户外用品的代言词。提供100%正品保证、假一赔十、15天退换货、满68元包邮的金牌服务承诺。', '15', 'http://image.yiqifa.com/ad_images/reguser/24/51/51/1359010152251.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWEzlrI6HCZg7Rnu_fmUmUSeFYmP7ROb_RIeEYcLErI6H6EW7WQLO1n2F6nbHWZqeMEUAWKMHYmLErng83N3l6l3OrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.0%-20.0%', '2011-10-28 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('206', '3627', '车速递', '车速递租车成立于2009年，是全国首家专注于个人消费者的连锁汽车租赁企业。车速递在上海、北京、深圳、杭州四大城市设有分公司，形成了全国性的连锁租车网络，车队规模年增长率超过200%。截止2012年底，公司车队规模达到近2000台，100%自有产权，在同类企业中排名第三。', '14', 'http://image.yiqifa.com/ad_images/reguser/24/54/10/1367049156422.jpg', 'http://p.yiqifa.com/n?k=PtoC3wPdrI6HWlzm6n6H2mquUZgL18H_UmUmf96uMQ6sMJwd3OoVrI6H2mLq6lt71ZLO1n2F6nbHWZLErJoH2mLl6nBb6EjsWmLE&e=API090507&spm=138655627865015183.1.1.1', '5.60%', '2013-04-28 00:00:00', '2014-04-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('207', '3631', '特维轮', '特维轮隶属于杭州金特维轮汽车配件有限公司？，特维轮采取线上线下相结合的商业模式销售轮胎等汽车配件，并同时提供换胎、补胎、动平衡、四轮定位相关服务。依托强大的网上销售平台和全天候响应的400专线客服、手机APP客户端，凭借高密度的连锁门店、首创的移动车上门服务，为广大车主提供优质的服务体验。特维轮秉承“便捷、专业、低价”的服务理念，遵循“整体规划，分布实施，快速发展”的总体发展思路，以市场为导向，以制度创新为基础，以技术创新为动力，树立“以人为本、人尽其才”的精神，致力于中国汽车后市场服务，打造全方位一站式服务体验。', '14', 'http://image.yiqifa.com/ad_images/reguser/24/57/57/1371637065918.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF1N3SrI6HCZg7Rnu_fmUmUSe7YOomM5qxf96_YQLErI6HWNRS6nyH6EzS1nDFrnXHpPgn6QB_rJoH2mL76NBbMNReMcLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10.5%', '2013-06-20 00:00:00', '2014-06-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('208', '2401', '迈车品', '迈车品目前是深圳市凯隆科技有限公司旗下经营网络品牌商城。&ldquo;迈车品&rdquo;在汽车用品行业已形成良好的口碑，专注品质，正品直销。目前与深圳地区所有4S店均有着长期深入的战略合作，迈车品已代理品牌有：龟牌，快美特，美途，威卡司，伊士百得，佳露思，太普儿，艾瑞斯，爱车屋，台湾DOD，京华，奥舒尔，纽福克斯，风王，STP，SOFT99，卡饰社等。我们利用强大的全球化集约采购优势、丰富的电子商务管理服务经验和最先进的互联网技术为您提供最新最好的产品。', '14', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1340681632466.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6nzSrI6HCZg7Rnu_fmUmUSeV3ObyRJydf96_YQLErtbdN9WmgZLO6EzLrn3FWEz71ZLLrI6HYmLErnM96nyE6NR7rIW-&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2012-06-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('209', '2402', '车保网', '车保网是由具备12年汽车零配件销售经验的广州市安鸣汽车配件有限公司于2011年创建，是国内领先的产品与车型精确绑定、线上线下一体化服务的大型汽车保养产品综合网上商城。总部设在广州，自建仓储基地，网络销售刹车片、润滑油、蓄电池、滤清器、雨刮片等汽车保养品，均是来自全球顶级知名配套厂商。同时携手具备一、二类、专修维修资质的大型综合维修厂（专修店只提供单一品牌车维修、专修服务），车主在便捷购物之后还可以在汽车保养在线签约的定点维修机构享受可靠、便捷、优惠的安装、保养、维修等相关服务。', '14', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1369290711276.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6lzSrI6HCZg7Rnu_fmUmUSeECJP835Hl6Ejd3OoVfmLErI6H6lj71QLO1n2F6nbHWZLErJoH2mqw69gwW5t76cq2kEBsgweH&e=API090507&spm=138655627865015183.1.1.1', '3.5%和5.6%', '2013-02-28 00:00:00', '2014-02-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('210', '3691', '美色商城', '美色商城（www.Xmeise.com）是北京鸿元思美商贸有限公司旗下网站，公司一直秉承诚信经营，为广大用户提供品质优良的成人用品。作为一家专业的成人用品电子商务网站，“美色商城”得到国际众多知名成人用品供应商的鼎立支持，完善的资质、专业规范的进货渠道、优质的服务口碑、高效物流保障，确立了美色商城在同行业中领先的地位，美色商城已经成为中国情趣文化的倡导者，领航者', '13', 'http://image.yiqifa.com/ad_images/reguser/24/60/4/1378362439772.jpg', 'http://p.yiqifa.com/n?k=gPP9POexrI6HWlwm6NPH2mquUZgL18H_UmUmfcbVM5ylMpeEYOsH2mLErntm6nj7rn3FWEz71ZLLrI6HYmLErn2FMnDqMNKOrIW-&e=API090507&spm=138655627865015183.1.1.1', '21%-31.5%', '2013-09-03 00:00:00', '2014-09-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('211', '2301', '春水堂', '春水堂，由中国性学会常务理事、中国性教育专业委员会委员蔺德刚先生于2003年创建。目前国内最具品牌影响力的情趣用品连锁零售企业之一，在全国拥有50家加盟店和3家直营店，被验证成功的商业模式、优秀的运营能力和领导团队、强大的品牌影响力，3者结合，使春水堂成为您值得与之共同创业的合作伙伴', '13', 'http://image.yiqifa.com/ad_images/reguser/24/53/53/1315358558876.jpg', 'http://p.yiqifa.com/n?k=2mLErnWS6n4H2mquUZgL18H_UmUmf96uU5elCZPAUJBdMSeEYO7_rI6HYws3YOBVrnDL6EBH6EzS1nDFrnXH2mq_rI6HWljF3EbE6EyH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.7%-27.0%', '2009-07-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('212', '2302', '桃花坞', '公司介绍：桃花坞是国内发展最快的成人用品B2C商城！网站在用户群中口碑极高！公司专注于品牌正规成人用品的零售。公司口号：专注、品牌、规模、信誉！', '13', 'http://image.yiqifa.com/ad_images/reguser/24/7/57/1285645835435.jpg', 'http://p.yiqifa.com/n?k=2mLErnzm1n4H2mquUZgL18H_UmUmfcgbYObOf96_YpeEYcLErI6H6NjS6QLO1n2F6nbHWZqAUwbgMwUHYmLErnj76EDFMERsrIW-&e=API090507&spm=138655627865015183.1.1.1', '7%-28%', '2010-09-29 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('213', '2303', 'LC品爱网', 'LC品爱（LClovecosmetic）诞生于2003年的日本东京。LC品爱以坚持主张使用植物成分研制”爱情”化妆品吸引了大批忠实的追随者。日本各大杂志以及电视节目中被屡屡提及，更是创造了”闺蜜”潮流。', '13', 'http://image.yiqifa.com/ad_images/reguser/24/36/4/1348471684426.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6n3lrI6HCZg7Rnu_fmUmUSe_C54skpeEY8obRcgA3Oqyfm6uYmRVWNjOf9b7YQLErZjSpy41CQLO1nRqrn3FWEz71ZLLrI6HYmLErJ3sM9DsWnw7rIW-&e=API090507&spm=138655627865015183.1.1.1', '9.0%', '2012-09-25 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('214', '2304', '潘朵拉', '潘朵拉情趣商城由潘朵拉（北京）电子商务有限公司运营，主营全球领先的高端情趣商品，品牌遍布欧亚美澳各大洲，是目前国内最专业的情趣用品网上商城。', '13', 'http://image.yiqifa.com/ad_images/reguser/24/29/61/1357461573704.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWNzSrI6HCZg7Rnu_fmUmUSeL35ewU5ox3peEYOsH2mLErn3e1NbH6EzS1nDFrnXH2mq_rI6H3EwlWJ2sWEBH6OAs3w6erj--&e=API090507&spm=138655627865015183.1.1.1', '4.9%-28.0%', '2013-01-07 00:00:00', '2014-01-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('215', '2306', '七彩谷', '七彩谷在海外风险投资的支持下成立，是从事BtoC网上购物的大型专业电子商务平台。七彩谷是中国最大的浪漫、健康精品网，目前经营滋补强身、成人用品、避孕测孕、情趣内衣、保健品、个人护理六大类共8000多种商品。在广大顾客的热心支持下，经过多年多坚定不移的努力，七彩谷已经取得了在滋补强身、成人用品、避孕测孕、情趣内衣、保健品和个人护理同行业全国网上销售第一的好成绩。七彩谷以齐全的商品种类、可靠的商品质量、优惠的商品价格、灵活多样的订购方式、快捷周到的服务赢得了广大消费者的信任和好评。', '13', 'http://image.yiqifa.com/ad_images/reguser/24/3/3/1261378299209.jpg', 'http://p.yiqifa.com/n?k=2mLErntmWQLErJb7UZjvfSomUmRd6O6Of96_YQLErI6HWER7rn3FWEz71ZLLrBUXUsMVKQq_rI6H39te1JWs1JMH2L--&e=API090507&spm=138655627865015183.1.1.1', '10.0%-28.0%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('216', '2307', '桔色', '桔色网[www.X.com.cn]始于1997年，至今已有12年历史，是前中国性学会官方网站。桔色致力于倡导大众坦然面对房事健康，并向大众提供高品质房事健康用品，夫妻生活更为和谐。完善的资质、规范的进货渠道、假一赔十的品质承诺、优质的服务口碑，确立了桔色－中国性健康行业第一品牌。', '13', 'http://image.yiqifa.com/ad_images/reguser/24/58/6/1261377412172.jpg', 'http://p.yiqifa.com/n?k=2mLErnKSWcLErJb7UZjvfSomUmRdkIeEYO7d3OF_rI6H3OggpyPxrnWqWQLO1n2F6nbHWZLErJoH2mLO1N2SM5gb6cLE&e=API090507&spm=138655627865015183.1.1.1', '28.0%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('217', '2308', '爱之谷商城', '爱之谷公司是从事BtoC网上购物的大型专业电子商务公司，旗下电子商务平台爱之谷网上商城已成为国内专业成人用品门户网站。爱之谷商城目前经营的项目有保健品、男女健慰器、情趣内衣、丰胸产品、男性壮阳、避孕测孕等成人用品，共八大类9000多种商品。在广大用户的热心支持下，经过坚定不移的努力，爱之谷商城已成为国内专业的成人用品行业网站。爱之谷商城以齐全的商品种类、可靠的商品质量、最低的商品价格、灵活多样的订购方式、快捷周到的服务赢得了广大消费者的信任和好评。', '13', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1330407307303.jpg', 'http://p.yiqifa.com/n?k=2mLErntl1ZLErJb7UZjvfSomUmRd35yvCJycUpeEYO7_rI6H2mLS6lUH6EzS1nDFrnXHPtsARw2SrJoH2mLOW5KO6EWL3mLE&e=API090507&spm=138655627865015183.1.1.1', '18%-33%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('218', '2309', '爱优商城', '爱优商城是一家专注于网上经营情趣用品的互联网B2C商城，目前的商品组成主要由男性玩具、女性玩具、双人情趣、润滑剂、性感服饰以及安全套几个大类组成。通过爱优商城的不懈努力和消费者的大力支持，爱优商城每年都保持了高速增长，用户数量也大幅增加。在未来的发展中，爱优商城将进一步丰富产品种类，加强用户体验，力争以最丰富的选品、最具竞争力的价格和最优质的客户体验成为消费者选购成人用品的首选网上商城。', '13', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1370332806029.jpg', 'http://p.yiqifa.com/n?k=pP6mWn6yrI6HWlzl6EbH2mquUZgL18H_UmUmfE2q6NKd3OoVfmLErI6HWNRSWNBH6EzS1nDFrnXH2mq_rI6HMEX93lw735MH2L--&e=API090507&spm=138655627865015183.1.1.1', '7%-28%', '2013-06-04 00:00:00', '2013-06-03 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('219', '3665', '健康123CPS', '公司位于北京市崇文区新世界商圈的繁华区域的五星级写字楼，步行到天安门广场、前门大街只需不到10分钟。公司拥有最雄厚的人力资源队伍，以最先进、最快捷和最有效的方式提供全球最优质的原装进口营养保健产品，同时为所有购物人员提供一对一的健康顾问咨询服务以及后期使用效果跟踪服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1368775100244.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6NRFrI6HCZg7Rnu_fmUmUSehCltSWSeEYOsH2mLErntmWNR7rn3FWEz71ZLLrI6HYmLErnR73EBbWOWOrJqDkP3FCmL-&e=API090507&spm=138655627865015183.1.1.1', '7%-17.5%', '2013-05-18 00:00:00', '2014-05-17 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('220', '3667', '家家乐购CPS', '家家乐购是一家中国领先的营养健康品零售服务商。以改善中国人健康为目标,提供面向家庭和个人的保健食品、传统滋补食品、保健器械及用品的销售和服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/7/7/1363146522307.jpg', 'http://p.yiqifa.com/n?k=KJy21tA3rI6HWE3e1n4H2mquUZgL18H_C9AxMSeEYO7d3OeH2mLErnRL6EUH6EzS1nDFrnXH2mq_rI6HWN3sMEBy6NBH2L--&e=API090507&spm=138655627865015183.1.1.1', '15.0%', '2013-03-14 00:00:00', '2014-03-13 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('221', '3632', '万药网', '万泽大药房-中国最大的网上药店，万药网官方集团旗下B2C电子商务平台,致力于打造最优质、最低价、最便捷的网上药店服务，经销药品、保健品、美妆护理、两性、医疗器械等万余种商品,并由执业药师、医师为您提供24小时免费健康咨询致力于提供最健康的产品,最满意的服务,让用户最放心的药网！', '12', 'http://image.yiqifa.com/ad_images/reguser/24/60/4/1370512086391.jpg', 'http://p.yiqifa.com/n?k=N5MvWZ4nrI6HWlzm6EPH2mquUZgL18H_UmUmfEtLWnjLk5B_f96_YpoH2mLErntmWEWLrn3FWEz71ZLLrI6HYmLErJBEMND73EWerIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2013-06-07 00:00:00', '2014-06-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('222', '2202', '开心人大药房', '开心人大药房是江西南昌开心人集团公司下设的全国连锁企业是中国首家平价药房。2009年4月，开心人取得国家食品药品监督管理局颁发的《互联网药品信息服务资格证书》和《互联网药品交易服务资格证书》。2010年春季，开心人药房网上线，开心人电子商务运营启动从此，您足不出户即可在开心人购买放心药，并享受专业药师在线咨询等服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/55/55/1283329242186.jpg', 'http://p.yiqifa.com/n?k=2mLErnzSWn4H2mquUZgL18H_UmUmfEWOWJVFR8eEYO7_rI6H2mL71NKsrn3FWEz71ZLLrJVWP9sgPmq_rI6H69tsMERs3l4H2L--&e=API090507&spm=138655627865015183.1.1.1', '10.0%', '2010-09-02 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('223', '2203', '康爱多', '康爱多是一家以B2C医药电子商务为主要发展业务的医药零售企业，提供各类药品保健品减肥瘦身成人用品等网上订购服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/19/13/1336449321032.jpg', 'http://p.yiqifa.com/n?k=59eICtwmrI6HWEtl1n4H2mquUZgL18H_UmUmfEWOWJVbMIeEYOsH2mLErn3OWNgH6EzS1nDFrnXH2mq_rI6H1NKq6EgE1NgH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.85%-10.0%', '2012-05-11 00:00:00', '2013-05-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('224', '2206', '八百方', '八百方医药健康网购商城(www.800pharm.com)是全国首家，规模最大的医药大健康产品网购商城。加盟药店过百家，10多个有互联网交易资质的药店加盟，千万种商品比价购买，100%药房正品，假一赔十。在线销售药品母婴美容减肥保健品成人用品药膳礼品医疗器械等。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1295251641945.jpg', 'http://p.yiqifa.com/n?k=2mLErntL1NzSrI6HCZg7Rnu_fmUmUSFFWnXLCJBSYpeEYO7_rI6H2mLsWERLrn3FWEz71ZLLrI6HYmLErJK71nKFWlterJ4tMQ65YQL-&e=API090507&spm=138655627865015183.1.1.1', '1.0%', '2010-12-30 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('225', '2207', '碧生源', '碧生源作为中国保健品市场”茶疗健康概念”的倡导者、实践者，我们拥有独立的研究开发机构和医学专家、教授组成的技术专家顾问群，从事产品的研究开发工作，不断推出领先市场的具有高科技含量的茶疗产品。我们拥有6项保健茶的专利，拥有经国家卫生部及食品药品监督管理局批准的10类20多个保健产品，对减肥、润肠通便、调节血脂、降低血糖、降压、调节免疫、改善睡眠、清咽利喉等方面有卓越的茶疗功效。主导产品碧生源系列保健茶以传统的中医养生学理论为指导，以中国悠久的茶文化和丰富的中草药知识为基础，精选以药食同源的纯天然植物为原料，通过有效的科学配伍，并经现代生物技术加工而成。碧生源常润茶、碧生源减肥茶，康丽源减肥茶、瑞德梦减肥茶等产品，因其对解决便秘、肥胖、血脂高等方面有独到的功效，被评为”中国保健品公信力产品”。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/10/54/1283410196128.jpg', 'http://p.yiqifa.com/n?k=2mLErnRFWn4H2mquUZgL18H_UmUmfEUECJtd3OoVrI6H2mL71n3Srn3FWEz71ZLLrI6HYmLErJMyMnKsMEwSrJeXWQ6K1QL-&e=API090507&spm=138655627865015183.1.1.1', '18.0%', '2010-08-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('226', '2208', '金象网', '金象大药房网上药店简称金象网，是一个集医药产品、健康资讯、专业咨询服务为一体的全新业务平台，并整合各种优秀产品、渠道和资源，为消费者提供全新的健康消费体验。2007年金象网上线以来，仅用一年时间已居业内首位。金象网以国内最大、世界领先的医药健康电子商务提供者为目标，努力把金象网打造成”网上购药第一店”！', '12', 'http://image.yiqifa.com/ad_images/reguser/56/33/31/1261377582568.JPG', 'http://p.yiqifa.com/n?k=2mLErn2S6QLErJb7UZjvfSomUmRdCcbwk53d3OoVfmLErI6HWljsrn3FWEz71ZLLrI6HYmLErnUy6lX86EbyrJ7SWZKOCQL-&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('227', '2209', '康之家', '广东康之家医药连锁有限公司成立于2001年，是广东康越医药科技控股有限公司旗下全资子公司，地处富饶美丽的珠江三角洲经济中心——广州市，是一家全面通过国家GSP认证，集生产、科研、新药代理招商、医药批发配送、医疗门诊经营及连锁药店加盟为一体的综合型医药企业。公司依托呼叫系统、电子商务、现代物流等现代先进技术，创新企业运营模式，立足广州，经营广东，辐射全国。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1350007804582.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WEDsrI6HCZg7Rnu_fmUmUSeik9ul6EKd3OoVfmLErJgbNtzFNmLO1nzmrn3FWEz71ZLLrI6HYmLErnDO6Otq6ntOrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.0%-28.0%', '2012-10-15 00:00:00', '2013-10-14 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('228', '2210', '药房网', '药房网，全国首家合法网上药店(隶属北京京卫元华医药科技有限公司)。药房网通过搭建开放式的医药零售电子商务平台为全球网上购物人群提供全面的（药品、保健品、美容护肤、减肥瘦身、母婴用品、成人用品、医疗器械等）健康医药信息与交易服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/20/12/1311593697847.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6n3SrI6HCZg7Rnu_fmUmUSee35o935ecf96drI6H2mLs1NKqrn3FWEz71ZLLrI6HYmLErnKO3NwL3NDmrngQYE4eUQL-&e=API090507&spm=138655627865015183.1.1.1', '10.0%', '2012-09-13 00:00:00', '2013-09-12 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('229', '2211', '爱康国宾', '康国宾健康体检集团是中国领先的提供体检和就医服务的健康管理机构，是由爱康网和国宾健检组建成立的联合服务机构。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/18/50/1350026431944.jpg', 'http://p.yiqifa.com/n?k=2mLErn271n3SrI6HCZg7Rnu_fmUmUSeACOBdMSeEYOsH2mLErn3F1NMH6EzS1nDFrnXHNm4n5wqErJoH2mLO3lWl1NP83mLE&e=API090507&spm=138655627865015183.1.1.1', '0.85%-10.5%', '2012-10-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('230', '2213', '健一网', '2010年，健一网（华源大药房网）成立，作为公司着力培养之医药电子商务平台，目标是医药行业B2B及B2C业务领先者。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/20/12/1348018570913.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWljSrI6HCZg7Rnu_fmUmUSehWpeEYO7_rI6HUOgiU9P4rn3F6NyH6EzS1nDFrnXH2mq_rI6HMJDe35MwM9gH2L--&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-09-25 00:00:00', '2013-09-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('231', '2215', '111医药馆', '111医药馆是国家药监局批准合法网上药店，中国百强药店连锁德生堂旗下网上药店品牌，提供中西成药、营养保健食品、医疗器械、成人用品、美妆护理等各类医药健康产品。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/54/10/1355294211430.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6nzSrI6HCZg7Rnu_fmUmUSFqWNBe35Hd3OoVrI6H37Pxktyyrn3e6E6H6EzS1nDFrnXH2mq_rI6H3lRm6N3l65MH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.85%-14.0%', '2012-12-11 00:00:00', '2013-12-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('232', '2216', '21药店网', '21世纪药店是专业的药品导购平台，有100多家连锁药房加盟。网站免费提供执业药师在线咨询，提供药品保健品肿瘤药新特药等十五万种商品覆盖全国90个城市送药上门!', '12', 'http://image.yiqifa.com/ad_images/reguser/24/9/9/1359713365000.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWNjSrI6HCZg7Rnu_fmUmUSFSWQy_MIeEYOsH2mLErn3m6E4H6EzS1nDFrnXHpOg3ktqdrJoH2mLl1JKe1nBbWZLE&e=API090507&spm=138655627865015183.1.1.1', '2.0%-11.2%', '2012-08-02 00:00:00', '2013-08-01 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('233', '2217', '康比特', '北京康比特股份有限公司成立于2001年，致力于运动营养食品的生产，推广运动健康的理念，2011年，康比特荣获中国聪明商标资质建成总产值10亿元的”康比特运动营养基地”进入国家体育总局年度政府采购名单，承办”第二届北京国际运动营养食品高层论坛”', '12', 'http://image.yiqifa.com/ad_images/reguser/24/4/4/1345544714882.jpg', 'http://p.yiqifa.com/n?k=35VF5KgDrI6HWEW76n6H2mquUZgL18H_UmUmf96LUZ6uYmjd3OoVrI6H2mLO6lzlrn3FWEz71ZLLrI6HYmLErn373E4w3EMyrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.0%-35.0%', '2012-08-16 00:00:00', '2013-08-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('234', '2218', '乡亲药房', '乡亲药网，是广东地区仅有的几家合法网上药店（隶属于韶关市乡亲药房连锁有限公司）之一。它是一个全新的开放性的医药电子商务平台，旨在为全国各地乃至全世界的消费者提供最安全、最全面的医药、药品资源。乡亲药网网站主要经营范围包含：药品（中药和西药）、医疗器械、美容护肤、保健用品、成人用品、母婴用品等。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/12/52/1353403954162.jpg', 'http://p.yiqifa.com/n?k=2mLErn271n2SrI6HCZg7Rnu_fmUmUSeFC5BdMmBAYcymf96_YpoH2mLErn3eWNgH6EzS1nDFrnXH6m3lDKs3rJoH2mLOMng9MnRe3mLE&e=API090507&spm=138655627865015183.1.1.1', '4.2%-9.0%', '2012-10-24 00:00:00', '2013-11-03 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('235', '2219', '药到病除网', '药到病除网隶属于上海医药嘉定大药房连锁有限公司，上海医药嘉定大药房连锁有限公司是于一九五六年成立。公司于2002年4月转制，由上海市医药股份有限公司直接控腔，是上海市医药股份有限公司子公司。上海医药股份有限公司是中国规模最大，网络最广，实力最强的医药经营企业之一。行业地位稳步全国前三', '12', 'http://image.yiqifa.com/ad_images/reguser/24/44/12/1351049761720.jpg', 'http://p.yiqifa.com/n?k=N7A_ky4yrI6HWEDs6E4H2mquUZgL18H_UmUmfEwqk5B_f96_YQLErI6H6Ewq6mLO1n2F6nbHWZLErJoH2mqw6Ng93Nts1QLE&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2012-10-29 00:00:00', '2014-10-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('236', '2220', 'Yeecare益生康健', '益生康健，中国保健协会副理事长单位，中国老年保健协会全国会员服务中心，成立以来，为数百万的中国消费者提供安全、放心、平价的高品质营养健康品。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/52/52/1359527112121.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6njSrI6HCZg7Rnu_fmUmUSeeM5PE3Q4yf96_YpoH2mqdDwqsg7eH6ljS1ZLO1n2F6nbHWZLErJoH2mq81ny83lWeWQLE&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2013-01-31 00:00:00', '2014-01-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('237', '2222', '孝亲网', '孝亲网自创办伊始，一直秉承”以孝为先”的理念，致力于为意欲孝敬父母亲人而不能所愿的儿女晚辈提供一个专业的服务平台，为中老年人提供家庭养生、保健用品、康复用品、营养品以及全天候的专业咨询服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/12/12/1357449173516.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s1n3lrI6HCZg7Rnu_fmUmUSFsWQbA35oqC5Fd3OoVfmLErJ4vNybZKmLO1NRlrn3FWEz71ZLLrI6HYmLErn3739tL156wrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.0%-14.0%', '2012-12-20 00:00:00', '2013-12-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('238', '2224', '1号药网', '1号药网（111.com.cn），中国网上药店领导者，于2010年7月正式上线，是中国第一批获得国家食品药品监督管理局颁发的《互联网药品交易许可证》（许可证号：粤C20100001）的合法网上药店。1号药网与500多家国内外优秀的医药健康产品厂商合作，向消费者提供在《互联网药品交易许可证》允许交易范围内的中西药品、保健品、医疗器械、成人产品、隐形眼镜、美容护理等近万种医药健康产品，并由一批获得国家资质的执业药师、医师提供专业的在线咨询服务。我们志在为千家万户提供优质的医药健康产品和用药服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/57/57/1352194503758.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6NDsrI6HCZg7Rnu_fmUmUSFqWNtd3OoVf96dfmLErI6H6E3mWcLO1n2F6nbHWZLqWJ6LUyUHYmLErnDq3lgb6E6ErIW-&e=API090507&spm=138655627865015183.1.1.1', '0.01%-7.0%', '2012-06-15 00:00:00', '2013-06-14 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('239', '2225', '好视力眼贴', '好视力眼贴，是北京好视力科技发展有限公司倾力打造的国内首家上市的眼贴品牌，被认定为中国驰名商标。具有十一年传统市场沉淀的好视力眼贴，产品丰富，其中包括医疗器械类，保健品类、食品类、化妆品类等。同时好视力眼贴还是中国国家射击队专用护眼产品，包装精美、时尚，迅速缓解视疲劳，辅助治疗近视眼、青光眼、白内障、玻璃体浑浊等眼睛疾病有良好的疗效，被业界和众多消费者誉为“护眼行家“', '12', 'http://image.yiqifa.com/ad_images/reguser/24/15/49/1329133323667.jpg', 'http://p.yiqifa.com/n?k=RygiUEyXrI6HWNwO6n4H2mquUZgL18H_UmUmf9bbYm6uC5qAf96_YpeEY8olCJoLrI6H2mLO6nzlrn3FWEz71ZLLrI6HYmLErJtm35Wq6N6brIW-&e=API090507&spm=138655627865015183.1.1.1', '0.85%-20.0%', '2012-02-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('240', '2226', '壳壳虫', '壳壳虫订购台（www.cocochong.com），是由美国知名集团投资成立的中国领先的电子商务运营商，是中国领先的一站式进口产品网上商城。公司所销产品全面多样，主要包括化妆品、营养品、保健品、婴儿用品、食品等。壳壳虫订购台结合多个科技平台的优势优点，为消费者提供物优价廉的产品和针对性健康咨询服务。拥有专业的团队和国际化运营模式，其中核心事业部-保健营养食品事业部更以平价、优质、高端的营养品保健品得到了中国广大消费者的一致好评和认可！”让国民都用得起优质进口营养健康品，都拥有一份健康”是壳壳虫公司事业一部的经营理念。北京地区高档百货商场均有销售。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/22/54/1341195381293.jpg', 'http://p.yiqifa.com/n?k=P7RlMcBprI6HWE2O1ngH2mquUZgL18H_UmUmf96_3OoECJodMSeEYOsH2mLErn3O1NPH6EzS1nDFrnXH2mq_rI6HWlwqW9KOM56H2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-21.0%', '2012-07-03 00:00:00', '2013-07-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('241', '2227', '人民同泰', '哈尔滨人民同泰医药连锁店是由哈药集团医药有限公司人民同泰医药连锁店为方便广大顾客所设的网上购药平台，人民同泰医药连锁店是哈药集团医药有限公司的支柱企业，GSP认证企业。目前哈尔滨市区内拥有零售门店300多家黑龙江省内拥有100多家直营店。经营中西成药、中药饮片、滋补保健和医疗器械等6000多个品种，同时经营化妆品、日用品等1000多个品种，年营业额17亿元。先后荣获全国医药行业十佳窗口服务单位，全国文明示范店等光荣称号。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1338883287371.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6n37rI6HCZg7Rnu_fmUmUSeSYQg7C9Vmf96_YpoH2mq2NmMNYObH6E3O6ZLO1n2F6nbHWZLErJoH2mqw6O3sWnzq3cLE&e=API090507&spm=138655627865015183.1.1.1', '8.5%', '2012-06-08 00:00:00', '2013-07-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('242', '2229', '绿瘦商城', '绿瘦商城是全球最具专业性的网上瘦身商城，专注于安全瘦身领域，是绿瘦国际集团（以下简称”绿瘦国际”）全资注册的旗下品牌，由广东绿瘦健康信息咨询有限公司经营运作。产品涵盖口服瘦身产品、瘦身特效妆品、大小型瘦身器械、以及瘦身服饰等四大类型、数十个一线品牌、数百种优质商品。绿瘦商城是全球最具专业性的网上瘦身商城，专注于安全瘦身领域，是绿瘦国际集团（以下简称”绿瘦国际”）全资注册的旗下品牌，由广东绿瘦健康信息咨询有限公司经营运作。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/25/7/1330394121329.jpg', 'http://p.yiqifa.com/n?k=2mLErnte1n2SrI6HCZg7Rnu_fmUmUSexUc6uYmKd3OoVfmLErI6H6EKLWQLO1n2F6nbHWZqKWKey3K4HYmLErJW76lDqWN3lrIW-&e=API090507&spm=138655627865015183.1.1.1', '10.5%-21.0%', '2012-02-29 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('243', '2230', '海王星辰', '海王星辰健康药房网是深圳市海王星辰健康药房连锁有限公司倾力打造的网上购药平台，于2011年10月1日正式上线运营，通过在线网络销售包括西药、中药、中成药、中药饮片、保健食品、医疗器械、计生用品、性福生活用品、ED产品等商品，品质保证、专业服务、顾客满意、顾客第一是我们的服务宗旨，为顾客提供最放心的网上药店购物体验。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/37/5/1330396581565.jpg', 'http://p.yiqifa.com/n?k=2mLErn2LWN2lrI6HCZg7Rnu_fmUmUSelUJBSWl3sf96_YpoH2mLErn3sWn4H6EzS1nDFrnXH3cAD5JoMrJoH2mq96lw7MnB96mLE&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-02-29 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('244', '2231', '818医药网', '818医药网隶属上海八亿八医药信息有限公司，是全球首创的第三方医药健康类产品信息服务平台。主要为已经取得健康产品经营资质的经销商，为有药品经营许可和通过GSP认证的药店，提供电子商务市场信息和技术服务，协助经销商和药店利用818.com电子商务服务平台向全国广大消费者提供安全便捷的网上订药、送药上门服务。在818医药网上，用户可以轻松找到全国各地知名连锁药房的信息以及其提供的各类医药健康产品的商品信息和供货资源，并可借助818.com平台所提供的市场信息，直接向药房购买所需药品，帮助药店倾听患者需求，解决老百姓买药难，买药贵的难题。818.com是一个集信息开放、公正、隐私安全、第三方服务保障、抑制虚高药价、促进医药健康产品交易流通的医药电子商务服务平台。2009年8月份，由于第三方医药平台的创新性，818医药网被上海经济与信息委员会列为第三方医药信息服务试点单位，正式开展第三方网上药房业务。818医药网现在已服务过的客户遍布全国三十一个省、市、自治区及直辖市，拥有全国性的服务网络，为全国各地甚至海外用户消费者服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/62/62/1315893257352.jpg', 'http://p.yiqifa.com/n?k=NcgKC5g2rI6HWNRsWE4H2mquUZgL18H_UmUmfEzq1IeEYO7_rI6H2mLOWN3Frn3FWEz71ZLLrI6HYmLErJ486937WEDlrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%-11.0%', '2011-09-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('245', '2232', '千叶草', '千叶草保健品连锁机构由湖南省东祺投资有限公司斥巨资筹建，是全国首家专业高端保健品连锁季候。千叶草首创网上商城与实体商场想结合的新型保健品购物模式，以”关注生活，关注健康”为企业理念，倾心致力于”专业呵护东方人健康”，将”千叶草保健品连锁机构”打造成为全国最具信誉度的高端保健品连锁销售品牌。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/18/14/1342426753810.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6lDSrI6HCZg7Rnu_fmUmUSeqC5Bdk5PE35Hd3OoVfmLErJB4MKRmCQLO6lWLrn3FWEz71ZLLrI6HYmLErnwl65tOMntSrIW-&e=API090507&spm=138655627865015183.1.1.1', '7%-22.5%', '2012-07-17 00:00:00', '2013-07-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('246', '2234', '优沃康品', '“优沃康品”是尚鹏网络旗下高度专注于保健行业的垂直化的购物平台，倡导健康、简单、快乐的购物、生活方式。优沃康品融合全球各大健康品牌，提供全面、细致的保健品、保健用品，健康咨询，健康服务。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/31/1/1363746449778.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWE3SrI6HCZg7Rnu_fmUmUSeeYmUbYIeEYO7_rI6H2mLmWnROrn3FWEz71ZLLrI6HYmLErn3L3ODq6J3FrBXE3KPsgmL-&e=API090507&spm=138655627865015183.1.1.1', '10.5%-21%', '2013-03-21 00:00:00', '2014-03-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('247', '2235', '北京药品网', '北京医保中洋大药房有限公司成立于九十年代初，是集：药品、医疗用品、保健品、化妆品、批发与零售，推广与代理、物流配送为一身的商业企业集团。中洋旗下的直营药店分布在京郊地区的海淀区、石景山区、丰台区、门头沟区、房山区、昌平区、延庆县、顺义区、平谷区、密云县等十余个区县。 电子商务药店分支服务机构遍布全国大小几十个城市。中洋拥有一班年轻，忠诚，有理想，肯学习敢打硬仗的管理群体和员工队伍，批发代理所经营的销售网络（包括：药店，超市，大卖场，专卖店，商业批发以及医疗单位等多种业态）遍及北京的大街小巷，城镇郊区，网络数量达500余家，全面涵盖了北京地区各种特点的零售终端。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/14/50/1364382374713.jpg', 'http://p.yiqifa.com/n?k=MPMhDsyLrI6HWERS1n4H2mquUZgL18H_UmUmf94hkQXmf96_YpoH2mLErnRL1ngH6EzS1nDFrnXH2mq_rI6H3E491Nt71N4H2L--&e=API090507&spm=138655627865015183.1.1.1', '11.0%', '2013-04-03 00:00:00', '2014-04-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('248', '2236', '七乐康网', '广州七乐康药业连锁有限公司创建于1993年，经过数十年的发展由一家民营药店发展起来的一家全国性的连锁药房。2010年1月公司正式更名为七乐康药业连锁有限公司，并于同年11月获得互联网药品交易服务许可证，成为全国为数不多的具有网站零售药的企业之一。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/51/13/1364805192091.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWl3SrI6HCZg7Rnu_fmUmUSFmYJxd3OF_rI6H6PByRtt7rnRL1NBH6EzS1nDFrnXH2mq_rI6HMNWe353S6nyH2L--&e=API090507&spm=138655627865015183.1.1.1', '9.0%', '2013-04-02 00:00:00', '2014-04-01 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('249', '2238', '12药网', '12药网-第三方综合药品B2C预订（交易）平台,是国家药监局审批的合法网上购药,网上药店,12药网与全国各大正规连锁药房共同打造,为有药品经营许可和通过GSP认证的药店，提供电子商务市场信息和技术服务，协助经销商和药店利用12yao.com电子商务服务平台向全国广大消费者提供安全便捷的网上订药、送药上门服务，12药网是湖南省政府重点扶持的医药电子商务项目，于2013年1月份正式开始运营，目前全国已有将近50多家正规药房入驻，提供数万种药品，100%正品保障，免费提供专业药师服务咨询，让买不起的药的老百姓买到放心实惠的药是我们的宗旨。', '12', 'http://image.yiqifa.com/ad_images/reguser/24/46/50/1369222337163.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWn3LrI6HCZg7Rnu_fmUmUSFqWcybYSeEYO7_rI6H2mLq6ltsWcLO1n2F6nbHWZLsk5bWPPyHYmLErJKe1nzeMNwmrIW-&e=API090507&spm=138655627865015183.1.1.1', '2.8%-7%', '2013-05-22 00:00:00', '2014-05-21 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('250', '2240', '和平药房（天猫）', '重庆和平药房连锁有限责任公司（简称和平药房）是重庆市国资委重点骨干企业，主要从事中西药、成药、中药饮片、保健品、医疗器械、药妆便 利产品等经营项目，经营品种10000余种，是我国最大的医药零售连锁公司之一。和平药房2001年全国首批通过国家GSP（药品经营质量管理规范）认证， 完善的供应链依托总建筑面积26930平方米，中国一流、西部领先的现代医药物流中心之一-上桥和平物流中心，具备安全、高效、冷链完善的配送体系，为全国各地的医院、药店、诊所、批发商提供安全、高效的服务', '12', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1370311336345.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWlDmrI6HCZg7Rnu_fObLMZy9fcgV35qxf96_YpoH2mLErntmWEj7rn3FWEz71ZLLrtAlYs4S5Zq_rI6H3lbE6NKs3NXH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-7.5%', '2013-05-14 00:00:00', '2013-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('251', '3660', '恬愉CPS', '恬愉旗舰店之恬愉系列养生茶立足于中医体质养生理念，依托上海中医药大学深厚的技术和科研力量，自主研发了系列针对都市白领体质养生的养生茶。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/41/9/1376380064010.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6n27rI6HCZg7Rnu_fmgA35eeUQ6uCQXAY8e7Y5BxYIeEYOsH2mLFCteLDwsHWNRl6l6H6EzS1nDFrnXH2mq_rI6HWJ2eWlX96EbH2L--&e=API090507&spm=138655627865015183.1.1.1', '8.4%', '2013-08-14 00:00:00', '2014-08-19 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('252', '3664', '宅鲜配', '“宅鲜配优选”（www.best.zhaixianpei.com）是目前中国高端生鲜礼品领导品牌，专注于为送礼客户提供高品质生鲜食品礼品整体解决方案：种植与养殖基地及产品遴选、干线冷链仓储物流、礼品卡个性化定制、财务咨询、第三方送礼、冷链宅配、售后服务等。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/50/14/1375754883911.jpg', 'http://p.yiqifa.com/n?k=CwyQYEg9rI6HWlw76nUH2mquUZgL18H_UmUmf94yRmDdk9bbCQbA35eLM5wd3OoVrI6H2mLq6lWO6cLO1n2F6nbHWZLErJoH2mqbW9Wl3ODl6ZLE&e=API090507&spm=138655627865015183.1.1.1', '1.4%-2.8%', '2013-08-07 00:00:00', '2014-08-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('253', '3668', '要红酒网', '这是一家专注于高档酒水销售的专业品牌营销公司，这是一家致力于消费者时尚、现代、健康生活提供优质产品、领先理念、周到服务的企业，并通过在业内令人瞩目的表现，成为了目前中国同类市场中成长最快的一股新生力量。其主要经营进口法国各产区高级酒庄酒及其他高级葡萄酒系列产品，更是国内同类产品中最具档次、质量最好的法国产品。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/63/63/1362986679831.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O1n2SrI6HCZg7Rnu_fmUmUSee35ouYOecC9ysf96_YQLErI6H6lj71ZLO1n2F6nbHWZLErJoH2mL7WNtq6ltl6mqFkKAvWBMH&e=API090507&spm=138655627865015183.1.1.1', '5.6%-14%', '2013-02-27 00:00:00', '2014-02-26 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('254', '3681', 'Whittard Trading', '海淘客户，详见活动介绍', '11', 'http://image.yiqifa.com/ad_images/reguser/24/25/57/1377768652807.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWEwOrI6HCZg7Rnu_fmUmUSemCJy7UJBSMIeEYOsH2mLErntmWl37rn3FWEz71ZLLrnPl39eIgZq_rI6H39Mb6ERSM5BH2L--&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('255', '3689', 'AllStarWine', '海淘客户，详见活动介绍', '11', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1378280641152.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWl27rI6HCZg7Rnu_f7BxYB673Q4QC5eyf96_YQLErI6HWNRlWl4H6EzS1nDFrnXHM7zeDKq3rJoH2mLeMn3sMn6E6QLE&e=API090507&spm=138655627865015183.1.1.1', '2.0%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('256', '3703', '鲜品会', '鲜品会隶属于比易世纪（北京）网络技术有限公司，是一家为热爱生活的人们提供生活服务的创新机构。鲜——新鲜，追求食材和生活本真的鲜味；品——品尝新鲜食材，品味生活真谛；会——新鲜食材、高端生活品质、返璞情趣、蟹文化在此融会一体。我们通过原产地文化复原、体验活动引导相结合的方式面向市场提供原产地食材，为广大用户在不同生活场景输送新鲜内容。我们优选食材有三大原则：具有原产地文化标签、适应现代物流配送、符合应季自然生长。冠军蟹是鲜品会系列产品之一。冠军蟹产自阳澄湖莲花岛。阳澄湖大闸蟹久负盛名，被誉为\'蟹中之王\'。通过培育水草净化水质，增加溶氧，投食鱼、虾、螺作为天然饵料，营造出有利于大闸蟹健康生长的生态环境。莲花岛作为阳澄湖的主要岛屿，位于阳澄湖西湖、中湖、东湖中心，享有\'美人腿\'的美名。莲花岛周围水域水质极佳，湖底水草丰茂，各种水生动植物异常丰富，出产于莲花岛的冠军蟹可谓冠盖阳澄湖', '11', 'http://image.yiqifa.com/ad_images/reguser/24/25/7/1379914388226.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe1NtqrI6HCZg7Rnu_fO2S3SeFC5BdRJydCZPAf96_YQLErI6HWNR7WE4H6EzS1nDFrnXHCBgdpsMJrJoH2mLSW52m3OtL6ZLE&e=API090507&spm=138655627865015183.1.1.1', '12.6%-15.4%', '2013-09-11 00:00:00', '2014-09-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('257', '2103', '买买茶', '买买茶（http://www.maimaicha.com）是由山东华夏茶联茶业有限公司于2010年10月成立的国内唯一一家真正的全产业链线上茶叶销售平台。买买茶拥有自主茶园5000余亩，签约合作茶园全国共计6万余亩。完全掌控茶产业链的买买茶销售平台，为众多的茗茶爱好者提供来自茶原地的高质量、低价格的有机好茶叶。更有国内多家知名茶企来自茶原地的品牌茶叶支持，上线三个月来已拥有十几个大品类，数百个单品，用户二次购买率超过80%，单品平均好评率超过95%。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/35/61/1302505389751.jpg', 'http://p.yiqifa.com/n?k=2mLErntS6l3SrI6HCZg7Rnu_fmUmUSeV35yV35yECJtd3OoVfmLErI6H6NK7WmLO1n2F6nbHWZq6pPPbNJ4HYmLErnwsWJB96nRqrIW-&e=API090507&spm=138655627865015183.1.1.1', '28.0%', '2011-04-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('258', '2105', '廿一客', '21cake是由廿一客食品有限公司于2004年5月创建的蛋糕品牌，由最初确定的21款经典蛋糕而得名。目前拥有由蛋糕大师自主研发的乳酪蛋糕、慕斯蛋糕、巧克力蛋糕、乳脂奶油蛋糕和冰淇淋蛋糕五个系列共28款主题蛋糕。21cake目前已在北京、上海、杭州三大城市设立了电话订购服务中心。独立拥有一万五千平米的厂房、三百名资深师傅、二百余人的自有配送团队和三十余位客户服务人员，21cake以提供符合现代人生活方式的高品质健康食品为己任，从食品研发、生产、销售和配送，采用完全一体化的经营模式，保证21cake的产品和服务质量。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/9/55/1357372376816.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s1NDSrI6HCZg7Rnu_fmUmUSFSW56bCOKd3OoVfmLErI6H6EweWQLO1n2F6nbHWZLErJoH2mLlM53SWNRl6QqbKKBWglUH&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2012-12-28 00:00:00', '2014-01-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('259', '2106', '和茶网', '和茶网（www.hecha.cn）是国内商品最丰富、销量最大的茶叶网购商城，目前已有注册用户50余万，商品涵盖国内六大类茶、茶具、保健茶、特色茶产品。所有商品均是针对网购用户特别打造，产品性价比高，用户转化率高，和茶网在淘宝、拍拍等平台均有开设分店，销量一路高升，深受广大茶友欢迎，并在福州等地开有线下体验店”和茶汇”，在茶行业具有很高的影响力、及品牌知名度。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/50/50/1280969427088.jpg', 'http://p.yiqifa.com/n?k=KNMF5cBtrI6H6EWLWmLErJb7UZjvfSomUmRdCJPECJtd3OeH2mLErnDs1nXH6EzS1nDFrnXH2mq_rI6H3O4y6l2O6EBH2L--&e=API090507&spm=138655627865015183.1.1.1', '15.0%', '2010-04-22 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('260', '2107', '中国零食网', '中国零食网是国内首家购买食品安全保险，全年提供24小时客户服务的专业零食网上商城。商城汇集了大量品牌零食、特产零食、进口零食等优质美味的商品。每天8款零食秒杀，两天一期精品团购，还有限时抢购、免费赠品等各种优惠活动。是办公室、居家生活等人群首选的休闲食品网络购物网站。我们通过严格的质量标准，贴心的服务体系，优质平价的商品，致力打造国内一流的零食网购平台。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/3/61/1295322901522.jpg', 'http://p.yiqifa.com/n?k=2mLErntqWN2SrI6HCZg7Rnu_fmUmUSexC5ecRObAf96_YQLErI6H6NWqWQLO1n2F6nbHWZqug7gApO4HYmLErJ4yM9Mb65B9rIW-&e=API090507&spm=138655627865015183.1.1.1', '2.8%-9.0%', '2011-01-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('261', '2108', '我买网', '我买网（www.womai.com）是由世界500强企业中粮集团有限公司于2008年投资创办的食品类B2C电子商务网站。致力于打造中国最大、最安全的食品购物网站。我买网坚持的使命是让更多用户享受到更便捷的购物，吃上更放心的食品。商品包括：休闲食品、粮油、冲调品、饼干蛋糕、婴幼食品、果汁饮料、酒类、茶叶、调味品、方便食品和早餐食品等百种品类。是办公室白领、居家生活和年轻一族的首选食品网络购物网站。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/34/62/1322722051441.jpg', 'http://p.yiqifa.com/n?k=2mLErnWs6n4H2mquUZgL18H_UmUmfcU_Y5BAf96_YpoH2mLErnDqWn4H6EzS1nDFrnXH2mq_rI6HM93e6N4EWn4HUJtFDcPZrj--&e=API090507&spm=138655627865015183.1.1.1', '2%-5.6%', '2009-08-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('262', '2112', '酒仙网', '北京酒仙电子商务有限公司（简称”酒仙网”）是中国最大的综合性酒类电子商务B2C网站，也是国内最大的酒类零售电子商务平台。公司借助于现代电子商务，着力从事酒类高档消费品的销售服务，主营进口葡萄酒、高档洋酒、国产名白酒、葡萄酒、黄酒、保健酒等.', '11', 'http://image.yiqifa.com/ad_images/reguser/24/9/55/1289467880048.jpg', 'http://p.yiqifa.com/n?k=CE4LYmAyrI6H1NKOWcLErJb7UZjvfSomUmRdC9yskJybY8eEYOsH2mLErnKq6EMH6EzS1nDFrnXH2mq_rI6HWnWFWnte6lXH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-13%', '2010-11-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('263', '2113', '购酒网', '上海购酒网电子商务有限公司是一家专业从事酒类产品的推广、销售、物流的综合性集团公司，是上海市酒类专卖认定的重合同守信誉企业。真诚、理解、合作、进取是企业的理念，用心卖好酒是企业的宗旨。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1326265225998.jpg', 'http://p.yiqifa.com/n?k=2mLErntS1n3SrI6HCZg7Rnu_fmUmUSecCcRd3OoVrI6H2mLs6Ntlrn3FWEz71ZLLrI6HYmLErnM8MEbEWlX8rte7MwPFWZL-&e=API090507&spm=138655627865015183.1.1.1', '1.5%-16%（团购、抢购以及其他酒类为0%）', '2011-04-11 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('264', '2114', '嘀嗒猫', '嘀嗒猫隶属于上海猫诚电子商务有限公司。愿景：做食品网购的隐形冠军。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/43/53/1309087238400.jpg', 'http://p.yiqifa.com/n?k=2mLErntsWn2SrI6HCZg7Rnu_fmUmUSewC5gbY5BxYIeEYOsH2mLErnKm1NyH6EzS1nDFrnXH2mq_rI6HWOtLWNtlWOMH6ZUEgQulrj--&e=API090507&spm=138655627865015183.1.1.1', '4.9%', '2011-06-25 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('265', '2116', '美酒乐', '美酒乐网站是北京启美汇通贸易有限公司旗下的网上洋酒商城。本公司是百加得洋酒贸易有限公司在中国大陆地区（不包括香港、台湾和澳门地区）唯一授权的电子商务网上销售的指定网络销售商。所有经销的百加得旗下的品牌，均是100%正规渠道引入中国大陆地区的正品，100%品质保证！', '11', 'http://image.yiqifa.com/ad_images/reguser/24/35/3/1312945995793.jpg', 'http://p.yiqifa.com/n?k=2mLErntO6E3SrI6HCZg7Rnu_fmUmUSeVCQzqf96_YpeEY8oH2mqM3K49UQBH6Ejq6QLO1n2F6nbHWZLErJoH2mqE3OteWEtmWcLE&e=API090507&spm=138655627865015183.1.1.1', '4.0%-10.0%', '2011-08-11 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('266', '2117', '手礼网', '手礼网www.giftport.com.cn是厦门国际航空港集团直属机构，主营闽台特色旅游商品。手礼网致力于打造旅游商品一站式的网络购物平台。”手礼网”构筑了”轻松旅游，放心购物，机场提货”的全新旅游购物方式，为旅客提供特色旅游商品便捷的订购、机场提货的便利服务。旅客可以通过手礼网网站、0592-96363订购专线以及机场形象店等多个渠道，订购到近千种闽台特色商品，并享受比超市更实惠的价格，旅客只需在临行前到机场手礼网门店提货付款，就可以把厦门的味道轻松带回家，免除了旅游购物的提拎的辛苦，轻松游厦门，快乐享受机场提货、免费打包的贵宾服务！', '11', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1304491852326.jpg', 'http://p.yiqifa.com/n?k=2mLErnt7WN2SrI6HCZg7Rnu_fmUmUSecC5M7RJoSUIeEYO7d3OeH2mLErnKOWNBH6EzS1nDFrnXH2mq_rI6HMnPy6lKsMN6HKOMOptWlrj--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-8.5%', '2011-05-05 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('267', '2118', '沱沱工社', '沱沱工社是九城集团(NASDAQ:NINE)旗下”北京九城天时生态农业有限公司”全力打造的有机、天然、高品质食品网上超市。在北京平谷投建上千亩有机农场，构建沱沱工社集有机蔬果安全种植、肉禽生态养殖、成品加工、全球优质供应资源整合、B2C网络化销售、冷链配送服务的全产业供应链。沱沱工社秉承传递天然、有机、特色的生活理念，致力向中国消费者提供供具食品质量安全和信誉保障的高端食品和生活用品。配有集冷藏、冷冻加工车间为一体的现代化仓储配送物流中心承诺将最新鲜的食品精准交付给广大消费者，承诺所售新鲜食品3天内，顾客如有任何不满，无条件退货！', '11', 'http://image.yiqifa.com/ad_images/reguser/24/35/61/1343037026613.jpg', 'http://p.yiqifa.com/n?k=2mLErnts6lzSrI6HCZg7Rnu_fmUmUSe7YOo7YOHd3OeH2mqDpwMWktyH6NRF1QLO1n2F6nbHWZLErJoH2mL71J3FWnKOWmLE&e=API090507&spm=138655627865015183.1.1.1', '4%-6%', '2011-06-24 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('268', '2120', '易果网', '易果网隶属上海易果电子商务有限公司，以最新鲜的品质保证、无可比拟的价格优势、专业便捷的配送服务让易果迅速遍布全国各地。以口碑开拓市场，用信誉展望未来，易果始终把提供最完善的服务作为公司生存之本，使您第一时间品尝到最优质最新鲜的水果。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/37/5/1319687576312.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6n37rI6HCZg7Rnu_fmUmUSeeC5UsYSeEYOsH2mqm5BXiMQXH6EW7WZLO1n2F6nbHWZLErJoH2mL765gbWlWO6cLE&e=API090507&spm=138655627865015183.1.1.1', '2.5%-8.5%', '2011-10-28 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('269', '2123', 'tasteV', 'TasteV品味汇是国际选酒俱乐部。它区别于传统酒类B2C，采用社会化酒品筛选的模式，为特定用户群推荐定量的精品红酒。TasteV品味汇是国际选酒俱乐部。会员有全球美酒大师、商界领袖和爱好者。宗旨是让会员1.选最好的酒（TasteV组织所有会员一起选出最值得购买的酒，对口感、来源、品质和价格有严格筛选标准；不会推荐最贵，但要品质和性价比最好。），2.享受最低价格保证（TasteV为会员提供购买服务，并承诺所有商品价格低于国内正规零售价）。是目前国内最具代表性的会员制红酒电商！', '11', 'http://image.yiqifa.com/ad_images/reguser/24/3/3/1335517599047.jpg', 'http://p.yiqifa.com/n?k=kEBlPl4erI6HWEtq1n4H2mquUZgL18H_UmUmfcgbRmgyU8eEYO7_39PlUBocYOowRSeuUJsx!OyE!5PV3Q4H2mLErn3s1NbH6EzS1nDFrnXH2mq_rI6HMEDeWn2s3lbH2L--&e=API090507&spm=138655627865015183.1.1.1', '12.0%-24.0%', '2012-04-28 00:00:00', '2013-04-27 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('270', '2124', '也买酒', '世上没有两瓶一样的酒，每瓶红酒都有自己的灵魂。找酒的过程，喝酒的过程都是一种发现和探索，乐趣在此，酒的价值亦在此。作为国内首家进口红酒的线上、线下立体销售平台，MYWINE力争为每位消费者找到最适合自己的那瓶酒，并与您共享发现的快乐。无论是广大的红酒爱好者，还是跃跃欲试却无从选择的初饮者，都能在Yesmywine有所发现，有所收获。Yesmywine坚信，红酒没有那么深奥，它是用来凝聚全家温馨、或者朋友小聚中不可缺少的基本元素，也是自己想喝时可以随时来一杯的东西。我们要做的事情就是实现红酒消费的亲民化、普及化和休闲化，让它最终成为人人愿意消费、常常消费的杯中尤物。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/11/11/1257421146873.jpg', 'http://p.yiqifa.com/n?k=2mLErnWLWE4H2mquUZgL18H_UmUmfcyyROseUOydMpeEYOsH2mLErnDLWEUH6EzS1nDFrnXHDOgLgEMFrJoH2mLsMnyw393qMZLE&e=API090507&spm=138655627865015183.1.1.1', '11.0%', '2009-06-30 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('271', '2126', '食尚网', '食尚网是北京金莱百汇贸易有限公司投资创办的食品类B2C/B2B电子商务网站，专注于特产的营销，通过网站快速扩大特产的销售半径。“特产”通俗的说属于一个地方特有的或从此地发源或兴起的，代表了一个地方的特色', '11', 'http://image.yiqifa.com/ad_images/reguser/24/1/63/1351651245598.jpg', 'http://p.yiqifa.com/n?k=2mLErn276l2SrI6HCZg7Rnu_fmUmUSelCJwm1IeEYOsH2mLErn3eWE6H6EzS1nDFrnXHPstsWtPirJoH2mLlMNwFWJ2OWZLE&e=API090507&spm=138655627865015183.1.1.1', '0.85%-7.0%', '2012-10-26 00:00:00', '2014-10-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('272', '2127', '农人网', '农人网的每一件农产品都直接来自于一个或一群有名有姓、真实可靠的农人。<br/>我们这么做，是因为我们相信每一件农产品都是一位农人用他的辛劳向天地四时换取的恩赐和馈赠。好水土加上好农人，才能创造出好农产。<br/>所以，我们不只是卖给您一捧谷物、一颗菜蔬，更希望您感受到那捧谷物、那颗菜蔬背后的阳光、雨水、土地以及土地中农人的汗水。我们希望重建人与食物的亲密关系——了解、进而信任、进而爱、进而长相厮守——我们希望农人网成为您与农产品之间了解、信任、爱和长相厮守的纽带。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/24/8/1352259416543.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWEjsrI6HCZg7Rnu_fmUmUSedYOecR9Pdf96_YQLErI6H6ERsWcLO1n2F6nbHWZLErJoH2mLm3NRe3NWO6QqdKtBQ35sH&e=API090507&spm=138655627865015183.1.1.1', '7.0%-14.0%', '2012-07-26 00:00:00', '2013-07-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('273', '2129', '诺心lecake', '诺心LECAKE&quot;品牌将爱分享、爱精致生活为品牌理念融入产品，承诺使用顶级的原料烘培臻品蛋糕。由上海起步诺心LECAKE会持续将全新的生活品质带给国人，继而展开内陆二三线城市项目的开发。并通过网络在线订购项目配合，将专业蛋糕配送和完善贴心的CallCenter服务提供给客户。同时，公司旗下多个品牌项目正在筹备运作中，我们立志将更多元化、管家式的品牌服务与大家分享，并成为内地第一烘培及优质生活品牌。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/19/13/1316064762920.jpg', 'http://p.yiqifa.com/n?k=2mLErntmWl2SrI6HCZg7Rnu_fmUmUSexM56bCOKd3OoVf76_Y5s_MJy7kKydM9Hd3Q6LknoAMn7s6cLErI6H6Etm1ZLO1n2F6nbHWZLErJoH2mLF35KF6NRs1Qq7pEbpWsbH&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2011-09-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('274', '2130', '来伊份', '“来伊份”自成立以来，肩负”传播休闲文化，创造快乐无限”的企业使命，早在企业发展初期就已确立了”立足于上海、着手于全国、放眼于世界”的发展战略梯度，采用世界先进的”直营连锁”的发展模式。2002年，正式创立”来伊份”品牌。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/51/51/1326079066610.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6nzSrI6HCZg7Rnu_fmUmUSex35yeC5MyY8eEYO7_rI6HMBgNMP3mrn376EBH6EzS1nDFrnXH2mq_rI6H1NXE6ODeMNUH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2012-01-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('275', '2132', '窝夫小子', '窝夫小子蛋糕1998年开始登陆京城蛋糕市场，2007年进入上海市场，是一家以制作中高档蛋糕为主的专业企业。目前的主要产品有德式蛋糕、日式蛋糕、法式蛋糕、欧美流行蛋糕、欧美经典蛋糕、生活迷你秀、欧式长条蛋糕、烤芝士蛋糕、冰淇淋蛋糕、派木司蛋糕、巧克力蛋糕、结婚蛋糕、无糖蛋糕、奶油水果蛋糕等16大系列300余款精美蛋糕。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/2/62/1337759888162.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWn3lrI6HCZg7Rnu_fmUmUSemM94_kpeEYO7_rI6H3y6hMm4Arn3O6nBH6EzS1nDFrnXH2mq_rI6H6O3eMJtq6l6H2L--&e=API090507&spm=138655627865015183.1.1.1', '10.5%-14.0%', '2012-05-24 00:00:00', '2013-05-23 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('276', '2133', '元祖食品', '元祖，从礼俗文化中取材，再造美食文化的精致内涵。我们引进国外先进的生产管理技术，聘请技艺纯熟的食品调理大师，精选上等原料，细细精致成各项美食。我们是中国大陆第一个同时推行ERP、通过ISO9001国际标准认证，现更取得食品生产的QS证。我们坚持，惟有通过如此安全、卫生的品管，才可安心放行，将美食送达每一家元祖门店及您的手中。蛋糕、年节礼盒、中西糕点、月饼……均有元祖赋予传统美食的新意，我们让每一项独具特色的产品，成为生活中最值得回味的记忆！我们的MUCH蛋糕、慕思蛋糕、优滋蛋糕系列，口感与众不同，造型别致独到。我们的年俗产品，在每一个节令都精心为您准备，包括春节八宝年糕、清明青团、端午龙棕、中秋花月饼等创意产品；尤其是我们的明星产品--元祖雪月饼，更是以独家工艺、豪华口感、健康诉求形成了中秋佳话。我们的礼盒系列，满足您馈赠亲友、客户的不同需求，凸显您的时尚品位。我们的新星3℃产品系列，更是以清爽、香醇的本色，迎合感官的最佳需求，坚持3℃的理念，坚持给您最新鲜的口感，把美味坚持到家。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1333935858219.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWE2SrI6HCZg7Rnu_fmUmUSec35elYSeEYO7d3OeH2mq65QXgUKVH6EKO6QLO1n2F6nbHWZLErJoH2mLsM9DLMnDl1QLE&e=API090507&spm=138655627865015183.1.1.1', '8.4%', '2012-04-10 00:00:00', '2013-04-08 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('277', '2134', '村村通商城', '村村通商城，以安全、名优、特色为经营理念，搭建安全农产品生产商与消费者直接交易的电子商务平台，进一步打造为中国最大的安全农产品商城。通过对生产商资质的严格审核和遴选，准入通过QS认证和专业权威机构认证的无公害农产品、绿色食品、有机食品等安全农产品和特色农产品，如时令果蔬、各地特产、名优产品等，以经营发展乐活店和品牌旗舰店的形式，为广大消费者提供有质量保障的放心、安全、特色农产品，营造健康绿色的现代生活。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/24/8/1346228283487.jpg', 'http://p.yiqifa.com/n?k=kQgQDK7SrI6HWEWl6n6H2mquUZgL18H_UmUmf9Uw3O67f96_YQLErI6H6EzLWZLO1n2F6nbHWZLErJoH2mqb6nj7W52s6cLE&e=API090507&spm=138655627865015183.1.1.1', '0.85%-2.0%', '2012-09-01 00:00:00', '2013-08-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('278', '2136', '顺丰优选', '顺丰优选是有顺丰速运集团倾力打造，以全球优质安全美食为主的网购商城，覆盖母婴、营养保健品、粮油、副食、酒水饮料、冲调茶饮、休闲零食、饼干点心、生鲜食品、特色时令和美食用品，超过六千余种美食任您选购，为您提供全方位的一站式美食服务！', '11', 'http://image.yiqifa.com/ad_images/reguser/24/18/50/1347450084099.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6l3SrI6HCZg7Rnu_fmUmUSelM94yRmDd3OoVrI6H2mLO6ltSrn3FWEz71ZLLrI6HYmLErJWs6NBbMEMErJoB6NXSPQL-&e=API090507&spm=138655627865015183.1.1.1', '9.0%', '2012-07-11 00:00:00', '2013-07-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('279', '2137', '贡天下特产网', '贡天下特产网，是北京贡天下网络科技有限公司旗下的一个自有品牌，以经营全球各地方独、特、优商品为主的的B2C电子商务网站。在积累了十余年的特产销售经验后，北京贡天下网络科技有限公司于2011年正式成立。注册资金3000万元以上。贡天下本着以顾客为中心的宗旨，将全国乃至全世界的各地特色文化和特产商品展现给广大顾客，为顾客提供舒畅的购物体验，让顾客更便捷的体验到原汁原味的地方特产和特色文化。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/11/11/1330570658111.jpg', 'http://p.yiqifa.com/n?k=2mLErn2LWlDlrI6HCZg7Rnu_fmUmUSecYOecUJybYcbA3peEYOsH2mLErn3sWnyH6EzS1nDFrnXHpnb4MQXIrJoH2mq81NKF1J2qWQLE&e=API090507&spm=138655627865015183.1.1.1', '', '2012-03-07 00:00:00', '2013-03-08 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('280', '2138', '网酒网', '网酒网坚持诚信、专业、品质的核心价值观，致力于将国际一流葡萄酒品牌的理念、文化和精品带给追求高品质生活、喜爱葡萄酒的中国消费者，在为消费者创造高端消费体验的同时传递最新的葡萄酒动态，并为有需求的用户提供专业课程培训及权威资格认证。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/49/15/1358762305520.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWE3lrI6HCZg7Rnu_fmUmUSem35ecC9ysf96_YpoH2mLErnRLWN6H6EzS1nDFrnXH2mq_rI6HWEbwW5WO1NMHglye5cM!rj--&e=API090507&spm=138655627865015183.1.1.1', '0.85%-14.0%', '2013-01-17 00:00:00', '2014-01-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('281', '2139', '乐百氏优选食品', '乐百氏公司是法国达能集团的成员之一，在中国已有二十多年的历史，是闻名全国的大型食品饮料企业。公司拥有知名度极高的”乐百氏”中国驰名商标，是中国食品饮料行业最具竞争力的知名企业之一。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/7/57/1348734787672.jpg', 'http://p.yiqifa.com/n?k=1BUEYlgOrI6HWEDsWE6H2mquUZgL18H_UmUmfc4_3cPlUIs8MQ67M9o_MIeEYO7_ROb_RIebRmXFrI6H2mLO1nRFrn3FWEz71ZLLrI6HYmLErnME1N2SMNXbrIW-&e=API090507&spm=138655627865015183.1.1.1', '2.0%-7.0%', '2012-09-28 00:00:00', '2013-10-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('282', '2140', '好利来', '买蛋糕网2003年开始上线运营，是好利来集团（北京好利来企业投资管理有限公司）旗下的B2C网站是全国最大的专业精品糕点网站，国内70余个城市可以实现异地订购业务，所售产品与城市同步，一般蛋糕提前3小时即可送达（或取货），网上支持多种支付方式（网银、支付宝、信用卡电话支付、美元支付等），网站积分、优惠券等都可以支持，订单流程追踪便于掌握订单状态。买蛋糕网是目前国内最专业的蛋糕订购网站。网站生成订单会派往好利来连锁城市，由取货城市连锁店取货或派送。生产制作或派送依然由好利来连锁店完成。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/51/13/1347421455962.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1nDSrI6HCZg7Rnu_fmUmUSeV35yw35ec35Hd3OoVfmLErI6H6Ez76mLO1n2F6nbHWZqvpOsDNOPHYmLErnPbWJ2OMERLrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2012-09-17 00:00:00', '2013-09-16 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('283', '2142', '本来生活', '2012年于北京起航，致力于与你共同行动，改善中国食品安全现状，成为中国优质食品提供者。在食品安全每况愈下的今天，人们普遍说得太多，做得太少，而我们的想法很简单，就是想让自己的亲人不用忧虑，朋友不用担心，从此可以像吃饭一样地吃饭。我们希望能与你一起，共同行动，建筑优质食品生态链，让生活原汁原味。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/53/53/1359598705203.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWlzlrI6HCZg7Rnu_fmUmUSe8M5ex35wd3OoVfmLErI6H6ljSWmLO1n2F6nbHWZLErJoH2mLLWnWe3NByWmqnkwVpYJgH&e=API090507&spm=138655627865015183.1.1.1', '1.4%-7.0%', '2013-01-30 00:00:00', '2014-01-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('284', '2143', '三得利', '三得利在上海，以优质纯净的天然水制造出独一无二「清爽口味」的三得利啤酒，1996开始成为上海最具人气品牌之一，市场占有率高达40%。除了酒类事业以外，三得利在澳洲的食品事业、花卉、美国的矿泉水事业、亚洲闻名的健康食品..等领域都获得较好反响。广幅发展的三得利，为全世界带来更丰富的生活乐趣。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1361511867295.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6EzlrI6HCZg7Rnu_fmUmUSemM5qxY9PlRSs_Y9qAY9Kd3OoVf96dfOMSYOe7fmLErB6e55BKCZLmWnDSrn3FWEz71ZLLrI6HYmLErnDs15B9M9WsrIW-&e=API090507&spm=138655627865015183.1.1.1', '28.0%', '2013-02-23 00:00:00', '2014-02-22 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('285', '2144', '买茶网', '买茶网主要销售中国十大名茶，创立之初，就以为用户提供“正宗原产地”的茶品为己任，供应商皆为国内一线茶叶品牌。合作的品牌有：御牌、漕溪牌、八马牌、徽六牌、猴坑牌、天品国香、吴都牌、武夷星、骏德牌、千叶牌等只要您选择了买茶网，您就选择了正宗、高品质、安全和放心。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/24/56/1348652517024.jpg', 'http://p.yiqifa.com/n?k=MKAgCl6qrI6HWEDL1n4H2mquUZgL18H_UmUmf9sbC56u3QUbY9Rd3OoVfmLErI6H6EzFWmLO1n2F6nbHWZLErJoH2mLs35P8MnzFMQLE&e=API090507&spm=138655627865015183.1.1.1', '0.7%-21.0%', '2012-10-08 00:00:00', '2013-10-07 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('286', '2148', '欧味多', '欧味多休闲食品商城，致力于打造中国最大、最安全的休闲食品购物网站。欧味多坚持的使命是让更多用户享受到更便捷的购物，吃上更放心的休闲食品。欧味多商城隶属于上海裕昌投资有限公司。欧味多作为中国领先的休闲食品品牌，线下800家余家门店及10多年的休闲经营理念，从成立初期欧味多一直坚持与各大超市、同类B2C网站进行比价，努力做到全网最低价。发货速度达到业内最快速度。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/44/52/1367568715225.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1nDqrI6HCZg7Rnu_fmUmUSe_UQUyC5gsYSeEYO7_rI6H2mLq6ltSWcLO1n2F6nbHWZq3gmXIpO6HYmLErnwL35gyWE69rIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2013-04-18 00:00:00', '2014-04-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('287', '2149', '中国特产网', '中国特产网是青海聚宝盆电子商务有限公司旗下的一个C2C电商平台，以全国各地特色土特产为主要经营领域。中国特产网致力于打造中国最大的土特产网上交易平台，截至2012年底网站ALEXA世界排名3至4万名，实现日交易订单数10000笔，预计2013年底实现入驻商家500000家，实现日交易额1000万元。我们将通过不懈的努力，实现从虚拟经济向实体经济的跨越。', '11', 'http://image.yiqifa.com/ad_images/reguser/24/49/49/1364902429779.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm6EzOrI6HCZg7Rnu_fmUmUSFO6E3O6EzF1nzFf96_YpoH2mLLRPUdUtUH6lje1ZLO1n2F6nbHWZLErJoH2mL76nKl39gb6ZLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-04-18 00:00:00', '2014-04-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('288', '3666', '华夏e当CPS', '北京市华夏典当行有限责任公司成立于1993年初，是北京市最早成立的典当行，也是全国规模最大的典当行之一。华夏典当行作为全国典当专业委员会副会长单位、北京典当行业协会会长单位及北京中小企业协会副会长单位，已成为 具有全国影响力的中小企业及个人融资机构，在全行业具有良好的口碑。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/33/63/1369794788627.jpg', 'http://p.yiqifa.com/n?k=D5sFpcXprI6HWlz76NMH2mquUZgL18H_UmUmf9bFMQXbUOFd3OoVfmLErI6HWNRSWn4H6EzS1nDFrnXH2mq_rI6HW9KS3NX81NPH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.7%', '2013-05-30 00:00:00', '2014-05-29 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('289', '3675', '珠宝网', '作为业内首个珠宝行业垂直电商平台，珠宝网商城力争开辟一个差异化垂直竞争的先例。其商业模式的核心价值是为用户打造一个放心买珠宝的电商交易平台！', '10', 'http://image.yiqifa.com/ad_images/reguser/24/26/58/1374732772771.jpg', 'http://p.yiqifa.com/n?k=PKey3KBVrI6HWlwl1nXH2mquUZgL18H_UmUmfcAuU54bYSeEYOsH2mLErntmWltqrn3FWEz71ZLLrI6HYmLErnzFMnzq6E48rIW-&e=API090507&spm=138655627865015183.1.1.1', '0.35%-3.5%', '2013-07-26 00:00:00', '2014-09-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('290', '2001', '珂兰钻石', '“珂兰钻石天使之爱”钻石并不遥远，天使就在身边。因为有一个名叫珂兰的网站，正致力于把世界上最优质钻石带给每一个追求幸福生活的人。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/7/7/1326448184251.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWlDlrI6HCZg7Rnu_fmUmUSeiM5qbf96drI6HP5bOPOe!rn376EUH6EzS1nDFrnXH2mq_rI6HM5696lWq6O4H2L--&e=API090507&spm=138655627865015183.1.1.1', '0.7%-1.4%', '2012-01-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('291', '2002', '周大福', '周大福珠宝金行有限公司为郑裕彤家族全资拥有的一个实力雄厚的公司，连同与其有关连的公司集团，专营珠宝玉石金饰及钟表业务，是集原料采购、生产设计、零售服务的\r\n综合性经营企业，拥有超过80年历史，是中国内地及香港最著名及最具规模的珠宝首饰品牌之一。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/63/63/1328258598725.jpg', 'http://p.yiqifa.com/n?k=2mLErn2LWEDSrI6HCZg7Rnu_fmUmUSeEUJMyROb_RIeEYO7d3OeH2mLErn376lBH6EzS1nDFrnXH5JoXYtVBrJoH2mLl696w69B9WZLE&e=API090507&spm=138655627865015183.1.1.1', '2.1%-3.5%', '2012-02-04 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('292', '2003', '万表网', '【万表网】销售原装正品世界名表：浪琴手表、天梭手表、梅花手表、依波路手表、欧米茄手表、帝舵手表，买手表可信用卡分期付款！中国银\r\n行合作商城，全球联保。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/51/51/1325671458146.jpg', 'http://p.yiqifa.com/n?k=KZglgJyTrI6HWNwqWE6H2mquUZgL18H_UmUmfcU8C5B_f96dfmLErI6H6EDq6mLO1n2F6nbHWZLErJoH2mq9W9tFMJ6y3cLE&e=API090507&spm=138655627865015183.1.1.1', '0.7%-5.5%', '2011-12-17 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('293', '2004', '天时汇商城', '天时表行是海鸥表官方授权的网络经销商，所售商品均为海鸥原厂正品，提供正规机打发票，保修卡和说明书。天时表行对于商品的品质和服务的品质有着极致的要求，以其独特的营销模式，先进的服务理念，为中国高端的时尚用户所追捧。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/56/8/1366091748964.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWl3SrI6HCZg7Rnu_fmUmUSe7C5BdWNjd3OoVrI6H2mLmWntmrn3FWEz71ZLLrZX6CQ4tCmq_rI6HWNDS6ERSWOBH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-7.0%', '2013-01-22 00:00:00', '2014-01-21 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('294', '2005', '尊时表行', '德国尊时表行（detimeboutique)是柏倍德集团全力打造的连锁品牌零售渠道，专营以德国名表为主的欧洲中高档优质腕表品牌和其他相关奢侈品，构成完整的品牌链。母公司柏倍德集团是一家资深的钟表及其他奢侈品类贸易集团，总部设于德国汉堡，分别在英国伦敦和中国厦门设立分公司。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/11/53/1359452581109.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWlzSrI6HCZg7Rnu_fmUmUSewMQgAY5Kd3OoVrI6H3wz7Us6BrnRLWEUH6EzS1nDFrnXH2mq_rI6H1nPyME2LWNPH2L--&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-01-30 00:00:00', '2014-03-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('295', '2006', '95珠宝', '九五珠宝商城是一家专注于网上销售珠宝的电子商务平台，产品包括黄金、铂金、钻石、彩宝、珍珠等品类，囊括了国内外众多知名珠宝品牌。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/10/54/1343357743408.jpg', 'http://p.yiqifa.com/n?k=3P4X5B6VrI6HWEWL1n4H2mquUZgL18H_UmUmfEws3cPef96_YQLErI6H6ERs6ZLO1n2F6nbHWZLErJoH2mq869BbMNU8WmLE&e=API090507&spm=138655627865015183.1.1.1', '0.85%-7.0%', '2012-07-30 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('296', '2008', '五色鱼', '五色鱼是深圳市网汇达科技有限公司正规经营的电子商务网站以信誉与口碑赢得市场，致力于为用户提供最优惠的价格同时保障产品的质量和完善的售后服务。五色鱼目前是中国工商银行、招商银行、财付通等多家支付机构的特约合作伙伴；同时与新浪、网易、腾讯、中国移动等多家大型门户网站建立了战略合作关系，产品包括吊坠、耳环、耳钉、项链、毛衣链、手链、手镯、脚链、银条、元宝、工艺品、胸针、配件。材质包含925纯银、990足银、999千足银、合金等，超过1000个款式，镶嵌各种天然或人工宝石，涵盖各种风格，深受时尚一族喜爱。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/24/8/1346395134553.jpg', 'http://p.yiqifa.com/n?k=2mLErn2qWnzSrI6HCZg7Rnu_fmUmUSemRmysf96_YQLErtqK6nX7DmLO6NR7rn3FWEz71ZLLrI6HYmLErnzO3Nt7W9tmrIW-&e=API090507&spm=138655627865015183.1.1.1', '1.4%-28.0%', '2012-04-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('297', '2009', '宾伦手表', '宾伦BINLUN中国第一个面向网络推出的手表品牌，支持货到付款，七天无理由退换货，以低价享受国际一流名表品牌的奢华和完善的客户体验，成为网络购表优先选择的品牌网站！', '10', 'http://image.yiqifa.com/ad_images/reguser/24/34/62/1350635304231.jpg', 'http://p.yiqifa.com/n?k=2mLErn276nzSrI6HCZg7Rnu_fmUmUSe8C5exU5Fd3OoVf96drI6H2mLO1Njern3FWEz71ZLLrI6HYmLErnDq15DOMEPbrZgCCsBmpQL-&e=API090507&spm=138655627865015183.1.1.1', '0.85%-11.2%', '2012-10-20 00:00:00', '2013-10-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('298', '2010', '金鑫尚金网', '金鑫尚金网由金鑫珠宝授权河南福道电子商务有限公司独立运营，是一家大型的B2C模式的专业网上交易商城，在线销售商品包括黄金、铂金、K金、钻石镶嵌等珠宝首饰。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1330566537087.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6E3SrI6HCZg7Rnu_fmUmUSFS6JVhkIeEYOsH2mLErn3sWnbH6EzS1nDFrnXHK7B6RPP!rJoH2mLOMJME1NR7WcLE&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2012-03-02 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('299', '2011', 'oohDear', 'oohDear，时尚钻石礼物品牌，汇聚众多跨界设计师艺术精髓，国际知名钻石机构投资创建。从巴黎至东京，从纽约至首尔，横跨世界的时尚艺术一览无余，尊享高端礼物定制生活从此不再是梦想。我们严格遴选每一颗优质美钻，更以其国际化的运作模式和便捷、信赖的购物体验，实现您难忘而惊喜的钻石梦想。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/17/15/1266899515337.jpg', 'http://p.yiqifa.com/n?k=2mLErnDm1n4H2mquUZgL18H_UmUmf9o_CJgy3Q2d3OoVfmLErnbBWQ6PCZL7WN2Frn3FWEz71ZLLrI6HYmLErnD76Ewe6ngbrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%-7%', '2009-09-15 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('300', '2012', '御灵珠宝', '御灵珠宝商城隶属于御府集团旗下的上海瑾隆工艺品有限公司，是中国珠宝行业最大的综合性网上品牌直销商城。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/44/52/1308737578692.jpg', 'http://p.yiqifa.com/n?k=2mLErnt71N3SrI6HCZg7Rnu_fmUmUSeEYcysf96_YQLErI6H6NRFWQLO1n2F6nbHWZLErJoH2mqbWnWF6Ey86mqKRteygE6H&e=API090507&spm=138655627865015183.1.1.1', '3.5%-11%', '2011-06-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('301', '2013', '佐卡伊', '佐卡伊，著名珠宝品牌。佐卡伊之名源于比利时著名珠宝设计大师DirksZOCAI，2004年注册成立，专业从事钻石、珠宝类电子商务业务。佐卡伊集钻石批发商、珠宝加工商、珠宝设计室、珠宝零售商四个身份于一身，整个钻石、珠宝产业链深度渗透，能够最大限度的实现顾客利益最大化。佐卡伊能够为顾客提供绝对物超所值的钻石，另一方面，佐卡伊能够为顾客提供众多稀有的高品质珍藏。作为中国互联网钻石第一品牌，佐卡伊先后获得了全球网商30强，中国十佳网商等荣誉，已连续7年占行业10个综合实力的排名第一。凭借着资深的专业团队与创新能力，佐卡伊在互联网平台创造了品牌、产品、销售、服务、信誉等全部TOP1的卓越业绩。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/33/63/1329803132450.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6E2SrI6HCZg7Rnu_fmUmUSevYO6bCpeEYOsH2mqyY7WlUPMH6EDeWQLO1n2F6nbHWZLErJoH2mLO3O3eMJDeMcLE&e=API090507&spm=138655627865015183.1.1.1', '0.56%-14.0%', '2012-02-22 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('302', '2014', '聚风尚', '聚风尚(www.jufengshang.com)是广州汉舶网络科技有限公司重金打造的奢侈品B2C网站，专门从事银行信用卡渠道的奢侈品销售，是该渠道内产品最全，评价最高的商城之一。我们为客主户提供手表品类知名品牌产品，经营品牌包括百达翡丽、江斯丹顿、劳力士、浪琴、卡地亚、欧米茄等上百个世界顶级品牌。商城的所有商品都经过严格的把关，通过正规合法的品牌商渠道引进。聚风尚是业界内公认的供应商网络及供应商质量最强大的网站之一，采购渠道遍布全球，经营品牌均由各地顶级经销商及品牌商直接供货，享受全球联保服务，是国内正品奢侈品消费评价最好的网上商城之一。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/10/10/1334891649547.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6n3SrI6HCZg7Rnu_fmUmUSehU5MyY9UlCJBdMSeEYOsH2mLErn3s6ngH6EzS1nDFrnXHY9blRP4erJoH2mLl3lyE6nwS3cLE&e=API090507&spm=138655627865015183.1.1.1', '0.7%-11.2%', '2012-03-29 00:00:00', '2013-03-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('303', '2015', '翡表网', '翡表网是专为年轻时尚一族量身打造的全球顶级时装表商城，提供国际知名时尚品牌时装腕表，为追逐潮流的年轻族群带来令人惊艳的时尚腕饰。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/14/14/1334221227690.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6n2SrI6HCZg7Rnu_fmUmUSeLRJ4A35Hd3OoVrI6HMOPJ69bSrn3s6nPH6EzS1nDFrnXH2mq_rI6H3ljlWnt71NXH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-10.5%', '2012-03-29 00:00:00', '2013-03-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('304', '2017', '卫东珠宝', '卫东珠宝网是北京卫东世嘉国际珠宝有限公司的全资子公司，是一个通过无国界网络渠道进行相关黄金、铂金、白银以及翡翠、红宝石、蓝宝石、钻石等珠宝饰品、金条的B2C类销售网站。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/44/52/1358393593546.jpg', 'http://p.yiqifa.com/n?k=CKAPgNXQrI6HWERq1n4H2mquUZgL18H_UmUmfcUwk9bs39B_f96_YQLErI6H6ljq6QLO1n2F6nbHWZLErJoH2mLO6NPE15DFMZLE&e=API090507&spm=138655627865015183.1.1.1', '0.98%-2.45%', '2013-04-03 00:00:00', '2014-04-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('305', '2018', '海润？海之宝', '海润？海之宝，海润珍珠旗下珠宝首饰子品牌，由香港顶级团队倾心设计出品，款式及质量均名列行业前茅。海之宝是把珠宝的设计与务实的定价结合起来，将高端珍珠饰品融入主流大众。', '10', 'http://image.yiqifa.com/ad_images/reguser/24/41/9/1366683615723.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm6lKOrI6HCZg7Rnu_fObbCQAuC54bYSe7Y5BxYIeEYOsH2mLErnRqWNPH6EzS1nDFrnXH2mq_rI6HWNXwMJDq6JMHgQXXMsUdrj--&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-04-12 00:00:00', '2014-04-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('306', '2020', '醉品商城', '', '10', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1362982820783.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O1N3SrI6HCZg7Rnu_fmUmUSevU5yLC5Fd3OeH2mqIYtA3DN4H6ljs1ZLO1n2F6nbHWZLErJoH2mL73lwqMJ69WQLE&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2013-03-12 00:00:00', '2014-03-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('307', '1902', '忆典定制', '消费者通过忆典提供的在线DIY设计软件?漂亮模板和经典赠语等，轻松而简单地（在家或办公室）动手设计自己喜欢的个性产品(designityourself)；忆典定制价值主张：享受个性生活！', '9', 'http://image.yiqifa.com/ad_images/reguser/24/55/9/1337655888300.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q1NDlrI6HCZg7Rnu_fmUmUSeyMJyef96_YQLErI6H6E3l1QLO1n2F6nbHWZqPkcKSpnbHYmLErJ3L3Og9WE2srIW-&e=API090507&spm=138655627865015183.1.1.1', '1.0%-17.5%', '2012-05-25 00:00:00', '2013-05-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('308', '1903', '卡当网', '卡当网成立于2006年6月，致力于个性礼品定制服务，目前产品线囊括了时尚饰品、高级珠宝、工艺礼品、食品礼盒、个性照片礼物等千款礼品，均可实现一件起订，全国配送，1200个城市货到付款。除官网外，已陆续进驻淘宝、天猫（淘宝商城）、QQ商城、京东商城。凭借出众的产品创意能力、雄厚的技术实力、专业的服务团队、强大的资源背景、先进的行业里面以及勤奋、创新的企业精神，在个性礼品定制行业处于第一品牌的绝对优势地位，并保持销售额年增长率连续数年高于300%。卡当网秉承”HearttoHeart”的理念，继续给客户提供更多高品质的个性礼品及购物体验。', '9', 'http://image.yiqifa.com/ad_images/reguser/24/57/7/1340007022361.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWl2SrI6HCZg7Rnu_fmUmUSei35gbY9Rd3OoVfmLErI6H6E3m6ZLO1n2F6nbHWZLlpyzmkN4HYmLErnze39D7MEMbrIW-&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-06-19 00:00:00', '2013-06-18 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('309', '1906', '中国鲜花礼品网', '中国鲜花礼品网，简称中国鲜花网，中国领先的鲜花礼品速递服务商，由深圳市百易信息技术有限公司于2005年投资创办，自成立以来一直保持高速成长，连续四年增长率均超过100%，现已成长为中国最具影响力的鲜花礼品网站，iResearch艾瑞排名稳居同类网站第一名，市场占有率已连续3年居中国鲜花速递行业第一位。', '9', 'http://image.yiqifa.com/ad_images/reguser/24/17/49/1338532080866.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWEzlrI6HCZg7Rnu_fmUmUSeuU5td3OoVfmLErZKFCQU2RcLO6EKmrn3FWEz71ZLLrI6HYmLErnKq6EWm3ODerIW-&e=API090507&spm=138655627865015183.1.1.1', '8.0%-12.0%', '2012-06-04 00:00:00', '2013-06-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('310', '1909', '花易网', '花易网是一家专业鲜花速递机构，隶属深圳市卢米诺信息科技务有限公司。目前在全国拥有连锁花店超过6000家，可最快在2小时送达全县级以上城市（含香港、澳门、台湾及国外），全国2000城市免运费。', '9', 'http://image.yiqifa.com/ad_images/reguser/24/19/51/1357292452335.jpg', 'http://p.yiqifa.com/n?k=kwq3DEPArI6HWE3q6E4H2mquUZgL18H_M9q_UOPSf5PbRmwd3OoVrI6H2mLO1Nwsrn3FWEz71ZLLrI6HYmLErJKeMEgwM9KFrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%-12.6%', '2013-01-05 00:00:00', '2014-01-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('311', '1910', '工美艺城网', '工美艺城网是北京工美集团有限责任公司投资运营的工艺美术及相关文化产品的电子商务平台，是汇集国内外工艺美术品及相关文化产品的专业特色网站，为经营者和消费者提供工艺美术品购买和交易。工美艺城网为给客户提供更好的服务，特别以座落在北京市西城区德胜门东滨河路3号的白孔雀工美大厦作为实体体验店。白孔雀艺术世界建店26年来，以”真品真情”的经营理念向中外顾客展示了有诸多工艺美术大师、民间艺人精心制作的、涉及50余门类多达上万个品种的传统工艺品、民间艺术品、大师作品、收藏精品、庆典礼品、涉外礼品以及现代工艺品等。', '9', 'http://image.yiqifa.com/ad_images/reguser/24/22/10/1320645633786.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6ljSrI6HCZg7Rnu_fmUmUSecY5PECQgef96_YpoH2mqdKN4SKlUH6EWs6mLO1n2F6nbHWZLErJoH2mLl3E2l653L1ZLE&e=API090507&spm=138655627865015183.1.1.1', '0.2%-6.0%', '2011-11-08 00:00:00', '2013-11-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('312', '1911', '有福网', '有福网成立于2008年已目前已拥有60万注册用户，是国内领先的网上冲印和个性印品DIY定制平台。', '9', 'http://image.yiqifa.com/ad_images/reguser/24/10/54/1334296047065.jpg', 'http://p.yiqifa.com/n?k=2mLErn2qWNjlrI6HCZg7Rnu_fmUmUSeeYOMsRSeEYO7_rI6HD9yT5ZBprn3s6l6H6EzS1nDFrnXH2mq_rI6H65BbW9tL6nbH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.85%-17.0%', '2012-04-16 00:00:00', '2013-04-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('313', '1912', '稀品网', '中国最大的创意设计电商稀品网，全新加入一起发网盟，全站返利12.6%，超越同类所有站点，大量网盟广告配合投放，并提供大量创意广告支持提升转化。', '9', 'http://image.yiqifa.com/ad_images/reguser/24/11/53/1362110449464.jpg', 'http://p.yiqifa.com/n?k=NJ6AUyU_rI6HWERqWE4H2mquUZgL18H_UmUmfcbARJydf9syrI6H2mLmWnKLrn3FWEz71ZLLrI6HYmLErnjqWlB8MEKSrIW-&e=API090507&spm=138655627865015183.1.1.1', '12.6%', '2013-04-19 00:00:00', '2014-04-18 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('314', '1801', '北发图书网', '北发图书网是在整合了北京图书大厦、王府井新华书店、中关村图书大厦等7家网络书店资源的基础上，组建的以图书、音像制品及电子出版物销售为主，集网上购物、在线阅读、行业信息发布和多种商品经营功能于一体的国有大型图书类专业网站。2009年11月8日是北发图书网成立两周年的日子，为庆祝北发图书网成立2周年，感谢广大读者一直以来的热忱支持，北发图书网特此举办了大型图书优惠促销活动——“全场图书折上折，满100返60，全国免运费”活动。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/43/11/1261374970571.jpg', 'http://p.yiqifa.com/n?k=2mLErnDOWlMH2mquUZgL18H_UmUmf94yC5Mb39o_CSeEYO7_rI6H2mL7WEDOrn3FWEz71ZLLrI6HYmLErJ6yM5By3O2lrB6XWOo7RZL-&e=API090507&spm=138655627865015183.1.1.1', '3.0%-8.0%', '2009-10-28 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('315', '1802', '中国图书网', '中国图书网创建于1998年，是国内最早的网上图书销售平台之一。经过8年的发展，中国图书网拥有一支掌握了最前沿信息技术和熟悉现代企业管理的富有朝气的企业团队，并且我们已经树立了国内网上书店的一流品牌、积累了丰富的网站运营、管理经验。成为网上购书的第一选择。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/10/10/1261378048279.jpg', 'http://p.yiqifa.com/n?k=2mLErnts6QLErJb7UZjvfSomUmRd39o_Cm6ECJyd3peEYOsH2mLErn2F6QLO1n2F6nbHWZLErJoH2mqEW9DSWNt73mqENtVbK9yH&e=API090507&spm=138655627865015183.1.1.1', '0.85%-7.0%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('316', '1803', '互动出版网', '中国互动出版网网站成立于2000年7月，国内最大的专业技术图书网上书店。目前网站图书品种近120万种，与国内、国外500余家出版社建立了供货关系，中、英文可供图书品种市场覆盖率超过90%。数十家国内、外物流合作商，共同帮助china-pub实现国内600余个城市、国际300余个城市的配送服务。网站2005-2007连续三年被评为国内电子商务网站100强、图书音像类综合排名第一位，是国内最具特色的电子商务网站之一。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/15/15/1257416913613.jpg', 'http://p.yiqifa.com/n?k=2mLErnKL6cLErJb7UZjvfSomUmRd3ObAY9tVRZP8f96_YQLErZBSgtsMKmLFWEBH6EzS1nDFrnXH2mq_rI6H6J4y1J49WNXH2L--&e=API090507&spm=138655627865015183.1.1.1', '12.0%', '2008-12-29 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('317', '1804', '博库书城', '博库书城有限公司为浙江省新华书店集团有限公司投资设立的全资下属子公司，是全国图书发行业第一家大型跨省连锁企业。博库书城脱胎于新华书店却又不同于新华书店。新华书店这块金字招牌，其蕴涵的商业价值和社会效益是无价的，之所以叫博库书城（Bookuu），是希望这个品牌能够成为一个世界性的名称。博库书城将成为新华书店在新世纪的新方向!', '8', 'http://image.yiqifa.com/ad_images/reguser/24/7/7/1284968543179.jpg', 'http://p.yiqifa.com/n?k=2mLErntLWEzSrI6HCZg7Rnu_fmUmUSe8YOoiUQKd3OoVrI6HWmM8gZwLrnKLWNXH6EzS1nDFrnXH2mq_rI6HMNyE3NtO3OBH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.5%', '2010-09-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('318', '1805', '蔚蓝网', '蔚蓝网（北京时代蔚蓝信息技术有限公司）于2000年3月26日在六位清华大学的博士和硕士共同努力下正式成立。网站创立伊始，秉持源于校园，服务于校园的经营理念，从考试、计算机、教材教辅等学生、教师们重点关注的图书做起，以快捷的图书资讯，优质的配送服务，实惠的购书价格在高校中树立了良好的品牌。并成为中国校园网内最大的电子商务网站。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/49/15/1304668623554.jpg', 'http://p.yiqifa.com/n?k=MPPZK9WmrI6HWNWs1n4H2mquUZgL18H_UmUmfcUxf96dfmLErI6H6N3SWcLO1n2F6nbHWZLErJoH2mLmWnbw1nWeWmLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-14.0%', '2011-05-07 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('319', '1806', '文轩网', '文轩网\'（winxuan.com）是四川文轩在线电子商务有限公司（简称\'文轩在线\'）旗下的传统出版物（文化产品）电子商务平台。文轩在线是新华文轩出版传媒股份有限公司（简称\'新华文轩\'）的控股子公司。新华文轩是我国第一家按照上市公司标准组建的股份制出版发行企业。2007年，在香港联合交易所主板（H股）上市，成为国内首家在港上市的出版发行企业。文轩网作为新华文轩推出的电子商务品牌，现已成为文轩自零售、中盘、定制之后的第四销售渠道。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1261377859735.jpg', 'http://p.yiqifa.com/n?k=2mLErntF1ZLErJb7UZjvfSomUmRdUOydkZPbY8eEYO7_!mLErtKmK5Mb6ZLS1NyH6EzS1nDFrnXH2mq_rI6HMnz7W9K7WlMH2L--&e=API090507&spm=138655627865015183.1.1.1', '6.5%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('320', '1809', '赛尔校网', '赛尔校园先锋是赛尔网络旗下的面向中国高校师生的教育类商品特惠购买平台，在这里，所有中国高校师生都可以以特惠价格购买微软、Adobe、Apple&nbsp;等国际著名公司提供的正版软件、硬件、培训、技能认证、图书等特惠商品，并享受高品质的下载及售后服务。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/50/14/1343183577655.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S1N3SrI6HCZg7Rnu_fm6uYmjdM5gsf96drI6H2mLO6lDFrn3FWEz71ZLLrJU5Y76!Rmq_rI6HMND71nDOMJPH2L--&e=API090507&spm=138655627865015183.1.1.1', '4.9%-10.5%', '2012-07-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('321', '1810', '淘书网', '淘书网是一家有多年书业运营经验的图书电商网站，以经营书店和出版社的库存特价书为特色，90万种图书，30万种特价，1折起任你淘！', '8', 'http://image.yiqifa.com/ad_images/reguser/24/23/55/1358908442171.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWNDSrI6HCZg7Rnu_fmUmUSe735olCZKd3OoVrI6HDEgTCmy7rnRLWnXH6EzS1nDFrnXH2mq_rI6H153q39My6JBH2L--&e=API090507&spm=138655627865015183.1.1.1', '6.0%-8.0%', '2013-01-08 00:00:00', '2014-01-07 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('322', '1811', '杂志铺', '杂志铺网站是国内第一家杂志折扣订阅网，由成都邮征天下信息技术有限公司运营和管理，目标成为全球最大的中文期刊发行平台。致力于为顾客提供最低的订阅价格，让顾客在第一时间享受到阅读的快乐。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1345518723568.jpg', 'http://p.yiqifa.com/n?k=pZBD656BrI6HWEWl6n4H2mquUZgL18H_UmUmfcAbk9bARZKd3OoVrI6H2mLO1njsrn3FWEz71ZLLrI6HYmLErn4EMNby69KsrIW-&e=API090507&spm=138655627865015183.1.1.1', '4.2%', '2012-08-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('323', '1812', '蜘蛛网电影', '蜘蛛网是中国最大、最具影响力的报刊网络发行机构。纸质报刊网络发行和数字报刊发行市场影响力第一。蜘蛛网目前已成为集报刊、图书、演出与电影票、文化礼品等综合性的文化产品和服务电子商务平台，居国内同行业领先地位。', '8', 'http://image.yiqifa.com/ad_images/reguser/24/21/53/1355983590612.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6lzSrI6HCZg7Rnu_fmUmUSelRJywMQ2d3OoVf96dfmLErI6H6EwFWQLO1n2F6nbHWZqJRPWS39sHYmLErnKq1nKOWODerIW-&e=API090507&spm=138655627865015183.1.1.1', '2.8%-3.5%', '2012-12-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('324', '1813', '读览天下', '读览天下2007年成立于广州，是中国领先的移动互联网阅读平台，目前拥有综合性人文大众类期刊品种1000余种', '8', 'http://image.yiqifa.com/ad_images/reguser/24/43/53/1350272132779.jpg', 'http://p.yiqifa.com/n?k=2mLErn276NjSrI6HCZg7Rnu_fmUmUSewYOox35ewf96_YpoH2mLErn3F1NUH6EzS1nDFrnXHgn6BPNP6rJoH2mLl3OgbWJtOMZLE&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2012-10-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('325', '1814', '华图图书网', '华图图书公司创立于2005年，是一家集图书策划、编辑、出版、营销于一体的综合性图书经营企业。公司自创立以来，以精准的市场定位、严格的质量把关、先进销售模式的打造和优质销售渠道的开拓，已成为国内同行业中的销售领先者。公司现已形成大学考试类、党政类、少儿类等多个门类产品，现共计出版图书1000多品种，所有产品均畅销全国各地', '8', 'http://image.yiqifa.com/ad_images/reguser/24/13/51/1369637838762.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWlDOrI6HCZg7Rnu_fO4_YOxdCZPbUZKd3OoVfmLErI6HWNRq1NbH6EzS1nDFrnXHW7s9RKqurJoH2mLL1Nb86OPyWZLE&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-06-05 00:00:00', '2013-06-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('326', '1702', '母婴之家', '母婴之家是专业的母婴用品专卖网站。提供0-3岁婴幼儿产品、新妈妈、准妈妈用品的专业零售服务。母婴之家经营的产品包括奶粉，辅食，牛初乳，纸尿裤，营养保健，喂哺用品，洗护用品，童车童床，妈妈用品，婴儿服饰，日常生活用品，玩具等等。主要经营品牌包括：惠氏，美赞臣，雅培，美素，好奇，帮宝适，贝亲，安怡，NUK，金奥聪，初乳康乳加力，三洋，六甲村，好孩子，小龙哈彼等等。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/31/1/1268635983378.jpg', 'http://p.yiqifa.com/n?k=2mLErnKFWn4H2mquUZgL18H_UmUmf9ssk5ydMmAuC5AA3peEYOsH2mqCM9AI65qH6nKLWQLO1n2F6nbHWZLErJoH2mqwWN3L3Ebw6ZLE&e=API090507&spm=138655627865015183.1.1.1', '1%-8%', '2010-03-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('327', '1703', '速普', '速普商城是专业销售母婴用品的B2C购物网站。5000多种单品、百余个品牌，母婴品种齐全；商城坚持低价销售，“速享低价、普及万家”是我们的经营宗旨；全国2000余城市货到付款，7天无条件退还货。价格低、品种全、售后有保障，速普商城在客户心中树立了专业、放心、值得信赖的形象，网站的转化率达到13%以上。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/29/61/1311824225392.jpg', 'http://p.yiqifa.com/n?k=2mLErnts1NzSrI6HCZg7Rnu_fmUmUSelUQXskpeEYOsH2mq36NbARtVH6NzFWcLO1n2F6nbHWZLErJoH2mLe3Nz7WNgE1QLE&e=API090507&spm=138655627865015183.1.1.1', '1%-9.1%', '2011-07-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('328', '3623', '今生宝贝', '2013年3月8号今生宝贝垂直B2C商城隆重上线，以终端实体店为依托、在自营B2C平台上电商化门店，以目录销售、呼叫中心直销相结合，构建本地化服务，一站式家庭生活购物生态链，此销售体系为行业之首创！公司现采用O2O模式运营，O2O模式是电商未来的发展趋势。它将线上线下会员体验模式紧密结合，是电商社会化最突出的表现。今生宝贝经营网点分布全国230多个城市 1，500多个营业网点，全力支持并发展O2O模式，让加盟商的会员线上线下双重贴心服务体验。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/52/12/1370324212249.jpg', 'http://p.yiqifa.com/n?k=YNtsKKPLrI6HWlzO6NUH2mquUZgL18H_UmUmf9VARm6838eEYOsH2mLErntmWEtOrn3FWEz71ZLLrI6HYmLErnKmMNPy6ntsrIW-&e=API090507&spm=138655627865015183.1.1.1', '1.4-3.5%', '2013-06-05 00:00:00', '2014-06-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('329', '1718', '麦乐购', '麦乐购（M6go）是一家全球贸易公司。麦乐购通过与国际知名品牌的合作，经由互联网向全球个人消费者提供具有独家折扣价格的时尚精品和母婴用品。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/19/13/1337566962274.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6lzSrI6HCZg7Rnu_fmUmUSeV69U_f96_YQLErI6H6E3l6QLO1n2F6nbHWZq9Pyb7MmbHYmLErn4bMNwLMnMwrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2012-05-22 00:00:00', '2013-05-21 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('330', '1720', '爱就推门玩具专营店（天猫）', '爱就推门玩具有限公司的前身是具有十年历史的明智玩具厂、义乌市智商玩具有限公司。一直从事益智玩具的研发、设计、制造、内外销工作。在08年夏天，由于市场形势急剧变化，经公司董事会决议，特改组为以国内玩具零售专卖为主，并更名为爱就推门玩具有限公司。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/14/50/1364524391444.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWlDSrI6HCZg7Rnu_fOBhUJsmC8e7Y5BxYIeEYOsH2mLErnRL1nMH6EzS1nDFrnXHkNMdD94xrJoH2mL7W53eW5KO6ZLE&e=API090507&spm=138655627865015183.1.1.1', '1.5%-10%', '2013-03-30 00:00:00', '2014-03-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('331', '1722', '外婆网', '外婆网隶属于古瑞德玛（北京）网络技术有限公司，创立于2011年，是中国领先的母婴用品网上商城，在线销售婴儿食品、用品、服饰以及妈妈用品等母婴商品。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/21/11/1342426635827.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWnjSrI6HCZg7Rnu_fmUmUSem35yLYmUbY9Rd3OoVrI6H2mLO6l2Frn3FWEz71ZLLrI6HYmLErnKS65K7M52OrngbRlBXYcL-&e=API090507&spm=138655627865015183.1.1.1', '0.7%-3.5%', '2012-07-17 00:00:00', '2013-07-16 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('332', '1723', '百洋健康网', '百洋健康网是迪巧官方指定网络经销商。</p>\r\n<p>目前设有”聪慧宝宝”、”幸孕妈咪”两个子频道，主要经营产品有药品、孕婴用品、保健品、医疗器械、药妆产品、生活日化等十一大类、近万种产品。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/17/49/1314683550869.jpg', 'http://p.yiqifa.com/n?k=3N2m6Jq4rI6HWNRqWn4H2mquUZgL18H_UmUmf94bCQyhCSeEYOsH2mLErn3qWngH6EzS1nDFrnXH2mq_rI6HW5DL6l2O35gH2L--&e=API090507&spm=138655627865015183.1.1.1', '7%', '2011-08-31 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('333', '1725', '宝贝购', '宝贝购是中国首家婴童品牌特卖网站，专注于提供安全、时尚的婴童类服饰、箱包、玩具、文具等商品，与国内外超过300家婴童类商品品牌商达成战略合作，以原价3-5折的价格为妈妈们提供各类婴童商品，每天14:00十个左右品牌上线销售，仅销售7天，限时限量，先到先得。全方位关注宝贝的身体、智力和心理的健康成长。是妈妈育儿的购物好帮手。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/19/51/1369295573159.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWEWmrI6HCZg7Rnu_fmUmUSe835o8M5ycYmKd3OoVrI6H2mLq6ltF6cLO1n2F6nbHWZLErJoH2mqbW53l1N2qMZqbC5sKUteH&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-05-31 00:00:00', '2013-05-22 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('334', '1711', '安购母婴商城', '安购母婴商城创办于2007年，是旗下在大陆地区指定的网购商城，通过搭建面向大陆市场的优质电子商务平台，全面开拓国内进口母婴产品的网络销售渠道。目前以日本、荷兰、美国和新西兰等国家的母婴类产品经营为主，所有商品均由通过正规外贸渠道采购，保证全部原装正品。安购母婴商城是国内为数不多拥有增值电信业务经营许可证和食品流通许可证的网络销售平台，同时与国内多家知名网络技术公司合作，是国内最规范、最专业和品种最齐全的母婴用品商城。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/17/49/1342684757655.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S1nzsrI6HCZg7Rnu_fmUmUSebY9ecYSedMQgH2mqh6sySNZPH6ERl1QLO1n2F6nbHWZLErJoH2mLq6JWm3lzLMQLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-8.0%', '2012-07-20 00:00:00', '2013-08-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('335', '1712', '益智堂', '儿童早教启蒙教育商城，为孩子们提供安全健康、趣味学习的婴幼儿益智玩具，儿童书籍，积木玩具，音像等幼教产品。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/5/5/1356593167977.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6l3SrI6HCZg7Rnu_fmUmUSFSWlDd3OeH2mLErn3e6lMH6EzS1nDFrnXH2mq_rI6H6NKeWlWSWNUHKOB26PyArj--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-7.0%', '2012-12-19 00:00:00', '2013-12-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('336', '1713', '乐友网', '乐友公司（www.leyou.com）是中国领先的孕婴童用品专卖连锁企业，目前所销售的孕婴童产品数量上万种，与其合作的530家厂家及供应商遍布世界23个国家。乐友的业务范围已经拓展至网络、目录销售和专卖店销售，形成了首家三位一体的现代化孕婴童用品销售网络。在北京独家推出了当天订货当天到的快捷送货服务', '7', 'http://image.yiqifa.com/ad_images/reguser/24/34/2/1293759498968.jpg', 'http://p.yiqifa.com/n?k=2mLErn2F6ZLErJb7UZjvfSomUmRdYJPeYmKd3OoVf96drI6H2mLS6N4H6EzS1nDFrnXHC5bC6OBJrJoH2mLlWEjs39KFWmLE&e=API090507&spm=138655627865015183.1.1.1', '2.5%', '2008-11-17 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('337', '1715', '妈妈购·贝因美', '妈妈购·贝因美是贝因美旗下专业母婴购物网站，是育婴专家综合展现平台，致力于提供全方位的母婴产品和服务。妈妈购·贝因美（http://www.motherbuy.com）倡导”科学消费”，提供在线消费指导，为消费者挑选品质可靠的高性价比商品，”让宝宝享有更安全和品质的生活，为妈妈节约每一个可以节约的”是我们的经营宗旨。妈妈购·贝因美在线销售食品、纺织服装、亲子教育、洗浴护肤、哺育用品、纸尿裤、童车童床、居家外出、妈妈用品等9大品类商品。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1345531655635.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWEzlrI6HCZg7Rnu_fmUmUSeVYmguMQ48UQwd3OoVrI6HK7P_REROrn3m6EyH6EzS1nDFrnXH2mq_rI6HWNb8WEKeWlBH2L--&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-08-11 00:00:00', '2013-08-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('338', '1716', '英伦宝贝', 'i-baby是中国高端婴童领先品牌，涵盖世界顶级童床、童车、婴童服装、婴童家纺、儿童礼服等产品。秉承”天地之美，良心品质”的经营理念和”让下一代高贵成长”的企业使命，全面满足中国婴幼儿家庭的核心基本需求。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/5/59/1348639809765.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1NzlrI6HCZg7Rnu_fmUmUSFsW5y8354ef96_YQLErI6H6Ezs6mLO1n2F6nbHWZLErJoH2mq8W92q6EKFWcqtpwy6WmgH&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2012-09-25 00:00:00', '2013-09-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('339', '1717', '孕肤宝', '广州孕肤宝日用品有限公司（简称孕肤宝），是国内最早从事孕产期女性护肤品和个人健康护理产品研发、生产和行销的现代电子商务公司，同时也是全球第一个根据孕产周期进行皮肤全程护理方案设计的专业品牌商，期下品牌涉及到面部护理、身体护理和化妆品和孕期特殊护理产品。', '7', 'http://image.yiqifa.com/ad_images/reguser/24/3/61/1314770269946.jpg', 'http://p.yiqifa.com/n?k=N7AxgK2OrI6HWN3e6E4H2mquUZgL18H_UmUmfcysY9Ms39B_f96_YQLErI6H6Etq6ZLO1n2F6nbHWZLErJoH2mq9M5t7MEXEWZLE&e=API090507&spm=138655627865015183.1.1.1', '24.5%-30.0%', '2011-09-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('340', '1601', '兰缪内衣', '', '6', 'http://image.yiqifa.com/ad_images/reguser/24/38/6/1341031045440.jpg', 'http://p.yiqifa.com/n?k=2mLErnD71n4H2mquUZgL18H_UmUmf9qbY5ysf96_YQLErI6H6n2SWZLO1n2F6nbHWZLErJoH2mqy3Ogw3E2s6ZqcWywsPEyH&e=API090507&spm=138655627865015183.1.1.1', '10.0%-15.0%', '2009-10-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('341', '1602', '爱慕官网', '公司在北京、苏州拥有专业制造基地，可加工生产基础内衣（文胸、内裤）、塑身内衣（塑裤、塑身衣、腰封等）、生活内衣（睡衣、居家服、保暖内衣等）等三大类内衣产品，年生产能力达600万件。爱慕产品已连续四年被北京市评为北京名牌产品。', '6', 'http://image.yiqifa.com/ad_images/reguser/24/11/11/1288332303989.jpg', 'http://p.yiqifa.com/n?k=2mLErnwSWE4H2mquUZgL18H_UmUmf9BAY5PSf96_YpeEYcLErJueDlPupmLsWN2srn3FWEz71ZLLrI6HYmLErJWLM5KL6NWFrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.5%-10.5%', '2010-10-30 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('342', '1603', '时尚一点', '时尚一点，专业内衣品牌。总部位于中国中西部金融中心、现代化制造业基地、现代服务业基地的成都市，其秉承为中国本土最具影响力的内衣品牌的使命，致力于在网络上推广内衣文化，全力为大众提供平价时尚的内衣生活。”时尚，一点不贵”时尚一点为大家提供优质、时尚、一点也不贵的内衣体验。', '6', 'http://image.yiqifa.com/ad_images/reguser/24/56/8/1327975424026.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWljSrI6HCZg7Rnu_fmUmUSeeM5BSMJPbR8eEYO7_rI6H2mLO6nKsrn3FWEz71ZLLrJb6W9Vckcq_rI6HMn3m6OWlM5BH2L--&e=API090507&spm=138655627865015183.1.1.1', '11--17%', '2012-01-05 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('343', '1605', '仙子宜岱(天猫）', '仙宜岱股份有限公司成立于1999年，注册资金一亿元，旗下内衣品牌仙子宜岱秉持“关爱、品位、奢华”的品牌理念，产品糅合欧洲时尚元素和南美热辣风情，结合人体工学，采用国际高级面料，剪裁流畅，做工精细，款式奢华、时尚而性感，是全球70多个国家和地区注册商标，是全球城市旅游小姐世界大赛、国际小姐选美大赛中国赛区唯一指定内衣品牌，是全球时尚健康调整型内衣领导品牌。', '6', 'http://image.yiqifa.com/ad_images/reguser/24/21/53/1365383997447.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWE2SrI6HCZg7Rnu_fmbvk5DdUJsbYJLd3OoVrI6H2mLmWnKmrn3FWEz71ZLLrI6HYmLErnwO1nze15tertPOgmB53cL-&e=API090507&spm=138655627865015183.1.1.1', '6-7.5%', '2013-04-07 00:00:00', '2014-04-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('344', '1066', '仙子宜岱官网', '仙宜岱股份有限公司成立于1999年，注册资金一亿元，旗下内衣品牌仙子宜岱秉持“关爱、品位、奢华”的品牌理念，产品糅合欧洲时尚元素和南美热辣风情，结合人体工学，采用国际高级面料，剪裁流畅，做工精细，款式奢华、时尚而性感，是全球70多个国家和地区注册商标，是全球城市旅游小姐世界大赛、国际小姐选美大赛中国赛区唯一指定内衣品牌，是全球时尚健康调整型内衣领导品牌。', '6', 'http://image.yiqifa.com/ad_images/reguser/24/42/54/1370595980995.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWN2mrI6HCZg7Rnu_fmUmUSeFkcywf9eyUIoH2mLF35gsDm6H6ljmWQLO1n2F6nbHWZLErJoH2mLsW5BEW9BbWZLE&e=API090507&spm=138655627865015183.1.1.1', '8.4%-10.5%', '2013-06-07 00:00:00', '2013-06-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('345', '3676', '多喜爱', '湖南多喜爱家纺股份有限公司，自成立以来一直致力于以套件类产品（含枕套、被套、床单、床笠等）、芯类产品（含枕芯、被芯）为主的家纺用品的研发设计、外包生产、品牌推广、渠道建设和销售等业务，具备行业领先的自主研发设计能力、严格的供应商筛选机制、完善的生产控制体系、强大的渠道拓展能力及健全的销售服务体系。公司一直着力打造“时尚家纺”概念，注重产品设计风格，通过主题、色彩、花型等方式突出时尚、新潮的品牌内涵，并始终坚持对产品功能性的开发和提升，通过各种技术手段有效提高了产品的抗菌、防霉和保健等功能，对追求简约、时尚、个性的细分市场受众具有较强的品牌粘性，在广大消费者人群中获得了较高的美誉度。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/41/55/1376964330245.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6NWOrI6HCZg7Rnu_fmUmUSewYObA3peEYcLErtMKYwBtWmLq6lWFWcLO1n2F6nbHWZLErJoH2mqy6NWL6O2s3cLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-14%', '2013-08-21 00:00:00', '2014-08-20 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('346', '3713', '家品会', '', '5', 'http://image.yiqifa.com/ad_images/reguser/24/14/50/1378351674751.jpg', 'http://p.yiqifa.com/n?k=2mLErnDLWNRSrI6HCZg7Rnu_fmUmUSeukZ6uYmjd3OoVrI6H2mLq6lDqWZLO1n2F6nbHWZLErJoH2mqwME3eW5KmMcqCNNXA3EUH&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-09-05 00:00:00', '2014-09-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('347', '3717', 'KeKeHome', '', '5', 'http://image.yiqifa.com/ad_images/reguser/24/31/63/1384763939518.jpg', 'http://p.yiqifa.com/n?k=pNU6C9yJrI6H6njsWEgH2mquUZgL18H_UmUmf9VyCOPuYOsyf96_YQLErI6HWNR71nbH6EzS1nDFrnXH2mq_rI6H39Ds353sWN4H2L--&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的4.2%', '2013-11-05 00:00:00', '2014-11-04 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('348', '3700', '联合一家', '', '5', 'http://image.yiqifa.com/ad_images/reguser/24/6/6/1377851768434.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6EjLrI6HCZg7Rnu_fmUmUSesYEKFf96_YQLErI6HWNRl1nBH6EzS1nDFrnXH2mq_rI6H1J2q15KS6OgHgQMT6NXhrj--&e=API090507&spm=138655627865015183.1.1.1', '1.05%', '2013-08-20 00:00:00', '2014-08-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('349', '1516', '为她他', '为她他(vegaga)是一家品牌家纺在线商城，致力于为消费者提供&ldquo;高性价比&rdquo;的时尚品牌家纺在线商城，为家纺网购提供一站式的便利服务，同时为消费者提供家纺选购保养的专业知识。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1322189573603.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWNDlrI6HCZg7Rnu_fmUmUSeOM5UbMOtd3OoVfmLErI6H6EWF1QLO1n2F6nbHWZLErJoH2mLm3NDe6Jgb1Qq7DlBepZAH&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2011-11-26 00:00:00', '2013-06-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('350', '1517', '红星美凯龙 星易家', '红星美凯龙星易家(www.mmall.com)是由中国家居流通第一品牌红星美凯龙创立并运营的电商平台。星易家由B2B2C、B2C、团购O2O、集采、资讯、服务六大业务模块组成，依托红星美凯龙的资源优势，为消费者提供最丰富的家居购物和最专业的在线家装支持。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/60/4/1363139406668.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O1nDSrI6HCZg7Rnu_fmUmUSeVY5BxYIeEYOsH2mqdktME5ZUH6ERO6mLO1n2F6nbHWZLErJoH2mLL6nw7WN4yWQLE&e=API090507&spm=138655627865015183.1.1.1', '0.7-108.5元/单', '2012-08-10 00:00:00', '2013-08-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('351', '1518', '瑞西屋（天猫）', '瑞西屋主营家纺、家居，一个秉承“悦家精神”的休闲家居品牌。亚洲款型和欧美设计的融合，成就了瑞西屋独特的，彰显“个性、活力、本真”。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/5/5/1368152701931.jpg', 'http://p.yiqifa.com/n?k=6OeB3QPCrI6HWlRmWnbH2mquUZgL18H_RcPAkJymUpe7Y5BxYIeEYO7_rI6H2mLmWNtqrn3FWEz71ZLLrI6HYmLErnwF35tO6NWqrIW-&e=API090507&spm=138655627865015183.1.1.1', '7.5%', '2013-05-13 00:00:00', '2014-05-12 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('352', '1519', '家有购物', '？家有购物集团有限公司成立于2008年，注册资金1亿元人民币，定位“家居用品，天天特价”，为顾客提供电视频道、网上商城、商品目录等无店铺购物服务，立志打造中国一流的现代化家居用品家庭购物平台。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/12/12/1366957010776.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWnz7rI6HCZg7Rnu_fmUmUSehC5BeYmPcYSeEYO7_rI6HRO6t6sA2rntmWNDOrn3FWEz71ZLLrI6HYmLErng83O6E3EXyrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-05-16 00:00:00', '2014-05-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('353', '1520', '海狸家居商城', '海狸家居商城——综合家居用品网上商城是上海海狸电子商务有限公司旗下网站。是一家专注于家居家纺类产品的B2C网站，品类囊括家纺、家饰、储物收纳、厨房卫生、服饰鞋包、家具建材、生活日用七大分类，目前销量在行业内排名第一。公司所有管理层来自百安居、篱笆网、我爱我家、驴妈妈、麦包包等知名零售&网络公司。擅长电商运营、产品策划和供应链管理，致力于为互联网用户提供质优价廉的家居家纺类产品以及优质的售后服务。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/57/7/1369022241708.jpg', 'http://p.yiqifa.com/n?k=2mLErn2qWN2SrI6HCZg7Rnu_fmUmUSFSWly8UQwd3OoVrI6H2mLO6Nw7rn3FWEz71ZLLrt27RPgAUZq_rI6H35tqMJWO3OPH2L--&e=API090507&spm=138655627865015183.1.1.1', '8.5%', '2012-04-26 00:00:00', '2014-04-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('354', '3620', '高乐家居', '高乐家居网, 是一家专门从事家具销售的电子商务公司，由高乐家居网上商城和高乐体验馆两部分组成。高乐家居体验馆是集家具展示、家具购买、家具安装配送、家具售后服务为一体的综合店铺。打造家具行业的4S标准。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/23/9/1371612304481.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6l2LrI6HCZg7Rnu_fmUmUSec35oxMpeEYOsH2mLErntmWEDOrn3FWEz71ZLLrI6HYmLErnRlMnWL3N2SrtsPg9AcDQL-&e=API090507&spm=138655627865015183.1.1.1', '0.7%-4.9%', '2013-06-20 00:00:00', '2014-06-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('355', '3652', 'Votoro家居', 'VOTORO瓦特沃隶属于上海戈特电子科技有限公司，在20世纪末密切关注LED照明技术，并开始转型于LED家具照明的创新；先后开发了LED应急手电筒、LED台灯等多款产品，深受哦没地区市场好评。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1369369384941.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWNzSrI6HCZg7Rnu_fmM_UJoSYSe7Y5BxYIeEYOsH2mq1RwgZUEMHWNRq1nbH6EzS1nDFrnXH2mq_rI6HMn3lM5MyWnXH2L--&e=API090507&spm=138655627865015183.1.1.1', '有效订单额7.5%', '2013-05-24 00:00:00', '2014-05-23 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('356', '1502', 'RoyalDesign', 'RoyalDesign包罗了欧洲最顶尖的设计品牌，定位高端，正品保证。在国内各高级百货商场均有销售，其价格是商场价的60%。FedEx欧洲门到门直运并附加保险，关税全包，3-5天到货。欧洲当季最新的款式，60000个商品在售，覆盖家居，首饰等设计品。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/60/4/1323330777828.jpg', 'http://p.yiqifa.com/n?k=2mLErnK7WE6H2mquUZgL18H_UmUmfc4_k5BxMJPlC5Udf96_YpoEY8oH2mLqRKypPPAH6nDSWcLO1n2F6nbHWZLErJoH2mq8MnD7Wl2FMcLE&e=API090507&spm=138655627865015183.1.1.1', '6.0%', '2011-12-09 00:00:00', '2013-12-07 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('357', '1504', '中国家纺', '“中国家纺官网”隶属于“南通微纺电子商务有限公司”,成立于2011年6月，致力于为家纺企业提供互联网信息技术服务及电子商务营销解决方案等。中国家纺网是一个家纺类产品信息汇集的网络平台，平台面向国内外所有供需客户群体，为其提供最新的家纺资讯、供求信息、商贸服务、家纺产品销售、家纺品牌策划、家纺企业管理咨询等，并利用互联网的精准，高效，将全球家纺产品的信息汇集于一站。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/14/14/1336027528472.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6N2SrI6HCZg7Rnu_fmUmUSevMOA9WN3Ff96_YQLErt48k9gbYZLO6Ejern3FWEz71ZLLrI6HYmLErJWs3N4935KFrIW-&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2012-05-04 00:00:00', '2013-05-03 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('358', '1506', '酷漫居', '酷漫居，中国动漫儿童家具第一品牌。迪士尼、HelloKitty、超人、哈利波特、柯南等国际品牌授权；安全、环保、无气味；德国五金配件；首创UV油墨图案，是父母购买儿童家具的首选品牌。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/40/56/1351136539711.jpg', 'http://p.yiqifa.com/n?k=MQwmYKBPrI6HWEKL1n4H2mquUZgL18H_UmUmf96_Y5BcC5Wd3OeH2mLErn3eWEBH6EzS1nDFrnXH2mq_rI6HWlzeMNtLWnbH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2012-10-30 00:00:00', '2013-10-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('359', '1508', '大朴树', '大朴网，由库巴网创始人王治全二次创业建立，是一家B2C网站，于2012年8月28日午间悄然上线。目前主要有床上用品、内衣、毛巾浴巾、杂货四个类目的产品。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/10/54/1355392674564.jpg', 'http://p.yiqifa.com/n?k=gweAKmM6rI6HWEKFWE6H2mquUZgL18H_UmUmf9gbRZKd3OoVrI6H2mLO1NR7rn3FWEz71ZLLrI6HYmLErnjF6nDeWNUErIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%-16.0%', '2012-12-14 00:00:00', '2013-12-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('360', '1509', '里外优购', '好家品，到里外！里外优购是中国最大的时尚生活家品折扣商城，涵盖宜家精致生活用品、家具、家纺、艺术陈设、灯饰、时尚礼品、家居奢侈品等。高信用3A级认证、100%正品、30天退换货。里外优购倡导”快时尚、慢生活”的现代生活理念，旨在第一时间传播全球时尚家居生活文化，通过嗅觉灵敏的专业采购团队，随时捕捉最新的家居潮流风尚，在互联网上为追求生活品质的人们提供高性价比的时尚家品，让更多的消费者足不出户就能体验到欧美及亚洲的最新潮流家品，享受更美好的生活。里外优购，用品位诠释生活之美！', '5', 'http://image.yiqifa.com/ad_images/reguser/24/19/51/1342490393087.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6N27rI6HCZg7Rnu_fmUmUSexCQUbCpeEYOsH2mLErn3O1nBH6EzS1nDFrnXHgJLqN5BnrJoH2mq8654b3OWL6QLE&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2012-06-27 00:00:00', '2013-06-26 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('361', '1510', '贝尔地板', '贝尔商城由江苏贝尔装饰材料有限公司独资创建，开创中国地板行业通过网络卖地板的先河。2011年，贝尔地板网络销售额2000万左右，2011年12月12日，单天销售额480万，将地板网络销售提升到一个新的高度。2012年，贝尔商城再接再厉，力争再开创新的历史记录。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/50/14/1340948757648.jpg', 'http://p.yiqifa.com/n?k=MlXvCl6nrI6HWE2sWE6H2mquUZgL18H_UmUmf948YJMxYOoSf96_YpoH2mLErn3O1N6H6EzS1nDFrnXH2mq_rI6HWlw765g8WOgH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2012-06-30 00:00:00', '2013-06-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('362', '1511', '优曼家纺', '优曼家纺以”感受家关爱家”为理念，致力于打造尊贵与温馨并举的复合式家纺品牌，旗下产品涵盖床品套件、枕芯、被芯、毯类、毛浴巾、拖鞋等十大系列、几百款品种。优曼家纺以欧美现代家居审美与风尚为灵感，融合亚洲潮流元素，既注重功能美学，同时诉求家纺产品与家居空间的辉映及完美结合。优曼家纺自有B2C网站，是优曼家纺官方的网上购物平台，销售范畴覆盖优曼家纺旗下所有品牌的家纺家居类商品。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/38/6/1329986342791.jpg', 'http://p.yiqifa.com/n?k=2mLErn2LWN2SrI6HCZg7Rnu_fmUmUSesY5BdUJHd3OoVrI6HRP6K6wgWrn371NMH6EzS1nDFrnXH2mq_rI6H6NUE1J693NbH2L--&e=API090507&spm=138655627865015183.1.1.1', '7.0%-13.0%', '2012-02-24 00:00:00', '2014-02-23 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('363', '1512', 'lovo家纺', '罗莱家纺旗下独立网络品牌LOVO家居商城，LOVO是罗莱家纺旗下品牌中，销量排名第一的品牌。前期是跟它的代理公司横智合作，效果不太好。因为横智的库存没有与LOVO的进行实时对接，是网站收到多少定单去罗莱下多少定单，这样造成用户下单后没有货发出，现与LOVO官方直接合作，所有的流程都按正常的B2C合作。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/30/62/1340951630169.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6nDlrI6HCZg7Rnu_fmUmUSexYmM_f96dfmLErZKOMKUEYcLO6E3Orn3FWEz71ZLLrI6HYmLErJt73N2mMEUwrIW-&e=API090507&spm=138655627865015183.1.1.1', '2%—14%', '2012-06-14 00:00:00', '2013-06-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('364', '1503', '淘陶网', '淘陶网是江西省政府重点招商引资项目，是一家专门从事于江西景德镇瓷器网络销售的电子商务公司，首创陶瓷直购平台模式。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/52/12/1330508780850.jpg', 'http://p.yiqifa.com/n?k=2mLErn2LWlzSrI6HCZg7Rnu_fmUmUSFsWQg7f96_YpeEYcLErI6H6EKL6mLO1n2F6nbHWZLErJoH2mLS3Ezm3lW7WcqqDwsepJ6H&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10.5%', '2012-03-01 00:00:00', '2014-02-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('365', '1514', '全棉时代', '全棉时代——高端全棉生活馆隶属于北京全棉时代科技有限公司；全棉时代母公司——稳健医疗集团，是国内最大的生产、销售医用卫生材料和医用敷料的纳斯达克上市企业；产品源自医疗级车间生产，并应用自有专利技术，经65位产品专家认定，11道医学检测后方可投放市场销售；产品以母婴用品、女性用品、居家用品和医疗用品四大品类倾情为用户打造网上高端全棉生活馆，满足用户日常各种购买需求。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/29/3/1288336508548.jpg', 'http://p.yiqifa.com/n?k=2mLErnzsWEgH2mquUZgL18H_UmUmfcXsR96_UZg_Y8eEYO7_rI6H2mL71Nzlrn3FWEz71ZLLrtAyCN2LWQq_rI6HWnDmWNjO6l4H2L--&e=API090507&spm=138655627865015183.1.1.1', '9.0%', '2010-09-11 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('366', '1515', '博洋家纺', '博洋家纺官方商城www.beyond.cn隶属于宁波博洋控股集团旗下。博洋控股集团前身是宁波永丰布厂，创立于1958年，是中国纺织行业的先行者。作为宁波纺织产业改革的示范企业，经过十几年的发展，现已成为一家拥有数十亿资产，16000多名员工，涉足家纺，服装两大产业以及房产、商业、产业投资三大项目，控股旗下30余家企业的综合性集团公司。', '5', 'http://image.yiqifa.com/ad_images/reguser/24/34/62/1337225908570.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6lDSrI6HCZg7Rnu_fmUmUSe8MQy_Y9Dd3OeH2mLErn3s6nyH6EzS1nDFrnXH2mq_rI6H6EX9WnPy6EgHpmymKsXnrj--&e=API090507&spm=138655627865015183.1.1.1', '20.0%', '2012-03-31 00:00:00', '2013-03-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('367', '3684', 'Perfume.com', '海淘客户，详见活动介绍', '4', 'http://image.yiqifa.com/ad_images/reguser/24/45/51/1378274632127.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWl2OrI6HCZg7Rnu_fmUmUSeLMQ49U5syf96_YQLErngOgKtFPQLq6lWs6mLO1n2F6nbHWZLErJoH2mLmWE3s692s6mLE&e=API090507&spm=138655627865015183.1.1.1', '7%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('368', '3694', '小也天猫店', '小也涉足多个电商平台。2003年进驻淘宝平台，先后创立小也化妆品淘宝店和小也香水淘宝店;2010年10月进驻天猫平台，创立小也化妆品官方旗舰店;2011年10月进驻QQ网购，创立小也化妆品QQ网购店;2011年10月10日，小也化妆品B2C商城正式上线;2012年5月进驻京东商城，创立小也化妆品京东店。2013年7月1日，小也美妆团购正式上线，将会给予大家更多的选择和购物体验。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/39/7/1378446819349.jpg', 'http://p.yiqifa.com/n?k=PNMtCyR7rI6HWlwmWNXH2mquUZgL18H_kJybYmyyfcgbYO4bYSeEYOsH2mLErntm6njSrn3FWEz71ZLLrI6HYmLErJ496nU81JDOrIW-&e=API090507&spm=138655627865015183.1.1.1', '2.5%', '2013-09-03 00:00:00', '2014-09-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('369', '3696', '美似', 'MerryShine美似（美似旗舰店http://merryshine.tmall.com），以传播“快乐美肌，自信闪耀”为文化使命，坚持品牌发展核心路线，在电视、互联网、户外、杂志等媒体，投放全景水下拍摄高品质广告，涵盖中国最强综艺节目【非诚勿扰】【快乐大本营】【星跳水立方】【中国好声音】【康熙来了】【天天向上】【美丽俏佳人】等，深受追求美丽时尚的消费者广泛追崇，争相前去全国屈臣氏、精品超市抢购。品牌全系列产品胶原蛋白、蓝莓、葡萄籽、左旋肉碱、面膜，均采用纯天然无污染的优质高含量原料。让所有爱美的时尚女性，肌肤弹滑、水嫩白皙，由内而外焕发青春健康之美', '4', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1378697380149.jpg', 'http://p.yiqifa.com/n?k=ClUgPKRsrI6HWlwm1NyH2mquUZgL18H_Y5PSRcylCJydMpe7Y5BxYIeEYOsH2mLErntm6ntSrn3FWEz71ZLLrI6HYmLErJ2SMNtO3ltqrIW-&e=API090507&spm=138655627865015183.1.1.1', '1.75%-10.5%', '2013-09-06 00:00:00', '2014-09-05 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('370', '3697', '百芙润', '丝塔芙（Cetaphil）唯一被美国医师药典收载的皮肤科专用护肤系列品牌，是法国高德美Galderma公司推出的医疗处方品牌保养品，据说能与任何皮肤药品合并使用。创立于1931年的法国高德美Galderma公司，是世界最大食品工业集团雀巢Nestle与全球排名第一化妆品集团欧莱雅Loreal，所合资创立的皮肤医疗专业药厂。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/39/7/1377662786914.jpg', 'http://p.yiqifa.com/n?k=5P2OPKMgrI6HWlwO6ngH2mquUZgL18H_39BAMcPSU5FdUJsbYJLd3OoVrI6H2mLq6lWe6mLO1n2F6nbHWZLErJoH2mLq65KSWO6yMcLE&e=API090507&spm=138655627865015183.1.1.1', '6.0%', '2013-08-29 00:00:00', '2014-08-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('371', '3722', '美齐商城', '<p>美齐商城，是一个拥有大型美容机构专家进驻，以提供给女性更专业、更健康的护肤建议，为女性带来美丽、时尚、健康安全可信赖的一个购物平台。</p>', '4', 'http://image.yiqifa.com/ad_images/reguser/24/17/49/1383136918563.jpg', 'http://p.yiqifa.com/n?k=2mLErnDL6nWOrI6HCZg7Rnu_fmRdY5PAR5yV35qxf96_YpoH2mqpgy6PKPUHWNR71n4H6EzS1nDFrnXH2mq_rI6H6lbwWNP9M9BH2L--&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的21%', '2013-10-31 00:00:00', '2014-10-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('372', '3621', '丸美', '丸美，中国市场高端护肤品的\'红奇迹\'， 源于\'以圆为美\'——\'丸是圆，圆是美\'，以圆为美，丸美追求从起点到终点之\'圆\'的完美。丸美素以\'眼部护理专家\'著称于世，以创新的弹力蛋白眼精华，引人瞩目，\'弹弹弹，弹走鱼尾纹\'，成为抗衰老护肤品的王牌;中国遍布9000多家精品店，5000多家专柜，更有购物方便快捷的网购直营店—丸美天猫旗舰店（http://marubi.tmall.com），以100%正品保证，100%优质服务，服务于全球爱美女性。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/40/8/1372318205752.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6NDsrI6HCZg7Rnu_fOsbRcP8Cpe7Y5BxYIeEYO7_rI6HKOx7D52erntmWE2Frn3FWEz71ZLLrI6HYmLErJtl3NbwW9WlrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-06-07 00:00:00', '2014-06-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('373', '3626', '莎莎网', '“一站式购齐”为经营理念的莎莎网是亚洲地区具领导地位的化妆品零售集团，在亚洲设有超过260间零售店及专柜，销售超过600个品牌产品，包括护肤、香水、化妆品、纤体、护发及身体护理产品、美容营养食品、以及专有品牌及独立代理的名牌产品。每星期有商品“特惠折扣”推出。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/50/50/1371102187612.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6lzerI6HCZg7Rnu_fmUmUSel3Q6bf96_YQLErB445QB8PZLq6l27WZLO1n2F6nbHWZLErJoH2mLF69271J4bWmLE&e=API090507&spm=138655627865015183.1.1.1', '2.8%-10.5%', '2013-06-14 00:00:00', '2014-06-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('374', '3629', '彼丽', 'Beely彼丽，植物护肤来自台湾。Beely彼丽倡导植物护肤理念，精选全球无污染纯净生长的植物原材料，完美融合台湾先进的美容理念与专业的研发生产技术，采用超临界冷凝萃取植物精华，完美保存植物纯净生命力。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/18/14/1373271909817.jpg', 'http://p.yiqifa.com/n?k=6B6s5tBVrI6HWlze6nBH2mquUZgL18H_39PyYZwdUJsbYJLd3OoVrI6H2mLq6l2FWZLO1n2F6nbHWZLErJoH2mLF69ts6lgEMcLE&e=API090507&spm=138655627865015183.1.1.1', '15.0%', '2013-07-09 00:00:00', '2014-07-08 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('375', '3648', '每日通贩', '上海每日通贩是B2C，B2B2C日系综合平台，打造日本特色，最专业的化妆品网。与中国最大零售企业百联集团的全额子公司一百联电子商务有限公司进行资本合作，确立了电子商务的经销渠道。销售包括日系知名品牌的化妆品、护肤品、彩妆、香水、个人护理、美体瘦身、健康保养以及手表饰品等近30,000多种类商品，是中国化妆品垂直B2C领域最受年轻白领好评及最具影响力的网站之一。 100%正品保障支持货到付款15天退换。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/19/51/1373944305327.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWn2erI6HCZg7Rnu_fmUmUSeVM5ySC54skpeEYOsH2mLErntmWEwsrn3FWEz71ZLLrI6HYmLErJMyMJ3FMEDmrBM_PtBCYcL-&e=API090507&spm=138655627865015183.1.1.1', '2.1~5.6%', '2013-07-17 00:00:00', '2014-07-16 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('376', '1426', 'Lumi胶原蛋白', 'Lumi康魄，是一家在全球拥有研发与原料采购中心的进口营养品品牌公司，拥有一批世界顶尖的健康营养专家团队，专门针对中国人的体质与健康状况设计产品配方。Lumi，始志不渝以社会中坚阶层??上班族作为健康研究、营养设计的人群基础，将其现实生活中的健康需求与原料、配方、工艺完美结合，用最先进的科研成果帮助他们提高健康的身体素质与健康的生活享受。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/45/13/1263459873937.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1n2SrI6HCZg7Rnu_fm6uYmjdYZPVC5qbMZwd3OoVrI6HkyMQNP6PrnDl1NUH6EzS1nDFrnXH2mq_rI6H6O2S6JKL3lgH2L--&e=API090507&spm=138655627865015183.1.1.1', '12.0%-18.0%', '2010-01-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('377', '1428', '小也商城', '小也SMALLYES创立于2003年12月20日，最初是中国第一批C2C电子商务网商。在风云变化的电子商务发展历史中，小也Smallyes始终坚持专注网上营销国际一线以及国内知名的化妆品牌（香水、护肤品、彩妆以及个人护理），每年以超过200%的速度在发展。小也商城是小也为中高端客户提供化妆品和香水等产品和服务的独立B2C销售平台。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/43/53/1324370933725.jpg', 'http://p.yiqifa.com/n?k=P7zmKcglrI6HWNzF6n6H2mquUZgL18H_UmUmfcbA35oeMpeEYOsH2mLErn3lWlUH6EzS1nDFrnXH2mq_rI6HMEtqM5DS696H2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10.5%', '2011-10-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('378', '1429', '长生鸟', '浙江长生鸟珍珠生物科技有限公司是全球领先的珍珠粉专家，由阮华君博士创办，在珍珠粉技术和生产方面处于世界领先水平。目前公司主营产品包括珍珠粉、保健品、食品，以及旗下菲可诗品牌的珍珠护肤品。长生鸟是中国十大珍珠粉品牌之一，网上珍珠粉销量第一的品牌。公司目前销售渠道横跨线上（官网、淘宝商城店等）、线下（OTC大型连锁药店、百货、专卖店等），是国内为数不多的成功进行B2C销售的实业公司', '4', 'http://image.yiqifa.com/ad_images/reguser/24/34/62/1343713754107.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6nDSrI6HCZg7Rnu_fmUmUSe9M5eAkJsbYJLd3OoVrI6H2mLO6EtSrn3FWEz71ZLLrtbuPPbmCcq_rI6HMnwsMNPy1J4H2L--&e=API090507&spm=138655627865015183.1.1.1', '17.5%', '2012-05-08 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('379', '1421', '柚子舍', '柚子舍，针对东方女性特有的肤质、环境气候等特点，以全球领先的天然无添加为研发核心理念，力求带给每个爱美女性最完美的护肤体验，尤其适合优美典雅的东方女性使用。为做中国女性最值得信赖、最高安全性与性价比的顶级护肤品品牌而不懈努力！', '4', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1348821729524.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WEj7rI6HCZg7Rnu_fmUmUSesk9ylMpeEYOsH2mLLKOBhUKAH6EzF6QLO1n2F6nbHWZLErJoH2mqEM56w3lyEWZLE&e=API090507&spm=138655627865015183.1.1.1', '10.5%-14.0%', '2012-09-30 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('380', '1422', '靓妆频道官网', '靓妆频道开播于2003年11月，是由江苏省广播电视总台开办的，面向全国首轮播出的全数字化电视媒体。频道坚持专业化路线，以时尚为旗帜，以个性为生命，24小时无间断播出化妆、时装类节目。靓妆频道目前已覆盖650余城市和地区、达到2.4亿观众。靓妆网购由靓妆频道倾力打造，集成150多个护肤品牌，1800余款护肤美妆精品。网站于2011年7月正式上线，秉承”专业、直营”的理念，一方面积极与相关化妆品牌厂家建立紧密合作，以节目资源置换价格优势，另一方面建立拥有良好信誉度的交易平台，为广大女性创造一个购物、专家解答、视频播送等多方面的优质网站。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/5/5/1362120536277.jpg', 'http://p.yiqifa.com/n?k=3Q4hgZgurI6HWE3mWn4H2mquUZgL18H_UmUmf9qvUORd3OoVrI6H2mLmWnKlrn3FWEz71ZLLrI6HYmLErnK76O2e354brIW-&e=API090507&spm=138655627865015183.1.1.1', '21.0%', '2013-03-02 00:00:00', '2014-03-01 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('381', '1430', '校妆网', '校妆网是国内首家专业开发中国高校美容市场的全国性大型化妆品股份制企业，致力于成为中国高校美容市场最优质品牌服务提供商，是一家集产品研发、生产、推广、销售、服务于一体的综合型企业。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/18/50/1324869206579.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWn2SrI6HCZg7Rnu_fmUmUSeFk9bs35ecf96_YQLErtVhkyb1CQLO6nWern3FWEz71ZLLrI6HYmLErn6EW5Km3ERSrIW-&e=API090507&spm=138655627865015183.1.1.1', '8.4%-10.5%', '2011-12-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('382', '1433', '美丽漂漂', '【美丽漂漂】的宗旨——为大众提供最权威的美容护肤知识，用最有效的成分解决不同的肌肤问题；【美丽漂漂】的准则——同类产品我们的价格最低，同价产品我们的品质最好；同质的产品我们的服务最优；【美丽漂漂】的愿望——无微不至悉心服务，成就您的美丽梦想，做消费者知心朋友；【美丽漂漂】的目标——建设中国最具影响力的美丽时尚电子商务平台。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/31/1/1331874090414.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWljSrI6HCZg7Rnu_fmUmUSeVC5qARZjd3OoVfmLErI6H6EKlWZLO1n2F6nbHWZLErJoH2mqE1N376l3l3cLqPsXcpnPH&e=API090507&spm=138655627865015183.1.1.1', '10.5%-21.0%', '2012-03-17 00:00:00', '2013-06-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('383', '1435', '草木年华（天猫）', '草木年华始终相信自然之美，源于自然拥有5亿年生存历史的植物必定蕴藏着无限智慧。每一株植物背后都有着一段惊世传奇，每一段传奇背后都隐藏着一个美肌奥秘。多年来，草木年华一直致力于植物智慧的不断探索，于旱地沙漠发现海藻糖的水润奇迹，于热带雨林发现布里奇果的赋活传奇，于千年典藉发现粉嫩桃花的美白奥秘，借助植物的神奇智慧开启自然美肌的发现之旅品牌渊源。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/42/10/1363846931907.jpg', 'http://p.yiqifa.com/n?k=1BRl6y4urI6HWERL1n4H2mquUZgL18H_CJPS39PxYJKdUJsbYJLd3OoVfmLErI6H6ljm6QLO1n2F6nbHWZLErJoH2mLeMEKSWEDO3cLE&e=API090507&spm=138655627865015183.1.1.1', '9.0%', '2013-03-26 00:00:00', '2014-03-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('384', '1436', '雪玲妃（天猫）', '雪玲妃，秉承古典的自然护肤传世精华，柔和现代的高端科技美容理念，旨在为新生一代创造天然，自然，合适的护肤新概念。为肌肤注入充足的水源，改善长期熬夜，疲劳以及电脑辐射所产生的暗沉，痘痘，黄色肌肤，加上来自山脉的雪莲花提取液，库加索芦荟提取液，甘草，水解蚕丝蛋白等多种自然草本植物，让年轻的脸庞持续保持水嫩光滑盈亮剔透。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/50/50/1364381577560.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWlzSrI6HCZg7Rnu_fmbsM5qAY9U9M5wdUJsbYJLd3OoVfmLErZMlUJsPMmLmWnzlrn3FWEz71ZLLrI6HYmLErnU81J2LMJB8rIW-&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2013-04-09 00:00:00', '2014-04-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('385', '1437', '娇妍商城', '娇妍商城为娇妍（广州）日用品有限公司官方商城，娇妍是中国第一个女性护理产品的开创者，同时也是目前中国女性护理第一大品牌，娇妍女性护理液拥有30%的市场份额。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/19/51/1365473236090.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1nterI6HCZg7Rnu_fmUmUSehYOqxk5sVf96_YpoAY9gykIeLCZj_YmXyY9BLCpoeCQBAM9BrUZ4b3Ox_M5e7MQ2_Rm4EfOPV3Q2_3ObbY9eyYIoERZW_3OywfmxLrpomCpoaWQ7_UQ4xfOB2KEXEgJoONn6wWOge6QB8WcblMPRqUtqVNcM8KlyL39spYJPn6QUbptBO3PRsCsA3MmPbpB473wto!QLErI6H6ltL1QLO1n2F6nbHWZLErJoH2mLqWntLWEWm1ZqNK5g2CB4H&e=API090507&spm=138655627865015183.1.1.1', '15.0%', '2013-04-10 00:00:00', '2014-04-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('386', '1439', '比度克', '比度克是源自瑞士，全球知名的天然护肤品牌。旗下所有系列的所有产品都是专门针对15-28岁之间的年轻人肌肤打造，主要解决痘痘，粉刺，黑头，粗大毛孔、油光，以及痘印等肌肤问题。针对于不同阶段，各种困扰年轻肌肤的普遍问题提供解决方案，重整肌肤代谢秩序，还原肌肤亮丽健康的状态。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1365594012568.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm6lK7rI6HCZg7Rnu_fmUmUSe8M5g_YOxd3OeH2mLErnRqWN6H6EzS1nDFrnXH2mq_rI6H6N3LWNRm3O6HCPMQDsyPrj--&e=API090507&spm=138655627865015183.1.1.1', '17.5%', '2013-04-11 00:00:00', '2014-04-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('387', '1449', '黛汐魅（天猫）', 'Daisymee是采用韩国黄金产地纯天然的植物，水果原料，遵循合理定价原则，致力于为消费者提供最专业，最安全，最有效的护肤方案的品牌。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/19/13/1369290131930.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWNwlrI6HCZg7Rnu_fOgbCQ6eY5PyfcgV35qxf96_YpoH2mLErntmWNz7rn3FWEz71ZLLrB6ERyUykZq_rI6H3OP8MJ48WNPH2L--&e=API090507&spm=138655627865015183.1.1.1', '10.0%', '2013-05-28 00:00:00', '2014-05-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('388', '1450', '珀莱雅（天猫）', '珀莱雅公司自2003年创立以来，凭借鲜明的品牌形象，精准的市场定位以及创新的营销策略，保持了稳定快速的增长态势。目前，珀莱雅已成为国内集研发、生产、销售为一体的大型化妆品公司之一。2012年签约大S、佟丽娅双星代言，珀莱雅CEO也荣获2012年浙商风云人物。珀莱雅在化妆品产业迅速崛起和高速成长，正带动整个产业，影响着中国。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1370240958360.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6nt7rI6HCZg7Rnu_fmXSYmybfcgV35qxf96_YQLErI6HWNRSWNgH6EzS1nDFrnXHg9q2gZMurJoH2mLO6NBE3NXbWmLE&e=API090507&spm=138655627865015183.1.1.1', '4%-7.5%', '2013-06-17 00:00:00', '2014-06-16 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('389', '1451', '瓷肌医生', '瓷肌医生中国药妆品牌。“美之护，丽之理”，是瓷肌鲜药妆中药特色理念，瓷肌CHINASKIN品牌诞生于2009年，是在一个致力于改变问题肌肤，是真正懂得按皮肤现状提出系统解决方案的专业性品牌。配方安全温和，加上高科技的功效成分，获得“免整形配方”的美誉。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/55/55/1369113241233.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6NjLrI6HCZg7Rnu_fmUmUSeECJyd3Q6iC5Fd3OeH2mLErntmWNRFrn3FWEz71ZLLrI6HYmLErJ3m6EPbMntsrtVVDOyEpcL-&e=API090507&spm=138655627865015183.1.1.1', '28%%', '2013-06-20 00:00:00', '2014-06-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('390', '1401', '识尚会', '识尚会折扣网隶属于上海戴希市场营销策划有限公司由国内知名电子商务企业高管和品牌资深人士创建，联合国际品牌一级渠道商，共同推出的专营世界顶级品牌的时尚购物网上商城，实现了在中国大陆地区上百个知名品牌，三万种美妆商品销售服务。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/60/60/1338514225684.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWn27rI6HCZg7Rnu_fmUmUSe93Q6uC5odYZWd3OoVrI6H1ZyMDPDLrn3OWE6H6EzS1nDFrnXH2mq_rI6H1n2mW52OM5PH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.6%-14.0%', '2012-05-15 00:00:00', '2013-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('391', '1402', '乐蜂网', '『乐蜂网』全球化妆品正货网购旗舰商城，3000万时尚女性大爱《美丽俏佳人》官网，已连续两年化妆品网络销售第一。美容达人、时尚明星和世界大品牌携数十万款美妆入驻。世界领先面部护理，彩妆香水，身体护理和头发保养等TOP品牌，全场0运费3折起。100%真品货到付款15天退换，欢迎广大站长与乐蜂网一同继续领跑中国化妆品网购！', '4', 'http://image.yiqifa.com/ad_images/reguser/24/37/5/1347450120721.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6cLErJb7UZjvfSomUmRdYJP9M5ecf96_YpoH2mLErn2S6mLO1n2F6nbHWZqdYJb2kZ6HYmLErJD7MNj71ng8rIW-&e=API090507&spm=138655627865015183.1.1.1', '2.0%-15.0%', '2008-10-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('392', '1403', '天天网', '天天购物网于1999年成立运营，是著名的电子商务和目录销售企业，是目前中国最大的时尚、女性、白领生活用品网上购物商城。现开通香水、化妆品、护肤品商城、钟表商城、珠宝饰品商城、礼品箱包商城、服装鞋帽商城等，时尚精品产品种类将近200000种，居行业领先地位，是中国电子商务领域最受白领欢迎和最具影响力的电子商务网站之一。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/46/14/1358228452855.jpg', 'http://p.yiqifa.com/n?k=2mLErnK7WE6H2mquUZgL18H_UmUmfcgA35e7C5Bdf96_YpoH2mLErnD7WE4H6EzS1nDFrnXH1KgqYKPprJoH2mq8MnD7Wl2FMcLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-15.0%', '2010-01-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('393', '1405', '皙肤泉', '皙肤泉官方网站为您提供皙肤泉净痘无痕系列产品皙肤泉祛痘产品是关于祛痘去痘除印去豆无痕的祛痘品牌产品.为防止痘痘再生皙肤泉官网还拥有祛痘美白祛除青春.', '4', 'http://image.yiqifa.com/ad_images/reguser/24/21/53/1275379527489.jpg', 'http://p.yiqifa.com/n?k=WwzskJecrI6H6EzLWcLErJb7UZjvfSomUmRdkJy9UQBs35Fd3OoVfmLErI6H6nRqWcLO1n2F6nbHWZLErJoH2mq96EWs6ltL6QLE&e=API090507&spm=138655627865015183.1.1.1', '15.0%', '2010-05-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('394', '1408', '牛尔官网', 'NARUKO由美容教主牛尔结合国际性一流团队及全球研发实验室，倾全力打造以天然诉求为导向，集合『纯净天然』、『实证科学』、『艺术人文』的全新品牌，为亚洲美容界开创出全新的护肤潮流。NARUKO所有产品完全不添加Parabens系（苯钾酸酯类）的防腐剂、人工香料、色素成分，不仅温和，更能避免造成环境二次污染；同时，不经过动物实验测试(Crueltyfree)，真正以实际行动证明为「不伤害动物」的草本植物保养产品。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/60/60/1316143764514.jpg', 'http://p.yiqifa.com/n?k=2mLErntsWn3SrI6HCZg7Rnu_fmUmUSed3Q4sCOHd3OoVf96drI6H2mLs6lwFrn3FWEz71ZLLrI6HYmLErJKsWN376E49rtBMkcg6UcL-&e=API090507&spm=138655627865015183.1.1.1', '30.0%', '2011-06-25 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('395', '1409', '牛尔官网', 'NARUKO由美容教主牛尔结合国际性一流团队及全球研发实验室，倾全力打造以天然诉求为导向，集合『纯净天然』、『实证科学』、『艺术人文』的全新品牌，为亚洲美容界开创出全新的护肤潮流。NARUKO所有产品完全不添加Parabens系（苯钾酸酯类）的防腐剂、人工香料、色素成分，不仅温和，更能避免造成环境二次污染；同时，不经过动物实验测试(Crueltyfree)，真正以实际行动证明为「不伤害动物」的草本植物保养产品。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/60/60/1316143764514.jpg', 'http://p.yiqifa.com/n?k=55sxKsXKrI6H1nD7WmLErJb7UZjvfSomUmRdY9BSU5V_f96_YpeEY8oH2mLErnKLWN4H6EzS1nDFrnXH2mq_rI6H6OtS6ntlMN4H2L--&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2010-09-22 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('396', '1410', 'nala', 'NALA（杭州徐娜拉电子商务有限公司）是一家专注于化妆品电子商务的互联网公司。隶属于海外控股和香港NALA控股完全控股的国内高科技子公司辛巴信息科技（中国）有限公司。NALA是由海外归国人员刘勇明于2009年5月创办，NALA现拥有员工四百余人。NALA目前业务主要通过互联网经营化妆品和化妆品工具，通过公司自己建立的B2C平台（www.nala.com.cn)销售化妆品和化妆品工具。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/3/3/1320834822677.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWlzSrI6HCZg7Rnu_fmUmUSed35qbf96_YpeEYcLErI6H6EtFWmLO1n2F6nbHWZLErJoH2mqw15DF1NRs6ZqLgsWqpNyH&e=API090507&spm=138655627865015183.1.1.1', '20.0%', '2011-09-16 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('397', '1411', 'NALA', 'NALA（杭州徐娜拉电子商务有限公司）是一家专注于化妆品电子商务的互联网公司。隶属于海外控股和香港NALA控股完全控股的国内高科技子公司辛巴信息科技（中国）有限公司。NALA是由海外归国人员刘勇明于2009年5月创办，NALA现拥有员工四百余人。NALA目前业务主要通过互联网经营化妆品和化妆品工具，通过公司自己建立的B2C平台（www.nala.com.cn)销售化妆品和化妆品工具。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/23/9/1310002841722.jpg', 'http://p.yiqifa.com/n?k=2mLErnts6njSrI6HCZg7Rnu_fmUmUSed35qbf96_YpeEY8oH2mqc1KLmYlbH6NRS6ZLO1n2F6nbHWZLErJoH2mLe3l3mWEB9MQLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%-11%', '2011-06-04 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('398', '1414', 'pba官方商城', 'pba官方商城是pba旗下售卖自有品牌产品的独立B2C商城.', '4', 'http://image.yiqifa.com/ad_images/reguser/24/7/7/1347433862941.jpg', 'http://p.yiqifa.com/n?k=2mLErntmWn3SrI6HCZg7Rnu_fmUmUSeL39td3OF_rI6H2mLOWNtmrn3FWEz71ZLLrtuSCKP!Ncq_rI6H3EKSMNtsM5MH2L--&e=API090507&spm=138655627865015183.1.1.1', '14.7%-40.0%', '2011-09-02 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('399', '1415', '香舍臻品', '香舍臻品是中国首家高端正品进口化妆品限时特卖商城，提供当下热卖高端精品化妆品，包含护肤、彩妆、美体、香水及各种精美礼品套装。致力于创造简单、高端、有趣、值得信赖的化妆品购物体验。香香迷人，舍我其谁，臻于至善，品味人生！香舍臻品，对美丽的承诺！', '4', 'http://image.yiqifa.com/ad_images/reguser/24/9/9/1328863974477.jpg', 'http://p.yiqifa.com/n?k=p5evpswLrI6HWNw7WE4H2mq7UZjvfSomUmRdkJybY9UlCJKd3OoVrI6H2mLO6nRSrn3FWEz71ZLLrI6HYmLErnbb6OMy3EM8rIW-&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2012-02-08 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('400', '1416', 'NO5时尚广场', 'No5时尚广场（http://www.no5.com.cn）中国领先的护肤、香水、健康、电视购物产品及资讯提供商。现经营品牌200多个，5000多种商品在线销售。NO5一直以诚信经营为理念，以用户至上为宗旨，向消费者提供高品质的产品，方便、灵活的订购方式及支付系统，并已在全国开通1875个城市、直辖市的快递货到付款服务。成立7年来，凭借优惠的价格及高效、优质的售后服务，销售额连年递增，赢得了广大消费者的信任与支持，在电子商务领域树立了品牌，并已处于领先地位。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1261377370401.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6ZLErJb7UZjvfSomUmRdY9Hsf96_YpeEY8oH2mLErnWq6QLO1n2F6nbHWZLErJoH2mLOWlWS1nPwWcqhRKVN5Z6H&e=API090507&spm=138655627865015183.1.1.1', '0.0%-13.0%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('401', '1417', 'DHC中国', '1972年，DHC由现任总裁吉田嘉明独自创业。经过30多年努力，现已成为跨化妆品、医药保健食品、医药品、翻译出版、高级美容院、水疗等多个领域的综合性企业，并取得了引人注目的辉煌业绩。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/30/2/1261378086363.jpg', 'http://p.yiqifa.com/n?k=2mLErntm6cLErJb7UZjvfSomUmRdMJbEf9eyUIeEY8o7Ymj_C5ewMQzdCc6LrI6HgnP9k5e7rn2FWQLO1n2F6nbHWZLErJoH2mq8M53m6ntSWZLE&e=API090507&spm=138655627865015183.1.1.1', '5%，1.6元', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('402', '1418', '樱桃网', '樱桃网自建供销渠道、仓储和物流，自主销售化妆品。由于坚持以客户体验至上，坚持高性价比的经营之道，樱桃网在化妆品与护肤品领域的销售额度长期占据北京市场网络化妆品销售榜首。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/52/12/1329897150216.jpg', 'http://p.yiqifa.com/n?k=2mLErntO1NDSrI6HCZg7Rnu_fmUmUSeeC5ecUJB_f9syrI6H2mLOWNtSrn3FWEz71ZLLrtqBp5MNCQq_rI6H3NDq3N3F15PH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2011-09-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('403', '1419', '汇美丽', '汇美丽商城是湖南御泥坊生物科技有限公司旗下的女性护肤品商城。旗下的御泥坊玫瑰睡眠面膜和泥浆面膜曾创造过美容化妆类目日销售12W件的销售奇迹，至今还无人打破。目前御泥坊已成为淘宝最具价值品牌之一。产品专注于从大自然中物理提取护肤精华，能有效的解决困扰女性痘痘，皮肤干燥，肤质暗沉，去黑头，毛孔粗大等问题，深得消费者的喜爱。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/30/2/1322016463774.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6E2SrI6HCZg7Rnu_fmUmUSeuY5PAYJwd3OoVrI6H2mLOWlzLrn3FWEz71ZLLrI6HYmLErJ2O6n2mM93lrtB_37qiRmL-&e=API090507&spm=138655627865015183.1.1.1', '8.4%-17.5%', '2011-11-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('404', '1420', '丝芙兰', 'SEPHORA，”全球化妆品零售权威”，1969年创立于法国里摩日，1997年加入全球第一奢侈品牌公司LVMH。在中国目前拥有超过100家门店。拥有100多种化妆品品牌、1万多款产品。SEPHORA在中国引进了20多个独家发售品牌，包括宠爱之名、彼得罗夫、欧缇丽、Lab等等，您仅能在SEPHORA门店和网上商店找到这些国外流行的知名品牌。SEPHORA将一直致力于为中国引入更多风靡欧洲的美妆产品并不断更新自由品牌产品。SEPHORA官方购物商城也是全国唯一网上化妆品品牌授权零售商，为您带来更便捷的美丽购物体验。', '4', 'http://image.yiqifa.com/ad_images/reguser/24/44/12/1331202926650.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6l2SrI6HCZg7Rnu_fmUmUSelMQXuYm4bf96d!m4lYmPS!5PV3Q29R9syUJzo3mXl4c4E35sL!54S35ewWEjqWcLErBBSN5H7PmLO6NtFrn3FWEz71ZLLrI6HYmLErnWO354E3O2lrIW-&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2012-03-07 00:00:00', '2013-03-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('405', '3680', '酷粉网', '酷粉网主营数码产品以及周边配件，产品类别有电脑，平板，娱乐影音，摄像摄影，手机，运动户外等各种产品。品牌丰富其经营品牌有苹果，三星，外星人，技嘉等，徕卡摄像机，颂拓手表等！酷粉网目前与coodoo品牌、3C4U品牌、AER品牌深度合作，支持在线购买，门店自提货品，全部正品保障！', '3', 'http://image.yiqifa.com/ad_images/reguser/24/53/11/1375847917058.jpg', 'http://p.yiqifa.com/n?k=CKsqMKU1rI6HWlw7WEMH2mquUZgL18H_UmUmf96_YOMbYcWd3OoVrI6H2mLq6lWO1ZLO1n2F6nbHWZLErJoH2mqwWEDFMNDOMZLE&e=API090507&spm=138655627865015183.1.1.1', '1.4元-70元', '2013-08-08 00:00:00', '2014-08-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('406', '3692', '金立手机', '', '3', 'http://image.yiqifa.com/ad_images/reguser/24/5/59/1375951812364.jpg', 'http://p.yiqifa.com/n?k=CE4dYNU4rI6HWlws6NUH2mquUZgL18H_UmUmf9UAYOeyMpeEYOsH2mLErntmWlRqrn3FWEz71ZLLrI6HYmLErnRLMntmW9tSrIW-&e=API090507&spm=138655627865015183.1.1.1', '3%-7%', '2013-08-09 00:00:00', '2014-08-08 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('407', '3693', 'SUGAR舒高手机', 'SUGAR手机商城（网址：www.sugar.cn)是SUGAR手机官方销售平台。我们提供正品SUGAR首饰手机手机、及相关配饰、配件等全新商品、品质保证。Sugar，全球首款首饰手机品牌，于2013年在SWAROVSKI全球总部奥地利瓦腾斯璀璨诞生。Sugar不仅具备行业顶尖的硬件设计和应用功能，更是首个以“天空之镜”理念创作的精巧巨作。129颗总计5.16克拉的施华洛世奇人工宝石镶嵌其中，出色的设计与精湛的工艺，让手机不再只是手机，更是让人足以闪耀璀璨光芒的首饰。Sugar不仅带来更卓越的手机体验，更成为不同的人在不同场合的完美配饰，一如随身的无限能量引擎，让悦之能量源源不绝，让每个人在任何的舞台都演出最完美的自己，随时悦由心生！', '3', 'http://image.yiqifa.com/ad_images/reguser/24/21/11/1378352411499.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6lKOrI6HCZg7Rnu_fmUmUSelU5UbR8eEYcLErI6HWNRl6l4H6EzS1nDFrnXHPNjs5tD7rJoH2mLq65D7WEbb6ZLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-08-14 00:00:00', '2014-08-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('408', '3707', '绿森', '牌是一个企业的无价的资本，文化是一个企业的精神思想脊梁，绿森自创建以来以自己独特的魅力一直在壮大发展，经过八年的持续发展，绿森商城公司从同行业中脱颖而出，随着富士牵手绿森商城全面拓展网上销售、牵手绿森商城 卡西欧青睐网上购物领域、招商银行牵手绿森商城 推出全国信用卡分期付款!、绿森商城荣获《天极网07年用户满意度第一》、绿森商城: 2008年支付宝首席信任商家……现已成为当代中国网络电子商务企业的典范', '3', 'http://image.yiqifa.com/ad_images/reguser/24/37/5/1276738192641.jpg', 'http://p.yiqifa.com/n?k=2mLErnRq6E4H2mquUZgL18H_UmUmf9qsROPdf96_YpoH2mLErnDm6ngH6EzS1nDFrnXH2mq_rI6HW96w3lMw3lPHNwPxRPKqrj--&e=API090507&spm=138655627865015183.1.1.1', '', '2010-06-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('409', '3617', '电信手机', '乐享乐购网站是广东电信授权的网上分销合作平台。网站以中国电信手机、套餐为主要销售品，并紧跟广东电信的促销节奏，定期为用户带来海量的促销惊喜。乐享乐购的配送体系由广东电信手机商城的配送体系支持，可为客户提供安全，快捷的物流配送体验。乐享乐购更提供货到付款的支付方式，确保客户的购物满意安心。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/27/59/1372147115698.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6l2qrI6HCZg7Rnu_fmUmUSeOCJBLRZy8UQwd3OoVrI6HYQbfRcw7rntmWED7rn3FWEz71ZLLrI6HYmLErny9Wl6915DLrIW-&e=API090507&spm=138655627865015183.1.1.1', '1.4%和最高35元', '2013-06-19 00:00:00', '2014-06-18 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('410', '3622', 'DELLcps', '戴尔公司于1984年由迈克尔？戴尔创立。他是目前计算机行业内任期最长的首席执行官。他的理念非常简单：按照客户要求制造计算机，并向客户直接发货，使戴尔公司能够最有效和明确地了解客户需求，继而迅速做出回应。这个直接的商业模式消除了中间商，这样就减少了不必要的成本和时间，让戴尔公司更好地理解客户的需要。这种直接模式允许戴尔公司能以富有竞争性的价位，为每一位消费者定制并提供具有丰富配置的强大系统。通过平均四天一次的库存更新， 戴尔公司能够把最新相关技术带给消费者，而且远远快于那些运转缓慢、采取分销模式的公司。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/35/61/1371613252554.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF6EwerI6HCZg7Rnu_fOgyYJLdUJsbYJLd3OoVfmLErZBSgtHOYmLq6l276mLO1n2F6nbHWZLErJoH2mL73l68W5Ks1QLE&e=API090507&spm=138655627865015183.1.1.1', '1.6%', '2013-06-20 00:00:00', '2014-06-19 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('411', '3643', 'skg', 'SKG公司（艾诗凯奇电气有限公司）2007年成立于“中国家电之都”——广东顺德，是国内成长最快的电商品牌之一。在中国， SKG与淘宝网、天猫商城、京东商城、唯品会、一号店、国美商城、苏宁易购等知名电子商务平台强强联手，2012年中国区网购销售突破2.5亿；11月11日单天销售突破1500万；唯品会单日突破650万，2011-2012小家电品牌销量冠军，年销售额实现每年300%以上的增长。SKG，中国品牌，全球销售，以电商模式带领中国小家电走向世界。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/19/13/1372851263517.jpg', 'http://p.yiqifa.com/n?k=2mLErnWF1nRsrI6HCZg7Rnu_fmUmUSelCORd3O6H2mLErntmWER7rn3FWEz71ZLLrI6HYmLErnDs3lKO693erJV_5cM93mL-&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-07-04 00:00:00', '2014-07-03 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('412', '3644', 'HTC', 'HTC官方商城是HTC中国官方自营商城，主要销售只有品牌手机及相关配件。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/40/56/1374054328452.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWnwsrI6HCZg7Rnu_fmUmUSeuUJ6yROb_RIeEYOsH2mLErntmWEwmrn3FWEz71ZLLrB4Z3mbAMZq_rI6H6J68WEKq1J6H2L--&e=API090507&spm=138655627865015183.1.1.1', '1.75%', '2013-07-18 00:00:00', '2014-07-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('413', '3646', '联想云视频', '联想是一家营业额近300亿美元的个人科技产品公司，客户遍布全球160多个国家。联想是全球第二大个人电脑厂商，名列《财富》世界500强，为全球前四大电脑厂商中增大最快。自1997年起，联想一直蝉联中国国内市场销售第一，占中国个人电脑市场超过三成份额。凭借创新的产品、高效的供应链和强大的战略执行，联想锐意为全球用户打造卓越的个人电脑和移动互联网产品。集团由联想及前IBM个人电脑事业部所组成，在全球开发、制造和销售可靠、优质、安全易用的技术产品及优质专业的服务', '3', 'http://image.yiqifa.com/ad_images/reguser/24/46/14/1372658501361.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWNWFrI6HCZg7Rnu_fm6yRcMA3OPlCJoLf9qyY9oOYSeEYO7d3OeH2mLErntmWE3mrn3FWEz71ZLLrJMmMmKOPcq_rI6H3949M53qWlMH2L--&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-07-02 00:00:00', '2014-07-01 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('414', '1301', '易迅', '易迅网是依托著名的IT产品通路商上海易迅电子商务发展有限公司而创立的新一代专业电子商务消费服务网站。易迅网利用强大的全球化集约采购优势、丰富的电子商务管理服务经验和最先进的互联网技术为您提供最新最好的电脑配件类、游戏外设类、多媒体设备类、数码设备类、时尚用品类等等多种时尚精品。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/53/11/1315978406469.jpg', 'http://p.yiqifa.com/n?k=2mLErnDe1ngH2mquUZgL18H_UmUmfcyAkZPdf96_YQLErI6H6nWlWZLO1n2F6nbHWZqZ6NB1p7AHYmLErJ3SMNU93lRsrIW-&e=API090507&spm=138655627865015183.1.1.1', '1-60元', '2009-12-07 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('415', '1304', '移宝网', '2009年移宝网商城正式上线，拥有完整的ICP备案、工商营业执照。除了传统的手机销售业务之外，移宝网还获得了中国联通的正式授权，成为中国联通华东地区最大的合作伙伴，提供3G号码办理、3G上网卡、3G手机协约办理等业务，为用户提供更多更好的选择。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/9/55/1348019234998.jpg', 'http://p.yiqifa.com/n?k=2mLErn27WNjSrI6HCZg7Rnu_fmUmUSeVYO4AWNzef96_YpoH2mLErn3F6EXH6EzS1nDFrnXH2mq_rI6H6njF3Nze6EyHC5WSRJtmrj--&e=API090507&spm=138655627865015183.1.1.1', '1.4%-3.5%', '2012-09-02 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('416', '1306', '海尔商城', '公司1984年创立于青岛。创业以来，海尔坚持以用户需求为中心的创新体系驱动企业持续健康发展，从一家资不抵债、濒临倒闭的集体小厂发展成为全球最大的家用电器制造商之一。2011年，海尔集团全球营业额1509亿元，在全球17个国家拥有8万多名员工，海尔的用户遍布世界100多个国家和地区。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/56/8/1361158461451.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWEDSrI6HCZg7Rnu_fmUmUSeyCJBAMQ2d3OoVrI6H2mLmWnjSrn3FWEz71ZLLrJeCCJUINQq_rI6HWE3SWn6bWEPH2L--&e=API090507&spm=138655627865015183.1.1.1', '2.1%', '2013-01-10 00:00:00', '2014-01-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('417', '1307', '大可乐', '大可乐手机是一款5.0寸巨屏互联网手机，双卡双待，双核双ROM，双高清摄像头，售价999元，是当前最潮最超值的手机。大可乐手机用户可免费尊享搜狐视频1个月、乐视网3个月的VIP资格，以及掌阅iReader一年的付费内容。大可乐手机联合战略合作伙伴，通过官网、苏宁易购以及中国联通合约机多种销售渠道，短短两个月时间累计销量突破27万台，并荣获苏宁易购销售冠军，目前官网已全面开放购买。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/62/62/1357711902950.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWnzlrI6HCZg7Rnu_fmUmUSew35VyYJKd3OoVrI6H2mLmWnj7rn3FWEz71ZLLrngLD7BtNZq_rI6H1Jtq69MbWEPH2L--&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2013-01-10 00:00:00', '2014-01-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('418', '1309', '高鸿商城', '鸿商城tao3c.com隶属于大唐集团旗下上市公司大唐高鸿股份（股票代码：000851），拥有国有中央企业的背景和上市公司的公信力。目前定位于自主营销式的B2C电子商务平台，立足成为国内最专业、最优质的3C产品网络零售服务提供商，专注于3C产品，构建轻松购物、放心购物的营销平台，全场商品均为正品行货、提供国家正规机打发票，为顾客打造放心、省心、舒心的购物环境。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/5/59/1295244980218.jpg', 'http://p.yiqifa.com/n?k=2mLErntqWn3SrI6HCZg7Rnu_fmUmUSe735Hl3SeEYO7_rI6H2mLsWljOrn3FWEz71ZLLrI6HYmLErnWO693l1nBErJy8NQyWWcL-&e=API090507&spm=138655627865015183.1.1.1', '0-70元', '2011-01-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('419', '1310', '国美电器', '国美电器集团坚持薄利多销，服务当先的经营理念，依靠准确的市场定位和不断创新的经营策略，引领家电消费潮流，为消费者提供个性化、多样化的服务，国美品牌得到中国广大消费者的青睐。本着商者无域、相融共生的企业发展理念，国美电器与全球知名家电制造企业保持紧密、友好、互助的战略合作伙伴关系，成为众多知名家电厂家在中国的最大的经销商。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1354517532046.jpg', 'http://p.yiqifa.com/n?k=p5V5PsAyrI6HWNDeWE4H2mquUZgL18H_UmUmf9U_Y5Kd3OoVf96dfmLErI6H6NKm1QLO1n2F6nbHWZLErJoH2mqw6Nws3NPbMZLE&e=API090507&spm=138655627865015183.1.1.1', '1.0%', '2011-04-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('420', '1312', '一点达', '一点达商城（www.yidianda.com），国内专业的信用卡购物商城，以多种银行信用卡在线支付及分期支付为特色，在线销售包括手机、电脑、数码、百货、美妆、家电等数万种商品，提供信用卡购物、消费、咨询、互动等全方位服务，是首屈一指的综合性信用卡购物平台。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1261378017048.jpg', 'http://p.yiqifa.com/n?k=2mLErnW71ZLErJb7UZjvfSomUmRdk5ywC5BdMJtd3OoVfmLErI6HWEzmrn3FWEz71ZLLrtMuWOB8Mcq_rI6HMEWl1ngw6n4H2L--&e=API090507&spm=138655627865015183.1.1.1', '0-55元', '2008-11-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('421', '1313', '新蛋商城', '中国新蛋网是依托著名的美国新蛋网而创立的新一代专业电子商务消费服务网站，利用强大的全球化集约采购优势、丰富的电子商务管理服务经验和最先进的互联网技术为您提供最新最好的电脑配件、数码产品和时尚用品。', '3', 'http://image.yiqifa.com/ad_images/reguser/56/46/46/1278494527966.JPG', 'http://p.yiqifa.com/n?k=M7UCkZDOrI6H6EKOWcLErJb7UZjvfSomUmRdY9PmM5Ucf96_YpeEY8oH2mLErnDO6ngH6EzS1nDFrnXH2mq_rI6HWNtO692e6O6H2L--&e=API090507&spm=138655627865015183.1.1.1', '0.8%', '2011-05-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('422', '1314', '新蛋商城', '中国新蛋网是依托著名的美国新蛋网而创立的新一代专业电子商务消费服务网站，利用强大的全球化集约采购优势、丰富的电子商务管理服务经验和最先进的互联网技术为您提供最新最好的电脑配件、数码产品和时尚用品。', '3', 'http://image.yiqifa.com/ad_images/reguser/56/46/46/1278494527966.JPG', 'http://p.yiqifa.com/n?k=1QM!CnUIrI6HWEDLrI6HCZg7Rnu_fmUmUSedMQUyMORd3OoVf96drI6H2mLS1nXH6EzS1nDFrnXH2mq_rI6H3NRO3NzLMJBH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.8-70元', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('423', '1315', '卓美网', '北京卓美博发电子商务科技有限公司是目前国内最专业的摄影器材在线销售公司，旗下拥有卓美网（卓美摄影器材商城）和卓美摄影论坛。卓美摄影商城具有一流的技术服务经验，秉着“真诚、体贴、高效、优质、全面”的服务意识，由专业技术人员提供售前、售中、售后技术支持。为客户提供高质量、高效率的服务，与客户保持良久的合作关系，深获广大使用者赞赏与信赖。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/24/8/1302164004973.jpg', 'http://p.yiqifa.com/n?k=2mLErntlWnzSrI6HCZg7Rnu_fmUmUSevYNRd3OF_rI6HPwscgOsernKsWl4H6EzS1nDFrnXH2mq_rI6H6lgw6lME1JMH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.7-62元', '2011-04-08 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('424', '1303', '麦芽商城', '麦芽商城是国内最大的专业蓝牙设备网购商城，麦芽商城主要在线销售蓝牙耳机、手机配件、车载蓝牙、蓝牙设备、移动电源、苹果配件等数百个品牌几千种优质商品，所有商品保证原厂正品，全国联保。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/15/15/1348649126058.jpg', 'http://p.yiqifa.com/n?k=UJVI356DrI6HWEDL6n4H2mquUZgL18H_UmUmf9se3NtSWSeEYOsH2mLErn3F6nMH6EzS1nDFrnXH2mq_rI6HMERlWlBEWOBH2L--&e=API090507&spm=138655627865015183.1.1.1', '2.8%', '2012-09-12 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('425', '1317', '华强北商城', '华强北商城（okhqb.com）是华强北在线旗下3C类B2C网上商城，拥有独特的网购师服务，为您挑选商品提供最贴心的建议与指导。商城主营：手机、数码、相机、笔记本、电脑、上网本、各类配件苹果系列产品等坐拥深圳华强北商业圈，一手价格绝对优势承诺全场正品低价及时发货便捷诚信，配送到家！', '3', 'http://image.yiqifa.com/ad_images/reguser/24/62/2/1351763608093.jpg', 'http://p.yiqifa.com/n?k=2mLErn276E3lrI6HCZg7Rnu_fmUmUSe_CObq38eEYO7_rI6HNQX26OUErn371NgH6EzS1nDFrnXH2mq_rI6HMEBbWnRSMEyH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-45.5%', '2012-02-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('426', '1318', '罗技', '罗技官方旗舰店，是罗技在中国独立的官方网络销售商城，是新一代专业电子商务消费服务网站，利用强大产品设计生产能力、丰富的电子商务管理服务经验和最先进的互联网技术为您提供最优质的电脑外设产品。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/49/15/1335595376651.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6EDSrI6HCZg7Rnu_fm67Ym4yf9q_MOy7M56uf96_YpeEYcLErI6H6E3LWZLO1n2F6nbHWZLErJoH2mLs6NKL393s1ZqF1KRs6tgH&e=API090507&spm=138655627865015183.1.1.1', '2.0%', '2012-04-29 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('427', '1320', '苏宁易购', '苏宁易购，是苏宁电器旗下新一代B2C网上购物平台（www.suning.com），现已覆盖传统家电、3C电器、日用百货等品类。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1361522690973.jpg', 'http://p.yiqifa.com/n?k=2mLErnKO6E4H2mquUZgL18H_UmUmfc6sY9ydMSeEYO7_rI6H2mL76nKern3FWEz71ZLLrJw7DQM9MZq_rI6H1nb865P8M5MH2L--&e=API090507&spm=138655627865015183.1.1.1', '普通订单：0-35元 图书订单：4.5%', '2010-02-09 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('428', '1321', '长虹手机', '长虹手机官方商城是由长虹手机全国网络营销运营中心独家运作，致力于为广大消费者提供长虹手机大全、报价、超长待机手机推荐、主题下载等', '3', 'http://image.yiqifa.com/ad_images/reguser/24/26/6/1338891749205.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6EzlrI6HCZg7Rnu_fmUmUSebCJodMOsbYJLd3OoVfmLErI6H6E3O6QLO1n2F6nbHWZLErJoH2mLL6NtO3N3S1QLSU9PMNQAH&e=API090507&spm=138655627865015183.1.1.1', '5.6%-7.0%', '2012-06-06 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('429', '1323', '米米乐商城', '米米乐商城在线销售联想、宏?、华硕、戴尔、惠普、thinkpad、东芝等品牌笔记本电脑，诺基亚、三星、摩托罗拉、联想等品牌手机，佳能、索尼、尼康、富士等品牌数码相机，及电脑配件、电脑周边等产品。提供笔记本电脑、手机、数码相机、电脑配件等产品在线推荐产品和导购等服务。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1338780127981.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWNDSrI6HCZg7Rnu_fmUmUSeVY5q_YSeEYO7_rI6H2mLO6EKern3FWEz71ZLLrJygMmyvgQq_rI6H6nME1nKm6N6H2L--&e=API090507&spm=138655627865015183.1.1.1', '活动期间：5%--196元', '2012-06-05 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('430', '1324', '联想商城', '联想是一家营业额近300亿美元的个人科技产品公司，客户遍布全球160多个国家。联想是全球第二大个人电脑厂商，名列《财富》世界500强，为全球前四大电脑厂商中增大最快。自1997年起，联想一直蝉联中国国内市场销售第一，占中国个人电脑市场超过三成份额。凭借创新的产品、高效的供应链和强大的战略执行，联想锐意为全球用户打造卓越的个人电脑和移动互联网产品。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/53/53/1345100207860.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6NjSrI6HCZg7Rnu_fm6uYmjdYJPdYmM_f96_YpeEY8oH2mLErn3m1NXH6EzS1nDFrnXHWQy!6KAdrJoH2mLOWnjOWly93QLE&e=API090507&spm=138655627865015183.1.1.1', '2.1%-3.2%', '2012-08-17 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('431', '1325', '惠普商城', '2011年4月8日，中国惠普正式推出惠普中国在线商店，旨在中为国消费者提供优质的一站式在线购物体验。从个人消费电脑到正品配件耗材，惠普在线商店覆盖惠普全系列产品，提供全线产品的全面选择，为您的网络购物提供更多选择和更多便利。给力优惠好礼，有爱购物体验，这里是惠普中国在线商店。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/5/5/1350354804934.jpg', 'http://p.yiqifa.com/n?k=N9umYsPvrI6HWED7Wn4H2mquUZgL18H_ROb_RZXAY9Rqf9bLf96_YpoARSs8C5F_pKeKgP4NptoDf9PdM9ydCQgefsUJKSoQPSsnNyXs39qA3s67Ym4yfP6AUJK_k9brD7F_fponNyw_P9yyUs6735ew3Q4wDOB735q_MSsIR9omROK0DOB735q_M76bUJPcYm4epKDo35A6KN465wHeCJ6XDKBB6PPDDQ4EMBX7rI6H2mLO1Njqrn3FWEz71ZLLrI6HYmLErnBb15g9656brIW-&e=API090507&spm=138655627865015183.1.1.1', '2.8%', '2012-10-17 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('432', '1326', '华为商城', '华为商城是华为软件技术有限公司旗下的自营网络直销平台。是一家面向全国服务的电子商务平台。我们提供正品华为手机、移动终端、家庭终端、配件等全新商品、品质保证。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/40/56/1334126044291.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6E2SrI6HCZg7Rnu_fmUmUSeOY5BxYIeEYOsH2mqt65qm6cgH6EKO1QLO1n2F6nbHWZLErJoH2mL765tlWEWqWZLE&e=API090507&spm=138655627865015183.1.1.1', '1.4%', '2012-04-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('433', '1327', '库巴', '库巴商城，原世纪电器网（www.51mdq.com）。2010年9月1日更至此名。销售的商品由之前的单一的家用电器，扩展到包含手机在内的消费类数码领域。此次更名，是在中国B2C电子商城从专业化向百货化发展的大背景下进行的。截止更名前，世纪电器网年销售额逾3亿元。连续3年300%的增长率，使得世纪电器网成长为中国家电网购领域中第一平台。 更名之后的库巴商城，将秉承世纪电器网“诚信经营为本、顾客价值为先”经营理念，为消费者提供更多的优质商品。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/60/60/1363075764350.jpg', 'http://p.yiqifa.com/n?k=2mLErn276E4H2mquUZgL18H_UmUmf96_Ylzd3OoVfmLErI6HWlDOWQLO1n2F6nbHWZLErJoH2mqw6nPb3ljeWcqD5tUO3wqH&e=API090507&spm=138655627865015183.1.1.1', '0.7-63元', '2009-05-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('434', '1328', '库巴购物网', '库巴购物网（www.coo8.com）是国美旗下专业的B2B2C综合购物网站，依托国美集团强大的资源和后台支持专注于平台业务发展，拓展和繁荣综合线上市场，最大限度地满足客户需求，全面推进国美电子商务战略的实现。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/7/57/1320910929953.jpg', 'http://p.yiqifa.com/n?k=2mLErn276E4H2mquUZgL18H_UmUmf96_Ylzd3OoVrI6HUsyNUQMernW76EBH6EzS1nDFrnXH2mq_rI6HMnDs35WL1N4H2L--&e=API090507&spm=138655627865015183.1.1.1', '0.7-63元', '2009-05-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('435', '1330', '音平商城', '音平商城是中国电声行业内独树一帜的“电子商务与音乐传播整合领导者”，以纯电子商务模式运营，目前已成为国内最大的正品音频、乐器设备网购商城！公司拥有电子商务、录音及乐器等各类专业技术人才和配套设施，自主开发B2C电子商务交易平台，以“网购您的音乐生活”为口号，秉承“支持个人数字音乐的发展”理念，致力于用户体验，为消费者提供丰富的商品、便捷的购物方式和完善的售后服务。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/8/56/1362558529659.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O1NDSrI6HCZg7Rnu_fmUmUSeAY9ULC5ecf96_YpoH2mLErnRL6NMH6EzS1nDFrnXH3QPnWc4erJoH2mLF3OKL3EzmMZLE&e=API090507&spm=138655627865015183.1.1.1', '1.4%-2.8%', '2013-03-07 00:00:00', '2014-03-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('436', '1332', '帅康（天猫）', '帅康（天猫店）主营主营油烟机、燃气灶、消毒柜、热水器、微蒸烤、小家电；帅康旗舰店为客户省去中间成本，厂价直接回馈给消费者。帅康以93.91亿元品牌价值连续五年蝉联“中国500最具价值品牌”厨卫行业第一品牌桂冠；全国3800万用户的选择，3000个服务网点为您提供免费上门安装，五年质保的可靠服务。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/55/9/1366887764139.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1nzOrI6HCZg7Rnu_fm6b3OodfcgV35qxf96_YQLErnXgPm6cpZLq6lt7WcLO1n2F6nbHWZLErJoH2mLL1JBb6nM8McLE&e=API090507&spm=138655627865015183.1.1.1', '2.0%', '2013-05-14 00:00:00', '2014-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('437', '1334', '酷派商城', '酷派商城（coolpad）是隶属宇龙计算机通信科技（深圳）有限公司，其创立于1993年4月，系中国无线科技有限公司（香港主板上市公司，股票代码2369）的全资附属子公司，是中国专业的智能手机终端、移动数据平台系统、增值业务运营一体化解决方案提供商；酷派商城是宇龙公司旗下网络直销平台，是公司新的业务起点。是一家面向全世界销售酷派品牌商品的电子商务平台。商城主要销售手机、配件、移动终端等全新商品，立志打造一个高品质的手机商城。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/25/7/1368673283651.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWNj7rI6HCZg7Rnu_fm6uYmjd3Oo_YZXbMIeEY8oAY9gykIeuUJsxrI6H2mLq6ltO1QLO1n2F6nbHWZLErJoH2mLL1JtS39tsWZql6Ou7DmAH&e=API090507&spm=138655627865015183.1.1.1', '2%-4%', '2013-05-16 00:00:00', '2013-05-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('438', '1335', '天翼手机网', '天翼手机网是中国电信官方网上手机商城，为用户提供品类丰富、便捷迅速、全面专业的CDMA手机、CDMA手机配件销售和天翼手机号卡套餐、资讯服务，正品行货假一赔十。不断致力于产品的创新和提升，天翼工坊频道的“个性化手机定制业务”在国内运营商中创新之路。', '3', 'http://image.yiqifa.com/ad_images/reguser/24/33/1/1369032252956.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWNRLrI6HCZg7Rnu_fmUmUSeuC56wY5td3OoVfmLErJV!RNBp6ZLq6ltm6cLO1n2F6nbHWZLErJoH2mL7M93L6Ng96ZLE&e=API090507&spm=138655627865015183.1.1.1', '0.35%-0.7%，特例商品：70元', '2013-05-22 00:00:00', '2013-05-21 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('439', '3712', 'youppie官网', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Youppie！来自时尚最前沿的设计理念：梦想、追求、品位和与众不同。Youppie！代表着一个充满干劲，追求理想，以及对生活积极乐观向上的时尚品牌，Youppie！为顾客塑造的，并不仅仅是服饰，更是一种生活方式，生活态度，一种对自我价值的认可。Youppie！对时尚的独到见解将给大家耳目一新的感受，成为引领年轻人潮流的风向标。</p>', '2', 'http://image.yiqifa.com/ad_images/reguser/24/2/2/1379038151705.jpg', 'http://p.yiqifa.com/n?k=CPbW6Kb!rI6HWlwe6N4H2mquUZgL18H_UmUmfcy_UQXLC5Kd3OoVrI6H2mLq6lDS1ZLO1n2F6nbHWZLErJoH2mLS6N3q65B96QLE&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的21%', '2013-09-14 00:00:00', '2014-09-13 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('440', '3718', '传承服饰cps(天猫店)', '<p>传承服饰荣获中国时装设计最高奖&mdash;&mdash;金顶奖，中国百佳设计师王永刚先生于2001年创立，传承是一种时代精神，亦是一种时尚态度。是东方与西方的交融，是传统与现代的互通。是延续，亦是创新。是不同一，亦是相同。是顺从，亦是颠覆。是个体，亦是群体。传承主张内在思想与外在设计的完美结合，倡导精神与环境的和谐相处</p>', '2', 'http://image.yiqifa.com/ad_images/reguser/24/28/4/1383617208599.jpg', 'http://p.yiqifa.com/n?k=D5zFk53mrI6H6njsWngH2mquUZgL18H_3Obs35eECJPdMSe7Y5BxYIeEYO7_rI6H2mLq6lDeWcLO1n2F6nbHWZLErJoH2mLL39tq3N6w6mLE&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的5%', '2013-11-06 00:00:00', '2014-11-05 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('441', '3723', '七格格CPS(天猫店)', '<p>七格格多品牌集合潮店，曾获淘宝&ldquo;我最喜爱的女装店铺&rdquo;第一名，旗下有othermix，iaizo，meyeeka等多个潮牌。风格独特、定位鲜明，能够满足不同消费群体个性需求。全店转化率1.5%以上，已拥有超过85万活跃拥护者！在服装风格特立独行以外，设计实力雄厚，美感调性十足，点击率远高于同行业水平；营销团队强大，各类营销、促销活动丰富！七格格在传递潮流以外，始终坚持努力提供中国互联网最领先的售后服务，为消费者打造完美的购物体验！</p>', '2', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1383059050615.jpg', 'http://p.yiqifa.com/n?k=2mLErnDL6nt7rI6HCZg7Rnu_fOo7CJPSY5yFfcgV35qxf96_YQLErI6HWNR76lbH6EzS1nDFrnXH2mq_rI6H6O2s3lzFWN6HgOgA596_rj--&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的8%', '2013-10-30 00:00:00', '2014-10-29 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('442', '3708', '茵曼', '<p><span style=\'font-size: 10.5pt; font-family: 宋体; mso-ascii-font-family: \'Times New Roman\'; mso-hansi-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA\'><span lang=\'EN-US\' style=\'font-size: 10.5pt; font-family: 微软雅黑; background-image: none; background-repeat: repeat; background-attachment: scroll; background-position: 0% 0%; color: #666666; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体\'><font color=\'#000000\'><font size=\'1\' face=\'\' style=\'font-size: 10pt; font-family: 微软雅黑\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;茵曼（INMAN），广州市汇美服装有限公司旗下棉麻生活品牌，由董事长方建华于2008年创立，凭借以&ldquo;棉麻艺术家&rdquo;为定位的原创设计享誉互联网，是中国成长最快、最具代表性的网络服饰零售品牌。茵曼主张&ldquo;素雅而简洁，个性而不张扬&rdquo;的服装设计风格，推崇原生态主题下亲近自然、回归自然的健康舒适生活，追求天人合一的衣着境界，致力于成为【属于世界的中国棉麻生活品牌】。2011年双十一&ldquo;茵曼&rdquo;更是改写历史，成为第一家冲破千万女装品牌，总业绩超越传统品牌，位居榜首。</font></font></span></span></p>', '2', 'http://image.yiqifa.com/ad_images/reguser/24/17/15/1377587893513.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6lRmrI6HCZg7Rnu_fmUmUSeAY9sbY8eEYO7d3OF_rI6H2mLq6lWe6ZLO1n2F6nbHWZqmR5PsNwoHYmLErntS3lKF3l2FrIW-&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的10.5%', '2013-08-28 00:00:00', '2014-08-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('443', '3618', '爱肯牛仔', '爱肯AIKEN是性感牛仔的标杆品牌，专注于打造时尚性感的牛仔服饰，多年来始终秉持着品牌本身“不裸露也性感”的独特时尚理念，打破了传统牛仔的平庸、粗制于与单一的不足。爱肯将时尚性感元素融入牛仔，做工精致的同时亦注重品位，性感却不失典雅风格，这使爱肯牛仔在众多牛仔高端品牌中脱颖而出，并深受追求性感的时尚男女消费者的广泛追崇。', '2', 'http://image.yiqifa.com/ad_images/reguser/56/37/27/1371620917910.JPG', 'http://p.yiqifa.com/n?k=2mLErnWF6EKsrI6HCZg7Rnu_fOBACOPdfcgV35qxf96_YQLErI6HWNRS6nbH6EzS1nDFrnXH2mq_rI6HWN27354E1J4HPPyvW9Bnrj--&e=API090507&spm=138655627865015183.1.1.1', '4%-6.5%', '2013-06-20 00:00:00', '2014-06-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('444', '3642', '白马商城', '白马服装网城创立于2012年，是国内领先的潮流服装购物网站。主要在线零售白马品质男装、时尚女装以及各大品牌服装，白马服装网坚持为用户提供服装品牌直销的网购服务，并承诺所有产品100%正品保障，假一赔二，收到货后不满意7天内无理由退换货，全国快递送货上门。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1374665059028.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWE2OrI6HCZg7Rnu_fmUmUSe835yV3peEYOsH2mLErntmWljFrn3FWEz71ZLLrI6HYmLErnB93E4bMNB8rJ6gNcbBMQL-&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2013-07-25 00:00:00', '2014-07-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('445', '3647', '趣天网', '麦考林http://www.m18.com', '2', 'http://image.yiqifa.com/ad_images/reguser/56/60/28/1373532176163.JPG', 'http://p.yiqifa.com/n?k=2mLErnWeWNDLrI6HCZg7Rnu_fmUmUSeqYOHqWIeEYcLErtgbMNbd6ZLq6l2eWcLO1n2F6nbHWZLErJoH2mq9MNX9MJB9WcLE&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-07-12 00:00:00', '2014-07-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('446', '3655', '当当服装', '当当网（www.dangdang.com）是全球最大的综合性中文网上购物商城，由国内著名出版机构科文公司、美国老虎基金、美国IDG集团、卢森堡剑桥集团、亚洲创业投资基金（原名软银中国创业基金）共同投资成立。 1999年11月，当当网(www.dangdang.com) 正式开通。成立以来，当当网一直保持高速度成长，每年成长率均超过100%。当当网在线销售的商品包括了家居百货、化妆品、数码、图书、音像等几十个大类，近百万种商品，在库图书超过40万种。目前当当网有超过4000万的注册用户（含大陆、港、澳、台和国外），遍及全国32个省、市、自治区和直辖市，2007年图书销售码洋超过六亿元。每天有上万人在当当网买东西，每月有2000万人在当当网浏览各类信息。 当当网的使命是坚持“更多选择、更多低价”让越来越多的顾客享购网上购物带来的方便和实惠。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/50/50/1375951444566.jpg', 'http://p.yiqifa.com/n?k=PtWs6m4ZrI6HWlwlWlMH2mquUZgL18H_M9BlCJy_Y8ew35ecMJBdMSeEYOsH2mLErntmWljmrn3FWEz71ZLLrI6HYmLErnKl3OKS3948rIW-&e=API090507&spm=138655627865015183.1.1.1', '7.125%-43.5%', '2013-07-25 00:00:00', '2014-07-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('447', '1202', '歌薇网', '歌薇服饰是国内最大的女装折扣连锁企业，歌薇网是一家经营服装020（onlinetooffline)云交易平台的电子商务公司。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/23/55/1353398394120.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWl2SrI6HCZg7Rnu_fmUmUSecMQUyCpeEYOsH2mLErn3e6n6H6EzS1nDFrnXH2mq_rI6H3EteW93L69BHY9KFgNPSrj--&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-11-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('448', '1203', '凡客诚品', '', '2', 'http://image.yiqifa.com/ad_images/reguser/24/63/63/1283492094876.jpg', 'http://p.yiqifa.com/n?k=PteX6yRlrI6HWNKLrI6HCZg7Rnu_fmUmUSeO35eEYIeEYO7_rI6H2mLS6NPH6EzS1nDFrnXH2mq_rI6HWOWS65B83lMH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.5%-20%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('449', '1205', 'NOP', 'NOP品牌的时尚主体是基于大都市生活方式的时尚风格，将历史上出现过的多元化时尚风格和元素融汇其中，尊重服装和时尚本身的历史来源，同时又从材料出发，探索新科技的应用，创造出一种兼具东西方文化的都市青年新复古风格', '2', 'http://image.yiqifa.com/ad_images/reguser/24/26/58/1312270788412.jpg', 'http://p.yiqifa.com/n?k=2mLErntOWEjSrI6HCZg7Rnu_fmUmUSedYmjd3OeH2mqiUN4PKwMH6NwF6QLO1n2F6nbHWZLErJoH2mL7W52SW9Wm1QLE&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2011-08-03 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('450', '1207', '铁血君品行', '铁血君品是一家为广大铁血网友提供个一个选购方便，信誉又有保障的军品店', '2', 'http://image.yiqifa.com/ad_images/reguser/24/12/12/1351579952692.jpg', 'http://p.yiqifa.com/n?k=2mLErn27Wl3SrI6HCZg7Rnu_fmUmUSehU5eLCIeEYO7_rI6H2mLO1nK7rn3FWEz71ZLLrZtqY5U9pcq_rI6HWlW7W93O3N6H2L--&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10.5%', '2012-09-21 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('451', '1208', '牛仔商城', '目前入驻牛仔服饰品牌100多家，涵盖牛仔男装、牛仔女装、牛仔童装、牛仔配饰等品类。同时依托当地牛仔产业集群的优势，为消费者提供独到的售后服务。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/55/55/1347873700735.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1nzSrI6HCZg7Rnu_fmUmUSedk9sbYJLd3OeH2mLErn3F6NPH6EzS1nDFrnXHpKq3DmDmrJoH2mqy69481njeMcLE&e=API090507&spm=138655627865015183.1.1.1', '0.85%-14.0%', '2012-09-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('452', '1210', '红豆', '红豆商城整合了红豆集团旗下所有服装品牌、品类，品牌包括：红豆男装、红豆居家、红豆家纺、IDF、左、轩帝尼等，品类包括商务男装、时尚女装、童装、居家内衣、家纺等品类，为消费者提供高品质、一站式的消费体验。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/41/55/1341985264901.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S1nzSrI6HCZg7Rnu_fmUmUSeuYOg_f96drI6H2mLO6lt7rn3FWEz71ZLLrI6HYmLErJ2L652eWlwertPv37y1YQL-&e=API090507&spm=138655627865015183.1.1.1', '0.85%-10.5%', '2012-07-12 00:00:00', '2013-07-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('453', '1212', '帽儿胡同', '帽儿胡同是北京图伦顶业服饰有限公司旗下专注品牌帽子销售为主的专业垂直B2C电子商务网站。帽儿胡同立足北京，从老北京的地域特色和胡同文化中汲取灵感。现实中的帽儿胡同百年前曾是贵族居住区，众多达官显贵在此演绎了流芳千古的动人故事。历尽百年沧桑，今天的帽儿胡同风采依然。我们的帽儿胡同将立足帽饰专业网上商城，努力成为服饰类文化创意的电子商务集市，成为个性、创意、时尚的代名词。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/50/50/1351680276997.jpg', 'http://p.yiqifa.com/n?k=2mLErn276N27rI6HCZg7Rnu_fmUmUSeV35oyREWOWIeEYOsH2mLErn3eWngH6EzS1nDFrnXH2mq_rI6HM9D73lzqWJPH6QWlD7qNrj--&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-10-18 00:00:00', '2013-10-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('454', '1213', 'Kappa', 'iKappa是Kappa官方独立商城，定位于Kappa品牌忠实客户和喜爱运动时尚的中高端人群。产品主要通过搭配陈列，由设计师及搭配师对产品所包含的时尚理念及产品风格进行深层挖掘，以”搭配”的形式呈现产品的独特风格，突出展现Kappa产品亮丽的颜色冲击和鲜明个性的设计，体现Kappa的混搭时尚理念，带给消费者全新的购物体验与时尚信息。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/3/61/1346660337521.jpg', 'http://p.yiqifa.com/n?k=knbMKNUZrI6HWEWF6E4H2mquUZgL18H_UmUmf9yi3QXL3peEYO7d3OeH2mLErn3FWE6H6EzS1nDFrnXH2mq_rI6H3EDl6J2sMEXH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.85%-14.0%', '2012-09-01 00:00:00', '2014-08-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('455', '1214', '太平鸟服饰', '太平鸟魔法风尚服饰是太平鸟集团旗下的以网络购物为主要业务的新兴B2C电子商务公司，其商品主要为太平鸟时尚女装和自主开发的太平鸟网上专售产品，主要的消费群体为18至35岁年轻时尚女性。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/58/6/1257831648894.jpg', 'http://p.yiqifa.com/n?k=POM_3KemrI6H6n37WcLErJb7UZjvfSomUmRdRJ2F1peEYOsH2mLErnDS6lbH6EzS1nDFrnXH2mq_rI6HWEy96Ng8M54H2L--&e=API090507&spm=138655627865015183.1.1.1', '', '2009-11-11 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('456', '1217', 'TS官网', 'TS官网是兰亭旗下主要针对中高端品位女性的时尚购物B2C网站平台。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/14/14/1291191886976.jpg', 'http://p.yiqifa.com/n?k=CPBW3PDSrI6HWNjqWE4H2mquUZgL18H_UmUmf9odYZy7RSeEYOsH2mLErnKSWNMH6EzS1nDFrnXH2mq_rI6H3Ejl1ntS1NbH2L--&e=API090507&spm=138655627865015183.1.1.1', '14.0%', '2010-12-02 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('457', '1218', '玛萨玛索', '\'MasaMaso(玛萨玛索)\'是九合尚品公司与西班牙设计师合作设计的男装品牌，由欧洲设计师领衔企划。以消费者为核心，以优秀的产品和服务品质为核心竞争力，并以将国际经典时尚的服装元素带给中国用户为己任，致力于成为中国及全球领先的服装品牌与消费品制造商。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/23/9/1261377143965.jpg', 'http://p.yiqifa.com/n?k=C5MpYt4QrI6HWN3FWcLErJb7UZjvfSomUmRdY5Bl35sbROHd3OoVfmLErI6H1NjLrn3FWEz71ZLLrI6HYmLErnRs156yWlKOrIW-&e=API090507&spm=138655627865015183.1.1.1', '8%-16%', '2009-01-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('458', '1220', 'Tommy', 'TommyHilfiger作为全球顶尖的高端生活方式品牌之一，为全世界的消费者提供一流的款式、品质及价值。品牌体现了经典美式风格，并对学院派进行了全新的演绎。自1985年创建以来，TommyHilfiger集团已成为一家销售额达到46亿美元的服饰零售公司，为消费者带来各类设计精美，品质卓越的男女装、童装、运动装、牛仔以及一系列许可证产品，如配饰、香水和家居用品。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1339411075877.jpg', 'http://p.yiqifa.com/n?k=5QU86B4erI6HWE2qWE4H2mquUZgL18H_UmUmfcg_Y5sef96_YpeEYcLErI6H6E376mLO1n2F6nbHWZLErJoH2mLqWlDqM9M81ZLE&e=API090507&spm=138655627865015183.1.1.1', '4.2%-8.4%', '2012-05-29 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('459', '1221', 'GAP', 'GAP创建于1969年，是和Zara、H&amp;M并肩的美国最大的服装零售商，现有4200多家连锁店。已在全球近30个国家创立超过1400家专卖店！40年来，Gap通过重塑经典、引领潮流及创造传奇，成为了一个家喻户晓的国际性品牌。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/54/10/1341306770947.jpg', 'http://p.yiqifa.com/n?k=UN4nCwsArI6HWE276E4H2mquUZgL18H_UmUmf9UbRIeEYcLErI6H6E371ZLO1n2F6nbHWZLErJoH2mqE3Ote3N4bWcLE&e=API090507&spm=138655627865015183.1.1.1', '7.0%-14.0%', '2012-05-30 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('460', '1222', '韩都衣舍', '<p>韩都衣舍，秉承&ldquo;韩国时尚专家&rdquo;这一品牌理念，以独有的资源优势，将韩国时尚文化咨询和流行元素第一时间引进国内，为中国女性提供原汁原味的韩国白领生活方式和最时尚的流行女装。</p>', '2', 'http://image.yiqifa.com/ad_images/reguser/24/12/52/1330432650933.jpg', 'http://p.yiqifa.com/n?k=2mLErntO6lzSrI6HCZg7Rnu_fmUmUSeu35ewUpeEYO7_rI6H2mLOWnzlrn3FWEz71ZLLrI6HYmLErJg9Wngb3EgwrB6ADc2mWQL-&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的17.5%', '2011-08-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('461', '1223', '翡思裘品', '翡思裘品是主营皮草类服饰的电子商务生活购物网站。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/21/53/1346651926996.jpg', 'http://p.yiqifa.com/n?k=KmAVW7sZrI6HWNzF1nUH2mquUZgL18H_UmUmf9MyCQ6lC5MsR8eEYO7_rI6H2mLO6njern3FWEz71ZLLrI6HYmLErJtLM94wM9ByrIW-&e=API090507&spm=138655627865015183.1.1.1', '11.0%', '2011-12-14 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('462', '1224', '梦芭莎', '梦芭莎?全球领先的女性时尚网购品牌，涵盖内衣、女装、女鞋等多项品类，致力于为女性提供健康舒适、时尚潮流的高性价比商品，以不断创新的科技与服务，努力实践“让每一位女性更加美丽自信”的梦想。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/36/60/1316076453077.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6nzlrI6HCZg7Rnu_fmUmUSeVYOod39Bl3peEYO7_rI6H3w4BPB4Crn2e1ZLO1n2F6nbHWZLErJoH2mLs3l2m3548MQLE&e=API090507&spm=138655627865015183.1.1.1', '5%-30%', '2008-11-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('463', '1226', '柒牌商城', '柒牌商城（官方网站）是以服饰研究、设计和制造为主，集销售为一体的综合性的柒牌男装集团所创建，倡导\'立中华时尚，铸一流企业，创世界名牌\'的品牌战略，演绎柒牌“比肩世界男装”的品牌形象', '2', 'http://image.yiqifa.com/ad_images/reguser/24/49/15/1346987269336.jpg', 'http://p.yiqifa.com/n?k=kZP3DKsqrI6HWEDq6E4H2mquUZgL18H_UmUmfcBARJBAY5BxYIeEYOsH2mLErn3F6nXH6EzS1nDFrnXH2mq_rI6HWn4b69DO3NPH2L--&e=API090507&spm=138655627865015183.1.1.1', '7.0%-16.8%', '2012-09-15 00:00:00', '2013-09-14 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('464', '1227', '哥弟商城', '哥弟官方商城是哥弟女装指定购物商城专注时尚潮流个性品味，精品路线.致力于让中国时尚消费人群，专享时尚、品牌、品质、价格的生活品质与潮流购物体验，成为精品时尚购物网站。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/47/49/1350010926677.jpg', 'http://p.yiqifa.com/n?k=2mLErn276n2SrI6HCZg7Rnu_fmUmUSecCQ4wM5BSf96drI6H2mLO1nwsrn3FWEz71ZLLrI6HYmLErny969t735KFrto7kc6TpQL-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2012-10-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('465', '1228', '永恒颜色', '永恒颜色以欧洲浪漫主义元素为设计主题，以精美的手工艺术和复古典雅的花型设计、再现了欧洲十六世纪的法国宫廷的奢华和浪漫的生活方式。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/12/52/1361782061001.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6EDSrI6HCZg7Rnu_fmy_Y9UuM5eck5BdROKdUJsbYJLd3OoVrI6H2mLmWnDOrn3FWEz71ZLLrI6HYmLErnBy39By39KOrZBsYtg3YmL-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-02-26 00:00:00', '2014-02-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('466', '1229', '百盛', '百盛百货是金狮集团于1987年创立的，在近十年的时间里发展显著，连锁百货商店遍设马来西亚各主要城市，至今已开设了三十余间购物中心以及精品专卖连锁店，成为全马百货店最大、最成功的零售连锁集团。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1356486225185.jpg', 'http://p.yiqifa.com/n?k=2mLErn2OWNDlrI6HCZg7Rnu_fmUmUSeL3Q4iROodf96_YpeEYcLErI6H6EwF6QLO1n2F6nbHWZqpYtAhNZMHYmLErnjLWO2s6NwLrIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2012-12-31 00:00:00', '2013-12-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('467', '1230', 'Vjia', 'V+（vjia.com）,由凡客诚品创始人、董事长兼CEO陈年投资创办。精选全球时尚品牌，坚持陈年及其团队一贯提倡的高性价比，以及客户体验至上的运营理念，主要服务亍85后网上贩物的主力人群。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/59/5/1276238308513.jpg', 'http://p.yiqifa.com/n?k=2mLErnRL1n4H2mquUZgL18H_UmUmfcMhC5td3OoVfmLErI6H6nRsWmLO1n2F6nbHWZLmKOPPYN4HYmLErnK7WO4yME3OrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.7%-11%', '2010-06-12 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('468', '1231', '波司登', '波司登官方销售网站，主营波司登集团旗下六大核心品牌羽绒服装，包括波司登、雪中飞、康博、冰洁、双羽和上羽，提供多种羽绒服产品以迎合不同阶层的消费者，同时还包括波司登男装系列产品，打造“品味生活”的全新定位，给消费者带来全新体验！', '2', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1317008829408.jpg', 'http://p.yiqifa.com/n?k=2mLErntm1nzSrI6HCZg7Rnu_fm6uYmjd39olC5gyY9Rd3OoVrI6H2mLOWEWSrn3FWEz71ZLLrZgTWtgNDQq_rI6H6lDe3NMEM9BH2L--&e=API090507&spm=138655627865015183.1.1.1', '1.0%-14.0%', '2011-09-27 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('469', '1232', '米尚优品', '北京米尚优品科技有限公司为中国服装自主品牌先锋企业，MISUN品牌是公司的旗帜品牌，开创了中国时尚羽绒服的先河，产品以其“版型考究、物超所值”的核心竞争力，赢得了客群的普遍尊敬和青睐，现已发展成为四季化、系列化的零售品牌。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1320290548746.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWlzsrI6HCZg7Rnu_fmUmUSeVCQ6sY8eEYcLErBX867BcKcLOWlKSrn3FWEz71ZLLrI6HYmLErnME6ltqWNDqrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.0%-20.0%', '2011-11-04 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('470', '1233', 'Esprit官网', 'ESPRIT(艾斯普利特）是思捷环球控股有限公司旗下的一个时尚品牌，成立于1964年美国加利福尼亚州旧金山，现品牌标志设计于1979年', '2', 'http://image.yiqifa.com/ad_images/reguser/24/4/60/1346984174991.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6N27rI6HCZg7Rnu_fmUmUSeyRmXSCQDd3OeH2mLErn3m6EbH6EzS1nDFrnXHN9sNKKwSrJoH2mLL1NU96NWSMcLE&e=API090507&spm=138655627865015183.1.1.1', '13.0%', '2012-08-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('471', '1234', '高街', '高街网（www.gaojie.com）中国最时尚的名品特卖网站，拥有由国际时尚杂志、知名设计师和时尚达人组成的顶级线上风格顾问团队；遍布全球的专业买手，为用户发现性价比最高的潮流名品；同时提供给用户最实用的搭配指导和建议；和国内外的潮流品牌联合打造专属定制单品。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/9/9/1318570660057.jpg', 'http://p.yiqifa.com/n?k=2mLErntm6l2SrI6HCZg7Rnu_fmUmUSec35ohC5Kd3OoVfmLErI6H6E2FWQLO1n2F6nbHWZqiP5MxK94HYmLErJByW5DFWJ3lrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2011-10-10 00:00:00', '2013-10-08 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('472', '1235', '唐狮', '唐狮服饰官网是宁波博洋集团旗下品牌唐狮线上唯一直营官网品牌购物网站。唐狮休闲服饰是全国著名休闲服饰品牌，连续3年被评委中国500最具价值品牌，品牌价值达31.92亿元；2011年正式将品牌形象官网升级为购物网站，开拓品牌直营的线上营销渠道。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/35/61/1318131042906.jpg', 'http://p.yiqifa.com/n?k=2mLErntF6NDSrI6HCZg7Rnu_fmUmUSe7YOexC5odf96_YQLErtP3Rts51QLOWERFrn3FWEz71ZLLrI6HYmLErnwS3OtO6nwerIW-&e=API090507&spm=138655627865015183.1.1.1', '6%-10.5%', '2011-10-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('473', '1236', '邦购', '邦购是美特斯邦威旗下的时尚服饰购物网站', '2', 'http://image.yiqifa.com/ad_images/reguser/24/23/55/1310037922335.jpg', 'http://p.yiqifa.com/n?k=2mLErntO6N3SrI6HCZg7Rnu_fmUmUSe835ecMOHd3OoVrI6H2mLs1nKFrn3FWEz71ZLLrJUCR52mDmq_rI6HWJ2mWlwl1nUH2L--&e=API090507&spm=138655627865015183.1.1.1', '6%-15%', '2011-07-08 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('474', '1237', '约翰逊', 'Johansson约翰逊，是华瑞（南京）服装有限公司在电子商务新时代里倾心打造的高档时装品牌，其设计理念源自于北美经典商务休闲风格。Johansson由北美著名设计师领衔企划，致力于为中国消费者提供来自北美的私人形象设计服务；而年轻新锐的中国原创设计师的加入，则为Johansson带来了别具韵味、传统又不失时尚的东方元素。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/24/8/1338174918098.jpg', 'http://p.yiqifa.com/n?k=2mLErn2SWn3SrI6HCZg7Rnu_fmUmUSehWNwSWSeEYOsH2mLErnKSWl4H6EzS1nDFrnXH2mq_rI6HWlX9Mn3lWJ6H3OeSkcXJrj--&e=API090507&spm=138655627865015183.1.1.1', '21.0%', '2010-12-08 00:00:00', '2013-07-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('475', '1238', '海e家', '海e家，是海一家科技有限公司倾力打造的服装B2C品牌，凭在免烫衬衫领域独握的四大专利技术及率先采用”绿色、低碳、环保、健康”的液氨免烫和潮交联免烫新工艺，其衬衫在防缩抗皱、彰显形象、舒适度、性价比等方面，具有明显优势，被业界和消费者誉为”免烫衬衫专家”，致力于打造中国衬衫第一品牌。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1329202949249.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWl2SrI6HCZg7Rnu_fmUmUSeuk5ud3OoVrI6H2mLO6n3Frn3FWEz71ZLLrI6HYmLErn3O3OWsWng8rtoiRJBPgZL-&e=API090507&spm=138655627865015183.1.1.1', '10.5%', '2012-01-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('476', '1239', '有货网', '“YOHO!有货”——年轻人潮流购物中心，（www.yohobuy.com）目前是中国最大的潮流品牌商品销售平台。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/27/59/1312337047075.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6n4H2mquUZgL18H_UmUmfcy_CJo8UQwd3OoVrI6H2mLl6Ejqrn3FWEz71ZLLrtPQ3OggpZq_rI6H3EBEWn4E3EbH2L--&e=API090507&spm=138655627865015183.1.1.1', '4-10%', '2009-06-08 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('477', '1240', '普派正装', '普派,专注于年轻人正装,提供极具性价比的服饰和快乐网购体验.', '2', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1260954902136.jpg', 'http://p.yiqifa.com/n?k=2mLErnKL6E4H2mquUZgL18H_UmUmfcXsRJBAf96drI6HRtBC6NyurnDl6NyH6EzS1nDFrnXH2mq_rI6HMJM96JM91NPH2L--&e=API090507&spm=138655627865015183.1.1.1', '30.0%', '2010-11-26 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('478', '1243', '马克华菲', '马克华菲官网（http://www.mfplaza.com）隶属于上海马克华菲服饰有限公司，是马克华菲信息发布的另一条途径和商品销售的主要渠道。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/2/62/1312508561187.jpg', 'http://p.yiqifa.com/n?k=2mLErntOWlzSrI6HCZg7Rnu_fmUmUSeVMcXx3QAbf96_YQLErnXe6yUhRcLs1Nwmrn3FWEz71ZLLrI6HYmLErnRFW5273lbwrIW-&e=API090507&spm=138655627865015183.1.1.1', '20.0%', '2011-08-06 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('479', '1245', '斯波帝卡', 'SPORTICA(斯波帝卡)不苛求划分传统与时尚的界限，流行寓意在于蕴含来自美国文化的内涵和时尚潮流，设计个性在于满足不同男人个体性格的矛盾特征，SPORTICA(斯波帝卡)设计出发点是将时尚视为横坐标，个性为纵坐标，各个维度交互形成的各项指数体系，设计出给不同男人的众多款式的选择空间，在SPORTICA(斯波帝卡)的服装世界里均能找到属于自我个性的归属。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/13/51/1309954203591.jpg', 'http://p.yiqifa.com/n?k=2mLErnts6E3SrI6HCZg7Rnu_fmUmUSelRJoSUJyE3peEY8oH2mq3WP2LNnbH6Nz71ZLO1n2F6nbHWZLErJoH2mLSMnDF6nDlWcLE&e=API090507&spm=138655627865015183.1.1.1', '6.3%-17.5%', '2011-07-07 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('480', '1246', '欧莎', 'O.SA（欧莎）品牌来自香港欧莎集团，集团旗下拥有数个专业服装网站，主要客户群为白领女性，香港是世界知名的购物天堂，汇集了欧美，日韩不同风格的最新时尚款式。欧莎期望将最流行的国际时尚款式介绍给客户，做白领的时尚家。欧莎专业于时尚，以时尚家作为自己的目标。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/50/14/1337917815797.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6N3lrI6HCZg7Rnu_fmUmUSe_ROtd3OoVf96drI6H2mLO6E2ern3FWEz71ZLLrI6HYmLErJ4wWNXwWEgyrtACMNBsPQL-&e=API090507&spm=138655627865015183.1.1.1', '12.6%', '2012-05-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('481', '1249', '维杰斯官网', '维杰斯（WINJEANS）是JeansArelGroupInc.（亚太区）与厦门魏晋风度商贸有限公司合作经营的品牌。发掘中国元素，取魏晋风度（WEIJINSTYLE）品牌英文首字母，加之严谨、聪明、有绅士风度、有胆识、富有野心、爱冒险、喜欢表现自己的美国牛仔精神，打造了新的”维杰斯（WINJEANS）”品牌，把“ICan”的精神和中国魏晋时期”简约云澹，超然绝俗”理念精髓融入品牌文化中，演绎中西文化元素完美结合的个性服饰系列。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/45/13/1355888225257.jpg', 'http://p.yiqifa.com/n?k=35yKMEwsrI6HWEKO1n4H2mquUZgL18H_UmUmfcUAY9Ay35elf96_YQLErI6H6EwFWZLO1n2F6nbHWZLErJoH2mLOWnByM5gy3mLE&e=API090507&spm=138655627865015183.1.1.1', '8.4%', '2012-12-21 00:00:00', '2013-12-20 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('482', '1250', 'Justyle男装', 'justyle源于英国伦敦的创新品牌，以“让时尚更简单！”为使命，倡导“时尚和世界是和平的”。justyle来源于当今创新和时尚达人常用的两个代表词汇：just和style的结合，不仅为牛津大辞典创新了新的词汇，而且有恰恰代表了现在都市生活的态度。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/59/59/1306403882125.jpg', 'http://p.yiqifa.com/n?k=2mLErnK71n4H2mquUZgL18H_UmUmf9AsRmgeYJKd3OoVfmLErI6H6nDS1QLO1n2F6nbHWZLErJoH2mLeWEPw6O3s1Qq_CntsUPPH&e=API090507&spm=138655627865015183.1.1.1', '8.4%', '2012-09-01 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('483', '1253', '雅库服饰', '雅库男装（www.yksuit.com）是新一代电子商务B2C服装购物网站。为中国本土消费者精心设计，专业定制和销售中高档西服、职业制服和休闲系列配套服装，选用最新欧洲经典样版及进口名牌辅料，并将最新欧洲时尚元素融注于服装产品之中，倍显尊贵与时尚风范。 雅库男装，源自英国的经典服装品牌——迪安派登洋服，由英国迪安派登洋服（杭州）服装公司投资控股，经营200余种世界名牌毛料，专业生产高级洋服，专业定制团体西服、职业制服，从事专业的面料开发和样板设计。并已为1000多家中国著名企业提供服装的定制服务。产品远销香港与欧洲市场。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/60/4/1309934500633.jpg', 'http://p.yiqifa.com/n?k=2mLErntOWEzSrI6HCZg7Rnu_fmUmUSeeCm6sCQDd3OoVrI6Hgnb25QMsrnKFWlMH6EzS1nDFrnXH2mq_rI6HWOP86n2lWnMH2L--&e=API090507&spm=138655627865015183.1.1.1', '21.0%', '2013-03-21 00:00:00', '2014-03-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('484', '1256', '安都女装(天猫)', '安都女装为女性打造个性、潮流、百变的产品风格，崇尚自然、简洁、自由的风尚,设计理念中无不渗透出青春的动感活力，受到年轻一代人的热爱。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/44/52/1363850547398.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWn3SrI6HCZg7Rnu_fOBdMJolUJoSM5BwfcgV35qxf96_YpoH2mLlkZ3eMwMH6ljO6ZLO1n2F6nbHWZLErJoH2mL7WN6bMEzm3mLE&e=API090507&spm=138655627865015183.1.1.1', '7.5%', '2013-03-26 00:00:00', '2014-03-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('485', '1257', '季候风', '季候风定位在商务休闲女装。整体表达现代年轻女性坚强独立，自信潇洒，摩登时尚的样貌。运用欧化的裁剪方法和设计风格，采用高档质感面料及独特趣味的图案印花，撷取当季最流行的服装款式和设计元素，充分表现简约而富有品味的产品风格，在国际流行预言中始终坚持自成一格的时尚魅力。女性化与中性化元素和谐交织，帅气坚强中弥散出温柔感，在充满视觉新意的搭配中，呈现一派震撼人心的新势力，满足现代女性对个人风格的强烈追求。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/27/59/1364203963813.jpg', 'http://p.yiqifa.com/n?k=6ZDs5n6LrI6HWERqWn4H2mquUZgL18H_ROPbROodUOydMIe7Y5BxYIeEYOsH2mLErnRL6lXH6EzS1nDFrnXH2mq_rI6H6E3F3NKL3OgH2L--&e=API090507&spm=138655627865015183.1.1.1', '9.0%', '2013-03-27 00:00:00', '2013-03-14 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('486', '1258', '星范儿（淘宝）', 'SyncChic星范儿是一个世界领先的服装设计师平台，总部设在英国伦敦。成功的把欧美精英设计师作品也带来中国和大家分享。网站坚持的是，每个品牌一定要有迷人的设计，精湛的质量，独特的个性。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/14/50/1364524472680.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWlzlrI6HCZg7Rnu_fm6eY96ECJyEfcgbYO4bYSeEYOsH2mq5WcguDOyH6ljF6QLO1n2F6nbHWZLErJoH2mLmM5Bw65gE1QLE&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2013-04-16 00:00:00', '2014-03-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('487', '1260', '圣弗莱（天猫）', '随着徒步运动的兴起，一种介于专业外装和都市户外装的outdoor发展迅猛。与以往的outdoor的概念不同，人们越来越青眛那些既能够在日常生活的各种场合中穿着，舒适放松，又能够适应都市人在假期户外活动中穿着的功能、个性、结实耐用的品牌。圣弗莱（sevlae）秉承了法国浪漫时尚以及崇尚享受生活的文化特点，结合目前中国精英阶层的日常户外活动着装方式，推出了都市户外的品牌风格定位，为那些追求自然舒适的都市人提供一类具有贵族时尚气息的户外鞋服。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1366869856084.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm6E37rI6HCZg7Rnu_fm6yU9qbMpe7Y5BxYIeEYO7_rI6H2mLmWNjsrn3FWEz71ZLLrJteKtVhKmq_rI6H6lBwWl696NUH2L--&e=API090507&spm=138655627865015183.1.1.1', '6.0%', '2013-04-18 00:00:00', '2013-04-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('488', '1261', '斯波帝卡（天猫店）', 'Sportica For Holiday时尚度假生活方式，通过身心的旅行度假莱体验不同过度与地区的生活理念与时尚态度，传递给消费者一种“多元”文化的时尚概念，一种轻松、自由的生活乐趣与时尚的穿着态度。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/26/58/1366283809248.jpg', 'http://p.yiqifa.com/n?k=2mLErn2m6N2SrI6HCZg7Rnu_fm6LYm47C56bfcgV35qxf96_YpoH2mLErnRqWnMH6EzS1nDFrnXH2mq_rI6HW92OMnXwM94H6PAegs6Qrj--&e=API090507&spm=138655627865015183.1.1.1', '10.0%', '2013-04-09 00:00:00', '2014-04-08 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('489', '1262', '鄂尔多斯（淘宝）', '鄂尔多斯官方旗舰店是鄂尔多斯集团在淘宝天猫平台上开设的一家直营店铺,品质毋庸置疑,各位鄂尔多斯的新老客户,请放心购买!', '2', 'http://image.yiqifa.com/ad_images/reguser/24/57/7/1366773523374.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1NKLrI6HCZg7Rnu_fm6uYmjmWED76n3qWSe735o835Hd3OoVfmLErI6HWNRqWlgH6EzS1nDFrnXHRlRSk564rJoH2mLe6l2SWlKsMQLE&e=API090507&spm=138655627865015183.1.1.1', '2.5%-7.5%', '2013-05-03 00:00:00', '2014-05-03 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('490', '1263', '韩都衣舍CPS(天猫店)', '<p>韩都衣舍，秉承&ldquo;韩国时尚专家&rdquo;这一品牌理念，以独有的资源优势，将韩国时尚文化咨询和流行元素第一时间引进国内，为中国女性提供原汁原味的韩国白领生活方式和最时尚的流行女装。</p>', '2', 'http://image.yiqifa.com/ad_images/reguser/24/57/57/1368686887655.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1NjmrI6HCZg7Rnu_fObbY9gsk5ylCJKdUJsbYJLd3OoVrI6H2mLq6lt7WZLO1n2F6nbHWZLErJoH2mLs3O4b3lD7WQqdR9AZ6OBH&e=API090507&spm=138655627865015183.1.1.1', '有效销售额的2.5%—10%', '2013-04-26 00:00:00', '2014-04-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('491', '1264', '佐丹奴', '佐丹奴（Giordano）创立于1981年，现在已成为亚太区著名的服装零售商之一，以简洁时尚、自然休闲，易于搭配的设计风格而称誉。现时于全球四十多个地区经营逾2700间门市，聘用超过8000名员工，为顾客提供亲切而专业的服务。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/61/3/1366274113634.jpg', 'http://p.yiqifa.com/n?k=MlPfUcyLrI6HWlRe6l6H2mquUZgL18H_UmUmf9UAYm4w35e_f96_YpoH2mLErntmWN27rn3FWEz71ZLLrI6HYmLErJg86NgE3N2mrIW-&e=API090507&spm=138655627865015183.1.1.1', '3.5%-10.5%', '2013-05-10 00:00:00', '2014-05-09 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('492', '1265', '七格格（淘宝（', '“七格格”系杭州黯涉电子商务有限公司旗下平台品牌，是一个全品类潮流时装集结地。自创始以来，旨在打造中国女装线上第一潮流平台。七格格以多品牌策略为核心，旗下拥有淘宝三金冠潮流卖场、潮流时装购物网站“7gege.com”、OTHERMIX、IAIZO、OTHERFAITH、OTHERCRAZY、OTHERSIN、MEYEEKA等自主品牌。风格独特、定位鲜明，能够满足不同消费群体个性需求。在传递潮流、提供时装的同时，努力提供中国互联网同行业最领先的售后保障服务，为消费者打造完美购物体验。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/12/52/1366780987522.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm1NtLrI6HCZg7Rnu_fm6sMOBSMOySYIe735o835Hd3OoVfmLErI6HWNRqWlUH6EzS1nDFrnXHCPblKmXBrJoH2mLl393SMEzqMZLE&e=API090507&spm=138655627865015183.1.1.1', '6%-20%', '2013-05-13 00:00:00', '2014-04-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('493', '1266', '适凯', '适凯是迪拜第一户外运动品牌SKYVIEW的中文品牌名。与2004年成立于迪拜。摊开地图，让目光驻留在东经55°。那有世界上最奢华的七星帆船酒店、狂野宽广的沙漠、激扬的足球赛事、疯狂的冲沙运动和神秘的伊斯兰人文建筑，自盛唐大宋以来就通过海上丝绸之路与古城泉州互通往来的“海湾明珠”——迪拜', '2', 'http://image.yiqifa.com/ad_images/reguser/24/20/12/1367561324318.jpg', 'http://p.yiqifa.com/n?k=YJsSRsPLrI6HWlRm1NUH2mquUZgL18H_UmUmfc6ikpsOC5Pmf96dfmLErI6H6ljm1ZLO1n2F6nbHWZLErJoH2mLL6EjS652q3cLE&e=API090507&spm=138655627865015183.1.1.1', '14%-17.5%', '2013-05-14 00:00:00', '2014-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('494', '1267', '唐狮（天猫）', '唐狮官方旗舰店是tonlion/唐狮品牌的天猫旗舰店，主营大众男女时尚休闲服饰，以年轻、休闲、简约、时尚为品牌风格；店铺采用线下同款和线上专供两种产品线组合，以确保能为消费者提供优质的时尚产品。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/22/54/1364973425574.jpg', 'http://p.yiqifa.com/n?k=2mLErn2m6EjSrI6HCZg7Rnu_fsg_Y9qAYOFdUJsbYJLd3OoVrI6H2mLmWNjSrn3FWEz71ZLLrI6HYmLErJM9Mn3O3EKqrnMmM74eUZL-&e=API090507&spm=138655627865015183.1.1.1', '7.5%-10%', '2013-04-04 00:00:00', '2014-04-03 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('495', '1268', '心宿家居网', 'NewX心宿家居网是上海新置家居网络科技有限公司旗下的家具购物网站。在欧洲获得了成功运营经验，公司的设计管理团队来自国际知名家具线上网站(Myfab.com&Made.com)的精英组合而成，是中国进入家具电子商务行业的新开拓者。同时也是一个革新概念的电子商务网站，通过把生产商和最终顾客直接联系起来，提供物超所值的时尚设计家具。打造以NewX为基础的，时尚家居生活品牌，产品线将会从家具开始扩展到家饰、家纺、生活时尚产品。NewX以自主产品开发为主，并与设计师合作，开发概念家具产品。www.newx.com即将成为最受消费者欢迎和最具行业影响力的网站之一。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/37/5/1369203215094.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWn37rI6HCZg7Rnu_fmUmUSedMQUFf96dfmLErI6H6ltLWQLO1n2F6nbHWZLErJoH2mLmWEDqWlwm3cqIMwDSgyXH&e=API090507&spm=138655627865015183.1.1.1', '5.6%-17.5%', '2013-05-22 00:00:00', '2013-05-21 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('496', '1269', '8090美装网', '美妆网8090后爱与美时尚引爆者。是济南云天电子商务有限公司旗下专业女性购物商城，全网专柜正品商城。', '2', 'http://image.yiqifa.com/ad_images/reguser/24/57/7/1369972005155.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6n2lrI6HCZg7Rnu_fmUmUSFFWnwLY5PAk9bs35ecf96_YQLErI6H6Ews6mLO1n2F6nbHWZq11JVvP5yHYmLErJWS3E4bM94ErIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%-28.0%', '2012-12-01 00:00:00', '2013-11-30 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('497', '1270', '东京着衣（天猫）', '东京着衣」创立以来，品牌总监Mayuki凭借着对服饰的天生敏锐度与时尚品味，以优雅甜美的独特风格，提供快速流行、平价奢华、优质百搭的女装服饰，周周百款新品上市，多元风格横跨青少女至轻熟女，短短一年多，迅速跃升成为台湾Yahoo!奇摩拍卖女装「累积正面评价第一名」及「成交金额最高」的双料冠军，一路蝉联至今，稳坐流行女装天后的不败地位！', '2', 'http://image.yiqifa.com/ad_images/reguser/24/30/62/1369983535268.jpg', 'http://p.yiqifa.com/n?k=2mLErnWFWlDFrI6HCZg7Rnu_fOg_Y9UhC5eck9bsk5wdUJsbYJLd3OoVrI6H2mLq6l2L1QLO1n2F6nbHWZLErJoH2mq91J4w3ODmWQqBRtV_6PXH&e=API090507&spm=138655627865015183.1.1.1', '2.5%-11%', '2013-06-07 00:00:00', '2014-06-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('498', '3682', 'ul.com', '海淘客户，详见活动介绍', '1', 'http://image.yiqifa.com/ad_images/reguser/24/61/61/1377770612644.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWl2srI6HCZg7Rnu_fs6vU5Ld3OoVrI6H2mLq6lWOWQLO1n2F6nbHWZqJClPmK7AHYmLErnwO6N6b1nXErIW-&e=API090507&spm=138655627865015183.1.1.1', '0.7%-5.6%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('499', '3683', 'Sierra Trading Post', '海淘客户，详见活动介绍', '1', 'http://image.yiqifa.com/ad_images/reguser/24/39/57/1378272973828.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWl2SrI6HCZg7Rnu_fmUmUSelC5PSR9B7R9BwC5ecRJolUIeEYOsH2mqiPtqQUOoHWNRl6NyH6EzS1nDFrnXH2mq_rI6HMNwO6nWm15MH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.50%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('500', '3685', 'Mrs. Fields', '海淘客户，详见活动介绍', '1', 'http://image.yiqifa.com/ad_images/reguser/24/45/13/1378273575726.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWl2mrI6HCZg7Rnu_fmUmUSeVRc69C5PxMZWd3OoVrI6H3OoCCt6yrntmWlKsrn3FWEz71ZLLrI6HYmLErnzl6nDq6EjFrIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('501', '3687', 'Folli Follie', '海淘客户，详见活动介绍', '1', 'http://image.yiqifa.com/ad_images/reguser/24/52/12/1378284475874.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWlterI6HCZg7Rnu_fmUmUSe9YOqxC5M_YJqAMpesRSeEYOsH2mLErntmWlDOrn3FWEz71ZLLrnXnY5bJNQq_rI6HMEB93lRO3lXH2L--&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('502', '3688', 'Eforchina.com', '海淘客户，详见活动介绍', '1', 'http://image.yiqifa.com/ad_images/reguser/24/29/3/1378287300741.jpg', 'http://p.yiqifa.com/n?k=Nsy8Yc3FrI6HWlwS1N4H2mquUZgL18H_UmUmf9P9Ym4ECJyd3peEYOsH2mLErntmWlDsrn3FWEz71ZLLrI6HYmLErn3FWJBy3E3srIW-&e=API090507&spm=138655627865015183.1.1.1', '7.0%', '2013-08-06 00:00:00', '2014-06-30 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('503', '3726', '真豪生活', '<p>&nbsp;真豪生活网隶属真豪网络科技(上海)有限公司，网站于2011年2月正式上线，是正大集团全面进军中国电子商务界的重要标志。真豪生活网依托正大集团在中国大陆地区多年品牌实力，以带给中国网民健康的品质生活为基准，用户满意度为先导的企业文化，倾力为广大消费者打造全新的网购体验！</p>', '1', 'http://image.yiqifa.com/ad_images/reguser/24/55/9/1380088140037.jpg', 'http://p.yiqifa.com/n?k=374x5w3erI6H6njq1NgH2mquUZgL18H_UmUmf9y7RcPyYJy9MpeEYO7_rI6H2mLq6lD7WcLO1n2F6nbHWZLErJoH2mLOWntmM5te3QLE&e=API090507&spm=138655627865015183.1.1.1', '3.5%', '2013-09-26 00:00:00', '2014-09-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('504', '3616', '快书包', '快书包网www.kuaishubao.com，是2010年6月9日上线的网上精选便利店，以“精选、低价、1小时到货”为准则，为顾客带来精选图书、杂志、食品、饮品、鲜花、演出门票、精致礼品，在北京、上海、杭州、深圳、成都、西安、长沙提供订单1小时送达服务。上线以来，快书包已经赢得良好的口碑和品牌形象，成为以上城市消费者非常欢迎的快捷购物网站。未来，快书包将致力于覆盖更多城市，为全国主要城市消费者提供高水准的1小时送达服务。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/31/1/1370324343997.jpg', 'http://p.yiqifa.com/n?k=P5MMRmUQrI6HWlzs6EMH2mquUZgL18H_UmUmf9Vs35ylCZP835Hd3OoVfmLErI6HWNRSWNUH6EzS1nDFrnXH2mq_rI6HMEMy6lb869gH2L--&e=API090507&spm=138655627865015183.1.1.1', '1.4%-5.6%', '2013-06-05 00:00:00', '2014-06-04 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('505', '3636', '飞飞商城', '飞飞家居商城（www.feifei.com），是伦敦交易所上市公司——环球市场集团，为优质制造商和消费者建立的网上直销平台。飞飞提供代运营服务，让电商服务规范标准，并获得统一运营的规模效益，成功做到天天特惠、底价直销，让消费者以最低的价格，享有最优质的家居商品及服务。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/34/2/1374567627341.jpg', 'http://p.yiqifa.com/n?k=2mLErnWeWnwOrI6HCZg7Rnu_fmUmUSe9M5y9M5wd3OoVrI6HWQKONNKerntmWE3lrn3FWEz71ZLLrI6HYmLErnWmWNU9MND7rIW-&e=API090507&spm=138655627865015183.1.1.1', '1.4%-4.2%', '2013-06-28 00:00:00', '2014-06-27 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('506', '3658', '品聚商城', '品聚商城（又名品聚网），全球品牌内衣商城。由伦敦上市集团福泰中国重资打造，主要经营的产品以国内外品牌内衣为主，经营领域涵盖服饰、美妆、母婴用品、家电数码、食品饮料等，数万种商品,100%正品行货。品质生活,汇聚时尚,为您提供最安全便利,快捷,优质的网上购物体验！', '1', 'http://image.yiqifa.com/ad_images/reguser/24/56/8/1375689517718.jpg', 'http://p.yiqifa.com/n?k=2mLErnWe6n2srI6HCZg7Rnu_fmUmUSeA3cPeC5ecf96_YQLErI6HWNRl6EPH6EzS1nDFrnXHglM2kKFLrJoH2mqw6Ogy3ljF3QLE&e=API090507&spm=138655627865015183.1.1.1', '1.4%-9.8%', '2013-08-06 00:00:00', '2014-08-05 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('507', '1132', '一号商城', '？1号商城（www.1mall.com）于2011年9月正式运营，致力于为广大顾客打造“体验一流、诚信服务、品类齐全、品牌荟萃、方便快捷”的线上百货商城,同时，为广大的商家提供一个极具价值的中国电子商务行业“B2B2C”平台。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/22/10/1354084374623.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWl3SrI6HCZg7Rnu_fmUmUSFqY5BxYIeEYOsH2mLErn3e6NBH6EzS1nDFrnXH2mq_rI6H6EtFMERL3NyHPBRmUN4Crj--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-8.0%', '2012-11-29 00:00:00', '2013-11-28 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('508', '1117', '亿佰购物', '亿佰商城定位时尚消费人群，提供涵盖美妆、奢侈品、手表、箱包配饰、科技、生活家居、健康食品、收藏礼品等品类，囊括国内外知名中高端品牌，超过1万种中高端时尚商品供消费者选择。亿佰购物致力于倡导时尚、积极、超前的购物方式，引领时尚消费行为，成为中国信用卡时尚消费第一品牌', '1', 'http://image.yiqifa.com/ad_images/reguser/24/31/1/1345184866104.jpg', 'http://p.yiqifa.com/n?k=2mLErn2sWlzSrI6HCZg7Rnu_fmUmUSey3Q6e3cPef96_YpeEYcLErI6H6ERe6QLO1n2F6nbHWZLErJoH2mqw3EbEMEX83Qq9PBjmCQgH&e=API090507&spm=138655627865015183.1.1.1', '0.7%-11.2%', '2012-08-18 00:00:00', '2013-08-17 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('509', '1118', '嘉年乐', '嘉年乐老年商城主要通过提供全面、及时、便捷、高品质的在线商品销售和服务，建立功能多元化、使用简单快捷、购物满意方便的线上老年商品的一站式购物网站。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/18/14/1336705559312.jpg', 'http://p.yiqifa.com/n?k=p5ROW7ALrI6HWEtO6n6H2mquUZgL18H_UmUmf9AA35eA35exMpeEYO7_rI6H2mLO6E2qrn3FWEz71ZLLrI6HYmLErntO3O3sWn69rIW-&e=API090507&spm=138655627865015183.1.1.1', '2%-14%', '2012-05-12 00:00:00', '2013-05-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('510', '1119', '优集品商城', '优集品是一个汇集全球高品质生活百货设计品牌，通过品牌文化影响和改变中国消费者生活方式的商城。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/37/59/1330426673361.jpg', 'http://p.yiqifa.com/n?k=2mLErnte1NDSrI6HCZg7Rnu_fmUmUSexCQMyRJoSUIeEYcLErtUiME4vpmLO6Nj7rn3FWEz71ZLLrI6HYmLErnKOWnWS1n6wrIW-&e=API090507&spm=138655627865015183.1.1.1', '17.5%', '2012-02-29 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('511', '1120', '品店', '品店来自日本爽快药妆，是日本大型商社住友商事集团旗下知名网络生活超市！曾获得2011年度乐天市场特选优质店铺，并连续三年荣获乐天市场综合大奖。中国品店官方旗舰店将为各位买家收集高品质、低价位的消费品。让您足不出户就可以享受100%正品保障，一站式购物体验，海量国内外品牌商品与时时更新的特惠折扣，安心、省心、贴心无限！', '1', 'http://image.yiqifa.com/ad_images/reguser/24/3/3/1346232432070.jpg', 'http://p.yiqifa.com/n?k=kPbu1JVOrI6HWEDLWE4H2mquUZgL18H_RJydRmg_R9Kd3OF_rI6H2mLO1n2qrn3FWEz71ZLLrI6HYmLErJDO3NjOWNjFrIW-&e=API090507&spm=138655627865015183.1.1.1', '2.1%-4.2%', '2012-08-30 00:00:00', '2013-08-29 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('512', '1122', '百联E城', '百联电商依托15000余家优质网点资源、1860万会员资源、技术资源、商品资源、网络资源，通过优势资源的整合，将传统零售与电子商务有效结合起来，在数据支撑及服务应用方面百联电商在传统零售行业电子商务领域处于领先水平。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/55/9/1342405904751.jpg', 'http://p.yiqifa.com/n?k=gnbhK7PxrI6HWE2O6n6H2mquUZgL18H_UmUmf94xM5sbYJLd3OoVrI6H2mLO6l27rn3FWEz71ZLLrI6HYmLErn2l3Ew76ODmrIW-&e=API090507&spm=138655627865015183.1.1.1', '0%-7%', '2012-07-17 00:00:00', '2013-07-16 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('513', '1123', '趣玩网', '趣玩网推崇“趣生活，玩有品”，即奇趣生活，玩出品质，玩出品格。我们希望让用户，合作伙伴，员工都成为“玩者”。玩者??意为热爱玩的人士。我们的愿景是?用“趣”、“玩”去影响世界！', '1', 'http://image.yiqifa.com/ad_images/reguser/24/54/10/1281329820123.jpg', 'http://p.yiqifa.com/n?k=2mLErntl6E4H2mquUZgL18H_UmUmfcBsUOBdf96_YpoH2mqW6Ko4CtMHWNzLWZLO1n2F6nbHWZLErJoH2mq91N3sM54bWcLE&e=API090507&spm=138655627865015183.1.1.1', '0.03%-11.0%', '2009-03-11 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('514', '1124', '美国购物网', '美国购物网成立于2005年，是中国最大最专业的美国代购电子商务平台。是国内最早致力于网络代购业务的互联网公司，是中国唯一一家可以帮助客户免除美国消费税的商家。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/1/1/1330567240642.jpg', 'http://p.yiqifa.com/n?k=2mLErntO6n2SrI6HCZg7Rnu_fmUmUSesROBlCJoL3OFd3OoVrI6H2mLs1Ntsrn3FWEz71ZLLrJMM6EBf1Zq_rI6H6JKmWEjS654H2L--&e=API090507&spm=138655627865015183.1.1.1', '每单4.2元-280元', '2011-07-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('515', '1129', '王府井百货', '王府井网上商城是王府井百货集团官方购物网站', '1', 'http://image.yiqifa.com/ad_images/reguser/24/29/3/1361781737687.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6E3SrI6HCZg7Rnu_fmUmUSem35ecMcPhC5ecf96_YQLErI6H6ljl6ZLO1n2F6nbHWZLErJoH2mq8MNDSW5gE6cq53KM767UH&e=API090507&spm=138655627865015183.1.1.1', '0.0%-3.5%', '2013-02-16 00:00:00', '2014-02-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('516', '1130', '拍拍网', '腾讯拍拍网是腾讯旗下电子商务交易平台', '1', 'http://image.yiqifa.com/ad_images/reguser/24/7/57/1347503969958.jpg', 'http://p.yiqifa.com/n?k=p5Vu5NyVrI6HWEWO6E4H2mquUZgL18H_RObAY9KdRJBARJBAf96_YpoLR9oVYmgyfl2LWNW_C5ewMQbrWSelCZgVYZLErI6H6ERFWQLO1n2F6nbHWZLErJoH2mq83l2e3NRqMZLE&e=API090507&spm=138655627865015183.1.1.1', '1-50%', '2012-08-16 00:00:00', '2013-09-15 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('517', '1131', '移动商街', '移动商街秉承着择取精良商品、特色店铺、精品生活三位一体式O2O概念，打造为贴近性强，实用性强，特色感强的特色生活服务类平台。以免单、优惠等形式走入市场，主打精良商品展示，依托线下品牌库、商家库和商品库的整合，给用户有特色，吸引人，精彩的产品提供，给商家晒卖点，晒创意，晒特色的优秀渠道。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/9/55/1357372971424.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6l2SrI6HCZg7Rnu_fOxd3OeH2mLSMOwl5QbH6Ew7WZLO1n2F6nbHWZLErJoH2mLFM9P91NXy6QLE&e=API090507&spm=138655627865015183.1.1.1', '3.0%-3.0%', '2012-11-25 00:00:00', '2013-11-24 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('518', '1133', '邮乐网', '由中国邮政与香港和记黄埔和长江实业旗下的TOM集团携手呈献，是一个结合高端线上网购和线下零售于一体的独特创新购物服务平台。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/54/54/1354162031297.jpg', 'http://p.yiqifa.com/n?k=2mLErn2s6njlrI6HCZg7Rnu_fmUmUSesYJKd3OoVrI6HWN4ggBWern3e6NgH6EzS1nDFrnXH2mq_rI6HWJWsWEB9WEMH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-6.3%', '2012-12-03 00:00:00', '2013-12-05 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('519', '1134', '徐家汇商城', '徐家汇商城整合徐家汇商圈内的上海第六百货、汇金百货、汇联商厦、美罗城、太平洋百货、港汇恒隆广场等百货强大供应链资源和国内外主流的多家一线品牌，是一个以定位销售当季新品为特色的全新时尚综合类高端百货网络商城。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/46/50/1355127667519.jpg', 'http://p.yiqifa.com/n?k=2mLErn2O6N3SrI6HCZg7Rnu_fmUmUSeFC9zd3OoVrI6H2mLO1N3Orn3FWEz71ZLLrJq1RJw73mq_rI6H3EP935KF3EyH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.7%-12.6%', '2012-12-11 00:00:00', '2013-12-10 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('520', '1135', '吉象吉送', '吉象吉送是采用城市O2O综合购物模式，主营民生消费品的网上购物商城。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/5/5/1357879377640.jpg', 'http://p.yiqifa.com/n?k=Pyy8U7DFrI6HWE3S1n4H2mquUZgL18H_UmUmf9AFY5BxYIeEYO7_rI6H2mLmWnjFrn3FWEz71ZLLrI6HYmLErJWq6lbbWODLrIW-&e=API090507&spm=138655627865015183.1.1.1', '0.7%-5.6%', '2013-01-12 00:00:00', '2014-01-11 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('521', '1136', '一淘巨优惠', '', '1', 'http://image.yiqifa.com/ad_images/reguser/24/61/3/1344998832552.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWNDSrI6HCZg7Rnu_fOKdMQgbYSeEYOsH2mLErn3m1ngH6EzS1nDFrnXH2mq_rI6H6EKO1nzm6JBH6ERspKA3rj--&e=API090507&spm=138655627865015183.1.1.1', '0.5%-20%', '2012-08-20 00:00:00', '2013-08-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('522', '1137', '欧乐乐', '欧乐乐时尚精品网主要经营服饰、化妆品、配饰等时尚用品。在每周二、三、四、五上午10点，每天推出3个时尚特卖专题。欧乐乐所提供的服饰，是买手远赴香港、台湾、日本等潮流前线精挑细选而来的，所提供的化妆品，是资深时尚小编研究美妆杂志挑选的畅销单品。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/49/49/1312282262020.jpg', 'http://p.yiqifa.com/n?k=gOoQWwtOrI6HWN2qWE4H2mquUZgL18H_YmPxM5qyf96_YQLErI6H6NDs6QLO1n2F6nbHWZLErJoH2mqbME69Mn2m1ZLE&e=API090507&spm=138655627865015183.1.1.1', '12.6%-100.0%', '2011-03-18 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('523', '1138', '新世界百货', '新世界百货网上商城（www.enwds.com/www.xinbaigo.com）是一家为消费者提供精品时尚的百货类产品的B2C平台', '1', 'http://image.yiqifa.com/ad_images/reguser/24/34/2/1315547432423.jpg', 'http://p.yiqifa.com/n?k=2mLErntFWn2SrI6HCZg7Rnu_fmUmUSeFC5e835ycYSeEYOsH2mLErn3q6NgH6EzS1nDFrnXH2mq_rI6H3N4b1JBb654HW9ofM7UTrj--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-100.0%', '2011-09-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('524', '1139', '波奇商城', '波奇网拥有目前国内领先的宠物平台，包括波奇社区、波奇商城、宠友俱乐部及波奇合作店，关注宠物生活全方面，为养宠用户提供一站式服务。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/35/3/1334801373857.jpg', 'http://p.yiqifa.com/n?k=knPOkEBxrI6HWEjs1n6H2mquUZgL18H_ROb_RIe8YmBACpeEYOsH2mLErn3s6NPH6EzS1nDFrnXH2mq_rI6H65KSM5M8WE4H2L--&e=API090507&spm=138655627865015183.1.1.1', '7.0%-100.0%', '2012-04-02 00:00:00', '2013-03-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('525', '1141', '银座网', '银座网上商城是银座官方购物网站。目标是成为中国先进的综合性网上购物服务平台，在进一步完善母婴产品的基础上，产品线将逐渐扩展到日用百货、3C数码、精品家居、化妆品、食品等诸多品类，继续为所有新老会员提供优质的服务和卓越的购物体验，满足消费者一站式家庭购物的需求。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/25/57/1310105478090.jpg', 'http://p.yiqifa.com/n?k=WtPb3w4PrI6HWNKSWn4H2mquUZgL18H_UmUmfcyAYcAsYltLWIeEYOsH2mLErnKs6NXH6EzS1nDFrnXH2mq_rI6HWntLWJPw3O6H2L--&e=API090507&spm=138655627865015183.1.1.1', '1.4%-100.0%', '2011-04-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('526', '1142', '悠品购物网', '悠品网是国内最大的网上B2C创意生活百货店之一，致力于为中国时尚女性提供家庭购物服务。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/43/11/1353315009344.jpg', 'http://p.yiqifa.com/n?k=2mLErnweWngH2mquUZgL18H_UmUmfEKqk5osRJydf96_YQLErI6H6Ntm6cLO1n2F6nbHWZLErJoH2mLl39tSME3l1ZqOkJeX1Q6H&e=API090507&spm=138655627865015183.1.1.1', '4.0%-100.0%', '2010-11-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('527', '1143', '天猫', '', '1', 'http://image.yiqifa.com/ad_images/reguser/24/8/8/1348237603502.jpg', 'http://p.yiqifa.com/n?k=2mLErntS6lzSrI6HCZg7Rnu_fmUmUSe7Y5BxYIeEYOsH2mLErnKs6nyH6EzS1nDFrnXHWm6LkQ4ErJoH2mqE1nMbWlKm6QLE&e=API090507&spm=138655627865015183.1.1.1', '70%（有效佣金额的70%）', '2011-04-20 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('528', '1144', '哇噻网', '哇噻网是中国最大的手工、原创设计、艺术品、传统工艺品在线交易平台。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/2/62/1325662036013.jpg', 'http://p.yiqifa.com/n?k=2mLErnteWEjSrI6HCZg7Rnu_fmUmUSemYmUl35wd3OoVrI6H2mLO6nKmrn3FWEz71ZLLrI6HYmLErnzFW9Dm6ERsrJPDMly1RcL-&e=API090507&spm=138655627865015183.1.1.1', '0.0%-5.0%', '2012-01-05 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('529', '1145', 'E宠商城', '中国最优秀的宠物用品B2C平台', '1', 'http://image.yiqifa.com/ad_images/reguser/24/11/11/1328769314258.jpg', 'http://p.yiqifa.com/n?k=2mLErnte6N2SrI6HCZg7Rnu_fmUmUSeyRJP739BSf96_YQLErI6H6EDm6cLO1n2F6nbHWZLErJoH2mqbWl6y1n2e6cqDKwBl1ngH&e=API090507&spm=138655627865015183.1.1.1', '3.5%-14%', '2012-02-15 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('530', '1146', '够奇', '够奇kwerkee，来自新加坡，是Reebonz&nbsp;集团旗下网站，主营家居、装饰、厨浴、玩具、礼品等领域的创意类产品。汇聚全球知名创意品牌、创意设计师和潮流产品，是目前规模较大、品类更广的趣味创意产品网络销售平台。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1349943663990.jpg', 'http://p.yiqifa.com/n?k=2mLErn2S6NjOrI6HCZg7Rnu_fmUmUSeiUOPSCOPyCmUyR9VyMpeEYO7_rI6H2mLO6lj7rn3FWEz71ZLLrI6HYmLErnUwWNRe3EDlrZybWOPBWQL-&e=API090507&spm=138655627865015183.1.1.1', '', '2012-07-11 00:00:00', '2013-07-10 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('531', '1147', 'D1优尚网', 'D1优尚目前经营名表、Zippo、化妆品、香水、保健品、服装、饰品、家居等商品。快速发展6年，为百万用户提供过优质服务&mdash;&mdash;诚信在长期经营中逐步积累。经历了艰苦创业初期阶段，完善了很多经营中的细节。第一优尚正在用&ldquo;第一&rdquo;的速度追求客户&ldquo;第一&rdquo;的服务；用&ldquo;第一&rdquo;的信誉追求客户&ldquo;第一&rdquo;的满意；也正在用我们&ldquo;第一&rdquo;的精神建立&ldquo;第一&rdquo;美好的明天。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/27/5/1261377266828.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWZLErJb7UZjvfSomUmRdMntd3OoVf96dfmLErBPOptWs5QLlWEPH6EzS1nDFrnXH2mq_rI6HWJB8W93OWJBH2L--&e=API090507&spm=138655627865015183.1.1.1', '3.0%-17.0%', '2008-11-19 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('532', '1148', '京东商城', '360buy京东商城（www.360buy.com）是中国B2C市场最大的3C网购专业平台，是中国电子商务领域最受消费者欢迎和最具影响力的电子商务网站之一。（注：3C是计算机Computer、通讯Communication和消费电子产品Consumer Electronic三类电子产品的简称）', '1', 'http://image.yiqifa.com/ad_images/reguser/24/31/63/1364886745838.jpg', 'http://p.yiqifa.com/n?k=2mLErntOWZLErJb7UZjvfSomUmRdC9Dd3OoVfmLErJUJDmM4MZLS6NgH6EzS1nDFrnXH2mq_rI6H3EMw3lb9M9PH2L--&e=API090507&spm=138655627865015183.1.1.1', '4-43元/单或1.4%-3.5%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('533', '1149', '洋码头', '', '1', '', 'http://p.yiqifa.com/n?k=2mLErntF6n3lrI6HCZg7Rnu_fmUmUSeeY5B7YmKd3OoVrI6HCKM86sDFrn3S1ngH6EzS1nDFrnXH2mq_rI6H3EjL6OKSWnUH2L--&e=API090507&spm=138655627865015183.1.1.1', '每个订单3.5元', '2011-10-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('534', '1150', 'YMALL商城(天猫）', 'Ymall以前瞻的眼光，中国独家将情感巧妙融入购物需求的电商营运模式，定位于有格调的中高端礼品市场，以顾客购物的感情寄托、体贴聪颖的产品功能、精心甄选的海内外商品、量身定制的尊贵服务为营运基准，让选购礼品成为一次惊喜愉快的体验，一种生活格调的彰显，一座传递情感的桥梁。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/32/0/1363681148456.jpg', 'http://p.yiqifa.com/n?k=2mLErn2mWn2SrI6HCZg7Rnu_fmyV35qxfcgV35qxf96_YpoH2mqeM9AZ5c4H6ljmWcLO1n2F6nbHWZLErJoH2mLs39P9M9KL3QLE&e=API090507&spm=138655627865015183.1.1.1', '5.0%', '2013-03-26 00:00:00', '2014-03-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('535', '1151', '嗨淘网', '2010年4月，中国内地最受观众欢迎的娱乐电视传媒——湖南卫视与亚洲最大的电子商务网站——淘宝网共同出资1亿元人民币，全力打造Hitao.com电子商务网站。2010年12月，Hitao网站正式上线启航！它成功利用湖南卫视与淘宝网的品牌资源优势、社会资源优势、巨大流量优势，全力进军B2C业务，以正牌、真品的诚信承诺，打造“品质妆扮馆”，主打服装以及美容护肤保健，兼及设计师定制及自有品牌等品类，主力目标顾客定位于18—35岁的年轻女性消费群，为中国消费者提供时尚妆扮领域的解决方案。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/12/12/1364902232006.jpg', 'http://p.yiqifa.com/n?k=2mLErn2m6nzSrI6HCZg7Rnu_fmUmUSeuCQgbYSeEYOsH2mLErnRL1NyH6EzS1nDFrnXHgNgZRlXtrJoH2mLm1NDmWNjL6mLE&e=API090507&spm=138655627865015183.1.1.1', '2.1%-8.4%', '2013-04-03 00:00:00', '2014-04-02 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('536', '1152', '家健商城', '家健商城，由广东诚美集团投资创办，是一家专门做进口商品的网站，凭借原装进口，正品行货假一罚十，万平无尘仓，30天无条件免费退换货，个性化服务等特色，在首届资本奇迹全球年会上荣获“最具投资价值奖”。涵盖美妆、母婴、家居、名品四大类，已有近百种世界大品牌入驻，欢迎广大站长与家健商城一同打造进口商品首选的网购平台！', '1', 'http://image.yiqifa.com/ad_images/reguser/56/46/46/1367892240569.JPG', 'http://p.yiqifa.com/n?k=CwoLWQMSrI6HWlRe1NgH2mquUZgL18H_UmUmf9AbC9Fd3OoVrI6H2mLq6lts6ZLO1n2F6nbHWZLErJoH2mq83lPb3EPbMcLE&e=API090507&spm=138655627865015183.1.1.1', '2.8%-8.4%', '2013-05-07 00:00:00', '2014-05-06 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('537', '1153', 'Buysku', 'BuySKU.com is a large B2C trading platform which is delicated in the retail and wholesale of electronic products and related gadgets, drop shipping, OEM, and providing money-making channels for customers. We have the convenient purchase process and thoughtful service for you to make  secure and happy purchases. We can make sure that you can not find a better price among all the websites of the same trade,and the quality are absolutely reliable.', '1', 'http://image.yiqifa.com/ad_images/reguser/24/53/11/1366075913471.jpg', 'http://p.yiqifa.com/n?k=2mLErnWm6lKlrI6HCZg7Rnu_fmUmUSe8UQylCmKd3OoVrI6H65VeUtD7rntmWNtFrn3FWEz71ZLLrI6HYmLErn3q353L1NDerIW-&e=API090507&spm=138655627865015183.1.1.1', '5.6%-7.7%', '2013-05-14 00:00:00', '2014-05-13 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('538', '1101', '红孩子商城', '红孩子于2004年3月成立，致力于通过目录和互联网为用户提供方便快捷的购物方式和价廉物美的产品。成立两年多以来发展速度迅猛，现在已经拥有母婴用品、化妆品、健康产品、自选礼品，家居产品五条产品线，成为全国规模最大的目录销售企业。', '1', 'http://image.yiqifa.com/ad_images/reguser/56/59/37/1261378747784.JPG', 'http://p.yiqifa.com/n?k=2mLErnt71ZLErJb7UZjvfSoSM5g8354efc6sY9ydMSeEYO7_rI6H6NbyWPALrn271QLO1n2F6nbHWZLErJoH2mqw3EKF6nwl3mLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-40.0%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('539', '1102', '当当网', '当当网（www.dangdang.com）是全球最大的综合性中文网上购物商城', '1', 'http://image.yiqifa.com/ad_images/reguser/24/0/0/1257418220097.jpg', 'http://p.yiqifa.com/n?k=DweFPEyKrI6HWNKerI6HCZg7Rnu_fmUmUSew35ecMJBdMSeEYO7_rI6H2mLS6nUH6EzS1nDFrnXH2mq_rI6H6EzeWEX8WNUH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-100.0%', '2008-11-16 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('540', '1103', '快易拍', '快易拍鞋服商城(KYP)，成立于2010年年初，新亚集团旗下网站。新亚集团是中国鞋都重点进出口企业，年度出口销售额在五亿人民币左右。2010年4月，第十二届中国国际鞋业博览会上正式立项，成立快易拍（KYP）品牌网络营销中心。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/13/13/1284602288611.jpg', 'http://p.yiqifa.com/n?k=2mLErnz76E4H2mquUZgL18H_UmUmf9VeRJ4skpeEYOsH2mLErnDe1NUH6EzS1nDFrnXHWyg1PmBmrJoH2mLs6nteWl37MZLE&e=API090507&spm=138655627865015183.1.1.1', '0.03%-18.0%', '2010-09-17 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('541', '1104', '1号店', '<p>1号店将&ldquo;家&rdquo;做为经营主题，涵盖与家息息相关的各类商品，包括食品/饮料，美容/护理，家居/家具，厨卫/清洁，家电/数码，母婴/玩具，服饰/箱包，运动/户外，文具/图书/影音，建材/装修等十大类产品。我们的服务理念是&ldquo;选择1号店，超市到您家！&rdquo;</p>', '1', 'http://image.yiqifa.com/ad_images/reguser/24/7/57/1261378967050.jpg', 'http://p.yiqifa.com/n?k=2mLErnzLWcLErJb7UZjvfSomUmRdk5bwf96_YpoH2mLErntl1QLO1n2F6nbHWZq96KUBKtyHYmLErJtm6ND73EbwrIW-&e=API090507&spm=138655627865015183.1.1.1', '', '2008-08-19 00:00:00', '2014-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('542', '1105', '趣天麦网', '麦考林成立于1996年1月8日，是中国第一家获得政府批准的从事邮购业务的三资企业。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/43/53/1357375904849.jpg', 'http://p.yiqifa.com/n?k=2mLErnDO6E4H2mquUZgL18H_UmUmf97q1IeEYO7_rI6H2mL7WERsrn3FWEz71ZLLrteh59PFWcq_rI6HMJM935tF1NyH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-16.0%', '2009-11-13 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('543', '1106', '淘宝网', '', '1', 'http://image.yiqifa.com/ad_images/reguser/24/54/54/1257418579935.jpg', 'http://p.yiqifa.com/n?k=2mLErn2L6E3SrI6HCZg7Rnu_fmUmUSe735o835Hd3OoVrI6HP7AXRJbwrn2L6EXH6EzS1nDFrnXH2mq_rI6HWlBw65BE6OPH2L--&e=API090507&spm=138655627865015183.1.1.1', '70.0%-90.0%', '2009-03-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('544', '1107', '万翔商城', '厦门万翔网络商务有限公司是厦门国际航空港集团有限公司旗下企业。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/27/59/1334106995891.jpg', 'http://p.yiqifa.com/n?k=DmydPlXLrI6HWNKlWn4H2mquUZgL18H_UmUmf9BdRJoSUZ6uYmjd3OoVrI6H2mLs6lzLrn3FWEz71ZLLrI6HYmLErnME69tO6NRFrIW-&e=API090507&spm=138655627865015183.1.1.1', '1.0%-100.0%', '2011-06-23 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('545', '1108', '银泰网', '银泰网（www.yintai.com）是专注于精品时尚百货经营的大型B2C电子商务平台', '1', 'http://image.yiqifa.com/ad_images/reguser/24/44/52/1323833027660.jpg', 'http://p.yiqifa.com/n?k=2mLErnzFWE4H2mquUZgL18H_UmUmfcyAYcgbCpeEYOsH2mLErnDe1n4H6EzS1nDFrnXH2mq_rI6HWnMy6nXyM9BHYP6AKN4qrj--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-100.0%', '2010-09-10 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('546', '1109', '莲花易购', '联华超市股份有限公司于一九九一年起在上海开展业务，于二十年间，以直接经营、加盟经营和并购方式发展成为一家具备全国网点布局、业态最齐全的连锁零售超市公司。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/56/8/1335421479605.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l6NzSrI6HCZg7Rnu_fmUmUSexCJsbRcDd3OoVfOydMJPFf9b7Y5qH2mLErn3s1nbH6EzS1nDFrnXH6OosYN45rJoH2mLeW9BwMnzFWmLE&e=API090507&spm=138655627865015183.1.1.1', '0.0%-5.6%', '2012-04-26 00:00:00', '2013-04-25 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('547', '1111', '亚马逊（返点）', '亚马逊中国是全球最大的电子商务公司亚马逊在中国的网站。此链接只针对返点站。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/53/53/1348561056745.jpg', 'http://p.yiqifa.com/n?k=2mLErn2l1N2SrI6HCZg7Rnu_fmUmUSebY5BvYOFd3OeH2mLErn3F6NbH6EzS1nDFrnXHKKAECyWFrJoH2mLO6ntm3OKlMcLE&e=API090507&spm=138655627865015183.1.1.1', '0.35%-4.2%', '2012-09-20 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('548', '1112', '广百网购', '广州市广百股份有限公司（股票代码002187）前身是1991年开业的广州百货大厦。2002年4月30日实现股份制改造；2007年，广百股份A股成功上市。经多年发展，从广州北京路的单间大店发展成为今天拥有百货店、专业店和购物中心等业态的大型连锁企业。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/33/1/1354613246224.jpg', 'http://p.yiqifa.com/n?k=g7o66EPBrI6HWNwO1n4H2mquUZgL18H_UmUmf9ycR9BdMJ4skpeEYOsH2mLErn3sWnMH6EzS1nDFrnXH2mq_rI6H6n4y1N2m3NyH2L--&e=API090507&spm=138655627865015183.1.1.1', '', '2012-03-15 00:00:00', '2013-12-31 00:00:00', '0');
INSERT INTO `jgjsys_yqf_website` VALUES ('549', '1114', '百联股份', '友谊股份是国内一流的大型综合性商业股份制上市公司，资产规模、销售规模等关键性指标始终名列A股商业类上市公司前列，拥有总商业建筑面积超过600万平方米，年营业收入近500亿，经营网点遍布全国20多个省市超过5000家，几乎涵盖了零售业现有的各种业态', '1', 'http://image.yiqifa.com/ad_images/reguser/24/27/59/1337234230216.jpg', 'http://p.yiqifa.com/n?k=2mLErn2q6NDSrI6HCZg7Rnu_fmUmUSe8YZA_YO7d3OoVrI6HpyMm5ZX!rn3s6lyH6EzS1nDFrnXH2mq_rI6H3Nb8WEDq3lgH2L--&e=API090507&spm=138655627865015183.1.1.1', '0.0%-7.0%', '2012-04-25 00:00:00', '2013-12-31 00:00:00', '1');
INSERT INTO `jgjsys_yqf_website` VALUES ('550', '1115', '爱福恩美国直邮', '爱福恩美国直邮是一家以保健品,化妆品,婴儿用品,休闲零食为主的美国直邮代购网站，我们是唯一做到直邮承诺的商家,让你在家就能享受在美国购物的乐趣和直邮带来的快感。', '1', 'http://image.yiqifa.com/ad_images/reguser/24/57/57/1345104573736.jpg', 'http://p.yiqifa.com/n?k=2mLErn2lWl27rI6HCZg7Rnu_fmUmUSeqR5UlCJoLf96_YQLErI6H6EReWcLO1n2F6nbHWZLErJoH2mq9MnDl6EtlMcq4MOVB5QXH&e=API090507&spm=138655627865015183.1.1.1', '0.7%-11.0%', '2012-08-18 00:00:00', '2013-08-17 00:00:00', '1');
