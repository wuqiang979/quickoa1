/*
Navicat MySQL Data Transfer

Source Server         : quickoa
Source Server Version : 50540
Source Host           : 192.168.0.129:3306
Source Database       : quickoa

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-02-05 11:53:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s_admin_auth`
-- ----------------------------
DROP TABLE IF EXISTS `s_admin_auth`;
CREATE TABLE `s_admin_auth` (
  `auth_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(20) NOT NULL COMMENT '名称',
  `auth_pid` smallint(6) unsigned NOT NULL COMMENT '父id',
  `auth_c` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器',
  `auth_a` varchar(32) NOT NULL DEFAULT '' COMMENT '操作方法',
  `auth_path` varchar(32) NOT NULL COMMENT '全路径',
  `auth_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别',
  `sort` tinyint(4) NOT NULL DEFAULT '100' COMMENT '排序使用',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_admin_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `s_admin_category`
-- ----------------------------
DROP TABLE IF EXISTS `s_admin_category`;
CREATE TABLE `s_admin_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cate_name` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分类，0表示项目分类',
  `alias` varchar(20) NOT NULL DEFAULT '' COMMENT '别名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分类列表';

-- ----------------------------
-- Records of s_admin_category
-- ----------------------------
INSERT INTO `s_admin_category` VALUES ('1', '', '0', '0', '0', '');

-- ----------------------------
-- Table structure for `s_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `s_admin_role`;
CREATE TABLE `s_admin_role` (
  `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_auth_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '权限ids,1,2,5',
  `role_auth_ac` text COMMENT '模块-操作',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_admin_role
-- ----------------------------
INSERT INTO `s_admin_role` VALUES ('1', '初级员工', '', null);
INSERT INTO `s_admin_role` VALUES ('2', '超级管理员', '', '');
INSERT INTO `s_admin_role` VALUES ('3', '主管', '100,103,104', 'Goods-showList,Goods-add');
INSERT INTO `s_admin_role` VALUES ('4', '经理', '100,103,101,106,107,113,114', 'Goods-showList,Order-select,Order-showList,Member-showList');

-- ----------------------------
-- Table structure for `s_admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `s_admin_users`;
CREATE TABLE `s_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(6) NOT NULL DEFAULT '' COMMENT '盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最近登录时间',
  `last_ip` int(11) NOT NULL DEFAULT '0' COMMENT '最近登录ip',
  `register_login` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `register_ip` int(11) NOT NULL DEFAULT '0' COMMENT '注册ip',
  `role_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '角色id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态，1正常,0待审核，-1禁止',
  `usernum` char(7) NOT NULL DEFAULT '0' COMMENT '员工编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of s_admin_users
-- ----------------------------
INSERT INTO `s_admin_users` VALUES ('603', 'admin', '3f392989b8ee6d431c48415a050343c4', 'JM6xtY', '1486266397', '0', '1482395477', '2130706433', '32', '1', 'WM00603');
INSERT INTO `s_admin_users` VALUES ('609', '王麻子', 'dcba86830ef050fd118f8771a0886bac', 'S8Qkf8', '0', '0', '1482396138', '2130706433', '0', '0', 'WM00609');
INSERT INTO `s_admin_users` VALUES ('610', '李四', '6d3668eeb81922c1ebc9713c2281ca2e', 'd88zfP', '0', '0', '1482396159', '2130706433', '0', '1', 'WM00610');
INSERT INTO `s_admin_users` VALUES ('615', '曹操', 'e60fcd1ce0d82a23e9d918f1e52e06fe', 'uaz0P3', '1484186414', '2130706433', '1482396276', '2130706433', '0', '1', 'WM00615');
INSERT INTO `s_admin_users` VALUES ('616', '孙权', '9ce0e18fb96f73da9044033aa34f9621', 'Ep1nb4', '0', '0', '1482396290', '2130706433', '0', '1', 'WM00616');
INSERT INTO `s_admin_users` VALUES ('632', 'systest', '07c6c4719a15ce3b1c89b422189343f5', 'I1jdvf', '1484818881', '0', '1484114937', '0', '40', '1', 'WM00632');

-- ----------------------------
-- Table structure for `u_authority_list`
-- ----------------------------
DROP TABLE IF EXISTS `u_authority_list`;
CREATE TABLE `u_authority_list` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '权限名称',
  `action` varchar(255) NOT NULL COMMENT '权限检查名',
  `sorder` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL COMMENT '组id',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_authority_list
-- ----------------------------
INSERT INTO `u_authority_list` VALUES ('7', '幼儿请假', '', '0', '48');
INSERT INTO `u_authority_list` VALUES ('8', '收费登记', '', '0', '33');
INSERT INTO `u_authority_list` VALUES ('18', '用户管理栏目查看', '用户管理show', '99', '32');
INSERT INTO `u_authority_list` VALUES ('19', '财务管理栏目查看', '财务管理show', '99', '33');
INSERT INTO `u_authority_list` VALUES ('21', '幼儿管理栏目查看', '幼儿管理show', '99', '40');
INSERT INTO `u_authority_list` VALUES ('22', '家校互联栏目查看', '家校互联show', '99', '43');
INSERT INTO `u_authority_list` VALUES ('23', '集团管理栏目查看', '集团管理show', '99', '44');
INSERT INTO `u_authority_list` VALUES ('25', '饮食管理栏目查看', '饮食管理show', '99', '42');
INSERT INTO `u_authority_list` VALUES ('26', '家园互通栏目查看', '家园互通show', '99', '45');
INSERT INTO `u_authority_list` VALUES ('28', '卫生保健栏目查看', '卫生保健show', '99', '46');
INSERT INTO `u_authority_list` VALUES ('29', '办公管理栏目查看', '办公管理show', '99', '47');
INSERT INTO `u_authority_list` VALUES ('30', '教务教学栏目查看', '教务教学show', '99', '48');
INSERT INTO `u_authority_list` VALUES ('31', '办公管理栏目查看', '办公管理show', '99', '41');
INSERT INTO `u_authority_list` VALUES ('32', '通知公告', 'main/Office/notice', '0', '41');

-- ----------------------------
-- Table structure for `u_authority_set`
-- ----------------------------
DROP TABLE IF EXISTS `u_authority_set`;
CREATE TABLE `u_authority_set` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '部门名称',
  `status` int(255) NOT NULL,
  `des` varchar(255) NOT NULL COMMENT '描述',
  `sorder` int(10) unsigned NOT NULL COMMENT '排序',
  `psid` int(10) unsigned NOT NULL COMMENT '父级id',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_authority_set
-- ----------------------------
INSERT INTO `u_authority_set` VALUES ('1', '根节点', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('32', '用户管理', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('33', '财务管理', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('34', '系统配置', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('40', '幼儿管理', '0', '幼儿管理', '0', '0');
INSERT INTO `u_authority_set` VALUES ('41', '办公管理', '0', '办公管理', '0', '0');
INSERT INTO `u_authority_set` VALUES ('42', '饮食管理', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('43', '家校互联', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('44', '集团管理', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('45', '家园互通', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('46', '卫生保健', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('47', '办公管理', '0', '', '0', '0');
INSERT INTO `u_authority_set` VALUES ('48', '教务教学', '0', '', '0', '0');

-- ----------------------------
-- Table structure for `u_department`
-- ----------------------------
DROP TABLE IF EXISTS `u_department`;
CREATE TABLE `u_department` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `d_name` varchar(30) NOT NULL COMMENT '部门名称',
  `d_number` varchar(6) NOT NULL COMMENT '部门编号',
  `d_address` varchar(50) NOT NULL COMMENT '部门地址',
  `pid` int(10) unsigned NOT NULL COMMENT '父级id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of u_department
-- ----------------------------
INSERT INTO `u_department` VALUES ('32', '小小科技的大', '2', '重庆市', '0');
INSERT INTO `u_department` VALUES ('33', '大大科技', '3', '成都省', '0');
INSERT INTO `u_department` VALUES ('35', '两江会', '10', '大成都省', '0');

-- ----------------------------
-- Table structure for `u_department_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `u_department_jobs`;
CREATE TABLE `u_department_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `j_name` varchar(255) NOT NULL COMMENT '职务名称',
  `j_did` varchar(255) NOT NULL COMMENT '所在部门',
  `i_id` int(10) NOT NULL COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='职务表';

-- ----------------------------
-- Records of u_department_jobs
-- ----------------------------
INSERT INTO `u_department_jobs` VALUES ('1', '主管', '32', '1');
INSERT INTO `u_department_jobs` VALUES ('2', '运营', '33', '2');
INSERT INTO `u_department_jobs` VALUES ('3', '客服', '32', '3');
INSERT INTO `u_department_jobs` VALUES ('4', '技术员', '32', '3');
INSERT INTO `u_department_jobs` VALUES ('6', '会计', '33', '1');
INSERT INTO `u_department_jobs` VALUES ('69', '多多', '35', '3');

-- ----------------------------
-- Table structure for `u_git_users`
-- ----------------------------
DROP TABLE IF EXISTS `u_git_users`;
CREATE TABLE `u_git_users` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `g_id` int(30) NOT NULL COMMENT '仓库id',
  `u_id` int(30) NOT NULL COMMENT '仓库用户id',
  `pullaccount` varchar(255) NOT NULL COMMENT '拉取账号',
  `pullpwd` varchar(255) NOT NULL COMMENT '拉取密码',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0 不可用 1可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_git_users
-- ----------------------------
INSERT INTO `u_git_users` VALUES ('1', '1', '71', '1', '1', '1');
INSERT INTO `u_git_users` VALUES ('2', '1', '72', '1', '1', '1');
INSERT INTO `u_git_users` VALUES ('3', '1', '73', '1', '1', '1');

-- ----------------------------
-- Table structure for `u_item_comission`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_comission`;
CREATE TABLE `u_item_comission` (
  `id` int(90) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `i_id` int(30) NOT NULL COMMENT '项目的id 项目名称',
  `type` int(3) NOT NULL COMMENT '类别 提成对象 职务',
  `percent` float(4,2) NOT NULL COMMENT '所占百分比',
  `keep` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效，0，无效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='提成规则表';

-- ----------------------------
-- Records of u_item_comission
-- ----------------------------
INSERT INTO `u_item_comission` VALUES ('1', '19', '7', '12.00', '0');
INSERT INTO `u_item_comission` VALUES ('2', '19', '8', '32.00', '0');
INSERT INTO `u_item_comission` VALUES ('3', '19', '8', '25.00', '0');
INSERT INTO `u_item_comission` VALUES ('4', '19', '8', '24.00', '1');
INSERT INTO `u_item_comission` VALUES ('17', '30', '58', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('15', '30', '10', '50.00', '1');
INSERT INTO `u_item_comission` VALUES ('7', '19', '9', '50.00', '1');
INSERT INTO `u_item_comission` VALUES ('8', '19', '7', '30.00', '1');
INSERT INTO `u_item_comission` VALUES ('16', '30', '59', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('10', '26', '9', '20.00', '1');
INSERT INTO `u_item_comission` VALUES ('11', '19', '10', '5.00', '1');
INSERT INTO `u_item_comission` VALUES ('12', '27', '8', '5.00', '1');
INSERT INTO `u_item_comission` VALUES ('13', '26', '32', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('14', '19', '11', '21.00', '0');
INSERT INTO `u_item_comission` VALUES ('18', '19', '57', '12.00', '1');
INSERT INTO `u_item_comission` VALUES ('19', '7', '8', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('20', '7', '7', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('21', '47', '66', '1.00', '1');
INSERT INTO `u_item_comission` VALUES ('22', '58', '66', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('23', '58', '64', '0.00', '0');
INSERT INTO `u_item_comission` VALUES ('24', '57', '8', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('25', '49', '8', '0.00', '1');
INSERT INTO `u_item_comission` VALUES ('26', '35', '66', '1.00', '1');
INSERT INTO `u_item_comission` VALUES ('27', '61', '66', '2.00', '1');
INSERT INTO `u_item_comission` VALUES ('28', '62', '66', '0.00', '1');

-- ----------------------------
-- Table structure for `u_item_develop_log`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_develop_log`;
CREATE TABLE `u_item_develop_log` (
  `id` int(90) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `i_id` int(30) NOT NULL COMMENT '项目id',
  `u_id` int(30) NOT NULL COMMENT '操作人员id',
  `content` varchar(255) NOT NULL COMMENT '内容 ',
  `type` int(3) NOT NULL COMMENT '动作类别，如项目概述，留言，项目变更  item_develop_type 表',
  `Date` datetime NOT NULL COMMENT '日期',
  `url` varchar(255) NOT NULL COMMENT '跳转url',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=360 DEFAULT CHARSET=utf8 COMMENT='进度表';

-- ----------------------------
-- Records of u_item_develop_log
-- ----------------------------
INSERT INTO `u_item_develop_log` VALUES ('1', '19', '19', '添加队员:张三,并分配任务：zzzz', '3', '2016-06-15 18:22:50', '');
INSERT INTO `u_item_develop_log` VALUES ('2', '19', '19', '添加队员:lily,并分配任务：lllll', '3', '2016-06-15 18:22:50', '');
INSERT INTO `u_item_develop_log` VALUES ('3', '19', '19', '添加职位:前端,提成比例是：12%', '5', '2016-06-15 18:22:50', '');
INSERT INTO `u_item_develop_log` VALUES ('4', '19', '19', '添加队员:lily,并分配任务：llii', '3', '2016-06-15 18:25:08', '');
INSERT INTO `u_item_develop_log` VALUES ('5', '19', '19', '添加队员:zz,并分配任务：zzyy', '3', '2016-06-15 18:25:08', '');
INSERT INTO `u_item_develop_log` VALUES ('6', '19', '19', '添加职位:后端,提成比例是：32%', '5', '2016-06-15 18:25:08', '');
INSERT INTO `u_item_develop_log` VALUES ('7', '19', '19', '本项目删除【后端】职务。', '5', '2016-06-15 18:28:55', '');
INSERT INTO `u_item_develop_log` VALUES ('8', '19', '19', '删除队员:lily', '3', '2016-06-15 18:28:55', '');
INSERT INTO `u_item_develop_log` VALUES ('9', '19', '19', '删除队员:zz', '3', '2016-06-15 18:28:55', '');
INSERT INTO `u_item_develop_log` VALUES ('10', '19', '19', '添加队员:lily,并分配任务：llii', '3', '2016-06-15 18:30:20', '');
INSERT INTO `u_item_develop_log` VALUES ('11', '19', '19', '添加队员:zz,并分配任务：zaza', '3', '2016-06-15 18:30:20', '');
INSERT INTO `u_item_develop_log` VALUES ('12', '19', '19', '添加职位:后端,提成比例是：25%', '5', '2016-06-15 18:30:20', '');
INSERT INTO `u_item_develop_log` VALUES ('13', '19', '19', '本项目删除【后端】职务。', '5', '2016-06-15 18:36:04', '');
INSERT INTO `u_item_develop_log` VALUES ('14', '19', '19', '删除队员:lily', '3', '2016-06-15 18:36:04', '');
INSERT INTO `u_item_develop_log` VALUES ('15', '19', '19', '删除队员:zz', '3', '2016-06-15 18:36:04', '');
INSERT INTO `u_item_develop_log` VALUES ('16', '19', '19', '添加队员:lily,并分配任务：lili', '3', '2016-06-15 18:38:24', '');
INSERT INTO `u_item_develop_log` VALUES ('17', '19', '19', '添加队员:zz,并分配任务：zaza', '3', '2016-06-15 18:38:24', '');
INSERT INTO `u_item_develop_log` VALUES ('18', '19', '19', '添加职位:后端,提成比例是：4%', '5', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('19', '19', '19', '【2-8】\"提成比例\"发生变化,由3.00变成3。\\n', '4', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('20', '19', '19', '【12-8】\"提成比例\"发生变化,由3.00变成3。\\n', '4', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('21', '19', '19', '添加队员:lily,并分配任务：lili', '3', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('22', '19', '19', '添加队员:zz,并分配任务：zaza', '3', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('23', '19', '19', '添加职位:后端,提成比例是：4%', '5', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('24', '19', '19', '添加队员:seven,并分配任务：sasa', '3', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('25', '19', '19', '添加职位:设计,提成比例是：8%', '5', '2016-06-15 18:38:25', '');
INSERT INTO `u_item_develop_log` VALUES ('26', '19', '19', '删除队员:张三', '3', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('27', '19', '19', '添加队员:yy,并分配任务：ytyt', '3', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('28', '19', '19', '删除队员:zz', '3', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('29', '19', '19', '删除队员:lily', '3', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('30', '19', '19', '【2-8】\"提成比例\"发生变化,由3.00变成3。\\n', '4', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('31', '19', '19', '【12-8】\"提成比例\"发生变化,由3.00变成3。\\n', '4', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('32', '19', '19', '本项目删除【设计】职务。', '5', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('33', '19', '19', '删除队员:seven', '3', '2016-06-15 18:47:30', '');
INSERT INTO `u_item_develop_log` VALUES ('34', '9', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-15 20:52:18', '');
INSERT INTO `u_item_develop_log` VALUES ('35', '9', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-15 20:55:50', '');
INSERT INTO `u_item_develop_log` VALUES ('36', '9', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-15 20:57:13', '');
INSERT INTO `u_item_develop_log` VALUES ('37', '19', '19', '项目名称变化,由测试项目变成测试项目1。\\n', '2', '2016-06-16 10:12:08', '');
INSERT INTO `u_item_develop_log` VALUES ('38', '19', '19', '项目名称变化,由测试项目1变成测试项目fff。\\n项目状态变化,由5变成4。\\n开发周期变化,由3m变成5w。\\n', '2', '2016-06-16 02:21:09', '');
INSERT INTO `u_item_develop_log` VALUES ('39', '19', '19', '添加队员:kk,并分配任务：fsdfdssdfsddfsd', '3', '2016-06-16 02:23:57', '');
INSERT INTO `u_item_develop_log` VALUES ('40', '19', '19', '添加队员:seven,并分配任务：fsfsdfsdfds', '3', '2016-06-16 02:23:57', '');
INSERT INTO `u_item_develop_log` VALUES ('41', '19', '19', '添加职位:设计,提成比例是：50%', '5', '2016-06-16 02:23:57', '');
INSERT INTO `u_item_develop_log` VALUES ('42', '19', '19', '本项目删除【前端】职务。', '5', '2016-06-16 02:24:56', '');
INSERT INTO `u_item_develop_log` VALUES ('43', '19', '19', '删除队员:lily', '3', '2016-06-16 02:24:56', '');
INSERT INTO `u_item_develop_log` VALUES ('44', '19', '19', '删除项目<b>测试项目fff</b>成功!', '2', '2016-06-16 02:32:02', '');
INSERT INTO `u_item_develop_log` VALUES ('45', '17', '19', '删除项目<b>er</b>成功!', '2', '2016-06-16 02:32:13', '');
INSERT INTO `u_item_develop_log` VALUES ('46', '19', '19', '项目状态变化,由4变成5。\\n开发周期变化,由5w变成5期。\\n', '2', '2016-06-16 02:35:11', '');
INSERT INTO `u_item_develop_log` VALUES ('47', '19', '19', '项目名称变化,由测试项目fff变成测试项目fffd。\\n', '2', '2016-06-16 02:37:54', '');
INSERT INTO `u_item_develop_log` VALUES ('48', '19', '19', '开发周期变化,由5期变成5w。\\n', '2', '2016-06-16 10:46:07', '');
INSERT INTO `u_item_develop_log` VALUES ('49', '19', '19', '开发周期变化,由5w变成5期。\\n', '2', '2016-06-16 02:55:04', '');
INSERT INTO `u_item_develop_log` VALUES ('50', '19', '19', '开发周期变化,由5期变成51期。\\n', '2', '2016-06-16 02:55:33', '');
INSERT INTO `u_item_develop_log` VALUES ('51', '19', '19', '开发周期变化,由51期变成20期。\\n', '2', '2016-06-16 02:56:16', '');
INSERT INTO `u_item_develop_log` VALUES ('52', '19', '19', '开发周期变化,由2w变成2d。\\n', '2', '2016-06-16 11:14:25', '');
INSERT INTO `u_item_develop_log` VALUES ('53', '19', '19', '开发周期变化,由2d变成2w。\\n', '2', '2016-06-16 11:14:38', '');
INSERT INTO `u_item_develop_log` VALUES ('54', '19', '19', '项目名称变化,由测试项目fffd变成测试项目fffdf。\\n', '2', '2016-06-16 03:22:09', '');
INSERT INTO `u_item_develop_log` VALUES ('55', '19', '19', '项目名称变化,由测试项目fffdf变成测试项目fffu。\\n', '2', '2016-06-16 03:30:19', '');
INSERT INTO `u_item_develop_log` VALUES ('56', '19', '19', '项目名称变化,由测试项目fffu变成测试项目。\\n开发周期变化,由2w变成22。\\n', '2', '2016-06-16 03:30:34', '');
INSERT INTO `u_item_develop_log` VALUES ('57', '19', '19', '开发周期变化,由22变成22w。\\n', '2', '2016-06-16 11:36:34', '');
INSERT INTO `u_item_develop_log` VALUES ('58', '19', '19', '开发周期变化,由22w变成22m。\\n', '2', '2016-06-16 11:36:48', '');
INSERT INTO `u_item_develop_log` VALUES ('59', '19', '19', '开发周期变化,由22m变成22d。\\n', '2', '2016-06-16 11:37:20', '');
INSERT INTO `u_item_develop_log` VALUES ('60', '19', '19', '添加队员:张三,并分配任务：fdsfsd', '3', '2016-06-16 03:38:08', '');
INSERT INTO `u_item_develop_log` VALUES ('61', '19', '19', '添加队员:lily,并分配任务：fsdfsdfsdf', '3', '2016-06-16 03:38:08', '');
INSERT INTO `u_item_develop_log` VALUES ('62', '19', '19', '添加队员:kk,并分配任务：', '3', '2016-06-16 03:38:08', '');
INSERT INTO `u_item_develop_log` VALUES ('63', '19', '19', '添加职位:前端,提成比例是：50%', '5', '2016-06-16 03:38:08', '');
INSERT INTO `u_item_develop_log` VALUES ('64', '21', '19', '发布项目<b>测试项目1</b>成功!', '1', '2016-06-16 07:23:16', '');
INSERT INTO `u_item_develop_log` VALUES ('65', '22', '19', '发布项目<b>测试项目2</b>成功!', '1', '2016-06-16 07:27:41', '');
INSERT INTO `u_item_develop_log` VALUES ('66', '23', '19', '发布项目<b>测试项目3</b>成功!', '1', '2016-06-16 07:44:32', '');
INSERT INTO `u_item_develop_log` VALUES ('67', '24', '19', '发布项目<b>测试项目3</b>成功!', '1', '2016-06-16 07:48:57', '');
INSERT INTO `u_item_develop_log` VALUES ('68', '25', '19', '发布项目<b>cs</b>成功!', '1', '2016-06-16 16:10:43', '');
INSERT INTO `u_item_develop_log` VALUES ('69', '1', '19', '删除项目<b>kk</b>成功!', '2', '2016-06-16 18:24:54', '');
INSERT INTO `u_item_develop_log` VALUES ('70', '1', '19', '删除项目<b>kk</b>成功!', '2', '2016-06-16 18:26:03', '');
INSERT INTO `u_item_develop_log` VALUES ('71', '2', '19', '删除项目<b>22</b>成功!', '2', '2016-06-16 18:26:03', '');
INSERT INTO `u_item_develop_log` VALUES ('72', '1', '19', '恢复项目<b>kk</b>成功!', '2', '2016-06-16 18:35:11', '');
INSERT INTO `u_item_develop_log` VALUES ('73', '2', '19', '恢复项目<b>22</b>成功!', '2', '2016-06-16 18:35:11', '');
INSERT INTO `u_item_develop_log` VALUES ('74', '13', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-17 14:59:24', '');
INSERT INTO `u_item_develop_log` VALUES ('75', '16', '19', '删除项目<b>WS</b>成功!', '2', '2016-06-17 15:00:23', '');
INSERT INTO `u_item_develop_log` VALUES ('76', '18', '19', '删除项目<b>uuu</b>成功!', '2', '2016-06-17 15:00:23', '');
INSERT INTO `u_item_develop_log` VALUES ('77', '19', '19', '本项目删除【设计】职务。', '5', '2016-06-17 07:21:00', '');
INSERT INTO `u_item_develop_log` VALUES ('78', '19', '19', '删除队员:kk', '3', '2016-06-17 07:21:00', '');
INSERT INTO `u_item_develop_log` VALUES ('79', '19', '19', '删除队员:seven', '3', '2016-06-17 07:21:00', '');
INSERT INTO `u_item_develop_log` VALUES ('80', '25', '19', '删除项目<b>cs</b>成功!', '2', '2016-06-17 15:53:36', '');
INSERT INTO `u_item_develop_log` VALUES ('81', '19', '19', '开发周期变化,由22d变成26d。\\n', '2', '2016-06-18 16:01:52', '');
INSERT INTO `u_item_develop_log` VALUES ('82', '24', '19', '删除项目<b>测试项目4</b>成功!', '2', '2016-06-20 19:17:15', '');
INSERT INTO `u_item_develop_log` VALUES ('83', '24', '19', '恢复项目<b>测试项目4</b>成功!', '2', '2016-06-20 19:26:36', '');
INSERT INTO `u_item_develop_log` VALUES ('84', '25', '19', '恢复项目<b>cs</b>成功!', '2', '2016-06-20 19:26:54', '');
INSERT INTO `u_item_develop_log` VALUES ('85', '20', '19', '恢复项目<b>ert</b>成功!', '2', '2016-06-20 19:26:54', '');
INSERT INTO `u_item_develop_log` VALUES ('86', '25', '19', '删除项目<b>cs</b>成功!', '2', '2016-06-20 19:27:40', '');
INSERT INTO `u_item_develop_log` VALUES ('87', '20', '19', '删除项目<b>ert</b>成功!', '2', '2016-06-20 19:27:40', '');
INSERT INTO `u_item_develop_log` VALUES ('88', '26', '19', '发布项目<b>测试项目n</b>成功!', '1', '2016-06-21 11:41:47', '');
INSERT INTO `u_item_develop_log` VALUES ('89', '26', '19', '开发周期变化,由27d变成20d。\\n', '2', '2016-06-21 11:48:24', '');
INSERT INTO `u_item_develop_log` VALUES ('90', '19', '19', '项目名称变化,由测试项目变成测试项目f。\\n', '2', '2016-06-22 07:06:59', '');
INSERT INTO `u_item_develop_log` VALUES ('91', '19', '19', '项目需求变化,由三季度四季度经济的角度变成三季度四季度经济的角度fdsfsdf。\\n', '2', '2016-06-22 07:20:15', '');
INSERT INTO `u_item_develop_log` VALUES ('92', '19', '19', '金额变化,由121212变成1212121。\\n', '2', '2016-06-22 07:20:50', '');
INSERT INTO `u_item_develop_log` VALUES ('93', '26', '19', '添加队员:kk,并分配任务：', '3', '2016-06-22 15:25:08', '');
INSERT INTO `u_item_develop_log` VALUES ('94', '26', '19', '添加职位:前端,提成比例是：20%', '5', '2016-06-22 15:25:08', '');
INSERT INTO `u_item_develop_log` VALUES ('95', '26', '19', '添加队员:kk,并分配任务：sdsdfd', '3', '2016-06-22 15:26:11', '');
INSERT INTO `u_item_develop_log` VALUES ('96', '26', '19', '添加职位:设计,提成比例是：20%', '5', '2016-06-22 15:26:11', '');
INSERT INTO `u_item_develop_log` VALUES ('97', '26', '19', '【3-7】\"提成比例\"发生变化,由12.00变成12。\\n【3-7】\"具体任务\"发生变化,由变成rgtdfhbgdfgv。\\n', '4', '2016-06-22 15:26:32', '');
INSERT INTO `u_item_develop_log` VALUES ('98', '19', '19', '开发周期变化,由26d变成26m。\\n', '2', '2016-06-22 08:06:02', '');
INSERT INTO `u_item_develop_log` VALUES ('99', '10', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('100', '9', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('101', '8', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('102', '12', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('103', '11', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('104', '13', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('105', '14', '19', '恢复项目<b>WS</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('106', '16', '19', '恢复项目<b>WS</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('107', '15', '19', '恢复项目<b>WS</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('108', '17', '19', '恢复项目<b>er</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('109', '18', '19', '恢复项目<b>uuu</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('110', '25', '19', '恢复项目<b>cs</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('111', '20', '19', '恢复项目<b>ert</b>成功!', '2', '2016-06-24 07:19:34', '');
INSERT INTO `u_item_develop_log` VALUES ('112', '25', '19', '删除项目<b>cs</b>成功!', '2', '2016-06-24 07:19:46', '');
INSERT INTO `u_item_develop_log` VALUES ('113', '22', '19', '删除项目<b>测试项目2</b>成功!', '2', '2016-06-24 07:19:59', '');
INSERT INTO `u_item_develop_log` VALUES ('114', '24', '19', '删除项目<b>测试项目4</b>成功!', '2', '2016-06-24 07:22:24', '');
INSERT INTO `u_item_develop_log` VALUES ('115', '24', '19', '恢复项目<b>测试项目4</b>成功!', '2', '2016-06-24 07:22:35', '');
INSERT INTO `u_item_develop_log` VALUES ('116', '27', '19', '发布项目<b>项目6.24</b>成功!', '1', '2016-06-24 07:23:24', '');
INSERT INTO `u_item_develop_log` VALUES ('117', '19', '2', '添加队员:tt', '3', '2016-06-24 15:29:23', '');
INSERT INTO `u_item_develop_log` VALUES ('118', '19', '2', '添加职位:技术经理,提成比例是：5%', '5', '2016-06-24 15:29:23', '');
INSERT INTO `u_item_develop_log` VALUES ('119', '27', '19', '添加队员:张三', '3', '2016-06-24 07:28:01', '');
INSERT INTO `u_item_develop_log` VALUES ('120', '27', '19', '添加队员:tt', '3', '2016-06-24 07:28:01', '');
INSERT INTO `u_item_develop_log` VALUES ('121', '27', '19', '添加队员:zz', '3', '2016-06-24 07:28:01', '');
INSERT INTO `u_item_develop_log` VALUES ('122', '27', '19', '添加职位:后端,提成比例是：5%', '5', '2016-06-24 07:28:01', '');
INSERT INTO `u_item_develop_log` VALUES ('123', '27', '19', '删除项目<b>项目6.24</b>成功!', '2', '2016-06-25 06:45:59', '');
INSERT INTO `u_item_develop_log` VALUES ('124', '27', '19', '恢复项目<b>项目6.24</b>成功!', '2', '2016-06-25 08:24:57', '');
INSERT INTO `u_item_develop_log` VALUES ('125', '28', '19', '发布项目<b>测试测试测试mmmm</b>成功!', '1', '2016-06-25 17:48:28', '');
INSERT INTO `u_item_develop_log` VALUES ('126', '26', '19', '添加队员:lily', '3', '2016-06-27 01:36:27', '');
INSERT INTO `u_item_develop_log` VALUES ('127', '26', '19', '添加队员:姓名f', '3', '2016-06-27 01:36:27', '');
INSERT INTO `u_item_develop_log` VALUES ('128', '26', '19', '添加职位:test2,提成比例是：0%', '5', '2016-06-27 01:36:27', '');
INSERT INTO `u_item_develop_log` VALUES ('129', '19', '2', '添加队员:yy,并分配任务：dss', '3', '2016-06-27 12:38:27', '');
INSERT INTO `u_item_develop_log` VALUES ('130', '19', '2', '添加职位:11,提成比例是：21%', '5', '2016-06-27 12:38:27', '');
INSERT INTO `u_item_develop_log` VALUES ('131', '29', '19', '发布项目<b>fdsfdfds</b>成功!', '1', '2016-06-27 07:09:33', '');
INSERT INTO `u_item_develop_log` VALUES ('132', '30', '19', '发布项目<b>111111</b>成功!', '1', '2016-06-27 07:46:03', '');
INSERT INTO `u_item_develop_log` VALUES ('133', '31', '19', '发布项目<b>se</b>成功!', '1', '2016-06-27 07:53:14', '');
INSERT INTO `u_item_develop_log` VALUES ('134', '32', '19', '发布项目<b>wsedwe</b>成功!', '1', '2016-06-27 07:54:40', '');
INSERT INTO `u_item_develop_log` VALUES ('135', '33', '19', '发布项目<b>ddd</b>成功!', '1', '2016-06-27 07:55:36', '');
INSERT INTO `u_item_develop_log` VALUES ('136', '34', '19', '发布项目<b>dsgd</b>成功!', '1', '2016-06-27 07:56:20', '');
INSERT INTO `u_item_develop_log` VALUES ('137', '34', '19', '删除项目<b>dsgd</b>成功!', '2', '2016-06-27 17:29:39', '');
INSERT INTO `u_item_develop_log` VALUES ('138', '33', '19', '删除项目<b>ddd</b>成功!', '2', '2016-06-27 17:29:39', '');
INSERT INTO `u_item_develop_log` VALUES ('139', '32', '19', '删除项目<b>wsedwe</b>成功!', '2', '2016-06-27 17:29:39', '');
INSERT INTO `u_item_develop_log` VALUES ('140', '31', '19', '删除项目<b>se</b>成功!', '2', '2016-06-27 17:29:39', '');
INSERT INTO `u_item_develop_log` VALUES ('141', '30', '19', '删除项目<b>111111</b>成功!', '2', '2016-06-27 17:29:39', '');
INSERT INTO `u_item_develop_log` VALUES ('142', '29', '19', '删除项目<b>fdsfdfds</b>成功!', '2', '2016-06-27 17:29:39', '');
INSERT INTO `u_item_develop_log` VALUES ('143', '27', '19', '删除项目<b>项目6.24</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('144', '26', '19', '删除项目<b>测试项目n</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('145', '24', '19', '删除项目<b>测试项目4</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('146', '23', '19', '删除项目<b>测试项目3</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('147', '21', '19', '删除项目<b>测试项目1</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('148', '20', '19', '删除项目<b>ert</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('149', '19', '19', '删除项目<b>测试项目f</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('150', '18', '19', '删除项目<b>uuu</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('151', '17', '19', '删除项目<b>er</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('152', '16', '19', '删除项目<b>WS</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('153', '15', '19', '删除项目<b>WS</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('154', '14', '19', '删除项目<b>WS</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('155', '13', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('156', '12', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('157', '11', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('158', '10', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('159', '9', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('160', '8', '19', '删除项目<b>ww</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('161', '28', '19', '删除项目<b>测试测试测试mmmm</b>成功!', '2', '2016-06-27 09:29:15', '');
INSERT INTO `u_item_develop_log` VALUES ('162', '33', '19', '恢复项目<b>ddd</b>成功!', '2', '2016-06-27 09:30:44', '');
INSERT INTO `u_item_develop_log` VALUES ('163', '34', '19', '恢复项目<b>dsgd</b>成功!', '2', '2016-06-27 09:30:44', '');
INSERT INTO `u_item_develop_log` VALUES ('164', '32', '19', '恢复项目<b>wsedwe</b>成功!', '2', '2016-06-27 09:30:44', '');
INSERT INTO `u_item_develop_log` VALUES ('165', '31', '19', '恢复项目<b>se</b>成功!', '2', '2016-06-27 09:30:44', '');
INSERT INTO `u_item_develop_log` VALUES ('166', '34', '19', '删除项目<b>dsgd</b>成功!', '2', '2016-06-27 09:30:54', '');
INSERT INTO `u_item_develop_log` VALUES ('167', '33', '19', '删除项目<b>ddd</b>成功!', '2', '2016-06-27 09:30:54', '');
INSERT INTO `u_item_develop_log` VALUES ('168', '32', '19', '删除项目<b>wsedwe</b>成功!', '2', '2016-06-27 09:30:54', '');
INSERT INTO `u_item_develop_log` VALUES ('169', '31', '19', '删除项目<b>se</b>成功!', '2', '2016-06-27 09:30:54', '');
INSERT INTO `u_item_develop_log` VALUES ('170', '12', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('171', '13', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('172', '11', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('173', '10', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('174', '8', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('175', '9', '19', '恢复项目<b>ww</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('176', '15', '19', '恢复项目<b>WS</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('177', '14', '19', '恢复项目<b>WS</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('178', '16', '19', '恢复项目<b>WS</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('179', '17', '19', '恢复项目<b>er</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('180', '19', '19', '恢复项目<b>测试项目f</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('181', '18', '19', '恢复项目<b>uuu</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('182', '20', '19', '恢复项目<b>ert</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('183', '21', '19', '恢复项目<b>测试项目1</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('184', '23', '19', '恢复项目<b>测试项目3</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('185', '22', '19', '恢复项目<b>测试项目2</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('186', '24', '19', '恢复项目<b>测试项目4</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('187', '25', '19', '恢复项目<b>cs</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('188', '26', '19', '恢复项目<b>测试项目n</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('189', '27', '19', '恢复项目<b>项目6.24</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('190', '28', '19', '恢复项目<b>测试测试测试mmmm</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('191', '30', '19', '恢复项目<b>111111</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('192', '29', '19', '恢复项目<b>fdsfdfds</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('193', '31', '19', '恢复项目<b>se</b>成功!', '2', '2016-06-27 09:31:50', '');
INSERT INTO `u_item_develop_log` VALUES ('194', '19', '19', '添加队员:姓名f', '3', '2016-06-27 18:29:45', '');
INSERT INTO `u_item_develop_log` VALUES ('195', '19', '19', '本项目删除【11】职务。', '5', '2016-06-27 18:29:45', '');
INSERT INTO `u_item_develop_log` VALUES ('196', '19', '19', '删除队员:yy', '3', '2016-06-27 18:29:45', '');
INSERT INTO `u_item_develop_log` VALUES ('197', '30', '19', '开发周期变化,由88d变成88y。\\n', '2', '2016-07-01 08:42:09', '');
INSERT INTO `u_item_develop_log` VALUES ('198', '19', '19', '项目名称变化,由测试项目f变成111111。\\n金额变化,由1212121变成12333333。\\n合同日期变化,由2016-05-25 00:00:00变成2016-06-27 00:00:00。\\n项目需求变化,由三季度四季度经济的角度fdsfsdf变成FSFSDFS。\\n项目状态变化,由5变成1。\\n开发周期变化,由26m变成88w。\\n', '2', '2016-07-01 09:25:14', '');
INSERT INTO `u_item_develop_log` VALUES ('199', '19', '0', '项目名称变化,由111111变成erer。\\n', '2', '2016-07-05 17:42:48', '');
INSERT INTO `u_item_develop_log` VALUES ('200', '0', '2', '用户：lily申请加入erer。参与什么十', '1', '2016-07-07 16:35:43', '');
INSERT INTO `u_item_develop_log` VALUES ('201', '19', '2', '用户：lily申请加入erer。参与什么十', '1', '2016-07-07 16:36:37', '');
INSERT INTO `u_item_develop_log` VALUES ('202', '19', '2', '用户：lily申请加入erer。参与什么十', '1', '2016-07-07 16:37:31', '');
INSERT INTO `u_item_develop_log` VALUES ('203', '19', '2', '用户：lily申请加入erer。参与什么七', '1', '2016-07-07 16:48:42', '');
INSERT INTO `u_item_develop_log` VALUES ('204', '19', '2', '用户：lily申请加入erer。参与什么十', '1', '2016-07-07 17:35:54', '');
INSERT INTO `u_item_develop_log` VALUES ('205', '19', '19', '用户：姓名f申请加入erer。参与什么十', '1', '2016-07-08 03:24:32', '');
INSERT INTO `u_item_develop_log` VALUES ('206', '19', '2', '【什么七】提成比例发生变化,由50.00变成30。\\n', '5', '2016-07-08 15:41:06', '');
INSERT INTO `u_item_develop_log` VALUES ('207', '19', '2', '【什么八】提成比例发生变化,由4.00变成24。\\n', '5', '2016-07-08 15:44:31', '');
INSERT INTO `u_item_develop_log` VALUES ('208', '19', '2', '删除队员:姓名f', '3', '2016-07-08 15:46:08', '');
INSERT INTO `u_item_develop_log` VALUES ('209', '19', '19', '用户：姓名f申请加入erer。参与什么十', '1', '2016-07-08 09:49:54', '');
INSERT INTO `u_item_develop_log` VALUES ('210', '19', '19', '项目名称变化,由erer变成ererfff。\\n项目需求变化,由FSFSDFS变成fsdffdsfdsfd12s1f212sd1fsd。\\n', '2', '2016-07-11 10:36:09', '');
INSERT INTO `u_item_develop_log` VALUES ('211', '19', '19', '项目名称变化,由ererfff变成ererfffffddf。\\n项目需求变化,由fsdffdsfdsfd12s1f212sd1fsd变成111111111111111。\\n', '2', '2016-07-11 10:37:05', '');
INSERT INTO `u_item_develop_log` VALUES ('212', '19', '19', '项目需求变化,由111111111111111变成。\\n', '2', '2016-07-11 10:46:06', '');
INSERT INTO `u_item_develop_log` VALUES ('213', '19', '19', '项目需求变化,由变成777777777777。\\n', '2', '2016-07-11 10:48:55', '');
INSERT INTO `u_item_develop_log` VALUES ('214', '19', '0', '项目需求变化,由777777777777变成tyutyutut。\\n', '2', '2016-07-11 19:13:56', '');
INSERT INTO `u_item_develop_log` VALUES ('215', '19', '0', '项目需求变化,由tyutyutut变成tyutyututhello,word!。\\n', '2', '2016-07-11 19:14:20', '');
INSERT INTO `u_item_develop_log` VALUES ('220', '19', '19', '项目需求变化,由<p>hello,<img src=\"/Upload/34488770a8dcb67b6710ec9c6aa95444.jpg\" alt=\"large_1owY_3303g132095[1]\" style=\"max-width: 100%;\"></p><p><br></p>变成<p>hello,<img src=\"/Upload/34488770a8dcb67b6710ec9c6aa95444.jpg\" alt=\"la', '2', '2016-07-12 03:30:18', '');
INSERT INTO `u_item_develop_log` VALUES ('221', '19', '0', '项目需求变化。', '2', '2016-07-12 15:01:03', '');
INSERT INTO `u_item_develop_log` VALUES ('222', '19', '0', '项目需求变化。', '2', '2016-07-12 15:06:15', '');
INSERT INTO `u_item_develop_log` VALUES ('223', '19', '0', '项目需求变化。', '2', '2016-07-12 15:09:47', '');
INSERT INTO `u_item_develop_log` VALUES ('224', '19', '0', '项目需求变化。', '2', '2016-07-12 15:40:03', '');
INSERT INTO `u_item_develop_log` VALUES ('225', '19', '19', '项目需求变化。', '2', '2016-07-12 15:48:16', '');
INSERT INTO `u_item_develop_log` VALUES ('226', '19', '19', '项目需求变化。', '2', '2016-07-12 08:02:12', '');
INSERT INTO `u_item_develop_log` VALUES ('227', '19', '19', '用户：姓名f申请加入ererfffffddf项目。参与什么七', '3', '2016-07-12 08:03:33', '');
INSERT INTO `u_item_develop_log` VALUES ('228', '19', '19', '项目需求变化。', '2', '2016-07-12 08:15:43', '');
INSERT INTO `u_item_develop_log` VALUES ('229', '19', '0', '项目需求变化。', '2', '2016-07-12 16:30:51', '');
INSERT INTO `u_item_develop_log` VALUES ('230', '30', '19', '项目需求变化。开发周期变化,由88y变成88d。', '2', '2016-07-12 10:15:31', '');
INSERT INTO `u_item_develop_log` VALUES ('231', '30', '19', '添加队员:lily', '3', '2016-07-12 10:36:49', '');
INSERT INTO `u_item_develop_log` VALUES ('232', '30', '19', '添加队员:kk', '3', '2016-07-12 10:36:49', '');
INSERT INTO `u_item_develop_log` VALUES ('233', '30', '19', '添加职位:什么十,提成比例是：50%', '5', '2016-07-12 10:36:49', '');
INSERT INTO `u_item_develop_log` VALUES ('234', '30', '19', '添加队员:zz', '3', '2016-07-12 10:37:28', '');
INSERT INTO `u_item_develop_log` VALUES ('235', '30', '19', '添加职位:test2,提成比例是：%', '5', '2016-07-12 10:37:28', '');
INSERT INTO `u_item_develop_log` VALUES ('236', '30', '19', '添加队员:kk', '3', '2016-07-12 10:38:03', '');
INSERT INTO `u_item_develop_log` VALUES ('237', '30', '19', '添加队员:tt', '3', '2016-07-12 10:38:03', '');
INSERT INTO `u_item_develop_log` VALUES ('238', '30', '19', '添加队员:yy', '3', '2016-07-12 10:38:03', '');
INSERT INTO `u_item_develop_log` VALUES ('239', '30', '19', '添加职位:test1,提成比例是：%', '5', '2016-07-12 10:38:03', '');
INSERT INTO `u_item_develop_log` VALUES ('240', '30', '19', '用户：姓名f申请加入111111项目。参与test1', '3', '2016-07-12 10:48:53', '');
INSERT INTO `u_item_develop_log` VALUES ('241', '30', '19', '用户：姓名f申请加入111111项目。参与test2', '3', '2016-07-12 10:48:57', '');
INSERT INTO `u_item_develop_log` VALUES ('242', '30', '19', '用户：姓名f申请加入111111项目。参与什么十', '3', '2016-07-12 10:48:59', '');
INSERT INTO `u_item_develop_log` VALUES ('243', '19', '19', '用户：姓名f申请加入ererfffffddf项目。参与什么十', '3', '2016-07-13 07:08:33', '');
INSERT INTO `u_item_develop_log` VALUES ('244', '19', '19', '用户：姓名f申请加入ererfffffddf项目。参与什么十', '3', '2016-07-13 07:08:35', '');
INSERT INTO `u_item_develop_log` VALUES ('245', '19', '19', '用户：姓名f申请加入ererfffffddf项目。参与什么十', '3', '2016-07-13 07:08:40', '');
INSERT INTO `u_item_develop_log` VALUES ('246', '19', '19', '用户：姓名f申请加入ererfffffddf项目。参与什么十', '3', '2016-07-13 07:08:44', '');
INSERT INTO `u_item_develop_log` VALUES ('247', '19', '19', '用户：姓名f申请加入ererfffffddf项目。参与什么十', '3', '2016-07-13 07:11:27', '');
INSERT INTO `u_item_develop_log` VALUES ('248', '19', '19', '添加队员:kk', '3', '2016-07-13 07:24:53', '');
INSERT INTO `u_item_develop_log` VALUES ('249', '19', '19', '添加职位:fsdfds,提成比例是：12%', '5', '2016-07-13 07:24:53', '');
INSERT INTO `u_item_develop_log` VALUES ('250', '7', '2', 'ww项目添加职位:什么七。', '1', '2016-07-13 17:16:03', '');
INSERT INTO `u_item_develop_log` VALUES ('251', '19', '2', '用户：lily申请加入ererfffffddf项目。参与fsdfds', '3', '2016-07-13 17:35:29', '');
INSERT INTO `u_item_develop_log` VALUES ('252', '19', '2', '用户：姓名f成功加入111111项目。参与', '3', '2016-07-14 12:13:12', '');
INSERT INTO `u_item_develop_log` VALUES ('253', '19', '2', '用户：姓名f撤出111111项目的', '3', '2016-07-14 12:14:34', '');
INSERT INTO `u_item_develop_log` VALUES ('254', '19', '2', '用户：姓名f成功加入111111项目。参与', '3', '2016-07-14 12:21:14', '');
INSERT INTO `u_item_develop_log` VALUES ('255', '19', '2', '用户：姓名f撤出111111项目的', '3', '2016-07-14 12:22:00', '');
INSERT INTO `u_item_develop_log` VALUES ('256', '19', '19', '用户：姓名f加入111111项目，参与申请失败!', '3', '2016-07-14 06:42:36', '');
INSERT INTO `u_item_develop_log` VALUES ('257', '19', '19', '用户：姓名f加入111111项目，参与申请失败!', '3', '2016-07-14 06:43:52', '');
INSERT INTO `u_item_develop_log` VALUES ('258', '19', '19', '用户：姓名f加入111111项目，参与申请失败!', '3', '2016-07-14 06:45:37', '');
INSERT INTO `u_item_develop_log` VALUES ('259', '19', '2', '用户：姓名f成功加入111111项目。参与', '3', '2016-07-14 15:05:09', '');
INSERT INTO `u_item_develop_log` VALUES ('260', '19', '2', '用户：姓名f离开111111项目的的工作。', '3', '2016-07-14 15:05:24', '');
INSERT INTO `u_item_develop_log` VALUES ('261', '19', '2', '用户：lily申请加入ererfffffddf项目。参与什么九', '3', '2016-07-14 15:18:46', '');
INSERT INTO `u_item_develop_log` VALUES ('262', '0', '27', '用户：姓名f成功加入111111项目。参与', '3', '2016-11-28 18:19:29', '');
INSERT INTO `u_item_develop_log` VALUES ('263', '35', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:45', '');
INSERT INTO `u_item_develop_log` VALUES ('264', '36', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:45', '');
INSERT INTO `u_item_develop_log` VALUES ('265', '37', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:45', '');
INSERT INTO `u_item_develop_log` VALUES ('266', '38', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:46', '');
INSERT INTO `u_item_develop_log` VALUES ('267', '39', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:46', '');
INSERT INTO `u_item_develop_log` VALUES ('268', '40', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:50', '');
INSERT INTO `u_item_develop_log` VALUES ('269', '41', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:50', '');
INSERT INTO `u_item_develop_log` VALUES ('270', '42', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:50', '');
INSERT INTO `u_item_develop_log` VALUES ('271', '43', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:50', '');
INSERT INTO `u_item_develop_log` VALUES ('272', '44', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:50', '');
INSERT INTO `u_item_develop_log` VALUES ('273', '45', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:51', '');
INSERT INTO `u_item_develop_log` VALUES ('274', '46', '27', '发布项目<b>爱迪生</b>成功!', '1', '2016-12-08 17:27:51', '');
INSERT INTO `u_item_develop_log` VALUES ('275', '47', '32', '发布项目<b>q1</b>成功!', '1', '2016-12-19 16:29:55', '');
INSERT INTO `u_item_develop_log` VALUES ('276', '48', '28', '发布项目<b>q</b>成功!', '1', '2016-12-20 15:07:42', '');
INSERT INTO `u_item_develop_log` VALUES ('277', '49', '35', '发布项目<b>A</b>成功!', '1', '2016-12-20 15:39:24', '');
INSERT INTO `u_item_develop_log` VALUES ('278', '49', '35', '项目需求变化。项目状态变化,由1变成2。', '2', '2016-12-20 15:39:32', '');
INSERT INTO `u_item_develop_log` VALUES ('279', '47', '32', '项目需求变化。项目状态变化,由1变成2。', '2', '2016-12-22 09:10:40', '');
INSERT INTO `u_item_develop_log` VALUES ('280', '47', '32', '添加队员:李炆', '3', '2016-12-22 10:08:05', '');
INSERT INTO `u_item_develop_log` VALUES ('281', '47', '32', 'q1项目添加职位:达传技术,提成比例是：1%', '1', '2016-12-22 10:08:05', '');
INSERT INTO `u_item_develop_log` VALUES ('282', '47', '32', '项目状态变化,由2变成3。', '2', '2016-12-22 10:08:18', '');
INSERT INTO `u_item_develop_log` VALUES ('283', '47', '32', '项目需求变化。', '2', '2016-12-22 10:08:38', '');
INSERT INTO `u_item_develop_log` VALUES ('284', '50', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:16', '');
INSERT INTO `u_item_develop_log` VALUES ('285', '51', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:21', '');
INSERT INTO `u_item_develop_log` VALUES ('286', '52', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:22', '');
INSERT INTO `u_item_develop_log` VALUES ('287', '53', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:22', '');
INSERT INTO `u_item_develop_log` VALUES ('288', '54', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:22', '');
INSERT INTO `u_item_develop_log` VALUES ('289', '55', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:22', '');
INSERT INTO `u_item_develop_log` VALUES ('290', '56', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:22', '');
INSERT INTO `u_item_develop_log` VALUES ('291', '57', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:23', '');
INSERT INTO `u_item_develop_log` VALUES ('292', '58', '32', '发布项目<b>1</b>成功!', '1', '2016-12-22 11:36:24', '');
INSERT INTO `u_item_develop_log` VALUES ('293', '57', '32', '项目需求变化。', '2', '2016-12-26 14:06:18', '');
INSERT INTO `u_item_develop_log` VALUES ('294', '47', '32', '用户：张三申请加入q1项目。参与达传技术', '3', '2016-12-27 14:11:25', '');
INSERT INTO `u_item_develop_log` VALUES ('295', '58', '32', '添加队员:小五哥', '3', '2016-12-27 14:14:58', '');
INSERT INTO `u_item_develop_log` VALUES ('296', '58', '32', '1项目添加职位:达传技术,提成比例是：%', '1', '2016-12-27 14:14:58', '');
INSERT INTO `u_item_develop_log` VALUES ('297', '58', '32', '用户：张三申请加入1项目。参与达传技术', '3', '2016-12-27 14:15:19', '');
INSERT INTO `u_item_develop_log` VALUES ('298', '58', '32', '1项目添加职位:撒旦法撒旦法。', '1', '2016-12-27 14:16:45', '');
INSERT INTO `u_item_develop_log` VALUES ('299', '58', '32', '本项目删除【撒旦法撒旦法】职务。', '5', '2016-12-27 14:16:57', '');
INSERT INTO `u_item_develop_log` VALUES ('300', '58', '32', '添加队员:李炆', '3', '2016-12-27 14:17:10', '');
INSERT INTO `u_item_develop_log` VALUES ('301', '58', '32', '删除队员:李炆', '3', '2016-12-28 16:40:27', '');
INSERT INTO `u_item_develop_log` VALUES ('302', '58', '32', '添加队员:李炆', '3', '2016-12-28 16:41:17', '');
INSERT INTO `u_item_develop_log` VALUES ('303', '57', '32', '添加队员:111', '3', '2016-12-28 16:51:19', '');
INSERT INTO `u_item_develop_log` VALUES ('304', '57', '32', '添加队员:222', '3', '2016-12-28 16:51:19', '');
INSERT INTO `u_item_develop_log` VALUES ('305', '57', '32', '添加队员:222', '3', '2016-12-28 16:51:19', '');
INSERT INTO `u_item_develop_log` VALUES ('306', '57', '32', '1项目添加职位:什么八,提成比例是：%', '1', '2016-12-28 16:51:19', '');
INSERT INTO `u_item_develop_log` VALUES ('307', '57', '32', '删除队员:222', '3', '2016-12-28 16:52:47', '');
INSERT INTO `u_item_develop_log` VALUES ('308', '49', '35', '添加队员:222', '3', '2016-12-28 17:29:45', '');
INSERT INTO `u_item_develop_log` VALUES ('309', '49', '35', 'A项目添加职位:什么八,提成比例是：%', '1', '2016-12-28 17:29:45', '');
INSERT INTO `u_item_develop_log` VALUES ('310', '35', '27', '添加队员:李炆', '3', '2016-12-29 15:13:30', '');
INSERT INTO `u_item_develop_log` VALUES ('311', '35', '27', '爱迪生项目添加职位:达传技术,提成比例是：1%', '1', '2016-12-29 15:13:31', '');
INSERT INTO `u_item_develop_log` VALUES ('312', '47', '32', '用户：张三成功加入1项目。参与32号职务', '3', '2016-12-29 17:34:03', '');
INSERT INTO `u_item_develop_log` VALUES ('313', '47', '32', '用户：张三成功加入q1项目。参与32号职务', '3', '2016-12-29 17:34:30', '');
INSERT INTO `u_item_develop_log` VALUES ('314', '47', '32', '用户：全体成员加入ererfffffddf项目，参与申请失败!', '3', '2016-12-29 17:34:36', '');
INSERT INTO `u_item_develop_log` VALUES ('315', '58', '32', '删除队员:李炆', '3', '2016-12-30 08:59:43', '');
INSERT INTO `u_item_develop_log` VALUES ('316', '58', '32', '删除队员:小五哥', '3', '2016-12-30 08:59:43', '');
INSERT INTO `u_item_develop_log` VALUES ('317', '58', '32', '添加队员:李炆', '3', '2016-12-30 08:59:59', '');
INSERT INTO `u_item_develop_log` VALUES ('318', '57', '32', '用户：张三申请加入1项目。参与什么八', '3', '2016-12-30 10:21:16', '');
INSERT INTO `u_item_develop_log` VALUES ('319', '61', '32', '发布项目<b>silence</b>成功!', '1', '2017-01-03 09:17:12', '');
INSERT INTO `u_item_develop_log` VALUES ('320', '61', '32', '添加队员:李炆', '3', '2017-01-03 09:17:36', '');
INSERT INTO `u_item_develop_log` VALUES ('321', '61', '32', 'silence项目添加职位:达传技术,提成比例是：2%', '1', '2017-01-03 09:17:36', '');
INSERT INTO `u_item_develop_log` VALUES ('322', '61', '32', '项目需求变化。项目状态变化,由1变成2。', '2', '2017-01-03 09:18:26', '');
INSERT INTO `u_item_develop_log` VALUES ('323', '61', '32', '用户：张三申请加入silence项目。参与达传技术', '3', '2017-01-03 09:19:28', '');
INSERT INTO `u_item_develop_log` VALUES ('324', '61', '32', '添加队员:小五哥', '3', '2017-01-03 09:23:33', '');
INSERT INTO `u_item_develop_log` VALUES ('325', '61', '32', '删除队员:小五哥', '3', '2017-01-03 10:45:30', '');
INSERT INTO `u_item_develop_log` VALUES ('326', '61', '32', '用户：张三成功加入silence项目。参与32号职务', '3', '2017-01-03 11:30:14', '');
INSERT INTO `u_item_develop_log` VALUES ('327', '62', '73', '发布项目<b>asdf</b>成功!', '1', '2017-01-04 17:36:45', '');
INSERT INTO `u_item_develop_log` VALUES ('328', '62', '73', '添加队员:老王', '3', '2017-01-04 17:40:28', '');
INSERT INTO `u_item_develop_log` VALUES ('329', '62', '73', '添加队员:小明明', '3', '2017-01-04 17:40:29', '');
INSERT INTO `u_item_develop_log` VALUES ('330', '62', '73', 'asdf项目添加职位:达传技术,提成比例是：%', '1', '2017-01-04 17:40:29', '');
INSERT INTO `u_item_develop_log` VALUES ('331', '5', '73', '合同日期变化,由2016-06-25 00:00:00变成0000-00-00 00:00:00。项目需求变化。项目状态变化,由1变成已审核。开发周期变化,由35变成355。', '2', '2017-01-06 15:23:34', '');
INSERT INTO `u_item_develop_log` VALUES ('357', '3', '76', '吃饭老！', '6', '2017-01-17 10:57:12', '');
INSERT INTO `u_item_develop_log` VALUES ('358', '3', '73', '早上好！', '6', '2017-01-19 11:11:19', '');
INSERT INTO `u_item_develop_log` VALUES ('359', '3', '73', 'wewerr', '6', '2017-01-20 11:47:52', '');
INSERT INTO `u_item_develop_log` VALUES ('333', '61', '73', '系1统2消3息4', '6', '0000-00-00 00:00:00', '');
INSERT INTO `u_item_develop_log` VALUES ('334', '61', '73', '系1统2消3息4', '6', '2017-01-10 11:34:01', '');
INSERT INTO `u_item_develop_log` VALUES ('335', '4', '73', 'wqeeq', '6', '2017-01-12 11:26:37', '');
INSERT INTO `u_item_develop_log` VALUES ('336', '4', '73', 'wqeqw', '6', '2017-01-12 11:27:37', '');
INSERT INTO `u_item_develop_log` VALUES ('337', '4', '73', 'wdqwe', '6', '2017-01-12 11:32:27', '');
INSERT INTO `u_item_develop_log` VALUES ('338', '4', '73', 'fvfvfvf', '6', '2017-01-12 12:14:43', '');

-- ----------------------------
-- Table structure for `u_item_develop_type`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_develop_type`;
CREATE TABLE `u_item_develop_type` (
  `id` int(30) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '类别名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_item_develop_type
-- ----------------------------
INSERT INTO `u_item_develop_type` VALUES ('1', '项目概述');
INSERT INTO `u_item_develop_type` VALUES ('2', '项目变更');
INSERT INTO `u_item_develop_type` VALUES ('3', '队员变更');
INSERT INTO `u_item_develop_type` VALUES ('4', '任务变更');
INSERT INTO `u_item_develop_type` VALUES ('5', '提成变更');
INSERT INTO `u_item_develop_type` VALUES ('6', '进度变更');
INSERT INTO `u_item_develop_type` VALUES ('0', '任务指派');

-- ----------------------------
-- Table structure for `u_item_git`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_git`;
CREATE TABLE `u_item_git` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '仓库名称',
  `address` varchar(255) NOT NULL COMMENT '仓库地址',
  `i_id` int(30) NOT NULL COMMENT '所属项目id',
  `status` int(1) NOT NULL COMMENT '审核状态 0 未审核 1已审核 ',
  `description` varchar(255) NOT NULL COMMENT '仓库描述',
  `u_id` int(30) NOT NULL COMMENT '创建人id',
  `content` varchar(255) NOT NULL COMMENT '申请信息',
  `online` int(1) NOT NULL DEFAULT '1' COMMENT '仓库状态(用户) 0 停用 1 可用',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '仓库状态(管理员) 0 禁用 1 启用 2管理员移除仓库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_item_git
-- ----------------------------
INSERT INTO `u_item_git` VALUES ('1', 'qaz', 'www.baidu.com', '3', '0', 'aaaa', '71', 'aa', '1', '1');
INSERT INTO `u_item_git` VALUES ('2', 'a', 'www.baidu.com', '3', '1', 'aaaac', '72', 'bb', '1', '1');
INSERT INTO `u_item_git` VALUES ('3', 'c', 'www.baidu.com', '3', '0', 'bbb', '73', 'cc', '1', '1');

-- ----------------------------
-- Table structure for `u_item_status_type`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_status_type`;
CREATE TABLE `u_item_status_type` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='项目状态表';

-- ----------------------------
-- Records of u_item_status_type
-- ----------------------------
INSERT INTO `u_item_status_type` VALUES ('1', '未审核');
INSERT INTO `u_item_status_type` VALUES ('2', '审核');
INSERT INTO `u_item_status_type` VALUES ('3', '分析');
INSERT INTO `u_item_status_type` VALUES ('4', '组队');
INSERT INTO `u_item_status_type` VALUES ('5', '开发');
INSERT INTO `u_item_status_type` VALUES ('6', '完成');

-- ----------------------------
-- Table structure for `u_item_task`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_task`;
CREATE TABLE `u_item_task` (
  `id` int(90) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `i_id` int(30) NOT NULL COMMENT '项目名称id',
  `u_id` int(30) NOT NULL COMMENT '队员id 即users表的id',
  `type` int(3) NOT NULL COMMENT '对象类别  职位',
  `duty` varchar(255) NOT NULL COMMENT '任务具体内容',
  `percent` float(3,1) NOT NULL COMMENT '佣金百分比',
  `stay` int(1) NOT NULL DEFAULT '1' COMMENT '是否在项目中  1在，0 被踢走了，-1 主动退出',
  `completion` float(4,2) NOT NULL COMMENT '完成任务百分比',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '佣金结算 1 结算 0 未结算',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Records of u_item_task
-- ----------------------------
INSERT INTO `u_item_task` VALUES ('1', '19', '1', '7', 'zzzz', '3.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('2', '19', '2', '7', 'lllll', '2.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('3', '19', '2', '8', 'llii', '5.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('5', '19', '2', '8', 'llii', '8.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('83', '0', '0', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('7', '19', '2', '8', 'lili', '3.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('81', '62', '71', '66', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('9', '19', '2', '8', 'lili', '3.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('11', '19', '19', '7', 'sasa', '4.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('12', '19', '13', '8', 'ytyt', '6.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('13', '19', '3', '9', 'fsdfdssdfsddfsd', '30.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('14', '19', '19', '9', 'fsfsdfsdfds', '20.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('15', '19', '1', '7', 'fdsfsd', '20.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('16', '19', '2', '7', 'fsdfsdfsdf', '30.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('17', '19', '3', '7', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('18', '26', '3', '7', '', '12.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('19', '26', '3', '9', 'sdsdfd', '20.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('20', '19', '6', '10', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('58', '58', '0', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('82', '4', '73', '0', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('56', '61', '35', '66', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('25', '26', '19', '32', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('26', '19', '13', '11', 'dss', '5.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('27', '19', '19', '8', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('28', '30', '2', '10', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('29', '30', '3', '10', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('59', '58', '35', '0', '', '0.0', '-1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('31', '30', '3', '58', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('32', '30', '6', '58', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('33', '30', '13', '58', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('34', '19', '3', '57', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('35', '30', '19', '58', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('36', '30', '19', '58', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('37', '30', '19', '58', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('38', '30', '19', '58', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('39', '30', '19', '58', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('40', '47', '35', '66', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('80', '62', '73', '66', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('42', '58', '35', '66', '', '0.0', '-1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('43', '58', '35', '66', '', '0.0', '-1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('44', '57', '57', '8', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('45', '57', '58', '8', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('46', '57', '59', '8', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('47', '49', '58', '8', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('48', '35', '35', '66', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('49', '58', '32', '66', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('50', '47', '32', '66', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('51', '58', '35', '66', '', '0.0', '-1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('52', '58', '0', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('53', '58', '0', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('54', '58', '123', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('55', '58', '123', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('65', '61', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('64', '61', '32', '66', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('67', '57', '33', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('68', '0', '0', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('69', '0', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('70', '0', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('71', '58', '33', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('72', '58', '35', '0', '', '0.0', '-1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('73', '57', '35', '0', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('74', '57', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('75', '58', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('76', '57', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('77', '58', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('78', '57', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('79', '58', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('92', '5', '71', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('91', '5', '73', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('95', '3', '71', '0', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('94', '3', '73', '0', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('93', '3', '72', '0', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('96', '72', '3', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('97', '72', '3', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('98', '72', '3', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('99', '19', '19', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('4', '0', '6', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('100', '58', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('101', '58', '35', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('102', '72', '3', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('103', '72', '3', '0', '', '0.0', '1', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('104', '3', '76', '0', '', '0.0', '0', '0.00', '0');
INSERT INTO `u_item_task` VALUES ('105', '19', '19', '0', '', '0.0', '1', '0.00', '0');

-- ----------------------------
-- Table structure for `u_item_task_apply`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_task_apply`;
CREATE TABLE `u_item_task_apply` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `i_id` int(11) NOT NULL COMMENT '项目id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `type` int(1) NOT NULL COMMENT ' 申请的职位',
  `flag` int(1) NOT NULL COMMENT '0 申请提交 1申请成功  2 申请失败',
  `reply_msg` varchar(255) NOT NULL COMMENT '回复信息',
  `apply_msg` varchar(255) NOT NULL COMMENT '申请信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_item_task_apply
-- ----------------------------
INSERT INTO `u_item_task_apply` VALUES ('1', '72', '3', '10', '1', 's', '2');
INSERT INTO `u_item_task_apply` VALUES ('2', '19', '2', '10', '2', '', '2');
INSERT INTO `u_item_task_apply` VALUES ('3', '19', '2', '10', '1', '2', '3');
INSERT INTO `u_item_task_apply` VALUES ('5', '19', '2', '7', '2', '', '');
INSERT INTO `u_item_task_apply` VALUES ('8', '19', '19', '10', '0', '', '');
INSERT INTO `u_item_task_apply` VALUES ('9', '19', '19', '7', '0', '', '');
INSERT INTO `u_item_task_apply` VALUES ('10', '30', '19', '58', '1', '', '');
INSERT INTO `u_item_task_apply` VALUES ('11', '30', '19', '59', '2', '', '');
INSERT INTO `u_item_task_apply` VALUES ('12', '30', '19', '10', '2', '', '');
INSERT INTO `u_item_task_apply` VALUES ('13', '19', '19', '10', '0', '', '');
INSERT INTO `u_item_task_apply` VALUES ('14', '19', '19', '10', '0', '', '');
INSERT INTO `u_item_task_apply` VALUES ('15', '19', '19', '10', '1', 'b', '');
INSERT INTO `u_item_task_apply` VALUES ('16', '19', '19', '10', '1', '', '');
INSERT INTO `u_item_task_apply` VALUES ('17', '19', '19', '10', '1', '木木木', '');
INSERT INTO `u_item_task_apply` VALUES ('18', '19', '2', '57', '2', '', '');
INSERT INTO `u_item_task_apply` VALUES ('19', '47', '32', '66', '1', '', '');
INSERT INTO `u_item_task_apply` VALUES ('20', '58', '32', '66', '1', '', '');
INSERT INTO `u_item_task_apply` VALUES ('21', '57', '32', '8', '1', '', '');
INSERT INTO `u_item_task_apply` VALUES ('28', '22', '22', '10', '1', '', '');
INSERT INTO `u_item_task_apply` VALUES ('29', '61', '32', '66', '1', '', '');
INSERT INTO `u_item_task_apply` VALUES ('72', '0', '2', '10', '0', '', '');

-- ----------------------------
-- Table structure for `u_item_track`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_track`;
CREATE TABLE `u_item_track` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tname` varchar(255) NOT NULL COMMENT '任务名称',
  `iid` int(10) unsigned NOT NULL COMMENT '项目id',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '系统状态 1 指派中 2 已分配 待开发 3 开发中 4 开发完待测试 5 测试中 6 测试未通过已返回 7 测试通过待审核 8 审核未通过已返回 9 审核通过开发完成 待发布 10 已发布完成 ',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='项目跟踪任务指派';

-- ----------------------------
-- Records of u_item_track
-- ----------------------------
INSERT INTO `u_item_track` VALUES ('33', '任务12', '3', '桌面 陈默 管理 仓库 列表', '1');
INSERT INTO `u_item_track` VALUES ('34', '任务2', '4', '桌面 陈默 管理 仓库 列表', '4');
INSERT INTO `u_item_track` VALUES ('35', '任务3', '5', '桌面 陈默 管理 仓库 列表', '1');
INSERT INTO `u_item_track` VALUES ('36', '任务4', '47', '桌面 陈默 管理 仓库 列表', '6');
INSERT INTO `u_item_track` VALUES ('37', '任务09', '58', '任务09 任务09任务09任务09任务09', '1');
INSERT INTO `u_item_track` VALUES ('38', '任务11', '56', '啊大苏打', '10');
INSERT INTO `u_item_track` VALUES ('39', '入伍23', '55', '啊实打实大苏打', '1');

-- ----------------------------
-- Table structure for `u_item_track_log`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_track_log`;
CREATE TABLE `u_item_track_log` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tid` int(10) unsigned NOT NULL COMMENT '任务track id',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `opuid` int(10) unsigned NOT NULL COMMENT '操作人uid',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_item_track_log
-- ----------------------------

-- ----------------------------
-- Table structure for `u_item_track_status_type`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_track_status_type`;
CREATE TABLE `u_item_track_status_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '任务进度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_item_track_status_type
-- ----------------------------
INSERT INTO `u_item_track_status_type` VALUES ('1', '指派中');
INSERT INTO `u_item_track_status_type` VALUES ('2', '已分配，等待开发');
INSERT INTO `u_item_track_status_type` VALUES ('3', '开发中');
INSERT INTO `u_item_track_status_type` VALUES ('4', '开发完待测试');
INSERT INTO `u_item_track_status_type` VALUES ('5', '测试中');
INSERT INTO `u_item_track_status_type` VALUES ('6', '测试未通过已返回');
INSERT INTO `u_item_track_status_type` VALUES ('7', '测试通过已返回');
INSERT INTO `u_item_track_status_type` VALUES ('8', '审核未通过已返回');
INSERT INTO `u_item_track_status_type` VALUES ('9', '审核通过开发完成待发布');
INSERT INTO `u_item_track_status_type` VALUES ('10', '已发布完成');

-- ----------------------------
-- Table structure for `u_item_track_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_item_track_user`;
CREATE TABLE `u_item_track_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `tid` int(10) unsigned NOT NULL COMMENT '任务track id',
  `touid` int(10) unsigned NOT NULL COMMENT '转给下一个用户id',
  `fromuid` int(10) unsigned NOT NULL COMMENT '来源用户uid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_item_track_user
-- ----------------------------
INSERT INTO `u_item_track_user` VALUES ('1', '80', '34', '0', '0');
INSERT INTO `u_item_track_user` VALUES ('2', '73', '35', '0', '0');
INSERT INTO `u_item_track_user` VALUES ('3', '71', '36', '0', '0');
INSERT INTO `u_item_track_user` VALUES ('4', '73', '33', '0', '0');
INSERT INTO `u_item_track_user` VALUES ('5', '1', '37', '0', '0');
INSERT INTO `u_item_track_user` VALUES ('6', '80', '38', '0', '0');
INSERT INTO `u_item_track_user` VALUES ('7', '0', '39', '0', '0');

-- ----------------------------
-- Table structure for `u_items`
-- ----------------------------
DROP TABLE IF EXISTS `u_items`;
CREATE TABLE `u_items` (
  `id` int(30) unsigned NOT NULL AUTO_INCREMENT COMMENT '项目id 主键',
  `i_name` varchar(255) NOT NULL COMMENT '项目名称 必填',
  `money` varchar(255) NOT NULL COMMENT '金额  必填',
  `contractDate` datetime NOT NULL COMMENT '合同日期 必填',
  `requirement` text NOT NULL COMMENT '需求描述 必填',
  `status` varchar(255) NOT NULL COMMENT '状态信息',
  `publisher` varchar(255) NOT NULL COMMENT '发布人 必填',
  `releaseDate` datetime NOT NULL COMMENT '发布日期 ',
  `days` varchar(255) NOT NULL COMMENT '开发周期 必填',
  `img` varchar(255) DEFAULT NULL COMMENT '二维码',
  `users` varchar(255) DEFAULT NULL COMMENT '成员',
  `online` int(1) DEFAULT NULL COMMENT '项目停用 1未停用 0停用 2表彻底删除',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '项目审核状态 0为未审核 1为已审核',
  `git` int(1) DEFAULT '0' COMMENT '项目是否有仓库 0 没有 1已拥有',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='项目信息表';

-- ----------------------------
-- Records of u_items
-- ----------------------------
INSERT INTO `u_items` VALUES ('3', 'yy12', '2000', '0000-00-00 00:00:00', 'aaaa', '2', '2', '2016-05-25 14:13:51', '300', '1.jpg', '72,73,71,76', '1', '1', '0');
INSERT INTO `u_items` VALUES ('4', 'yy2', '2000', '2016-06-25 00:00:00', '需求描述据办法要求，支付账户将严格实行实名管理，并按照三类支付账户分级管理。如果用户身份验证情况未达到办法所规定标准，会影响支付账户部分功能使用。通俗地讲，届时未实名的支付宝和微信用户，既不能在账户里存钱，也不能使用余额转账或消费。', '1', '1', '2016-05-25 14:13:51', '30', '1.jpg', '71,76', '-1', '1', '0');
INSERT INTO `u_items` VALUES ('5', 'yyu', '2000', '0000-00-00 00:00:00', '', '已审核', '1', '2016-05-25 14:13:51', '355', '1.jpg', '73,71', '-1', '1', '0');
INSERT INTO `u_items` VALUES ('60', '我的项目2', '30000', '2016-12-29 18:24:51', '我的项目没有需求', '2', '57', '2016-12-15 00:00:00', '12天', null, '58,59,32,35', '0', '1', '0');
INSERT INTO `u_items` VALUES ('47', '任务', '1', '2016-12-22 00:00:00', '', '1', '32', '2016-12-22 11:36:22', '12d', 'item54.png', null, '1', '1', '0');
INSERT INTO `u_items` VALUES ('55', '项目1', '1', '2016-12-22 00:00:00', '', '1', '32', '2016-12-22 11:36:22', '12d', 'item55.png', null, '1', '1', '0');
INSERT INTO `u_items` VALUES ('56', '申请', '1', '2016-12-22 00:00:00', '', '1', '32', '2016-12-22 11:36:22', '12d', 'item56.png', null, '1', '1', '0');
INSERT INTO `u_items` VALUES ('57', '审核', '1', '2016-12-22 00:00:00', 'werqwe', '1', '32', '2016-12-22 11:36:23', '12d', 'item57.png', '33,57', '1', '1', '0');
INSERT INTO `u_items` VALUES ('58', '仓库', '1', '2016-12-22 00:00:00', '', '1', '32', '2016-12-22 11:36:24', '12d', 'item58.png', '33,32', '1', '1', '0');
INSERT INTO `u_items` VALUES ('61', 'silence', '100', '2017-01-03 00:00:00', '需求分析', '2', '32', '2017-01-03 09:17:12', '3m', 'item61.png', '72,71', '2', '1', '0');
INSERT INTO `u_items` VALUES ('62', 'asdf', '111', '2017-01-06 00:00:00', '12adfasdfasd', '1', '73', '2017-01-04 17:36:45', '10d', 'item62.png', '71,73', '2', '1', '0');

-- ----------------------------
-- Table structure for `u_job_authority`
-- ----------------------------
DROP TABLE IF EXISTS `u_job_authority`;
CREATE TABLE `u_job_authority` (
  `jid` int(10) unsigned NOT NULL COMMENT 'job id',
  `lids` varchar(255) NOT NULL COMMENT '权限ids  , 分割'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_job_authority
-- ----------------------------
INSERT INTO `u_job_authority` VALUES ('1', '18,8,19,27,9,21,31,32,25,22,23,26,28,29,7,30');
INSERT INTO `u_job_authority` VALUES ('23', '8,19,31,7,30');
INSERT INTO `u_job_authority` VALUES ('24', '8,7,30');
INSERT INTO `u_job_authority` VALUES ('29', '8,9');
INSERT INTO `u_job_authority` VALUES ('33', '31,32');
INSERT INTO `u_job_authority` VALUES ('34', '8,19');

-- ----------------------------
-- Table structure for `u_message`
-- ----------------------------
DROP TABLE IF EXISTS `u_message`;
CREATE TABLE `u_message` (
  `msg_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `sender` int(11) NOT NULL COMMENT '发送人id',
  `receiver` int(11) NOT NULL COMMENT '收信人id',
  `content` text NOT NULL COMMENT '发送内容',
  `send_time` int(10) NOT NULL COMMENT '发送时间',
  `p_id` int(11) NOT NULL COMMENT '是否新的消息',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1表示未读 0表示已读',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '消息类型 1为默认 2为系统消息',
  `url` varchar(255) NOT NULL COMMENT 'url',
  PRIMARY KEY (`msg_id`),
  KEY `sender` (`sender`,`receiver`,`p_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_message
-- ----------------------------
INSERT INTO `u_message` VALUES ('1129', '0', '19', '亲爱的【】，你已经加入了项目【】,请按时完成任务！', '1484191602', '0', '0', '2', '');
INSERT INTO `u_message` VALUES ('1172', '76', '73', '老王，早上好！', '1484533089', '0', '0', '1', '');
INSERT INTO `u_message` VALUES ('1173', '76', '73', '吃早饭了吗，老王？', '1484533485', '0', '0', '1', '');
INSERT INTO `u_message` VALUES ('1174', '76', '73', '干什么呢？', '1484533610', '0', '0', '1', '');
INSERT INTO `u_message` VALUES ('1175', '76', '73', '111', '1484539390', '0', '0', '1', '');
INSERT INTO `u_message` VALUES ('1176', '76', '73', '中午了！', '1484540652', '0', '0', '1', '');
INSERT INTO `u_message` VALUES ('1177', '76', '73', '吃饭了！', '1484540674', '0', '0', '1', '');
INSERT INTO `u_message` VALUES ('1178', '73', '76', '1', '1484540933', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1179', '76', '73', '啊啊啊', '1484541281', '0', '0', '1', '');
INSERT INTO `u_message` VALUES ('1180', '73', '71', '12312', '1484559236', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1181', '73', '76', 'qwqe', '1484559245', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1182', '73', '71', 'wqeqweqwe', '1484622350', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1183', '73', '76', 'wewqeqw', '1484622354', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1184', '73', '72', 'ewqewqe', '1484622358', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1185', '73', '71', 'qwer', '1484622954', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1186', '0', '76', '你已经退出项目yy12', '1484642378', '0', '0', '2', '');
INSERT INTO `u_message` VALUES ('1187', '73', '71', 'asdfsdfa', '1484793873', '1185', '1', '1', '');
INSERT INTO `u_message` VALUES ('1188', '73', '71', 'qwqw', '1484796081', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1189', '73', '76', 'dfzdf', '1484796158', '0', '1', '1', '');
INSERT INTO `u_message` VALUES ('1190', '73', '71', 'gfhff', '1484884059', '0', '1', '1', '');

-- ----------------------------
-- Table structure for `u_message_type`
-- ----------------------------
DROP TABLE IF EXISTS `u_message_type`;
CREATE TABLE `u_message_type` (
  `type_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '消息类型id 0未分配',
  `type` varchar(20) NOT NULL DEFAULT '未分配' COMMENT '消息类型'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_message_type
-- ----------------------------
INSERT INTO `u_message_type` VALUES ('1', '普通消息');
INSERT INTO `u_message_type` VALUES ('2', '系统消息');

-- ----------------------------
-- Table structure for `u_users`
-- ----------------------------
DROP TABLE IF EXISTS `u_users`;
CREATE TABLE `u_users` (
  `id` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL COMMENT '呢称',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ号码',
  `tel` varchar(255) NOT NULL COMMENT '联系方式',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `department` varchar(255) NOT NULL COMMENT '所属部门',
  `registerDate` datetime NOT NULL COMMENT '注册时间或入职时间',
  `user_number` varchar(255) NOT NULL COMMENT '员工编号',
  `job` varchar(255) NOT NULL COMMENT '职务/任职',
  `salary` int(10) NOT NULL COMMENT '工资',
  `email` varchar(255) DEFAULT NULL COMMENT '邮件',
  `weixin` varchar(255) DEFAULT NULL COMMENT '微信号',
  `level` int(2) DEFAULT '0' COMMENT '用户级别 1--超级管理员 2-- 管理员 3-- 普通的人员',
  `sex` tinyint(3) unsigned NOT NULL COMMENT '性别 0 女 1 男',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of u_users
-- ----------------------------
INSERT INTO `u_users` VALUES ('72', '大幂幂', null, '666777', '13866668889', 'd747d943e15eb39e9a8d9908d6ac4005', '8', '2017-01-11 00:00:00', 'MZM00072', '7', '6000', 'mm@qq.com', 'weixin222', '3', '0');
INSERT INTO `u_users` VALUES ('73', '老王', '5510a20c6ecc406b177f0a187f7dab30.jpg', '555666', '112233', 'a02a0bd6c48cfaaa74a20dcefc3b8cf6', '7,34', '2017-01-04 17:09:58', 'MZM00073', '7,66', '5000', '33@qq.com', '', '3', '0');
INSERT INTO `u_users` VALUES ('71', '小明明', null, '888666', '13866668888', 'a02a0bd6c48cfaaa74a20dcefc3b8cf6', '34', '2017-01-25 00:00:00', 'MZM00071', '5,8', '8000', 'xiaoming@qq.com', 'wei888', '2', '0');
INSERT INTO `u_users` VALUES ('76', '打瞌睡好累', '', '11111111', '123qwe', 'a916f9f72fa21ef24f3921a47510f4dc', '', '2017-01-05 10:02:48', 'MZM00076', '', '0', '111@qq.com', '11111', '1', '0');
INSERT INTO `u_users` VALUES ('1', '超级管理员', null, null, 'admin', '', '', '0000-00-00 00:00:00', '', '', '0', null, null, '0', '0');
INSERT INTO `u_users` VALUES ('2', '全体成员', null, null, 'all', '', '', '0000-00-00 00:00:00', '', '', '0', null, null, '0', '0');
INSERT INTO `u_users` VALUES ('80', 'A', null, null, 'assnr', 'f4a6a13140fb1676ae806a8405d69104', '', '2017-01-09 10:57:00', '', '', '0', null, null, '3', '0');
INSERT INTO `u_users` VALUES ('81', '犀利', null, '', '', 'd747d943e15eb39e9a8d9908d6ac4005', '', '0000-00-00 00:00:00', 'MZM00081', '', '0', '', '', '0', '0');
INSERT INTO `u_users` VALUES ('82', 'C', null, null, 'qweasd', '287c8b929e7c8e3152bdd5172f658473', '', '2017-01-17 17:51:34', '', '', '0', null, null, '0', '0');

-- ----------------------------
-- Table structure for `u_users_wechat`
-- ----------------------------
DROP TABLE IF EXISTS `u_users_wechat`;
CREATE TABLE `u_users_wechat` (
  `wid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '绑定用户id',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `nickname` varchar(255) NOT NULL COMMENT 'nickname',
  `sex` varchar(255) NOT NULL COMMENT 'sex',
  `city` varchar(255) NOT NULL COMMENT 'city',
  `province` varchar(255) NOT NULL COMMENT 'province',
  `country` varchar(255) NOT NULL COMMENT 'country',
  `headimgurl` varchar(255) NOT NULL COMMENT 'headimgurl',
  `bindtime` int(10) unsigned NOT NULL COMMENT '绑定时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_users_wechat
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_config`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_config`;
CREATE TABLE `wechat_config` (
  `cid` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `appid` varchar(255) NOT NULL COMMENT 'appid',
  `appsecret` varchar(255) NOT NULL COMMENT 'appsecret',
  `token` varchar(255) NOT NULL COMMENT 'token',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wechat_config
-- ----------------------------
INSERT INTO `wechat_config` VALUES ('1', 'wx7c69d4b9d4c86337', '318c853723168091eaca30dfdf70b238', 'VZ3B3ucSuN1e22uN53nU5a4NVNi11Ene');
