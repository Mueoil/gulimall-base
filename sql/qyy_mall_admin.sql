/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : qyy_mall_admin

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 11/12/2022 00:20:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001845F6D56C07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-EAA11P91670649128302', 1670682758161, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1670684400000, 1670682600000, 5, 'WAITING', 'CRON', 1668048572000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001845F6D56C07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron?????????',
  `status` tinyint NULL DEFAULT NULL COMMENT '????????????  0?????????  1?????????',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '????????????', '2022-11-10 10:45:12');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '????????????id',
  `job_id` bigint NOT NULL COMMENT '??????id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `status` tinyint NOT NULL COMMENT '????????????    0?????????    1?????????',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `times` int NOT NULL COMMENT '??????(???????????????)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-10 11:30:01');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-10 12:00:01');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-10 12:30:01');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-12 15:30:01');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-12 20:00:01');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-12 21:00:01');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-12 21:30:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-13 00:30:01');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-13 01:00:01');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 01:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 02:30:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-13 16:00:01');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-13 18:30:01');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-13 19:00:01');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-13 19:30:01');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 20:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-13 21:00:01');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-13 22:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-13 22:30:01');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 7, '2022-11-13 23:00:01');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-13 23:30:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 78, '2022-11-14 00:00:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-14 00:30:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-14 01:00:01');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-14 01:30:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 37, '2022-11-14 02:00:01');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-14 18:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-14 18:30:01');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-14 19:00:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-14 19:30:01');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-14 20:00:01');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-14 20:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-14 21:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 12, '2022-11-14 21:30:01');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-14 22:00:01');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 173, '2022-11-15 00:00:01');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-15 00:30:01');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 01:00:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-15 01:30:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-15 02:00:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-15 02:30:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 12:00:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 13:00:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 10, '2022-11-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 21, '2022-11-15 14:30:01');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 13, '2022-11-15 15:00:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 15:30:01');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-15 17:00:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-15 17:30:01');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 20, '2022-11-15 18:30:01');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-15 19:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-15 20:30:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 23, '2022-11-15 22:00:01');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 161, '2022-11-16 00:00:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 8, '2022-11-16 00:30:01');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-16 13:30:01');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-16 14:00:01');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-16 17:00:01');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 18:30:01');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 8, '2022-11-16 20:00:01');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 9, '2022-11-16 21:00:01');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-16 21:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 375, '2022-11-17 00:00:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-17 00:30:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 01:00:01');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 01:30:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 02:00:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 41, '2022-11-17 02:30:01');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 15, '2022-11-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-17 12:00:01');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 13:30:01');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 16:00:01');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 20, '2022-11-17 17:00:01');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 22:00:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-17 22:30:01');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 23:00:01');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 23:30:01');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 164, '2022-11-18 00:00:01');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-18 00:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-18 01:00:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 10, '2022-11-18 01:30:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 15:00:01');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 78, '2022-11-18 17:00:01');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 21, '2022-11-18 18:30:01');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-18 19:00:01');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-18 20:00:01');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-18 20:30:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 14, '2022-11-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 55, '2022-11-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 19, '2022-11-20 18:00:01');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-20 19:30:01');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 62, '2022-11-20 20:30:01');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 64, '2022-11-20 21:00:01');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 34, '2022-11-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-23 22:30:01');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-23 23:00:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 23:30:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-24 13:30:01');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 14:00:01');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-24 15:30:01');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 18:00:01');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-24 20:00:01');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 9, '2022-11-25 00:30:01');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-25 01:00:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 01:30:01');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-25 02:00:00');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-25 02:30:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 12:30:01');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-25 13:30:01');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-25 14:30:01');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-25 15:30:01');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 7, '2022-11-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 33, '2022-11-25 17:30:01');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 50, '2022-11-25 19:00:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 32, '2022-11-25 19:30:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 11, '2022-11-25 20:00:01');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 7, '2022-11-25 20:30:01');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 21:00:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-25 21:30:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-25 22:00:01');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-25 22:30:00');
