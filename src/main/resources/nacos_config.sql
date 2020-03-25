/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17 : Database - nacos_config
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nacos_config` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nacos_config`;

/*Table structure for table `config_info` */

DROP TABLE IF EXISTS `config_info`;

CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

/*Data for the table `config_info` */

insert  into `config_info`(`id`,`data_id`,`group_id`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`app_name`,`tenant_id`,`c_desc`,`c_use`,`effect`,`type`,`c_schema`) values (2,'nacos-restful-consumer.yaml','DEFAULT_GROUP','common:\r\n    name: config\r\n    addr: addrsss','2b195ac4f64785ce9f257937838c3c64','2020-03-24 22:04:59','2020-03-24 22:12:50',NULL,'0:0:0:0:0:0:0:1','','','nacos-restful-consumer.yaml','null','null','yaml','null'),(6,'ext-config-http.yaml','COMMON_GROUP','#HTTP格式配置\r\nspring:\r\n#--------------------------charset--------------------------\r\n  http:\r\n    encoding:\r\n      charset: UTF-8\r\n      enabled: true\r\n      force: true\r\n  messages:\r\n    encoding: UTF‐8\r\n#tomcat头信息和访问路径配置\r\nserver:\r\n  tomcat:\r\n    remote_ip_header: x‐forwarded‐for\r\n    protocol_header: x‐forwarded‐proto\r\n  servlet:\r\n    context‐path: /\r\n  use‐forward‐headers: true\r\n','3fb6e2693617aa1480380ae6b70bfc62','2020-03-24 22:35:38','2020-03-24 22:41:55',NULL,'0:0:0:0:0:0:0:1','','','ext-config-http.yaml','null','null','yaml','null');

/*Table structure for table `config_info_aggr` */

DROP TABLE IF EXISTS `config_info_aggr`;

CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

/*Data for the table `config_info_aggr` */

/*Table structure for table `config_info_beta` */

DROP TABLE IF EXISTS `config_info_beta`;

CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

/*Data for the table `config_info_beta` */

/*Table structure for table `config_info_tag` */

DROP TABLE IF EXISTS `config_info_tag`;

CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

/*Data for the table `config_info_tag` */

/*Table structure for table `config_tags_relation` */

DROP TABLE IF EXISTS `config_tags_relation`;

CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

/*Data for the table `config_tags_relation` */

/*Table structure for table `group_capacity` */

DROP TABLE IF EXISTS `group_capacity`;

CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

/*Data for the table `group_capacity` */

/*Table structure for table `his_config_info` */

DROP TABLE IF EXISTS `his_config_info`;

CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

/*Data for the table `his_config_info` */

