/*
Navicat MySQL Data Transfer

Source Server         : jgjmall.gotoftp3.com
Source Server Version : 50158
Source Host           : jgjmall.gotoftp3.com:3306
Source Database       : jgjmall

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2013-12-10 19:09:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_city`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_city`;
CREATE TABLE `onethink_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  `pinyin` varchar(32) NOT NULL,
  `first_word` varchar(1) NOT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `first_word` (`first_word`)
) ENGINE=MyISAM AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_city
-- ----------------------------
INSERT INTO `onethink_city` VALUES ('1', '北京', '100', 'beijing', 'b', '0');
INSERT INTO `onethink_city` VALUES ('2', '上海', '99', 'shanghai', 's', '0');
INSERT INTO `onethink_city` VALUES ('3', '广州', '98', 'guangzhou', 'g', '0');
INSERT INTO `onethink_city` VALUES ('4', '深圳', '97', 'shenzhen', 's', '0');
INSERT INTO `onethink_city` VALUES ('5', '武汉', '0', 'wuhan', 'w', '0');
INSERT INTO `onethink_city` VALUES ('6', '成都', '95', 'chengdu', 'c', '0');
INSERT INTO `onethink_city` VALUES ('7', '西安', '94', 'xian', 'x', '0');
INSERT INTO `onethink_city` VALUES ('8', '杭州', '93', 'hangzhou', 'h', '0');
INSERT INTO `onethink_city` VALUES ('9', '天津', '92', 'tianjin', 't', '0');
INSERT INTO `onethink_city` VALUES ('10', '青岛', '96', 'qingdao', 'q', '0');
INSERT INTO `onethink_city` VALUES ('11', '南京', '90', 'nanjing', 'n', '0');
INSERT INTO `onethink_city` VALUES ('12', '郑州', '89', 'zhengzhou', 'z', '0');
INSERT INTO `onethink_city` VALUES ('13', '合肥', '88', 'hefei', 'h', '0');
INSERT INTO `onethink_city` VALUES ('14', '重庆', '87', 'chongqing', 'c', '0');
INSERT INTO `onethink_city` VALUES ('15', '长沙', '86', 'changsha', 'c', '0');
INSERT INTO `onethink_city` VALUES ('16', '沈阳', '85', 'shenyang', 's', '0');
INSERT INTO `onethink_city` VALUES ('17', '大连', '84', 'dalian', 'd', '0');
INSERT INTO `onethink_city` VALUES ('18', '南通', '83', 'nantong', 'n', '0');
INSERT INTO `onethink_city` VALUES ('19', '长春', '82', 'changchun', 'c', '0');
INSERT INTO `onethink_city` VALUES ('20', '南宁', '81', 'nanning', 'n', '0');
INSERT INTO `onethink_city` VALUES ('21', '福州', '80', 'fuzhou', 'f', '0');
INSERT INTO `onethink_city` VALUES ('22', '无锡', '79', 'wuxi', 'w', '0');
INSERT INTO `onethink_city` VALUES ('23', '常州', '78', 'changzhou', 'c', '0');
INSERT INTO `onethink_city` VALUES ('24', '厦门', '77', 'xiamen', 'x', '0');
INSERT INTO `onethink_city` VALUES ('25', '济南', '76', 'jinan', 'j', '0');
INSERT INTO `onethink_city` VALUES ('26', '南昌', '75', 'nanchang', 'n', '0');
INSERT INTO `onethink_city` VALUES ('27', '大庆', '74', 'daqing', 'd', '0');
INSERT INTO `onethink_city` VALUES ('28', '荆州', '73', 'jingzhou', 'j', '0');
INSERT INTO `onethink_city` VALUES ('29', '石家庄', '72', 'shijiazhuang', 's', '0');
INSERT INTO `onethink_city` VALUES ('30', '昆明', '72', 'kunming', 'k', '0');
INSERT INTO `onethink_city` VALUES ('31', '宁波', '71', 'ningbo', 'n', '0');
INSERT INTO `onethink_city` VALUES ('32', '苏州', '70', 'suzhou', 's', '0');
INSERT INTO `onethink_city` VALUES ('33', '海口', '69', 'haikou', 'h', '0');
INSERT INTO `onethink_city` VALUES ('34', '哈尔滨', '68', 'haerbin', 'h', '0');
INSERT INTO `onethink_city` VALUES ('159', '全国', '1101', 'quanguo', 'q', '0');
INSERT INTO `onethink_city` VALUES ('165', '运城', '0', 'yuncheng', 'y', '0');
INSERT INTO `onethink_city` VALUES ('163', '东莞', '0', 'dongguan', 'd', '0');
INSERT INTO `onethink_city` VALUES ('166', '安庆', '0', 'anqing', 'a', '0');
INSERT INTO `onethink_city` VALUES ('167', '鞍山', '0', 'anshan', 'a', '0');
INSERT INTO `onethink_city` VALUES ('168', '安顺', '0', 'anshun', 'a', '0');
INSERT INTO `onethink_city` VALUES ('169', '安阳', '0', 'anyang', 'a', '0');
INSERT INTO `onethink_city` VALUES ('172', '蚌埠', '0', 'bengbu', 'b', '0');
INSERT INTO `onethink_city` VALUES ('171', '保定', '0', 'baoding', 'b', '0');
INSERT INTO `onethink_city` VALUES ('173', '包头', '0', 'baotou', 'b', '0');
INSERT INTO `onethink_city` VALUES ('174', '宝鸡', '0', 'baoji', 'b', '0');
INSERT INTO `onethink_city` VALUES ('176', '承德', '0', 'chengde', 'c', '0');
INSERT INTO `onethink_city` VALUES ('177', '从化', '0', 'conghua', 'c', '0');
INSERT INTO `onethink_city` VALUES ('178', '赤峰', '0', 'chifeng', 'c', '0');
INSERT INTO `onethink_city` VALUES ('179', '池州', '0', 'chizhou', 'c', '0');
INSERT INTO `onethink_city` VALUES ('180', '沧州', '0', 'cangzhou', 'c', '0');
INSERT INTO `onethink_city` VALUES ('181', '郴州', '0', 'chenzhou', 'c', '0');
INSERT INTO `onethink_city` VALUES ('182', '常德', '0', 'changde', 'c', '0');
INSERT INTO `onethink_city` VALUES ('183', '潮州', '0', 'chaozhou', 'c', '0');
INSERT INTO `onethink_city` VALUES ('184', '巢湖', '0', 'chaohu', 'c', '0');
INSERT INTO `onethink_city` VALUES ('185', '常熟', '0', 'changshu', 'c', '0');
INSERT INTO `onethink_city` VALUES ('186', '大同', '0', 'datong', 'd', '0');
INSERT INTO `onethink_city` VALUES ('187', '大理', '0', 'dali', 'd', '0');
INSERT INTO `onethink_city` VALUES ('188', '东营', '0', 'dongying', 'd', '0');
INSERT INTO `onethink_city` VALUES ('189', '德州', '0', 'dezhou', 'd', '0');
INSERT INTO `onethink_city` VALUES ('190', '鄂尔多斯', '0', 'eerduosi', 'e', '0');
INSERT INTO `onethink_city` VALUES ('191', '鄂州', '0', 'ezhou', 'e', '0');
INSERT INTO `onethink_city` VALUES ('192', '佛山', '0', 'foshan', 'f', '0');
INSERT INTO `onethink_city` VALUES ('193', '抚顺', '0', 'fushui', 'f', '0');
INSERT INTO `onethink_city` VALUES ('194', '阜阳', '0', 'fiuyong', 'f', '0');
INSERT INTO `onethink_city` VALUES ('195', '涪陵', '0', 'fuling', 'f', '0');
INSERT INTO `onethink_city` VALUES ('196', '贵阳', '0', 'guiyang', 'g', '0');
INSERT INTO `onethink_city` VALUES ('197', '桂林', '0', 'guilin', 'g', '0');
INSERT INTO `onethink_city` VALUES ('198', '赣州', '0', 'ganzhou', 'g', '0');
INSERT INTO `onethink_city` VALUES ('199', '邯郸', '0', 'handan', 'h', '0');
INSERT INTO `onethink_city` VALUES ('200', '衡阳', '0', 'hengyang', 'h', '0');
INSERT INTO `onethink_city` VALUES ('201', '呼和浩特', '0', 'huhehaote', 'h', '0');
INSERT INTO `onethink_city` VALUES ('202', '葫芦岛', '0', 'huludao', 'h', '0');
INSERT INTO `onethink_city` VALUES ('203', '惠州', '0', 'huizhou', 'h', '0');
INSERT INTO `onethink_city` VALUES ('204', '花都', '0', 'huadu', 'h', '0');
INSERT INTO `onethink_city` VALUES ('205', '黄山', '0', 'huangshan', 'h', '0');
INSERT INTO `onethink_city` VALUES ('206', '淮北', '0', 'huaibei', 'h', '0');
INSERT INTO `onethink_city` VALUES ('207', '湖州', '0', 'huzhou', 'h', '0');
INSERT INTO `onethink_city` VALUES ('208', '海宁', '0', 'haining', 'h', '0');
INSERT INTO `onethink_city` VALUES ('209', '淮南', '0', 'huainan', 'h', '0');
INSERT INTO `onethink_city` VALUES ('210', '济宁', '0', 'jining', 'j', '0');
INSERT INTO `onethink_city` VALUES ('211', '金华', '0', 'jinhua', 'j', '0');
INSERT INTO `onethink_city` VALUES ('212', '焦作', '0', 'jiaozuo', 'j', '0');
INSERT INTO `onethink_city` VALUES ('213', '吉林', '0', 'jilin', 'j', '0');
INSERT INTO `onethink_city` VALUES ('214', '锦州', '0', 'jinzhou', 'j', '0');
INSERT INTO `onethink_city` VALUES ('215', '江门', '0', 'jiangmei', 'j', '0');
INSERT INTO `onethink_city` VALUES ('216', '嘉兴', '0', 'jiaxing', 'j', '0');
INSERT INTO `onethink_city` VALUES ('217', '晋江', '0', 'jinjiang', 'j', '0');
INSERT INTO `onethink_city` VALUES ('218', '晋中', '0', 'jinzhong', 'j', '0');
INSERT INTO `onethink_city` VALUES ('219', '江宁', '0', 'jiangning', 'j', '0');
INSERT INTO `onethink_city` VALUES ('220', '江阴', '0', 'jiangyin', 'j', '0');
INSERT INTO `onethink_city` VALUES ('221', '景德镇', '0', 'jingdezhen', 'j', '0');
INSERT INTO `onethink_city` VALUES ('222', '吉安', '0', 'jian', 'j', '0');
INSERT INTO `onethink_city` VALUES ('223', '九江', '0', 'jiujiang', 'j', '0');
INSERT INTO `onethink_city` VALUES ('224', '昆山', '0', 'kuishan', 'k', '0');
INSERT INTO `onethink_city` VALUES ('225', '兰州', '0', 'lanzhou', 'l', '0');
INSERT INTO `onethink_city` VALUES ('226', '拉萨', '0', 'lasa', 'l', '0');
INSERT INTO `onethink_city` VALUES ('227', '连云港', '0', 'lianyungang', 'l', '0');
INSERT INTO `onethink_city` VALUES ('228', '廊坊', '0', 'langfang', 'l', '0');
INSERT INTO `onethink_city` VALUES ('229', '洛阳', '0', 'luoyang', 'l', '0');
INSERT INTO `onethink_city` VALUES ('230', '临沂', '0', 'linxi', 'l', '0');
INSERT INTO `onethink_city` VALUES ('231', '临汾', '0', 'linfen', 'l', '0');
INSERT INTO `onethink_city` VALUES ('232', '莱芜', '0', 'laiwu', 'l', '0');
INSERT INTO `onethink_city` VALUES ('233', '柳州', '0', 'liuzhou', 'l', '0');
INSERT INTO `onethink_city` VALUES ('234', '龙岩', '0', 'longyan', 'l', '0');
INSERT INTO `onethink_city` VALUES ('235', '聊城', '0', 'liaocheng', 'l', '0');
INSERT INTO `onethink_city` VALUES ('236', '马鞍山', '0', 'maanshan', 'm', '0');
INSERT INTO `onethink_city` VALUES ('237', '绵阳', '0', 'mianyang', 'm', '0');
INSERT INTO `onethink_city` VALUES ('238', '茂名', '0', 'maoming', 'm', '0');
INSERT INTO `onethink_city` VALUES ('239', '南阳', '0', 'nanyang', 'n', '0');
INSERT INTO `onethink_city` VALUES ('240', '宁德', '0', 'ningde', 'n', '0');
INSERT INTO `onethink_city` VALUES ('241', '盘锦', '0', 'panjin', 'p', '0');
INSERT INTO `onethink_city` VALUES ('242', '番禺', '0', 'panyu', 'p', '0');
INSERT INTO `onethink_city` VALUES ('243', '萍乡', '0', 'pingxiang', 'p', '0');
INSERT INTO `onethink_city` VALUES ('244', '莆田', '0', 'putian', 'p', '0');
INSERT INTO `onethink_city` VALUES ('245', '泉州', '0', 'quanzhou', 'q', '0');
INSERT INTO `onethink_city` VALUES ('246', '齐齐哈尔', '0', 'qiqihaer', 'q', '0');
INSERT INTO `onethink_city` VALUES ('247', '秦皇岛', '0', 'qinhuangdao', 'q', '0');
INSERT INTO `onethink_city` VALUES ('248', '曲靖', '0', 'qujing', 'q', '0');
INSERT INTO `onethink_city` VALUES ('249', '清远', '0', 'qingyuan', 'q', '0');
INSERT INTO `onethink_city` VALUES ('250', '日照', '0', 'rizhao', 'r', '0');
INSERT INTO `onethink_city` VALUES ('251', '三亚', '0', 'sanya', 's', '0');
INSERT INTO `onethink_city` VALUES ('252', '绍兴', '0', 'shaoxing', 's', '0');
INSERT INTO `onethink_city` VALUES ('253', '汕头', '0', 'shantou', 's', '0');
INSERT INTO `onethink_city` VALUES ('254', '顺德', '0', 'shunde', 's', '0');
INSERT INTO `onethink_city` VALUES ('255', '宿迁', '0', 'suqian', 's', '0');
INSERT INTO `onethink_city` VALUES ('256', '韶关', '0', 'shaoguan', 's', '0');
INSERT INTO `onethink_city` VALUES ('257', '上饶', '0', 'shangrao', 's', '0');
INSERT INTO `onethink_city` VALUES ('258', '十堰', '0', 'shiyan', 's', '0');
INSERT INTO `onethink_city` VALUES ('259', '唐山', '0', 'tangshan', 't', '0');
INSERT INTO `onethink_city` VALUES ('260', '太原', '0', 'taiyuan', 't', '0');
INSERT INTO `onethink_city` VALUES ('261', '塘沽', '0', 'tanggu', 't', '0');
INSERT INTO `onethink_city` VALUES ('262', '泰安', '0', 'taian', 't', '0');
INSERT INTO `onethink_city` VALUES ('263', '通辽', '0', 'tongliao', 't', '0');
INSERT INTO `onethink_city` VALUES ('264', '铜陵', '0', 'tongling', 't', '0');
INSERT INTO `onethink_city` VALUES ('265', '台州', '0', 'taizhou', 't', '0');
INSERT INTO `onethink_city` VALUES ('266', '台湾', '0', 'taiwan', 't', '0');
INSERT INTO `onethink_city` VALUES ('267', '温州', '0', 'weizhou', 'w', '0');
INSERT INTO `onethink_city` VALUES ('268', '潍坊', '0', 'weifang', 'w', '0');
INSERT INTO `onethink_city` VALUES ('269', '芜湖', '0', 'wuhu', 'w', '0');
INSERT INTO `onethink_city` VALUES ('270', '威海', '0', 'weihai', 'w', '0');
INSERT INTO `onethink_city` VALUES ('271', '乌鲁木齐', '0', 'wulumuqi', 'w', '0');
INSERT INTO `onethink_city` VALUES ('272', '咸阳', '0', 'xianyang', 'x', '0');
INSERT INTO `onethink_city` VALUES ('273', '湘潭', '0', 'xiangtan', 'x', '0');
INSERT INTO `onethink_city` VALUES ('274', '西宁', '0', 'xining', 'x', '0');
INSERT INTO `onethink_city` VALUES ('275', '徐州', '0', 'xuzhou', 'x', '0');
INSERT INTO `onethink_city` VALUES ('276', '信阳', '0', 'xinyang', 'x', '0');
INSERT INTO `onethink_city` VALUES ('277', '新乡', '0', 'xinxiang', 'x', '0');
INSERT INTO `onethink_city` VALUES ('278', '新余', '0', 'xinyu', 'x', '0');
INSERT INTO `onethink_city` VALUES ('279', '襄阳', '0', 'xiangyang', 'x', '0');
INSERT INTO `onethink_city` VALUES ('280', '香港', '0', 'xianggang', 'x', '0');
INSERT INTO `onethink_city` VALUES ('281', '邢台', '0', 'xingtai', 'x', '0');
INSERT INTO `onethink_city` VALUES ('282', '烟台', '0', 'yantai', 'y', '0');
INSERT INTO `onethink_city` VALUES ('283', '银川', '0', 'yinchuan', 'y', '0');
INSERT INTO `onethink_city` VALUES ('284', '宜昌', '0', 'yichang', 'y', '0');
INSERT INTO `onethink_city` VALUES ('285', '扬州', '0', 'yangzhou', 'y', '0');
INSERT INTO `onethink_city` VALUES ('286', '盐城', '0', 'yancheng', 'y', '0');
INSERT INTO `onethink_city` VALUES ('287', '玉林', '0', 'yulin', 'y', '0');
INSERT INTO `onethink_city` VALUES ('288', '岳阳', '0', 'yueyang', 'y', '0');
INSERT INTO `onethink_city` VALUES ('289', '宜宾', '0', 'yibin', 'y', '0');
INSERT INTO `onethink_city` VALUES ('290', '义乌', '0', 'yiwu', 'y', '0');
INSERT INTO `onethink_city` VALUES ('291', '珠海', '0', 'zhuhai', 'z', '0');
INSERT INTO `onethink_city` VALUES ('292', '淄博', '0', 'zibo', 'z', '0');
INSERT INTO `onethink_city` VALUES ('293', '中山', '0', 'zhongshan', 'z', '0');
INSERT INTO `onethink_city` VALUES ('294', '漳州', '0', 'zhangzhou', 'z', '0');
INSERT INTO `onethink_city` VALUES ('295', '湛江', '0', 'zhanjiang', 'z', '0');
INSERT INTO `onethink_city` VALUES ('296', '镇江', '0', 'zhenjiang', 'z', '0');
INSERT INTO `onethink_city` VALUES ('297', '张家口', '0', 'zhangjiahou', 'z', '0');
INSERT INTO `onethink_city` VALUES ('298', '株洲', '0', 'zhuzhou', 'z', '0');
INSERT INTO `onethink_city` VALUES ('299', '肇庆', '0', 'zhaoqing', 'z', '0');
INSERT INTO `onethink_city` VALUES ('300', '张家港', '0', 'zhangjiagang', 'z', '0');
