/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : new

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-08-26 18:50:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assetbundle
-- ----------------------------
DROP TABLE IF EXISTS `assetbundle`;
CREATE TABLE `assetbundle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of assetbundle
-- ----------------------------
INSERT INTO `assetbundle` VALUES ('1', 'car');
INSERT INTO `assetbundle` VALUES ('2', 'whell');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `eqpt_id` int(11) NOT NULL,
  `eqpt_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `eqpt_positionX` float NOT NULL,
  `eqpt_positionY` float NOT NULL,
  `eqpt_positionZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('12', 'whell', '-60.9682', '0.148518', '81.4972');
INSERT INTO `model` VALUES ('13', 'whell', '-60.9682', '0.148518', '81.4972');
INSERT INTO `model` VALUES ('14', 'car', '-60.2733', '1.32582', '82.0049');
INSERT INTO `model` VALUES ('0', 'whell', '-58.9697', '1.37383', '80.721');
INSERT INTO `model` VALUES ('8', 'car', '-59.8508', '0.37354', '81.2619');
INSERT INTO `model` VALUES ('4', 'whell', '-64.359', '1.30266', '78.9629');
INSERT INTO `model` VALUES ('3', 'car', '-67.9737', '3.75752', '78.8392');

-- ----------------------------
-- Table structure for qs_auth
-- ----------------------------
DROP TABLE IF EXISTS `qs_auth`;
CREATE TABLE `qs_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(255) DEFAULT NULL,
  `auth_pid` int(11) DEFAULT NULL,
  `auth_c` varchar(255) DEFAULT NULL,
  `auth_a` varchar(255) DEFAULT NULL,
  `auth_path` varchar(255) DEFAULT NULL,
  `auth_level` int(11) DEFAULT NULL,
  `auth_isLink` tinyint(1) DEFAULT NULL,
  `auth_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_auth
-- ----------------------------
INSERT INTO `qs_auth` VALUES ('101', '大数据', '0', 'Visual', 'index', '101', '0', '0', null);
INSERT INTO `qs_auth` VALUES ('102', 'bim', '0', 'Visual', 'bim', '102', '0', '1', 'http://192.168.5.105');
INSERT INTO `qs_auth` VALUES ('104', '设备管理', '0', 'Eqpt', 'index', '104', '0', '0', null);
INSERT INTO `qs_auth` VALUES ('103', '巡查巡检', '0', 'Patrol', 'index', '103', '0', '1', 'http://www.baidu.com');
INSERT INTO `qs_auth` VALUES ('106', '教育培训', '0', 'Enterprise', 'index', '106', '0', '1', 'http://www.baidu.com');
INSERT INTO `qs_auth` VALUES ('107', '基本信息管理', '0', 'basic', 'index', '107', '0', '0', null);
INSERT INTO `qs_auth` VALUES ('129', '人员管理', '107', 'User', 'index', '129', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('105', '机器人巡查巡检', '0', 'Robot', 'index', '105', '0', '1', 'http://www.baidu.com');
INSERT INTO `qs_auth` VALUES ('110', '设备台账', '104', 'Eqpt', 'ledger', '110', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('111', '销账处理', '104', 'Eqpt', 'cancel', '111', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('112', '设备拆解', '104', 'Eqpt', 'disassemble', '112', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('113', '设备维修', '104', 'Service', 'index', '113', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('114', '设备更换', '104', 'Replace', 'index', '114', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('115', '维护计划', '104', 'Eqpt', 'plan', '115', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('116', '维护报表', '104', 'Eqpt', 'forms', '116', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('117', '巡查巡检实况', '103', 'Patrol', 'live', '117', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('118', '路线规划', '103', 'Patrol', 'setting', '118', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('119', '任务管理', '103', 'Patrol', 'manage', '119', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('120', '任务日志', '103', 'Patrol', 'log', '120', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('126', '部门管理', '107', 'dept', 'index', '126', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('109', '视频监控', '0', 'Video', 'index', '109', '0', '0', null);
INSERT INTO `qs_auth` VALUES ('124', '实时视频', '109', 'Video', 'liveplay', '124', '1', '1', 'http://192.168.5.101/JsApi/demo/livePlay.php?ip=192.168.5.101&user=a&pass=21232f297a57a5a743894a0e4a801fc3&camcode=192_168_5_108!192_168_5_108!192_168_5_108!192_168_5_108');
INSERT INTO `qs_auth` VALUES ('125', '视频回放', '109', 'Video', 'replay', '125', '1', '1', 'http://www.baidu.com');
INSERT INTO `qs_auth` VALUES ('128', '角色管理', '107', 'Role', 'index', '128', '1', '0', null);

-- ----------------------------
-- Table structure for qs_category
-- ----------------------------
DROP TABLE IF EXISTS `qs_category`;
CREATE TABLE `qs_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '种类id',
  `parentid` int(11) DEFAULT NULL COMMENT '当前种类的上级id',
  `cate_name` varchar(20) DEFAULT NULL COMMENT '当前种类名称',
  `cate_remark` varchar(255) DEFAULT NULL,
  `cate_num` varchar(10) DEFAULT NULL COMMENT '设备种类对应设备编号内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_category
