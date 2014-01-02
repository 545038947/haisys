-- Table structure for `jgjsys_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_supplier`;
CREATE TABLE `jgjsys_supplier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '供货商名称',
  `weburl` char(250) NOT NULL DEFAULT '' COMMENT '供货商url',
  `logo` char(100) NOT NULL DEFAULT '' COMMENT '供货商logo 120px*45px',
  `desc` text COMMENT '供货商描述',
  `cashbacks` char(100) NOT NULL DEFAULT '' COMMENT '返点比例',
  `sortorder` tinyint(8) NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_supplier_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品供货商信息\r\n@author   和蔼的木Q\r\n@version  2014-01-02';

-- Table structure for `jgjsys_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_goodstype`;
CREATE TABLE `jgjsys_goodstype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '商品类型名称',
  `desc` text COMMENT '商品类型描述',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_goodstype_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品类型信息\r\n@author   和蔼的木Q\r\n@version  2014-01-02';

-- Table structure for `jgjsys_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_goodstypearrt`;
CREATE TABLE `jgjsys_goodstypearrt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '商品属性名称',
  `typeid` int(10) unsigned NOT NULL COMMENT '商品属性对应类型ID',
  `desc` text COMMENT '商品属性值',
  `group` char(64) NOT NULL DEFAULT '默认' COMMENT '商品属性分组',
  `price` DECIMAL(11,2) unsigned NOT NULL COMMENT '商品属性价格_对应销售属性',
  `arrttype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '属性类型：1主属性、2次要属性、3销售属性',
  `sortorder` tinyint(8) NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_goodstypearrt_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品类型属性模板\r\n@author   和蔼的木Q\r\n@version  2014-01-02';


-- Table structure for `jgjsys_goodsalbum`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_goodsalbum`;
CREATE TABLE `jgjsys_goodsalbum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goodsid` int(10) unsigned NOT NULL COMMENT '对应商品ID',
  `picid` int(10) unsigned NOT NULL COMMENT '对应图片ID',
  `sortorder` tinyint(8) NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_goodsalbum_picid` (`picid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品画册\r\n@author   和蔼的木Q\r\n@version  2014-01-02';



-- Table structure for `jgjsys_goodsarrt`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_goodsarrt`;
CREATE TABLE `jgjsys_goodsarrt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '商品属性名称',
  `goodsid` int(10) unsigned NOT NULL COMMENT '商品属性对应商品ID',
  `desc` text COMMENT '商品属性值',
  `group` char(64) NOT NULL DEFAULT '默认' COMMENT '商品属性分组',
  `price` DECIMAL(11,2) unsigned NOT NULL COMMENT '商品属性价格_对应销售属性',
  `arrttype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '属性类型：1主属性、2次要属性、3销售属性',
  `sortorder` tinyint(8) NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_goodsarrt_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品属性\r\n@author   和蔼的木Q\r\n@version  2014-01-02';




-- Table structure for `jgjsys_goods`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_goods`;
CREATE TABLE `jgjsys_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `supplierid` int(10) unsigned NOT NULL COMMENT '供货商ID',
  `goodscatid` int(10) unsigned NOT NULL COMMENT '商品类别ID',
  `goodstypeid` int(10) unsigned NOT NULL COMMENT '商品类型ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '商品标题',
  `code` char(32) NOT NULL DEFAULT '' COMMENT '商品编码',
  `goodspic` char(200) NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `price_1` DECIMAL(11,2) unsigned NOT NULL COMMENT '商品市场价格',
  `price_2` DECIMAL(11,2) unsigned NOT NULL COMMENT '商品本店价格',
  `adderid` int(10) unsigned NOT NULL COMMENT '添加人ID',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `modifyid` int(10) unsigned NOT NULL COMMENT '修改人ID',
  `modifytime` int(11) unsigned NOT NULL COMMENT '修改时间',
  `starttime` int(11) unsigned NOT NULL COMMENT '有效开始时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '有效结束时间',
  `desc` MEDIUMTEXT COMMENT '商品详细描述',
  `sortorder` tinyint(8) NOT NULL DEFAULT '0' COMMENT '排序值',
  `sellstatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '销售状态：上架，下架',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_goods_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品\r\n@author   和蔼的木Q\r\n@version  2014-01-02';


-- Table structure for `jgjsys_goodscat`
-- ----------------------------
DROP TABLE IF EXISTS `jgjsys_goodscat`;
CREATE TABLE `jgjsys_goodscat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(64) NOT NULL DEFAULT '' COMMENT '商品类别名称',
  `logo` char(100) NOT NULL DEFAULT '' COMMENT '类别图片地址',
  `pid` int(10) unsigned NOT NULL COMMENT '父类别ID,为0标示根节点',
  `desc` text COMMENT '商品类别描述',
  `sortorder` tinyint(8) NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_goodscat_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品类别信息\r\n@author   和蔼的木Q\r\n@version  2014-01-02';