insert  into `his_config_info`(`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`) values (0,1,'nacos-restful-consumer','DEFAULT_GROUP','','common:\r\n    name: config','f84554dfd261cf071e71699be24fc53a','2010-05-05 00:00:00','2020-03-24 21:55:48',NULL,'0:0:0:0:0:0:0:1','I',''),(0,2,'nacos-restful-consumer.yaml','DEFAULT_GROUP','','common:\r\n    name: config','f84554dfd261cf071e71699be24fc53a','2010-05-05 00:00:00','2020-03-24 22:04:59',NULL,'0:0:0:0:0:0:0:1','I',''),(1,3,'nacos-restful-consumer','DEFAULT_GROUP','','common:\r\n    name: config','f84554dfd261cf071e71699be24fc53a','2010-05-05 00:00:00','2020-03-24 22:05:08',NULL,'0:0:0:0:0:0:0:1','D',''),(2,4,'nacos-restful-consumer.yaml','DEFAULT_GROUP','','common:\r\n    name: config','f84554dfd261cf071e71699be24fc53a','2010-05-05 00:00:00','2020-03-24 22:11:06',NULL,'0:0:0:0:0:0:0:1','U',''),(2,5,'nacos-restful-consumer.yaml','DEFAULT_GROUP','','common:\r\n    name: config\r\n    addr: addr','15bb112e8eddf256fcebe09307fcfae1','2010-05-05 00:00:00','2020-03-24 22:12:50',NULL,'0:0:0:0:0:0:0:1','U',''),(0,6,'ext-config-http.yaml','DEFAULT_GROUP','','#HTTP格式配置\r\nspring:\r\n  http:\r\n    encoding:\r\n      charset: UTF‐8\r\n      force: true\r\n      enabled: true\r\n  messages:\r\nencoding: UTF‐8\r\n#tomcat头信息和访问路径配置\r\nserver:\r\n  tomcat:\r\n    remote_ip_header: x‐forwarded‐for\r\n    protocol_header: x‐forwarded‐proto\r\n  servlet:\r\n    context‐path: /a\r\n  use‐forward‐headers: true\r\n','1e7642eab0f84821f8b7bfa4dd1193de','2010-05-05 00:00:00','2020-03-24 22:34:29',NULL,'0:0:0:0:0:0:0:1','I',''),(5,7,'ext-config-http.yaml','DEFAULT_GROUP','','#HTTP格式配置\r\nspring:\r\n  http:\r\n    encoding:\r\n      charset: UTF‐8\r\n      force: true\r\n      enabled: true\r\n  messages:\r\nencoding: UTF‐8\r\n#tomcat头信息和访问路径配置\r\nserver:\r\n  tomcat:\r\n    remote_ip_header: x‐forwarded‐for\r\n    protocol_header: x‐forwarded‐proto\r\n  servlet:\r\n    context‐path: /a\r\n  use‐forward‐headers: true\r\n','1e7642eab0f84821f8b7bfa4dd1193de','2010-05-05 00:00:00','2020-03-24 22:35:02',NULL,'0:0:0:0:0:0:0:1','D',''),(0,8,'ext-config-http.yaml','COMMON_GROUP','','#HTTP格式配置\r\nspring:\r\n  http:\r\n    encoding:\r\n      charset: UTF‐8\r\n      force: true\r\n      enabled: true\r\n  messages:\r\nencoding: UTF‐8\r\n#tomcat头信息和访问路径配置\r\nserver:\r\n  tomcat:\r\n    remote_ip_header: x‐forwarded‐for\r\n    protocol_header: x‐forwarded‐proto\r\n  servlet:\r\n    context‐path: /a\r\n  use‐forward‐headers: true\r\n','1e7642eab0f84821f8b7bfa4dd1193de','2010-05-05 00:00:00','2020-03-24 22:35:38',NULL,'0:0:0:0:0:0:0:1','I',''),(6,9,'ext-config-http.yaml','COMMON_GROUP','','#HTTP格式配置\r\nspring:\r\n  http:\r\n    encoding:\r\n      charset: UTF‐8\r\n      force: true\r\n      enabled: true\r\n  messages:\r\nencoding: UTF‐8\r\n#tomcat头信息和访问路径配置\r\nserver:\r\n  tomcat:\r\n    remote_ip_header: x‐forwarded‐for\r\n    protocol_header: x‐forwarded‐proto\r\n  servlet:\r\n    context‐path: /a\r\n  use‐forward‐headers: true\r\n','1e7642eab0f84821f8b7bfa4dd1193de','2010-05-05 00:00:00','2020-03-24 22:38:36',NULL,'0:0:0:0:0:0:0:1','U',''),(6,10,'ext-config-http.yaml','COMMON_GROUP','','#HTTP格式配置\r\nspring:\r\n  http:\r\n    encoding:\r\n      charset: UTF‐8\r\n      force: true\r\n      enabled: true\r\n  messages:\r\n    encoding: UTF‐8\r\n#tomcat头信息和访问路径配置\r\nserver:\r\n  tomcat:\r\n    remote_ip_header: x‐forwarded‐for\r\n    protocol_header: x‐forwarded‐proto\r\n  servlet:\r\n    context‐path: /a\r\n  use‐forward‐headers: true\r\n','a8104fe8b291195e49aed00faa1c2fb3','2010-05-05 00:00:00','2020-03-24 22:40:58',NULL,'0:0:0:0:0:0:0:1','U',''),(6,11,'ext-config-http.yaml','COMMON_GROUP','','#HTTP格式配置\r\nspring:\r\n#--------------------------charset--------------------------\r\n  http:\r\n    encoding:\r\n      charset: UTF-8\r\n      enabled: true\r\n      force: true\r\n  messages:\r\n    encoding: UTF‐8\r\n#tomcat头信息和访问路径配置\r\nserver:\r\n  tomcat:\r\n    remote_ip_header: x‐forwarded‐for\r\n    protocol_header: x‐forwarded‐proto\r\n  servlet:\r\n    context‐path: /a\r\n  use‐forward‐headers: true\r\n','085811de609f2eae514a9a21b981948b','2010-05-05 00:00:00','2020-03-24 22:41:55',NULL,'0:0:0:0:0:0:0:1','U','');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`username`,`role`) values ('nacos','ROLE_ADMIN');

/*Table structure for table `tenant_capacity` */

DROP TABLE IF EXISTS `tenant_capacity`;

CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

/*Data for the table `tenant_capacity` */

/*Table structure for table `tenant_info` */

DROP TABLE IF EXISTS `tenant_info`;

CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

/*Data for the table `tenant_info` */

insert  into `tenant_info`(`id`,`kp`,`tenant_id`,`tenant_name`,`tenant_desc`,`create_source`,`gmt_create`,`gmt_modified`) values (1,'1','a4bea1bb-a91e-41fc-9385-c094b4cf3277','dev','测试','nacos',1585037906242,1585037906242);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`username`,`password`,`enabled`) values ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