-- ----------------------------
INSERT INTO `qs_category` VALUES ('1', '0', '重要设备（A类设备）', '重点管理和维护的对象，尽可能实施状态监测维修', 'AE0000');
INSERT INTO `qs_category` VALUES ('2', '0', '主要设备（B类设备）', '应实施预防维修', 'BE0000');
INSERT INTO `qs_category` VALUES ('3', '0', '一般设备（C类设备）', '可实施事后维修', 'CE0000');
INSERT INTO `qs_category` VALUES ('4', '1', 'A类-Ⅰ类', null, 'AE0100');
INSERT INTO `qs_category` VALUES ('5', '1', 'A类-Ⅱ类', '', 'AE0200');
INSERT INTO `qs_category` VALUES ('6', '1', 'A类-Ⅲ类', '', 'AE0300');
INSERT INTO `qs_category` VALUES ('7', '2', 'B类-Ⅰ类', '', 'BE0100');
INSERT INTO `qs_category` VALUES ('14', '4', 'A类-Ⅰ类-2类', '', 'AE0102');
INSERT INTO `qs_category` VALUES ('8', '2', 'B类-Ⅱ类', '', 'BE0200');
INSERT INTO `qs_category` VALUES ('9', '2', 'B类-Ⅲ类', '', 'BE0300');
INSERT INTO `qs_category` VALUES ('10', '3', 'C类-Ⅰ类', '', 'CE0100');
INSERT INTO `qs_category` VALUES ('11', '3', 'C类-Ⅱ类', '', 'CE0200');
INSERT INTO `qs_category` VALUES ('12', '3', 'C类-Ⅲ类', '', 'CE0300');
INSERT INTO `qs_category` VALUES ('15', '4', 'A类-Ⅰ类-3类', '', 'AE0103');
INSERT INTO `qs_category` VALUES ('16', '5', 'A类-Ⅱ类-1类', '', 'AE0201');
INSERT INTO `qs_category` VALUES ('17', '5', 'A类-Ⅱ类-2类', '', 'AE0202');
INSERT INTO `qs_category` VALUES ('18', '5', 'A类-Ⅱ类-3类', '', 'AE0203');
INSERT INTO `qs_category` VALUES ('19', '6', 'A类-Ⅲ类-1类', '', 'AE0301');
INSERT INTO `qs_category` VALUES ('20', '6', 'A类-Ⅲ类-2类', '', 'AE0302');
INSERT INTO `qs_category` VALUES ('21', '6', 'A类-Ⅲ类-3类', '', 'AE0303');
INSERT INTO `qs_category` VALUES ('22', '7', 'B类-Ⅰ类-1类', '', 'BE0101');
INSERT INTO `qs_category` VALUES ('23', '7', 'B类-Ⅰ类-2类', '', 'BE0102');
INSERT INTO `qs_category` VALUES ('24', '7', 'B类-Ⅰ类-3类', '', 'BE0103');
INSERT INTO `qs_category` VALUES ('25', '8', 'B类-Ⅱ类-1类', '', 'BE0201');
INSERT INTO `qs_category` VALUES ('26', '8', 'B类-Ⅱ类-2类', '', 'BE0202');
INSERT INTO `qs_category` VALUES ('27', '8', 'B类-Ⅱ类-3类', '', 'BE0203');
INSERT INTO `qs_category` VALUES ('28', '9', 'B类-Ⅲ类-1类', '', 'BE0301');
INSERT INTO `qs_category` VALUES ('29', '9', 'B类-Ⅲ类-2类', '', 'BE0302');
INSERT INTO `qs_category` VALUES ('30', '9', 'B类-Ⅲ类-3类', '', 'BE0303');
INSERT INTO `qs_category` VALUES ('31', '10', 'C类-Ⅰ类-1类', '', 'CE0101');
INSERT INTO `qs_category` VALUES ('32', '10', 'C类-Ⅰ类-2类', '', 'CE0102');
INSERT INTO `qs_category` VALUES ('33', '10', 'C类-Ⅰ类-3类', '', 'CE0103');
INSERT INTO `qs_category` VALUES ('34', '11', 'C类-Ⅱ类-1类', '', 'CE0201');
INSERT INTO `qs_category` VALUES ('35', '11', 'C类-Ⅱ类-2类', '', 'CE0202');
INSERT INTO `qs_category` VALUES ('36', '11', 'C类-Ⅱ类-3类', '', 'CE0203');
INSERT INTO `qs_category` VALUES ('37', '12', 'C类-Ⅲ类-1类', '', 'CE0301');
INSERT INTO `qs_category` VALUES ('38', '12', 'C类-Ⅲ类-2类', '', 'CE0302');
INSERT INTO `qs_category` VALUES ('39', '12', 'C类-Ⅲ类-3类', '', 'CE0303');
INSERT INTO `qs_category` VALUES ('13', '4', 'A类-Ⅰ类-1类', '', 'AE0101');

