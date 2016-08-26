-- MySQL dump 10.13  Distrib 5.6.31, for osx10.8 (x86_64)
--
-- Host: localhost    Database: weichat
-- ------------------------------------------------------
-- Server version	5.6.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agentqueue`
--

DROP TABLE IF EXISTS `agentqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentqueue` (
  `queueId` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `queueName` varchar(45) NOT NULL,
  `queueType` enum('QueueNormal','QueueTemp') DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `queueGroupType` enum('SystemDefault','UserDefined') DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`queueId`),
  UNIQUE KEY `UK_QUEUE_NAME` (`tenantId`,`queueName`),
  UNIQUE KEY `tenantId` (`tenantId`,`queueName`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=6799 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agentqueue_and_agentuser`
--

DROP TABLE IF EXISTS `agentqueue_and_agentuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentqueue_and_agentuser` (
  `tenantId` int(11) DEFAULT '0',
  `queueId` bigint(20) NOT NULL,
  `agentUserId` char(36) NOT NULL,
  PRIMARY KEY (`queueId`,`agentUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agentqueue_and_agentuser_backup_1125`
--

DROP TABLE IF EXISTS `agentqueue_and_agentuser_backup_1125`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentqueue_and_agentuser_backup_1125` (
  `tenantId` int(11) DEFAULT '0',
  `queueId` bigint(20) NOT NULL,
  `agentUserId` char(36) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agentuser`
--

DROP TABLE IF EXISTS `agentuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentuser` (
  `userId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT '0',
  `nicename` varchar(280) DEFAULT '',
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `roles` varchar(200) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  `status` enum('Enable','Disable') DEFAULT NULL,
  `onLineState` enum('Idle','Online','Busy','Leave','Other','Offline','Hidden','Logout') DEFAULT NULL,
  `maxServiceSessionCount` int(11) DEFAULT '15',
  `mobilePhone` varchar(45) DEFAULT NULL,
  `agentNumber` varchar(45) DEFAULT NULL,
  `welcomeMessage` varchar(45) DEFAULT NULL,
  `lastActiveDateTime` datetime DEFAULT NULL,
  `trueName` varchar(50) DEFAULT NULL,
  `realTimeOnlineState` tinyint(4) DEFAULT NULL,
  `instanceId` varchar(36) DEFAULT NULL,
  `currentServiceSessionCount` int(11) DEFAULT '0',
  `avatar` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agentuser_easemob`
--

DROP TABLE IF EXISTS `agentuser_easemob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentuser_easemob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(36) NOT NULL,
  `easemobId` varchar(280) NOT NULL,
  `easemobPassword` varchar(280) NOT NULL,
  `loginLocation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agnetuser_and_chatgroup_router`
--

DROP TABLE IF EXISTS `agnetuser_and_chatgroup_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agnetuser_and_chatgroup_router` (
  `agnetuser_and_chatgroup_routerId` varchar(200) NOT NULL,
  `chatgroupId` int(11) NOT NULL,
  `fromUserId` varchar(36) DEFAULT NULL,
  `toUserId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`agnetuser_and_chatgroup_routerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `announcementId` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `welcomeMessage` varchar(1000) DEFAULT '',
  `welcomeMessageEnable` tinyint(1) DEFAULT '1',
  `promotionMessage1` varchar(1000) DEFAULT '',
  `promotionUrl1` varchar(200) DEFAULT NULL,
  `promotionMessage1Enable` tinyint(1) DEFAULT '1',
  `promotionMessage2` varchar(1000) DEFAULT '',
  `promotionUrl2` varchar(200) DEFAULT '',
  `promotionMessage2Enable` tinyint(1) DEFAULT '0',
  `timeOffWorkMessage` varchar(1000) DEFAULT '现在是下班时间，请留言。',
  `timeOffWorkEnable` tinyint(1) DEFAULT '0',
  `businessHoursStartTime` time DEFAULT '09:00:00',
  `businessHoursStopTime` time DEFAULT '18:00:00',
  `workday` varchar(45) DEFAULT '1,2,3,4,5',
  `stopServiceSessionMessage` varchar(1000) DEFAULT '会话已结束。',
  `stopServiceSessionEnable` tinyint(1) DEFAULT '0',
  `agentAllBusyEnable` tinyint(1) DEFAULT '0',
  `agentAllBusyMessage` varchar(1000) DEFAULT '抱歉，客服座席全忙，请稍后。',
  PRIMARY KEY (`announcementId`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=6048 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `icon_url` varchar(500) DEFAULT NULL,
  `is_default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `channelInstanceId` int(11) NOT NULL AUTO_INCREMENT COMMENT '通道实例id',
  `channelType` varchar(45) DEFAULT NULL COMMENT '通道类型描述',
  `channelProviderId` varchar(36) DEFAULT NULL COMMENT '通道识别ID',
  `username` varchar(45) DEFAULT NULL COMMENT '通道管理用户',
  `password` varchar(45) DEFAULT NULL COMMENT '通道管理密码',
  `providerURL` varchar(255) DEFAULT NULL COMMENT '通道管理地址',
  `channelAccount` varchar(45) DEFAULT NULL COMMENT '通道识别账户（呼叫中心中指热线）',
  `providerTenantId` varchar(45) DEFAULT NULL COMMENT '媒体通道 在提供者系统中的 租户id',
  `tenantId` int(11) DEFAULT '0' COMMENT '租户ID',
  `recordFileUrl` varchar(255) DEFAULT NULL COMMENT '获取录音文件的地址',
  `hotline` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`channelInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体通道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_provider`
--

DROP TABLE IF EXISTS `channel_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_provider` (
  `channelType` varchar(45) DEFAULT NULL COMMENT '通道类型描述',
  `channelProviderId` varchar(36) NOT NULL COMMENT '通道识别ID',
  `channelProviderDescription` varchar(255) DEFAULT NULL COMMENT '通道描述',
  PRIMARY KEY (`channelProviderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指明系统中所有媒体交互通道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_service_account`
--

DROP TABLE IF EXISTS `channel_service_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_service_account` (
  `channelServiceAccountId` varchar(36) NOT NULL COMMENT '通道的账号ID (UUID)',
  `userId` varchar(36) DEFAULT NULL COMMENT '用户ID',
  `providerUserId` varchar(36) DEFAULT NULL COMMENT '第三方渠道座席id',
  `channelInstanceId` int(11) DEFAULT NULL COMMENT '通道实例id',
  `accountName` varchar(45) DEFAULT NULL COMMENT '在通道实例下的 用户',
  `accountNumber` varchar(45) DEFAULT NULL COMMENT '通道实例账号下的工号',
  `accountPower` varchar(45) DEFAULT NULL COMMENT '0表示普通座席,1表示班长座席',
  `accountClientType` varchar(45) DEFAULT NULL COMMENT '1表示电话座席,2表示电脑座席',
  `accountTel` varchar(45) DEFAULT NULL COMMENT '座席绑定电话 电话号码格式.手机或区号+固话号码',
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  `agentUserName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`channelServiceAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通道用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatgroup`
--

DROP TABLE IF EXISTS `chatgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatgroup` (
  `chatGroupId` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `groupType` enum('MultiGroup','TwoGroup') DEFAULT NULL,
  `chatGroupName` varchar(720) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `chatGroupMessageSeq` int(11) DEFAULT '0',
  `last_chatmessage_msgId` char(36) DEFAULT NULL,
  `last_chatmessage_messageType` varchar(50) DEFAULT NULL,
  `last_chatmessage_contentType` varchar(50) DEFAULT NULL,
  `last_chatmessage_body` varchar(5000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `last_chatmessage_createDateTime` datetime DEFAULT NULL,
  `last_chatmessage_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`chatGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatmessage`
--

DROP TABLE IF EXISTS `chatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmessage` (
  `msgId` char(36) CHARACTER SET utf8 NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `messageType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `fromUserId` char(36) CHARACTER SET utf8 DEFAULT NULL,
  `toUserId` char(36) CHARACTER SET utf8 DEFAULT NULL,
  `contentType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `body` varchar(5000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `chatGroupSeqId` bigint(20) DEFAULT NULL,
  `sessionServiceSeqId` bigint(20) DEFAULT NULL,
  `createDateTime` datetime(6) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `chatGroupId` bigint(20) DEFAULT NULL,
  `sessionServiceId` char(36) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `hour` int(11) DEFAULT NULL,
  `year_month_day` int(11) DEFAULT NULL,
  `fromuser_userId` char(36) CHARACTER SET utf8mb4 DEFAULT NULL,
  `fromuser_userType` enum('System','Agent','Visitor','All','Moderator','Scheduler','Unkown','Robot') CHARACTER SET utf8mb4 DEFAULT NULL,
  `fromuser_nicename` varchar(280) CHARACTER SET utf8mb4 DEFAULT NULL,
  `touser_userId` char(36) CHARACTER SET utf8mb4 DEFAULT NULL,
  `touser_userType` enum('System','Agent','Visitor','All','Moderator','Scheduler','Unkown','Robot') CHARACTER SET utf8mb4 DEFAULT NULL,
  `touser_nicename` varchar(280) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`msgId`),
  KEY `IDX_ddd` (`tenantId`,`sessionServiceId`,`sessionServiceSeqId`),
  KEY `IDX_TENANT_GROUP` (`tenantId`,`chatGroupId`,`chatGroupSeqId`),
  KEY `IDX_CHATGROUP` (`chatGroupId`),
  KEY `IDX_CHATGROUP_ID` (`chatGroupId`),
  KEY `IDX_SERVICESESSION` (`sessionServiceId`),
  KEY `IDX_TENANT_CREATEDATETIME` (`tenantId`,`createDateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatroom` (
  `chatRoomId` char(36) NOT NULL,
  `serviceSessionId` char(36) DEFAULT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `chatGroupId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`chatRoomId`),
  KEY `FK_chatroom_ServiceSession_idx` (`serviceSessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientcredential`
--

DROP TABLE IF EXISTS `clientcredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientcredential` (
  `clientId` varchar(255) NOT NULL DEFAULT '' COMMENT '客户端ID',
  `clientSecret` varchar(255) DEFAULT NULL COMMENT '客户端密码',
  `easemobOrgName` varchar(255) DEFAULT NULL,
  `easemobAppName` varchar(255) DEFAULT NULL,
  `easemobClientId` varchar(255) DEFAULT NULL,
  `easemobClientSecret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端凭证信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `creator_id` char(36) DEFAULT NULL,
  `creator_type` int(11) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL,
  `reply_id` bigint(20) DEFAULT NULL,
  `subject` varchar(500) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment_attachments`
--

DROP TABLE IF EXISTS `comment_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_attachments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  KEY `FK_100mdqqk32w6lw4yhbh9nku7h` (`id`),
  CONSTRAINT `FK_100mdqqk32w6lw4yhbh9nku7h` FOREIGN KEY (`id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commonphrase`
--

DROP TABLE IF EXISTS `commonphrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commonphrase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT '0',
  `parentId` bigint(20) DEFAULT '0',
  `agentUserId` varchar(36) DEFAULT NULL,
  `leaf` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `phrase` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `brief` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `seq` int(11) DEFAULT '0',
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenantid_agentuserid_index` (`tenantId`,`agentUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=24727 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `easemobtechchannel`
--

DROP TABLE IF EXISTS `easemobtechchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easemobtechchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `lastSyncTimestamp` bigint(20) DEFAULT NULL,
  `name` varchar(280) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `orgName` varchar(45) DEFAULT NULL,
  `appName` varchar(45) DEFAULT NULL,
  `clientId` varchar(45) DEFAULT NULL,
  `clientSecret` varchar(250) DEFAULT NULL,
  `serviceEaseMobIMNumber` varchar(280) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `ispass` tinyint(1) DEFAULT NULL,
  `lastSyncCursor` varchar(255) DEFAULT NULL,
  `serviceEaseMobIMPassword` varchar(45) DEFAULT NULL,
  `isrun` tinyint(1) DEFAULT NULL,
  `isExperience` tinyint(1) DEFAULT NULL,
  `lastUpdaeDateTime` datetime DEFAULT NULL,
  `agentQueueId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TENANT` (`tenantId`),
  KEY `IDX_APPKEY` (`orgName`,`appName`),
  KEY `agentQueueId` (`agentQueueId`),
  CONSTRAINT `easemobtechchannel_ibfk_1` FOREIGN KEY (`agentQueueId`) REFERENCES `agentqueue` (`queueId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10687 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `easemobtechchannelcontext`
--

DROP TABLE IF EXISTS `easemobtechchannelcontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easemobtechchannelcontext` (
  `easeMobTechChannelContextId` varchar(200) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `visitorUserId` char(36) DEFAULT NULL,
  `easeMobTechChannelId` int(11) DEFAULT NULL,
  `serviceSessionId` char(36) DEFAULT NULL,
  `lastSessionServiceSeqId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`easeMobTechChannelContextId`),
  KEY `FK_ServiceSession_idx` (`serviceSessionId`),
  KEY `FK_easemobtechchannelcontext_ServiceSession_idx` (`serviceSessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquiry` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `serviceSessionId` char(36) NOT NULL,
  `visitorUserId` char(36) NOT NULL,
  `agentUserId` char(36) NOT NULL,
  `inviteId` int(32) NOT NULL DEFAULT '0',
  `createDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `summary` varchar(15) NOT NULL,
  `detail` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_TENANTID_SERVICESESSIONID` (`tenantId`,`serviceSessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_connector_easemob_techchannel`
--

DROP TABLE IF EXISTS `im_connector_easemob_techchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_connector_easemob_techchannel` (
  `id` int(10) unsigned NOT NULL,
  `tenantId` int(11) unsigned NOT NULL,
  `appkey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invite_enquiry_data`
--

DROP TABLE IF EXISTS `invite_enquiry_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_enquiry_data` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `serviceSessionId` char(36) NOT NULL,
  `createDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_SERVICESESSIONID` (`serviceSessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `konghmacinfo`
--

DROP TABLE IF EXISTS `konghmacinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konghmacinfo` (
  `tenantId` int(11) NOT NULL,
  `consumerId` varchar(45) NOT NULL,
  `customId` varchar(1000) DEFAULT NULL,
  `consumerUsername` varchar(250) DEFAULT NULL,
  `hMacUsername` varchar(250) DEFAULT NULL,
  `secret` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tenantId`),
  KEY `UIDX_TENANTID_hMacUsername` (`tenantId`,`hMacUsername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `create_user_id` varchar(255) NOT NULL,
  `create_user_type` tinyint(4) NOT NULL,
  `create_user_ext` text NOT NULL,
  `origin_type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `callback_type` varchar(255) NOT NULL,
  `callback_target` varchar(255) NOT NULL,
  `tag_id` varchar(255) NOT NULL,
  `tag_name` varchar(255) NOT NULL DEFAULT '',
  `remarks` varchar(255) NOT NULL,
  `parent_note_id` int(11) NOT NULL,
  `note_subject_id` int(20) NOT NULL,
  `create_date_time` datetime NOT NULL,
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `optionId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `optionName` varchar(64) DEFAULT NULL,
  `optionValue` longtext,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`optionId`),
  UNIQUE KEY `tenantId_optionName_UNIQUE` (`tenantId`,`optionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organ`
--

DROP TABLE IF EXISTS `organ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `descr` varchar(200) DEFAULT NULL,
  `agentNumQuota` int(11) DEFAULT '0',
  `agentNumUsedQuota` int(11) DEFAULT '0',
  `tenantRegistOpen` tinyint(1) DEFAULT '1',
  `status` varchar(20) DEFAULT 'Enable',
  `www` varchar(190) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAME_UNIQUE` (`name`),
  UNIQUE KEY `WWW_UNIQUE` (`www`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organuser`
--

DROP TABLE IF EXISTS `organuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organuser` (
  `userId` varchar(36) NOT NULL,
  `organName` varchar(36) NOT NULL,
  `username` varchar(100) NOT NULL,
  `nicename` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'Enable',
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `USERNAME_UNIQUE` (`username`),
  KEY `IDX_ORGAN` (`organName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phonetechchannel`
--

DROP TABLE IF EXISTS `phonetechchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonetechchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `agentQueueId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_PHONENUMBER` (`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priority` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `icon_url` varchar(500) DEFAULT NULL,
  `is_default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `icon_url` varchar(500) DEFAULT NULL,
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resolution`
--

DROP TABLE IF EXISTS `resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolution` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `icon_url` varchar(500) DEFAULT NULL,
  `is_default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resttechchannel`
--

DROP TABLE IF EXISTS `resttechchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resttechchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `clientId` varchar(250) DEFAULT NULL,
  `clientSecret` varchar(250) DEFAULT NULL,
  `imNumber` varchar(45) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `channelType` varchar(45) DEFAULT NULL,
  `agentQueueId` bigint(20) DEFAULT NULL,
  `callbackUrl` varchar(1000) DEFAULT NULL,
  `useSignature` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UIDX_CLIENTID_IM` (`clientId`,`imNumber`),
  KEY `IDX_TENANT` (`tenantId`),
  KEY `UIDX_TENANTID_NAME` (`tenantId`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robot_menu`
--

DROP TABLE IF EXISTS `robot_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` char(36) NOT NULL,
  `parentMenuId` char(36) NOT NULL DEFAULT '0',
  `tenantId` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `rootMenuId` char(36) DEFAULT NULL,
  `menuName` varchar(128) NOT NULL,
  `menuDesc` varchar(256) NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuId_UNIQUE` (`menuId`),
  KEY `IDX_PARENT_MENU_ID` (`parentMenuId`),
  KEY `IDX_TENANT_PARENT_MENU_ID` (`tenantId`,`parentMenuId`),
  KEY `IDX_TENANTID_ROOTMENUID_MENUNAME` (`tenantId`,`rootMenuId`,`menuName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robot_menu_rule_item`
--

DROP TABLE IF EXISTS `robot_menu_rule_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_menu_rule_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` char(36) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `questionKey` varchar(256) NOT NULL,
  `menuId` char(36) NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krId_UNIQUE` (`itemId`),
  KEY `IDX_TENANT` (`tenantId`),
  KEY `IDX_MENU_ID` (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robot_personal_info`
--

DROP TABLE IF EXISTS `robot_personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_personal_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robotId` char(36) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `father` varchar(128) DEFAULT NULL,
  `mother` varchar(128) DEFAULT NULL,
  `school` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 男\n1: 女',
  `cityCode` varchar(45) DEFAULT '110108' COMMENT '110000 北京市\n110100 市辖区\n110101 东城区\n110102 西城区\n110103 崇文区\n110104 宣武区\n110105 朝阳区\n110106 丰台区\n110107 石景山区\n110108 海淀区\n110109 门头沟区\n110111 房山区\n110112 通州区\n110113 顺义区\n110114 昌平区\n110115 大兴区\n110116 怀柔区\n110117 平谷区',
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `blood` tinyint(1) DEFAULT '0' COMMENT '0: O\n1: A\n2: B\n3: AB\n4: Unknow\n',
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`robotId`),
  UNIQUE KEY `tenantId_UNIQUE` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robot_predefined_reply`
--

DROP TABLE IF EXISTS `robot_predefined_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_predefined_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `replyId` char(36) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0: default\n1: repeat\n2: timeout',
  `content` varchar(256) DEFAULT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `autoReplyId_UNIQUE` (`replyId`),
  KEY `IDX_TENANT_TYPE` (`tenantId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robot_rule_group`
--

DROP TABLE IF EXISTS `robot_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_rule_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` char(36) NOT NULL,
  `groupName` varchar(45) DEFAULT NULL,
  `tenantId` int(11) NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robot_rule_ruleId_UNIQUE` (`groupId`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robot_rule_item`
--

DROP TABLE IF EXISTS `robot_rule_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_rule_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` char(36) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `itemType` tinyint(1) DEFAULT NULL COMMENT '0: question key\n1: answer',
  `itemText` varchar(3072) DEFAULT NULL,
  `groupId` char(36) DEFAULT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krId_UNIQUE` (`itemId`),
  KEY `IDX_TENANT` (`tenantId`),
  KEY `IDX_GROUP_ID` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robot_user`
--

DROP TABLE IF EXISTS `robot_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robotId` char(36) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: xiaoi\n1: Easemob',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: inactive\n1: active',
  `rule` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: off hours first\n1: all day first',
  `appkey` varchar(45) NOT NULL,
  `appsecret` varchar(45) NOT NULL,
  `currentServiceSessionCount` int(11) NOT NULL DEFAULT '0',
  `maxServiceSessionCount` int(11) NOT NULL DEFAULT '100',
  `enableMenu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: enable\n1: disable',
  `timeout` int(11) NOT NULL DEFAULT '600',
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`robotId`),
  UNIQUE KEY `tenantId_UNIQUE` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession`
--

DROP TABLE IF EXISTS `servicesession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession` (
  `serviceSessionId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `chatRoomId` char(36) DEFAULT NULL,
  `techChannelId` int(11) DEFAULT NULL,
  `visitorUserId` char(36) DEFAULT NULL,
  `queueId` int(11) DEFAULT NULL COMMENT '调度队列ID',
  `state` enum('Wait','Scheduling','Processing','Terminal','Transfer','Resolved') DEFAULT 'Wait',
  `chatGroupId` bigint(20) DEFAULT NULL,
  `messageSeqId` int(11) DEFAULT NULL,
  `agentUserId` char(36) DEFAULT NULL,
  `agentUserType` tinyint(1) DEFAULT '1' COMMENT '0:System, //系统\n1:Agent, //客服\n2:Visitor, //访客\n3:All,\n4:Moderator, //主持人\n5:Scheduler, //调度员\n6:Robot,\n7:Unkown',
  `startDateTime` datetime(6) DEFAULT NULL,
  `stopDateTime` datetime(6) DEFAULT NULL,
  `createDatetime` datetime(6) DEFAULT NULL,
  `agentUserNiceName` varchar(45) DEFAULT NULL,
  `categoryId` int(11) DEFAULT '0',
  `last_chatmessage_msgId` char(36) DEFAULT NULL,
  `last_chatmessage_messageType` varchar(50) DEFAULT NULL,
  `last_chatmessage_contentType` varchar(50) DEFAULT NULL,
  `last_chatmessage_body` varchar(5000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `last_chatmessage_createDateTime` datetime(6) DEFAULT NULL,
  `last_chatmessage_timestamp` timestamp(6) NULL DEFAULT NULL,
  `techChannelType` varchar(45) DEFAULT NULL,
  `subcategoryId` int(11) DEFAULT '0',
  `originType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`serviceSessionId`),
  KEY `IDX_STATE_VISITOR` (`visitorUserId`,`tenantId`,`state`),
  KEY `IDX_AGENTUSERID` (`agentUserId`,`tenantId`,`state`),
  KEY `IDX_STLIU` (`queueId`,`state`,`tenantId`),
  KEY `IDX_TEST1` (`tenantId`,`categoryId`,`startDateTime`),
  KEY `IDX_CATE_TIME` (`tenantId`,`categoryId`,`startDateTime`),
  KEY `IDX_CreateDatetime_STATE` (`tenantId`,`createDatetime`,`state`),
  KEY `IDX_CreateDatetime_STATE_AGENTUSER` (`tenantId`,`state`,`agentUserId`,`createDatetime`),
  KEY `IDX_StopDateTime_STATE` (`state`,`stopDateTime`),
  KEY `IDX_TENANT_STATE` (`tenantId`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession_bak`
--

DROP TABLE IF EXISTS `servicesession_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession_bak` (
  `serviceSessionId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `chatRoomId` char(36) DEFAULT NULL,
  `techChannelId` int(11) DEFAULT NULL,
  `visitorUserId` char(36) DEFAULT NULL,
  `queueId` int(11) DEFAULT NULL COMMENT '调度队列ID',
  `state` enum('Wait','Scheduling','Processing','Terminal','Transfer') DEFAULT 'Wait',
  `chatGroupId` bigint(20) DEFAULT NULL,
  `messageSeqId` int(11) DEFAULT NULL,
  `agentUserId` char(36) DEFAULT NULL,
  `agentUserType` tinyint(1) DEFAULT '1' COMMENT '0:System, //系统\n1:Agent, //客服\n2:Visitor, //访客\n3:All,\n4:Moderator, //主持人\n5:Scheduler, //调度员\n6:Robot,\n7:Unkown',
  `startDateTime` datetime(6) DEFAULT NULL,
  `stopDateTime` datetime(6) DEFAULT NULL,
  `createDatetime` datetime(6) DEFAULT NULL,
  `agentUserNiceName` varchar(45) DEFAULT NULL,
  `categoryId` int(11) DEFAULT '0',
  `last_chatmessage_msgId` char(36) DEFAULT NULL,
  `last_chatmessage_messageType` varchar(50) DEFAULT NULL,
  `last_chatmessage_contentType` varchar(50) DEFAULT NULL,
  `last_chatmessage_body` varchar(5000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `last_chatmessage_createDateTime` datetime(6) DEFAULT NULL,
  `last_chatmessage_timestamp` timestamp(6) NULL DEFAULT NULL,
  `techChannelType` varchar(45) DEFAULT NULL,
  `subcategoryId` int(11) DEFAULT '0',
  PRIMARY KEY (`serviceSessionId`),
  KEY `IDX_STATE_VISITOR` (`visitorUserId`,`tenantId`,`state`),
  KEY `IDX_AGENTUSERID` (`agentUserId`,`tenantId`,`state`),
  KEY `IDX_STLIU` (`queueId`,`state`,`tenantId`),
  KEY `IDX_TEST1` (`tenantId`,`categoryId`,`startDateTime`),
  KEY `IDX_CATE_TIME` (`tenantId`,`categoryId`,`startDateTime`),
  KEY `IDX_CreateDatetime_STATE` (`tenantId`,`createDatetime`,`state`),
  KEY `IDX_CreateDatetime_STATE_AGENTUSER` (`tenantId`,`state`,`agentUserId`,`createDatetime`),
  KEY `IDX_StopDateTime_STATE` (`state`,`stopDateTime`),
  KEY `IDX_TENANT_STATE` (`tenantId`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession_comment`
--

DROP TABLE IF EXISTS `servicesession_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession_comment` (
  `serviceSessionId` char(36) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `createDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`serviceSessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession_origintype`
--

DROP TABLE IF EXISTS `servicesession_origintype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession_origintype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `serviceSessionId` char(36) NOT NULL,
  `msgId` char(36) NOT NULL,
  `createDatetime` datetime NOT NULL,
  `originType` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_tenantId_serviceSessionId` (`tenantId`,`serviceSessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession_prod`
--

DROP TABLE IF EXISTS `servicesession_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession_prod` (
  `serviceSessionId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `chatRoomId` char(36) DEFAULT NULL,
  `techChannelId` int(11) DEFAULT NULL,
  `visitorUserId` char(36) DEFAULT NULL,
  `queueId` int(11) DEFAULT NULL COMMENT '调度队列ID',
  `state` enum('Wait','Scheduling','Processing','Terminal','Transfer') DEFAULT 'Wait',
  `chatGroupId` bigint(20) DEFAULT NULL,
  `messageSeqId` int(11) DEFAULT NULL,
  `agentUserId` char(36) DEFAULT NULL,
  `agentUserType` tinyint(1) DEFAULT '1' COMMENT '0:System, //系统\n1:Agent, //客服\n2:Visitor, //访客\n3:All,\n4:Moderator, //主持人\n5:Scheduler, //调度员\n6:Robot,\n7:Unkown',
  `startDateTime` datetime(6) DEFAULT NULL,
  `stopDateTime` datetime(6) DEFAULT NULL,
  `createDatetime` datetime(6) DEFAULT NULL,
  `agentUserNiceName` varchar(45) DEFAULT NULL,
  `categoryId` int(11) DEFAULT '0',
  `last_chatmessage_msgId` char(36) DEFAULT NULL,
  `last_chatmessage_messageType` varchar(50) DEFAULT NULL,
  `last_chatmessage_contentType` varchar(50) DEFAULT NULL,
  `last_chatmessage_body` varchar(5000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `last_chatmessage_createDateTime` datetime(6) DEFAULT NULL,
  `last_chatmessage_timestamp` timestamp(6) NULL DEFAULT NULL,
  `techChannelType` varchar(45) DEFAULT NULL,
  `subcategoryId` int(11) DEFAULT '0',
  PRIMARY KEY (`serviceSessionId`),
  KEY `IDX_STATE_VISITOR` (`visitorUserId`,`tenantId`,`state`),
  KEY `IDX_AGENTUSERID` (`agentUserId`,`tenantId`,`state`),
  KEY `IDX_STLIU` (`queueId`,`state`,`tenantId`),
  KEY `IDX_TEST1` (`tenantId`,`categoryId`,`startDateTime`),
  KEY `IDX_CATE_TIME` (`tenantId`,`categoryId`,`startDateTime`),
  KEY `IDX_CreateDatetime_STATE` (`tenantId`,`createDatetime`,`state`),
  KEY `IDX_CreateDatetime_STATE_AGENTUSER` (`tenantId`,`state`,`agentUserId`,`createDatetime`),
  KEY `IDX_StopDateTime_STATE` (`state`,`stopDateTime`),
  KEY `IDX_TENANT_STATE` (`tenantId`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession_summary`
--

DROP TABLE IF EXISTS `servicesession_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `color` bigint(10) NOT NULL DEFAULT '0',
  `createDateTime` datetime(6) NOT NULL,
  `lastUpdateDateTime` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_TENANT_PARENT_DELETED` (`tenantId`,`parentId`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=9061 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession_summary_mapping`
--

DROP TABLE IF EXISTS `servicesession_summary_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession_summary_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId_subcategoryId` int(11) NOT NULL,
  `summaryId` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CATEGORYID_SUBCATEGORYID` (`categoryId_subcategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesession_summary_result`
--

DROP TABLE IF EXISTS `servicesession_summary_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesession_summary_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `serviceSessionId` char(36) NOT NULL,
  `summaryId` int(11) NOT NULL,
  `createDateTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TENANT_SERVICESESSION` (`tenantId`,`serviceSessionId`),
  KEY `IDX_SUMMARY` (`summaryId`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesessioncategory`
--

DROP TABLE IF EXISTS `servicesessioncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesessioncategory` (
  `serviceSessionCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`serviceSessionCategoryId`),
  KEY `IDX_TENANT_DEL` (`tenantId`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesessionhistory_file`
--

DROP TABLE IF EXISTS `servicesessionhistory_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesessionhistory_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `agentUserId` char(36) NOT NULL,
  `cond` varchar(4000) CHARACTER SET utf8mb4 NOT NULL,
  `createTime` datetime NOT NULL,
  `status` enum('Creating','Failed','Finished','Expired','TooLarge') DEFAULT NULL,
  `fileSize` double DEFAULT NULL,
  `mediaId` varchar(255) DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TENNAT_ID_INDEX` (`tenantId`),
  KEY `AGENT_USER_ID_INDEX` (`agentUserId`),
  CONSTRAINT `AGENT_USER_ID_FK` FOREIGN KEY (`agentUserId`) REFERENCES `agentuser` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TENNAT_ID_FK` FOREIGN KEY (`tenantId`) REFERENCES `tenant` (`tenantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesessionsubcategory`
--

DROP TABLE IF EXISTS `servicesessionsubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesessionsubcategory` (
  `serviceSessionSubcategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `serviceSessionCategoryId` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`serviceSessionSubcategoryId`),
  KEY `serviceSessionCategoryId_idx` (`serviceSessionCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortcutmessage`
--

DROP TABLE IF EXISTS `shortcutmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcutmessage` (
  `shortcutMessageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `groupId` int(11) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`shortcutMessageId`),
  KEY `IDX_TENANT_GROUP` (`groupId`,`tenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=232567 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortcutmessagegroup`
--

DROP TABLE IF EXISTS `shortcutmessagegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcutmessagegroup` (
  `shortcutMessageGroupId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `agentUserId` char(36) DEFAULT NULL,
  `shortcutMessageGroupName` varchar(50) DEFAULT NULL,
  `groupType` enum('System','AgentUser') DEFAULT NULL,
  PRIMARY KEY (`shortcutMessageGroupId`),
  UNIQUE KEY `UK_NAME` (`tenantId`,`agentUserId`,`shortcutMessageGroupName`,`groupType`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=36016 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_session_quality_data`
--

DROP TABLE IF EXISTS `statistics_session_quality_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_session_quality_data` (
  `uuid` varchar(100) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `agentUserId` varchar(100) DEFAULT NULL,
  `agentUserName` varchar(100) DEFAULT NULL,
  `sessionConnections` int(11) DEFAULT NULL,
  `maxConnectionTimes` int(11) DEFAULT NULL,
  `avgConnectionTimes` double(11,2) DEFAULT NULL,
  `avgWeightConnectionTimes` double(11,2) DEFAULT NULL,
  `maxAnswerTimes` int(11) DEFAULT NULL,
  `avgAnswerTimes` double(11,2) DEFAULT NULL,
  `avgWeightAnswerTimes` double(11,2) DEFAULT NULL,
  `batchId` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_session_quality_log`
--

DROP TABLE IF EXISTS `statistics_session_quality_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_session_quality_log` (
  `uuid` varchar(100) NOT NULL,
  `tenantId` varchar(100) DEFAULT NULL,
  `sessionServiceId` varchar(100) DEFAULT NULL,
  `visitorId` varchar(100) DEFAULT NULL,
  `visitorName` varchar(100) DEFAULT NULL,
  `visitorMsgId` varchar(100) DEFAULT NULL,
  `visitorMsgCreateDateTime` datetime DEFAULT NULL,
  `agentUserId` varchar(100) DEFAULT NULL,
  `agentUserName` varchar(100) DEFAULT NULL,
  `agentMsgId` varchar(100) DEFAULT NULL,
  `agentMsgCreateDateTime` datetime DEFAULT NULL,
  `logType` varchar(100) DEFAULT 'session_more_chat',
  `sessionCreateDateTime` datetime DEFAULT NULL,
  `sessionStartDateTime` datetime DEFAULT NULL,
  `sessionStopDateTime` datetime DEFAULT NULL,
  `scheduleId` varchar(100) DEFAULT NULL,
  `schedulerDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_session_query`
--

DROP TABLE IF EXISTS `statistics_session_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_session_query` (
  `uuid` varchar(100) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `startDateTime` varchar(100) DEFAULT NULL,
  `endDateTime` varchar(100) DEFAULT NULL,
  `groupId` varchar(100) DEFAULT NULL,
  `queryType` varchar(100) NOT NULL,
  `batchId` varchar(100) NOT NULL,
  `hold0` varchar(100) DEFAULT NULL,
  `hold1` varchar(100) DEFAULT NULL,
  `hold2` varchar(100) DEFAULT NULL,
  `hold3` varchar(100) DEFAULT NULL,
  `hold4` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_session_status`
--

DROP TABLE IF EXISTS `statistics_session_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_session_status` (
  `uuid` varchar(100) NOT NULL,
  `agent_user_Id` varchar(100) DEFAULT NULL,
  `agent_user_name` varchar(100) DEFAULT NULL,
  `tenantId` int(11) DEFAULT '0',
  `login_count` int(11) DEFAULT '0',
  `online_count` int(11) DEFAULT '0',
  `sum_online_time` int(11) DEFAULT '0',
  `max_online_time` int(11) DEFAULT '0',
  `avg_online_time` double(11,2) DEFAULT '0.00',
  `batch_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_session_workload_data`
--

DROP TABLE IF EXISTS `statistics_session_workload_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_session_workload_data` (
  `uuid` varchar(100) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `agentUserId` varchar(100) DEFAULT NULL,
  `agentUserName` varchar(100) DEFAULT NULL,
  `sessionCount` int(11) DEFAULT NULL,
  `maxSessionlength` int(11) DEFAULT NULL,
  `avgSessionlength` double(11,2) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `sessionMaxMessageCount` int(11) DEFAULT NULL,
  `sessionAvgMessageCount` double(11,2) DEFAULT NULL,
  `batchId` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `icon_url` varchar(500) DEFAULT NULL,
  `is_default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_login_out_log`
--

DROP TABLE IF EXISTS `system_login_out_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_login_out_log` (
  `logId` varchar(100) NOT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `tenantId` int(11) DEFAULT '0',
  `sessionId` varchar(100) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `logoutTime` datetime DEFAULT NULL,
  `operationType` enum('login','logout','online','offline') DEFAULT NULL,
  `loginIp` varchar(100) DEFAULT NULL,
  `operationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_online_out_log`
--

DROP TABLE IF EXISTS `system_online_out_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_online_out_log` (
  `logId` varchar(100) NOT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `tenantId` int(11) DEFAULT '0',
  `sessionId` varchar(100) DEFAULT NULL,
  `instanceId` varchar(100) DEFAULT NULL,
  `onlineTime` datetime DEFAULT NULL,
  `offlineTime` datetime DEFAULT NULL,
  `operationType` enum('login','logout','online','offline') DEFAULT NULL,
  `operationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `techchannel`
--

DROP TABLE IF EXISTS `techchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `techChannelType` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `tenantId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `crateDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  `status` enum('Eanble','Disable','Delete') DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `isExperience` tinyint(1) DEFAULT NULL,
  `agentMaxNum` int(11) DEFAULT NULL COMMENT '×î´ó×ùÏ¯Êý',
  `avatar` varchar(500) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `domain` varchar(500) DEFAULT NULL,
  `organId` int(11) DEFAULT '1',
  `organName` varchar(36) DEFAULT 'easemob',
  PRIMARY KEY (`tenantId`),
  KEY `ORGAN_NAME` (`organName`)
) ENGINE=InnoDB AUTO_INCREMENT=11795 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tenantapp`
--

DROP TABLE IF EXISTS `tenantapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenantapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `orgName` varchar(100) NOT NULL,
  `appName` varchar(100) NOT NULL,
  `clientId` varchar(250) NOT NULL,
  `clientSecret` varchar(250) NOT NULL,
  `purpose` varchar(20) DEFAULT NULL,
  `certFile` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tenantId_UNIQUE` (`tenantId`),
  KEY `IDX_TENANT_CERTFILE` (`tenantId`,`certFile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `assignee_id` char(36) DEFAULT NULL,
  `assignee_type` int(11) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `closedAt` datetime DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `creator_id` varchar(500) DEFAULT NULL,
  `creator_type` int(11) DEFAULT NULL,
  `priority_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL,
  `rate_id` bigint(20) DEFAULT NULL,
  `resolvedAt` datetime DEFAULT NULL,
  `startedAt` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `subject` varchar(500) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PROJECT_IDX` (`tenant_id`,`project_id`),
  KEY `CREATOR_IDX` (`tenant_id`,`creator_id`(191)),
  KEY `ASSIGNEE_IDX` (`tenant_id`,`assignee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_attachments`
--

DROP TABLE IF EXISTS `ticket_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_attachments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  KEY `FK_1krp1onrhp2fepd22pt2jnk94` (`id`),
  CONSTRAINT `FK_1krp1onrhp2fepd22pt2jnk94` FOREIGN KEY (`id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_sequences`
--

DROP TABLE IF EXISTS `ticket_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_sequences` (
  `S_ID` varchar(100) NOT NULL,
  `S_NEXTNUM` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unreadtag`
--

DROP TABLE IF EXISTS `unreadtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unreadtag` (
  `tenantId` int(11) NOT NULL,
  `userId` char(36) NOT NULL,
  `remoteUserId` char(36) NOT NULL,
  `msgId` char(36) NOT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `chatGroupId` bigint(20) DEFAULT NULL,
  `sessionServiceId` varchar(36) DEFAULT NULL,
  `chatMessageBody` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`tenantId`,`userId`,`remoteUserId`,`msgId`),
  KEY `IDX_UnReadTagLocalUser` (`tenantId`,`userId`),
  KEY `IDX_UnReadTagUserChatGroup` (`tenantId`,`userId`,`chatGroupId`),
  KEY `IDX_UnReadTagUserServiceSession` (`tenantId`,`userId`,`sessionServiceId`),
  KEY `IDX_UnReadTagServiceSession` (`tenantId`,`sessionServiceId`),
  KEY `IDX_UnReadTagUserIdMsgId` (`tenantId`,`userId`,`msgId`),
  KEY `IDX_SESSION_ID` (`sessionServiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `userType` enum('System','Agent','Visitor','All','Moderator','Scheduler','Unkown') DEFAULT NULL,
  `nicename` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_and_chatgroup`
--

DROP TABLE IF EXISTS `user_and_chatgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_and_chatgroup` (
  `chatgroupId` int(11) NOT NULL,
  `userId` char(36) NOT NULL,
  `tenantId` int(11) NOT NULL,
  PRIMARY KEY (`chatgroupId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usertag`
--

DROP TABLE IF EXISTS `usertag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertag` (
  `userTagId` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `tagName` varchar(50) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userTagId`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=17820 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userwaitqueue`
--

DROP TABLE IF EXISTS `userwaitqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userwaitqueue` (
  `userWaitQueueId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `queueId` int(11) DEFAULT NULL,
  `visitorUserId` char(36) DEFAULT NULL,
  `userName` varchar(280) DEFAULT NULL,
  `serviceSessionId` char(36) DEFAULT NULL,
  `status` enum('Idle','WaitFor','Scheduling','Scheduled','Transfer','Terminal') DEFAULT NULL,
  `schedulerStartTime` datetime DEFAULT NULL,
  `schedulerTimeout` datetime DEFAULT NULL,
  `serviceNumber` int(11) DEFAULT NULL,
  `agentUserId` char(36) DEFAULT NULL,
  `isWatchTimeout` tinyint(1) DEFAULT '0',
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userWaitQueueId`),
  KEY `FK_ServiceSession_idx` (`serviceSessionId`),
  KEY `IDX_ST_Q_WATCH` (`status`,`queueId`,`isWatchTimeout`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitor_and_usertag`
--

DROP TABLE IF EXISTS `visitor_and_usertag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_and_usertag` (
  `visitorAndUserTagId` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `visitorUserId` char(36) DEFAULT NULL,
  `userTagId` int(11) DEFAULT NULL,
  PRIMARY KEY (`visitorAndUserTagId`),
  KEY `IDX_TENANT` (`tenantId`),
  KEY `IDX_T_UT` (`tenantId`,`visitorUserId`,`userTagId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitoruser`
--

DROP TABLE IF EXISTS `visitoruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitoruser` (
  `userId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT '0',
  `nicename` varchar(280) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(280) DEFAULT NULL,
  `techChannelType` varchar(45) DEFAULT NULL,
  `techChannelInstanceId` int(11) DEFAULT NULL,
  `techChannelInfo` varchar(500) DEFAULT NULL,
  `uri` varchar(200) DEFAULT NULL,
  `chatGroupId` bigint(20) DEFAULT NULL,
  `trueName` varchar(45) DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `qq` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `weixin` varchar(45) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  `sendMessageCount` bigint(20) DEFAULT '0',
  PRIMARY KEY (`userId`),
  KEY `IDX_CHANNEL` (`techChannelInstanceId`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitoruser_webim`
--

DROP TABLE IF EXISTS `visitoruser_webim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitoruser_webim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `easemobId` varchar(280) NOT NULL,
  `easemobPassword` varchar(280) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EASEMOBID` (`easemobId`(255))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wechatreply`
--

DROP TABLE IF EXISTS `wechatreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechatreply` (
  `id` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `serviceWeiboNumber` varchar(45) DEFAULT NULL,
  `replyType` varchar(20) DEFAULT NULL,
  `replyContentType` varchar(20) DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `detailUrl` varchar(500) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  `isEnable` tinyint(1) DEFAULT NULL,
  `replySeqId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TENANT_NUMBER_TYPE` (`tenantId`,`serviceWeiboNumber`,`replyType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wechatuser`
--

DROP TABLE IF EXISTS `wechatuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechatuser` (
  `openId` varchar(100) NOT NULL,
  `callbackUser` varchar(100) NOT NULL,
  `toUser` varchar(200) NOT NULL,
  `mp` varchar(100) NOT NULL,
  PRIMARY KEY (`openId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weibotechchannel`
--

DROP TABLE IF EXISTS `weibotechchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weibotechchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `lastSyncTimestamp` bigint(20) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `orgName` varchar(45) DEFAULT NULL,
  `appName` varchar(45) DEFAULT NULL,
  `clientId` varchar(45) DEFAULT NULL,
  `clientSecret` varchar(250) DEFAULT NULL,
  `serviceWeiboNumber` varchar(45) DEFAULT NULL,
  `serviceWeiboAccessToken` varchar(250) DEFAULT NULL,
  `authorizerRefreshToken` varchar(250) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `encodingAesKey` varchar(45) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `ispass` tinyint(1) DEFAULT NULL,
  `lastSyncCursor` varchar(255) DEFAULT NULL,
  `isrun` tinyint(1) DEFAULT NULL,
  `isExperience` tinyint(1) DEFAULT NULL,
  `lastUpdaeDateTime` datetime DEFAULT NULL,
  `channelType` varchar(45) DEFAULT NULL,
  `agentQueueId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agentQueueId` (`agentQueueId`),
  CONSTRAINT `weibotechchannel_ibfk_1` FOREIGN KEY (`agentQueueId`) REFERENCES `agentqueue` (`queueId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weibotechchannelcontext`
--

DROP TABLE IF EXISTS `weibotechchannelcontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weibotechchannelcontext` (
  `weiboTechChannelContextId` varchar(100) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `visitorUserId` char(36) DEFAULT NULL,
  `weiboTechChannelId` int(11) DEFAULT NULL,
  `serviceSessionId` char(36) DEFAULT NULL,
  `lastSessionServiceSeqId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`weiboTechChannelContextId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weixinopendata`
--

DROP TABLE IF EXISTS `weixinopendata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixinopendata` (
  `componentAppId` varchar(100) NOT NULL,
  `componentAppSecret` varchar(45) DEFAULT NULL,
  `componentAccessToken` varchar(200) DEFAULT NULL,
  `accessTokenExpires` bigint(20) DEFAULT NULL,
  `componentVerifyTicket` varchar(120) DEFAULT NULL,
  `verifyTicketExpires` bigint(20) DEFAULT NULL,
  `componentPreauthcode` varchar(120) DEFAULT NULL,
  `preauthcodeExpires` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`componentAppId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xdfvisitoruser`
--

DROP TABLE IF EXISTS `xdfvisitoruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xdfvisitoruser` (
  `userId` char(36) NOT NULL,
  `tenantId` int(11) DEFAULT '0',
  `nicename` varchar(280) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trueName` varchar(45) DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `qq` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `mobilephone1` varchar(45) DEFAULT NULL,
  `mobilephone2` varchar(45) DEFAULT NULL,
  `studentNo` varchar(45) DEFAULT NULL,
  `studentType` varchar(45) DEFAULT NULL,
  `studentGrade` varchar(45) DEFAULT NULL,
  `studentSchool` varchar(45) DEFAULT NULL,
  `consultCategory` varchar(45) DEFAULT NULL,
  `consultDept` varchar(45) DEFAULT NULL,
  `recommendIllustrate` varchar(45) DEFAULT NULL,
  `className1` varchar(45) DEFAULT NULL,
  `classNo1` varchar(45) DEFAULT NULL,
  `className2` varchar(45) DEFAULT NULL,
  `classNo2` varchar(45) DEFAULT NULL,
  `purposeClass` varchar(45) DEFAULT NULL,
  `creator` varchar(45) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `followAgent` varchar(45) DEFAULT NULL,
  `consultOrderType` varchar(45) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `lastUpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `IDX_TENANT` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xueersiext`
--

DROP TABLE IF EXISTS `xueersiext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueersiext` (
  `imId` char(36) NOT NULL,
  `city` varchar(45) NOT NULL,
  `cityCode` varchar(45) NOT NULL,
  `loginName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `displayName` varchar(45) NOT NULL DEFAULT '思思老师',
  `avatar` varchar(100) NOT NULL DEFAULT 'http://guanliimg.speiyou.com/avatar.png',
  PRIMARY KEY (`imId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-24 16:49:13