INSERT INTO `schedule_job_log` VALUES (194, 1, 'testTask', 'renren', 0, NULL, 8, '2022-11-25 23:00:01');
INSERT INTO `schedule_job_log` VALUES (195, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-25 23:30:01');
INSERT INTO `schedule_job_log` VALUES (196, 1, 'testTask', 'renren', 0, NULL, 223, '2022-11-26 00:00:01');
INSERT INTO `schedule_job_log` VALUES (197, 1, 'testTask', 'renren', 0, NULL, 15, '2022-11-26 00:30:00');
INSERT INTO `schedule_job_log` VALUES (198, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 01:00:00');
INSERT INTO `schedule_job_log` VALUES (199, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 01:30:00');
INSERT INTO `schedule_job_log` VALUES (200, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 02:00:00');
INSERT INTO `schedule_job_log` VALUES (201, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 13:30:01');
INSERT INTO `schedule_job_log` VALUES (202, 1, 'testTask', 'renren', 0, NULL, 495, '2022-11-26 14:00:02');
INSERT INTO `schedule_job_log` VALUES (203, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES (204, 1, 'testTask', 'renren', 0, NULL, 14, '2022-11-26 15:00:01');
INSERT INTO `schedule_job_log` VALUES (205, 1, 'testTask', 'renren', 0, NULL, 52, '2022-11-26 15:30:01');
INSERT INTO `schedule_job_log` VALUES (206, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 16:00:01');
INSERT INTO `schedule_job_log` VALUES (207, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 16:30:01');
INSERT INTO `schedule_job_log` VALUES (208, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 18:00:01');
INSERT INTO `schedule_job_log` VALUES (209, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES (210, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 19:00:01');
INSERT INTO `schedule_job_log` VALUES (211, 1, 'testTask', 'renren', 0, NULL, 66, '2022-11-26 19:30:01');
INSERT INTO `schedule_job_log` VALUES (212, 1, 'testTask', 'renren', 0, NULL, 24, '2022-11-26 20:00:01');
INSERT INTO `schedule_job_log` VALUES (213, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 20:30:01');
INSERT INTO `schedule_job_log` VALUES (214, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 21:00:01');
INSERT INTO `schedule_job_log` VALUES (215, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES (216, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-26 22:00:00');
INSERT INTO `schedule_job_log` VALUES (217, 1, 'testTask', 'renren', 0, NULL, 410, '2022-11-26 23:00:02');
INSERT INTO `schedule_job_log` VALUES (218, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES (219, 1, 'testTask', 'renren', 0, NULL, 20, '2022-11-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES (220, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 17:30:01');
INSERT INTO `schedule_job_log` VALUES (221, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES (222, 1, 'testTask', 'renren', 0, NULL, 96, '2022-11-27 18:30:02');
INSERT INTO `schedule_job_log` VALUES (223, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES (224, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES (225, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES (226, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES (227, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 23:00:01');
INSERT INTO `schedule_job_log` VALUES (228, 1, 'testTask', 'renren', 0, NULL, 29, '2022-11-28 12:00:01');
INSERT INTO `schedule_job_log` VALUES (229, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES (230, 1, 'testTask', 'renren', 0, NULL, 24, '2022-11-28 13:00:02');
INSERT INTO `schedule_job_log` VALUES (231, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES (232, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES (233, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES (234, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES (235, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES (236, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 16:00:01');
INSERT INTO `schedule_job_log` VALUES (237, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES (238, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 18:00:01');
INSERT INTO `schedule_job_log` VALUES (239, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 19:00:00');
INSERT INTO `schedule_job_log` VALUES (240, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES (241, 1, 'testTask', 'renren', 0, NULL, 85, '2022-11-28 20:00:01');
INSERT INTO `schedule_job_log` VALUES (242, 1, 'testTask', 'renren', 0, NULL, 100, '2022-11-28 20:30:01');
INSERT INTO `schedule_job_log` VALUES (243, 1, 'testTask', 'renren', 0, NULL, 85, '2022-11-28 21:00:01');
INSERT INTO `schedule_job_log` VALUES (244, 1, 'testTask', 'renren', 0, NULL, 121, '2022-11-28 21:30:02');
INSERT INTO `schedule_job_log` VALUES (245, 1, 'testTask', 'renren', 0, NULL, 176, '2022-11-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES (246, 1, 'testTask', 'renren', 0, NULL, 52, '2022-11-28 23:30:01');
INSERT INTO `schedule_job_log` VALUES (247, 1, 'testTask', 'renren', 0, NULL, 2154, '2022-11-29 00:00:00');
INSERT INTO `schedule_job_log` VALUES (248, 1, 'testTask', 'renren', 0, NULL, 46, '2022-11-29 00:30:00');
INSERT INTO `schedule_job_log` VALUES (249, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 01:00:00');
INSERT INTO `schedule_job_log` VALUES (250, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 01:30:00');
INSERT INTO `schedule_job_log` VALUES (251, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 02:00:00');
INSERT INTO `schedule_job_log` VALUES (252, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-29 02:30:01');
INSERT INTO `schedule_job_log` VALUES (253, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 03:00:01');
INSERT INTO `schedule_job_log` VALUES (254, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 03:30:01');
INSERT INTO `schedule_job_log` VALUES (255, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 17:30:01');
INSERT INTO `schedule_job_log` VALUES (256, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES (257, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 18:30:01');
INSERT INTO `schedule_job_log` VALUES (258, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 19:00:02');
INSERT INTO `schedule_job_log` VALUES (259, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 19:30:00');
INSERT INTO `schedule_job_log` VALUES (260, 1, 'testTask', 'renren', 0, NULL, 100, '2022-11-29 20:00:01');
INSERT INTO `schedule_job_log` VALUES (261, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-29 20:30:01');
INSERT INTO `schedule_job_log` VALUES (262, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-29 21:00:01');
INSERT INTO `schedule_job_log` VALUES (263, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-29 21:30:02');
INSERT INTO `schedule_job_log` VALUES (264, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 22:00:00');
INSERT INTO `schedule_job_log` VALUES (265, 1, 'testTask', 'renren', 0, NULL, 4, '2022-12-01 14:30:01');
INSERT INTO `schedule_job_log` VALUES (266, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 15:00:00');
INSERT INTO `schedule_job_log` VALUES (267, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 15:30:01');
INSERT INTO `schedule_job_log` VALUES (268, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 16:46:53');
INSERT INTO `schedule_job_log` VALUES (269, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 17:00:00');
INSERT INTO `schedule_job_log` VALUES (270, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 17:30:01');
INSERT INTO `schedule_job_log` VALUES (271, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-01 20:00:01');
INSERT INTO `schedule_job_log` VALUES (272, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-01 21:00:01');
INSERT INTO `schedule_job_log` VALUES (273, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 22:00:02');
INSERT INTO `schedule_job_log` VALUES (274, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-01 22:30:02');
INSERT INTO `schedule_job_log` VALUES (275, 1, 'testTask', 'renren', 0, NULL, 5, '2022-12-01 23:00:01');
INSERT INTO `schedule_job_log` VALUES (276, 1, 'testTask', 'renren', 0, NULL, 138, '2022-12-01 23:30:01');
INSERT INTO `schedule_job_log` VALUES (277, 1, 'testTask', 'renren', 0, NULL, 748, '2022-12-02 00:00:02');
INSERT INTO `schedule_job_log` VALUES (278, 1, 'testTask', 'renren', 0, NULL, 16, '2022-12-02 00:30:00');
INSERT INTO `schedule_job_log` VALUES (279, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 01:00:01');
INSERT INTO `schedule_job_log` VALUES (280, 1, 'testTask', 'renren', 0, NULL, 47, '2022-12-02 01:30:01');
INSERT INTO `schedule_job_log` VALUES (281, 1, 'testTask', 'renren', 0, NULL, 137, '2022-12-02 02:00:01');
INSERT INTO `schedule_job_log` VALUES (282, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 12:30:01');
INSERT INTO `schedule_job_log` VALUES (283, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 13:00:00');
INSERT INTO `schedule_job_log` VALUES (284, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 13:30:01');
INSERT INTO `schedule_job_log` VALUES (285, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 15:30:01');
INSERT INTO `schedule_job_log` VALUES (286, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-02 16:00:02');
INSERT INTO `schedule_job_log` VALUES (287, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES (288, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 17:00:01');
INSERT INTO `schedule_job_log` VALUES (289, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES (290, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-02 18:00:01');
INSERT INTO `schedule_job_log` VALUES (291, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES (292, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-02 19:30:01');
INSERT INTO `schedule_job_log` VALUES (293, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 20:00:00');
INSERT INTO `schedule_job_log` VALUES (294, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 20:30:01');
INSERT INTO `schedule_job_log` VALUES (295, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 21:00:01');
INSERT INTO `schedule_job_log` VALUES (296, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-02 21:30:00');
INSERT INTO `schedule_job_log` VALUES (297, 1, 'testTask', 'renren', 0, NULL, 132, '2022-12-02 22:00:00');
INSERT INTO `schedule_job_log` VALUES (298, 1, 'testTask', 'renren', 0, NULL, 153, '2022-12-02 22:30:00');
INSERT INTO `schedule_job_log` VALUES (299, 1, 'testTask', 'renren', 0, NULL, 6, '2022-12-02 23:00:00');
INSERT INTO `schedule_job_log` VALUES (300, 1, 'testTask', 'renren', 0, NULL, 107, '2022-12-02 23:30:03');
INSERT INTO `schedule_job_log` VALUES (301, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 14:00:02');
INSERT INTO `schedule_job_log` VALUES (302, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 14:30:01');
INSERT INTO `schedule_job_log` VALUES (303, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 15:00:00');
INSERT INTO `schedule_job_log` VALUES (304, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES (305, 1, 'testTask', 'renren', 0, NULL, 42, '2022-12-03 16:00:01');
INSERT INTO `schedule_job_log` VALUES (306, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-03 16:30:00');
INSERT INTO `schedule_job_log` VALUES (307, 1, 'testTask', 'renren', 0, NULL, 49, '2022-12-03 17:00:00');
INSERT INTO `schedule_job_log` VALUES (308, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 17:30:01');
INSERT INTO `schedule_job_log` VALUES (309, 1, 'testTask', 'renren', 0, NULL, 114, '2022-12-03 20:00:00');
INSERT INTO `schedule_job_log` VALUES (310, 1, 'testTask', 'renren', 0, NULL, 107, '2022-12-03 20:30:00');
INSERT INTO `schedule_job_log` VALUES (311, 1, 'testTask', 'renren', 0, NULL, 149, '2022-12-03 21:00:01');
INSERT INTO `schedule_job_log` VALUES (312, 1, 'testTask', 'renren', 0, NULL, 43, '2022-12-03 21:30:02');
INSERT INTO `schedule_job_log` VALUES (313, 1, 'testTask', 'renren', 0, NULL, 4, '2022-12-03 22:00:01');
INSERT INTO `schedule_job_log` VALUES (314, 1, 'testTask', 'renren', 0, NULL, 29, '2022-12-03 22:30:01');
INSERT INTO `schedule_job_log` VALUES (315, 1, 'testTask', 'renren', 0, NULL, 5, '2022-12-03 23:00:01');
INSERT INTO `schedule_job_log` VALUES (316, 1, 'testTask', 'renren', 0, NULL, 204, '2022-12-03 23:30:03');
INSERT INTO `schedule_job_log` VALUES (317, 1, 'testTask', 'renren', 0, NULL, 816, '2022-12-04 00:00:01');
INSERT INTO `schedule_job_log` VALUES (318, 1, 'testTask', 'renren', 0, NULL, 417, '2022-12-04 00:30:00');
INSERT INTO `schedule_job_log` VALUES (319, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES (320, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES (321, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-04 14:30:00');
INSERT INTO `schedule_job_log` VALUES (322, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-04 15:00:00');
INSERT INTO `schedule_job_log` VALUES (323, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-04 16:00:00');
INSERT INTO `schedule_job_log` VALUES (324, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-04 17:13:26');
INSERT INTO `schedule_job_log` VALUES (325, 1, 'testTask', 'renren', 0, NULL, 24, '2022-12-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES (326, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES (327, 1, 'testTask', 'renren', 0, NULL, 44, '2022-12-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES (328, 1, 'testTask', 'renren', 0, NULL, 7, '2022-12-04 19:00:00');
INSERT INTO `schedule_job_log` VALUES (329, 1, 'testTask', 'renren', 0, NULL, 130, '2022-12-04 19:30:01');
INSERT INTO `schedule_job_log` VALUES (330, 1, 'testTask', 'renren', 0, NULL, 108, '2022-12-04 20:00:01');
INSERT INTO `schedule_job_log` VALUES (331, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-04 21:00:01');
INSERT INTO `schedule_job_log` VALUES (332, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-04 21:30:01');
INSERT INTO `schedule_job_log` VALUES (333, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-04 22:00:00');
INSERT INTO `schedule_job_log` VALUES (334, 1, 'testTask', 'renren', 0, NULL, 91, '2022-12-04 22:30:01');
INSERT INTO `schedule_job_log` VALUES (335, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-04 23:00:00');
INSERT INTO `schedule_job_log` VALUES (336, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-04 23:30:01');
INSERT INTO `schedule_job_log` VALUES (337, 1, 'testTask', 'renren', 0, NULL, 3941, '2022-12-05 00:00:09');
INSERT INTO `schedule_job_log` VALUES (338, 1, 'testTask', 'renren', 0, NULL, 127, '2022-12-05 00:30:01');
INSERT INTO `schedule_job_log` VALUES (339, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-05 01:00:00');
INSERT INTO `schedule_job_log` VALUES (340, 1, 'testTask', 'renren', 0, NULL, 29, '2022-12-05 02:00:02');
INSERT INTO `schedule_job_log` VALUES (341, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-05 13:30:01');
INSERT INTO `schedule_job_log` VALUES (342, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES (343, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES (344, 1, 'testTask', 'renren', 0, NULL, 10, '2022-12-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES (345, 1, 'testTask', 'renren', 0, NULL, 511, '2022-12-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES (346, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES (347, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES (348, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-05 17:00:01');
INSERT INTO `schedule_job_log` VALUES (349, 1, 'testTask', 'renren', 0, NULL, 5, '2022-12-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES (350, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES (351, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES (352, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES (353, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-05 19:30:01');
INSERT INTO `schedule_job_log` VALUES (354, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-05 20:00:01');
INSERT INTO `schedule_job_log` VALUES (355, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-05 20:30:01');
INSERT INTO `schedule_job_log` VALUES (356, 1, 'testTask', 'renren', 0, NULL, 62, '2022-12-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES (357, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-05 21:30:01');
INSERT INTO `schedule_job_log` VALUES (358, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES (359, 1, 'testTask', 'renren', 0, NULL, 516, '2022-12-05 22:30:01');
INSERT INTO `schedule_job_log` VALUES (360, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-05 23:00:00');
INSERT INTO `schedule_job_log` VALUES (361, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 15:30:01');
INSERT INTO `schedule_job_log` VALUES (362, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 16:00:00');
INSERT INTO `schedule_job_log` VALUES (363, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-06 17:00:01');
INSERT INTO `schedule_job_log` VALUES (364, 1, 'testTask', 'renren', 0, NULL, 6, '2022-12-06 17:30:00');
INSERT INTO `schedule_job_log` VALUES (365, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 18:00:01');
INSERT INTO `schedule_job_log` VALUES (366, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES (367, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES (368, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 19:30:01');
INSERT INTO `schedule_job_log` VALUES (369, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 20:00:01');
INSERT INTO `schedule_job_log` VALUES (370, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 20:30:01');
INSERT INTO `schedule_job_log` VALUES (371, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES (372, 1, 'testTask', 'renren', 0, NULL, 6, '2022-12-06 21:30:01');
INSERT INTO `schedule_job_log` VALUES (373, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 22:00:01');
INSERT INTO `schedule_job_log` VALUES (374, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES (375, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES (376, 1, 'testTask', 'renren', 0, NULL, 97, '2022-12-06 23:30:01');
INSERT INTO `schedule_job_log` VALUES (377, 1, 'testTask', 'renren', 0, NULL, 932, '2022-12-07 00:00:01');
INSERT INTO `schedule_job_log` VALUES (378, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-07 13:00:01');
INSERT INTO `schedule_job_log` VALUES (379, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES (380, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 14:00:01');
INSERT INTO `schedule_job_log` VALUES (381, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 14:30:00');
INSERT INTO `schedule_job_log` VALUES (382, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 19:00:01');
INSERT INTO `schedule_job_log` VALUES (383, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES (384, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES (385, 1, 'testTask', 'renren', 0, NULL, 30, '2022-12-07 20:30:01');
INSERT INTO `schedule_job_log` VALUES (386, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-07 21:00:02');
INSERT INTO `schedule_job_log` VALUES (387, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES (388, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES (389, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES (390, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES (391, 1, 'testTask', 'renren', 0, NULL, 2260, '2022-12-08 00:00:00');
INSERT INTO `schedule_job_log` VALUES (392, 1, 'testTask', 'renren', 0, NULL, 3, '2022-12-08 00:30:00');
INSERT INTO `schedule_job_log` VALUES (393, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-09 19:30:01');
INSERT INTO `schedule_job_log` VALUES (394, 1, 'testTask', 'renren', 0, NULL, 745, '2022-12-09 20:00:01');
INSERT INTO `schedule_job_log` VALUES (395, 1, 'testTask', 'renren', 0, NULL, 66, '2022-12-09 20:30:02');
INSERT INTO `schedule_job_log` VALUES (396, 1, 'testTask', 'renren', 0, NULL, 4, '2022-12-09 21:00:01');
INSERT INTO `schedule_job_log` VALUES (397, 1, 'testTask', 'renren', 0, NULL, 618, '2022-12-09 21:30:01');
INSERT INTO `schedule_job_log` VALUES (398, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-09 22:00:01');
INSERT INTO `schedule_job_log` VALUES (399, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-09 22:30:00');
INSERT INTO `schedule_job_log` VALUES (400, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES (401, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES (402, 1, 'testTask', 'renren', 0, NULL, 9, '2022-12-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES (403, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES (404, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 15:30:01');
INSERT INTO `schedule_job_log` VALUES (405, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 16:00:00');
INSERT INTO `schedule_job_log` VALUES (406, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES (407, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 17:00:01');
INSERT INTO `schedule_job_log` VALUES (408, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES (409, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 18:00:01');
INSERT INTO `schedule_job_log` VALUES (410, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 19:00:01');
INSERT INTO `schedule_job_log` VALUES (411, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES (412, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES (413, 1, 'testTask', 'renren', 0, NULL, 16, '2022-12-10 21:00:02');
INSERT INTO `schedule_job_log` VALUES (414, 1, 'testTask', 'renren', 0, NULL, 5, '2022-12-10 21:30:00');
INSERT INTO `schedule_job_log` VALUES (415, 1, 'testTask', 'renren', 0, NULL, 96, '2022-12-10 22:00:01');
INSERT INTO `schedule_job_log` VALUES (416, 1, 'testTask', 'renren', 0, NULL, 52, '2022-12-10 22:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '???????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('01fd47d5-5b8c-49dd-804d-c01ff8ba7ba5', 'ey4a8', '2022-11-24 13:32:58');
INSERT INTO `sys_captcha` VALUES ('038fad7b-15fa-484e-8f83-50da5effc463', '8b7n4', '2022-11-12 21:12:25');
INSERT INTO `sys_captcha` VALUES ('06b5889c-f215-48ad-8918-57190c57d9b3', 'ey4gy', '2022-11-28 11:51:17');
INSERT INTO `sys_captcha` VALUES ('0a410d08-16fa-4dd1-8680-142c6e8bff3a', 'w476x', '2022-12-07 13:10:37');
INSERT INTO `sys_captcha` VALUES ('0e859ad5-3b0d-4af1-871d-4054a473b601', '8gnxb', '2022-11-12 14:16:53');
INSERT INTO `sys_captcha` VALUES ('11fd942f-9b41-44ec-8962-0ff7c6b9664b', 'me746', '2022-12-02 18:14:27');
INSERT INTO `sys_captcha` VALUES ('1d821b3c-c9d9-4062-81e3-68a896c2affa', 'exfpg', '2022-11-13 00:38:16');
INSERT INTO `sys_captcha` VALUES ('2eebc661-1a6d-488e-8e08-100181e092b5', 'dm3d8', '2022-11-16 13:23:05');
INSERT INTO `sys_captcha` VALUES ('2feb521d-486d-41a8-80c8-79f60e4aa1b0', 'cag88', '2022-12-02 12:25:13');
INSERT INTO `sys_captcha` VALUES ('43576810-8659-41f5-8859-10f8f5cf6883', 'ab3cd', '2022-11-10 12:46:30');
INSERT INTO `sys_captcha` VALUES ('44ac9dad-e8cd-409c-8cfd-d7ebf9de3083', 'exmgw', '2022-11-18 12:52:52');
INSERT INTO `sys_captcha` VALUES ('4e5451e9-a895-4195-8516-50415b9671c9', 'dnn3n', '2022-11-20 21:11:07');
INSERT INTO `sys_captcha` VALUES ('5245b06c-d4b2-4a04-86dc-6f4e7b016a02', 'm6b5n', '2022-12-02 00:00:59');
INSERT INTO `sys_captcha` VALUES ('69e2d653-fa93-4364-8cef-774c499fbdda', 'bcywc', '2022-11-18 00:16:49');
INSERT INTO `sys_captcha` VALUES ('8422f47e-f990-4af9-81ff-5b917758e1e1', 'd42gp', '2022-11-16 13:23:05');
INSERT INTO `sys_captcha` VALUES ('8699bfee-189b-46ca-8bdd-0abb2bb0caca', 'aampf', '2022-11-26 23:04:16');
INSERT INTO `sys_captcha` VALUES ('93260683-7e2a-4be4-8ef1-29e276966264', 'f76cf', '2022-11-14 18:02:01');
INSERT INTO `sys_captcha` VALUES ('a3946e46-70c8-41c7-880a-764f991c14e5', 'mbagc', '2022-11-23 22:24:32');
INSERT INTO `sys_captcha` VALUES ('aa807b9f-1ce5-4673-8244-ae5efd4ae330', 'cmp4w', '2022-11-12 20:55:45');
INSERT INTO `sys_captcha` VALUES ('c4cd711d-82a4-4077-8191-dcbf0280781c', 'me3dc', '2022-11-23 22:25:12');
INSERT INTO `sys_captcha` VALUES ('cd6a4363-4ef5-4584-8e7f-abdf7cde980c', 'nxdy3', '2022-12-07 13:11:58');
INSERT INTO `sys_captcha` VALUES ('d5b1c77f-b202-494f-8206-681eb68972aa', 'fpnfy', '2022-11-17 11:00:09');
INSERT INTO `sys_captcha` VALUES ('e5dbd269-694e-454c-8069-25f0439adc4d', 'ebp6g', '2022-11-26 23:00:55');
INSERT INTO `sys_captcha` VALUES ('ee02b3e4-2b5f-43d2-80fe-29f99153a617', '36yxw', '2022-12-02 17:30:20');
INSERT INTO `sys_captcha` VALUES ('f0061338-f877-4228-814f-c26042810a4a', 'w2bbf', '2022-11-26 23:01:00');
INSERT INTO `sys_captcha` VALUES ('f285da37-d598-4dbc-8a15-a33da94afee1', 'nc2g6', '2022-12-04 13:29:31');
INSERT INTO `sys_captcha` VALUES ('fd9706de-bfe8-4a3d-8422-013aff639c0d', 'm5n6e', '2022-12-03 13:55:56');
INSERT INTO `sys_captcha` VALUES ('ff653317-3efe-463a-8421-5a423930a892', 'mm6m2', '2022-11-15 11:58:01');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint NULL DEFAULT 1 COMMENT '??????   0?????????   1?????????',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '?????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '?????????????????????');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '?????????',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `time` bigint NOT NULL COMMENT '????????????(??????)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP??????',
  `create_date` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"????????????\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 65, '0:0:0:0:0:0:0:1', '2022-11-12 14:16:07');
INSERT INTO `sys_log` VALUES (2, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"????????????\",\"url\":\"product/category\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 55, '0:0:0:0:0:0:0:1', '2022-11-12 14:18:27');
INSERT INTO `sys_log` VALUES (3, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"????????????\",\"url\":\"product/brand\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 108, '0:0:0:0:0:0:0:1', '2022-11-16 15:08:18');
INSERT INTO `sys_log` VALUES (4, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"BuyYouYu\",\"password\":\"42ed47348041f123678b03cff8ddc4c7127e368e60a2e296d8e2c24fc3621821\",\"salt\":\"dm6lfhpxf4YUJYvwFffc\",\"email\":\"1395234017@qq.com\",\"mobile\":\"13790221757\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Dec 6, 2022 11:06:19 PM\"}]', 9076, '0:0:0:0:0:0:0:1', '2022-12-06 23:06:23');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `type` int NULL DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `order_num` int NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '????????????', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '???????????????', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '????????????', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '????????????', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL??????', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '????????????', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '??????', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '??????', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '??????', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '??????', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '??????', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '??????', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '????????????', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '????????????', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '??????', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '??????', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '??????', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '??????', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '??????', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '??????', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '??????', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '??????', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '??????', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '??????', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '??????', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '??????', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '????????????', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '????????????', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '????????????', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '????????????', '', '', 0, 'editor', 0);
INSERT INTO `sys_menu` VALUES (32, 31, '????????????', 'product/category', '', 1, 'menu', 0);
INSERT INTO `sys_menu` VALUES (34, 31, '????????????', 'product/brand', '', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (37, 31, '????????????', '', '', 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (38, 37, '????????????', 'product/attrgroup', '', 1, 'tubiao', 0);
INSERT INTO `sys_menu` VALUES (39, 37, '????????????', 'product/baseattr', '', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (40, 37, '????????????', 'product/saleattr', '', 1, 'zonghe', 0);
INSERT INTO `sys_menu` VALUES (41, 31, '????????????', 'product/spu', '', 0, 'zonghe', 0);
INSERT INTO `sys_menu` VALUES (42, 0, '????????????', '', '', 0, 'mudedi', 0);
INSERT INTO `sys_menu` VALUES (43, 0, '????????????', '', '', 0, 'shouye', 0);
INSERT INTO `sys_menu` VALUES (44, 0, '????????????', '', '', 0, 'config', 0);
INSERT INTO `sys_menu` VALUES (45, 0, '????????????', '', '', 0, 'admin', 0);
INSERT INTO `sys_menu` VALUES (46, 0, '????????????', '', '', 0, 'sousuo', 0);
INSERT INTO `sys_menu` VALUES (47, 42, '???????????????', 'coupon/coupon', '', 1, 'zhedie', 0);
INSERT INTO `sys_menu` VALUES (48, 42, '????????????', 'coupon/history', '', 1, 'sql', 0);
INSERT INTO `sys_menu` VALUES (49, 42, '????????????', 'coupon/subject', '', 1, 'tixing', 0);
INSERT INTO `sys_menu` VALUES (50, 42, '????????????', 'coupon/seckill', '', 1, 'daohang', 0);
INSERT INTO `sys_menu` VALUES (51, 42, '????????????', 'coupon/bounds', '', 1, 'geren', 0);
INSERT INTO `sys_menu` VALUES (52, 42, '????????????', 'coupon/full', '', 1, 'shoucang', 0);
INSERT INTO `sys_menu` VALUES (53, 43, '????????????', 'ware/wareinfo', '', 1, 'shouye', 0);
INSERT INTO `sys_menu` VALUES (54, 43, '???????????????', 'ware/task', '', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (55, 43, '????????????', 'ware/sku', '', 1, 'jiesuo', 0);
INSERT INTO `sys_menu` VALUES (56, 44, '????????????', 'order/order', '', 1, 'zhedie', 0);
INSERT INTO `sys_menu` VALUES (57, 44, '???????????????', 'order/return', '', 1, 'shanchu', 0);
INSERT INTO `sys_menu` VALUES (58, 44, '????????????', 'order/settings', '', 1, 'system', 0);
INSERT INTO `sys_menu` VALUES (59, 44, '??????????????????', 'order/payment', '', 1, 'job', 0);
INSERT INTO `sys_menu` VALUES (60, 44, '??????????????????', 'order/refund', '', 1, 'mudedi', 0);
INSERT INTO `sys_menu` VALUES (61, 45, '????????????', 'member/member', '', 1, 'geren', 0);
INSERT INTO `sys_menu` VALUES (62, 45, '????????????', 'member/level', '', 1, 'tubiao', 0);
INSERT INTO `sys_menu` VALUES (63, 45, '????????????', 'member/growth', '', 1, 'bianji', 0);
INSERT INTO `sys_menu` VALUES (64, 45, '????????????', 'member/statistics', '', 1, 'sql', 0);
INSERT INTO `sys_menu` VALUES (65, 46, '????????????', 'content/index', '', 1, 'shouye', 0);
INSERT INTO `sys_menu` VALUES (66, 46, '????????????', 'content/category', '', 1, 'zhedie', 0);
INSERT INTO `sys_menu` VALUES (67, 46, '????????????', 'content/comments', '', 1, 'pinglun', 0);
INSERT INTO `sys_menu` VALUES (68, 41, 'spu??????', 'product/spu', '', 1, 'config', 0);
INSERT INTO `sys_menu` VALUES (69, 41, '????????????', 'product/spuadd', '', 1, 'bianji', 0);
INSERT INTO `sys_menu` VALUES (70, 43, '???????????????', '', '', 0, 'tubiao', 0);
INSERT INTO `sys_menu` VALUES (71, 70, '????????????', 'ware/purchaseitem', '', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (72, 70, '?????????', 'ware/purchase', '', 1, 'menu', 0);
INSERT INTO `sys_menu` VALUES (73, 41, '????????????', 'product/manager', '', 1, 'zonghe', 0);
INSERT INTO `sys_menu` VALUES (74, 42, '????????????', 'coupon/memberprice', '', 1, 'admin', 0);
INSERT INTO `sys_menu` VALUES (75, 42, '????????????', 'coupon/seckillsession', '', 1, 'job', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL??????',
  `create_date` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '???????????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '???',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '?????????',
  `status` tinyint NULL DEFAULT NULL COMMENT '??????  0?????????   1?????????',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'BuyYouYu', '42ed47348041f123678b03cff8ddc4c7127e368e60a2e296d8e2c24fc3621821', 'dm6lfhpxf4YUJYvwFffc', '1395234017@qq.com', '13790221757', 1, 1, '2022-12-06 23:06:19');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '???????????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  `update_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'a696811cfff3b7858fa04398bc136486', '2022-12-11 01:13:52', '2022-12-10 13:13:52');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
