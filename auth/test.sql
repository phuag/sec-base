/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-22 11:16:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sex` enum('男','女') DEFAULT '男',
  `age` tinyint(4) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_del_flag` (`del_flag`),
  KEY `staff_update_date` (`update_date`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('6', '士大夫啊', '男', '54', '', '2017-09-15 14:03:15', '1', '2017-12-11 13:50:35', null, '0');
INSERT INTO `staff` VALUES ('7', '人员', '男', '45', '', '2017-09-15 14:03:15', '', '0000-00-00 00:00:00', null, '0');
INSERT INTO `staff` VALUES ('9', '沃尔沃', '男', '12', '', '2017-09-15 14:03:15', '', '0000-00-00 00:00:00', null, '0');
INSERT INTO `staff` VALUES ('10', '撒的发生', '男', '74', '', '2017-09-15 14:03:15', '', '0000-00-00 00:00:00', null, '0');
INSERT INTO `staff` VALUES ('20', 'dafsaf', '女', '2', '1', '2017-09-15 14:03:15', '1', '2017-09-15 14:03:15', null, '0');
INSERT INTO `staff` VALUES ('26', 'fgdsg', '女', '2', '1', '2017-09-18 11:17:24', '1', '2017-09-18 11:17:24', null, '0');
INSERT INTO `staff` VALUES ('27', 'wqdfasdf', '女', '2', '1', '2017-09-18 11:18:29', '1', '2017-09-18 11:18:29', null, '0');
INSERT INTO `staff` VALUES ('31', 'asdfasf', '女', '2', '1', '2017-10-10 14:40:47', '1', '2017-10-10 14:40:47', null, '0');
INSERT INTO `staff` VALUES ('34', 'fsfgdg', '女', '0', '1', '2017-10-10 14:41:21', '1', '2017-10-10 14:41:21', null, '0');
INSERT INTO `staff` VALUES ('35', 'gfdsgdg', '女', '2', '1', '2017-10-10 14:41:28', '1', '2017-10-10 14:41:28', null, '0');
INSERT INTO `staff` VALUES ('36', 'dfsgsdgsdg', '男', '2', '1', '2017-10-10 14:41:37', '1', '2017-10-10 14:41:37', null, '0');
INSERT INTO `staff` VALUES ('37', 'xvbvcxcbxcvb', '女', '0', '1', '2017-10-10 14:41:51', '1', '2017-10-10 14:41:51', null, '0');
INSERT INTO `staff` VALUES ('38', 'bnbvnvbncvncv', '女', '0', '1', '2017-10-10 14:42:03', '1', '2017-10-10 14:42:03', null, '0');
INSERT INTO `staff` VALUES ('42', 'uiopuiopuiopiuo', '女', '2', '1', '2017-10-10 14:43:07', '1', '2017-10-10 14:43:07', null, '0');
INSERT INTO `staff` VALUES ('44', 'dasf', '女', '0', '1', '2017-10-11 14:58:08', '1', '2017-10-11 14:58:08', null, '0');
INSERT INTO `staff` VALUES ('48', 'huug', '女', '3', '1', '2017-11-30 14:28:49', '1', '2017-11-30 16:30:51', null, '0');
INSERT INTO `staff` VALUES ('49', '345ad', '男', '1', '1', '2017-12-13 16:54:35', '1', '2017-12-13 16:54:35', null, '0');
INSERT INTO `staff` VALUES ('50', '434', '女', '1', '1', '2017-12-14 16:49:59', '1', '2017-12-14 16:49:59', null, '0');
INSERT INTO `staff` VALUES ('51', '喂喂喂', '女', '1', '1', '2017-12-28 15:16:48', '1', '2017-12-28 15:16:48', null, '0');
INSERT INTO `staff` VALUES ('52', '额问问', '女', '2', '1', '2017-12-28 15:16:57', '1', '2017-12-28 15:16:57', null, '0');
INSERT INTO `staff` VALUES ('53', '惹人', '女', '3', '1', '2017-12-28 15:17:31', '1', '2017-12-28 15:17:31', null, '0');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '山东省', '20', '110000', '2', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '济南市', '30', '110101', '3', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '历城区', '40', '110102', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '历下区', '50', '110104', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '高新区', '60', '110105', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类', '40', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2013-10-28 00:00:00', '1', '2013-10-28 00:00:00', '', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('00773cf2e1ae4be9b8de689da4edf885', '1', '系统设置-系统设置-角色管理', '1', '2017-12-26 16:28:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('00979c1bc5ec4d53a708d24076edb613', '1', '内容管理-内容管理', '1', '2017-11-23 11:00:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('00a61c31730b40f3af8be4fbe34badf6', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司', '');
INSERT INTO `sys_log` VALUES ('01068248b0d14733adc5c7a49f18300d', '1', '系统设置-机构用户-用户管理', '7', '2017-12-25 17:02:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('02847a860611465fa0f9cd2d2d46fc61', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-23 11:04:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0291eeca2a5a4481ad1ccaae73560576', '1', '内容管理-内容管理', '1', '2017-12-26 14:59:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('02d18abed8f6431cb5ed38ce7a0bb2b5', '1', '内容管理-内容管理-内容发布', '1', '2017-11-22 10:24:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('02dd499edd264b7c9818b3946da39ece', '1', '代码生成-代码生成-生成方案配置', '1', '2017-11-22 10:24:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('033d3c97df59474b905227bcdeb92a01', '1', '系统设置-机构用户-区域管理', '1', '2017-12-28 10:19:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('0359af9f8b2449b8943898abfd42d91d', '1', '系统登录', '1', '2017-12-05 11:14:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/log/', 'POST', 'pageNo=2&pageSize=30&title=&createBy.id=&requestUri=&beginDate=2017-10-09&endDate=2018-01-01', '');
INSERT INTO `sys_log` VALUES ('0379ff7ee2a641ab93ec93a1240a8918', '1', '系统设置-机构用户-区域管理-查看', '7', '2017-12-25 17:48:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/form', 'GET', 'id=2a12f621e94b4391a6cc739f8d05fdfa', '');
INSERT INTO `sys_log` VALUES ('0460ea9dbb674952a81378c83f5adc84', '1', '系统设置-系统设置-字典管理-查看', '1', '2017-12-06 14:48:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/form', 'GET', 'id=96', '');
INSERT INTO `sys_log` VALUES ('057baf51643a42fa9a100715cd440a4e', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-27 15:28:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('0594ee70242f4fd69e2932dde81c8680', '1', '我的面板-个人信息-修改密码', '1', '2017-11-23 11:04:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('05b9918494044a5e8e7b6d238c6f3ba7', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 16:02:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('060fc56dd6a844acb0fe501f65b5d7a9', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=4', '');
INSERT INTO `sys_log` VALUES ('065f335b5cf0467b85684858685c359b', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-12-26 15:15:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/form', 'GET', 'id=', '');
INSERT INTO `sys_log` VALUES ('06bcea1e73004e3b826559a4da75410f', '1', '在线办公-通知通告-我的通告', '1', '2017-11-22 10:39:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('078ae43ede3b40f1af33e16eb9d88427', '1', '内容管理-栏目设置-切换站点', '1', '2017-12-06 14:49:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/select', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('07e22444ed164800add85d52cf904d10', '1', '系统登录', '1', '2017-12-27 15:23:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('07fc44427560425396eb0cb309bc4ec3', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:49:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/usertorole', 'POST', 'id=2&___t0.3822053592292236=', '');
INSERT INTO `sys_log` VALUES ('086e3978fe674a299109d1c3041bd94e', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 15:40:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=18&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('08f9a60bb60c4f56944d9e4f59e6c969', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('092ea6159bd84f13a5917fbe2d529dbc', '1', '系统设置-机构用户-用户管理-修改', '1', '2017-12-27 11:24:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=&loginName=fsgfdg', '');
INSERT INTO `sys_log` VALUES ('096a5a39c35643518a6f84bfebc11494', '1', '系统设置-系统设置-字典管理-查看', '1', '2017-12-06 14:49:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/form', 'GET', 'sort=10', '');
INSERT INTO `sys_log` VALUES ('09869ee2d8e04af3883bc9559cd56979', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:35:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('09c4bebea060430a808ac5a646a3b924', '1', '内容管理-栏目设置-站点设置', '1', '2017-12-26 15:15:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('09debbd00d2e4a65ada2f3d6e0076599', '1', '在线办公-个人办公-我的任务', '1', '2017-12-26 15:09:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_32', '');
INSERT INTO `sys_log` VALUES ('0a29bf14a2724ba7876aec2d5b0044a9', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:31:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=sd&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('0ac28aaa17a54c2fa3fbda646aba52b9', '1', '代码生成-代码生成-业务表配置', '1', '2017-11-23 11:34:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_20', '');
INSERT INTO `sys_log` VALUES ('0b3080aaa868465d9b17110479b889c9', '1', '我的面板-个人信息-个人信息', '1', '2017-12-25 15:50:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('0b62f1b221ac4b7da4eb7b9c4fa7c907', '1', '代码生成-代码生成-业务表配置', '1', '2017-11-22 10:24:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0c9da7ab6a2a48388d360a8bfa347f10', '1', '内容管理-内容管理-内容发布', '1', '2017-12-26 14:59:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('0d73e7d518684e4ea6e1cb1d968ef9fa', '1', '内容管理-内容管理', '1', '2017-11-22 10:24:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0daea208b9764b90a0ae778ad3f6fdd9', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-25 17:49:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/form', 'GET', 'id=4', '');
INSERT INTO `sys_log` VALUES ('0e6efade92a547acaf51ecee00b3d7fa', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:22:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=12&company.name=历城区分公司&loginName=&office.id=13&office.name=公司领导&name=', '');
INSERT INTO `sys_log` VALUES ('1048a02fe2ea4b3098073090930c47c6', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 14:55:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('106f5665aa194bb193d79a85934c8b65', '1', '内容管理-栏目设置-栏目管理', '1', '2017-12-06 14:49:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('1073d64e8ed7497b9ba42a9563f8aeda', '1', '内容管理-内容管理-公共留言-查看', '1', '2017-12-06 14:49:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/guestbook/', 'GET', 'status=2&tabPageId=jerichotabiframe_13', '');
INSERT INTO `sys_log` VALUES ('10a7517e5eae42059be85a943200893a', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:41:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('115f423ab04a47219e08ee55f205b0e4', '1', '在线办公-通知通告-我的通告', '1', '2017-11-23 11:04:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('11ec4e991ada4877b640f3cf27569857', '1', '内容管理-栏目设置-站点设置', '1', '2017-12-26 15:15:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_57', '');
INSERT INTO `sys_log` VALUES ('12ba141aaa62453dbdb019153c8e2952', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=7', '');
INSERT INTO `sys_log` VALUES ('12c6be6d8830451ba8509f76263fa87a', '1', '内容管理-内容管理-公共留言-查看', '1', '2017-12-26 14:59:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/guestbook/', 'GET', 'status=2&tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('1374c1260daf49bb8c2d4f7fba4ff1db', '1', '内容管理-内容管理', '1', '2017-11-23 11:04:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1377990994de40e4964efabf1d3bf8cf', '1', '系统设置-机构用户-机构管理', '1', '2017-12-26 14:51:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('14636447bac64edd9198b90acc7a4dec', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=10&office.name=市场部', '');
INSERT INTO `sys_log` VALUES ('159a8ec44b5b407ca52a62049e9740ca', '1', '我的面板-个人信息-修改密码', '1', '2017-11-22 10:41:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('16cebb22a6e1479f9706f75c51bb7a13', '1', '系统设置-系统设置-菜单管理', '1', '2017-12-06 14:46:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('172326c134cb49bd86ef5cb06f385724', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=13&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('178664f923984e3f9dbfa7adc9995707', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 17:33:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=sd&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('1810fcc11f934365b7e0d41c50711c1e', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:01:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=&office.id=24&office.name=综合部&name=', '');
INSERT INTO `sys_log` VALUES ('18d680651e7949d7b21e8180d89a9184', '1', '系统设置-机构用户-用户管理', '1', '2017-11-23 11:02:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('19283e26d9914896870324b0b64b0a13', '1', '系统登录', '1', '2017-11-22 10:23:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1a67bf4ec1a744fd89eb6a99baa6ca8f', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('1ae997a64a964af694d4fbff6a4485b7', '1', '代码生成-生成示例-单表', '1', '2017-11-22 10:58:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/test/testData', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('1b5e7bf51a994d86998c9d249a815c4b', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 17:59:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=sd&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('1c62ff0e4f3f41d3a56167cb061c24b8', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/usertorole', 'POST', 'id=16d3812d86834d61899d1bd8e7541279&___t0.4334630617034789=', '');
INSERT INTO `sys_log` VALUES ('1cb734db596c4fcd9b076db4b65d84b4', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-26 14:50:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('1cc83290670547d5b70f0b75cea084ec', '1', '系统登录', '7', '2017-12-25 15:51:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1da71cb98029417e97223138b2906fbd', '1', '系统登录', '1', '2017-12-26 15:39:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/tag/treeselect', 'POST', 'url=/sys/office/treeData?type=1&module=&checked=&extId=&isAll=&___t0.948749066524706=&selectIds=', '');
INSERT INTO `sys_log` VALUES ('1dc0ac7c893144aa9013c0c45019cf35', '1', '内容管理-统计分析-信息量统计', '1', '2017-12-26 14:59:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('1dda5d66a07341cd89439715e19196b3', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-26 14:24:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1e5a82a9d9e94cb7849e932e170d0387', '1', '系统登录', '1', '2017-12-25 15:50:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1e7c5bb518a64d5cb19d69dd692376fa', '1', '内容管理-内容管理', '1', '2017-11-22 10:24:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1ed3b555629f4224b9115dd3f9b69f47', '1', '系统设置-机构用户-区域管理', '7', '2017-12-26 14:25:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('1f6982a6610d45cda7d9561f17ea1c5c', '1', '系统登录', '1', '2017-12-27 11:33:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/tag/treeselect', 'POST', 'url=/sys/office/treeData?type=1&module=&checked=&extId=&isAll=&___t0.9449090328337482=&selectIds=1', '');
INSERT INTO `sys_log` VALUES ('1fc40d1a5d684ec4b7b81f9519a4b443', '1', '系统登录', '1', '2017-11-23 11:34:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_20', '');
INSERT INTO `sys_log` VALUES ('1fc7180c3fbd4e269e6d83b5e7c928a0', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:51:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('1fd4d8b934434840a9e7a67dedc0aafd', '1', '我的面板-个人信息-个人信息', '1', '2017-12-27 18:04:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('200ee7ecdb16418fa0bff63d3f3cb8bd', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-23 11:03:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('219347d7e6594190bc5cf48bd6cfaa5f', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:26:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('222a83457d5a4c7ebc7b66f5882aaaaa', '1', '内容管理-内容管理-内容发布', '7', '2017-12-25 17:01:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('223c47d9a81945bbb79edbbfe06ed004', '1', '系统设置-机构用户-用户管理-修改', '1', '2017-12-28 09:45:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=&loginName=121212', '');
INSERT INTO `sys_log` VALUES ('2240ff82a8a144908450457ef6473851', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=15&office.name=市场部', '');
INSERT INTO `sys_log` VALUES ('22846bcef8124f2ab67924d49de9d766', '1', '代码生成-代码生成-业务表配置', '1', '2017-11-23 11:04:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('22b5365cda2041a5a81f68bc6881f960', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=18&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('2514c513df654862a030119e4338b8bf', '1', '在线办公-通知通告-我的通告', '1', '2017-11-23 11:00:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('25842374b59d4e4fa97d363956762bd0', '1', '系统设置-系统设置-角色管理', '1', '2017-12-06 14:46:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('25978d3b535f41c2abcd34db068f7147', '1', '我的面板-个人信息-个人信息', '7', '2017-12-26 14:24:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('264c0166bbae4d90bbc92959152138d7', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:29:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('2687681cf611407ea2afc3ec4cd23fcb', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/form', 'GET', 'parent.id=1', '');
INSERT INTO `sys_log` VALUES ('2755ecf4906f48558df5a466fc6e05a4', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('276c09ad91244ff28eae953cb2647c2f', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 17:59:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('29601f270d3b42e5bb07f52c517023a9', '1', '内容管理-栏目设置-站点设置', '1', '2017-12-26 15:00:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('29a5d45ee6904e9ebb5c315c5159aec5', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('29e41c00d70a47a09e17ff193c3a467c', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:33:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('2a672e0239734d49a6e250d00fc2dcc1', '1', '系统设置-系统设置-角色管理', '1', '2017-12-26 14:51:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('2a8d724f43bf4cfa96431a9515b8bfd3', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 16:58:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2bfe6b7ea3f949499724b379ea80e73d', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:53:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2c43fc0dd2b244009451a473c5a42cb4', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=23&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('2c988f094b084c4d8373f00eb2f7b798', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=1', '');
INSERT INTO `sys_log` VALUES ('2c9d1abcac5e455c8540a128a6653e53', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('2e7b6cd6dab546f999db67964169c994', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 16:57:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司', '');
INSERT INTO `sys_log` VALUES ('2ebd1ca44d6b4bcd9d7fa8252be423ba', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 15:40:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=18&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('3046d4989acf44ec9692eef959d779ba', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-23 11:03:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('308bd9f66ac44f9b9a2e252f8c75465a', '1', '在线办公-个人办公-审批测试', '1', '2017-11-23 11:10:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('30e4227472374969934f5e93b27b34aa', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 16:30:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('310db27a2c504246935f49ed64db60dc', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=23&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('310eaf8b97b14240ac532bec575bbb12', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 16:28:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('313c1b3600284e6c928a826f2dada2cf', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:50:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=', '');
INSERT INTO `sys_log` VALUES ('31e460d3d7d848b3b059574b89253d90', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:00:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('326a4047423e4b03885535ba20c644ca', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=3&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('3327e0c0606c4c5badc2398045c89a0d', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-12-26 14:51:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('344111fc8f8d4a6daeaabc9a6c232e38', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 15:40:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=19&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('3547e2db4a2348e984a4999093c7c301', '1', '系统登录', '1', '2017-12-27 14:54:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('357062740dca4c57be9c6da5e244fcf6', '1', '在线办公-流程管理-流程管理', '1', '2017-12-26 15:08:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('358281d6c0b54a5bbe18096a19aeb5b7', '1', '内容管理-内容管理', '1', '2017-12-27 15:30:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('35f5fd950ec9454aae09d98dbebf3c1f', '1', '系统登录', '1', '2017-12-27 10:27:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/tag/treeselect', 'POST', 'url=/sys/office/treeData?type=1&module=&checked=&extId=&isAll=&___t0.08222481796498715=&selectIds=', '');
INSERT INTO `sys_log` VALUES ('36471b3841db4709a6e46856d6e1a857', '1', '我的面板-个人信息-修改密码', '1', '2017-11-22 10:41:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('36dfce5787514a428f1e74a5b513e623', '1', '系统设置-机构用户-区域管理-修改', '7', '2017-12-25 17:48:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/save', 'POST', 'id=2a12f621e94b4391a6cc739f8d05fdfa&parent.id=5&parent.name=历下区&name=黄金客户&code=545454&type=4&remarks=', '');
INSERT INTO `sys_log` VALUES ('37097d554f574a2b80911f07b044cea6', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:51:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,', '');
INSERT INTO `sys_log` VALUES ('379c7d231d8a44bb8373aa82fc16bdd9', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('37c93305fb46422fa18eb2d4118805a0', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('37f3a8f884004d7faed0adf4aa29e19a', '1', '系统设置-机构用户-区域管理-修改', '7', '2017-12-25 17:48:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/save', 'POST', 'id=&parent.id=5&parent.name=历下区&name=黄金客户&code=545454&type=2&remarks=', '');
INSERT INTO `sys_log` VALUES ('38297bba188f4412bbd4d2dc917b7f66', '1', '在线办公-流程管理-流程管理', '1', '2017-11-22 10:41:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('38bc88fe1cff4cc987d675f71f72aa4f', '1', '内容管理-内容管理-内容发布', '1', '2017-12-06 14:49:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('38d0f4091e1945cfb002d2931fb28526', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('397f9305d22e441b82f0bbd5ef6ed59c', '1', '内容管理-栏目设置-站点设置', '1', '2017-12-06 14:49:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('39850193c6634b30b57362638ce0f3b7', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 16:27:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3a0d108d94cf48ce981570897f370804', '1', '系统设置-机构用户-用户管理', '1', '2017-11-22 11:14:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('3ae2fab648884743aad367d792d7cfca', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:30:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3b034281b61c48b6a0308e226024efde', '1', '系统登录', '1', '2017-12-04 16:46:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3b8da06245434abdbecf7616a059ddc4', '1', '内容管理-统计分析-信息量统计', '1', '2017-12-06 14:49:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_14', '');
INSERT INTO `sys_log` VALUES ('3bf117bc2b7a4aab8e0b146a007b5ec1', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('3c46a76e5ed14b56861a8993fbc56782', '1', '我的面板-个人信息-修改密码', '1', '2017-11-22 10:24:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3cf8c0e0602d488aac5a1e08be7294bd', '1', '在线办公-流程管理-流程管理', '1', '2017-12-26 15:10:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3dfb528cc4ae4eee9e05f4303da29ec5', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:25:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('3f421e9b0239417191599f225b51f504', '1', '系统设置-机构用户-用户管理', '1', '2017-11-22 10:49:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('4089ad17bd234962a6987843497c6406', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:24:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('40d10edc78a349958c6b87b541081901', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 14:54:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('40e32525746a499f838d43b3fb081a5d', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('412ca4876eb046839973c5e27ccff138', '1', '系统设置-机构用户-机构管理', '7', '2017-12-25 17:08:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('41b3823a2b714b068c7b81b2cec4a4f9', '1', '系统设置-机构用户-机构管理', '7', '2017-12-25 17:00:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('422a272ba58d4ffab9a7116656cc039b', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:24:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('4292b02484594845a8162e31a7b23106', '1', '系统设置-系统设置-字典管理', '1', '2017-12-06 14:48:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'POST', 'pageNo=1&pageSize=30&type=&description=', '');
INSERT INTO `sys_log` VALUES ('42c85c8e5558459a961db529edd25c8f', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:24:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('43c19b7944a24069b07d4ac9b2a78160', '1', '系统登录', '1', '2017-11-23 13:42:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/gen/genTable/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('43c44e2bf4d649b89ca3b74ade0b8533', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:49:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('440083292d0b4e1ca7446cae62fbf535', '1', '系统登录', '1', '2017-12-28 10:19:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('44b0fd5fe6794d75b4003b8541e83c86', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:35:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('453d0cd11a4d42e383a7e72f669af09b', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:25:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('456de500857145aa91a589b9c0414ca8', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=8', '');
INSERT INTO `sys_log` VALUES ('46358a43c5dc4972b3ad9c23ac498550', '1', '内容管理-内容管理-内容发布', '1', '2017-12-27 15:30:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('46398248ff814287a59493cac4fa74b5', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=21&office.name=技术部', '');
INSERT INTO `sys_log` VALUES ('4642bf5c9a8d409f9800691c60c65cd5', '1', '我的面板-个人信息-修改密码', '1', '2017-11-22 10:41:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('464874f8c4a14016b552cfb967bee281', '1', '系统设置-机构用户-区域管理', '7', '2017-12-25 17:48:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('46defcc90153487699dfe1db1490b182', '1', '系统设置-系统设置-字典管理', '1', '2017-12-06 14:49:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'POST', 'pageNo=3&pageSize=30&type=&description=', '');
INSERT INTO `sys_log` VALUES ('47654e164c254f57b885774b8d522b62', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=4', '');
INSERT INTO `sys_log` VALUES ('47733a0dba8c4816be51ab82e12c5457', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:01:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=&office.id=24&office.name=综合部&name=', '');
INSERT INTO `sys_log` VALUES ('47f8421294ae497ea9f8770df197d7c3', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 16:59:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('4a0213478fbe45e5943b060bb455ff79', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:53:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,', '');
INSERT INTO `sys_log` VALUES ('4a02aa870e63425ba090418b18944da1', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=4&office.name=市场部', '');
INSERT INTO `sys_log` VALUES ('4a05e7bd310f444080dfb8b66082b4d9', '1', '系统设置-机构用户-用户管理', '1', '2017-11-22 10:24:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4a881eed9c6343febd91ea5624c57d21', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:01:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4ad796e9dd59400fa5df6bd5c4578f68', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:50:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4bddcd9ee8bb42359abc4ec220fe1760', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:48:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('4c8c2a80a8bf4ac1a84b642886d9775f', '1', '我的面板-个人信息-个人信息', '7', '2017-12-25 15:51:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('4d0e427cffe447eaaac721d1eab31712', '1', '在线办公-通知通告-我的通告', '1', '2017-11-23 11:04:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('4d5aaa61b2c14803b3d1d5f073f369cd', '1', '我的面板-个人信息-个人信息', '1', '2017-11-23 11:00:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('4df0718535a746d5bc55641e82669861', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 10:12:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name ASC&company.id=&company.name=&loginName=&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('4e29b66647ab48c7a0ccd8fd422a7f8c', '1', '在线办公-个人办公-我的任务', '1', '2017-11-23 11:11:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4e6597a71979475abdcabd9f19d19559', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:00:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=10&office.name=市场部', '');
INSERT INTO `sys_log` VALUES ('4e89d8ecb0e14c46b47e2d5d90878e6f', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 14:54:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4eb7be5ed72942e6a484a482b6e3c693', '1', '系统设置-系统设置-角色管理', '1', '2017-12-26 16:30:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('4fd37f1c96fd4019a222ab7d01a48b5a', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-06 14:46:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('502b03d54e044c2eb0fd8eef61de05bd', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:24:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('517c96be8a4d4769a05789942ba6db2b', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:49:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('52453f5db6284080a499cc7626f1a263', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:01:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('526e5c5dcef1451bb3dbb6858efe6a15', '1', '系统设置-机构用户-用户管理', '1', '2017-11-23 11:04:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('53b68c790e6e440d9022c5cad3fef92e', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-22 11:14:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('543de897d8704ef6877d89f4146fa29c', '1', '系统设置-日志查询-日志查询', '1', '2017-12-04 16:46:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/log', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('5452091c9f03498696450effe6fdb26c', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司', '');
INSERT INTO `sys_log` VALUES ('54927bd284a443dfb202828be6baa94f', '1', '系统设置-系统设置-角色管理', '1', '2017-12-26 14:56:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5653dce789414e229a035d584d80c24c', '1', '系统登录', '7', '2017-12-26 14:24:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('56bea0c3f95c44adb8ea46725464c3e9', '1', '我的面板-个人信息-个人信息', '1', '2017-11-23 11:03:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('56f3a80791d1421ba44031529fcf51ad', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/form', 'GET', 'parent.id=1', '');
INSERT INTO `sys_log` VALUES ('5709ca4d81d140b5a6be633368319119', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=22&office.name=高新区分公司', '');
INSERT INTO `sys_log` VALUES ('57d0544dfdf74080b084a8b05f9887a1', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-12-26 15:15:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('587946dd2c084f7d940302095b419ced', '1', '在线办公-流程管理-模型管理', '1', '2017-12-26 15:12:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_42', '');
INSERT INTO `sys_log` VALUES ('5914d9ad93be4c5f9974e91f9fc51083', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:24:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('5946eacb4e534245a20bee8ec2077c6f', '1', '系统设置-机构用户-用户管理', '1', '2017-12-27 18:04:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('5a3ac85729614007be7df33c31ab631d', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=1', '');
INSERT INTO `sys_log` VALUES ('5a6742557cb74b928c920701ce493a92', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-12-26 14:58:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=16d3812d86834d61899d1bd8e7541279', '');
INSERT INTO `sys_log` VALUES ('5ab142d012c645fc8efbeda7b891fb70', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('5ca0b70d9af14cddaa5062c99b33cb5d', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:01:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('5ceb7c8d5a4b4aada03ccf4109b7ec4f', '1', '系统设置-机构用户-机构管理', '1', '2017-12-27 15:28:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('5cf03c0f629b4500bf892d2646a55f4b', '1', '内容管理-内容管理', '1', '2017-12-06 14:49:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d359179aab445a0a845c40a8bd409ec', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=18&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('5d508b3611844934938952bd845409a3', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 15:23:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d8560a3159d4f32823f8b2e76f29163', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-12-26 16:30:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/save', 'POST', 'id=&office.id=2&office.name=公司领导&oldName=&name=ewer&oldEnname=&enname=erwer&roleType=assignment&sysData=1&useable=1&dataScope=8&menuIds=&officeIds=&remarks=', '');
INSERT INTO `sys_log` VALUES ('5df04a6d58e647519db5ab2efd01a5f8', '1', '系统登录', '1', '2017-12-27 10:36:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/tag/treeselect', 'POST', 'url=/sys/office/treeData?type=1&module=&checked=&extId=&isAll=&___t0.8717069340273353=&selectIds=', '');
INSERT INTO `sys_log` VALUES ('5e04c2388e40416faa58442ac21c26cc', '1', '系统设置-系统设置-字典管理', '1', '2017-12-06 14:48:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5f5aae6a84874f25938cf7beaf5d8936', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:22:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=12&company.name=历城区分公司&loginName=&office.id=8&office.name=公司领导&name=', '');
INSERT INTO `sys_log` VALUES ('6072e1744ba74fbc84000a90a8d9613a', '1', '系统设置-系统设置-角色管理', '1', '2017-12-26 14:58:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('60b0469e0f62415cafa0e85f018622af', '1', '我的面板-个人信息-个人信息', '1', '2017-11-23 11:04:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('60f8ecffa47246a1b634f585d4780ddb', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=25&office.name=市场部', '');
INSERT INTO `sys_log` VALUES ('61e7332aca63408cb152854ce4fdf77b', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:50:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('62c3479156b94040ae4669fd50c05b43', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=12&office.name=历城区分公司', '');
INSERT INTO `sys_log` VALUES ('633017f551d34474b86c097c87be7179', '1', '系统登录', '1', '2017-12-06 14:46:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('647d47e9d52f4f309af17492ebc05e04', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:26:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=f897e35783b34480a4979290af8f19b9', '');
INSERT INTO `sys_log` VALUES ('649ebbe343c846e0b954dc38df5a3911', '1', '内容管理-内容管理', '7', '2017-12-25 17:01:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('64afeb2bbeb149c5aa546200df43b587', '1', '在线办公-流程管理-流程管理', '1', '2017-12-26 15:12:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_43', '');
INSERT INTO `sys_log` VALUES ('65d1848b9fa44a3ab24364a97545b40e', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:25:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('677a2c23f0764bc4920e4e458d2ee983', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('6862d580bf804eff8efa2736019e127c', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司', '');
INSERT INTO `sys_log` VALUES ('69889f24571a42248fddfc1affd092d8', '1', '在线办公-流程管理-模型管理', '1', '2017-11-22 10:41:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6b18cedb2ff94916914237fcc0c2a786', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=9', '');
INSERT INTO `sys_log` VALUES ('6bcd81711e0941c485b6596fb4586392', '1', '我的面板-个人信息-个人信息', '1', '2017-12-06 14:46:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('6c9fc2f391304cb2b7eadbfe4d3d9e03', '1', '系统登录', '1', '2017-12-27 11:44:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/tag/treeselect', 'POST', 'url=/sys/office/treeData?type=1&module=&checked=&extId=&isAll=&___t0.490068394028609=&selectIds=7', '');
INSERT INTO `sys_log` VALUES ('6d2f7d7e2d42421aa68718454aa11328', '1', '系统登录', '7', '2017-12-25 16:59:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('6dc9e5c739bd4ec8a7525264cbc99023', '1', '我的面板-个人信息-修改密码', '1', '2017-11-23 11:04:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6ef0ec17c1bb462199858d97612f29cf', '1', '系统设置-机构用户-区域管理', '7', '2017-12-25 17:08:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('6f53b41fa3d942cfa1fca10ae1850947', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=3&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('7008762158a44895a0109b28091d7f46', '1', '代码生成-生成示例-树结构', '1', '2017-11-22 10:59:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/test/testTree', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('706fbfcc4b6a441593efa8e492b52508', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=3', '');
INSERT INTO `sys_log` VALUES ('70ec63b21cf645fea770f2295342ea56', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=21&office.name=技术部', '');
INSERT INTO `sys_log` VALUES ('71289e12c09240c6a6dca3a9b697811e', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:48:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_23', '');
INSERT INTO `sys_log` VALUES ('715bb5003c2345c78094edfce4bafe43', '1', '系统设置-系统设置-角色管理', '1', '2017-12-26 14:57:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('719b653601764f73aac41f6947ce1031', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/form', 'GET', 'parent.id=7', '');
INSERT INTO `sys_log` VALUES ('71ebe121d7be45eeac19a2c3fc2969fc', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('724b4ef2d9a44671a0ec9d7788b65246', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:50:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('724f0bb88a0c463aa68e726c9c2360b4', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('7271ea8992ee426596ed685c8309797b', '1', '系统设置-机构用户-机构管理-修改', '7', '2017-12-26 14:35:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/save', 'POST', 'id=1&parent.id=&parent.name=&area.id=2&area.name=山东省&name=山东省总公司1&code=100000&type=1&grade=1&useable=1&primaryPerson.id=&office.primaryPerson.name=&deputyPerson.id=&office.deputyPerson.name=&address=&zipCode=&master=&phone=&fax=&email=&remarks=', '');
INSERT INTO `sys_log` VALUES ('72efde0242f24104aec8039331826537', '1', '在线办公-流程管理-模型管理', '1', '2017-11-23 11:08:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('75e783575aa34819bedb84b4f494bb3e', '1', '内容管理-统计分析-信息量统计', '1', '2017-12-26 15:15:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/stats/article', 'POST', 'categoryId=&categoryName=&officeId=&officeName=&beginDate=2017-12-01&endDate=2017-12-31', '');
INSERT INTO `sys_log` VALUES ('7673bdcfce134ecf9b019d51f034392f', '1', '系统登录', '7', '2017-12-26 14:48:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_23', '');
INSERT INTO `sys_log` VALUES ('76a1f0191dd94c96a37e92c3dabaf559', '1', '系统设置-机构用户-区域管理', '7', '2017-12-25 17:49:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('76cb63564c674513bfedfabf7d6a8afe', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:23:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=12&company.name=历城区分公司&loginName=&office.id=13&office.name=公司领导&name=', '');
INSERT INTO `sys_log` VALUES ('781860bfd52145a2a970961de3847611', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:53:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=12&parentIds=0,1,7,12,', '');
INSERT INTO `sys_log` VALUES ('78cb246b6ed24baaad948d507d5ed5f7', '1', '系统设置-机构用户-用户管理', '7', '2017-12-25 17:01:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('7c1731894f454ff380d202a39d6cae7c', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-12-26 14:57:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=16d3812d86834d61899d1bd8e7541279', '');
INSERT INTO `sys_log` VALUES ('7cb254b0e0194297b9d355e8db6ddcec', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('7d7e7782f3174609998131296720ed58', '1', '系统登录', '7', '2017-12-25 17:47:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7dee43cc1fae4853bc41ce5d8bfd3988', '1', '系统登录', '1', '2017-12-26 15:02:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/process/convert/toModel', 'GET', 'procDefId=test_audit:1:fe8feaf92cc445a8a94933e531209bbe', '');
INSERT INTO `sys_log` VALUES ('7f1e2b9072284e78a4ef39045ba360a0', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:04:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7f7d6824955840c29e142b7eae34caf2', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=1', '');
INSERT INTO `sys_log` VALUES ('80673c9e551f4a00b82d16955bb7679c', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 11:01:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('808a82eb145440169f70cf05beb5d27c', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-23 11:02:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('80b1b01fb3a94037958a229b10847952', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:22:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=&company.name=&loginName=&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('80dee2504a5f41e2b1e69b3f7d85bf73', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('8169cf7985ea4f53b178c9fd9396157e', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=13&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('8223b969fbb84ad382ce56493e2a2af5', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('83df3c11ab334670839cf83a0c7265c0', '1', '内容管理-栏目设置-栏目管理', '1', '2017-12-26 14:59:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('85617aa3babe4de18d37c4b07f759cdf', '1', '在线办公-通知通告-通告管理', '1', '2017-12-26 15:00:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_13', '');
INSERT INTO `sys_log` VALUES ('857ee24925c14c1ca1d4242b1d595024', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 15:23:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8642065600474123a4ea6e64396bce54', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-25 15:50:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8666804675404ad593181614112d18c8', '1', '系统登录', '1', '2017-12-26 16:27:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('86bc9fbd7ad44c92a4b630499c87156a', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:22:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=12&company.name=历城区分公司&loginName=&office.id=8&office.name=公司领导&name=', '');
INSERT INTO `sys_log` VALUES ('86df591434fb45f693be473726157181', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 16:59:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('8748a03c07e045fb8d232d2ac35a8f69', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:24:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('874aa5a664cf497ab0456ac6cae3c854', '1', '系统设置-机构用户-区域管理-查看', '7', '2017-12-25 17:08:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('87d703c3c2864586bed9ce03265dca9e', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=22&office.name=高新区分公司', '');
INSERT INTO `sys_log` VALUES ('8a5d1868ad8940c1a78d6ff8958723be', '1', '在线办公-个人办公-我的任务', '1', '2017-12-26 15:09:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8aee935cd5cf4a85aa5e37d3921eea46', '1', '系统登录', '1', '2017-11-23 11:00:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8b07ff18aa004b45b2206e194109976b', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:35:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,', '');
INSERT INTO `sys_log` VALUES ('8b08e96dd0bd44ae9b3c8969ad1974e0', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:05:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=sd&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('8b6007ab8bdb4b4c83ca232f82d43321', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 17:33:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8bccf54558d44962bb39d58c37a5e7f2', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('8bd9ef00cfc145d89e540ea7052dfe11', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('8c5b1aef462a4710b259f7dc1764ff12', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:05:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=sd&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('8cd13101b10740a49610153327fed677', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:50:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8ce75d56f6f44347b39438fd7635e496', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('8d1dc4f74c364ffc95e73b84bae28475', '1', '系统登录', '1', '2017-12-27 18:27:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8e092735baa84872a400c3032dcaef49', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e60f287de704e25927233c8809a564f', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=17&office.name=历下区分公司', '');
INSERT INTO `sys_log` VALUES ('8ef7946b9e8d4903a79669ea29baf8ad', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=19&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('8efba4693a124ae98c14cc48f35f75d6', '1', '系统设置-机构用户-用户管理', '1', '2017-12-26 14:51:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('901a126e1fdb49319342657e50638247', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=12&office.name=历城区分公司', '');
INSERT INTO `sys_log` VALUES ('906d44b005104dcb8dbead41b9fa53b3', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-25 17:08:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('910f4846842c4127a12a9d979a5d714c', '1', '在线办公-流程管理-模型管理', '1', '2017-12-26 15:02:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_18', '');
INSERT INTO `sys_log` VALUES ('9142291343724723986ce652637cc206', '1', '系统设置-机构用户-机构管理', '7', '2017-12-26 14:24:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('917e6bd3f6c441cdb62c2ed981722cf7', '1', '代码生成-生成示例-主子表', '1', '2017-11-22 10:58:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/test/testDataMain', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('925f657e520b4cdab08acbba36559fad', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 15:24:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('92e813c5f651403383513aea88d190c1', '1', '我的面板-个人信息-个人信息', '1', '2017-12-26 14:51:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('9388b31569cb4c54bdbfd87fd7652425', '1', '在线办公-个人办公-我的任务', '1', '2017-11-22 10:39:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('93ec56c06ad544c0add38930868a4a74', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:24:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('944c62db82ad4f61bf5f7e6d681cd12b', '1', '我的面板-个人信息-个人信息', '1', '2017-12-27 14:54:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('94dd37912c544948b3b0ffcaffb2ce00', '1', '系统设置-系统设置-角色管理-修改', '7', '2017-12-26 14:50:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('96430e05e3a64bf18ec8360dbd340586', '1', '系统设置-机构用户-区域管理-查看', '1', '2017-12-28 10:19:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('96cdad29b9b14a9f8e6fe05c5ee61469', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:01:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=&office.id=24&office.name=综合部&name=', '');
INSERT INTO `sys_log` VALUES ('96fc2f12048e4342904cfedef57976bb', '1', '系统登录', '1', '2017-12-27 16:27:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9710936c181e40af9f99905879dddc70', '1', '代码生成-生成示例-单表', '1', '2017-11-22 10:24:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('973a94ad850143cbac8aa77e2ddb70fa', '1', '系统登录', '7', '2017-12-26 14:34:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('984f67b16b0f42f392dc1da969434614', '1', '系统设置-机构用户-机构管理-修改', '1', '2017-12-26 14:51:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/save', 'POST', 'id=1&parent.id=&parent.name=&area.id=2&area.name=山东省&name=山东省总公司&code=100000&type=1&grade=1&useable=1&primaryPerson.id=&office.primaryPerson.name=&deputyPerson.id=&office.deputyPerson.name=&address=&zipCode=&master=&phone=&fax=&email=&remarks=', '');
INSERT INTO `sys_log` VALUES ('9941e2fa1e5c416a951f37373d679ec2', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:51:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('9986379cf8494fee856130045b2fd9e5', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:30:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('998fafc6f695465e95815965636a109f', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=14&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('99c56978191f4214826537508b3ede4b', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:34:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('9a97aa1b6c3349eabb61bcf152d9f431', '1', '系统设置-机构用户-机构管理', '7', '2017-12-26 14:35:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_21', '');
INSERT INTO `sys_log` VALUES ('9afe4ba6a2ae499daea43f6f963fc247', '1', '内容管理-统计分析-信息量统计', '1', '2017-12-26 15:15:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/stats/article', 'POST', 'categoryId=&categoryName=&officeId=&officeName=&beginDate=2017-09-04&endDate=2017-12-31', '');
INSERT INTO `sys_log` VALUES ('9b378d54d9134d789372c5983afbd852', '1', '系统设置-机构用户-区域管理', '7', '2017-12-25 17:08:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9b949b311df54c90a69a1511a1a073ae', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:56:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9c2e51415cfa4579b2ef794b2afe7f15', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:41:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9d910338775647aaa4256e93d0c0078f', '1', '系统设置-机构用户-用户管理', '1', '2017-12-04 16:46:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('9fe9b714917f4767854d255500df2ddc', '1', '在线办公-通知通告-我的通告', '1', '2017-12-26 15:00:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('a12b9381c0a046088400df5921c8197b', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=16&office.name=技术部', '');
INSERT INTO `sys_log` VALUES ('a13adc71131b4d03a8a4f50824e5bdb7', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,', '');
INSERT INTO `sys_log` VALUES ('a16ebab3834d4d87889c445385b5ff83', '1', '系统登录', '1', '2017-12-26 14:51:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a1d006d1cf0d49f4be851d760e19f28f', '1', '系统登录', '1', '2017-12-27 18:04:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a30f1c1a1bce4946a8373657ae215bdc', '1', '在线办公-流程管理-流程管理', '1', '2017-12-26 15:02:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a3586909572e45dc8d775182a6ec94f8', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 15:39:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=16&office.name=技术部', '');
INSERT INTO `sys_log` VALUES ('a37cb82931864797bfe908c5519f33e3', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:25:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=12&parentIds=0,1,7,12,', '');
INSERT INTO `sys_log` VALUES ('a5afb5a53ad143a5bbc63f5af07aad06', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=21&office.name=技术部', '');
INSERT INTO `sys_log` VALUES ('a61be943509e4f97aa0a15672755a80f', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:44:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a638554a472f4543a96c87a760dcc5ec', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 10:12:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=&company.name=&loginName=&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('a645013ad6d74b8a9c8e1e246faf9844', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=10', '');
INSERT INTO `sys_log` VALUES ('a677ce0dce5f4877a5488eefcae6ab16', '1', '我的面板-个人信息-个人信息', '1', '2017-12-27 17:59:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('a6817211c74644e2a7b27bd7b9141501', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:24:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('a69cec3e5cf14c48a16121b0c47397a1', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=7', '');
INSERT INTO `sys_log` VALUES ('a6c68fcf450e493bba97644abb8cc346', '1', '在线办公-个人办公-我的任务', '1', '2017-11-22 10:40:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a6d9e9857a7d453d979985ddff271154', '1', '系统设置-机构用户-用户管理', '1', '2017-12-27 18:27:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('a6deafa172aa4188b36332df4f0deffe', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=', '');
INSERT INTO `sys_log` VALUES ('a706d25e06d94bdda955b30d197721f0', '1', '系统设置-机构用户-用户管理-修改', '1', '2017-12-27 11:24:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/save', 'POST', 'id=&photo=&company.id=1&company.name=山东省总公司&office.id=13&office.name=公司领导&no=345&name=fgsdgsd&oldLoginName=&loginName=fsgfdg&newPassword=&confirmNewPassword=&email=&phone=&mobile=&loginFlag=1&userType=&roleIdList=2&_roleIdList=on&remarks=', '');
INSERT INTO `sys_log` VALUES ('a75dad3848fe48539d716494b486dc28', '1', '系统登录', '1', '2017-12-26 16:57:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司1', '');
INSERT INTO `sys_log` VALUES ('a82283218caa4819acc5c4cd5d2d2631', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('a89c3f404b8141089535e3e2f2750314', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:04:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('a8dafb2e716b4139b973be304552d76d', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 14:56:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=f897e35783b34480a4979290af8f19b9', '');
INSERT INTO `sys_log` VALUES ('a921172cf64a478daeaf1f843c598b99', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 14:51:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a97f241052584b9b974bcad4be656c74', '1', '内容管理-栏目设置-站点设置', '1', '2017-12-26 15:15:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aa5f84cd351d47429dc6c229a753cb24', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=15&office.name=市场部', '');
INSERT INTO `sys_log` VALUES ('aa95f4d2dce84161ad39087ea6bf80af', '1', '系统设置-机构用户-用户管理', '1', '2017-12-26 16:58:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_61', '');
INSERT INTO `sys_log` VALUES ('aabe6e69af89496dab862b7d5665bbd3', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:48:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('abc963cd6a8c49a98256763ece9690dc', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('ac73ee8db5a54fceb46c10520d5a6d19', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:00:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('addd560be1774807a5b6813810fbbf64', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司', '');
INSERT INTO `sys_log` VALUES ('ae101998084442c58f9c69724b9fd424', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=', '');
INSERT INTO `sys_log` VALUES ('ae50ea2bd5a447d09a25425e5d64e824', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 16:27:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=9', '');
INSERT INTO `sys_log` VALUES ('ae73f816d7e644f1ab014628d3764083', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-23 11:03:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aeb6e14ad1dc4ca68b074ddf53e8dadf', '1', '代码生成-代码生成-业务表配置', '7', '2017-12-25 17:01:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('af10f93b62e0499caf505b93ea2e6126', '1', '系统登录', '1', '2017-12-27 11:53:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('af8855ea6cff419e9d3a1646e5f50259', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:00:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('b05d17ee959c48e18b2108793825bf47', '1', '内容管理-内容管理', '1', '2017-11-23 11:04:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b1b74a79ef574bcdbf3dcdde0c447579', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b269056fcc3246e082a539928409358f', '1', '在线办公-通知通告-我的通告', '1', '2017-12-26 15:14:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_49', '');
INSERT INTO `sys_log` VALUES ('b3fb6384460341e59f367cf05710333a', '1', '系统设置-机构用户-用户管理', '1', '2017-12-27 15:57:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('b5cb5cc9d7e24f7cb60dfca59f5ebc32', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:49:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b62b50cf849845d29d9cd64e05452aa4', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=24&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('b76ded214407465d9ebc5dc81bc25b93', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=&office.id=24&office.name=综合部&name=', '');
INSERT INTO `sys_log` VALUES ('b7ce0bb0543a4762b842dfc02c17bb32', '1', '系统设置-系统设置-字典管理-查看', '1', '2017-12-06 14:49:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/form', 'GET', 'id=71', '');
INSERT INTO `sys_log` VALUES ('b92d0dc775fd49129d0b930ae8454fdd', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 16:59:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('b97cfc27456d401abd2e46d800259b91', '1', '系统登录', '1', '2017-12-04 17:04:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/log/', 'POST', 'pageNo=1&pageSize=30&title=&createBy.id=&requestUri=&beginDate=2017-11-26&endDate=2018-01-01', '');
INSERT INTO `sys_log` VALUES ('ba0b852628134b6289e2221189923c8e', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-27 15:28:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/form', 'GET', 'parent.id=', '');
INSERT INTO `sys_log` VALUES ('ba3745c1cdfe4f78aa15ccc2f1087b3c', '1', '内容管理-内容管理', '7', '2017-12-25 17:01:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ba3ad82a02fa4d58bc211df7a5e45582', '1', '系统设置-系统设置-字典管理', '1', '2017-12-06 14:48:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'POST', 'pageNo=2&pageSize=30&type=&description=', '');
INSERT INTO `sys_log` VALUES ('ba7a8d15421a4fc3bda3d26942f3df85', '1', '系统设置-系统设置-字典管理-查看', '1', '2017-12-06 14:48:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/form', 'GET', 'sort=10', '');
INSERT INTO `sys_log` VALUES ('bb1ebdb590d54baaacd95a45721e97a8', '1', '内容管理-内容管理', '1', '2017-11-23 11:00:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bb49ee0b587b4772961e6f388f17ac1c', '1', '系统设置-机构用户-区域管理', '7', '2017-12-25 17:49:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bba1871df83b492fbb60e9496662b627', '1', '我的面板-个人信息-个人信息', '1', '2017-12-27 18:27:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('bc2cf2bff90949f3a773228dcb67493d', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:03:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bc9ab33b7e7d4e309db011370e4aa673', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 16:27:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('bd5a2997877d40f8a9221a55e8a939f6', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 15:57:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bf2324eb5e8642efbb07c7fc6caf560f', '1', '系统登录', '1', '2017-12-27 11:18:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/tag/treeselect', 'POST', 'url=/sys/office/treeData?type=1&module=&checked=&extId=&isAll=&___t0.059710250210623705=&selectIds=7', '');
INSERT INTO `sys_log` VALUES ('bfd9a477aa4b4073ba658c71756a78da', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 15:23:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c06d7de6826348bba44bce0ba0fd1375', '1', '在线办公-流程管理-模型管理', '1', '2017-11-22 10:41:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c0cbbb0bdb5641d49bc2d16b8a8558c2', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=', '');
INSERT INTO `sys_log` VALUES ('c102b393fadd4397aab90e730f6ff12e', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 16:59:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('c10433e0b1d84e0ebe8bead1c895fec3', '1', '在线办公-流程管理-流程管理', '1', '2017-11-23 11:08:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('c1a8e89596b941098d11b08891380d21', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=15&office.name=市场部', '');
INSERT INTO `sys_log` VALUES ('c30963c3ca884193bde066932fa0f9ad', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 17:59:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('c3393f4a719e409abf87c5ecc936d50d', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:00:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=8&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('c41e35eb4ac942d29602d4a3e0e40741', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:33:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('c46a1c7885df4be69df30667e3397f57', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:49:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('c4d993c78b064b6298c351d73981f41c', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:32:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=sd&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('c560cca548674484958228f3b910221b', '1', '系统登录', '1', '2017-11-23 11:10:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/process/deploy/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c57ecd570d504d879553751907dec135', '1', '系统登录', '1', '2017-12-28 09:45:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c58bde46e5ab40acae8a780cc70815ac', '1', '内容管理-内容管理-内容发布', '1', '2017-11-23 11:00:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('c59c67f7709b488884b6f1ba42898f05', '1', '内容管理-内容管理', '1', '2017-12-06 14:49:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c5ac91c0ae964016a035f083365540aa', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 16:27:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c5d9791784ca4ccbbf26e58126889218', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('c6d359a8e4fc4bf792141d0abe0d3cc8', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 15:40:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=19&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('c7116378257448379f7fdbf909d394bc', '1', '系统登录', '1', '2017-12-27 17:59:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c7227a6048bc46b2a67096c0615122a1', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=3', '');
INSERT INTO `sys_log` VALUES ('c8f766f2127d48758505daea15964212', '1', '系统设置-系统设置-字典管理', '7', '2017-12-26 14:34:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('c908298bac8c4b458f0b4de760a60b58', '1', '在线办公-个人办公-我的任务', '1', '2017-12-26 15:00:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('c9820ef1c0eb43179ecaddf9757161b8', '1', '系统登录', '1', '2017-12-26 15:12:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_42', '');
INSERT INTO `sys_log` VALUES ('cb64321745d44c30974643029af40661', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:23:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('cd583552f9e34b528a9d60ac914ea8d4', '1', '我的面板-个人信息-个人信息', '1', '2017-11-23 11:04:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('ce5a93ed23b0460f892eb23432afaf7b', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=3', '');
INSERT INTO `sys_log` VALUES ('cebc343a015c4ff793f81433e57d038f', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-12-26 15:15:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/form', 'GET', 'id=', '');
INSERT INTO `sys_log` VALUES ('cec29a3d360340b39943a5ccc41e26de', '1', '系统设置-机构用户-机构管理', '1', '2017-11-23 11:02:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('ced42161a8074ea1b3186b6d1e0254bc', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 15:56:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cef4def5bbf14039a4b6352ced67754c', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=5', '');
INSERT INTO `sys_log` VALUES ('d041e313c284447ca83aa40fe4f28b53', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:02:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=12&office.name=历城区分公司', '');
INSERT INTO `sys_log` VALUES ('d25c2b78cd9e48b1be5e41f9422a5096', '1', '内容管理-栏目设置-切换站点', '1', '2017-12-26 15:00:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/select', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('d2c7dc59314a4765b80641516801811a', '1', '在线办公-个人办公-审批测试', '1', '2017-12-26 15:00:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('d35dde98792d4b9dadc8b8493acf1070', '1', '系统登录', '1', '2017-11-22 11:14:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('d4603f1d1aa74e6dbf683522b341ecc0', '1', '系统登录', '1', '2017-11-22 10:39:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d4706aa8ce6145e799b9cd489d6145ee', '1', '系统登录', '1', '2017-12-27 17:33:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d553f2825a9d4500ac0e8f62d1743997', '1', '内容管理-栏目设置-站点设置-查看', '1', '2017-12-26 15:15:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/site/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d55e4b78d8f3431db944fdb246250d1d', '1', '内容管理-内容管理-评论管理-查看', '1', '2017-12-06 14:49:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/comment/', 'GET', 'status=2&tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('d5ad9c88a1ab4b8a82d4eed8bbc61410', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 10:12:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/import/template', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d7478626f9d741d2b9d58d0bebde3834', '1', '内容管理-统计分析-信息量统计', '1', '2017-12-26 15:15:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_56', '');
INSERT INTO `sys_log` VALUES ('d75d0892a89544f8b639247144db9697', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-04 16:46:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d7bc9ec1f35049c08b5948fd26131ae0', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=1', '');
INSERT INTO `sys_log` VALUES ('d7f61e904fff42d2b624f72fcc824a04', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:41:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d87214827f1f4f98b1aa0335ec7e07ba', '1', '系统设置-机构用户-区域管理-修改', '7', '2017-12-25 17:49:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/delete', 'GET', 'id=2a12f621e94b4391a6cc739f8d05fdfa', '');
INSERT INTO `sys_log` VALUES ('d877aac77bd64eb6a1d44602841895e9', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:35:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('d92e9b577563473f83b9815f11c2e5cd', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=16&office.name=技术部', '');
INSERT INTO `sys_log` VALUES ('dab16515cd9e4aff8035ceb213eb7bdf', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-22 10:24:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dab62660601d4d9f87263a3c8af806eb', '1', '内容管理-内容管理', '1', '2017-12-26 14:59:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dafab9e0f26e45f39af77ed2871c4ed6', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-28 09:45:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dbe1341aaed843b08ec475215b0ba32b', '1', '系统设置-系统设置-字典管理', '1', '2017-12-06 14:49:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dc08751adb9e408fa15c6b57c6685ecd', '1', '我的面板-个人信息-修改密码', '1', '2017-12-27 14:56:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dc533dc9f6a14f77a70550de62827a8b', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-12-26 16:28:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/save', 'POST', 'id=&office.id=2&office.name=公司领导&oldName=&name= 的说法&oldEnname=&enname= sdaasas&roleType=assignment&sysData=1&useable=1&dataScope=8&menuIds=&officeIds=&remarks=', '');
INSERT INTO `sys_log` VALUES ('dd421b46374d4ebe9d3956c6ca473c06', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=24&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('dd555104ba1a44ee95db5c09b39c47a3', '1', '系统设置-机构用户-用户管理', '1', '2017-12-25 15:50:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('dda040faba4c4ab78effb223ad0a90d7', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:22:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=12&company.name=历城区分公司&loginName=&office.id=14&office.name=综合部&name=', '');
INSERT INTO `sys_log` VALUES ('ddfc71545fb84b6683530e1a1deb34b1', '1', '系统登录', '1', '2017-12-27 10:12:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name ASC&company.id=&company.name=&loginName=&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('de09766c30b748bcb4db29208b02a040', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:28:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('de15810865e444d780bf80b4864453a9', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:32:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=&company.id=&company.name=&loginName=sd&office.id=&office.name=&name=', '');
INSERT INTO `sys_log` VALUES ('de212e51ee5146e593baea7a3a07e827', '1', '系统设置-机构用户-区域管理-查看', '7', '2017-12-25 17:49:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('de7827f7d36d4b52bc29610c6c11600f', '1', '在线办公-通知通告-我的通告', '1', '2017-11-22 10:39:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('deba301de87842cab507c8aba40455d9', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-11-23 11:02:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('dfcfaa92aeb14ff6a10035bc44dfceb1', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:24:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('dfdc5aa6b4cb40f0a6ea93a08e1b9b74', '1', '系统设置-机构用户-用户管理', '7', '2017-12-25 15:51:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('e04c2aec94af47599e249d4637ee235d', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:04:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e1bd4422c25e40d19b3ac5ca6ce759b1', '1', '系统设置-机构用户-区域管理-查看', '7', '2017-12-25 17:47:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e1cec76bc5f34b57bf4750cd1d677e95', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:24:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('e1f8178c78724be1a273c2a0888831cc', '1', '在线办公-通知通告-我的通告', '1', '2017-11-22 10:24:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e30fd987490e4e2ba3b47183d30ab36f', '1', '系统设置-机构用户-区域管理-查看', '7', '2017-12-26 14:25:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/form', 'GET', 'id=4', '');
INSERT INTO `sys_log` VALUES ('e396e1fceb754efd8328704a411816ae', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('e45de79fdaf74c398a61bb8c8de96c50', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:24:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('e49877e390cd464a801d1daddc0dba1a', '1', '代码生成-代码生成-业务表配置', '1', '2017-11-22 10:53:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('e5c35dfa08d54f6bb361384379d64035', '1', '代码生成-生成示例-单表-查看', '1', '2017-11-22 10:25:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/test/testData/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e6297dc678c64f139efe6a2b43313f22', '1', '内容管理-内容管理-评论管理-查看', '1', '2017-12-26 14:59:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/comment/', 'GET', 'status=2&tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('e67b7eac226544edafc4ae3eb9bd1c78', '1', '系统设置-机构用户-用户管理', '1', '2017-12-27 17:59:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('e6bf9990dd204d63a93b1d5119157362', '1', '内容管理-内容管理-公共留言-查看', '1', '2017-12-26 15:15:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/guestbook/', 'GET', 'status=2&tabPageId=jerichotabiframe_55', '');
INSERT INTO `sys_log` VALUES ('e709aa91784145ecbb1dd895a6cc1209', '1', '系统设置-机构用户-区域管理', '7', '2017-12-25 17:48:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e746bc11e78d4c178de92644aa999728', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=21&office.name=技术部', '');
INSERT INTO `sys_log` VALUES ('e75db01da36b4942877bd7b767b00161', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司', '');
INSERT INTO `sys_log` VALUES ('e7bb96ccf3b44833828dba69f97c4033', '1', '系统登录', '1', '2017-11-22 10:53:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/menu/tree', 'GET', 'parentId=79', '');
INSERT INTO `sys_log` VALUES ('e83b9eaf938a43bda8c214decc8684c3', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:00:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('e8611c77d0294085973054f76a261f9a', '1', '系统设置-系统设置-角色管理', '7', '2017-12-26 14:49:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_24', '');
INSERT INTO `sys_log` VALUES ('e9b19ec4f58a40e1870801d9cc4641ba', '1', '系统设置-系统设置-角色管理-查看', '7', '2017-12-26 14:29:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('ea071eed62d34fb5ac781e9127c329c5', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('ea2b4339f74a4ed7bb4b14421d4b51ec', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-26 16:57:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=1&office.name=山东省总公司1', '');
INSERT INTO `sys_log` VALUES ('eadee0b112294ff39c50601b8f8e4638', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=17&office.name=历下区分公司', '');
INSERT INTO `sys_log` VALUES ('eafedec79be6425a81d7af5b375411ed', '1', '系统设置-机构用户-用户管理', '7', '2017-12-26 14:24:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('ec7d6b93f97e4dbf8788a29126738f7d', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:02:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('edbc6f250a44450286a8dc1645e94717', '1', '在线办公-个人办公-我的任务', '1', '2017-11-23 11:11:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ef463b3bbcd24cb285c2f9869e8d6c75', '1', '我的面板-个人信息-个人信息', '1', '2017-12-04 16:46:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('ef67339eea284d1eaea390a3e202caef', '1', '我的面板-个人信息-修改密码', '1', '2017-12-27 14:56:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('f01acd84d7244aeb99cd41dbe1b91962', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:24:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('f085be9fb8a443c5a4e2f48d829a8d64', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=2&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('f0b59ec79de245ecb222cb4633de8c47', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:23:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'POST', 'pageNo=1&pageSize=30&orderBy=name DESC&company.id=&company.name=&loginName=&office.id=13&office.name=公司领导&name=', '');
INSERT INTO `sys_log` VALUES ('f2746554f91a46c5ba69ad37152e6451', '1', '内容管理-内容管理-内容发布', '1', '2017-11-23 11:04:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('f3945f40988b4d719faaf3466f64212d', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 15:51:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=7&office.name=济南市分公司', '');
INSERT INTO `sys_log` VALUES ('f40f23b072ce43649fe681929b3a836c', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:52:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,', '');
INSERT INTO `sys_log` VALUES ('f4b80a21aa0b4dfca21d0d0681d47e1b', '1', '系统设置-系统设置-角色管理-修改', '7', '2017-12-26 14:49:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('f6355ab3e78249d080785006529b30ab', '1', '内容管理-内容管理', '1', '2017-12-27 15:30:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f64cb8b15f044081b2ffb1cdc5c72b6b', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 17:02:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f68752e4f8ce4f0594e611ae1e489541', '1', '我的面板-个人信息-个人信息', '1', '2017-12-06 14:46:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f6e100f0496a4bfdba0b196fe7055da8', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 15:23:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f75142228ced45219a379aaa69710cac', '1', '系统设置-机构用户-用户管理-查看', '7', '2017-12-25 16:59:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=9&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('f77615b6a3cc4eb3bc8ee94b73624720', '1', '我的面板-个人信息-修改密码', '1', '2017-11-22 10:24:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f86f2e87bcd6430497641e048241306a', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 18:00:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=19&office.name=综合部', '');
INSERT INTO `sys_log` VALUES ('f8a70866d0f240f585e235bfa92cb511', '1', '在线办公-流程管理-流程管理', '1', '2017-12-26 15:00:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('f8d08a4fec6148dcb1597a919bf26194', '1', '系统登录', '1', '2017-12-27 15:56:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f9258489b2654fb6a1a09471f818bcfd', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-12-27 11:23:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f99de7bf20784086ba7d2c928b3010a8', '1', '系统设置-系统设置-字典管理', '1', '2017-12-06 14:48:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'POST', 'pageNo=2&pageSize=30&type=&description=', '');
INSERT INTO `sys_log` VALUES ('f9b146f879b349f59a7f7df3b930aabb', '1', '我的面板-个人信息-个人信息', '1', '2017-11-22 10:24:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('fa66b35fc086496eb41dca3ea400ecb5', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-26 14:35:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('fa6e37fc41084bfba5557969405fc7a4', '1', '系统设置-机构用户-用户管理-查看', '1', '2017-11-22 10:49:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fa81cfa7788f4ef4a11f2c62bb93d5c2', '1', '系统设置-机构用户-机构管理-查看', '1', '2017-12-26 14:53:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=7&parentIds=0,1,7,', '');
INSERT INTO `sys_log` VALUES ('fba9db681f0047ca81ffe7db4e875071', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-06 14:47:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('fc27158e037c48a681f28ef021ff2f4c', '1', '在线办公-流程管理-流程管理', '1', '2017-11-22 10:40:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fc5f8c8d5430463186f4b47da81b3b66', '1', '系统设置-机构用户-机构管理-查看', '7', '2017-12-25 17:00:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('fc88bde541de4176a92431b6489ab2d4', '1', '系统设置-机构用户-用户管理', '1', '2017-12-27 14:54:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('fd8c410cc96a44269aa99742e07b659b', '1', '在线办公-流程管理-模型管理', '1', '2017-12-26 15:02:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fdbc3e6a45734a33b2d44562400b5863', '1', '在线办公-通知通告-通告管理', '1', '2017-11-22 10:39:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/oa/oaNotify', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fe1130486d9f4be990abc929f0efa4c7', '1', '系统设置-系统设置-字典管理', '1', '2017-12-06 14:48:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('fe4a80ae356545099ac05a71f1820741', '1', '系统设置-机构用户-区域管理', '1', '2017-11-23 11:02:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '/jeesite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('fe90b2d6a40246c6b761a05c9f31134d', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-12-26 14:58:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/assignrole', 'POST', 'id=16d3812d86834d61899d1bd8e7541279&idsArr=10,5,6,7,8,9', '');
INSERT INTO `sys_log` VALUES ('fed1e78523ee4acd934cc13ddcfc9bae', '1', '系统设置-系统设置-角色管理-查看', '1', '2017-12-26 14:57:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=2', '');
INSERT INTO `sys_log` VALUES ('ff134631788e4da6b256846c80d1242b', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-12-26 14:57:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '/jeesite/a/sys/role/save', 'POST', 'id=&office.id=2&office.name=公司领导&oldName=&name=测试角色&oldEnname=&enname=test&roleType=assignment&sysData=1&useable=1&dataScope=5&menuIds=&officeIds=&remarks=', '');

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', '', 'th-list', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', '', '', '', '0', 'sys:dict:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', '', '', '', '0', 'sys:dict:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', '', 'th', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', '', '', '', '0', 'sys:area:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', '', '', '', '0', 'sys:area:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', '', 'th-large', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', '', '', '', '0', 'sys:office:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', '', '', '', '0', 'sys:office:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', '', 'user', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', '', '', '', '0', 'sys:user:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', '', '', '', '0', 'sys:user:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', '', '', '', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', '', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', '', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', '', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', '', 'user', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', '', 'lock', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', '', 'align-justify', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', '', '', '', '0', 'cms:category:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', '', '', '', '0', 'cms:category:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', '', 'certificate', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', '', '', '', '0', 'cms:site:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', '', '', '', '0', 'cms:site:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', '', 'retweet', '1', 'cms:site:select', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', '', 'list-alt', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', '', '', '', '1', 'cms:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', '', 'briefcase', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', '', 'file', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', '', '', '', '0', 'cms:article:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', '', '', '', '0', 'cms:article:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', '', '', '', '0', 'cms:article:audit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', '', 'random', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', '', '', '', '0', 'cms:link:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', '', '', '', '0', 'cms:link:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', '', '', '', '0', 'cms:link:audit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', '', '', '', '0', 'sys:menu:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', '', 'comment', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', '', '', '', '0', 'cms:comment:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', '', '', '', '0', 'cms:comment:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', '', 'glass', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', '', '', '', '0', 'cms:guestbook:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', '', '', '', '0', 'cms:guestbook:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', '', 'folder-open', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', '', '', '', '0', 'cms:ckfinder:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', '', '', '', '0', 'cms:ckfinder:upload', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', '', '', '', '0', 'cms:ckfinder:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', '', '', '', '0', 'sys:menu:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', '', 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', '', 'leaf', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', '', '', '', '0', 'oa:leave:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', '', '', '', '0', 'oa:leave:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', '', '', '', '1', '', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', '', 'pencil', '1', 'sys:log:view', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', '', 'lock', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', '', 'road', '1', 'act:process:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', '', '', '', '1', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', '', 'road', '1', 'act:model:edit', '1', '2013-09-20 00:00:00', '1', '2013-09-20 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', '', 'tasks', '1', '', '1', '2013-09-24 00:00:00', '1', '2013-09-24 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', '', '', '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 00:00:00', '1', '2013-09-24 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', '', '', '', '1', '', '1', '2013-10-08 00:00:00', '1', '2013-10-08 00:00:00', '', '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', '', '', '', '1', '', '1', '2013-10-16 00:00:00', '1', '2013-10-16 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', '', '', '', '0', 'sys:role:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', '', '', '', '1', '', '1', '2013-10-16 00:00:00', '1', '2013-10-16 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', '', '', '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 00:00:00', '1', '2013-10-16 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', '', '', '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 00:00:00', '1', '2013-10-16 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', '', '', '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 00:00:00', '1', '2013-10-16 00:00:00', '', '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', '', '', '1', '', '1', '2013-10-18 00:00:00', '1', '2013-10-18 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', '', '', '1', '', '1', '2013-10-22 00:00:00', '1', '2013-10-22 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', '', '', '', '1', '', '1', '2013-10-22 00:00:00', '1', '2013-10-22 00:00:00', '', '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/form', '', '', '1', 'test:test:view,test:test:edit', '1', '2013-10-22 00:00:00', '1', '2013-10-22 00:00:00', '', '1');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', '', '', '', '0', 'sys:role:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 00:00:00', '1', '2013-11-08 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '机构编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '山东省总公司', '10', '2', '100000', '1', '1', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2017-12-26 14:51:58', '', '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '3', '200003', '2', '2', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '3', '200004', '2', '2', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '历城区分公司', '0', '4', '201000', '1', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '4', '201001', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '4', '201002', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '4', '201003', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '4', '201004', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('17', '7', '0,1,7,', '历下区分公司', '40', '5', '201010', '1', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,17,', '公司领导', '10', '5', '201011', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,17,', '综合部', '20', '5', '201012', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,17,', '市场部', '30', '5', '201013', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,17,', '技术部', '40', '5', '201014', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('22', '7', '0,1,7,', '高新区分公司', '50', '6', '201010', '1', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,22,', '公司领导', '10', '6', '201011', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,22,', '综合部', '20', '6', '201012', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,22,', '市场部', '30', '6', '201013', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,22,', '技术部', '40', '6', '201014', '2', '3', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '济南市分公司', '20', '3', '200000', '1', '2', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '3', '200001', '2', '2', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '3', '200002', '2', '2', '', '', '', '', '', '', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', 'dept', 'assignment', '1', null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('16d3812d86834d61899d1bd8e7541279', '2', '测试角色', 'test', 'assignment', '5', '1', '1', '1', '2017-12-26 14:57:02', '1', '2017-12-26 14:57:02', '', '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', 'hr', 'assignment', '2', null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('4fa3b5cc93be4cb3a4478b004271d1ef', '2', '的说法', 'sdaasas', 'assignment', '8', '1', '1', '1', '2017-12-26 16:28:00', '1', '2017-12-26 16:28:00', '', '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', 'd', 'assignment', '8', null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('7', '7', '济南市管理员', 'e', 'assignment', '9', null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('ada56c8011424f7781f1a9b6903edbee', '2', 'ewer', 'erwer', 'assignment', '8', '1', '1', '1', '2017-12-26 16:30:17', '1', '2017-12-26 16:30:17', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '75');
INSERT INTO `sys_role_menu` VALUES ('1', '76');
INSERT INTO `sys_role_menu` VALUES ('1', '77');
INSERT INTO `sys_role_menu` VALUES ('1', '78');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '80');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '83');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '85');
INSERT INTO `sys_role_menu` VALUES ('1', '86');
INSERT INTO `sys_role_menu` VALUES ('1', '87');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '72');
INSERT INTO `sys_role_menu` VALUES ('2', '73');
INSERT INTO `sys_role_menu` VALUES ('2', '74');
INSERT INTO `sys_role_menu` VALUES ('2', '75');
INSERT INTO `sys_role_menu` VALUES ('2', '76');
INSERT INTO `sys_role_menu` VALUES ('2', '77');
INSERT INTO `sys_role_menu` VALUES ('2', '78');
INSERT INTO `sys_role_menu` VALUES ('2', '79');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '80');
INSERT INTO `sys_role_menu` VALUES ('2', '81');
INSERT INTO `sys_role_menu` VALUES ('2', '82');
INSERT INTO `sys_role_menu` VALUES ('2', '83');
INSERT INTO `sys_role_menu` VALUES ('2', '84');
INSERT INTO `sys_role_menu` VALUES ('2', '85');
INSERT INTO `sys_role_menu` VALUES ('2', '86');
INSERT INTO `sys_role_menu` VALUES ('2', '87');
INSERT INTO `sys_role_menu` VALUES ('2', '88');
INSERT INTO `sys_role_menu` VALUES ('2', '89');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '90');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '25');
INSERT INTO `sys_role_menu` VALUES ('3', '26');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('3', '72');
INSERT INTO `sys_role_menu` VALUES ('3', '73');
INSERT INTO `sys_role_menu` VALUES ('3', '74');
INSERT INTO `sys_role_menu` VALUES ('3', '75');
INSERT INTO `sys_role_menu` VALUES ('3', '76');
INSERT INTO `sys_role_menu` VALUES ('3', '77');
INSERT INTO `sys_role_menu` VALUES ('3', '78');
INSERT INTO `sys_role_menu` VALUES ('3', '79');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '80');
INSERT INTO `sys_role_menu` VALUES ('3', '81');
INSERT INTO `sys_role_menu` VALUES ('3', '82');
INSERT INTO `sys_role_menu` VALUES ('3', '83');
INSERT INTO `sys_role_menu` VALUES ('3', '84');
INSERT INTO `sys_role_menu` VALUES ('3', '85');
INSERT INTO `sys_role_menu` VALUES ('3', '86');
INSERT INTO `sys_role_menu` VALUES ('3', '87');
INSERT INTO `sys_role_menu` VALUES ('3', '88');
INSERT INTO `sys_role_menu` VALUES ('3', '89');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '90');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `sex` enum('男','女') NOT NULL,
  `birth` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'thinkgem', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', '男', '2017-12-29 14:46:13', 'thinkgem@163.com', '8675', '8675', '', null, '0:0:0:0:0:0:0:1', '2017-12-28 10:19:46', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', '男', '2017-12-23 14:46:14', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2017-12-26 14:58:03', '', '0');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2017-12-26 14:58:03', '', '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2017-12-26 14:58:03', '', '0');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', '男', '2017-12-29 14:46:13', '', '', '', '', null, '0:0:0:0:0:0:0:1', '2017-12-26 14:48:52', '1', '1', '2013-05-27 00:00:00', '1', '2017-12-26 14:58:03', '', '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2017-12-26 14:58:03', '', '0');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', '男', '2017-12-29 14:46:13', '', '', '', '', null, null, null, '1', '1', '2013-05-27 00:00:00', '1', '2017-12-26 14:58:03', '', '0');
INSERT INTO `sys_user` VALUES ('f897e35783b34480a4979290af8f19b9', '1', '13', 'fsgfdg', '8911d67c7c47b5652c3dc21326ebbe28d6288f55af3ad7da8798a234', '345', 'fgsdgsd', '男', '2017-12-29 14:46:13', '', '', '', '', '', null, null, '1', '1', '2017-12-27 11:24:32', '1', '2017-12-27 11:24:32', '', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('10', '16d3812d86834d61899d1bd8e7541279');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('5', '16d3812d86834d61899d1bd8e7541279');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '16d3812d86834d61899d1bd8e7541279');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('7', '16d3812d86834d61899d1bd8e7541279');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('8', '16d3812d86834d61899d1bd8e7541279');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('9', '1');
INSERT INTO `sys_user_role` VALUES ('9', '16d3812d86834d61899d1bd8e7541279');
INSERT INTO `sys_user_role` VALUES ('f897e35783b34480a4979290af8f19b9', '2');
