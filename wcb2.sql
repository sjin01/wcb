/*
 mac 连公司库  从公司库导出, 地区数据不全

Source Server         : 172.16.17.115@daj
Source Server Version : 50530
Source Host           : 172.16.17.115:3306
Source Database       : un02

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2017-02-24 11:39:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `addr` varchar(512) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `street` int(11) DEFAULT NULL,
  `community` int(11) DEFAULT NULL,
  `communityname` varchar(512) DEFAULT NULL,
  `ridgepole` varchar(64) DEFAULT NULL,
  `household` varchar(64) DEFAULT NULL,
  `peoplenumber` int(11) DEFAULT NULL,
  `card` varchar(512) DEFAULT NULL,
  `distid` int(11) DEFAULT NULL,
  `signindate` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `note` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='业主用户';

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('1', null, '54321', '12341234栋1234户', '11', '1101', '110101', '110101002', null, '1234', '1234', '1234', null, '1231234', null, '2017-02-20 16:41:33', null, '54321123', '1234');
INSERT INTO `t_account` VALUES ('2', null, '654321', '5432543栋543户', '11', '1101', '110101', '110101008', null, '5432', '543', '543', null, '53421', null, '2017-02-20 16:45:47', null, '564321', '1');
INSERT INTO `t_account` VALUES ('4', null, '8888', '5654456栋456户', '12', '1202', '120223', '120223105', null, '5654', '456', '456', null, '56757', null, '2017-02-20 17:40:47', null, '78676', null);
INSERT INTO `t_account` VALUES ('5', null, '009', '88栋8户', '11', '1101', '110101', '110101002', null, '8', '8', '8', null, '8989', null, '2017-02-21 18:46:59', null, '89', null);

-- ----------------------------
-- Table structure for t_account_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_account_equipment`;
CREATE TABLE `t_account_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `invaliddate` datetime DEFAULT NULL COMMENT '就是作废时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '1当前启用；0作废',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='中间关系表';

-- ----------------------------
-- Records of t_account_equipment
-- ----------------------------
INSERT INTO `t_account_equipment` VALUES ('1', '1', null, '2017-02-20 16:41:33', null, null);
INSERT INTO `t_account_equipment` VALUES ('2', '2', null, '2017-02-20 16:45:47', null, null);
INSERT INTO `t_account_equipment` VALUES ('3', '3', null, '2017-02-20 16:48:34', null, null);
INSERT INTO `t_account_equipment` VALUES ('4', '4', null, '2017-02-20 17:40:47', null, null);
INSERT INTO `t_account_equipment` VALUES ('5', '5', '5', '2017-02-21 18:46:59', null, '1');

-- ----------------------------
-- Table structure for t_community
-- ----------------------------
DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `street` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区';

-- ----------------------------
-- Records of t_community
-- ----------------------------

-- ----------------------------
-- Table structure for t_district
-- ----------------------------
DROP TABLE IF EXISTS `t_district`;
CREATE TABLE `t_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '比如：某某小区',
  `remark` varchar(512) DEFAULT NULL COMMENT '比如：12栋',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作员对用户应分成片区来管理 可以想象成:水表用户组';

-- ----------------------------
-- Records of t_district
-- ----------------------------

-- ----------------------------
-- Table structure for t_district_user
-- ----------------------------
DROP TABLE IF EXISTS `t_district_user`;
CREATE TABLE `t_district_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `distid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='描述一个片区归哪些操作员维护; 一个操作员能维护哪些片区';

-- ----------------------------
-- Records of t_district_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1水表、2电表',
  `manufacturers` varchar(64) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
INSERT INTO `t_equipment` VALUES ('4', '44', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('5', '6543', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('6', '777', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('7', '123123', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('8', '123', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('9', '123', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('12', 'asd', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('13', 'asdf', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('14', 'asdf', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('15', 'fsdfasdf', null, null, null, null);
INSERT INTO `t_equipment` VALUES ('16', 'fff', null, null, null, null);

-- ----------------------------
-- Table structure for t_prov_city_area_street
-- ----------------------------
DROP TABLE IF EXISTS `t_prov_city_area_street`;
CREATE TABLE `t_prov_city_area_street` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(11) DEFAULT NULL,
  `parentId` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47496 DEFAULT CHARSET=utf8 COMMENT='全国省市区街道';

-- ----------------------------
-- Records of t_prov_city_area_street
-- ----------------------------
INSERT INTO `t_prov_city_area_street` VALUES ('1', '11', '0', '北京市', '1');
INSERT INTO `t_prov_city_area_street` VALUES ('2', '1101', '11', '市辖区', '2');
INSERT INTO `t_prov_city_area_street` VALUES ('3', '110101', '1101', '东城区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('4', '110101001', '110101', '东华门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('5', '110101002', '110101', '景山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('6', '110101003', '110101', '交道口街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('7', '110101004', '110101', '安定门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('8', '110101005', '110101', '北新桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('9', '110101006', '110101', '东四街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('10', '110101007', '110101', '朝阳门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('11', '110101008', '110101', '建国门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('12', '110101009', '110101', '东直门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('13', '110101010', '110101', '和平里街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('14', '110102', '1101', '西城区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('15', '110102001', '110102', '西长安街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('16', '110102003', '110102', '新街口街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('17', '110102007', '110102', '月坛街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('18', '110102009', '110102', '展览路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('19', '110102010', '110102', '德胜街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('20', '110102011', '110102', '金融街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('21', '110102012', '110102', '什刹海街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('22', '110103', '1101', '崇文区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('23', '110103001', '110103', '前门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('24', '110103002', '110103', '崇文门外街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('25', '110103003', '110103', '东花市街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('26', '110103004', '110103', '龙潭街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('27', '110103005', '110103', '体育馆路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('28', '110103006', '110103', '天坛街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('29', '110103007', '110103', '永定门外街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('30', '110104', '1101', '宣武区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('31', '110104001', '110104', '大栅栏街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('32', '110104002', '110104', '天桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('33', '110104003', '110104', '椿树街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('34', '110104004', '110104', '陶然亭街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('35', '110104005', '110104', '广安门内街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('36', '110104006', '110104', '牛街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('37', '110104007', '110104', '白纸坊街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('38', '110104008', '110104', '广安门外街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('39', '110105', '1101', '朝阳区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('40', '110105001', '110105', '建外街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('41', '110105002', '110105', '朝外街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('42', '110105003', '110105', '呼家楼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('43', '110105004', '110105', '三里屯街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('44', '110105005', '110105', '左家庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('45', '110105006', '110105', '香河园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('46', '110105007', '110105', '和平街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('47', '110105008', '110105', '安贞街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('48', '110105009', '110105', '亚运村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('49', '110105010', '110105', '小关街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('50', '110105011', '110105', '酒仙桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('51', '110105012', '110105', '麦子店街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('52', '110105013', '110105', '团结湖街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('53', '110105014', '110105', '六里屯街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('54', '110105015', '110105', '八里庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('55', '110105016', '110105', '双井街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('56', '110105017', '110105', '劲松街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('57', '110105018', '110105', '潘家园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('58', '110105019', '110105', '垡头街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('59', '110105021', '110105', '南磨房地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('60', '110105022', '110105', '高碑店地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('61', '110105023', '110105', '将台地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('62', '110105024', '110105', '太阳宫地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('63', '110105025', '110105', '大屯街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('64', '110105026', '110105', '望京街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('65', '110105027', '110105', '小红门地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('66', '110105028', '110105', '十八里店地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('67', '110105029', '110105', '平房地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('68', '110105030', '110105', '东风地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('69', '110105031', '110105', '奥运村地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('70', '110105032', '110105', '来广营地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('71', '110105033', '110105', '常营回族地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('72', '110105034', '110105', '三间房地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('73', '110105035', '110105', '管庄地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('74', '110105036', '110105', '金盏地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('75', '110105037', '110105', '孙河地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('76', '110105038', '110105', '崔各庄地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('77', '110105039', '110105', '东坝地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('78', '110105040', '110105', '黑庄户地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('79', '110105041', '110105', '豆各庄地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('80', '110105042', '110105', '王四营地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('81', '110105400', '110105', '首都机场街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('82', '110105501', '110105', '望京开发街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('83', '110106', '1101', '丰台区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('84', '110106001', '110106', '右安门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('85', '110106002', '110106', '太平桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('86', '110106003', '110106', '西罗园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('87', '110106004', '110106', '大红门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('88', '110106005', '110106', '南苑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('89', '110106006', '110106', '东高地街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('90', '110106007', '110106', '东铁匠营街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('91', '110106008', '110106', '卢沟桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('92', '110106009', '110106', '丰台街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('93', '110106010', '110106', '新村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('94', '110106011', '110106', '长辛店街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('95', '110106012', '110106', '云岗街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('96', '110106013', '110106', '方庄地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('97', '110106014', '110106', '宛平城地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('98', '110106015', '110106', '马家堡街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('99', '110106016', '110106', '和义街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('100', '110106100', '110106', '长辛店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('101', '110106101', '110106', '王佐镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('102', '110106201', '110106', '卢沟桥乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('103', '110106202', '110106', '花乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('104', '110106203', '110106', '南苑乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('105', '110107', '1101', '石景山区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('106', '110107001', '110107', '八宝山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('107', '110107002', '110107', '老山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('108', '110107003', '110107', '八角街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('109', '110107004', '110107', '古城街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('110', '110107005', '110107', '苹果园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('111', '110107006', '110107', '金顶街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('112', '110107009', '110107', '广宁街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('113', '110107010', '110107', '五里坨街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('114', '110107011', '110107', '鲁谷社区行政事务管理中心', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('115', '110108', '1101', '海淀区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('116', '110108001', '110108', '万寿路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('117', '110108002', '110108', '永定路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('118', '110108003', '110108', '羊坊店街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('119', '110108004', '110108', '甘家口街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('120', '110108005', '110108', '八里庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('121', '110108006', '110108', '紫竹院街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('122', '110108007', '110108', '北下关街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('123', '110108008', '110108', '北太平庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('124', '110108010', '110108', '学院路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('125', '110108011', '110108', '中关村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('126', '110108012', '110108', '海淀街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('127', '110108013', '110108', '青龙桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('128', '110108014', '110108', '清华园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('129', '110108015', '110108', '燕园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('130', '110108016', '110108', '香山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('131', '110108017', '110108', '清河街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('132', '110108018', '110108', '花园路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('133', '110108019', '110108', '西三旗街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('134', '110108020', '110108', '马连洼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('135', '110108021', '110108', '田村路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('136', '110108022', '110108', '上地街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('137', '110108023', '110108', '万柳地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('138', '110108024', '110108', '东升地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('139', '110108025', '110108', '曙光街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('140', '110108101', '110108', '温泉镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('141', '110108102', '110108', '四季青镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('142', '110108103', '110108', '西北旺镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('143', '110108104', '110108', '苏家坨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('144', '110108105', '110108', '上庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('145', '110109', '1101', '门头沟区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('146', '110109001', '110109', '大峪街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('147', '110109002', '110109', '城子街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('148', '110109003', '110109', '东辛房街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('149', '110109004', '110109', '大台街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('150', '110109005', '110109', '王平地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('151', '110109101', '110109', '潭柘寺镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('152', '110109102', '110109', '永定镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('153', '110109103', '110109', '龙泉镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('154', '110109104', '110109', '军庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('155', '110109105', '110109', '雁翅镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('156', '110109106', '110109', '斋堂镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('157', '110109107', '110109', '清水镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('158', '110109108', '110109', '妙峰山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('159', '110111', '1101', '房山区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('160', '110111001', '110111', '城关街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('161', '110111002', '110111', '新镇街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('162', '110111004', '110111', '向阳街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('163', '110111005', '110111', '东风街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('164', '110111006', '110111', '迎风街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('165', '110111007', '110111', '星城街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('166', '110111008', '110111', '良乡地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('167', '110111009', '110111', '周口店地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('168', '110111010', '110111', '琉璃河地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('169', '110111011', '110111', '拱辰街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('170', '110111012', '110111', '西潞街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('171', '110111101', '110111', '阎村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('172', '110111103', '110111', '窦店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('173', '110111104', '110111', '石楼镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('174', '110111105', '110111', '长阳镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('175', '110111107', '110111', '河北镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('176', '110111108', '110111', '长沟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('177', '110111109', '110111', '大石窝镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('178', '110111110', '110111', '张坊镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('179', '110111111', '110111', '十渡镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('180', '110111112', '110111', '青龙湖镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('181', '110111115', '110111', '韩村河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('182', '110111208', '110111', '霞云岭乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('183', '110111209', '110111', '南窖乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('184', '110111210', '110111', '佛子庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('185', '110111211', '110111', '大安山乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('186', '110111212', '110111', '史家营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('187', '110111213', '110111', '蒲洼乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('188', '110112', '1101', '通州区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('189', '110112001', '110112', '中仓街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('190', '110112002', '110112', '新华街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('191', '110112003', '110112', '北苑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('192', '110112004', '110112', '玉桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('193', '110112005', '110112', '永顺地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('194', '110112006', '110112', '梨园地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('195', '110112104', '110112', '宋庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('196', '110112105', '110112', '张家湾镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('197', '110112106', '110112', '漷县镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('198', '110112109', '110112', '马驹桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('199', '110112110', '110112', '西集镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('200', '110112114', '110112', '台湖镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('201', '110112117', '110112', '永乐店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('202', '110112119', '110112', '潞城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('203', '110112209', '110112', '于家务回族乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('204', '110113', '1101', '顺义区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('205', '110113001', '110113', '胜利街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('206', '110113002', '110113', '光明街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('207', '110113003', '110113', '仁和地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('208', '110113004', '110113', '后沙峪地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('209', '110113005', '110113', '天竺地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('210', '110113006', '110113', '杨镇地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('211', '110113007', '110113', '牛栏山地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('212', '110113008', '110113', '南法信地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('213', '110113009', '110113', '马坡地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('214', '110113010', '110113', '石园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('215', '110113101', '110113', '高丽营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('216', '110113104', '110113', '李桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('217', '110113105', '110113', '李遂镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('218', '110113106', '110113', '南彩镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('219', '110113108', '110113', '北务镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('220', '110113109', '110113', '大孙各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('221', '110113110', '110113', '张镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('222', '110113111', '110113', '龙湾屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('223', '110113112', '110113', '木林镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('224', '110113113', '110113', '北小营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('225', '110113115', '110113', '北石槽镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('226', '110113116', '110113', '赵全营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('227', '110114', '1101', '昌平区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('228', '110114001', '110114', '城北街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('229', '110114002', '110114', '南口地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('230', '110114003', '110114', '马池口地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('231', '110114004', '110114', '沙河地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('232', '110114005', '110114', '城南街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('233', '110114006', '110114', '回龙观地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('234', '110114007', '110114', '东小口地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('235', '110114104', '110114', '阳坊镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('236', '110114110', '110114', '小汤山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('237', '110114111', '110114', '南邵镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('238', '110114112', '110114', '崔村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('239', '110114113', '110114', '百善镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('240', '110114115', '110114', '北七家镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('241', '110114116', '110114', '兴寿镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('242', '110114117', '110114', '长陵镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('243', '110114118', '110114', '流村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('244', '110114119', '110114', '十三陵镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('245', '110115', '1101', '大兴区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('246', '110115001', '110115', '兴丰街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('247', '110115002', '110115', '林校路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('248', '110115003', '110115', '清源街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('249', '110115004', '110115', '亦庄地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('250', '110115005', '110115', '黄村地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('251', '110115006', '110115', '旧宫地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('252', '110115007', '110115', '西红门地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('253', '110115103', '110115', '青云店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('254', '110115104', '110115', '采育镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('255', '110115105', '110115', '安定镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('256', '110115106', '110115', '礼贤镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('257', '110115107', '110115', '榆垡镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('258', '110115108', '110115', '庞各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('259', '110115109', '110115', '北臧村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('260', '110115110', '110115', '魏善庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('261', '110115111', '110115', '长子营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('262', '110115112', '110115', '瀛海镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('263', '110115403', '110115', '亦庄开发区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('264', '110116', '1101', '怀柔区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('265', '110116001', '110116', '泉河街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('266', '110116002', '110116', '龙山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('267', '110116003', '110116', '怀柔地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('268', '110116004', '110116', '雁栖地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('269', '110116005', '110116', '庙城地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('270', '110116102', '110116', '北房镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('271', '110116103', '110116', '杨宋镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('272', '110116105', '110116', '桥梓镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('273', '110116106', '110116', '怀北镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('274', '110116107', '110116', '汤河口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('275', '110116108', '110116', '渤海镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('276', '110116109', '110116', '九渡河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('277', '110116110', '110116', '琉璃庙镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('278', '110116111', '110116', '宝山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('279', '110116211', '110116', '长哨营满族乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('280', '110116213', '110116', '喇叭沟门满族乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('281', '110117', '1101', '平谷区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('282', '110117001', '110117', '滨河街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('283', '110117002', '110117', '兴谷街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('284', '110117003', '110117', '渔阳地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('285', '110117004', '110117', '峪口地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('286', '110117005', '110117', '马坊地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('287', '110117006', '110117', '金海湖地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('288', '110117101', '110117', '东高村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('289', '110117102', '110117', '山东庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('290', '110117104', '110117', '南独乐河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('291', '110117105', '110117', '大华山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('292', '110117106', '110117', '夏各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('293', '110117108', '110117', '马昌营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('294', '110117110', '110117', '王辛庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('295', '110117111', '110117', '大兴庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('296', '110117112', '110117', '刘家店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('297', '110117114', '110117', '镇罗营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('298', '110117213', '110117', '黄松峪乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('299', '110117214', '110117', '熊儿寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('300', '1102', '11', '县', '2');
INSERT INTO `t_prov_city_area_street` VALUES ('301', '110228', '1102', '密云县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('302', '110228001', '110228', '鼓楼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('303', '110228002', '110228', '果园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('304', '110228003', '110228', '檀营地区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('305', '110228100', '110228', '密云镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('306', '110228101', '110228', '溪翁庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('307', '110228102', '110228', '西田各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('308', '110228103', '110228', '十里堡镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('309', '110228104', '110228', '河南寨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('310', '110228105', '110228', '巨各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('311', '110228106', '110228', '穆家峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('312', '110228107', '110228', '太师屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('313', '110228108', '110228', '高岭镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('314', '110228109', '110228', '不老屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('315', '110228110', '110228', '冯家峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('316', '110228111', '110228', '古北口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('317', '110228112', '110228', '大城子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('318', '110228113', '110228', '东邵渠镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('319', '110228114', '110228', '北庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('320', '110228115', '110228', '新城子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('321', '110228116', '110228', '石城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('322', '110229', '1102', '延庆县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('323', '110229100', '110229', '延庆镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('324', '110229101', '110229', '康庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('325', '110229102', '110229', '八达岭镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('326', '110229103', '110229', '永宁镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('327', '110229104', '110229', '旧县镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('328', '110229105', '110229', '张山营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('329', '110229106', '110229', '四海镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('330', '110229107', '110229', '千家店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('331', '110229108', '110229', '沈家营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('332', '110229109', '110229', '大榆树镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('333', '110229110', '110229', '井庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('334', '110229207', '110229', '大庄科乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('335', '110229209', '110229', '刘斌堡乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('336', '110229210', '110229', '香营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('337', '110229214', '110229', '珍珠泉乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('338', '12', '0', '天津市', '1');
INSERT INTO `t_prov_city_area_street` VALUES ('339', '1201', '12', '市辖区', '2');
INSERT INTO `t_prov_city_area_street` VALUES ('340', '120101', '1201', '和平区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('341', '120101001', '120101', '劝业场街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('342', '120101002', '120101', '小白楼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('343', '120101003', '120101', '体育馆街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('344', '120101004', '120101', '新兴街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('345', '120101005', '120101', '南营门社区街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('346', '120101006', '120101', '南市街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('347', '120102', '1201', '河东区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('348', '120102001', '120102', '大王庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('349', '120102002', '120102', '大直沽街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('350', '120102003', '120102', '中山门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('351', '120102004', '120102', '富民路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('352', '120102005', '120102', '二号桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('353', '120102006', '120102', '春华街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('354', '120102007', '120102', '唐家口街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('355', '120102008', '120102', '向阳楼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('356', '120102009', '120102', '常州道街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('357', '120102010', '120102', '上杭路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('358', '120102011', '120102', '东新街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('359', '120102012', '120102', '鲁山道街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('360', '120102013', '120102', '天津铁厂街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('361', '120103', '1201', '河西区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('362', '120103001', '120103', '大营门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('363', '120103002', '120103', '下瓦房街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('364', '120103003', '120103', '桃园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('365', '120103004', '120103', '挂甲寺街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('366', '120103005', '120103', '马场街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('367', '120103006', '120103', '越秀路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('368', '120103007', '120103', '友谊路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('369', '120103008', '120103', '天塔街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('370', '120103009', '120103', '尖山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('371', '120103010', '120103', '陈塘庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('372', '120103011', '120103', '柳林街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('373', '120103012', '120103', '东海街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('374', '120103400', '120103', '梅江虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('375', '120104', '1201', '南开区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('376', '120104001', '120104', '长虹街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('377', '120104002', '120104', '鼓楼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('378', '120104003', '120104', '兴南街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('379', '120104004', '120104', '广开街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('380', '120104005', '120104', '万兴街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('381', '120104006', '120104', '学府街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('382', '120104007', '120104', '向阳路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('383', '120104008', '120104', '嘉陵道街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('384', '120104009', '120104', '王顶堤街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('385', '120104010', '120104', '水上公园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('386', '120104011', '120104', '体育中心街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('387', '120104012', '120104', '华苑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('388', '120105', '1201', '河北区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('389', '120105001', '120105', '光复道街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('390', '120105002', '120105', '望海楼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('391', '120105003', '120105', '鸿顺里街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('392', '120105004', '120105', '新开河街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('393', '120105005', '120105', '铁东路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('394', '120105006', '120105', '建昌道街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('395', '120105007', '120105', '宁园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('396', '120105008', '120105', '王串场街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('397', '120105009', '120105', '江都路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('398', '120105010', '120105', '月牙河街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('399', '120106', '1201', '红桥区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('400', '120106001', '120106', '西于庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('401', '120106002', '120106', '双环村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('402', '120106003', '120106', '咸阳北路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('403', '120106004', '120106', '丁字沽街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('404', '120106005', '120106', '西沽街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('405', '120106006', '120106', '三条石街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('406', '120106008', '120106', '邵公庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('407', '120106009', '120106', '芥园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('408', '120106010', '120106', '铃铛阁街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('409', '120106011', '120106', '大胡同街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('410', '120107', '1201', '塘沽区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('411', '120107001', '120107', '新村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('412', '120107002', '120107', '解放路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('413', '120107003', '120107', '三槐路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('414', '120107004', '120107', '新港街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('415', '120107005', '120107', '向阳街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('416', '120107006', '120107', '杭州道街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('417', '120107007', '120107', '新河街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('418', '120107008', '120107', '大沽街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('419', '120107009', '120107', '北塘街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('420', '120107010', '120107', '渤海石油街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('421', '120107011', '120107', '胡家园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('422', '120107100', '120107', '新城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('423', '120107400', '120107', '开发区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('424', '120107401', '120107', '保税区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('425', '120108', '1201', '汉沽区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('426', '120108001', '120108', '汉沽街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('427', '120108002', '120108', '寨上街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('428', '120108003', '120108', '河西街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('429', '120108005', '120108', '盐场街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('430', '120108100', '120108', '大田镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('431', '120108101', '120108', '杨家泊镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('432', '120108102', '120108', '茶淀镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('433', '120108103', '120108', '营城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('434', '120108400', '120108', '开发区汉沽化工小区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('435', '120109', '1201', '大港区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('436', '120109001', '120109', '迎宾街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('437', '120109002', '120109', '胜利街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('438', '120109003', '120109', '古林街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('439', '120109004', '120109', '海滨街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('440', '120109005', '120109', '港西街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('441', '120109100', '120109', '太平镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('442', '120109101', '120109', '小王庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('443', '120109102', '120109', '中塘镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('444', '120109450', '120109', '北大港农场虚拟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('445', '120110', '1201', '东丽区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('446', '120110001', '120110', '张贵庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('447', '120110002', '120110', '丰年村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('448', '120110003', '120110', '万新街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('449', '120110004', '120110', '无瑕街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('450', '120110005', '120110', '新立街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('451', '120110006', '120110', '华明街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('452', '120110102', '120110', '军粮城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('453', '120110105', '120110', '大毕庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('454', '120110200', '120110', '么六桥乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('455', '120110400', '120110', '开发区西区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('456', '120110401', '120110', '保税区空港国际物流区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('457', '120110402', '120110', '保税区空港国际物流加工区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('458', '120110403', '120110', '东丽区开发区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('459', '120110404', '120110', '东丽湖虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('460', '120111', '1201', '西青区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('461', '120111001', '120111', '西营门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('462', '120111002', '120111', '李七庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('463', '120111100', '120111', '中北镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('464', '120111101', '120111', '杨柳青镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('465', '120111102', '120111', '辛口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('466', '120111103', '120111', '张家窝镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('467', '120111104', '120111', '南河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('468', '120111105', '120111', '大寺镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('469', '120111106', '120111', '王稳庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('470', '120111400', '120111', '开发区西青微电子小区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('471', '120111401', '120111', '新技术产业园区虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('472', '120111450', '120111', '西青区开发区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('473', '120112', '1201', '津南区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('474', '120112100', '120112', '咸水沽镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('475', '120112101', '120112', '葛沽镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('476', '120112102', '120112', '小站镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('477', '120112103', '120112', '双港镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('478', '120112104', '120112', '辛庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('479', '120112106', '120112', '双桥河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('480', '120112107', '120112', '八里台镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('481', '120112108', '120112', '北闸口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('482', '120112400', '120112', '双林农场虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('483', '120112401', '120112', '铁路十八局虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('484', '120112402', '120112', '津南国家农业园区虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('485', '120112403', '120112', '长青办事处虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('486', '120112404', '120112', '津南开发区东区虚拟居街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('487', '120112405', '120112', '津南开发区西区虚拟居街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('488', '120113', '1201', '北辰区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('489', '120113001', '120113', '果园新村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('490', '120113002', '120113', '集贤里街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('491', '120113003', '120113', '普东街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('492', '120113004', '120113', '佳荣里街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('493', '120113100', '120113', '天穆镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('494', '120113101', '120113', '北仓镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('495', '120113102', '120113', '双街镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('496', '120113103', '120113', '双口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('497', '120113104', '120113', '青光镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('498', '120113106', '120113', '宜兴埠镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('499', '120113107', '120113', '小淀镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('500', '120113108', '120113', '大张庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('501', '120113111', '120113', '西堤头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('502', '120113451', '120113', '红旗农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('503', '120113452', '120113', '曙光农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('504', '120114', '1201', '武清区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('505', '120114001', '120114', '杨村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('506', '120114002', '120114', '下朱庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('507', '120114003', '120114', '东蒲洼街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('508', '120114004', '120114', '黄庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('509', '120114005', '120114', '徐官屯街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('510', '120114006', '120114', '运河西街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('511', '120114101', '120114', '梅厂镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('512', '120114102', '120114', '大碱厂镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('513', '120114103', '120114', '崔黄口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('514', '120114104', '120114', '大良镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('515', '120114105', '120114', '下伍旗镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('516', '120114106', '120114', '南蔡村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('517', '120114107', '120114', '大孟庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('518', '120114108', '120114', '泗村店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('519', '120114109', '120114', '河西务镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('520', '120114110', '120114', '城关镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('521', '120114111', '120114', '东马圈镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('522', '120114112', '120114', '黄花店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('523', '120114113', '120114', '石各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('524', '120114114', '120114', '王庆坨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('525', '120114115', '120114', '汊沽港镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('526', '120114116', '120114', '河北屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('527', '120114117', '120114', '上马台镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('528', '120114118', '120114', '大王古庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('529', '120114119', '120114', '陈咀镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('530', '120114203', '120114', '豆张庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('531', '120114206', '120114', '曹子里乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('532', '120114207', '120114', '大黄堡乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('533', '120114213', '120114', '高村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('534', '120114214', '120114', '白古屯乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('535', '120114400', '120114', '开发区武清逸仙园小区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('536', '120114401', '120114', '武清区开发区虚拟街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('537', '120114450', '120114', '武清农场虚拟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('538', '120115', '1201', '宝坻区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('539', '120115001', '120115', '海滨街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('540', '120115002', '120115', '宝平街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('541', '120115003', '120115', '钰华街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('542', '120115101', '120115', '大口屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('543', '120115102', '120115', '大白庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('544', '120115103', '120115', '王卜庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('545', '120115104', '120115', '方家庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('546', '120115105', '120115', '林亭口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('547', '120115106', '120115', '八门城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('548', '120115107', '120115', '大钟庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('549', '120115108', '120115', '新安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('550', '120115110', '120115', '马家店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('551', '120115111', '120115', '霍各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('552', '120115113', '120115', '新开口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('553', '120115115', '120115', '大唐庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('554', '120115117', '120115', '高家庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('555', '120115118', '120115', '口东镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('556', '120115119', '120115', '牛道口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('557', '120115120', '120115', '史各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('558', '120115121', '120115', '郝各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('559', '120115122', '120115', '周良庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('560', '120115204', '120115', '牛家牌乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('561', '120115207', '120115', '尔王庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('562', '120115210', '120115', '黄庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('563', '120115450', '120115', '里自沽农场虚拟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('564', '120115451', '120115', '黄庄农场虚拟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('565', '120115452', '120115', '大钟农场虚拟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('566', '120115453', '120115', '天宝工业园区虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('567', '120115454', '120115', '九园工业园区虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('568', '120115455', '120115', '京津新城虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('569', '1202', '12', '市辖县', '2');
INSERT INTO `t_prov_city_area_street` VALUES ('570', '120221', '1202', '宁河县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('571', '120221100', '120221', '芦台镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('572', '120221102', '120221', '宁河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('573', '120221103', '120221', '苗庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('574', '120221104', '120221', '丰台镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('575', '120221105', '120221', '岳龙镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('576', '120221106', '120221', '板桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('577', '120221107', '120221', '潘庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('578', '120221109', '120221', '造甲城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('579', '120221110', '120221', '七里海镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('580', '120221111', '120221', '大北涧沽镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('581', '120221112', '120221', '东棘坨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('582', '120221204', '120221', '北淮淀乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('583', '120221205', '120221', '俵口乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('584', '120221206', '120221', '廉庄子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('585', '120221450', '120221', '潘庄农场虚拟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('586', '120223', '1202', '静海县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('587', '120223100', '120223', '静海镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('588', '120223101', '120223', '唐官屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('589', '120223102', '120223', '独流镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('590', '120223103', '120223', '王口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('591', '120223104', '120223', '台头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('592', '120223105', '120223', '子牙镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('593', '120223106', '120223', '陈官屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('594', '120223107', '120223', '中旺镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('595', '120223108', '120223', '大邱庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('596', '120223109', '120223', '蔡公庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('597', '120223110', '120223', '梁头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('598', '120223111', '120223', '团泊镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('599', '120223112', '120223', '双塘镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('600', '120223113', '120223', '大丰堆镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('601', '120223114', '120223', '沿庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('602', '120223115', '120223', '西翟庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('603', '120223200', '120223', '良王庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('604', '120223201', '120223', '杨成庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('605', '120223400', '120223', '天津静海经济开发区虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('606', '120223402', '120223', '天津子牙工业园区虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('607', '120223403', '120223', '中国石油天然气总公司地调一处虚拟街', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('608', '120225', '1202', '蓟县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('609', '120225001', '120225', '文昌街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('610', '120225100', '120225', '城关镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('611', '120225101', '120225', '洇溜镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('612', '120225102', '120225', '官庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('613', '120225103', '120225', '马伸桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('614', '120225104', '120225', '下营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('615', '120225105', '120225', '邦均镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('616', '120225106', '120225', '别山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('617', '120225108', '120225', '尤古庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('618', '120225109', '120225', '上仓镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('619', '120225111', '120225', '下仓镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('620', '120225112', '120225', '罗庄子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('621', '120225113', '120225', '白涧镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('622', '120225114', '120225', '五百户镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('623', '120225115', '120225', '侯家营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('624', '120225116', '120225', '桑梓镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('625', '120225117', '120225', '东施古镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('626', '120225118', '120225', '下窝头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('627', '120225119', '120225', '杨津庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('628', '120225120', '120225', '出头岭镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('629', '120225121', '120225', '西龙虎峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('630', '120225202', '120225', '穿芳峪乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('631', '120225203', '120225', '孙各庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('632', '120225208', '120225', '东二营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('633', '120225210', '120225', '许家台乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('634', '120225212', '120225', '礼明庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('635', '120225219', '120225', '东赵各庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('636', '13', '0', '河北省', '1');
INSERT INTO `t_prov_city_area_street` VALUES ('637', '1301', '13', '石家庄市', '2');
INSERT INTO `t_prov_city_area_street` VALUES ('638', '130101', '1301', '市辖区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('639', '130102', '1301', '长安区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('640', '130102001', '130102', '建北街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('641', '130102002', '130102', '青园街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('642', '130102003', '130102', '广安街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('643', '130102004', '130102', '育才街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('644', '130102005', '130102', '跃进街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('645', '130102007', '130102', '河东街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('646', '130102010', '130102', '长丰街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('647', '130102011', '130102', '谈固街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('648', '130102100', '130102', '西兆通镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('649', '130102101', '130102', '南村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('650', '130102102', '130102', '高营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('651', '130103', '1301', '桥东区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('652', '130103001', '130103', '中山东路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('653', '130103002', '130103', '彭后街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('654', '130103003', '130103', '东风街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('655', '130103004', '130103', '东华街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('656', '130103005', '130103', '休门街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('657', '130103006', '130103', '阜康街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('658', '130103007', '130103', '建安街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('659', '130103008', '130103', '胜利北街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('660', '130103009', '130103', '汇通街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('661', '130103101', '130103', '桃园镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('662', '130104', '1301', '桥西区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('663', '130104001', '130104', '东里街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('664', '130104002', '130104', '中山路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('665', '130104004', '130104', '南长街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('666', '130104005', '130104', '维明街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('667', '130104006', '130104', '裕西街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('668', '130104007', '130104', '友谊街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('669', '130104008', '130104', '红旗街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('670', '130104009', '130104', '新石街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('671', '130104010', '130104', '苑东街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('672', '130104011', '130104', '西里街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('673', '130104012', '130104', '振头街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('674', '130104201', '130104', '留营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('675', '130105', '1301', '新华区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('676', '130105001', '130105', '革新街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('677', '130105003', '130105', '新华路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('678', '130105004', '130105', '宁安路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('679', '130105005', '130105', '东焦街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('680', '130105006', '130105', '西苑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('681', '130105007', '130105', '合作路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('682', '130105008', '130105', '联盟路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('683', '130105009', '130105', '石岗大街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('684', '130105010', '130105', '五七路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('685', '130105011', '130105', '天苑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('686', '130105012', '130105', '北苑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('687', '130105100', '130105', '大郭镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('688', '130105101', '130105', '赵陵铺镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('689', '130105201', '130105', '西三庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('690', '130105202', '130105', '杜北乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('691', '130107', '1301', '井陉矿区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('692', '130107001', '130107', '矿市街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('693', '130107002', '130107', '四微街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('694', '130107100', '130107', '贾庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('695', '130107101', '130107', '凤山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('696', '130107200', '130107', '横涧乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('697', '130108', '1301', '裕华区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('698', '130108001', '130108', '裕兴街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('699', '130108002', '130108', '裕强街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('700', '130108003', '130108', '东苑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('701', '130108004', '130108', '建通街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('702', '130108005', '130108', '槐底街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('703', '130108006', '130108', '裕华路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('704', '130108007', '130108', '裕东街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('705', '130108010', '130108', '长江街道办事处(高新区)', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('706', '130108100', '130108', '宋营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('707', '130108101', '130108', '方村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('708', '130121', '1301', '井陉县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('709', '130121100', '130121', '微水镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('710', '130121101', '130121', '上安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('711', '130121102', '130121', '天长镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('712', '130121103', '130121', '秀林镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('713', '130121104', '130121', '南峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('714', '130121105', '130121', '威州镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('715', '130121106', '130121', '小作镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('716', '130121107', '130121', '南障城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('717', '130121108', '130121', '苍岩山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('718', '130121109', '130121', '测鱼镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('719', '130121200', '130121', '吴家窑乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('720', '130121201', '130121', '北正乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('721', '130121202', '130121', '于家乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('722', '130121203', '130121', '孙庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('723', '130121204', '130121', '南陉乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('724', '130121205', '130121', '辛庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('725', '130121206', '130121', '南王庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('726', '130123', '1301', '正定县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('727', '130123100', '130123', '正定镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('728', '130123101', '130123', '诸福屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('729', '130123102', '130123', '新城铺镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('730', '130123103', '130123', '新安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('731', '130123200', '130123', '南牛乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('732', '130123201', '130123', '南楼乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('733', '130123202', '130123', '西平乐乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('734', '130123203', '130123', '北早现乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('735', '130123204', '130123', '曲阳桥乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('736', '130124', '1301', '栾城县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('737', '130124100', '130124', '栾城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('738', '130124101', '130124', '郄马镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('739', '130124103', '130124', '冶河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('740', '130124104', '130124', '窦妪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('741', '130124105', '130124', '楼底镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('742', '130124200', '130124', '南高乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('743', '130124201', '130124', '柳林屯乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('744', '130124202', '130124', '西营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('745', '130125', '1301', '行唐县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('746', '130125100', '130125', '龙州镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('747', '130125101', '130125', '南桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('748', '130125102', '130125', '上碑镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('749', '130125103', '130125', '口头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('750', '130125200', '130125', '独羊岗乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('751', '130125201', '130125', '安香乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('752', '130125202', '130125', '只里乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('753', '130125203', '130125', '市同乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('754', '130125204', '130125', '翟营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('755', '130125205', '130125', '城寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('756', '130125206', '130125', '上方乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('757', '130125207', '130125', '玉亭乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('758', '130125208', '130125', '北河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('759', '130125209', '130125', '上闫庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('760', '130125210', '130125', '九口子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('761', '130126', '1301', '灵寿县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('762', '130126100', '130126', '灵寿镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('763', '130126101', '130126', '青同镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('764', '130126102', '130126', '塔上镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('765', '130126103', '130126', '陈庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('766', '130126104', '130126', '慈峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('767', '130126105', '130126', '岔头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('768', '130126200', '130126', '三圣院乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('769', '130126201', '130126', '北洼乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('770', '130126202', '130126', '牛城乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('771', '130126203', '130126', '狗台乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('772', '130126204', '130126', '南寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('773', '130126205', '130126', '南燕川乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('774', '130126206', '130126', '北谭庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('775', '130126207', '130126', '寨头乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('776', '130126208', '130126', '南营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('777', '130127', '1301', '高邑县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('778', '130127100', '130127', '高邑镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('779', '130127200', '130127', '大营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('780', '130127201', '130127', '中韩乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('781', '130127202', '130127', '万城乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('782', '130127203', '130127', '西富村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('783', '130128', '1301', '深泽县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('784', '130128100', '130128', '深泽镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('785', '130128101', '130128', '铁杆镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('786', '130128200', '130128', '白庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('787', '130128201', '130128', '留村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('788', '130128202', '130128', '赵八乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('789', '130128203', '130128', '桥头乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('790', '130129', '1301', '赞皇县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('791', '130129100', '130129', '赞皇镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('792', '130129101', '130129', '院头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('793', '130129200', '130129', '西龙门乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('794', '130129201', '130129', '南邢郭乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('795', '130129202', '130129', '南清河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('796', '130129203', '130129', '西阳泽乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('797', '130129204', '130129', '土门乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('798', '130129205', '130129', '黄北坪乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('799', '130129206', '130129', '嶂石岩乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('800', '130129207', '130129', '许亭乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('801', '130129208', '130129', '张楞乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('802', '130130', '1301', '无极县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('803', '130130100', '130130', '无极镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('804', '130130101', '130130', '七汲镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('805', '130130102', '130130', '张段固镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('806', '130130103', '130130', '北苏镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('807', '130130104', '130130', '郭庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('808', '130130105', '130130', '大陈镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('809', '130130200', '130130', '高头乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('810', '130130201', '130130', '郝庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('811', '130130202', '130130', '东侯坊乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('812', '130130203', '130130', '里城道乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('813', '130130204', '130130', '南流乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('814', '130131', '1301', '平山县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('815', '130131100', '130131', '平山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('816', '130131101', '130131', '东回舍镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('817', '130131102', '130131', '温塘镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('818', '130131103', '130131', '南甸镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('819', '130131104', '130131', '岗南镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('820', '130131105', '130131', '中古月镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('821', '130131106', '130131', '下槐镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('822', '130131107', '130131', '孟家庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('823', '130131108', '130131', '小觉镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('824', '130131109', '130131', '蛟潭庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('825', '130131110', '130131', '西柏坡镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('826', '130131111', '130131', '下口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('827', '130131200', '130131', '西大吾乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('828', '130131201', '130131', '上三汲乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('829', '130131202', '130131', '两河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('830', '130131203', '130131', '东王坡乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('831', '130131204', '130131', '苏家庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('832', '130131205', '130131', '宅北乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('833', '130131207', '130131', '北冶乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('834', '130131209', '130131', '上观音堂乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('835', '130131210', '130131', '杨家桥乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('836', '130131211', '130131', '营里乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('837', '130131212', '130131', '合河口乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('838', '130132', '1301', '元氏县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('839', '130132100', '130132', '槐阳镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('840', '130132101', '130132', '因村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('841', '130132102', '130132', '南佐镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('842', '130132103', '130132', '宋曹镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('843', '130132104', '130132', '南因镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('844', '130132105', '130132', '姬村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('845', '130132200', '130132', '马村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('846', '130132201', '130132', '东张乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('847', '130132202', '130132', '赵同乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('848', '130132203', '130132', '北褚乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('849', '130132204', '130132', '苏村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('850', '130132205', '130132', '苏阳乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('851', '130132206', '130132', '北正乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('852', '130132207', '130132', '前仙乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('853', '130132208', '130132', '黑水河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('854', '130133', '1301', '赵县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('855', '130133100', '130133', '赵州镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('856', '130133101', '130133', '范庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('857', '130133102', '130133', '北王里镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('858', '130133103', '130133', '新寨店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('859', '130133104', '130133', '韩村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('860', '130133105', '130133', '南柏舍镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('861', '130133106', '130133', '沙河店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('862', '130133200', '130133', '前大章乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('863', '130133201', '130133', '谢庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('864', '130133202', '130133', '高村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('865', '130133203', '130133', '王西章乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('866', '130181', '1301', '辛集市', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('867', '130181100', '130181', '辛集镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('868', '130181101', '130181', '旧城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('869', '130181102', '130181', '张古庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('870', '130181103', '130181', '位伯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('871', '130181104', '130181', '新垒头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('872', '130181105', '130181', '新城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('873', '130181106', '130181', '南智丘镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('874', '130181107', '130181', '王口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('875', '130181200', '130181', '天宫营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('876', '130181201', '130181', '前营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('877', '130181202', '130181', '马庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('878', '130181203', '130181', '和睦井乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('879', '130181204', '130181', '田家庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('880', '130181205', '130181', '中里厢乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('881', '130181206', '130181', '小辛庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('882', '130182', '1301', '藁城市', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('883', '130182100', '130182', '廉州镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('884', '130182101', '130182', '兴安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('885', '130182102', '130182', '贾市庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('886', '130182103', '130182', '南营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('887', '130182104', '130182', '梅花镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('888', '130182105', '130182', '岗上镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('889', '130182106', '130182', '邱头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('890', '130182107', '130182', '南董镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('891', '130182108', '130182', '张家庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('892', '130182109', '130182', '南孟镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('893', '130182110', '130182', '增村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('894', '130182111', '130182', '小常安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('895', '130182112', '130182', '前西关镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('896', '130182200', '130182', '九门回族乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('897', '130182500', '130182', '石家庄经济技术开发区虚拟乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('898', '130183', '1301', '晋州市', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('899', '130183100', '130183', '晋州镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('900', '130183101', '130183', '总十庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('901', '130183102', '130183', '营里镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('902', '130183103', '130183', '桃园镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('903', '130183104', '130183', '东卓宿镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('904', '130183105', '130183', '马于镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('905', '130183106', '130183', '小樵镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('906', '130183107', '130183', '槐树镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('907', '130183200', '130183', '东里庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('908', '130183201', '130183', '周家庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('909', '130184', '1301', '新乐市', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('910', '130184001', '130184', '长寿街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('911', '130184101', '130184', '化皮镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('912', '130184102', '130184', '承安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('913', '130184103', '130184', '正莫镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('914', '130184104', '130184', '南大岳镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('915', '130184105', '130184', '杜固镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('916', '130184106', '130184', '邯邰镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('917', '130184107', '130184', '东王镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('918', '130184108', '130184', '马头铺镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('919', '130184200', '130184', '协神乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('920', '130184201', '130184', '木村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('921', '130184202', '130184', '彭家庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('922', '130185', '1301', '鹿泉市', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('923', '130185100', '130185', '获鹿镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('924', '130185101', '130185', '铜冶镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('925', '130185102', '130185', '寺家庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('926', '130185103', '130185', '上庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('927', '130185104', '130185', '李村镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('928', '130185105', '130185', '宜安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('929', '130185106', '130185', '黄壁庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('930', '130185107', '130185', '大河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('931', '130185200', '130185', '石井乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('932', '130185201', '130185', '白鹿泉乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('933', '130185202', '130185', '上寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('934', '130185203', '130185', '山尹村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('935', '130185500', '130185', '高新技术产业园区虚拟乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('936', '1302', '13', '唐山市', '2');
INSERT INTO `t_prov_city_area_street` VALUES ('937', '130201', '1302', '市辖区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('938', '130202', '1302', '路南区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('939', '130202001', '130202', '学院南路', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('940', '130202002', '130202', '友谊', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('941', '130202003', '130202', '广场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('942', '130202004', '130202', '永红桥街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('943', '130202005', '130202', '小山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('944', '130202006', '130202', '文北', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('945', '130202007', '130202', '钱营', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('946', '130202100', '130202', '芦台开发区海北镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('947', '130202101', '130202', '汉沽管理区汉丰镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('948', '130202200', '130202', '女织寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('949', '130202450', '130202', '芦台开发区街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('950', '130202451', '130202', '汉沽管理区兴农', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('951', '130202452', '130202', '汉沽管理区振兴街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('952', '130203', '1302', '路北区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('953', '130203001', '130203', '乔屯街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('954', '130203002', '130203', '文化路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('955', '130203003', '130203', '钓鱼台街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('956', '130203004', '130203', '东新村街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('957', '130203005', '130203', '缸窑街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('958', '130203006', '130203', '机场路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('959', '130203007', '130203', '河北路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('960', '130203008', '130203', '龙东街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('961', '130203009', '130203', '大里街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('962', '130203010', '130203', '光明街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('963', '130203200', '130203', '果园乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('964', '130203450', '130203', '河北唐山高新技术产业园区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('965', '130204', '1302', '古冶区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('966', '130204001', '130204', '林西街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('967', '130204002', '130204', '唐家庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('968', '130204003', '130204', '古冶街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('969', '130204004', '130204', '赵各庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('970', '130204005', '130204', '吕家坨街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('971', '130204006', '130204', '南范各庄街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('972', '130204200', '130204', '卑家店乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('973', '130204201', '130204', '王辇庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('974', '130204202', '130204', '习家套乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('975', '130204203', '130204', '大庄坨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('976', '130204204', '130204', '范各庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('977', '130205', '1302', '开平区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('978', '130205001', '130205', '马家沟', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('979', '130205002', '130205', '开平', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('980', '130205003', '130205', '税务庄', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('981', '130205005', '130205', '陡电', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('982', '130205006', '130205', '荆各庄', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('983', '130205100', '130205', '开平镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('984', '130205101', '130205', '栗园镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('985', '130205200', '130205', '越河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('986', '130205201', '130205', '双桥乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('987', '130205202', '130205', '郑庄子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('988', '130205203', '130205', '洼里乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('989', '130207', '1302', '丰南区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('990', '130207102', '130207', '稻地镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('991', '130207103', '130207', '小集镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('992', '130207104', '130207', '黄各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('993', '130207105', '130207', '西葛镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('994', '130207106', '130207', '大新庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('995', '130207107', '130207', '钱营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('996', '130207108', '130207', '唐坊镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('997', '130207109', '130207', '王兰庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('998', '130207110', '130207', '柳树酄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('999', '130207111', '130207', '黑沿子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1000', '130207112', '130207', '滨海镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1001', '130207113', '130207', '丰南镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1002', '130207114', '130207', '大齐镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1003', '130207201', '130207', '南孙庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1004', '130207202', '130207', '东田庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1005', '130207203', '130207', '尖字沽乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1006', '130207450', '130207', '河北唐山南堡经济开发区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1007', '130208', '1302', '丰润区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1008', '130208001', '130208', '太平路', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1009', '130208002', '130208', '燕山路', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1010', '130208003', '130208', '浭阳', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1011', '130208100', '130208', '丰润镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1012', '130208101', '130208', '老庄子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1013', '130208102', '130208', '任各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1014', '130208103', '130208', '左家坞镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1015', '130208104', '130208', '泉河头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1016', '130208105', '130208', '王官营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1017', '130208106', '130208', '火石营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1018', '130208107', '130208', '韩城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1019', '130208108', '130208', '岔河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1020', '130208109', '130208', '新军屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1021', '130208110', '130208', '小张各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1022', '130208111', '130208', '丰登坞镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1023', '130208112', '130208', '李钊庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1024', '130208113', '130208', '白官屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1025', '130208114', '130208', '石各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1026', '130208115', '130208', '沙流河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1027', '130208116', '130208', '七树庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1028', '130208117', '130208', '杨官林镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1029', '130208202', '130208', '姜家营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1030', '130208205', '130208', '欢喜庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1031', '130208207', '130208', '银城铺乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1032', '130208208', '130208', '刘家营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1033', '130208209', '130208', '常庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1034', '130223', '1302', '滦县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1035', '130223001', '130223', '城区街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1036', '130223100', '130223', '滦州镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1037', '130223101', '130223', '响堂镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1038', '130223102', '130223', '东安各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1039', '130223103', '130223', '雷庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1040', '130223104', '130223', '茨榆坨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1041', '130223105', '130223', '榛子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1042', '130223106', '130223', '杨柳庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1043', '130223107', '130223', '油榨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1044', '130223108', '130223', '古马镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1045', '130223109', '130223', '小马庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1046', '130223110', '130223', '九百户镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1047', '130223111', '130223', '王店子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1048', '130224', '1302', '滦南县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1049', '130224001', '130224', '奔城街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1050', '130224100', '130224', '奔城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1051', '130224101', '130224', '宋道口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1052', '130224102', '130224', '长凝镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1053', '130224103', '130224', '胡各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1054', '130224104', '130224', '坨里镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1055', '130224105', '130224', '姚王庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1056', '130224106', '130224', '司各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1057', '130224107', '130224', '安各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1058', '130224108', '130224', '扒齿港镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1059', '130224109', '130224', '程庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1060', '130224110', '130224', '青坨营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1061', '130224111', '130224', '柏各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1062', '130224113', '130224', '柳赞镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1063', '130224114', '130224', '南堡镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1064', '130224115', '130224', '方各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1065', '130224116', '130224', '东黄坨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1066', '130224117', '130224', '马城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1067', '130225', '1302', '乐亭县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1068', '130225001', '130225', '城区街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1069', '130225100', '130225', '乐亭镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1070', '130225101', '130225', '汤家河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1071', '130225102', '130225', '胡家坨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1072', '130225103', '130225', '王滩镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1073', '130225104', '130225', '闫各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1074', '130225105', '130225', '马头营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1075', '130225106', '130225', '新寨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1076', '130225107', '130225', '汀流河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1077', '130225108', '130225', '姜各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1078', '130225200', '130225', '毛庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1079', '130225201', '130225', '庞各庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1080', '130225202', '130225', '大相各庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1081', '130225203', '130225', '古河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1082', '130225204', '130225', '中堡王庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1083', '130225450', '130225', '长芦大清河盐场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1084', '130225451', '130225', '海港区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1085', '130227', '1302', '迁西县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1086', '130227001', '130227', '栗乡街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1087', '130227100', '130227', '兴城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1088', '130227101', '130227', '金厂峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1089', '130227102', '130227', '洒河桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1090', '130227103', '130227', '太平寨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1091', '130227104', '130227', '罗家屯镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1092', '130227105', '130227', '东荒峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1093', '130227106', '130227', '新集镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1094', '130227107', '130227', '三屯营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1095', '130227108', '130227', '滦阳镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1096', '130227200', '130227', '白庙子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1097', '130227201', '130227', '上营乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1098', '130227202', '130227', '汉儿庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1099', '130227203', '130227', '渔户寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1100', '130227204', '130227', '旧城乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1101', '130227205', '130227', '尹庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1102', '130227206', '130227', '东莲花院乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1103', '130227207', '130227', '新庄子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1104', '130229', '1302', '玉田县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1105', '130229100', '130229', '玉田镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1106', '130229101', '130229', '亮甲店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1107', '130229102', '130229', '鸦鸿桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1108', '130229103', '130229', '窝洛沽镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1109', '130229104', '130229', '石臼窝镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1110', '130229105', '130229', '虹桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1111', '130229106', '130229', '散水头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1112', '130229107', '130229', '林南仓镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1113', '130229108', '130229', '林西镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1114', '130229109', '130229', '杨家板桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1115', '130229110', '130229', '彩亭桥镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1116', '130229111', '130229', '孤树镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1117', '130229112', '130229', '大安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1118', '130229113', '130229', '唐自头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1119', '130229200', '130229', '郭家屯乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1120', '130229201', '130229', '林头屯乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1121', '130229202', '130229', '杨家套乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1122', '130229203', '130229', '潮洛窝乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1123', '130229204', '130229', '陈家铺乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1124', '130229205', '130229', '郭家桥乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1125', '130230', '1302', '唐海县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1126', '130230100', '130230', '唐海镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1127', '130230401', '130230', '一农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1128', '130230403', '130230', '三农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1129', '130230404', '130230', '四农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1130', '130230405', '130230', '五农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1131', '130230406', '130230', '六农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1132', '130230407', '130230', '七农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1133', '130230408', '130230', '八农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1134', '130230409', '130230', '九农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1135', '130230410', '130230', '十农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1136', '130230411', '130230', '十一农场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1137', '130230412', '130230', '八里滩养殖场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1138', '130230413', '130230', '十里海养殖场', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1139', '130230451', '130230', '曹妃甸工业区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1140', '130281', '1302', '遵化市', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1141', '130281001', '130281', '路南街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1142', '130281002', '130281', '路北街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1143', '130281100', '130281', '遵化镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1144', '130281101', '130281', '堡子店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1145', '130281102', '130281', '马兰峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1146', '130281103', '130281', '平安城镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1147', '130281104', '130281', '东新庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1148', '130281105', '130281', '新店子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1149', '130281106', '130281', '党峪镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1150', '130281107', '130281', '地北头镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1151', '130281108', '130281', '东旧寨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1152', '130281109', '130281', '铁厂镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1153', '130281110', '130281', '苏家洼镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1154', '130281111', '130281', '建明镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1155', '130281112', '130281', '石门镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1156', '130281200', '130281', '西留村乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1157', '130281201', '130281', '崔家庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1158', '130281202', '130281', '兴旺寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1159', '130281203', '130281', '西下营满族乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1160', '130281204', '130281', '汤泉满族乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1161', '130281205', '130281', '东陵满族乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1162', '130281206', '130281', '刘备寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1163', '130281207', '130281', '团瓢庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1164', '130281208', '130281', '娘娘庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1165', '130281209', '130281', '西三里乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1166', '130281210', '130281', '候家寨乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1167', '130281211', '130281', '小厂乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1168', '130283', '1302', '迁安市', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1169', '130283100', '130283', '迁安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1170', '130283101', '130283', '夏官营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1171', '130283102', '130283', '杨各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1172', '130283103', '130283', '建昌营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1173', '130283104', '130283', '赵店子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1174', '130283105', '130283', '野鸡坨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1175', '130283106', '130283', '大崔庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1176', '130283107', '130283', '杨店子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1177', '130283108', '130283', '蔡园镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1178', '130283109', '130283', '马兰庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1179', '130283110', '130283', '沙河驿镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1180', '130283111', '130283', '木厂口镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1181', '130283200', '130283', '扣庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1182', '130283201', '130283', '彭店子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1183', '130283202', '130283', '上射雁庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1184', '130283203', '130283', '闫家店乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1185', '130283204', '130283', '五重安乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1186', '130283205', '130283', '大五里乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1187', '130283206', '130283', '太平庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1188', '1303', '13', '秦皇岛市', '2');
INSERT INTO `t_prov_city_area_street` VALUES ('1189', '130301', '1303', '市辖区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1190', '130302', '1303', '海港区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1191', '130302001', '130302', '文化路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1192', '130302002', '130302', '海滨路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1193', '130302003', '130302', '北环路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1194', '130302004', '130302', '建设大街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1195', '130302005', '130302', '河东街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1196', '130302006', '130302', '西港路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1197', '130302007', '130302', '燕山大街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1198', '130302008', '130302', '港城大街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1199', '130302009', '130302', '东环路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1200', '130302010', '130302', '白塔岭街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1201', '130302011', '130302', '秦皇岛经济技术开发区珠江道街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1202', '130302100', '130302', '东港镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1203', '130302101', '130302', '海港镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1204', '130302102', '130302', '西港镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1205', '130302103', '130302', '海阳镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1206', '130302104', '130302', '北港镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1207', '130302450', '130302', '秦皇岛经济技术开发区', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1208', '130303', '1303', '山海关区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1209', '130303001', '130303', '南关街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1210', '130303002', '130303', '东街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1211', '130303003', '130303', '西街街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1212', '130303004', '130303', '路南街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1213', '130303005', '130303', '船厂路街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1214', '130303100', '130303', '第一关镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1215', '130303101', '130303', '石河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1216', '130303102', '130303', '孟姜镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1217', '130303200', '130303', '渤海乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1218', '130304', '1303', '北戴河区', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1219', '130304001', '130304', '西山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1220', '130304002', '130304', '东山街道', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1221', '130304100', '130304', '海滨镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1222', '130304101', '130304', '戴河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1223', '130321', '1303', '青龙满族自治县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1224', '130321100', '130321', '青龙镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1225', '130321101', '130321', '祖山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1226', '130321102', '130321', '木头凳镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1227', '130321103', '130321', '双山子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1228', '130321104', '130321', '马圈子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1229', '130321105', '130321', '肖营子镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1230', '130321200', '130321', '凤凰山乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1231', '130321201', '130321', '龙王庙乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1232', '130321202', '130321', '三星口乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1233', '130321203', '130321', '干沟乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1234', '130321204', '130321', '大巫岚乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1235', '130321205', '130321', '土门子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1236', '130321206', '130321', '大石岭乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1237', '130321207', '130321', '隔河头乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1238', '130321208', '130321', '官场乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1239', '130321209', '130321', '茨榆山乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1240', '130321210', '130321', '平方子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1241', '130321211', '130321', '安子岭乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1242', '130321212', '130321', '朱杖子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1243', '130321213', '130321', '草碾乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1244', '130321214', '130321', '七道河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1245', '130321215', '130321', '八道河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1246', '130321216', '130321', '娄杖子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1247', '130321217', '130321', '三拨子乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1248', '130321218', '130321', '凉水河乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1249', '130322', '1303', '昌黎县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1250', '130322100', '130322', '昌黎镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1251', '130322101', '130322', '靖安镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1252', '130322102', '130322', '安山镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1253', '130322103', '130322', '龙家店镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1254', '130322104', '130322', '泥井镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1255', '130322105', '130322', '大蒲河镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1256', '130322106', '130322', '新集镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1257', '130322107', '130322', '刘台庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1258', '130322108', '130322', '茹荷镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1259', '130322109', '130322', '朱各庄镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1260', '130322201', '130322', '团林乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1261', '130322202', '130322', '葛条港乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1262', '130322203', '130322', '马坨店乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1263', '130322204', '130322', '荒佃庄乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1264', '130322206', '130322', '两山乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1265', '130322207', '130322', '十里铺乡', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1266', '130323', '1303', '抚宁县', '3');
INSERT INTO `t_prov_city_area_street` VALUES ('1267', '130323100', '130323', '抚宁镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1268', '130323101', '130323', '留守营镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1269', '130323102', '130323', '榆关镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1270', '130323103', '130323', '牛头崖镇', '4');
INSERT INTO `t_prov_city_area_street` VALUES ('1271', '130323104', '130323', '石门寨镇', '4');

-- ----------------------------
-- Table structure for t_record_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_record_pay`;
CREATE TABLE `t_record_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `paydate` datetime DEFAULT NULL,
  `money` int(11) DEFAULT NULL COMMENT '单位转换成分；直接用整数存储',
  `surveyid` int(11) DEFAULT NULL COMMENT '针对哪条读数来缴费的',
  `status` int(1) DEFAULT NULL COMMENT '1缴清；2欠费；3预存',
  `balance` int(11) DEFAULT NULL COMMENT '欠费或者预存的金额',
  `theorymoney` int(11) DEFAULT NULL COMMENT '单位转换成分；直接用整数存储',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_record_pay
-- ----------------------------
INSERT INTO `t_record_pay` VALUES ('1', '5', '2017-02-23 10:50:57', '10000', null, '2', '19500', '29500');
INSERT INTO `t_record_pay` VALUES ('2', '5', '2017-02-23 11:10:02', '20000', null, '3', '500', '19500');
INSERT INTO `t_record_pay` VALUES ('3', '5', '2017-02-23 11:20:25', '1000', null, '3', '1000', '0');
INSERT INTO `t_record_pay` VALUES ('4', '5', '2017-02-23 11:21:09', '8500', null, '1', '0', '8500');
INSERT INTO `t_record_pay` VALUES ('5', '5', '2017-02-23 11:26:03', '4000', null, '1', null, '4000');
INSERT INTO `t_record_pay` VALUES ('6', '5', '2017-02-23 16:42:43', '1200', null, '2', '14800', '16000');
INSERT INTO `t_record_pay` VALUES ('7', '5', '2017-02-24 09:48:17', '100', null, '3', '100', '0');
INSERT INTO `t_record_pay` VALUES ('8', '5', '2017-02-24 09:49:09', '800', null, '3', '800', '0');

-- ----------------------------
-- Table structure for t_record_survey
-- ----------------------------
DROP TABLE IF EXISTS `t_record_survey`;
CREATE TABLE `t_record_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `equipmentid` int(11) DEFAULT NULL COMMENT '记录账户设备使用情况表当前的id',
  `type` tinyint(4) DEFAULT NULL COMMENT '0更换设备自动写入；1平台录入；2移动端现场勘测；',
  `value` double DEFAULT NULL,
  `readdate` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT NULL COMMENT '一般用程序自动写入',
  `usevalue` double DEFAULT NULL COMMENT '用量',
  `money` int(11) DEFAULT NULL COMMENT '单位转换成分；直接用整数存储',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_record_survey
-- ----------------------------
INSERT INTO `t_record_survey` VALUES ('1', '5', null, '0', '0', '2017-02-20 17:02:26', '2017-02-22 17:02:29', '0', '0');
INSERT INTO `t_record_survey` VALUES ('2', '5', null, '1', '5', '2017-02-22 17:03:11', '2017-02-22 17:03:09', '5', '500');
INSERT INTO `t_record_survey` VALUES ('3', '5', null, '1', '123', '2017-02-23 00:00:00', '2017-02-22 19:30:06', '118', '23600');
INSERT INTO `t_record_survey` VALUES ('4', '5', null, '1', '120', '2017-02-24 00:00:00', '2017-02-22 19:32:58', '-3', '-600');
INSERT INTO `t_record_survey` VALUES ('5', '5', null, '1', '150', '2017-02-25 00:00:00', '2017-02-22 19:35:45', '30', '6000');
INSERT INTO `t_record_survey` VALUES ('6', '5', null, '1', '200', '2017-02-26 00:00:00', '2017-02-23 11:21:01', '50', '10000');
INSERT INTO `t_record_survey` VALUES ('7', '5', null, '1', '220', '2017-02-27 00:00:00', '2017-02-23 11:21:41', '20', '4000');
INSERT INTO `t_record_survey` VALUES ('8', '5', null, '1', '250', '2017-03-01 00:00:00', '2017-02-23 15:45:51', '30', '6000');
INSERT INTO `t_record_survey` VALUES ('9', '5', null, '1', '300', '2017-04-01 00:00:00', '2017-02-23 16:24:00', '50', '10000');
INSERT INTO `t_record_survey` VALUES ('10', '5', null, '1', '300', '2017-04-02 00:00:00', '2017-02-23 19:56:10', '0', '0');
INSERT INTO `t_record_survey` VALUES ('11', '5', null, '1', '290', '2017-04-02 00:00:00', '2017-02-23 19:56:30', '-10', '-2000');
INSERT INTO `t_record_survey` VALUES ('12', '5', null, '1', '320', '2017-04-08 00:00:00', '2017-02-23 19:57:21', '30', '6000');
INSERT INTO `t_record_survey` VALUES ('13', '5', null, '1', '1', '2017-02-01 00:00:00', '2017-02-23 19:59:12', '-319', '-63800');
INSERT INTO `t_record_survey` VALUES ('14', '5', null, '1', '1', '2017-02-01 00:00:00', '2017-02-23 20:00:44', '-319', '-63800');
INSERT INTO `t_record_survey` VALUES ('15', '5', null, '1', '1', '2017-02-01 00:00:00', '2017-02-24 09:18:21', '-319', '-63800');
INSERT INTO `t_record_survey` VALUES ('16', '5', null, '1', '1', '2017-02-06 00:00:00', '2017-02-24 09:19:24', '-319', '-63800');
INSERT INTO `t_record_survey` VALUES ('17', '5', null, '1', '1000', '2017-04-29 00:00:00', '2017-02-24 09:28:29', '680', '136000');
INSERT INTO `t_record_survey` VALUES ('18', '5', null, '1', '1200', '2017-05-01 00:00:00', '2017-02-24 09:31:27', '200', '40000');
INSERT INTO `t_record_survey` VALUES ('19', '4', null, '1', '1', '2017-02-01 00:00:00', '2017-02-24 09:37:48', '1', '200');
INSERT INTO `t_record_survey` VALUES ('20', '4', null, '1', '2', '2017-02-02 00:00:00', '2017-02-24 09:42:17', '1', '200');

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0：禁用；1：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='配置数据字典';

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES ('1', null, '2', 'cs_water', null, null);

-- ----------------------------
-- Table structure for t_sys_func
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_func`;
CREATE TABLE `t_sys_func` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL COMMENT '访问路径',
  `pic` varchar(512) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1：菜单；2：功能',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_func
-- ----------------------------
INSERT INTO `t_sys_func` VALUES ('10', '系统管理', '1', '/', 'fa-cogs', '0', '1');
INSERT INTO `t_sys_func` VALUES ('11', '基础数据', '2', '/', 'fa-user', '0', '1');
INSERT INTO `t_sys_func` VALUES ('13', '功能菜单', '1', '/manage/func', null, '10', '1');
INSERT INTO `t_sys_func` VALUES ('15', '用户管理', '1', '/manage/user', null, '10', '1');
INSERT INTO `t_sys_func` VALUES ('17', '角色管理', '1', '/manage/role', null, '10', '1');
INSERT INTO `t_sys_func` VALUES ('18', '设备管理', '1', '/basicdata/equipment', null, '11', '1');
INSERT INTO `t_sys_func` VALUES ('19', '账户管理', '2', '/basicdata/account', null, '11', '1');
INSERT INTO `t_sys_func` VALUES ('22', '收费标准', '3', '/basicdata/chargeStandard', null, '11', '1');
INSERT INTO `t_sys_func` VALUES ('23', '缴费管理', '3', '/', null, '0', '1');
INSERT INTO `t_sys_func` VALUES ('24', '用户缴费', '1', '/pay', null, '23', '1');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1正常； 0禁用',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '系统管理员', '1', '1');

-- ----------------------------
-- Table structure for t_sys_role_func
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_func`;
CREATE TABLE `t_sys_role_func` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `funcid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role_func
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名-登陆名',
  `password` varchar(64) DEFAULT NULL COMMENT '登陆密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `email` varchar(512) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0未激活；1正常；2冻结',
  `registerdate` datetime DEFAULT NULL,
  `registertype` tinyint(4) DEFAULT NULL COMMENT '注册方式：0管理员添加；1前台注册',
  `usertype` tinyint(4) DEFAULT NULL COMMENT '1：普通用户；0：管理员',
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'admin', '1', 's.jin.superadmin', '928990049@qq.com', '15576652266', '1', '2015-02-08 00:00:00', '0', '0', null);
INSERT INTO `t_sys_user` VALUES ('2', 'guanshj', '202129', 's.jin.admin', 'xiao_wen202129@126.com', '15576652266', '1', '2015-05-06 09:25:26', '0', '0', null);
INSERT INTO `t_sys_user` VALUES ('3', 'sjin', '202129', 's.jin', 'xiao_wen202129@163.com', '15576652266', '1', '2015-07-07 15:18:52', '0', '0', null);

-- ----------------------------
-- Table structure for t_sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_group`;
CREATE TABLE `t_sys_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '用户组名',
  `status` tinyint(1) DEFAULT NULL COMMENT '1正常；0禁用',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_group
-- ----------------------------
INSERT INTO `t_sys_user_group` VALUES ('1', '一般用户', '1', '1');
INSERT INTO `t_sys_user_group` VALUES ('2', '操作员', '1', '1');

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
