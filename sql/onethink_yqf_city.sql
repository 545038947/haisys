
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_yqf_city`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_yqf_city`;
CREATE TABLE `onethink_yqf_city` (
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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='yiqifa团购城市数据表\r\n@author   和蔼的木Q\r\n@version  2013-12-07';



-- ----------------------------
-- Table structure for `onethink_yqf_region`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_yqf_region`;
CREATE TABLE `onethink_yqf_region` (
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
-- Table structure for `onethink_yqf_tuancategory`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_yqf_tuancategory`;
CREATE TABLE `onethink_yqf_tuancategory` (
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

