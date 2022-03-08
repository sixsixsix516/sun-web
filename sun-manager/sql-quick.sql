/*
 Navicat Premium Data Transfer

 Source Server         : 测试
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 106.12.192.161:3306
 Source Schema         : wkpower2019

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 06/06/2021 18:58:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
                              `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                              `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
                              `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
                              `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
                              `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                              `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
                              `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
                              `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
                              `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
                              `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
                              `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                              `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                              `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
                              `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                              `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                              `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (16, 'super_user', '用户表', 'SuperUser', 'crud', 'com.ruoyi.system', 'system', 'user', '用户', 'ruoyi', '0', '/', NULL, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
                                     `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                     `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
                                     `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
                                     `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
                                     `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
                                     `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
                                     `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
                                     `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
                                     `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
                                     `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
                                     `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                     `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                     `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
                                     `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
                                     `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                     `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                     `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                     `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
                                     `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                     `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                     `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                     PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (37, '16', 'id', '', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '16', 'username', '用户名', 'varchar(255)', 'String', 'username', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '16', 'password', '密码', 'varchar(255)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', NULL, '', NULL);

-- ----------------------------
-- Table structure for super_user
-- ----------------------------
DROP TABLE IF EXISTS `super_user`;
CREATE TABLE `super_user`  (
                               `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
                               `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
                               `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of super_user
-- ----------------------------
INSERT INTO `super_user` VALUES (1, 'root', 'admin2');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
                               `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                               `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
                               `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
                               `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
                               `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                               `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-01 14:38:36', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
                                  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
                                  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
                                  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
                                  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
                                  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
                                  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
                                  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_id`) USING BTREE,
                                  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
                                   `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                   `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
                                   `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
                                   `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
                                   `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
                                   `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
                                   `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                   `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
                                   `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
                                   PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2020-08-20 16:17:11');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-08-20 16:17:58');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-08-20 16:23:44');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-08-20 16:44:56');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-08-31 14:34:50');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-08-31 15:54:20');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-08-31 16:14:59');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-09-01 14:16:26');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-01 14:16:29');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-09-01 15:13:07');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-01 15:13:10');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码已失效', '2020-09-02 14:07:27');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码已失效', '2020-09-02 14:07:28');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码已失效', '2020-09-02 14:07:28');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码已失效', '2020-09-02 14:07:29');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码已失效', '2020-09-02 14:07:29');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码已失效', '2020-09-02 14:07:29');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2020-09-02 14:18:58');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-02 14:21:54');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-03 14:27:01');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-03 15:03:54');
INSERT INTO `sys_logininfor` VALUES (121, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '对不起，您的账号：ry 已停用', '2020-09-03 15:05:08');
INSERT INTO `sys_logininfor` VALUES (122, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-03 15:05:13');
INSERT INTO `sys_logininfor` VALUES (123, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-03 15:05:20');
INSERT INTO `sys_logininfor` VALUES (124, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-03 15:06:49');
INSERT INTO `sys_logininfor` VALUES (125, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-03 15:07:20');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 15:22:57');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 15:24:58');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 15:26:59');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 15:27:15');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 15:27:42');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 15:30:04');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 16:45:42');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 17:04:19');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-04 17:22:10');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-11 14:24:59');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-06 16:10:02');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-06 16:22:02');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-06 17:06:05');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', NULL);
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', NULL);
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', NULL);
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', NULL);
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', NULL);
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', NULL);
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', NULL);
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                             `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
                             `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
                             `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                             `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
                             `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
                             `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
                             `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                             `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                             `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
                             `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2006 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', '系统管理目录', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 'M', '0', '0', '', 'monitor', '系统监控目录', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 'M', '0', '0', '', 'tool', '系统工具目录', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', '用户管理菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', '角色管理菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', '菜单管理菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '0', '', 'log', '日志管理菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', '0', 'monitor:online:list', 'online', '在线用户菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', '0', 'monitor:server:list', 'server', '服务监控菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', '0', 'tool:build:list', 'build', '表单构建菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 'C', '0', '0', 'tool:gen:list', 'code', '代码生成菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', '0', 'monitor:operlog:list', 'form', '操作日志菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', '登录日志菜单', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', '0', 'monitor:operlog:query', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', '0', 'monitor:operlog:export', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', '0', 'monitor:online:query', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', '0', 'tool:gen:query', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:edit', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', '0', 'tool:gen:remove', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:import', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 'F', '0', '0', 'tool:gen:preview', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 'F', '0', '0', 'tool:gen:code', '#', '', 'admin', 'ry', '2018-03-16 11:33:00', '2018-03-16 11:33:00');
INSERT INTO `sys_menu` VALUES (2000, '用户', 3, 1, 'user', 'user/index', 1, 'C', '0', '0', 'system:user:list', '#', '用户菜单', 'admin', 'admin', '2018-03-01 00:00:00', '2020-08-31 14:48:14');
INSERT INTO `sys_menu` VALUES (2001, '用户查询', 2000, 1, '#', '', 1, 'F', '0', '0', 'system:user:query', '#', '', 'admin', 'ry', '2018-03-01 00:00:00', '2018-03-01 00:00:00');
INSERT INTO `sys_menu` VALUES (2002, '用户新增', 2000, 2, '#', '', 1, 'F', '0', '0', 'system:user:add', '#', '', 'admin', 'ry', '2018-03-01 00:00:00', '2018-03-01 00:00:00');
INSERT INTO `sys_menu` VALUES (2003, '用户修改', 2000, 3, '#', '', 1, 'F', '0', '0', 'system:user:edit', '#', '', 'admin', 'ry', '2018-03-01 00:00:00', '2018-03-01 00:00:00');
INSERT INTO `sys_menu` VALUES (2004, '用户删除', 2000, 4, '#', '', 1, 'F', '0', '0', 'system:user:remove', '#', '', 'admin', 'ry', '2018-03-01 00:00:00', '2018-03-01 00:00:00');
INSERT INTO `sys_menu` VALUES (2005, '用户导出', 2000, 5, '#', '', 1, 'F', '0', '0', 'system:user:export', '#', '', 'admin', 'ry', '2018-03-01 00:00:00', '2018-03-01 00:00:00');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
                                 `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                 `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
                                 `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                 `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
                                 `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
                                 `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                 `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
                                 `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
                                 `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
                                 `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
                                 `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
                                 `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
                                 `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
                                 `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
                                 `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
                                 `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
                                 PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 334 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"09b977b6-c442-4c66-af3e-caea370cb1ff_用户数据.xlsx\",\"code\":200}', 0, NULL, '2020-08-20 16:21:22');
INSERT INTO `sys_oper_log` VALUES (101, '在线用户', 7, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, NULL, NULL, '/monitor/online/8663ccff-0cf6-45fd-8dc6-3d89ed6b18d5', '127.0.0.1', '内网IP', '{tokenId=8663ccff-0cf6-45fd-8dc6-3d89ed6b18d5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-20 16:23:39');
INSERT INTO `sys_oper_log` VALUES (122, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"1\",\"noticeContent\":\"<ol><li><img src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIEAYAAAD9yHLdAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAAASAAAAEgARslrPgAAP+hJREFUeNrt3XVc1df/B/DX+dx7gQuXbqVRQMQOwu5umd01N7fZNWdtcwbWNls3FTtmbU5sp5g4uwALRQREuu/9nN8f1zv3+85C4tw4z398bN54fT7Cfd/TBBzHlZgKP/7Ymor29kJC/lVg5Urip0oDadoUK4W2gFwOO3ITyM8n55RrgFu3hOVCBOjo0bc/mTSHCBcvss7PcUVBWAfgON1GKaWE+NovOAHMnk3jxTrA6NGkClkOKBT/ebgvmQ9QWn2R73Xg5Uv3to5egJmZaEO/BHbtCjsfvICQfv1YXxXHfQheQDjuI/henzuX0t69SSPhayAsjDrQOYCz89se737IqTOQmVn1t4qJgFQqJApGgFz+nwc+IdVAz5+fv7WuCUi9egAhhIgi6+vluDfhBYTjPkClXYseU1q5svh54U+g69cjEOtAatXCPUwGyH9+jyyOKf4A8vKCrgf0B3Jz5SeNKgPW1pSqH0ve95v3TyEJlBMhOJj19XPcm/ACwnFvoB7LsLCQ3ssdC7JuHe2DbKBzZwxCNCCV/u/jJT2l7oAoBkX55wFpaXaO1ocAKyvYYTQgCB+bQ/yEBgIbNoTVDiaEDBzI+r5w3L/xAsJxADRjGX7ZYc2BadNED7EJMGECsYEMMDd/27P8V3qMBFJTK6S4dwJMTclF/AAYG7//3dR/vrcl8ooqiXiCtm69cH2gIxEiIljfLY4DeAHhDFwl+x+eUdqlixhI7ICffkIMWQyUL/+2xzvOt/EBcnJq2VfuD4iibK9w5I2D5a8UtVD8RyTdCRQUXAq/1jjbaP/+E16fdlAUhoayvm8cBwAf3bTmOF3k9/nPdajo4+OXPTebiufPi8GSKsDu3W8rHKY1TcYDBQXNPw2kQGpqUP0qjwG5/H2FQ6PIhWMSuQhQmtQy5Wmhc3T04sxVafFSUTzhdWb7y/vduwN9/R63bNeO9X3kOIC3QDg9579jWXcqKhTKgtzjID/9hBaqCkCfPqQhugEy2f+2EYRQwRkQxVoufuVBX7509ndQglhakt+ppfrxpaPwd2UcfZaUtMl2V8Ok9Upl8ukX4wv6lSv3hocq8SQ2FrDun781IAD4qW3Fn/PzWd9nzjDxAsLpmRmUUkGoONG0PzBlCqmFxcDUqWQ61gGmpm97lq/cbRGQluaX45UPmJigMz0EmJi8790+totKnEK7AVlZx41PL077ND7+b9Pr+zO/9vX98Fegz0nA+PHA5qOuGQsXsrnXnKHjBYTTCxVfLAqitEsXadOC34Bly8R8Ev6udRlWV82PA3l5gdcDPgVyc012GzkD1tallY8OJH0Alerx/sc/5F+4d2/ntAOXkk75+lIlTUAvieQjXnIXpmdmApJc1a8+PsAG4kmePy+Tm81xr/ACwumkCj/Oz6PU21uylgYAGzbAAylASMjb1mUYHTdqASiVIVFVg4CMDMt9ilD1NFv6RXGm2b6vBZIxJbOquO/hw/CTu2wTr9raZnfJ7qYcbGFRgrdiB9m5ejWwqcB13IgRpXrTOe5/8ALC6QT/HTMoFRWKwiHyUSBhYRIzdAEGDaKW5DJgZPSfJ7zaMqRaeR8VkJrqcd3pM0ChQD10fOPjS4i4WoygSSkpe+b8MeXlj5mZ9z97PDhnhIdHKd6aPxEpigCZiL8DA4HwSW4LoqJK8f047h+8gHBa6tVYxncKOejYsd', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.SysNoticeMapper.insertNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_notice (     notice_title,       notice_type,       notice_content,       status,             create_by,      create_time    )values(     ?,       ?,       ?,       ?,             ?,      sysdate()   )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\n; Data truncation: Data too long for column \'notice_content\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1', '2020-09-01 14:23:21');
INSERT INTO `sys_oper_log` VALUES (123, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"主框架页-侧边栏主题\",\"remark\":\"深色主题theme-dark，浅色主题theme-light\",\"updateTime\":1521171180000,\"configType\":\"Y\",\"configValue\":\"theme-light\",\"params\":{},\"configKey\":\"sys.index.sideTheme\",\"createBy\":\"admin\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"configId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:38:36');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:44:52');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:44:57');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1051', '127.0.0.1', '内网IP', '{menuId=1051}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:45:02');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1054', '127.0.0.1', '内网IP', '{menuId=1054}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:45:14');
INSERT INTO `sys_oper_log` VALUES (128, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,109,1046,1047,1048,111,112,113,114,1055,1056,1058,1057,1059,1060,115,4,2,3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:32');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:39');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1050', '127.0.0.1', '内网IP', '{menuId=1050}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:42');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1051', '127.0.0.1', '内网IP', '{menuId=1051}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:45');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1052', '127.0.0.1', '内网IP', '{menuId=1052}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:47');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1053', '127.0.0.1', '内网IP', '{menuId=1053}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:50');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1054', '127.0.0.1', '内网IP', '{menuId=1054}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:53');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:46:56');
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,109,1046,1047,1048,112,113,114,1055,1056,1058,1057,1059,1060,115,4,2,3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:49:19');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{menuId=111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:49:26');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:51:11');
INSERT INTO `sys_oper_log` VALUES (139, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,112,113,114,1055,1056,1058,1057,1059,1060,4,3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:51:29');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:51:44');
INSERT INTO `sys_oper_log` VALUES (141, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,112,113,114,1055,1056,1058,1057,1059,1060,4,1,3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:53:37');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/107', '127.0.0.1', '内网IP', '{menuId=107}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:54:08');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1036', '127.0.0.1', '内网IP', '{menuId=1036}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:54:14');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1037', '127.0.0.1', '内网IP', '{menuId=1037}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:54:17');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1038', '127.0.0.1', '内网IP', '{menuId=1038}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:54:21');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1039', '127.0.0.1', '内网IP', '{menuId=1039}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:54:23');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/107', '127.0.0.1', '内网IP', '{menuId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:55:25');
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:56:01');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:56:17');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1017', '127.0.0.1', '内网IP', '{menuId=1017}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:56:22');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-09-01 14:56:46');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1018', '127.0.0.1', '内网IP', '{menuId=1018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:56:48');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1019', '127.0.0.1', '内网IP', '{menuId=1019}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:56:51');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1020', '127.0.0.1', '内网IP', '{menuId=1020}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:56:54');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:56:58');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1025', '127.0.0.1', '内网IP', '{menuId=1025}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:01');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1021', '127.0.0.1', '内网IP', '{menuId=1021}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:04');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1022', '127.0.0.1', '内网IP', '{menuId=1022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:06');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1023', '127.0.0.1', '内网IP', '{menuId=1023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:09');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1024', '127.0.0.1', '内网IP', '{menuId=1024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:11');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/104', '127.0.0.1', '内网IP', '{menuId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:14');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1029', '127.0.0.1', '内网IP', '{menuId=1029}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:23');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1027', '127.0.0.1', '内网IP', '{menuId=1027}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:25');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1026', '127.0.0.1', '内网IP', '{menuId=1026}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:28');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1028', '127.0.0.1', '内网IP', '{menuId=1028}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:30');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1030', '127.0.0.1', '内网IP', '{menuId=1030}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:33');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/105', '127.0.0.1', '内网IP', '{menuId=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:36');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1031', '127.0.0.1', '内网IP', '{menuId=1031}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:52');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1032', '127.0.0.1', '内网IP', '{menuId=1032}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:55');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1034', '127.0.0.1', '内网IP', '{menuId=1034}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:57');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1033', '127.0.0.1', '内网IP', '{menuId=1033}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:57:59');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1035', '127.0.0.1', '内网IP', '{menuId=1035}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:58:01');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/106', '127.0.0.1', '内网IP', '{menuId=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:58:04');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-01 14:58:17');
INSERT INTO `sys_oper_log` VALUES (175, '用户管理', 5, 'SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"05ae5a1c-a968-4d84-afb5-f45bb36f1d79_用户数据.xlsx\",\"code\":200}', 0, NULL, '2020-09-02 14:26:03');
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"userId\":1,\"status\":\"1\"}', 'null', 1, '不允许操作超级管理员用户', '2020-09-02 14:58:38');
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":2,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-02 14:58:41');
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"$2a$10$7AQPSKNNF576n5p8So/Np.VjOgQ.pvpYNQ.8hBspfxSYgLc0CaBUa\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"sun 测试\",\"sex\":\"0\",\"params\":{},\"userName\":\"sun\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:35:56');
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":3,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:36:39');
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:36:41');
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"sun 测试1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"sun\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1599114956000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:36:48');
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 2, 'SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$A6l/D1aiRsGvhLpTBWjSFuKU2J22KDFiYqorGp7nV7oyiVdqVRzbW\",\"updateBy\":\"admin\",\"params\":{},\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:36:55');
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 3, 'SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/3', '127.0.0.1', '内网IP', '{userIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:36:58');
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 5, 'SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', 'null', 1, '导出Excel失败，请联系网站管理员！', '2020-09-03 14:37:07');
INSERT INTO `sys_oper_log` VALUES (185, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"createBy\":\"admin\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (186, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"新增角色\'1\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (187, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":5,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"createBy\":\"admin\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (188, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"新增角色\'1\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (189, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"新增角色\'1\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (190, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"createBy\":\"admin\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (191, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":6,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"createBy\":\"admin\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (192, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"新增角色\'1\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2020-09-03 14:37:26');
INSERT INTO `sys_oper_log` VALUES (193, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"remark\":\"1\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"createTime\":1599115041000,\"roleKey\":\"1\",\"roleName\":\"1\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,112,3,113,2000,2001,2002,2003,2004,2005,114,1055,1056,1058,1057,1059,1060],\"status\":\"0\"}', '{\"msg\":\"修改角色\'1\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2020-09-03 14:56:33');
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[3,113,2000,2001,2002,2003,2004,2005,114,1055,1056,1058,1057,1059,1060],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:56:43');
INSERT INTO `sys_oper_log` VALUES (195, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[113,2002,2003,2004,2005,114,1055,1056,1058,1057,1059,1060,3,2000],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:56:48');
INSERT INTO `sys_oper_log` VALUES (196, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/5', '127.0.0.1', '内网IP', '{roleIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:59:07');
INSERT INTO `sys_oper_log` VALUES (197, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/6', '127.0.0.1', '内网IP', '{roleIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:59:09');
INSERT INTO `sys_oper_log` VALUES (198, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/3', '127.0.0.1', '内网IP', '{roleIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 14:59:10');
INSERT INTO `sys_oper_log` VALUES (199, '在线用户', 7, 'com.sixsixsix516.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, NULL, NULL, '/monitor/online/28b9a724-49cf-4df3-89a1-1c62fd3c5fb1', '127.0.0.1', '内网IP', '{tokenId=28b9a724-49cf-4df3-89a1-1c62fd3c5fb1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 15:03:50');
INSERT INTO `sys_oper_log` VALUES (200, '用户管理', 2, 'SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$8ZJdqOtx/Mk8brrzzJPFIuZOLr192Fj7sQtvVyklVa3GYv7aVW3qW\",\"updateBy\":\"admin\",\"params\":{},\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 15:04:54');
INSERT INTO `sys_oper_log` VALUES (201, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 15:05:11');
INSERT INTO `sys_oper_log` VALUES (202, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,112,113,2002,2003,2004,2005,114,1055,1056,1058,1057,1059,1060,3,2000],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 15:05:37');
INSERT INTO `sys_oper_log` VALUES (203, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2,109,1046,1047,1048,112],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 15:05:46');
INSERT INTO `sys_oper_log` VALUES (204, '在线用户', 7, 'com.sixsixsix516.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/monitor/online/8fdf1bf0-bf46-404d-8832-84e04eebf6ed', '127.0.0.1', '内网IP', '{tokenId=8fdf1bf0-bf46-404d-8832-84e04eebf6ed}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 15:07:00');
INSERT INTO `sys_oper_log` VALUES (205, '在线用户', 7, 'com.sixsixsix516.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/monitor/online/09950868-b98a-4555-a660-66bbb7e277cd', '127.0.0.1', '内网IP', '{tokenId=09950868-b98a-4555-a660-66bbb7e277cd}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-03 15:07:13');
INSERT INTO `sys_oper_log` VALUES (206, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"1\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"1\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:48:09');
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"1\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"1\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:48:19');
INSERT INTO `sys_oper_log` VALUES (208, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"1\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"1\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:48:21');
INSERT INTO `sys_oper_log` VALUES (209, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"1\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"1\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:48:21');
INSERT INTO `sys_oper_log` VALUES (210, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:35');
INSERT INTO `sys_oper_log` VALUES (211, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:39');
INSERT INTO `sys_oper_log` VALUES (212, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:40');
INSERT INTO `sys_oper_log` VALUES (213, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:40');
INSERT INTO `sys_oper_log` VALUES (214, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:40');
INSERT INTO `sys_oper_log` VALUES (215, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:40');
INSERT INTO `sys_oper_log` VALUES (216, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:40');
INSERT INTO `sys_oper_log` VALUES (217, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:40');
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:41');
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:41');
INSERT INTO `sys_oper_log` VALUES (220, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"11\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:50:41');
INSERT INTO `sys_oper_log` VALUES (221, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"1111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"2\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:51:14');
INSERT INTO `sys_oper_log` VALUES (222, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:51:56');
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:52:00');
INSERT INTO `sys_oper_log` VALUES (224, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:52:00');
INSERT INTO `sys_oper_log` VALUES (225, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:52:00');
INSERT INTO `sys_oper_log` VALUES (226, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:52:00');
INSERT INTO `sys_oper_log` VALUES (227, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:52:00');
INSERT INTO `sys_oper_log` VALUES (228, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:52:00');
INSERT INTO `sys_oper_log` VALUES (229, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 16:52:01');
INSERT INTO `sys_oper_log` VALUES (230, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:01:32');
INSERT INTO `sys_oper_log` VALUES (231, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"\\n1\",\"password\":\"111\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:01:39');
INSERT INTO `sys_oper_log` VALUES (232, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"},{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"},{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"2\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"status\":\"0\"},{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"status\":\"0\"},{\"flag\":false,\"roleId\":5,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"2\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"status\":\"0\"},{\"flag\":false,\"roleId\":6,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"2\",\"params\":{},\"roleSort\":\"0\",\"roleKey\":\"1\",\"roleName\":\"1\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"123156\",\"password\":\"31\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"six\",\"roleIds\":[]}', '{\"code\":-1,\"message\":\"新增用户\'six\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:02:24');
INSERT INTO `sys_oper_log` VALUES (233, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"111\",\"password\":\"132456\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"111\",\"sex\":\"0\",\"params\":{},\"userName\":\"six\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'six\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:03:48');
INSERT INTO `sys_oper_log` VALUES (234, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"12123\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"sb\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'sb\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:04:39');
INSERT INTO `sys_oper_log` VALUES (235, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"12123\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"sb\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'sb\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:04:44');
INSERT INTO `sys_oper_log` VALUES (236, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"12123\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"sb\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'sb\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:04:44');
INSERT INTO `sys_oper_log` VALUES (237, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"12123\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"sb\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'sb\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:04:44');
INSERT INTO `sys_oper_log` VALUES (238, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"12123\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"sb\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'sb\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:04:45');
INSERT INTO `sys_oper_log` VALUES (239, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"12123\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"sb\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'sb\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:04:45');
INSERT INTO `sys_oper_log` VALUES (240, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"1\",\"password\":\"12123\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"params\":{},\"userName\":\"sb\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'sb\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:04:45');
INSERT INTO `sys_oper_log` VALUES (241, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289363351\",\"admin\":false,\"password\":\"$2a$10$vDrPXEPdppvGh8r5oUw5hueAvtqZ0G6o/OwJzekW2jPlm1ReNX3rC\",\"postIds\":[],\"email\":\"sixsix516@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"123\",\"userId\":4,\"createBy\":\"admin\",\"roleIds\":[],\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:05:13');
INSERT INTO `sys_oper_log` VALUES (242, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289363351\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix516@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"123\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'123\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:14');
INSERT INTO `sys_oper_log` VALUES (243, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix516@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，邮箱账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:23');
INSERT INTO `sys_oper_log` VALUES (244, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"$2a$10$654WK0M.42nnx2hroBkLyOPmQ3/KvNN3N9g41sRffE.862K9d2IMG\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"userId\":5,\"createBy\":\"admin\",\"roleIds\":[],\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:05:28');
INSERT INTO `sys_oper_log` VALUES (245, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:30');
INSERT INTO `sys_oper_log` VALUES (246, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:30');
INSERT INTO `sys_oper_log` VALUES (247, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:31');
INSERT INTO `sys_oper_log` VALUES (248, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:31');
INSERT INTO `sys_oper_log` VALUES (249, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:32');
INSERT INTO `sys_oper_log` VALUES (250, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:32');
INSERT INTO `sys_oper_log` VALUES (251, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:32');
INSERT INTO `sys_oper_log` VALUES (252, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289311111\",\"admin\":false,\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsix512226@163.com\",\"nickName\":\"sun\",\"sex\":\"0\",\"params\":{},\"userName\":\"1\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'1\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:05:33');
INSERT INTO `sys_oper_log` VALUES (253, '用户管理', 3, 'SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/5', '127.0.0.1', '内网IP', '{userIds=5}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:05:41');
INSERT INTO `sys_oper_log` VALUES (254, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":4,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:05:53');
INSERT INTO `sys_oper_log` VALUES (255, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/4', '127.0.0.1', '内网IP', '{roleIds=4}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:11:01');
INSERT INTO `sys_oper_log` VALUES (256, '角色管理', 2, 'SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"status\":\"1\"}', 'null', 1, '不允许操作超级管理员角色', '2020-09-04 17:22:36');
INSERT INTO `sys_oper_log` VALUES (257, '角色管理', 2, 'SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:22:39');
INSERT INTO `sys_oper_log` VALUES (258, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleName\":\"普通角色2\",\"menuIds\":[],\"status\":\"1\"}', '{\"code\":0,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:23:43');
INSERT INTO `sys_oper_log` VALUES (259, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleName\":\"普通角色3\",\"menuIds\":[],\"status\":\"1\"}', '{\"code\":0,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:24:29');
INSERT INTO `sys_oper_log` VALUES (260, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleName\":\"普通角色3\",\"menuIds\":[],\"status\":\"1\"}', '{\"code\":0,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:24:31');
INSERT INTO `sys_oper_log` VALUES (261, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":7,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"createBy\":\"admin\",\"roleName\":\"111\",\"menuIds\":[],\"status\":\"0\"}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:24:51');
INSERT INTO `sys_oper_log` VALUES (262, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"1\",\"params\":{},\"roleSort\":\"0\",\"roleName\":\"111\",\"menuIds\":[2,109,1046,1047,1048,112],\"status\":\"0\"}', '{\"code\":-1,\"message\":\"新增角色\'111\'失败，角色名称已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:24:53');
INSERT INTO `sys_oper_log` VALUES (263, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/7', '127.0.0.1', '内网IP', '{roleIds=7}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:25:00');
INSERT INTO `sys_oper_log` VALUES (264, '角色管理', 2, 'SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleName\":\"普通角色4\",\"menuIds\":[],\"status\":\"1\"}', '{\"code\":0,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:26:48');
INSERT INTO `sys_oper_log` VALUES (265, '角色管理', 2, 'SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:26:52');
INSERT INTO `sys_oper_log` VALUES (266, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"createBy\":\"admin\",\"roleName\":\"测试角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,112,3,113,2000,2001,2002,2003,2004,2005,114,1055,1056,1058,1057,1059,1060],\"status\":\"0\"}', '{\"code\":0,\"data\":50,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:27:10');
INSERT INTO `sys_oper_log` VALUES (267, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13259545455\",\"admin\":false,\"remark\":\"1\",\"password\":\"$2a$10$vC9K6Xz7iQwnRnvzw02mg.tONVwXwuZ8K9qTjLKc3dIq.qfWHnnA6\",\"postIds\":[],\"email\":\"sixsixs@151.com\",\"nickName\":\"管理员2222\",\"sex\":\"0\",\"params\":{},\"userName\":\"测试名称\",\"userId\":6,\"createBy\":\"admin\",\"roleIds\":[],\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:28:02');
INSERT INTO `sys_oper_log` VALUES (268, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13259545455\",\"admin\":false,\"remark\":\"1\",\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsixs@151.com\",\"nickName\":\"管理员2222\",\"sex\":\"0\",\"params\":{},\"userName\":\"测试名称\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'测试名称\'失败，登录账号已存在\",\"total\":0}', 0, NULL, '2020-09-04 17:28:40');
INSERT INTO `sys_oper_log` VALUES (269, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13245485454\",\"admin\":false,\"remark\":\"11\",\"password\":\"$2a$10$nY.aKzmLXtqxIelVDzfO3OhgXXyRGswUw9iBC6J1VUD5jeeEHr8GG\",\"postIds\":[],\"email\":\"12six@163.com\",\"nickName\":\"23123\",\"sex\":\"0\",\"params\":{},\"userName\":\"21\",\"userId\":7,\"createBy\":\"admin\",\"roleIds\":[],\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:30:59');
INSERT INTO `sys_oper_log` VALUES (270, '用户管理', 3, 'SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/6,4,2', '127.0.0.1', '内网IP', '{userIds=6,4,2}', '{\"code\":0,\"data\":3,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:31:07');
INSERT INTO `sys_oper_log` VALUES (271, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":7,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:31:18');
INSERT INTO `sys_oper_log` VALUES (272, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":7,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:31:31');
INSERT INTO `sys_oper_log` VALUES (273, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":7,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:32:58');
INSERT INTO `sys_oper_log` VALUES (274, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"userId\":1,\"status\":0}', 'null', 1, '不允许操作超级管理员用户', '2020-09-04 17:38:57');
INSERT INTO `sys_oper_log` VALUES (275, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":7,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:38:59');
INSERT INTO `sys_oper_log` VALUES (276, '角色管理', 2, 'SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-04 17:39:08');
INSERT INTO `sys_oper_log` VALUES (277, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"111\",\"password\":\"$2a$10$NNQ6UMR/ZeM5WBZjb638MeWp8qVgmma0yxyp7V5UOyupN62CRL.UW\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"SUN测试\",\"sex\":\"0\",\"params\":{},\"userName\":\"SUN用户名\",\"userId\":8,\"createBy\":\"admin\",\"roleIds\":[],\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:25:51');
INSERT INTO `sys_oper_log` VALUES (278, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":8,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:25:55');
INSERT INTO `sys_oper_log` VALUES (279, '角色管理', 2, 'SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:27:15');
INSERT INTO `sys_oper_log` VALUES (280, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":8,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:35:34');
INSERT INTO `sys_oper_log` VALUES (281, '用户管理', 3, 'SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/8,7', '127.0.0.1', '内网IP', '{userIds=8,7}', '{\"code\":0,\"data\":2,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:35:43');
INSERT INTO `sys_oper_log` VALUES (282, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"111\",\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"测试\",\"sex\":\"0\",\"params\":{},\"userName\":\"测试\",\"roleIds\":[8],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'测试\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-11 14:36:12');
INSERT INTO `sys_oper_log` VALUES (283, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"测试\",\"sex\":\"0\",\"params\":{},\"userName\":\"测试\",\"roleIds\":[8],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'测试\'失败，邮箱账号已存在\",\"total\":0}', 0, NULL, '2020-09-11 14:36:20');
INSERT INTO `sys_oper_log` VALUES (284, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"password\":\"$2a$10$6/zBaXDM89WjEAKqjzOOJeSz7ZIVFwAMDpNNO0gIsm4a1jLWJrDNe\",\"postIds\":[],\"email\":\"sixsixsix517@163.com\",\"nickName\":\"测试\",\"sex\":\"0\",\"params\":{},\"userName\":\"测试\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[8],\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:36:25');
INSERT INTO `sys_oper_log` VALUES (285, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"\",\"email\":\"sixsixsix517@163.com\",\"nickName\":\"测试\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"测试\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1599806185000,\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'测试\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-11 14:36:35');
INSERT INTO `sys_oper_log` VALUES (286, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"\",\"email\":\"sixsixsix517@163.com\",\"nickName\":\"测试2\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"测试\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[8],\"createTime\":1599806185000,\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'测试\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2020-09-11 14:36:46');
INSERT INTO `sys_oper_log` VALUES (287, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix517@163.com\",\"nickName\":\"测试2\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"测试\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[8],\"createTime\":1599806185000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:37:49');
INSERT INTO `sys_oper_log` VALUES (288, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix517@163.com\",\"nickName\":\"测试1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"测试\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[8],\"createTime\":1599806185000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:42:07');
INSERT INTO `sys_oper_log` VALUES (289, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":9,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:48:28');
INSERT INTO `sys_oper_log` VALUES (290, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix517@163.com\",\"nickName\":\"测试2\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"测试\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[8],\"createTime\":1599806185000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:48:42');
INSERT INTO `sys_oper_log` VALUES (291, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"13289333517\",\"admin\":false,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix517@163.com\",\"nickName\":\"测试1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"测试\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[8],\"createTime\":1599806185000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:48:59');
INSERT INTO `sys_oper_log` VALUES (292, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"roleName\":\"111\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,112,3,113,2000,2001,2002,2003,2004,2005,114,1055,1056,1058,1057,1059,1060],\"status\":\"0\"}', '{\"code\":-1,\"message\":\"新增角色\'111\'失败，角色名称已存在\",\"total\":0}', 0, NULL, '2020-09-11 14:49:19');
INSERT INTO `sys_oper_log` VALUES (293, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":9,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"createBy\":\"admin\",\"roleName\":\"222\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,112,3,113,2000,2001,2002,2003,2004,2005,114,1055,1056,1058,1057,1059,1060],\"status\":\"0\"}', '{\"code\":0,\"data\":50,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:49:32');
INSERT INTO `sys_oper_log` VALUES (294, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"avatar\":\"\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1,9],\"createTime\":1521171180000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2020-09-11 14:49:40');
INSERT INTO `sys_oper_log` VALUES (295, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"userId\":1,\"status\":0}', 'null', 1, '不允许操作超级管理员用户', '2021-06-06 16:10:38');
INSERT INTO `sys_oper_log` VALUES (296, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":9,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:10:43');
INSERT INTO `sys_oper_log` VALUES (297, '用户管理', 3, 'SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/9', '127.0.0.1', '内网IP', '{userIds=9}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:27:49');
INSERT INTO `sys_oper_log` VALUES (298, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号\",\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"userName\":\"孙琳\",\"roleIds\":[1],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'孙琳\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2021-06-06 16:28:49');
INSERT INTO `sys_oper_log` VALUES (299, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号\",\"password\":\"123456\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"userName\":\"孙琳\",\"roleIds\":[1],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'孙琳\'失败，手机号码已存在\",\"total\":0}', 0, NULL, '2021-06-06 16:28:55');
INSERT INTO `sys_oper_log` VALUES (300, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号\",\"password\":\"$2a$10$3usS06ZT8/CWotsSpQYeouo1CE7mHd/mm.BDj5GR2UeHzP8SWoQbS\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:32:10');
INSERT INTO `sys_oper_log` VALUES (301, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"userId\":1,\"status\":0}', 'null', 1, '不允许操作超级管理员用户', '2021-06-06 16:32:37');
INSERT INTO `sys_oper_log` VALUES (302, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"userId\":10,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:33:00');
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"userId\":10,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:33:05');
INSERT INTO `sys_oper_log` VALUES (304, '用户管理', 1, 'SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13289333519\",\"admin\":false,\"password\":\"12e\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"nickName\":\"1\",\"sex\":\"0\",\"userName\":\"12323\",\"roleIds\":[],\"status\":0}', '{\"code\":-1,\"message\":\"新增用户\'12323\'失败，邮箱账号已存在\",\"total\":0}', 0, NULL, '2021-06-06 16:34:39');
INSERT INTO `sys_oper_log` VALUES (305, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:36:52');
INSERT INTO `sys_oper_log` VALUES (306, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:42:41');
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:42:56');
INSERT INTO `sys_oper_log` VALUES (308, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 16:43:23');
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:06:22');
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:08:55');
INSERT INTO `sys_oper_log` VALUES (311, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:10:45');
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:13:34');
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:16:51');
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'roles\' in \'field list\'\r\n### The error may exist in com/sixsixsix516/mapper/system/SysUserMapper.java (best guess)\r\n### The error may involve com.sixsixsix516.mapper.system.SysUserMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE sys_user  SET user_name=?, nick_name=?, email=?, phonenumber=?, sex=?, avatar=?, password=?,  status=?, del_flag=?, login_ip=?,  roles=?, role_ids=?  WHERE user_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'roles\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'roles\' in \'field list\'', '2021-06-06 17:24:16');
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"0\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:25:10');
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"1\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:25:22');
INSERT INTO `sys_oper_log` VALUES (317, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"1\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:25:30');
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"userId\":10,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:27:47');
INSERT INTO `sys_oper_log` VALUES (319, '角色管理', 2, 'SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":9,\"admin\":false,\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:28:27');
INSERT INTO `sys_oper_log` VALUES (320, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/9', '127.0.0.1', '内网IP', '{roleIds=9}', 'null', 1, '222已分配,不能删除', '2021-06-06 17:28:44');
INSERT INTO `sys_oper_log` VALUES (321, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/9', '127.0.0.1', '内网IP', '{roleIds=9}', 'null', 1, '222已分配,不能删除', '2021-06-06 17:28:48');
INSERT INTO `sys_oper_log` VALUES (322, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/8', '127.0.0.1', '内网IP', '{roleIds=8}', 'null', 1, '测试角色已分配,不能删除', '2021-06-06 17:28:53');
INSERT INTO `sys_oper_log` VALUES (323, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"},{\"flag\":false,\"roleId\":9,\"admin\":false,\"roleSort\":\"0\",\"roleName\":\"222\",\"status\":\"1\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"avatar\":\"\",\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:29:28');
INSERT INTO `sys_oper_log` VALUES (324, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"13289333516\",\"admin\":false,\"remark\":\"这是一个测试的账号1\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"nickName\":\"社会主义接班人\",\"sex\":\"1\",\"avatar\":\"\",\"userName\":\"孙琳\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1622968329000,\"status\":1}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:29:31');
INSERT INTO `sys_oper_log` VALUES (325, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/9', '127.0.0.1', '内网IP', '{roleIds=9}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 17:29:36');
INSERT INTO `sys_oper_log` VALUES (326, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/8', '127.0.0.1', '内网IP', '{roleIds=8}', 'null', 1, '测试角色已分配,不能删除', '2021-06-06 17:29:40');
INSERT INTO `sys_oper_log` VALUES (327, '角色管理', 3, 'SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/8', '127.0.0.1', '内网IP', '{roleIds=8}', 'null', 1, '测试角色已分配,不能删除', '2021-06-06 17:30:39');
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 1, 'SysUserController.add()', 'POST', 1, NULL, NULL, '/system/user', '127.0.0.1', '内网IP', '{\"sex\":\"0\",\"admin\":false,\"updateTime\":1622975150208,\"userId\":11,\"realname\":\"孙琳\",\"password\":\"$2a$10$rm//RZdf0OwwCxvLsBfa7eg4wlGo7noHmiEeIz.W5Ly5jJs96pKSi\",\"roleIds\":[1],\"createTime\":1622975150208,\"phone\":\"13289333516\",\"postIds\":[],\"email\":\"sixsixsix516@163.com\",\"status\":0}', '{\"code\":0,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 18:25:50');
INSERT INTO `sys_oper_log` VALUES (329, '用户管理', 2, 'SysUserController.changeStatus()', 'PUT', 1, NULL, NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateTime\":1622975166416,\"userId\":11,\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 18:26:05');
INSERT INTO `sys_oper_log` VALUES (330, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"sex\":\"1\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"updateTime\":1622976621012,\"avatar\":\"\",\"userId\":1,\"realname\":\"admin\",\"createBy\":\"admin\",\"password\":\"\",\"roleIds\":[1],\"createTime\":\"2018-03-16 11:33:00\",\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 18:50:20');
INSERT INTO `sys_oper_log` VALUES (331, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"sex\":\"1\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"updateTime\":1622976693668,\"avatar\":\"\",\"userId\":1,\"realname\":\"admin\",\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":\"2018-03-16 11:33:00\",\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 18:51:33');
INSERT INTO `sys_oper_log` VALUES (332, '角色管理', 1, 'SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":10,\"admin\":false,\"remark\":\"医生角色\",\"updateTime\":1622976786117,\"roleSort\":\"1\",\"createBy\":\"admin\",\"createTime\":1622976786117,\"roleName\":\"医生\",\"menuIds\":[2000,2001,2002,2003,2004,2005,3],\"status\":\"0\"}', '{\"code\":0,\"data\":7,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 18:53:05');
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 2, 'SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"roleSort\":\"1\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"sex\":\"0\",\"admin\":false,\"updateTime\":1622976989145,\"avatar\":\"\",\"userId\":11,\"realname\":\"孙琳\",\"createBy\":\"\",\"roleIds\":[1,10],\"createTime\":\"2021-06-06 18:25:50\",\"phone\":\"13289333516\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"sixsixsix516@163.com\",\"status\":0}', '{\"code\":0,\"data\":1,\"message\":\"请求成功\",\"total\":0}', 0, NULL, '2021-06-06 18:56:28');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
                             `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                             `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
                             `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
                             `post_sort` int(4) NOT NULL COMMENT '显示顺序',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                             `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
                             `role_sort` int(4) NOT NULL COMMENT '显示顺序',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (10, '医生', 1, '0', '0', 'admin', '2021-06-06 18:53:05', '', NULL, '医生角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 101);
INSERT INTO `sys_role_menu` VALUES (4, 102);
INSERT INTO `sys_role_menu` VALUES (4, 108);
INSERT INTO `sys_role_menu` VALUES (4, 500);
INSERT INTO `sys_role_menu` VALUES (4, 501);
INSERT INTO `sys_role_menu` VALUES (4, 1001);
INSERT INTO `sys_role_menu` VALUES (4, 1002);
INSERT INTO `sys_role_menu` VALUES (4, 1003);
INSERT INTO `sys_role_menu` VALUES (4, 1004);
INSERT INTO `sys_role_menu` VALUES (4, 1005);
INSERT INTO `sys_role_menu` VALUES (4, 1006);
INSERT INTO `sys_role_menu` VALUES (4, 1007);
INSERT INTO `sys_role_menu` VALUES (4, 1008);
INSERT INTO `sys_role_menu` VALUES (4, 1009);
INSERT INTO `sys_role_menu` VALUES (4, 1010);
INSERT INTO `sys_role_menu` VALUES (4, 1011);
INSERT INTO `sys_role_menu` VALUES (4, 1012);
INSERT INTO `sys_role_menu` VALUES (4, 1013);
INSERT INTO `sys_role_menu` VALUES (4, 1014);
INSERT INTO `sys_role_menu` VALUES (4, 1015);
INSERT INTO `sys_role_menu` VALUES (4, 1016);
INSERT INTO `sys_role_menu` VALUES (4, 1040);
INSERT INTO `sys_role_menu` VALUES (4, 1041);
INSERT INTO `sys_role_menu` VALUES (4, 1042);
INSERT INTO `sys_role_menu` VALUES (4, 1043);
INSERT INTO `sys_role_menu` VALUES (4, 1044);
INSERT INTO `sys_role_menu` VALUES (4, 1045);
INSERT INTO `sys_role_menu` VALUES (5, 1);
INSERT INTO `sys_role_menu` VALUES (5, 100);
INSERT INTO `sys_role_menu` VALUES (5, 101);
INSERT INTO `sys_role_menu` VALUES (5, 102);
INSERT INTO `sys_role_menu` VALUES (5, 108);
INSERT INTO `sys_role_menu` VALUES (5, 500);
INSERT INTO `sys_role_menu` VALUES (5, 501);
INSERT INTO `sys_role_menu` VALUES (5, 1001);
INSERT INTO `sys_role_menu` VALUES (5, 1002);
INSERT INTO `sys_role_menu` VALUES (5, 1003);
INSERT INTO `sys_role_menu` VALUES (5, 1004);
INSERT INTO `sys_role_menu` VALUES (5, 1005);
INSERT INTO `sys_role_menu` VALUES (5, 1006);
INSERT INTO `sys_role_menu` VALUES (5, 1007);
INSERT INTO `sys_role_menu` VALUES (5, 1008);
INSERT INTO `sys_role_menu` VALUES (5, 1009);
INSERT INTO `sys_role_menu` VALUES (5, 1010);
INSERT INTO `sys_role_menu` VALUES (5, 1011);
INSERT INTO `sys_role_menu` VALUES (5, 1012);
INSERT INTO `sys_role_menu` VALUES (5, 1013);
INSERT INTO `sys_role_menu` VALUES (5, 1014);
INSERT INTO `sys_role_menu` VALUES (5, 1015);
INSERT INTO `sys_role_menu` VALUES (5, 1016);
INSERT INTO `sys_role_menu` VALUES (5, 1040);
INSERT INTO `sys_role_menu` VALUES (5, 1041);
INSERT INTO `sys_role_menu` VALUES (5, 1042);
INSERT INTO `sys_role_menu` VALUES (5, 1043);
INSERT INTO `sys_role_menu` VALUES (5, 1044);
INSERT INTO `sys_role_menu` VALUES (5, 1045);
INSERT INTO `sys_role_menu` VALUES (6, 1);
INSERT INTO `sys_role_menu` VALUES (6, 100);
INSERT INTO `sys_role_menu` VALUES (6, 101);
INSERT INTO `sys_role_menu` VALUES (6, 102);
INSERT INTO `sys_role_menu` VALUES (6, 108);
INSERT INTO `sys_role_menu` VALUES (6, 500);
INSERT INTO `sys_role_menu` VALUES (6, 501);
INSERT INTO `sys_role_menu` VALUES (6, 1001);
INSERT INTO `sys_role_menu` VALUES (6, 1002);
INSERT INTO `sys_role_menu` VALUES (6, 1003);
INSERT INTO `sys_role_menu` VALUES (6, 1004);
INSERT INTO `sys_role_menu` VALUES (6, 1005);
INSERT INTO `sys_role_menu` VALUES (6, 1006);
INSERT INTO `sys_role_menu` VALUES (6, 1007);
INSERT INTO `sys_role_menu` VALUES (6, 1008);
INSERT INTO `sys_role_menu` VALUES (6, 1009);
INSERT INTO `sys_role_menu` VALUES (6, 1010);
INSERT INTO `sys_role_menu` VALUES (6, 1011);
INSERT INTO `sys_role_menu` VALUES (6, 1012);
INSERT INTO `sys_role_menu` VALUES (6, 1013);
INSERT INTO `sys_role_menu` VALUES (6, 1014);
INSERT INTO `sys_role_menu` VALUES (6, 1015);
INSERT INTO `sys_role_menu` VALUES (6, 1016);
INSERT INTO `sys_role_menu` VALUES (6, 1040);
INSERT INTO `sys_role_menu` VALUES (6, 1041);
INSERT INTO `sys_role_menu` VALUES (6, 1042);
INSERT INTO `sys_role_menu` VALUES (6, 1043);
INSERT INTO `sys_role_menu` VALUES (6, 1044);
INSERT INTO `sys_role_menu` VALUES (6, 1045);
INSERT INTO `sys_role_menu` VALUES (8, 1);
INSERT INTO `sys_role_menu` VALUES (8, 2);
INSERT INTO `sys_role_menu` VALUES (8, 3);
INSERT INTO `sys_role_menu` VALUES (8, 100);
INSERT INTO `sys_role_menu` VALUES (8, 101);
INSERT INTO `sys_role_menu` VALUES (8, 102);
INSERT INTO `sys_role_menu` VALUES (8, 108);
INSERT INTO `sys_role_menu` VALUES (8, 109);
INSERT INTO `sys_role_menu` VALUES (8, 112);
INSERT INTO `sys_role_menu` VALUES (8, 113);
INSERT INTO `sys_role_menu` VALUES (8, 114);
INSERT INTO `sys_role_menu` VALUES (8, 500);
INSERT INTO `sys_role_menu` VALUES (8, 501);
INSERT INTO `sys_role_menu` VALUES (8, 1001);
INSERT INTO `sys_role_menu` VALUES (8, 1002);
INSERT INTO `sys_role_menu` VALUES (8, 1003);
INSERT INTO `sys_role_menu` VALUES (8, 1004);
INSERT INTO `sys_role_menu` VALUES (8, 1005);
INSERT INTO `sys_role_menu` VALUES (8, 1006);
INSERT INTO `sys_role_menu` VALUES (8, 1007);
INSERT INTO `sys_role_menu` VALUES (8, 1008);
INSERT INTO `sys_role_menu` VALUES (8, 1009);
INSERT INTO `sys_role_menu` VALUES (8, 1010);
INSERT INTO `sys_role_menu` VALUES (8, 1011);
INSERT INTO `sys_role_menu` VALUES (8, 1012);
INSERT INTO `sys_role_menu` VALUES (8, 1013);
INSERT INTO `sys_role_menu` VALUES (8, 1014);
INSERT INTO `sys_role_menu` VALUES (8, 1015);
INSERT INTO `sys_role_menu` VALUES (8, 1016);
INSERT INTO `sys_role_menu` VALUES (8, 1040);
INSERT INTO `sys_role_menu` VALUES (8, 1041);
INSERT INTO `sys_role_menu` VALUES (8, 1042);
INSERT INTO `sys_role_menu` VALUES (8, 1043);
INSERT INTO `sys_role_menu` VALUES (8, 1044);
INSERT INTO `sys_role_menu` VALUES (8, 1045);
INSERT INTO `sys_role_menu` VALUES (8, 1046);
INSERT INTO `sys_role_menu` VALUES (8, 1047);
INSERT INTO `sys_role_menu` VALUES (8, 1048);
INSERT INTO `sys_role_menu` VALUES (8, 1055);
INSERT INTO `sys_role_menu` VALUES (8, 1056);
INSERT INTO `sys_role_menu` VALUES (8, 1057);
INSERT INTO `sys_role_menu` VALUES (8, 1058);
INSERT INTO `sys_role_menu` VALUES (8, 1059);
INSERT INTO `sys_role_menu` VALUES (8, 1060);
INSERT INTO `sys_role_menu` VALUES (8, 2000);
INSERT INTO `sys_role_menu` VALUES (8, 2001);
INSERT INTO `sys_role_menu` VALUES (8, 2002);
INSERT INTO `sys_role_menu` VALUES (8, 2003);
INSERT INTO `sys_role_menu` VALUES (8, 2004);
INSERT INTO `sys_role_menu` VALUES (8, 2005);
INSERT INTO `sys_role_menu` VALUES (9, 1);
INSERT INTO `sys_role_menu` VALUES (9, 2);
INSERT INTO `sys_role_menu` VALUES (9, 3);
INSERT INTO `sys_role_menu` VALUES (9, 100);
INSERT INTO `sys_role_menu` VALUES (9, 101);
INSERT INTO `sys_role_menu` VALUES (9, 102);
INSERT INTO `sys_role_menu` VALUES (9, 108);
INSERT INTO `sys_role_menu` VALUES (9, 109);
INSERT INTO `sys_role_menu` VALUES (9, 112);
INSERT INTO `sys_role_menu` VALUES (9, 113);
INSERT INTO `sys_role_menu` VALUES (9, 114);
INSERT INTO `sys_role_menu` VALUES (9, 500);
INSERT INTO `sys_role_menu` VALUES (9, 501);
INSERT INTO `sys_role_menu` VALUES (9, 1001);
INSERT INTO `sys_role_menu` VALUES (9, 1002);
INSERT INTO `sys_role_menu` VALUES (9, 1003);
INSERT INTO `sys_role_menu` VALUES (9, 1004);
INSERT INTO `sys_role_menu` VALUES (9, 1005);
INSERT INTO `sys_role_menu` VALUES (9, 1006);
INSERT INTO `sys_role_menu` VALUES (9, 1007);
INSERT INTO `sys_role_menu` VALUES (9, 1008);
INSERT INTO `sys_role_menu` VALUES (9, 1009);
INSERT INTO `sys_role_menu` VALUES (9, 1010);
INSERT INTO `sys_role_menu` VALUES (9, 1011);
INSERT INTO `sys_role_menu` VALUES (9, 1012);
INSERT INTO `sys_role_menu` VALUES (9, 1013);
INSERT INTO `sys_role_menu` VALUES (9, 1014);
INSERT INTO `sys_role_menu` VALUES (9, 1015);
INSERT INTO `sys_role_menu` VALUES (9, 1016);
INSERT INTO `sys_role_menu` VALUES (9, 1040);
INSERT INTO `sys_role_menu` VALUES (9, 1041);
INSERT INTO `sys_role_menu` VALUES (9, 1042);
INSERT INTO `sys_role_menu` VALUES (9, 1043);
INSERT INTO `sys_role_menu` VALUES (9, 1044);
INSERT INTO `sys_role_menu` VALUES (9, 1045);
INSERT INTO `sys_role_menu` VALUES (9, 1046);
INSERT INTO `sys_role_menu` VALUES (9, 1047);
INSERT INTO `sys_role_menu` VALUES (9, 1048);
INSERT INTO `sys_role_menu` VALUES (9, 1055);
INSERT INTO `sys_role_menu` VALUES (9, 1056);
INSERT INTO `sys_role_menu` VALUES (9, 1057);
INSERT INTO `sys_role_menu` VALUES (9, 1058);
INSERT INTO `sys_role_menu` VALUES (9, 1059);
INSERT INTO `sys_role_menu` VALUES (9, 1060);
INSERT INTO `sys_role_menu` VALUES (9, 2000);
INSERT INTO `sys_role_menu` VALUES (9, 2001);
INSERT INTO `sys_role_menu` VALUES (9, 2002);
INSERT INTO `sys_role_menu` VALUES (9, 2003);
INSERT INTO `sys_role_menu` VALUES (9, 2004);
INSERT INTO `sys_role_menu` VALUES (9, 2005);
INSERT INTO `sys_role_menu` VALUES (10, 3);
INSERT INTO `sys_role_menu` VALUES (10, 2000);
INSERT INTO `sys_role_menu` VALUES (10, 2001);
INSERT INTO `sys_role_menu` VALUES (10, 2002);
INSERT INTO `sys_role_menu` VALUES (10, 2003);
INSERT INTO `sys_role_menu` VALUES (10, 2004);
INSERT INTO `sys_role_menu` VALUES (10, 2005);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
                             `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                             `realname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
                             `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
                             `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
                             `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
                             `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                             `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
                             `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
                             `status` tinyint(1) NULL DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
                             `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
                             `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 0, '127.0.0.1', '2018-03-16 11:33:00', '管理员', 'admin', 'admin', '2018-03-16 11:33:00', '2021-06-06 18:51:34');
INSERT INTO `sys_user` VALUES (11, '孙琳', '00', 'sixsixsix516@163.com', '13289333516', '0', '', '$2a$10$rm//RZdf0OwwCxvLsBfa7eg4wlGo7noHmiEeIz.W5Ly5jJs96pKSi', 0, '', NULL, NULL, '', '', '2021-06-06 18:25:50', '2021-06-06 18:56:29');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
                                  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户ID',
                                  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
                                  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1401493187625086979 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1401491948317306882);
INSERT INTO `sys_user_role` VALUES (11, 1, 1401493187360845825);
INSERT INTO `sys_user_role` VALUES (11, 10, 1401493187625086978);

SET FOREIGN_KEY_CHECKS = 1;
