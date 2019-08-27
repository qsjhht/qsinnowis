/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : new

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-08-27 22:10:42
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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

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
INSERT INTO `qs_auth` VALUES ('130', '分区管理', '107', 'Zone', 'index', '130', '1', '0', null);
INSERT INTO `qs_auth` VALUES ('131', '分类管理', '107', 'Category', 'index', '131', '1', '0', null);
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
  `cate_name` varchar(255) DEFAULT NULL COMMENT '当前种类名称',
  `cate_remark` varchar(255) DEFAULT NULL,
  `cate_num` varchar(10) DEFAULT NULL COMMENT '设备种类对应设备编号内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_category
-- ----------------------------
INSERT INTO `qs_category` VALUES ('1', '0', '视频监控系统', null, null);
INSERT INTO `qs_category` VALUES ('2', '1', '全功能宽动态摄像机、支架', null, null);
INSERT INTO `qs_category` VALUES ('3', '1', '夹层用动态摄像机、支架', null, null);
INSERT INTO `qs_category` VALUES ('4', '1', '高速球型摄像机、支架', null, null);
INSERT INTO `qs_category` VALUES ('5', '1', '枪机综合电源', null, null);
INSERT INTO `qs_category` VALUES ('6', '1', '球机综合电源', null, null);
INSERT INTO `qs_category` VALUES ('7', '0', '入侵报警系统', null, null);
INSERT INTO `qs_category` VALUES ('8', '7', '三鉴探测器', null, null);
INSERT INTO `qs_category` VALUES ('9', '7', '红外光栅探测器', null, null);
INSERT INTO `qs_category` VALUES ('10', '7', '入侵报警主机', null, null);
INSERT INTO `qs_category` VALUES ('11', '0', '出入口控制系统', null, null);
INSERT INTO `qs_category` VALUES ('12', '11', '防火门', null, null);
INSERT INTO `qs_category` VALUES ('13', '11', '门禁控制器', null, null);
INSERT INTO `qs_category` VALUES ('14', '11', '刷卡器', null, null);
INSERT INTO `qs_category` VALUES ('15', '11', '闭门器', null, null);
INSERT INTO `qs_category` VALUES ('16', '11', '电磁锁', null, null);
INSERT INTO `qs_category` VALUES ('17', '11', '模块门禁控制箱', null, null);
INSERT INTO `qs_category` VALUES ('18', '11', '门禁锁电源', null, null);
INSERT INTO `qs_category` VALUES ('19', '11', '智能发卡器', null, null);
INSERT INTO `qs_category` VALUES ('20', '11', '智能卡', null, null);
INSERT INTO `qs_category` VALUES ('21', '0', '机器人系统', null, null);
INSERT INTO `qs_category` VALUES ('22', '21', '巡检机器人(挂轨式)', null, null);
INSERT INTO `qs_category` VALUES ('23', '21', '分布式充电桩', null, null);
INSERT INTO `qs_category` VALUES ('24', '21', '异形防火门', null, null);
INSERT INTO `qs_category` VALUES ('25', '21', '投放轮滑式机器人', null, null);
INSERT INTO `qs_category` VALUES ('26', '0', '环境监控与报警系统', null, null);
INSERT INTO `qs_category` VALUES ('27', '26', '温湿度检测仪', null, null);
INSERT INTO `qs_category` VALUES ('28', '26', '甲烷检测仪', null, null);
INSERT INTO `qs_category` VALUES ('29', '26', '硫化氢检测仪', null, null);
INSERT INTO `qs_category` VALUES ('30', '26', '氧气检测仪', null, null);
INSERT INTO `qs_category` VALUES ('31', '26', '超声波液位传感器', null, null);
INSERT INTO `qs_category` VALUES ('32', '26', 'ACU箱', null, null);
INSERT INTO `qs_category` VALUES ('33', '26', '电源 AC120/230V', null, null);
INSERT INTO `qs_category` VALUES ('34', '26', '马达保护器(水泵)', null, null);
INSERT INTO `qs_category` VALUES ('35', '26', '马达保护器(风机)', null, null);
INSERT INTO `qs_category` VALUES ('36', '0', 'PLC自控系统', null, null);
INSERT INTO `qs_category` VALUES ('37', '36', '继电器 R7-K1~6', null, null);
INSERT INTO `qs_category` VALUES ('38', '36', '继电器 R8-K1~6', null, null);
INSERT INTO `qs_category` VALUES ('39', '36', 'ACU 远程IO箱', null, null);
INSERT INTO `qs_category` VALUES ('40', '36', '柜内日光灯管', null, null);
INSERT INTO `qs_category` VALUES ('41', '0', '应急指挥系统', null, null);
INSERT INTO `qs_category` VALUES ('42', '41', 'IP电话分机以及支架', null, null);
INSERT INTO `qs_category` VALUES ('43', '0', '通风系统', null, null);
INSERT INTO `qs_category` VALUES ('44', '43', '离心式屋顶风机', null, null);
INSERT INTO `qs_category` VALUES ('45', '43', '离心式屋顶风机#2', null, null);
INSERT INTO `qs_category` VALUES ('46', '43', '电动排烟防火调节阀', null, null);
INSERT INTO `qs_category` VALUES ('47', '43', '电动防火调节阀', null, null);
INSERT INTO `qs_category` VALUES ('48', '43', '空调', null, null);
INSERT INTO `qs_category` VALUES ('49', '43', '圆形防火调节阀', null, null);
INSERT INTO `qs_category` VALUES ('50', '43', '圆形防火止回阀', null, null);
INSERT INTO `qs_category` VALUES ('51', '43', '排烟混流风机', null, null);
INSERT INTO `qs_category` VALUES ('52', '43', '混流风机', null, null);
INSERT INTO `qs_category` VALUES ('53', '43', '矩形防火防烟调节阀', null, null);
INSERT INTO `qs_category` VALUES ('54', '43', '风冷柜式空调机', null, null);
INSERT INTO `qs_category` VALUES ('55', '43', '矩形防烟防火调节阀', null, null);
INSERT INTO `qs_category` VALUES ('56', '0', '动力配电系统', null, null);
INSERT INTO `qs_category` VALUES ('57', '56', '动力照明配电箱 56kW', null, null);
INSERT INTO `qs_category` VALUES ('58', '56', '动力照明配电箱 18kW', null, null);
INSERT INTO `qs_category` VALUES ('59', '56', '风机控制箱', null, null);
INSERT INTO `qs_category` VALUES ('60', '56', '风机按钮盒', null, null);
INSERT INTO `qs_category` VALUES ('61', '56', '照明配电箱', null, null);
INSERT INTO `qs_category` VALUES ('62', '56', '等位端子箱', null, null);
INSERT INTO `qs_category` VALUES ('63', '56', '检修配电箱', null, null);
INSERT INTO `qs_category` VALUES ('64', '56', 'UPS电源', null, null);
INSERT INTO `qs_category` VALUES ('65', '56', '消防配电箱 3kw', null, null);
INSERT INTO `qs_category` VALUES ('66', '56', '防火门及防火封堵', null, null);
INSERT INTO `qs_category` VALUES ('67', '0', '电子巡更系统', null, null);
INSERT INTO `qs_category` VALUES ('68', '67', '无线AP', null, null);
INSERT INTO `qs_category` VALUES ('69', '0', '人员定位系统', null, null);
INSERT INTO `qs_category` VALUES ('70', '69', '手持移动端', null, null);
INSERT INTO `qs_category` VALUES ('71', '0', '智能照明系统', null, null);
INSERT INTO `qs_category` VALUES ('72', '71', '单管 LED灯 AC220V18W', null, null);
INSERT INTO `qs_category` VALUES ('73', '71', 'LED灯(应急) 18W,AC220V', null, null);
INSERT INTO `qs_category` VALUES ('74', '71', 'LED灯 2x18W,AC220V', null, null);
INSERT INTO `qs_category` VALUES ('75', '71', 'LED灯(应急) 2x18W,AC220V', null, null);
INSERT INTO `qs_category` VALUES ('76', '71', '单管LED灯(应急)AC220V,1x18W', null, null);
INSERT INTO `qs_category` VALUES ('77', '71', '单管LED灯', null, null);
INSERT INTO `qs_category` VALUES ('78', '71', '安全出口指示灯', null, null);
INSERT INTO `qs_category` VALUES ('79', '0', '沉降系统', null, null);
INSERT INTO `qs_category` VALUES ('80', '79', '拉线式位移传感器', null, null);
INSERT INTO `qs_category` VALUES ('81', '79', '数据采集仪', null, null);
INSERT INTO `qs_category` VALUES ('82', '79', '倾角传感器及支架', null, null);
INSERT INTO `qs_category` VALUES ('83', '79', '压差式静力水准仪及支架', null, null);
INSERT INTO `qs_category` VALUES ('84', '79', '储液罐及支架', null, null);
INSERT INTO `qs_category` VALUES ('85', '0', '消防系统', null, null);
INSERT INTO `qs_category` VALUES ('86', '85', '光电式感烟探测器', null, null);
INSERT INTO `qs_category` VALUES ('87', '85', '声光报警器', null, null);
INSERT INTO `qs_category` VALUES ('88', '85', '线型光纤感温火灾探测器', null, null);
INSERT INTO `qs_category` VALUES ('89', '85', '剩余电流式电气火灾监控探测器', null, null);
INSERT INTO `qs_category` VALUES ('90', '85', '测温式电气火灾监控探测器', null, null);
INSERT INTO `qs_category` VALUES ('91', '85', '壁挂式安全出口标志灯具', null, null);
INSERT INTO `qs_category` VALUES ('92', '85', '壁挂式单向指示标志灯具左/右向', null, null);
INSERT INTO `qs_category` VALUES ('93', '85', '应急照明分配电装置', null, null);
INSERT INTO `qs_category` VALUES ('94', '85', '应急照明集中电源', null, null);
INSERT INTO `qs_category` VALUES ('95', '85', '消防电话', null, null);
INSERT INTO `qs_category` VALUES ('96', '85', '自动灭火装置(超细干粉)', null, null);
INSERT INTO `qs_category` VALUES ('97', '0', '电子标签', null, null);
INSERT INTO `qs_category` VALUES ('98', '97', '电子标签', null, null);
INSERT INTO `qs_category` VALUES ('99', '97', '普通电子标签', null, null);
INSERT INTO `qs_category` VALUES ('100', '0', '排水系统', null, null);
INSERT INTO `qs_category` VALUES ('101', '100', '潜水排污泵 2.2-15', null, null);
INSERT INTO `qs_category` VALUES ('102', '100', '球形止回阀', null, null);
INSERT INTO `qs_category` VALUES ('103', '100', '潜水排污泵 4-10', null, null);
INSERT INTO `qs_category` VALUES ('104', '100', '潜水排污泵 2.2-10', null, null);
INSERT INTO `qs_category` VALUES ('105', '100', '手动蝶阀', null, null);
INSERT INTO `qs_category` VALUES ('106', '100', 'A型潜污排污泵', null, null);
INSERT INTO `qs_category` VALUES ('107', '100', 'B型潜污排污泵', null, null);
INSERT INTO `qs_category` VALUES ('108', '100', 'C型潜污排污泵', null, null);
INSERT INTO `qs_category` VALUES ('109', '100', '旋启式止回阀', null, null);
INSERT INTO `qs_category` VALUES ('110', '100', '潜水排污泵', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_role
-- ----------------------------
INSERT INTO `qs_role` VALUES ('1', 'aaaa', 'Visual-index,Visual-bim,Enterprise-index,Eqpt-ledger,Patrol-live,Patrol-setting,Patrol-manage,Patrol-log', '101,102,110,117,118,119,120,106,', '大数据,bim,设备台账,巡查巡检实况,路线规划,任务管理,任务日志,教育培训,', 'vvv');
INSERT INTO `qs_role` VALUES ('2', '圣达菲', 'Eqpt-ledger,Eqpt-cancel,Eqpt-disassemble,Service-index,Replace-index,Eqpt-plan,Eqpt-forms,Video-liveplay,Video-replay', '110,111,112,113,114,115,116,124,125,', '设备台账,销账处理,设备拆解,设备维修,设备更换,维护计划,维护报表,实时视频,视频回放,', '打算范德萨发');
INSERT INTO `qs_role` VALUES ('3', 'asd', 'Eqpt-ledger,Eqpt-cancel,Eqpt-forms', '110,111,116,', '设备台账,销账处理,维护报表,', 'asdasd');
INSERT INTO `qs_role` VALUES ('12', 'asdfas ', 'Visual-index,Visual-bim,Eqpt-index,Patrol-index,Enterprise-index,basic-index,User-index,Robot-index,Eqpt-ledger,Eqpt-cancel,Eqpt-disassemble,Service-index,Replace-index,Eqpt-plan,Eqpt-forms,Patrol-live,Patrol-setting,Patrol-manage,Patrol-log,Zone-index,Category-index,dept-index,Video-index,Video-liveplay,Video-replay,Role-index', null, null, 'sdaff');

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
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_site
-- ----------------------------
INSERT INTO `qs_site` VALUES ('1', '0', '园博园大街');
INSERT INTO `qs_site` VALUES ('2', '0', '新城大道');
INSERT INTO `qs_site` VALUES ('3', '0', '太行大街');
INSERT INTO `qs_site` VALUES ('4', '0', '隆兴路');
INSERT INTO `qs_site` VALUES ('5', '0', '迎旭路');
INSERT INTO `qs_site` VALUES ('6', '1', 'YBY01');
INSERT INTO `qs_site` VALUES ('7', '1', 'YBY02');
INSERT INTO `qs_site` VALUES ('8', '1', 'YBY03');
INSERT INTO `qs_site` VALUES ('9', '1', 'YBY04');
INSERT INTO `qs_site` VALUES ('10', '1', 'YBY05');
INSERT INTO `qs_site` VALUES ('11', '1', 'YBY06');
INSERT INTO `qs_site` VALUES ('12', '1', 'YBY07');
INSERT INTO `qs_site` VALUES ('13', '1', 'YBY08');
INSERT INTO `qs_site` VALUES ('14', '1', 'YBY09');
INSERT INTO `qs_site` VALUES ('15', '1', 'YBY10');
INSERT INTO `qs_site` VALUES ('16', '1', 'YBY11');
INSERT INTO `qs_site` VALUES ('17', '1', 'YBY12');
INSERT INTO `qs_site` VALUES ('18', '1', 'YBY13');
INSERT INTO `qs_site` VALUES ('19', '1', 'YBY14');
INSERT INTO `qs_site` VALUES ('20', '1', 'YBY15');
INSERT INTO `qs_site` VALUES ('21', '1', 'YBY16');
INSERT INTO `qs_site` VALUES ('22', '1', 'YBY17');
INSERT INTO `qs_site` VALUES ('23', '1', 'YBY18');
INSERT INTO `qs_site` VALUES ('24', '1', 'YBY19');
INSERT INTO `qs_site` VALUES ('25', '1', 'YBY20');
INSERT INTO `qs_site` VALUES ('26', '1', 'YBY21');
INSERT INTO `qs_site` VALUES ('27', '2', 'XC01');
INSERT INTO `qs_site` VALUES ('28', '2', 'XC02');
INSERT INTO `qs_site` VALUES ('29', '2', 'XC03');
INSERT INTO `qs_site` VALUES ('30', '2', 'XC04');
INSERT INTO `qs_site` VALUES ('31', '2', 'XC05');
INSERT INTO `qs_site` VALUES ('32', '2', 'XC06');
INSERT INTO `qs_site` VALUES ('33', '2', 'XC07');
INSERT INTO `qs_site` VALUES ('34', '2', 'XC08');
INSERT INTO `qs_site` VALUES ('35', '2', 'XC09');
INSERT INTO `qs_site` VALUES ('36', '2', 'XC10');
INSERT INTO `qs_site` VALUES ('37', '2', 'XC11');
INSERT INTO `qs_site` VALUES ('38', '2', 'XC12');
INSERT INTO `qs_site` VALUES ('39', '2', 'XC13');
INSERT INTO `qs_site` VALUES ('40', '2', 'XC14');
INSERT INTO `qs_site` VALUES ('41', '2', 'XC15');
INSERT INTO `qs_site` VALUES ('42', '2', 'XC16');
INSERT INTO `qs_site` VALUES ('43', '2', 'XC17');
INSERT INTO `qs_site` VALUES ('44', '2', 'XC18');
INSERT INTO `qs_site` VALUES ('45', '2', 'XC19');
INSERT INTO `qs_site` VALUES ('46', '2', 'XC20');
INSERT INTO `qs_site` VALUES ('47', '2', 'XC21');
INSERT INTO `qs_site` VALUES ('48', '3', 'TH01');
INSERT INTO `qs_site` VALUES ('49', '3', 'TH02');
INSERT INTO `qs_site` VALUES ('50', '3', 'TH03');
INSERT INTO `qs_site` VALUES ('51', '3', 'TH04');
INSERT INTO `qs_site` VALUES ('52', '3', 'TH05');
INSERT INTO `qs_site` VALUES ('53', '3', 'TH06');
INSERT INTO `qs_site` VALUES ('54', '3', 'TH07');
INSERT INTO `qs_site` VALUES ('55', '3', 'TH08');
INSERT INTO `qs_site` VALUES ('56', '3', 'TH09');
INSERT INTO `qs_site` VALUES ('57', '3', 'TH10');
INSERT INTO `qs_site` VALUES ('58', '3', 'TH11');
INSERT INTO `qs_site` VALUES ('59', '3', 'TH12');
INSERT INTO `qs_site` VALUES ('60', '3', 'TH13');
INSERT INTO `qs_site` VALUES ('61', '3', 'TH14');
INSERT INTO `qs_site` VALUES ('62', '3', 'TH15');
INSERT INTO `qs_site` VALUES ('63', '3', 'TH16');
INSERT INTO `qs_site` VALUES ('64', '3', 'TH17');
INSERT INTO `qs_site` VALUES ('65', '3', 'TH18');
INSERT INTO `qs_site` VALUES ('66', '3', 'TH19');
INSERT INTO `qs_site` VALUES ('67', '3', 'TH20');
INSERT INTO `qs_site` VALUES ('68', '3', 'TH21');
INSERT INTO `qs_site` VALUES ('69', '4', 'LX01');
INSERT INTO `qs_site` VALUES ('70', '4', 'LX02');
INSERT INTO `qs_site` VALUES ('71', '4', 'LX03');
INSERT INTO `qs_site` VALUES ('72', '4', 'LX04');
INSERT INTO `qs_site` VALUES ('73', '4', 'LX05');
INSERT INTO `qs_site` VALUES ('74', '4', 'LX06');
INSERT INTO `qs_site` VALUES ('75', '4', 'LX07');
INSERT INTO `qs_site` VALUES ('76', '4', 'LX08');
INSERT INTO `qs_site` VALUES ('77', '4', 'LX09');
INSERT INTO `qs_site` VALUES ('78', '4', 'LX10');
INSERT INTO `qs_site` VALUES ('79', '4', 'LX11');
INSERT INTO `qs_site` VALUES ('80', '5', 'YX01');
INSERT INTO `qs_site` VALUES ('81', '5', 'YX02');
INSERT INTO `qs_site` VALUES ('82', '5', 'YX03');
INSERT INTO `qs_site` VALUES ('83', '5', 'YX04');
INSERT INTO `qs_site` VALUES ('84', '5', 'YX05');
INSERT INTO `qs_site` VALUES ('85', '5', 'YX06');
INSERT INTO `qs_site` VALUES ('86', '5', 'YX07');
INSERT INTO `qs_site` VALUES ('87', '5', 'YX08');
INSERT INTO `qs_site` VALUES ('88', '5', 'YX09');
INSERT INTO `qs_site` VALUES ('89', '5', 'YX10');
INSERT INTO `qs_site` VALUES ('90', '5', 'YX11');
INSERT INTO `qs_site` VALUES ('91', '5', 'YX12');
INSERT INTO `qs_site` VALUES ('92', '5', 'YX13');
INSERT INTO `qs_site` VALUES ('93', '5', 'YX14');
INSERT INTO `qs_site` VALUES ('94', '5', 'YX15');
INSERT INTO `qs_site` VALUES ('95', '5', 'YX16');
INSERT INTO `qs_site` VALUES ('96', '5', 'YX17');
INSERT INTO `qs_site` VALUES ('97', '5', 'YX18');
INSERT INTO `qs_site` VALUES ('98', '5', 'YX19');
INSERT INTO `qs_site` VALUES ('99', '5', 'YX20');
INSERT INTO `qs_site` VALUES ('100', '5', 'YX21');

-- ----------------------------
-- Table structure for qs_sitefrash
-- ----------------------------
DROP TABLE IF EXISTS `qs_sitefrash`;
CREATE TABLE `qs_sitefrash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=670 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_sitefrash
-- ----------------------------
INSERT INTO `qs_sitefrash` VALUES ('1', '0', '尉佗街');
INSERT INTO `qs_sitefrash` VALUES ('2', '1', 'WTA01');
INSERT INTO `qs_sitefrash` VALUES ('3', '1', 'WTA02');
INSERT INTO `qs_sitefrash` VALUES ('4', '1', 'WTA03');
INSERT INTO `qs_sitefrash` VALUES ('5', '1', 'WTA04');
INSERT INTO `qs_sitefrash` VALUES ('6', '1', 'WTA05');
INSERT INTO `qs_sitefrash` VALUES ('7', '1', 'WTA06');
INSERT INTO `qs_sitefrash` VALUES ('8', '1', 'WTA07');
INSERT INTO `qs_sitefrash` VALUES ('9', '1', 'WTA08');
INSERT INTO `qs_sitefrash` VALUES ('10', '1', 'WTA09');
INSERT INTO `qs_sitefrash` VALUES ('11', '1', 'WTA10');
INSERT INTO `qs_sitefrash` VALUES ('12', '1', 'WTA11');
INSERT INTO `qs_sitefrash` VALUES ('13', '1', 'WTA12');
INSERT INTO `qs_sitefrash` VALUES ('14', '1', 'WTB01');
INSERT INTO `qs_sitefrash` VALUES ('15', '1', 'WTB02');
INSERT INTO `qs_sitefrash` VALUES ('16', '1', 'WTB03');
INSERT INTO `qs_sitefrash` VALUES ('17', '1', 'WTB04');
INSERT INTO `qs_sitefrash` VALUES ('18', '1', 'WTB05');
INSERT INTO `qs_sitefrash` VALUES ('19', '1', 'WTB06');
INSERT INTO `qs_sitefrash` VALUES ('20', '1', 'WTB07');
INSERT INTO `qs_sitefrash` VALUES ('21', '1', 'WTB08');
INSERT INTO `qs_sitefrash` VALUES ('22', '1', 'WTB09');
INSERT INTO `qs_sitefrash` VALUES ('23', '1', 'WTB10');
INSERT INTO `qs_sitefrash` VALUES ('24', '1', 'WTB11');
INSERT INTO `qs_sitefrash` VALUES ('25', '1', 'WTB12');
INSERT INTO `qs_sitefrash` VALUES ('26', '1', 'WTD01');
INSERT INTO `qs_sitefrash` VALUES ('27', '1', 'WTD02');
INSERT INTO `qs_sitefrash` VALUES ('28', '1', 'WTD03');
INSERT INTO `qs_sitefrash` VALUES ('29', '1', 'WTD04');
INSERT INTO `qs_sitefrash` VALUES ('30', '1', 'WTD05');
INSERT INTO `qs_sitefrash` VALUES ('31', '1', 'WTD06');
INSERT INTO `qs_sitefrash` VALUES ('32', '1', 'WTD07');
INSERT INTO `qs_sitefrash` VALUES ('33', '1', 'WTD08');
INSERT INTO `qs_sitefrash` VALUES ('34', '1', 'WTD09');
INSERT INTO `qs_sitefrash` VALUES ('35', '1', 'WTD10');
INSERT INTO `qs_sitefrash` VALUES ('36', '1', 'WTD11');
INSERT INTO `qs_sitefrash` VALUES ('37', '1', 'WTC01');
INSERT INTO `qs_sitefrash` VALUES ('38', '1', 'WTC02');
INSERT INTO `qs_sitefrash` VALUES ('39', '1', 'WTC03');
INSERT INTO `qs_sitefrash` VALUES ('40', '1', 'WTC04');
INSERT INTO `qs_sitefrash` VALUES ('41', '1', 'WTC05');
INSERT INTO `qs_sitefrash` VALUES ('42', '1', 'WTC06');
INSERT INTO `qs_sitefrash` VALUES ('43', '1', 'WTC07');
INSERT INTO `qs_sitefrash` VALUES ('91', '1', 'WTC15');
INSERT INTO `qs_sitefrash` VALUES ('90', '1', 'WTC14');
INSERT INTO `qs_sitefrash` VALUES ('89', '1', 'WTC13');
INSERT INTO `qs_sitefrash` VALUES ('88', '1', 'WTD24');
INSERT INTO `qs_sitefrash` VALUES ('87', '1', 'WTD23');
INSERT INTO `qs_sitefrash` VALUES ('86', '1', 'WTD22');
INSERT INTO `qs_sitefrash` VALUES ('85', '1', 'WTD21');
INSERT INTO `qs_sitefrash` VALUES ('84', '1', 'WTD20');
INSERT INTO `qs_sitefrash` VALUES ('83', '1', 'WTD19');
INSERT INTO `qs_sitefrash` VALUES ('82', '1', 'WTD18');
INSERT INTO `qs_sitefrash` VALUES ('81', '1', 'WTB24');
INSERT INTO `qs_sitefrash` VALUES ('80', '1', 'WTB23');
INSERT INTO `qs_sitefrash` VALUES ('79', '1', 'WTB22');
INSERT INTO `qs_sitefrash` VALUES ('78', '1', 'WTB21');
INSERT INTO `qs_sitefrash` VALUES ('77', '1', 'WTB20');
INSERT INTO `qs_sitefrash` VALUES ('76', '1', 'WTB19');
INSERT INTO `qs_sitefrash` VALUES ('75', '1', 'WTB18');
INSERT INTO `qs_sitefrash` VALUES ('74', '1', 'WTA24');
INSERT INTO `qs_sitefrash` VALUES ('73', '1', 'WTA23');
INSERT INTO `qs_sitefrash` VALUES ('72', '1', 'WTA22');
INSERT INTO `qs_sitefrash` VALUES ('71', '1', 'WTA21');
INSERT INTO `qs_sitefrash` VALUES ('70', '1', 'WTA20');
INSERT INTO `qs_sitefrash` VALUES ('69', '1', 'WTA19');
INSERT INTO `qs_sitefrash` VALUES ('68', '1', 'WTA18');
INSERT INTO `qs_sitefrash` VALUES ('94', '1', 'WTC18');
INSERT INTO `qs_sitefrash` VALUES ('93', '1', 'WTC17');
INSERT INTO `qs_sitefrash` VALUES ('92', '1', 'WTC16');
INSERT INTO `qs_sitefrash` VALUES ('95', '1', 'WTA25');
INSERT INTO `qs_sitefrash` VALUES ('96', '1', 'WTA26');
INSERT INTO `qs_sitefrash` VALUES ('97', '1', 'WTA27');
INSERT INTO `qs_sitefrash` VALUES ('98', '1', 'WTA28');
INSERT INTO `qs_sitefrash` VALUES ('99', '1', 'WTB25');
INSERT INTO `qs_sitefrash` VALUES ('100', '1', 'WTB26');
INSERT INTO `qs_sitefrash` VALUES ('101', '1', 'WTB27');
INSERT INTO `qs_sitefrash` VALUES ('102', '1', 'WTB28');
INSERT INTO `qs_sitefrash` VALUES ('103', '0', '园博园大街');
INSERT INTO `qs_sitefrash` VALUES ('104', '103', 'YBYA01');
INSERT INTO `qs_sitefrash` VALUES ('105', '103', 'YBYA02');
INSERT INTO `qs_sitefrash` VALUES ('106', '103', 'YBYA03');
INSERT INTO `qs_sitefrash` VALUES ('107', '103', 'YBYA04');
INSERT INTO `qs_sitefrash` VALUES ('108', '103', 'YBYA05');
INSERT INTO `qs_sitefrash` VALUES ('109', '103', 'YBYA06');
INSERT INTO `qs_sitefrash` VALUES ('110', '103', 'YBYA07');
INSERT INTO `qs_sitefrash` VALUES ('111', '103', 'YBYA08');
INSERT INTO `qs_sitefrash` VALUES ('112', '103', 'YBYA09');
INSERT INTO `qs_sitefrash` VALUES ('113', '103', 'YBYA10');
INSERT INTO `qs_sitefrash` VALUES ('114', '103', 'YBYA11');
INSERT INTO `qs_sitefrash` VALUES ('115', '103', 'YBYA12');
INSERT INTO `qs_sitefrash` VALUES ('116', '103', 'YBYA13');
INSERT INTO `qs_sitefrash` VALUES ('117', '103', 'YBYA14');
INSERT INTO `qs_sitefrash` VALUES ('118', '103', 'YBYA15');
INSERT INTO `qs_sitefrash` VALUES ('119', '103', 'YBYA16');
INSERT INTO `qs_sitefrash` VALUES ('120', '103', 'YBYA17');
INSERT INTO `qs_sitefrash` VALUES ('121', '103', 'YBYA18');
INSERT INTO `qs_sitefrash` VALUES ('122', '103', 'YBYA19');
INSERT INTO `qs_sitefrash` VALUES ('123', '103', 'YBYA20');
INSERT INTO `qs_sitefrash` VALUES ('124', '103', 'YBYA21');
INSERT INTO `qs_sitefrash` VALUES ('125', '103', 'YBYB01');
INSERT INTO `qs_sitefrash` VALUES ('126', '103', 'YBYB02');
INSERT INTO `qs_sitefrash` VALUES ('127', '103', 'YBYB03');
INSERT INTO `qs_sitefrash` VALUES ('128', '103', 'YBYB04');
INSERT INTO `qs_sitefrash` VALUES ('129', '103', 'YBYB05');
INSERT INTO `qs_sitefrash` VALUES ('130', '103', 'YBYB06');
INSERT INTO `qs_sitefrash` VALUES ('131', '103', 'YBYB07');
INSERT INTO `qs_sitefrash` VALUES ('132', '103', 'YBYB08');
INSERT INTO `qs_sitefrash` VALUES ('133', '103', 'YBYB09');
INSERT INTO `qs_sitefrash` VALUES ('134', '103', 'YBYB10');
INSERT INTO `qs_sitefrash` VALUES ('135', '103', 'YBYB11');
INSERT INTO `qs_sitefrash` VALUES ('136', '103', 'YBYB12');
INSERT INTO `qs_sitefrash` VALUES ('137', '103', 'YBYB13');
INSERT INTO `qs_sitefrash` VALUES ('138', '103', 'YBYB14');
INSERT INTO `qs_sitefrash` VALUES ('139', '103', 'YBYB15');
INSERT INTO `qs_sitefrash` VALUES ('140', '103', 'YBYB16');
INSERT INTO `qs_sitefrash` VALUES ('141', '103', 'YBYB17');
INSERT INTO `qs_sitefrash` VALUES ('142', '103', 'YBYB18');
INSERT INTO `qs_sitefrash` VALUES ('143', '103', 'YBYB19');
INSERT INTO `qs_sitefrash` VALUES ('144', '103', 'YBYB20');
INSERT INTO `qs_sitefrash` VALUES ('145', '103', 'YBYB21');
INSERT INTO `qs_sitefrash` VALUES ('146', '0', '园博园大街北');
INSERT INTO `qs_sitefrash` VALUES ('147', '146', 'YBYNA01');
INSERT INTO `qs_sitefrash` VALUES ('148', '146', 'YBYNA02');
INSERT INTO `qs_sitefrash` VALUES ('149', '146', 'YBYNA03');
INSERT INTO `qs_sitefrash` VALUES ('150', '146', 'YBYNA04');
INSERT INTO `qs_sitefrash` VALUES ('151', '146', 'YBYNA05');
INSERT INTO `qs_sitefrash` VALUES ('152', '146', 'YBYNA06');
INSERT INTO `qs_sitefrash` VALUES ('153', '146', 'YBYNA07');
INSERT INTO `qs_sitefrash` VALUES ('154', '146', 'YBYNB01');
INSERT INTO `qs_sitefrash` VALUES ('155', '146', 'YBYNB02');
INSERT INTO `qs_sitefrash` VALUES ('156', '146', 'YBYNB03');
INSERT INTO `qs_sitefrash` VALUES ('157', '146', 'YBYNB04');
INSERT INTO `qs_sitefrash` VALUES ('158', '146', 'YBYNB05');
INSERT INTO `qs_sitefrash` VALUES ('159', '146', 'YBYNB06');
INSERT INTO `qs_sitefrash` VALUES ('160', '146', 'YBYNB07');
INSERT INTO `qs_sitefrash` VALUES ('161', '146', 'YBYND01');
INSERT INTO `qs_sitefrash` VALUES ('162', '146', 'YBYND02');
INSERT INTO `qs_sitefrash` VALUES ('163', '146', 'YBYND03');
INSERT INTO `qs_sitefrash` VALUES ('164', '146', 'YBYND04');
INSERT INTO `qs_sitefrash` VALUES ('165', '146', 'YBYND05');
INSERT INTO `qs_sitefrash` VALUES ('166', '146', 'YBYND06');
INSERT INTO `qs_sitefrash` VALUES ('167', '0', '新城大街');
INSERT INTO `qs_sitefrash` VALUES ('168', '167', 'XCA01');
INSERT INTO `qs_sitefrash` VALUES ('169', '167', 'XCA02');
INSERT INTO `qs_sitefrash` VALUES ('170', '167', 'XCA03');
INSERT INTO `qs_sitefrash` VALUES ('171', '167', 'XCA04');
INSERT INTO `qs_sitefrash` VALUES ('172', '167', 'XCA05');
INSERT INTO `qs_sitefrash` VALUES ('173', '167', 'XCA06');
INSERT INTO `qs_sitefrash` VALUES ('174', '167', 'XCA07');
INSERT INTO `qs_sitefrash` VALUES ('175', '167', 'XCA08');
INSERT INTO `qs_sitefrash` VALUES ('176', '167', 'XCA09');
INSERT INTO `qs_sitefrash` VALUES ('177', '167', 'XCA10');
INSERT INTO `qs_sitefrash` VALUES ('178', '167', 'XCA11');
INSERT INTO `qs_sitefrash` VALUES ('179', '167', 'XCA12');
INSERT INTO `qs_sitefrash` VALUES ('180', '167', 'XCA13');
INSERT INTO `qs_sitefrash` VALUES ('181', '167', 'XCA14');
INSERT INTO `qs_sitefrash` VALUES ('182', '167', 'XCA15');
INSERT INTO `qs_sitefrash` VALUES ('183', '167', 'XCA16');
INSERT INTO `qs_sitefrash` VALUES ('184', '167', 'XCA17');
INSERT INTO `qs_sitefrash` VALUES ('185', '167', 'XCA18');
INSERT INTO `qs_sitefrash` VALUES ('186', '167', 'XCA19');
INSERT INTO `qs_sitefrash` VALUES ('187', '167', 'XCA20');
INSERT INTO `qs_sitefrash` VALUES ('188', '167', 'XCA21');
INSERT INTO `qs_sitefrash` VALUES ('189', '167', 'XCB01');
INSERT INTO `qs_sitefrash` VALUES ('190', '167', 'XCB02');
INSERT INTO `qs_sitefrash` VALUES ('191', '167', 'XCB03');
INSERT INTO `qs_sitefrash` VALUES ('192', '167', 'XCB04');
INSERT INTO `qs_sitefrash` VALUES ('193', '167', 'XCB05');
INSERT INTO `qs_sitefrash` VALUES ('194', '167', 'XCB06');
INSERT INTO `qs_sitefrash` VALUES ('195', '167', 'XCB07');
INSERT INTO `qs_sitefrash` VALUES ('196', '167', 'XCB08');
INSERT INTO `qs_sitefrash` VALUES ('197', '167', 'XCB09');
INSERT INTO `qs_sitefrash` VALUES ('198', '167', 'XCB10');
INSERT INTO `qs_sitefrash` VALUES ('199', '167', 'XCB11');
INSERT INTO `qs_sitefrash` VALUES ('200', '167', 'XCB12');
INSERT INTO `qs_sitefrash` VALUES ('201', '167', 'XCB13');
INSERT INTO `qs_sitefrash` VALUES ('202', '167', 'XCB14');
INSERT INTO `qs_sitefrash` VALUES ('203', '167', 'XCB15');
INSERT INTO `qs_sitefrash` VALUES ('204', '167', 'XCB16');
INSERT INTO `qs_sitefrash` VALUES ('205', '167', 'XCB17');
INSERT INTO `qs_sitefrash` VALUES ('206', '167', 'XCB18');
INSERT INTO `qs_sitefrash` VALUES ('207', '167', 'XCB19');
INSERT INTO `qs_sitefrash` VALUES ('208', '167', 'XCB20');
INSERT INTO `qs_sitefrash` VALUES ('209', '167', 'XCB21');
INSERT INTO `qs_sitefrash` VALUES ('210', '0', '顺平大街');
INSERT INTO `qs_sitefrash` VALUES ('211', '210', 'SPA01');
INSERT INTO `qs_sitefrash` VALUES ('212', '210', 'SPA02');
INSERT INTO `qs_sitefrash` VALUES ('213', '210', 'SPA03');
INSERT INTO `qs_sitefrash` VALUES ('214', '210', 'SPA04');
INSERT INTO `qs_sitefrash` VALUES ('215', '210', 'SPA05');
INSERT INTO `qs_sitefrash` VALUES ('216', '210', 'SPA06');
INSERT INTO `qs_sitefrash` VALUES ('217', '210', 'SPA07');
INSERT INTO `qs_sitefrash` VALUES ('218', '210', 'SPA08');
INSERT INTO `qs_sitefrash` VALUES ('219', '210', 'SPA09');
INSERT INTO `qs_sitefrash` VALUES ('220', '210', 'SPA10');
INSERT INTO `qs_sitefrash` VALUES ('221', '210', 'SPA11');
INSERT INTO `qs_sitefrash` VALUES ('222', '210', 'SPA12');
INSERT INTO `qs_sitefrash` VALUES ('223', '210', 'SPA13');
INSERT INTO `qs_sitefrash` VALUES ('224', '210', 'SPA14');
INSERT INTO `qs_sitefrash` VALUES ('225', '210', 'SPA15');
INSERT INTO `qs_sitefrash` VALUES ('226', '210', 'SPA16');
INSERT INTO `qs_sitefrash` VALUES ('227', '210', 'SPB01');
INSERT INTO `qs_sitefrash` VALUES ('228', '210', 'SPB02');
INSERT INTO `qs_sitefrash` VALUES ('229', '210', 'SPB03');
INSERT INTO `qs_sitefrash` VALUES ('230', '210', 'SPB04');
INSERT INTO `qs_sitefrash` VALUES ('231', '210', 'SPB05');
INSERT INTO `qs_sitefrash` VALUES ('232', '210', 'SPB06');
INSERT INTO `qs_sitefrash` VALUES ('233', '210', 'SPB07');
INSERT INTO `qs_sitefrash` VALUES ('234', '210', 'SPB08');
INSERT INTO `qs_sitefrash` VALUES ('235', '210', 'SPB09');
INSERT INTO `qs_sitefrash` VALUES ('236', '210', 'SPB10');
INSERT INTO `qs_sitefrash` VALUES ('237', '210', 'SPB11');
INSERT INTO `qs_sitefrash` VALUES ('238', '210', 'SPB12');
INSERT INTO `qs_sitefrash` VALUES ('239', '210', 'SPB13');
INSERT INTO `qs_sitefrash` VALUES ('240', '210', 'SPB14');
INSERT INTO `qs_sitefrash` VALUES ('241', '210', 'SPB15');
INSERT INTO `qs_sitefrash` VALUES ('242', '210', 'SPB16');
INSERT INTO `qs_sitefrash` VALUES ('243', '210', 'SPD01');
INSERT INTO `qs_sitefrash` VALUES ('244', '210', 'SPD02');
INSERT INTO `qs_sitefrash` VALUES ('245', '210', 'SPD03');
INSERT INTO `qs_sitefrash` VALUES ('246', '210', 'SPD04');
INSERT INTO `qs_sitefrash` VALUES ('247', '210', 'SPD05');
INSERT INTO `qs_sitefrash` VALUES ('248', '210', 'SPD06');
INSERT INTO `qs_sitefrash` VALUES ('249', '210', 'SPD07');
INSERT INTO `qs_sitefrash` VALUES ('250', '210', 'SPD08');
INSERT INTO `qs_sitefrash` VALUES ('251', '210', 'SPC01');
INSERT INTO `qs_sitefrash` VALUES ('252', '210', 'SPC02');
INSERT INTO `qs_sitefrash` VALUES ('253', '210', 'SPC03');
INSERT INTO `qs_sitefrash` VALUES ('254', '210', 'SPC04');
INSERT INTO `qs_sitefrash` VALUES ('255', '210', 'SPC05');
INSERT INTO `qs_sitefrash` VALUES ('256', '210', 'SPC06');
INSERT INTO `qs_sitefrash` VALUES ('257', '210', 'SPC07');
INSERT INTO `qs_sitefrash` VALUES ('258', '210', 'SPC08');
INSERT INTO `qs_sitefrash` VALUES ('259', '210', 'SPC09');
INSERT INTO `qs_sitefrash` VALUES ('260', '210', 'SPC10');
INSERT INTO `qs_sitefrash` VALUES ('261', '210', 'SPC11');
INSERT INTO `qs_sitefrash` VALUES ('262', '210', 'SPC12');
INSERT INTO `qs_sitefrash` VALUES ('263', '210', 'SPA29');
INSERT INTO `qs_sitefrash` VALUES ('264', '210', 'SPA30');
INSERT INTO `qs_sitefrash` VALUES ('265', '210', 'SPA31');
INSERT INTO `qs_sitefrash` VALUES ('266', '210', 'SPA32');
INSERT INTO `qs_sitefrash` VALUES ('267', '210', 'SPA33');
INSERT INTO `qs_sitefrash` VALUES ('268', '210', 'SPA34');
INSERT INTO `qs_sitefrash` VALUES ('269', '210', 'SPA35');
INSERT INTO `qs_sitefrash` VALUES ('270', '210', 'SPB29');
INSERT INTO `qs_sitefrash` VALUES ('271', '210', 'SPB30');
INSERT INTO `qs_sitefrash` VALUES ('272', '210', 'SPB31');
INSERT INTO `qs_sitefrash` VALUES ('273', '210', 'SPB32');
INSERT INTO `qs_sitefrash` VALUES ('274', '210', 'SPB33');
INSERT INTO `qs_sitefrash` VALUES ('275', '210', 'SPB34');
INSERT INTO `qs_sitefrash` VALUES ('276', '210', 'SPB35');
INSERT INTO `qs_sitefrash` VALUES ('277', '210', 'SPD29');
INSERT INTO `qs_sitefrash` VALUES ('278', '210', 'SPD30');
INSERT INTO `qs_sitefrash` VALUES ('279', '210', 'SPD31');
INSERT INTO `qs_sitefrash` VALUES ('280', '210', 'SPD32');
INSERT INTO `qs_sitefrash` VALUES ('281', '210', 'SPD33');
INSERT INTO `qs_sitefrash` VALUES ('282', '210', 'SPD34');
INSERT INTO `qs_sitefrash` VALUES ('283', '210', 'SPD35');
INSERT INTO `qs_sitefrash` VALUES ('284', '210', 'SPC01_1');
INSERT INTO `qs_sitefrash` VALUES ('285', '210', 'SPC02_1');
INSERT INTO `qs_sitefrash` VALUES ('286', '210', 'SPC03_1');
INSERT INTO `qs_sitefrash` VALUES ('287', '210', 'SPC04_1');
INSERT INTO `qs_sitefrash` VALUES ('288', '210', 'SPC05_1');
INSERT INTO `qs_sitefrash` VALUES ('289', '0', '太行大街');
INSERT INTO `qs_sitefrash` VALUES ('290', '289', 'THA01');
INSERT INTO `qs_sitefrash` VALUES ('291', '289', 'THA02');
INSERT INTO `qs_sitefrash` VALUES ('292', '289', 'THA03');
INSERT INTO `qs_sitefrash` VALUES ('293', '289', 'THA04');
INSERT INTO `qs_sitefrash` VALUES ('294', '289', 'THA05');
INSERT INTO `qs_sitefrash` VALUES ('295', '289', 'THA06');
INSERT INTO `qs_sitefrash` VALUES ('296', '289', 'THA07');
INSERT INTO `qs_sitefrash` VALUES ('297', '289', 'THA08');
INSERT INTO `qs_sitefrash` VALUES ('298', '289', 'THA09');
INSERT INTO `qs_sitefrash` VALUES ('299', '289', 'THA10');
INSERT INTO `qs_sitefrash` VALUES ('300', '289', 'THA11');
INSERT INTO `qs_sitefrash` VALUES ('301', '289', 'THA12');
INSERT INTO `qs_sitefrash` VALUES ('302', '289', 'THA13');
INSERT INTO `qs_sitefrash` VALUES ('303', '289', 'THA14');
INSERT INTO `qs_sitefrash` VALUES ('304', '289', 'THA15');
INSERT INTO `qs_sitefrash` VALUES ('305', '289', 'THA16');
INSERT INTO `qs_sitefrash` VALUES ('306', '289', 'THA17');
INSERT INTO `qs_sitefrash` VALUES ('307', '289', 'THA18');
INSERT INTO `qs_sitefrash` VALUES ('308', '289', 'THA19');
INSERT INTO `qs_sitefrash` VALUES ('309', '289', 'THA20');
INSERT INTO `qs_sitefrash` VALUES ('310', '289', 'THA21');
INSERT INTO `qs_sitefrash` VALUES ('311', '289', 'THB01');
INSERT INTO `qs_sitefrash` VALUES ('312', '289', 'THB02');
INSERT INTO `qs_sitefrash` VALUES ('313', '289', 'THB03');
INSERT INTO `qs_sitefrash` VALUES ('314', '289', 'THB04');
INSERT INTO `qs_sitefrash` VALUES ('315', '289', 'THB05');
INSERT INTO `qs_sitefrash` VALUES ('316', '289', 'THB06');
INSERT INTO `qs_sitefrash` VALUES ('317', '289', 'THB07');
INSERT INTO `qs_sitefrash` VALUES ('318', '289', 'THB08');
INSERT INTO `qs_sitefrash` VALUES ('319', '289', 'THB09');
INSERT INTO `qs_sitefrash` VALUES ('320', '289', 'THB10');
INSERT INTO `qs_sitefrash` VALUES ('321', '289', 'THB11');
INSERT INTO `qs_sitefrash` VALUES ('322', '289', 'THB12');
INSERT INTO `qs_sitefrash` VALUES ('323', '289', 'THB13');
INSERT INTO `qs_sitefrash` VALUES ('324', '289', 'THB14');
INSERT INTO `qs_sitefrash` VALUES ('325', '289', 'THB15');
INSERT INTO `qs_sitefrash` VALUES ('326', '289', 'THB16');
INSERT INTO `qs_sitefrash` VALUES ('327', '289', 'THB17');
INSERT INTO `qs_sitefrash` VALUES ('328', '289', 'THB18');
INSERT INTO `qs_sitefrash` VALUES ('329', '289', 'THB19');
INSERT INTO `qs_sitefrash` VALUES ('330', '289', 'THB20');
INSERT INTO `qs_sitefrash` VALUES ('331', '289', 'THB21');
INSERT INTO `qs_sitefrash` VALUES ('332', '0', '奥体街');
INSERT INTO `qs_sitefrash` VALUES ('333', '332', 'ATA01');
INSERT INTO `qs_sitefrash` VALUES ('334', '332', 'ATA02');
INSERT INTO `qs_sitefrash` VALUES ('335', '332', 'ATA03');
INSERT INTO `qs_sitefrash` VALUES ('336', '332', 'ATA04');
INSERT INTO `qs_sitefrash` VALUES ('337', '332', 'ATA05');
INSERT INTO `qs_sitefrash` VALUES ('338', '332', 'ATA06');
INSERT INTO `qs_sitefrash` VALUES ('339', '332', 'ATA07');
INSERT INTO `qs_sitefrash` VALUES ('340', '332', 'ATA08');
INSERT INTO `qs_sitefrash` VALUES ('341', '332', 'ATA09');
INSERT INTO `qs_sitefrash` VALUES ('342', '332', 'ATB01');
INSERT INTO `qs_sitefrash` VALUES ('343', '332', 'ATB02');
INSERT INTO `qs_sitefrash` VALUES ('344', '332', 'ATB03');
INSERT INTO `qs_sitefrash` VALUES ('345', '332', 'ATB04');
INSERT INTO `qs_sitefrash` VALUES ('346', '332', 'ATB05');
INSERT INTO `qs_sitefrash` VALUES ('347', '332', 'ATB06');
INSERT INTO `qs_sitefrash` VALUES ('348', '332', 'ATB07');
INSERT INTO `qs_sitefrash` VALUES ('349', '332', 'ATB08');
INSERT INTO `qs_sitefrash` VALUES ('350', '332', 'ATB09');
INSERT INTO `qs_sitefrash` VALUES ('351', '332', 'ATC01');
INSERT INTO `qs_sitefrash` VALUES ('352', '332', 'ATC02');
INSERT INTO `qs_sitefrash` VALUES ('353', '332', 'ATC03');
INSERT INTO `qs_sitefrash` VALUES ('354', '332', 'ATC04');
INSERT INTO `qs_sitefrash` VALUES ('355', '332', 'ATC05');
INSERT INTO `qs_sitefrash` VALUES ('356', '332', 'ATC06');
INSERT INTO `qs_sitefrash` VALUES ('357', '332', 'ATC07');
INSERT INTO `qs_sitefrash` VALUES ('358', '332', 'ATC08');
INSERT INTO `qs_sitefrash` VALUES ('359', '332', 'ATC09');
INSERT INTO `qs_sitefrash` VALUES ('360', '332', 'ATE01');
INSERT INTO `qs_sitefrash` VALUES ('361', '332', 'ATE02');
INSERT INTO `qs_sitefrash` VALUES ('362', '332', 'ATE03');
INSERT INTO `qs_sitefrash` VALUES ('363', '332', 'ATE04');
INSERT INTO `qs_sitefrash` VALUES ('364', '332', 'ATE05');
INSERT INTO `qs_sitefrash` VALUES ('365', '332', 'ATE06');
INSERT INTO `qs_sitefrash` VALUES ('366', '332', 'ATE07');
INSERT INTO `qs_sitefrash` VALUES ('367', '332', 'ATE08');
INSERT INTO `qs_sitefrash` VALUES ('368', '332', 'ATE09');
INSERT INTO `qs_sitefrash` VALUES ('369', '0', '永宁路');
INSERT INTO `qs_sitefrash` VALUES ('370', '369', 'YNA01');
INSERT INTO `qs_sitefrash` VALUES ('371', '369', 'YNA02');
INSERT INTO `qs_sitefrash` VALUES ('372', '369', 'YNA03');
INSERT INTO `qs_sitefrash` VALUES ('373', '369', 'YNA04');
INSERT INTO `qs_sitefrash` VALUES ('374', '369', 'YNA05');
INSERT INTO `qs_sitefrash` VALUES ('375', '369', 'YNA06');
INSERT INTO `qs_sitefrash` VALUES ('376', '369', 'YNA07');
INSERT INTO `qs_sitefrash` VALUES ('377', '369', 'YNA08');
INSERT INTO `qs_sitefrash` VALUES ('378', '369', 'YNA09');
INSERT INTO `qs_sitefrash` VALUES ('379', '369', 'YNA10');
INSERT INTO `qs_sitefrash` VALUES ('380', '369', 'YNA11');
INSERT INTO `qs_sitefrash` VALUES ('381', '369', 'YNA12');
INSERT INTO `qs_sitefrash` VALUES ('382', '369', 'YNA13');
INSERT INTO `qs_sitefrash` VALUES ('383', '369', 'YNA14');
INSERT INTO `qs_sitefrash` VALUES ('384', '369', 'YNA15');
INSERT INTO `qs_sitefrash` VALUES ('385', '369', 'YNA16');
INSERT INTO `qs_sitefrash` VALUES ('386', '369', 'YNA17');
INSERT INTO `qs_sitefrash` VALUES ('387', '369', 'YNA18');
INSERT INTO `qs_sitefrash` VALUES ('388', '369', 'YNA19');
INSERT INTO `qs_sitefrash` VALUES ('389', '369', 'YNA20');
INSERT INTO `qs_sitefrash` VALUES ('390', '369', 'YNA21');
INSERT INTO `qs_sitefrash` VALUES ('391', '369', 'YNA22');
INSERT INTO `qs_sitefrash` VALUES ('392', '369', 'YNA23');
INSERT INTO `qs_sitefrash` VALUES ('393', '369', 'YNA24');
INSERT INTO `qs_sitefrash` VALUES ('394', '369', 'YNA25');
INSERT INTO `qs_sitefrash` VALUES ('395', '369', 'YNA26');
INSERT INTO `qs_sitefrash` VALUES ('396', '369', 'YNA27');
INSERT INTO `qs_sitefrash` VALUES ('397', '369', 'YNA28');
INSERT INTO `qs_sitefrash` VALUES ('398', '369', 'YNA29');
INSERT INTO `qs_sitefrash` VALUES ('399', '369', 'YNA30');
INSERT INTO `qs_sitefrash` VALUES ('400', '369', 'YNA31');
INSERT INTO `qs_sitefrash` VALUES ('401', '369', 'YNA32');
INSERT INTO `qs_sitefrash` VALUES ('402', '369', 'YNA33');
INSERT INTO `qs_sitefrash` VALUES ('403', '369', 'YNB01');
INSERT INTO `qs_sitefrash` VALUES ('404', '369', 'YNB02');
INSERT INTO `qs_sitefrash` VALUES ('405', '369', 'YNB03');
INSERT INTO `qs_sitefrash` VALUES ('406', '369', 'YNB04');
INSERT INTO `qs_sitefrash` VALUES ('407', '369', 'YNB05');
INSERT INTO `qs_sitefrash` VALUES ('408', '369', 'YNB06');
INSERT INTO `qs_sitefrash` VALUES ('409', '369', 'YNB07');
INSERT INTO `qs_sitefrash` VALUES ('410', '369', 'YNB08');
INSERT INTO `qs_sitefrash` VALUES ('411', '369', 'YNB09');
INSERT INTO `qs_sitefrash` VALUES ('412', '369', 'YNB10');
INSERT INTO `qs_sitefrash` VALUES ('413', '369', 'YNB11');
INSERT INTO `qs_sitefrash` VALUES ('414', '369', 'YNB12');
INSERT INTO `qs_sitefrash` VALUES ('415', '369', 'YNB13');
INSERT INTO `qs_sitefrash` VALUES ('416', '369', 'YNB14');
INSERT INTO `qs_sitefrash` VALUES ('417', '369', 'YNB15');
INSERT INTO `qs_sitefrash` VALUES ('418', '369', 'YNB16');
INSERT INTO `qs_sitefrash` VALUES ('419', '369', 'YNB17');
INSERT INTO `qs_sitefrash` VALUES ('420', '369', 'YNB18');
INSERT INTO `qs_sitefrash` VALUES ('421', '369', 'YNB19');
INSERT INTO `qs_sitefrash` VALUES ('422', '369', 'YNB20');
INSERT INTO `qs_sitefrash` VALUES ('423', '369', 'YNB21');
INSERT INTO `qs_sitefrash` VALUES ('424', '369', 'YNB22');
INSERT INTO `qs_sitefrash` VALUES ('425', '369', 'YNB23');
INSERT INTO `qs_sitefrash` VALUES ('426', '369', 'YNB24');
INSERT INTO `qs_sitefrash` VALUES ('427', '369', 'YNB25');
INSERT INTO `qs_sitefrash` VALUES ('428', '369', 'YNB26');
INSERT INTO `qs_sitefrash` VALUES ('429', '369', 'YNB27');
INSERT INTO `qs_sitefrash` VALUES ('430', '369', 'YNB28');
INSERT INTO `qs_sitefrash` VALUES ('431', '369', 'YNB29');
INSERT INTO `qs_sitefrash` VALUES ('432', '369', 'YNB30');
INSERT INTO `qs_sitefrash` VALUES ('433', '369', 'YNB31');
INSERT INTO `qs_sitefrash` VALUES ('434', '369', 'YNB32');
INSERT INTO `qs_sitefrash` VALUES ('435', '369', 'YNB33');
INSERT INTO `qs_sitefrash` VALUES ('436', '369', 'YND01');
INSERT INTO `qs_sitefrash` VALUES ('437', '369', 'YND02');
INSERT INTO `qs_sitefrash` VALUES ('438', '369', 'YND03');
INSERT INTO `qs_sitefrash` VALUES ('439', '369', 'YND04');
INSERT INTO `qs_sitefrash` VALUES ('440', '369', 'YND05');
INSERT INTO `qs_sitefrash` VALUES ('441', '369', 'YND06');
INSERT INTO `qs_sitefrash` VALUES ('442', '369', 'YND07');
INSERT INTO `qs_sitefrash` VALUES ('443', '369', 'YND08');
INSERT INTO `qs_sitefrash` VALUES ('444', '369', 'YND09');
INSERT INTO `qs_sitefrash` VALUES ('445', '369', 'YND10');
INSERT INTO `qs_sitefrash` VALUES ('446', '369', 'YND11');
INSERT INTO `qs_sitefrash` VALUES ('447', '369', 'YND12');
INSERT INTO `qs_sitefrash` VALUES ('448', '369', 'YND13');
INSERT INTO `qs_sitefrash` VALUES ('449', '369', 'YND14');
INSERT INTO `qs_sitefrash` VALUES ('450', '369', 'YND15');
INSERT INTO `qs_sitefrash` VALUES ('451', '369', 'YND16');
INSERT INTO `qs_sitefrash` VALUES ('452', '369', 'YND17');
INSERT INTO `qs_sitefrash` VALUES ('453', '369', 'YND18');
INSERT INTO `qs_sitefrash` VALUES ('454', '369', 'YND19');
INSERT INTO `qs_sitefrash` VALUES ('455', '369', 'YND20');
INSERT INTO `qs_sitefrash` VALUES ('456', '369', 'YND25');
INSERT INTO `qs_sitefrash` VALUES ('457', '369', 'YND26');
INSERT INTO `qs_sitefrash` VALUES ('458', '369', 'YND27');
INSERT INTO `qs_sitefrash` VALUES ('459', '369', 'YND28');
INSERT INTO `qs_sitefrash` VALUES ('460', '369', 'YND29');
INSERT INTO `qs_sitefrash` VALUES ('461', '369', 'YND30');
INSERT INTO `qs_sitefrash` VALUES ('462', '369', 'YND31');
INSERT INTO `qs_sitefrash` VALUES ('463', '369', 'YND32');
INSERT INTO `qs_sitefrash` VALUES ('464', '369', 'YND33');
INSERT INTO `qs_sitefrash` VALUES ('465', '369', 'YND34');
INSERT INTO `qs_sitefrash` VALUES ('466', '369', 'YND35');
INSERT INTO `qs_sitefrash` VALUES ('467', '369', 'YNC01');
INSERT INTO `qs_sitefrash` VALUES ('468', '369', 'YNC02');
INSERT INTO `qs_sitefrash` VALUES ('469', '369', 'YNC03');
INSERT INTO `qs_sitefrash` VALUES ('470', '369', 'YNC04');
INSERT INTO `qs_sitefrash` VALUES ('471', '369', 'YNC05');
INSERT INTO `qs_sitefrash` VALUES ('472', '369', 'YNC06');
INSERT INTO `qs_sitefrash` VALUES ('473', '369', 'YNC07');
INSERT INTO `qs_sitefrash` VALUES ('474', '369', 'YNC08');
INSERT INTO `qs_sitefrash` VALUES ('475', '369', 'YNC09');
INSERT INTO `qs_sitefrash` VALUES ('476', '369', 'YNC10');
INSERT INTO `qs_sitefrash` VALUES ('477', '369', 'YNC11');
INSERT INTO `qs_sitefrash` VALUES ('478', '369', 'YNC12');
INSERT INTO `qs_sitefrash` VALUES ('479', '369', 'YNC13');
INSERT INTO `qs_sitefrash` VALUES ('480', '369', 'YNC14');
INSERT INTO `qs_sitefrash` VALUES ('481', '369', 'YNC15');
INSERT INTO `qs_sitefrash` VALUES ('482', '369', 'YNC16');
INSERT INTO `qs_sitefrash` VALUES ('483', '369', 'YNC17');
INSERT INTO `qs_sitefrash` VALUES ('484', '369', 'YNC18');
INSERT INTO `qs_sitefrash` VALUES ('485', '369', 'YNC19');
INSERT INTO `qs_sitefrash` VALUES ('486', '369', 'YNC20');
INSERT INTO `qs_sitefrash` VALUES ('487', '369', 'YNC21');
INSERT INTO `qs_sitefrash` VALUES ('488', '369', 'YNC22');
INSERT INTO `qs_sitefrash` VALUES ('489', '369', 'YNC23');
INSERT INTO `qs_sitefrash` VALUES ('490', '369', 'YNC24');
INSERT INTO `qs_sitefrash` VALUES ('491', '369', 'YNC25');
INSERT INTO `qs_sitefrash` VALUES ('492', '369', 'YNC26');
INSERT INTO `qs_sitefrash` VALUES ('493', '369', 'YNC27');
INSERT INTO `qs_sitefrash` VALUES ('494', '369', 'YNC28');
INSERT INTO `qs_sitefrash` VALUES ('495', '369', 'YNC29');
INSERT INTO `qs_sitefrash` VALUES ('496', '369', 'YNC30');
INSERT INTO `qs_sitefrash` VALUES ('497', '369', 'YNC31');
INSERT INTO `qs_sitefrash` VALUES ('498', '369', 'YNC32');
INSERT INTO `qs_sitefrash` VALUES ('499', '369', 'YNC33');
INSERT INTO `qs_sitefrash` VALUES ('500', '0', '安济路');
INSERT INTO `qs_sitefrash` VALUES ('501', '500', 'AJDYA34');
INSERT INTO `qs_sitefrash` VALUES ('502', '500', 'AJDYA35');
INSERT INTO `qs_sitefrash` VALUES ('503', '500', 'AJDYA36');
INSERT INTO `qs_sitefrash` VALUES ('504', '500', 'AJDYB34');
INSERT INTO `qs_sitefrash` VALUES ('505', '500', 'AJDYB35');
INSERT INTO `qs_sitefrash` VALUES ('506', '500', 'AJDYB36');
INSERT INTO `qs_sitefrash` VALUES ('507', '500', 'AJDYC01');
INSERT INTO `qs_sitefrash` VALUES ('508', '500', 'AJDYC02');
INSERT INTO `qs_sitefrash` VALUES ('509', '500', 'AJDYC03');
INSERT INTO `qs_sitefrash` VALUES ('510', '500', 'AJDYC04');
INSERT INTO `qs_sitefrash` VALUES ('511', '0', '天宁路');
INSERT INTO `qs_sitefrash` VALUES ('512', '511', 'TNA01');
INSERT INTO `qs_sitefrash` VALUES ('513', '511', 'TNA02');
INSERT INTO `qs_sitefrash` VALUES ('514', '511', 'TNA03');
INSERT INTO `qs_sitefrash` VALUES ('515', '511', 'TNA04');
INSERT INTO `qs_sitefrash` VALUES ('516', '511', 'TNA05');
INSERT INTO `qs_sitefrash` VALUES ('517', '511', 'TNA06');
INSERT INTO `qs_sitefrash` VALUES ('518', '511', 'TNA07');
INSERT INTO `qs_sitefrash` VALUES ('519', '511', 'TNA08');
INSERT INTO `qs_sitefrash` VALUES ('520', '511', 'TNA09');
INSERT INTO `qs_sitefrash` VALUES ('521', '511', 'TNA10');
INSERT INTO `qs_sitefrash` VALUES ('522', '511', 'TNA11');
INSERT INTO `qs_sitefrash` VALUES ('523', '511', 'TNA12');
INSERT INTO `qs_sitefrash` VALUES ('524', '511', 'TNB01');
INSERT INTO `qs_sitefrash` VALUES ('525', '511', 'TNB02');
INSERT INTO `qs_sitefrash` VALUES ('526', '511', 'TNB03');
INSERT INTO `qs_sitefrash` VALUES ('527', '511', 'TNB04');
INSERT INTO `qs_sitefrash` VALUES ('528', '511', 'TNB05');
INSERT INTO `qs_sitefrash` VALUES ('529', '511', 'TNB06');
INSERT INTO `qs_sitefrash` VALUES ('530', '511', 'TNB07');
INSERT INTO `qs_sitefrash` VALUES ('531', '511', 'TNB08');
INSERT INTO `qs_sitefrash` VALUES ('532', '511', 'TNB09');
INSERT INTO `qs_sitefrash` VALUES ('533', '511', 'TNB10');
INSERT INTO `qs_sitefrash` VALUES ('534', '511', 'TNB11');
INSERT INTO `qs_sitefrash` VALUES ('535', '511', 'TNB12');
INSERT INTO `qs_sitefrash` VALUES ('536', '0', '华阳路');
INSERT INTO `qs_sitefrash` VALUES ('537', '536', 'HYA01');
INSERT INTO `qs_sitefrash` VALUES ('538', '536', 'HYA02');
INSERT INTO `qs_sitefrash` VALUES ('539', '536', 'HYA03');
INSERT INTO `qs_sitefrash` VALUES ('540', '536', 'HYA04');
INSERT INTO `qs_sitefrash` VALUES ('541', '536', 'HYA05');
INSERT INTO `qs_sitefrash` VALUES ('542', '536', 'HYB01');
INSERT INTO `qs_sitefrash` VALUES ('543', '536', 'HYB02');
INSERT INTO `qs_sitefrash` VALUES ('544', '536', 'HYB03');
INSERT INTO `qs_sitefrash` VALUES ('545', '536', 'HYB04');
INSERT INTO `qs_sitefrash` VALUES ('546', '536', 'HYB05');
INSERT INTO `qs_sitefrash` VALUES ('547', '536', 'HYC01');
INSERT INTO `qs_sitefrash` VALUES ('548', '536', 'HYC02');
INSERT INTO `qs_sitefrash` VALUES ('549', '536', 'HYC03');
INSERT INTO `qs_sitefrash` VALUES ('550', '536', 'HYC04');
INSERT INTO `qs_sitefrash` VALUES ('551', '536', 'HYC05');
INSERT INTO `qs_sitefrash` VALUES ('552', '0', '迎旭路');
INSERT INTO `qs_sitefrash` VALUES ('553', '552', 'YXA01');
INSERT INTO `qs_sitefrash` VALUES ('554', '552', 'YXA02');
INSERT INTO `qs_sitefrash` VALUES ('555', '552', 'YXA03');
INSERT INTO `qs_sitefrash` VALUES ('556', '552', 'YXA04');
INSERT INTO `qs_sitefrash` VALUES ('557', '552', 'YXA05');
INSERT INTO `qs_sitefrash` VALUES ('558', '552', 'YXA06');
INSERT INTO `qs_sitefrash` VALUES ('559', '552', 'YXA07');
INSERT INTO `qs_sitefrash` VALUES ('560', '552', 'YXA08');
INSERT INTO `qs_sitefrash` VALUES ('561', '552', 'YXA09');
INSERT INTO `qs_sitefrash` VALUES ('562', '552', 'YXA10');
INSERT INTO `qs_sitefrash` VALUES ('563', '552', 'YXA11');
INSERT INTO `qs_sitefrash` VALUES ('564', '552', 'YXA12');
INSERT INTO `qs_sitefrash` VALUES ('565', '552', 'YXA13');
INSERT INTO `qs_sitefrash` VALUES ('566', '552', 'YXA14');
INSERT INTO `qs_sitefrash` VALUES ('567', '552', 'YXA15');
INSERT INTO `qs_sitefrash` VALUES ('568', '552', 'YXA16');
INSERT INTO `qs_sitefrash` VALUES ('569', '552', 'YXA17');
INSERT INTO `qs_sitefrash` VALUES ('570', '552', 'YXA18');
INSERT INTO `qs_sitefrash` VALUES ('571', '552', 'YXA19');
INSERT INTO `qs_sitefrash` VALUES ('572', '552', 'YXA20');
INSERT INTO `qs_sitefrash` VALUES ('573', '552', 'YXA21');
INSERT INTO `qs_sitefrash` VALUES ('574', '552', 'YXB01');
INSERT INTO `qs_sitefrash` VALUES ('575', '552', 'YXB02');
INSERT INTO `qs_sitefrash` VALUES ('576', '552', 'YXB03');
INSERT INTO `qs_sitefrash` VALUES ('577', '552', 'YXB04');
INSERT INTO `qs_sitefrash` VALUES ('578', '552', 'YXB05');
INSERT INTO `qs_sitefrash` VALUES ('579', '552', 'YXB06');
INSERT INTO `qs_sitefrash` VALUES ('580', '552', 'YXB07');
INSERT INTO `qs_sitefrash` VALUES ('581', '552', 'YXB08');
INSERT INTO `qs_sitefrash` VALUES ('582', '552', 'YXB09');
INSERT INTO `qs_sitefrash` VALUES ('583', '552', 'YXB10');
INSERT INTO `qs_sitefrash` VALUES ('584', '552', 'YXB11');
INSERT INTO `qs_sitefrash` VALUES ('585', '552', 'YXB12');
INSERT INTO `qs_sitefrash` VALUES ('586', '552', 'YXB13');
INSERT INTO `qs_sitefrash` VALUES ('587', '552', 'YXB14');
INSERT INTO `qs_sitefrash` VALUES ('588', '552', 'YXB15');
INSERT INTO `qs_sitefrash` VALUES ('589', '552', 'YXB16');
INSERT INTO `qs_sitefrash` VALUES ('590', '552', 'YXB17');
INSERT INTO `qs_sitefrash` VALUES ('591', '552', 'YXB18');
INSERT INTO `qs_sitefrash` VALUES ('592', '552', 'YXB19');
INSERT INTO `qs_sitefrash` VALUES ('593', '552', 'YXB20');
INSERT INTO `qs_sitefrash` VALUES ('594', '552', 'YXB21');
INSERT INTO `qs_sitefrash` VALUES ('595', '0', '迎旭路东延');
INSERT INTO `qs_sitefrash` VALUES ('596', '595', 'YXDYA01');
INSERT INTO `qs_sitefrash` VALUES ('597', '595', 'YXDYA02');
INSERT INTO `qs_sitefrash` VALUES ('598', '595', 'YXDYA03');
INSERT INTO `qs_sitefrash` VALUES ('599', '595', 'YXDYA04');
INSERT INTO `qs_sitefrash` VALUES ('600', '595', 'YXDYB01');
INSERT INTO `qs_sitefrash` VALUES ('601', '595', 'YXDYB02');
INSERT INTO `qs_sitefrash` VALUES ('602', '595', 'YXDYB03');
INSERT INTO `qs_sitefrash` VALUES ('603', '595', 'YXDYB04');
INSERT INTO `qs_sitefrash` VALUES ('604', '595', 'YXDYD01');
INSERT INTO `qs_sitefrash` VALUES ('605', '595', 'YXDYD02');
INSERT INTO `qs_sitefrash` VALUES ('606', '595', 'YXDYD03');
INSERT INTO `qs_sitefrash` VALUES ('607', '595', 'YXDYD04');
INSERT INTO `qs_sitefrash` VALUES ('608', '595', 'YXDYC01');
INSERT INTO `qs_sitefrash` VALUES ('609', '595', 'YXDYC02');
INSERT INTO `qs_sitefrash` VALUES ('610', '595', 'YXDYC03');
INSERT INTO `qs_sitefrash` VALUES ('611', '595', 'YXDYC04');
INSERT INTO `qs_sitefrash` VALUES ('612', '0', '隆兴路');
INSERT INTO `qs_sitefrash` VALUES ('613', '612', 'LXA01');
INSERT INTO `qs_sitefrash` VALUES ('614', '612', 'LXA02');
INSERT INTO `qs_sitefrash` VALUES ('615', '612', 'LXA03');
INSERT INTO `qs_sitefrash` VALUES ('616', '612', 'LXA04');
INSERT INTO `qs_sitefrash` VALUES ('617', '612', 'LXA05');
INSERT INTO `qs_sitefrash` VALUES ('618', '612', 'LXA06');
INSERT INTO `qs_sitefrash` VALUES ('619', '612', 'LXA07');
INSERT INTO `qs_sitefrash` VALUES ('620', '612', 'LXA08');
INSERT INTO `qs_sitefrash` VALUES ('621', '612', 'LXA09');
INSERT INTO `qs_sitefrash` VALUES ('622', '612', 'LXA10');
INSERT INTO `qs_sitefrash` VALUES ('623', '612', 'LXA11');
INSERT INTO `qs_sitefrash` VALUES ('624', '612', 'LXB01');
INSERT INTO `qs_sitefrash` VALUES ('625', '612', 'LXB02');
INSERT INTO `qs_sitefrash` VALUES ('626', '612', 'LXB03');
INSERT INTO `qs_sitefrash` VALUES ('627', '612', 'LXB04');
INSERT INTO `qs_sitefrash` VALUES ('628', '612', 'LXB05');
INSERT INTO `qs_sitefrash` VALUES ('629', '612', 'LXB06');
INSERT INTO `qs_sitefrash` VALUES ('630', '612', 'LXB07');
INSERT INTO `qs_sitefrash` VALUES ('631', '612', 'LXB08');
INSERT INTO `qs_sitefrash` VALUES ('632', '612', 'LXB09');
INSERT INTO `qs_sitefrash` VALUES ('633', '612', 'LXB10');
INSERT INTO `qs_sitefrash` VALUES ('634', '612', 'LXB11');
INSERT INTO `qs_sitefrash` VALUES ('635', '0', '隆兴路东延');
INSERT INTO `qs_sitefrash` VALUES ('636', '635', 'LXDYA01');
INSERT INTO `qs_sitefrash` VALUES ('637', '635', 'LXDYA02');
INSERT INTO `qs_sitefrash` VALUES ('638', '635', 'LXDYA03');
INSERT INTO `qs_sitefrash` VALUES ('639', '635', 'LXDYA04');
INSERT INTO `qs_sitefrash` VALUES ('640', '635', 'LXDYA05');
INSERT INTO `qs_sitefrash` VALUES ('641', '635', 'LXDYB01');
INSERT INTO `qs_sitefrash` VALUES ('642', '635', 'LXDYB02');
INSERT INTO `qs_sitefrash` VALUES ('643', '635', 'LXDYB03');
INSERT INTO `qs_sitefrash` VALUES ('644', '635', 'LXDYB04');
INSERT INTO `qs_sitefrash` VALUES ('645', '635', 'LXDYB05');
INSERT INTO `qs_sitefrash` VALUES ('646', '635', 'LXDYC01');
INSERT INTO `qs_sitefrash` VALUES ('647', '635', 'LXDYC02');
INSERT INTO `qs_sitefrash` VALUES ('648', '635', 'LXDYC03');
INSERT INTO `qs_sitefrash` VALUES ('649', '635', 'LXDYC04');
INSERT INTO `qs_sitefrash` VALUES ('650', '635', 'LXDYC05');
INSERT INTO `qs_sitefrash` VALUES ('651', '0', '隆兴路延伸');
INSERT INTO `qs_sitefrash` VALUES ('652', '651', 'LXYSA06');
INSERT INTO `qs_sitefrash` VALUES ('653', '651', 'LXYSA07');
INSERT INTO `qs_sitefrash` VALUES ('654', '651', 'LXYSA08');
INSERT INTO `qs_sitefrash` VALUES ('655', '651', 'LXYSA09');
INSERT INTO `qs_sitefrash` VALUES ('656', '651', 'LXYSA10');
INSERT INTO `qs_sitefrash` VALUES ('657', '651', 'LXYSA11');
INSERT INTO `qs_sitefrash` VALUES ('658', '651', 'LXYSB06');
INSERT INTO `qs_sitefrash` VALUES ('659', '651', 'LXYSB06');
INSERT INTO `qs_sitefrash` VALUES ('660', '651', 'LXYSB06');
INSERT INTO `qs_sitefrash` VALUES ('661', '651', 'LXYSB06');
INSERT INTO `qs_sitefrash` VALUES ('662', '651', 'LXYSB06');
INSERT INTO `qs_sitefrash` VALUES ('663', '651', 'LXYSB06');
INSERT INTO `qs_sitefrash` VALUES ('664', '651', 'LXYSC06');
INSERT INTO `qs_sitefrash` VALUES ('665', '651', 'LXYSC07');
INSERT INTO `qs_sitefrash` VALUES ('666', '651', 'LXYSC08');
INSERT INTO `qs_sitefrash` VALUES ('667', '651', 'LXYSC09');
INSERT INTO `qs_sitefrash` VALUES ('668', '651', 'LXYSC10');
INSERT INTO `qs_sitefrash` VALUES ('669', '651', 'LXYSC11');

-- ----------------------------
-- Table structure for qs_user
-- ----------------------------
DROP TABLE IF EXISTS `qs_user`;
CREATE TABLE `qs_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(11) NOT NULL,
  `password` char(32) NOT NULL,
  `user_phone` char(11) NOT NULL,
  `user_icon` varchar(255) DEFAULT NULL,
  `user_dept_id` tinyint(4) NOT NULL,
  `user_role_id` tinyint(4) NOT NULL,
  `user_sex` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qs_user
-- ----------------------------
INSERT INTO `qs_user` VALUES ('1', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '17310003333', '/photo/default/usericon.jpeg', '101', '1', '0');
INSERT INTO `qs_user` VALUES ('2', 'jack', 'e10adc3949ba59abbe56e057f20f883e', '17310002222', '/photo/default/usericon.jpeg', '102', '1', '1');
INSERT INTO `qs_user` VALUES ('3', '国富', 'e10adc3949ba59abbe56e057f20f883e', '17310001111', '/photo/default/usericon.jpeg', '103', '2', '0');
INSERT INTO `qs_user` VALUES ('4', 'safds', '', '17310332315', null, '102', '1', '1');
INSERT INTO `qs_user` VALUES ('5', 'asdfasdf', '', 'sdafasdf', null, '105', '2', '1');
INSERT INTO `qs_user` VALUES ('6', 'adf', '', 'adf', null, '105', '2', '1');
INSERT INTO `qs_user` VALUES ('9', 'vccc', '', 'ccc', null, '102', '2', '0');
INSERT INTO `qs_user` VALUES ('10', 'dfasadsf', '', 'asdfdsaf', null, '102', '3', '1');