-- ----------------------------
-- Table structure for qs_dept
-- ----------------------------
DROP TABLE IF EXISTS `qs_dept`;
CREATE TABLE `qs_dept` (
  `dept_id` int(5) NOT NULL AUTO_INCREMENT,
  `dept_pid` int(5) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `detail` tinytext,
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `dept_level` tinyint(1) DEFAULT NULL,
  `dept_path` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_dept
-- ----------------------------
INSERT INTO `qs_dept` VALUES ('101', '0', '安防部', '大厅一层 103', '安防的', '搞安防的asf', 'asdf', '0', '101');
INSERT INTO `qs_dept` VALUES ('102', '0', '消防部', '大厅二层 206', 'adsgasfdsadfsda', '搞消防的', '', '0', '102');
INSERT INTO `qs_dept` VALUES ('103', '0', '自控部', '大厅一层 110', 'fddddddddddd', '搞自控的', '', '0', '103');
INSERT INTO `qs_dept` VALUES ('104', '0', '巡查部', '大厅二层 201', 'adfgfdag', '巡查巡检的', '', '0', '104');
INSERT INTO `qs_dept` VALUES ('105', '0', '设备部', '大厅一层 115', 'adsfgafgagafd', '管理设备的', '', '0', '105');
INSERT INTO `qs_dept` VALUES ('106', '0', '档案部', '大厅二层 210', 'afddddddd', '管理档案的', '', '0', '106');
INSERT INTO `qs_dept` VALUES ('107', '0', '入廊企业部', '大厅二层 201', 'aaaaaaaaaaaaa', '入廊企业管理的', '', '0', '107');
INSERT INTO `qs_dept` VALUES ('108', '0', '人员管理部', '大厅一层 102', 'tsghfnherttr', '人员管理的', '', '0', '108');
INSERT INTO `qs_dept` VALUES ('109', '101', '发噶', '大厅一层 102', 'ads', 'afssdaf', null, '1', '109');
INSERT INTO `qs_dept` VALUES ('118', '104', '修水管', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', null, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '0', '118');

-- ----------------------------
-- Table structure for qs_eqpts
-- ----------------------------
DROP TABLE IF EXISTS `qs_eqpts`;
CREATE TABLE `qs_eqpts` (
  `eqpt_id` int(11) NOT NULL AUTO_INCREMENT,
  `eqpt_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `eqpt_num` varchar(100) DEFAULT NULL COMMENT '设备编号',
  `eqpt_brand` varchar(100) DEFAULT NULL,
  `eqpt_cate_id` int(11) NOT NULL COMMENT '设备类型父类id',
  `eqpt_model` varchar(255) DEFAULT '' COMMENT '设备型号',
  `eqpt_site_id` int(11) DEFAULT NULL,
  `eqpt_site_detail` varchar(50) DEFAULT NULL,
  `eqpt_status` enum('报废','故障','正常') NOT NULL DEFAULT '正常',
  `eqpt_ins_time` int(11) DEFAULT NULL COMMENT '设备安装时间',
  `eqpt_had_model` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有模型',
  PRIMARY KEY (`eqpt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_eqpts
-- ----------------------------
INSERT INTO `qs_eqpts` VALUES ('1', '标清网络摄像机', '190328-CE0301-00001', 'uniview', '37', 'SIC335D-VIR', '23', 'ad', '正常', '1556008000', '0');
INSERT INTO `qs_eqpts` VALUES ('2', '超高清网络摄像机', '180614-CE0302-00002', 'uniview', '38', 'HIV1631DX33-C-U', '28', null, '正常', '1556007046', '0');
INSERT INTO `qs_eqpts` VALUES ('3', '高清网络摄像机', '190328-CE0303-00003', 'uniview', '39', 'HIC2201E-CF36IR', '30', null, '正常', '1556008015', '0');
INSERT INTO `qs_eqpts` VALUES ('4', '标清网络摄像机', '190328-CE0301-00004', 'uniview', '37', 'SIC335D-VIR', '27', null, '故障', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('5', '超高清网络摄像机', '190328-CE0302-00005', 'uniview', '38', 'HIV1631DX33-C-U', '25', null, '正常', '1556007824', '0');
INSERT INTO `qs_eqpts` VALUES ('6', '高清网络摄像机', '190328-CE0303-00006', 'uniview', '39', 'HIC2201E-CF36IR', '22', null, '正常', '1556007958', '0');
INSERT INTO `qs_eqpts` VALUES ('7', '标清网络摄像机', '190224-CE0301-00007', 'uniview', '37', 'SIC335D-VIR', '26', null, '故障', '1556007777', '0');
INSERT INTO `qs_eqpts` VALUES ('8', '超高清网络摄像机', '190328-CE0302-00008', 'uniview', '38', 'HIV1631DX33-C-U', '19', null, '正常', '1556007999', '0');
INSERT INTO `qs_eqpts` VALUES ('9', '高清网络摄像机', '190328-CE0303-00009', 'uniview', '39', 'HIC2201E-CF36IR', '26', null, '正常', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('10', '高清网络摄像机', '190328-CE0303-00010', 'uniview', '39', 'HIC2201E-CF36IR', '24', null, '报废', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('11', '标清网络摄像机', '190325-CE0301-00011', 'uniview', '37', 'SIC335D-VIR', '25', null, '报废', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('12', '超高清网络摄像机', '190328-CE0302-00012', 'uniview', '38', 'HIV1631DX33-C-U', '21', null, '正常', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('13', '超高清网络摄像机', '190328-CE0302-00013', 'uniview', '38', 'HIV1631DX33-C-U', '23', null, '正常', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('14', '超高清网络摄像机', '190328-CE0302-00014', 'uniview', '38', 'HIV1631DX33-C-U', '24', null, '报废', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('15', '超高清网络摄像机', '190328-CE0302-00015', 'uniview', '38', 'HIV1631DX33-C-U', '28', null, '故障', '1556007916', '0');
INSERT INTO `qs_eqpts` VALUES ('16', '超高清网络摄像机', '190328-CE0302-00016', 'dahuaaaa', '38', 'SIC335D-VIR', '28', null, '报废', '1556008046', '0');
INSERT INTO `qs_eqpts` VALUES ('17', '标清网络摄像机', '190423-AE0200-00017', '大华', '5', 'Isdsfa-dsafa-afd', '43', null, '故障', '1556008046', '0');
INSERT INTO `qs_eqpts` VALUES ('18', 'aaaaaa', '190425-BE0302-00018', 'aaa', '29', 'aaa', '43', null, '故障', '1556153585', '0');
INSERT INTO `qs_eqpts` VALUES ('19', 'aaaaaa', '190425-BE0302-00019', 'aaa', '29', 'aaa', '43', null, '正常', '1556153585', '0');
INSERT INTO `qs_eqpts` VALUES ('20', '超高清网络摄像机', '190425-CE0302-00020', 'dahua', '38', 'SIC335D-VIR', '43', null, '故障', '1556008046', '0');
INSERT INTO `qs_eqpts` VALUES ('21', '1111111111', '190425-BE0300-00021', '12312', '9', '1111', '43', null, '正常', '1556008046', '0');
INSERT INTO `qs_eqpts` VALUES ('22', 'sadfsdafasf', '190426-CE0300-00022', 'asdfsafasdfdas', '12', 'asdfasdfasdf', '43', null, '故障', '1556007777', '0');

-- ----------------------------
-- Table structure for qs_eqpt_details
-- ----------------------------
DROP TABLE IF EXISTS `qs_eqpt_details`;
CREATE TABLE `qs_eqpt_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eqpt_id` int(11) DEFAULT NULL,
  `eqpt_rated` varchar(10) DEFAULT NULL COMMENT '设备额定功率',
  `eqpt_durable` tinyint(2) DEFAULT NULL COMMENT '设备默认使用年限',
  `eqpt_supplier` varchar(30) DEFAULT NULL,
  `eqpt_buyer` varchar(10) DEFAULT NULL COMMENT '设备采购人id',
  `eqpt_service_MP` varchar(100) DEFAULT NULL COMMENT '设备维护计划',
  `eqpt_quality` varchar(150) DEFAULT NULL COMMENT '质保信息',
  `eqpt_upkeep_info` varchar(255) DEFAULT NULL COMMENT '保养信息',
  `eqpt_remarks` text COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_eqpt_details
-- ----------------------------
INSERT INTO `qs_eqpt_details` VALUES ('1', '1', '1kw', '5', '大华石家庄', 'liu', '17321562218', '整机质保两年，配件质保三年', '定期巡视1', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('2', '2', '2kw', '5', '大华石家庄', 'zhang ', '17321562218', '整机质保两年，配件质保三年', '定期巡视2', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('3', '3', '3kw', '4', '大华石家庄', 'hu ', '17321562218', '整机质保两年，配件质保三年', '定期巡视3', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('4', '4', '4kw', '7', '大华石家庄', 'huang', '17321562218', '整机质保两年，配件质保三年', '定期巡视4', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('5', '5', '5kw', '5', '大华石家庄', 'wei', '17321562218', '整机质保两年，配件质保三年', '定期巡视5', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('6', '6', '6kw', '4', '大华石家庄', 'gong', '17321562218', '整机质保两年，配件质保三年', '定期巡视6', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('7', '7', '7kw', '3', '大华石家庄', 'zhu', '17321562218', '整机质保两年，配件质保三年', '定期巡视7', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('8', '8', '8kw', '3', '大华石家庄', 'li', '17321562218', '整机质保两年，配件质保三年', '定期巡视8', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('9', '9', '9kw', '2', '大华石家庄', 'zhao', '17321562218', '整机质保两年，配件质保三年', '定期巡视9', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('10', '10', '10kw', '5', '大华石家庄', 'hu ', '17321562218', '整机质保两年，配件质保三年', '定期巡视10', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('11', '11', '11kw', '4', '大华石家庄', 'zhao', '17321562218', '整机质保两年，配件质保三年', '定期巡视11', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('12', '12', '12kw', '7', '大华石家庄', 'xi', '17321562218', '整机质保两年，配件质保三年', '定期巡视12', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('13', '13', '13kw', '6', '大华石家庄', 'mao', '17321562218', '整机质保两年，配件质保三年', '定期巡视13', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('14', '14', '14kw', '5', '大华石家庄', 'gong', '17321562218', '整机质保两年，配件质保三年', '定期巡视14', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('15', '15', '15kw', '8', '大华石家庄', 'zhu', '17321562218', '整机质保两年，配件质保三年', '定期巡视15', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('16', '16', '11kw', '3', '大华石家庄', 'hu', '17321562218', '整机质保两年，配件质保三年', '定期巡视16', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('17', '17', '17kw', '2', '大华石家庄', 'liu', '17321562218', '整机质保两年，配件质保三年', '定期巡视17', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('18', '18', '18kw', '1', '大华石家庄', 'zhang ', '17321562218', '整机质保两年，配件质保三年', '定期巡视18', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('19', '19', '18kw', '1', '大华石家庄', 'zhang ', '17321562218', '整机质保两年，配件质保三年', '定期巡视18', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('20', '20', '16kw', '3', '大华石家庄', 'hu', '17321562218', '整机质保两年，配件质保三年', '定期巡视16aa', '配件如下：数据传输线一根，电源线一根');
INSERT INTO `qs_eqpt_details` VALUES ('21', '21', '15w', '4', 'aaaaa', 'zhanghui', '173424425542', 'aegadsgfadsfds', 'q34在辅导班是爱国范德萨发的说法大法师的发送', '阿朵司法所地方地方发多少范德萨富士达发的想法安德森');
INSERT INTO `qs_eqpt_details` VALUES ('22', '22', 'sadfdsaf', '3', 'asdfsdfasf', 'dgdfgdrg', 'dfgdfgsdg', 'sdafsasdfsdf', 'sfdsadfsadfsd', 'sadfdsfsdaf');

-- ----------------------------
-- Table structure for qs_manage
-- ----------------------------
DROP TABLE IF EXISTS `qs_manage`;
CREATE TABLE `qs_manage` (
  `mg_id` int(11) NOT NULL AUTO_INCREMENT,
  `mg_name` varchar(32) NOT NULL,
  `mg_pwd` varchar(32) NOT NULL,
  `ma_time` int(10) NOT NULL COMMENT '时间',
  `mg_role_id` tinyint(3) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`mg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_manage
-- ----------------------------

-- ----------------------------
-- Table structure for qs_replaces
-- ----------------------------
DROP TABLE IF EXISTS `qs_replaces`;
CREATE TABLE `qs_replaces` (
  `replace_id` int(11) NOT NULL AUTO_INCREMENT,
  `eqpt_id_old` int(11) DEFAULT NULL COMMENT '设备id',
  `eqpt_id_new` int(11) DEFAULT NULL,
  `replace_num` varchar(20) DEFAULT NULL COMMENT '工单号',
  `service_level` enum('一级','二级','三级') DEFAULT '一级' COMMENT '紧急程度',
  `service_group_id` varchar(11) DEFAULT NULL COMMENT '维修班组',
  `service_signer_id` varchar(10) DEFAULT NULL COMMENT '工单派发人id',
  `service_created_time` datetime DEFAULT NULL COMMENT '工单派发时间',
  `service_describe` varchar(200) DEFAULT NULL COMMENT '故障描述',
  PRIMARY KEY (`replace_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_replaces
-- ----------------------------
INSERT INTO `qs_replaces` VALUES ('1', '14', null, 'GH-190426-0014-0015', '一级', '张恒，刘备', '张泽', '2019-04-26 01:44:48', '阿凡达第三方');
INSERT INTO `qs_replaces` VALUES ('4', '16', null, 'GH-190426-0016-0015', '一级', '阿萨德发达省份', '张泽', '2019-04-26 01:48:46', '大师法打算范德萨浮点数发速读法');

-- ----------------------------
-- Table structure for qs_role
-- ----------------------------
DROP TABLE IF EXISTS `qs_role`;
CREATE TABLE `qs_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  `role_auth_ac` text,
  `role_auth_ids` varchar(255) DEFAULT NULL,
  `role_auth_names` varchar(255) DEFAULT NULL,
  `role_detail` tinytext,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_role
-- ----------------------------
INSERT INTO `qs_role` VALUES ('1', '职工', '#-#,people-index,#-#,enterprise-index,patrol-index', '108,106,107,105,104', '3D漫游,人员管理,应急指挥,入廊企业,巡查巡检', '职工');
INSERT INTO `qs_role` VALUES ('3', '主管', 'patrol-index,enterprise-index,people-index,#-#', '104,105,106,107', '巡查巡检,入廊企业,人员管理,应急指挥', '主管');
INSERT INTO `qs_role` VALUES ('4', '精英', 'run-index,eqpt-index,warning-index', '101,102,103', '运行管理,设备管理,报警信息', 'asdf');
INSERT INTO `qs_role` VALUES ('5', '荟萃', 'run-index,patrol-index,enterprise-index,people-index', '101,104,105,106', '运行管理,巡查巡检,入廊企业,人员管理', 'asdfasdfasd');
INSERT INTO `qs_role` VALUES ('6', '阿斯蒂芬', 'run-index,eqpt-index,warning-index', '101,102,103', '运行管理,设备管理,报警信息', 'sdf阿萨德发射点发');

-- ----------------------------
-- Table structure for qs_services
-- ----------------------------
DROP TABLE IF EXISTS `qs_services`;
CREATE TABLE `qs_services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `eqpt_id` int(11) DEFAULT NULL COMMENT '设备id',
  `service_num` varchar(20) DEFAULT NULL COMMENT '工单号',
  `service_level` enum('一级','二级','三级') DEFAULT '一级' COMMENT '紧急程度',
  `service_group_id` varchar(11) DEFAULT NULL COMMENT '维修班组',
  `service_signer_id` varchar(10) DEFAULT NULL COMMENT '工单派发人id',
  `service_created_time` datetime DEFAULT NULL COMMENT '工单派发时间',
  `service_describe` varchar(200) DEFAULT NULL COMMENT '故障描述',
  PRIMARY KEY (`service_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_services
-- ----------------------------
INSERT INTO `qs_services` VALUES ('1', '18', 'WX-190426-0018-0015', '一级', 'a', '张泽', '2019-04-26 10:12:19', 'a');
INSERT INTO `qs_services` VALUES ('2', '16', 'WX-190426-0016-0015', '二级', '吴力，张凯', '张泽', '2019-04-26 10:15:25', '大师法地方递四方大师法');
INSERT INTO `qs_services` VALUES ('3', '21', 'WX-190426-0021-0015', '一级', '张恒，刘备,ll', '张泽', '2019-04-26 10:20:49', '画面模糊、抖动');
INSERT INTO `qs_services` VALUES ('4', '15', 'WX-190426-0015-0015', '一级', 'affdsfsaf', '张泽', '2019-04-26 11:52:25', 'asdfsafasd');
INSERT INTO `qs_services` VALUES ('5', '17', 'WX-190426-0017-0015', '一级', '张恒，刘备', '张泽', '2019-04-26 12:08:30', 'dsfdfdsa');
INSERT INTO `qs_services` VALUES ('6', '22', 'WX-190426-0022-0015', '一级', 'gdgdfag', '张泽', '2019-04-26 05:28:48', 'adsgadsgadfg');

-- ----------------------------
-- Table structure for qs_site
-- ----------------------------
DROP TABLE IF EXISTS `qs_site`;
CREATE TABLE `qs_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_site
-- ----------------------------
INSERT INTO `qs_site` VALUES ('1', '0', '园博园大街');
INSERT INTO `qs_site` VALUES ('2', '0', '新城大道');
INSERT INTO `qs_site` VALUES ('3', '0', '太行大街');
INSERT INTO `qs_site` VALUES ('4', '0', '迎旭大道');
INSERT INTO `qs_site` VALUES ('5', '0', '隆兴路');
INSERT INTO `qs_site` VALUES ('6', '1', 'YBY-001');
INSERT INTO `qs_site` VALUES ('7', '1', 'YBY-002');
INSERT INTO `qs_site` VALUES ('8', '1', 'YBY-003');
INSERT INTO `qs_site` VALUES ('9', '1', 'YBY-004');
INSERT INTO `qs_site` VALUES ('10', '1', 'YBY-005');
INSERT INTO `qs_site` VALUES ('11', '1', 'YBY-006');
INSERT INTO `qs_site` VALUES ('12', '2', 'XC-001');
INSERT INTO `qs_site` VALUES ('13', '2', 'XC-002');
INSERT INTO `qs_site` VALUES ('14', '2', 'XC-003');
INSERT INTO `qs_site` VALUES ('15', '2', 'XC-004');
INSERT INTO `qs_site` VALUES ('16', '2', 'XC-005');
INSERT INTO `qs_site` VALUES ('17', '2', 'XC-006');
INSERT INTO `qs_site` VALUES ('18', '3', 'TH-001');
INSERT INTO `qs_site` VALUES ('19', '3', 'TH-002');
INSERT INTO `qs_site` VALUES ('20', '3', 'TH-003');
INSERT INTO `qs_site` VALUES ('21', '3', 'TH-004');
INSERT INTO `qs_site` VALUES ('22', '3', 'TH-005');
INSERT INTO `qs_site` VALUES ('23', '3', 'TH-006');
INSERT INTO `qs_site` VALUES ('24', '3', 'TH-007');
INSERT INTO `qs_site` VALUES ('25', '3', 'TH-008');
INSERT INTO `qs_site` VALUES ('26', '4', 'YX-001');
INSERT INTO `qs_site` VALUES ('27', '4', 'YX-002');
INSERT INTO `qs_site` VALUES ('28', '4', 'YX-003');
INSERT INTO `qs_site` VALUES ('29', '4', 'YX-004');
INSERT INTO `qs_site` VALUES ('30', '4', 'YX-005');
INSERT INTO `qs_site` VALUES ('31', '5', 'LX-001');
INSERT INTO `qs_site` VALUES ('32', '5', 'LX-002');
INSERT INTO `qs_site` VALUES ('33', '5', 'LX-003');
INSERT INTO `qs_site` VALUES ('34', '5', 'LX-004');
INSERT INTO `qs_site` VALUES ('35', '5', 'LX-005');
INSERT INTO `qs_site` VALUES ('36', '5', 'LX-006');
INSERT INTO `qs_site` VALUES ('37', '5', 'LX-007');
INSERT INTO `qs_site` VALUES ('38', '6', 'YBY-001-001');
INSERT INTO `qs_site` VALUES ('39', '6', 'YBY-001-002');
INSERT INTO `qs_site` VALUES ('40', '6', 'YBY-001-003');
INSERT INTO `qs_site` VALUES ('41', '7', 'YBY-002-001');
INSERT INTO `qs_site` VALUES ('42', '7', 'YBY-002-002');
INSERT INTO `qs_site` VALUES ('43', '8', 'YBY-003-001');
INSERT INTO `qs_site` VALUES ('999', '0', '未安装定位');
