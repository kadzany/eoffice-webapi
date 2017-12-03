-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eoffice2
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.28-MariaDB

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
-- Table structure for table `airport_list`
--

DROP TABLE IF EXISTS `airport_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport_list` (
  `id` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `id_country` varchar(4) NOT NULL,
  `country` varchar(50) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport_list`
--

LOCK TABLES `airport_list` WRITE;
/*!40000 ALTER TABLE `airport_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `airport_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_anggaran`
--

DROP TABLE IF EXISTS `detail_anggaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_anggaran` (
  `kode_anggaran` int(10) NOT NULL,
  `program_name` varchar(100) NOT NULL,
  `years` date NOT NULL,
  `anggaran` int(11) NOT NULL,
  PRIMARY KEY (`kode_anggaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_anggaran`
--

LOCK TABLES `detail_anggaran` WRITE;
/*!40000 ALTER TABLE `detail_anggaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_anggaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_telp`
--

DROP TABLE IF EXISTS `emp_telp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_telp` (
  `emp_num` int(11) NOT NULL,
  `telp_no` varchar(15) NOT NULL,
  UNIQUE KEY `telp_no` (`telp_no`),
  KEY `emp_num` (`emp_num`),
  CONSTRAINT `emp_telp_ibfk_1` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_telp`
--

LOCK TABLES `emp_telp` WRITE;
/*!40000 ALTER TABLE `emp_telp` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_telp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_passanger_data`
--

DROP TABLE IF EXISTS `flight_passanger_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_passanger_data` (
  `flight_res_id` int(11) NOT NULL,
  `pas_title` varchar(5) DEFAULT NULL,
  `pas_firstname` varchar(50) DEFAULT NULL,
  `pas_lastname` varchar(50) DEFAULT NULL,
  KEY `flight_res_id` (`flight_res_id`),
  CONSTRAINT `flight_passanger_data_ibfk_1` FOREIGN KEY (`flight_res_id`) REFERENCES `sppd_flight_res` (`flight_res_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_passanger_data`
--

LOCK TABLES `flight_passanger_data` WRITE;
/*!40000 ALTER TABLE `flight_passanger_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_passanger_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_fitur`
--

DROP TABLE IF EXISTS `flow_fitur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_fitur` (
  `fitur_id` int(11) NOT NULL AUTO_INCREMENT,
  `fitur_name` varchar(10) NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`fitur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_fitur`
--

LOCK TABLES `flow_fitur` WRITE;
/*!40000 ALTER TABLE `flow_fitur` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_fitur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_sppd`
--

DROP TABLE IF EXISTS `flow_sppd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_sppd` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT,
  `fitur_id` int(11) NOT NULL,
  `emp_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`flow_id`),
  KEY `fitur_id` (`fitur_id`,`emp_num`),
  KEY `emp_num` (`emp_num`),
  CONSTRAINT `flow_sppd_ibfk_1` FOREIGN KEY (`fitur_id`) REFERENCES `flow_fitur` (`fitur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flow_sppd_ibfk_2` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_sppd`
--

LOCK TABLES `flow_sppd` WRITE;
/*!40000 ALTER TABLE `flow_sppd` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_sppd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_config`
--

DROP TABLE IF EXISTS `hrms_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_title` varchar(255) NOT NULL,
  `tech_support` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `link1` varchar(255) NOT NULL,
  `link2` varchar(255) NOT NULL,
  `link1_desc` varchar(150) NOT NULL,
  `link2_desc` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_config`
--

LOCK TABLES `hrms_config` WRITE;
/*!40000 ALTER TABLE `hrms_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_counter`
--

DROP TABLE IF EXISTS `hrms_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_start_num` int(10) NOT NULL,
  `emp_counter_id` int(5) NOT NULL,
  `sppd_start_num` int(10) NOT NULL,
  `sppd_counter_id` int(5) NOT NULL,
  `job_start_num` int(10) NOT NULL,
  `job_counter_id` int(5) NOT NULL,
  `org_start_num` int(3) NOT NULL,
  `org_counter_id` int(10) NOT NULL,
  `app_title` varchar(255) NOT NULL,
  `tech_support` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_counter`
--

LOCK TABLES `hrms_counter` WRITE;
/*!40000 ALTER TABLE `hrms_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_employees`
--

DROP TABLE IF EXISTS `hrms_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_employees` (
  `emp_num` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) NOT NULL,
  `emp_firstname` text NOT NULL,
  `emp_lastname` text NOT NULL,
  `emp_gender` varchar(2) NOT NULL,
  `emp_dob` date NOT NULL,
  `emp_street` text NOT NULL,
  `emp_email` text NOT NULL,
  `emp_cutah` int(2) NOT NULL,
  `emp_trip` int(2) NOT NULL,
  `emp_cubes` int(2) NOT NULL,
  `emp_status` smallint(6) NOT NULL,
  `emp_job` int(11) DEFAULT NULL,
  `job_code` varchar(10) DEFAULT NULL,
  `pic_url` varchar(100) DEFAULT NULL,
  `emp_password` varchar(32) NOT NULL,
  `emp_username` varchar(30) NOT NULL,
  `role_user` int(11) NOT NULL,
  PRIMARY KEY (`emp_num`),
  UNIQUE KEY `emp_id` (`emp_id`),
  KEY `emp_job` (`emp_job`),
  KEY `fk_hrms_employees_hrms_role_user1_idx` (`role_user`),
  CONSTRAINT `fk_hrms_employees_hrms_role_user1` FOREIGN KEY (`role_user`) REFERENCES `hrms_role_user` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hrms_employees_ibfk_4` FOREIGN KEY (`emp_job`) REFERENCES `hrms_job` (`job_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_employees`
--

LOCK TABLES `hrms_employees` WRITE;
/*!40000 ALTER TABLE `hrms_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_job`
--

DROP TABLE IF EXISTS `hrms_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_job` (
  `job_num` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(10) NOT NULL,
  `job_code` varchar(10) DEFAULT NULL,
  `job_name` text,
  `job_description` text NOT NULL,
  `org_num` int(11) NOT NULL,
  `job_superior` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_num`),
  UNIQUE KEY `job_id` (`job_id`),
  KEY `org_num` (`org_num`),
  KEY `org_num_2` (`org_num`),
  KEY `fk_hrms_job_hrms_job1_idx` (`job_superior`),
  CONSTRAINT `fk_hrms_job_hrms_job1` FOREIGN KEY (`job_superior`) REFERENCES `hrms_job` (`job_num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hrms_job_ibfk_1` FOREIGN KEY (`org_num`) REFERENCES `hrms_organization` (`org_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_job`
--

LOCK TABLES `hrms_job` WRITE;
/*!40000 ALTER TABLE `hrms_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_notification`
--

DROP TABLE IF EXISTS `hrms_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_notification` (
  `notif_id` int(11) NOT NULL AUTO_INCREMENT,
  `notif_desc` varchar(255) NOT NULL,
  `notif_link` varchar(255) NOT NULL,
  `notif_type` int(11) NOT NULL,
  `emp_num` int(11) NOT NULL,
  `date_post` datetime NOT NULL,
  `time_post` time NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`notif_id`),
  KEY `notif_type` (`notif_type`),
  KEY `emp_num` (`emp_num`),
  CONSTRAINT `hrms_notification_ibfk_1` FOREIGN KEY (`notif_type`) REFERENCES `hrms_notification_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hrms_notification_ibfk_2` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_notification`
--

LOCK TABLES `hrms_notification` WRITE;
/*!40000 ALTER TABLE `hrms_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_notification_type`
--

DROP TABLE IF EXISTS `hrms_notification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_notification_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  `type_desc` varchar(50) NOT NULL,
  `type_url` varchar(100) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_notification_type`
--

LOCK TABLES `hrms_notification_type` WRITE;
/*!40000 ALTER TABLE `hrms_notification_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_notification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_organization`
--

DROP TABLE IF EXISTS `hrms_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_organization` (
  `org_num` int(11) NOT NULL AUTO_INCREMENT,
  `org_code` varchar(10) NOT NULL,
  `org_name` text NOT NULL,
  `org_address` text NOT NULL,
  `org_work_telp` varchar(25) NOT NULL,
  `org_email` text NOT NULL,
  `org_fax` varchar(25) NOT NULL,
  `org_postal_code` varchar(7) NOT NULL,
  `org_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`org_num`),
  KEY `org_sub` (`org_parent`),
  KEY `org_sub_2` (`org_parent`),
  KEY `org_sub_3` (`org_parent`),
  CONSTRAINT `hrms_organization_ibfk_1` FOREIGN KEY (`org_parent`) REFERENCES `hrms_organization` (`org_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_organization`
--

LOCK TABLES `hrms_organization` WRITE;
/*!40000 ALTER TABLE `hrms_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrms_role_user`
--

DROP TABLE IF EXISTS `hrms_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrms_role_user` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) NOT NULL,
  `role_description` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrms_role_user`
--

LOCK TABLES `hrms_role_user` WRITE;
/*!40000 ALTER TABLE `hrms_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrms_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nota_archive_view`
--

DROP TABLE IF EXISTS `nota_archive_view`;
/*!50001 DROP VIEW IF EXISTS `nota_archive_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nota_archive_view` AS SELECT 
 1 AS `nota_id`,
 1 AS `nota_number`,
 1 AS `nota_perihal`,
 1 AS `nota_isi`,
 1 AS `kode_masalah`,
 1 AS `creator`,
 1 AS `sender`,
 1 AS `forwarder`,
 1 AS `nota_read_status`,
 1 AS `emp_num`,
 1 AS `nota_date`,
 1 AS `create_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nota_comment`
--

DROP TABLE IF EXISTS `nota_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_num` int(11) NOT NULL,
  `status_disposisi` tinyint(4) NOT NULL DEFAULT '0',
  `exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `nota_comment_fk` (`nota_id`),
  KEY `nota_comment_fk2` (`emp_num`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_comment`
--

LOCK TABLES `nota_comment` WRITE;
/*!40000 ALTER TABLE `nota_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nota_custom_view`
--

DROP TABLE IF EXISTS `nota_custom_view`;
/*!50001 DROP VIEW IF EXISTS `nota_custom_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nota_custom_view` AS SELECT 
 1 AS `mapping_id`,
 1 AS `nota_id`,
 1 AS `nota_number`,
 1 AS `nota_perihal`,
 1 AS `nota_isi`,
 1 AS `nota_creator_num`,
 1 AS `nota_sender_num`,
 1 AS `nota_disposisi_num`,
 1 AS `nota_read_status`,
 1 AS `nota_date`,
 1 AS `nota_kode_masalah`,
 1 AS `creator`,
 1 AS `sender`,
 1 AS `forwarder`,
 1 AS `folder_name`,
 1 AS `emp_num`,
 1 AS `create_date`,
 1 AS `segera`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nota_data`
--

DROP TABLE IF EXISTS `nota_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_data` (
  `nota_id` varchar(20) NOT NULL,
  `nota_number` varchar(255) NOT NULL,
  `nota_perihal` varchar(255) NOT NULL,
  `nota_isi` text NOT NULL,
  `nota_creator_num` int(11) NOT NULL,
  `nota_sender_num` int(11) NOT NULL,
  `nota_disposisi_num` int(11) DEFAULT NULL,
  `nota_read_status` tinyint(4) NOT NULL DEFAULT '0',
  `nota_date` date NOT NULL,
  `nota_kode_masalah` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nota_id`),
  KEY `nota_data_fk` (`nota_creator_num`),
  KEY `nota_data_fk2` (`nota_sender_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_data`
--

LOCK TABLES `nota_data` WRITE;
/*!40000 ALTER TABLE `nota_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_default_code`
--

DROP TABLE IF EXISTS `nota_default_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_default_code` (
  `idnota_default_code` int(11) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(45) NOT NULL,
  `values` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idnota_default_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_default_code`
--

LOCK TABLES `nota_default_code` WRITE;
/*!40000 ALTER TABLE `nota_default_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_default_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nota_draft_view`
--

DROP TABLE IF EXISTS `nota_draft_view`;
/*!50001 DROP VIEW IF EXISTS `nota_draft_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nota_draft_view` AS SELECT 
 1 AS `nota_id`,
 1 AS `nota_number`,
 1 AS `nota_perihal`,
 1 AS `nota_isi`,
 1 AS `kode_masalah`,
 1 AS `creator`,
 1 AS `forwarder`,
 1 AS `nota_read_status`,
 1 AS `emp_num`,
 1 AS `nota_date`,
 1 AS `create_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nota_examine`
--

DROP TABLE IF EXISTS `nota_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` varchar(20) NOT NULL,
  `examiner_id` int(11) NOT NULL,
  `exam_queue` int(11) NOT NULL,
  `exam_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ok_status` tinyint(4) NOT NULL DEFAULT '0',
  `return_status` tinyint(4) NOT NULL DEFAULT '0',
  `reject_status` tinyint(4) NOT NULL DEFAULT '0',
  `read_status` tinyint(4) NOT NULL DEFAULT '0',
  `sent_status` tinyint(4) NOT NULL DEFAULT '0',
  `status` enum('AKTIF','TIDAK AKTIF') NOT NULL DEFAULT 'TIDAK AKTIF',
  PRIMARY KEY (`examine_id`),
  KEY `fk_nota_examine` (`examiner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_examine`
--

LOCK TABLES `nota_examine` WRITE;
/*!40000 ALTER TABLE `nota_examine` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_folder`
--

DROP TABLE IF EXISTS `nota_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_folder` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(45) NOT NULL,
  `emp_num` int(11) NOT NULL,
  PRIMARY KEY (`folder_id`),
  KEY `nota_folder_fk` (`emp_num`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_folder`
--

LOCK TABLES `nota_folder` WRITE;
/*!40000 ALTER TABLE `nota_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_folder_mapping`
--

DROP TABLE IF EXISTS `nota_folder_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_folder_mapping` (
  `mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` varchar(20) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `archive_status` tinyint(4) NOT NULL DEFAULT '0',
  `nota_create_date` datetime NOT NULL,
  PRIMARY KEY (`mapping_id`),
  KEY `nota_folder_mappning_fk` (`nota_id`),
  KEY `nota_folder_mapping_fk2` (`folder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_folder_mapping`
--

LOCK TABLES `nota_folder_mapping` WRITE;
/*!40000 ALTER TABLE `nota_folder_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_folder_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_format_code`
--

DROP TABLE IF EXISTS `nota_format_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_format_code` (
  `id_format_code` int(11) NOT NULL AUTO_INCREMENT,
  `urutan` int(11) NOT NULL,
  `tipe` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  `skip_delimiter` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_format_code`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_format_code`
--

LOCK TABLES `nota_format_code` WRITE;
/*!40000 ALTER TABLE `nota_format_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_format_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nota_inbox_view`
--

DROP TABLE IF EXISTS `nota_inbox_view`;
/*!50001 DROP VIEW IF EXISTS `nota_inbox_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nota_inbox_view` AS SELECT 
 1 AS `nota_id`,
 1 AS `nota_number`,
 1 AS `nota_perihal`,
 1 AS `nota_isi`,
 1 AS `nota_creator_num`,
 1 AS `nota_sender_num`,
 1 AS `nota_disposisi_num`,
 1 AS `nota_read_status`,
 1 AS `nota_date`,
 1 AS `nota_kode_masalah`,
 1 AS `creator`,
 1 AS `sender`,
 1 AS `forwarder`,
 1 AS `emp_num`,
 1 AS `create_date`,
 1 AS `segera`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nota_kode_masalah`
--

DROP TABLE IF EXISTS `nota_kode_masalah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_kode_masalah` (
  `id_kode_masalah` int(11) NOT NULL,
  `kode_masalah` varchar(10) NOT NULL,
  `masalah` varchar(45) NOT NULL,
  PRIMARY KEY (`id_kode_masalah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_kode_masalah`
--

LOCK TABLES `nota_kode_masalah` WRITE;
/*!40000 ALTER TABLE `nota_kode_masalah` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_kode_masalah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_lampiran`
--

DROP TABLE IF EXISTS `nota_lampiran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_lampiran` (
  `lampiran_id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` varchar(20) NOT NULL,
  `lampiran_link` varchar(100) NOT NULL,
  `lampiran_name` varchar(45) NOT NULL,
  PRIMARY KEY (`lampiran_id`),
  KEY `nota_lampiran_fk` (`nota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_lampiran`
--

LOCK TABLES `nota_lampiran` WRITE;
/*!40000 ALTER TABLE `nota_lampiran` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_lampiran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_nomor`
--

DROP TABLE IF EXISTS `nota_nomor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_nomor` (
  `nota_id` varchar(50) NOT NULL,
  `format_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_nomor`
--

LOCK TABLES `nota_nomor` WRITE;
/*!40000 ALTER TABLE `nota_nomor` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_nomor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_options`
--

DROP TABLE IF EXISTS `nota_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_options` (
  `nota_id` varchar(20) NOT NULL,
  `segera` tinyint(1) NOT NULL,
  `return_receipt` tinyint(1) NOT NULL,
  `document_options` enum('DOKUMEN BIASA','DOKUMEN RAHASIA','DOKUMEN RAHASIA & PRIBADI') NOT NULL,
  `jabatan_pengirim` varchar(50) NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `nik_pengirim` varchar(50) NOT NULL,
  `unit_pengirim` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_options`
--

LOCK TABLES `nota_options` WRITE;
/*!40000 ALTER TABLE `nota_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nota_progress_view`
--

DROP TABLE IF EXISTS `nota_progress_view`;
/*!50001 DROP VIEW IF EXISTS `nota_progress_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nota_progress_view` AS SELECT 
 1 AS `examine_id`,
 1 AS `exam_date`,
 1 AS `exam_queue`,
 1 AS `nota_id`,
 1 AS `nota_perihal`,
 1 AS `nota_date`,
 1 AS `examiner_id`,
 1 AS `emp_firstname`,
 1 AS `ok_status`,
 1 AS `return_status`,
 1 AS `reject_status`,
 1 AS `read_status`,
 1 AS `sent_status`,
 1 AS `status`,
 1 AS `segera`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nota_receiver`
--

DROP TABLE IF EXISTS `nota_receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_receiver` (
  `receiver_id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` varchar(20) NOT NULL,
  `emp_num` int(11) NOT NULL,
  `cc_status` int(11) NOT NULL DEFAULT '0',
  `disposisi_status` int(11) NOT NULL DEFAULT '0',
  `nota_tindakan` varchar(255) NOT NULL,
  `emp_from` int(11) NOT NULL,
  PRIMARY KEY (`receiver_id`),
  KEY `nota_receiver_fk` (`nota_id`),
  KEY `nota_receiver_fk2` (`emp_num`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_receiver`
--

LOCK TABLES `nota_receiver` WRITE;
/*!40000 ALTER TABLE `nota_receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_receiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_referensi`
--

DROP TABLE IF EXISTS `nota_referensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_referensi` (
  `referensi_id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` varchar(20) NOT NULL,
  `nota_referensi` varchar(20) NOT NULL,
  PRIMARY KEY (`referensi_id`),
  KEY `nota_referensi_fk` (`nota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_referensi`
--

LOCK TABLES `nota_referensi` WRITE;
/*!40000 ALTER TABLE `nota_referensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_referensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nota_sent_view`
--

DROP TABLE IF EXISTS `nota_sent_view`;
/*!50001 DROP VIEW IF EXISTS `nota_sent_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nota_sent_view` AS SELECT 
 1 AS `nota_id`,
 1 AS `nota_number`,
 1 AS `nota_perihal`,
 1 AS `nota_isi`,
 1 AS `kode_masalah`,
 1 AS `creator`,
 1 AS `forwarder`,
 1 AS `nota_read_status`,
 1 AS `emp_num`,
 1 AS `nota_date`,
 1 AS `create_date`,
 1 AS `segera`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prof_detail`
--

DROP TABLE IF EXISTS `prof_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prof_detail` (
  `prof_id` int(11) NOT NULL,
  `emp_num` int(11) NOT NULL,
  `prof_order` int(2) NOT NULL,
  PRIMARY KEY (`prof_id`,`emp_num`),
  KEY `prof_id` (`prof_id`,`emp_num`),
  KEY `emp_num` (`emp_num`),
  CONSTRAINT `prof_detail_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `prof_sppd` (`prof_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prof_detail_ibfk_2` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_detail`
--

LOCK TABLES `prof_detail` WRITE;
/*!40000 ALTER TABLE `prof_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `prof_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_sppd`
--

DROP TABLE IF EXISTS `prof_sppd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prof_sppd` (
  `prof_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_num` int(11) NOT NULL,
  `prof_name` varchar(50) NOT NULL,
  PRIMARY KEY (`prof_id`),
  KEY `emp_num` (`emp_num`),
  CONSTRAINT `prof_sppd_ibfk_1` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_sppd`
--

LOCK TABLES `prof_sppd` WRITE;
/*!40000 ALTER TABLE `prof_sppd` DISABLE KEYS */;
/*!40000 ALTER TABLE `prof_sppd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_data`
--

DROP TABLE IF EXISTS `reservation_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_data` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_num` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `res_type` int(11) NOT NULL,
  `booking_id` varchar(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `limit_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `contact_title` varchar(4) NOT NULL,
  `contact_firstname` varchar(50) NOT NULL,
  `contact_lastname` varchar(50) NOT NULL,
  `contact_telp` varchar(20) NOT NULL,
  PRIMARY KEY (`res_id`),
  KEY `sppd_num` (`req_id`),
  KEY `emp_num` (`emp_num`),
  KEY `sppd_num_2` (`req_id`),
  CONSTRAINT `reservation_data_ibfk_1` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_data_ibfk_2` FOREIGN KEY (`req_id`) REFERENCES `reservation_req` (`req_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_data`
--

LOCK TABLES `reservation_data` WRITE;
/*!40000 ALTER TABLE `reservation_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_req`
--

DROP TABLE IF EXISTS `reservation_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_req` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `sppd_num` int(11) NOT NULL,
  `flight_desc` varchar(500) NOT NULL,
  `time_desc` varchar(500) NOT NULL,
  `hotel_desc` varchar(500) NOT NULL,
  `send_date` datetime NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`req_id`),
  KEY `sppd_num` (`sppd_num`),
  CONSTRAINT `reservation_req_ibfk_1` FOREIGN KEY (`sppd_num`) REFERENCES `sppd_data` (`sppd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_req`
--

LOCK TABLES `reservation_req` WRITE;
/*!40000 ALTER TABLE `reservation_req` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_anggaran`
--

DROP TABLE IF EXISTS `sppd_anggaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_anggaran` (
  `anggaran_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(4) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`anggaran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_anggaran`
--

LOCK TABLES `sppd_anggaran` WRITE;
/*!40000 ALTER TABLE `sppd_anggaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_anggaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_comment`
--

DROP TABLE IF EXISTS `sppd_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_comment` (
  `sppd_num` int(11) NOT NULL,
  `emp_num` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `date_comment` datetime NOT NULL,
  `time_comment` time NOT NULL,
  `comment_type` int(1) NOT NULL,
  KEY `sppd_num` (`sppd_num`,`emp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_comment`
--

LOCK TABLES `sppd_comment` WRITE;
/*!40000 ALTER TABLE `sppd_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_data`
--

DROP TABLE IF EXISTS `sppd_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_data` (
  `sppd_num` int(11) NOT NULL AUTO_INCREMENT,
  `sppd_id` varchar(50) NOT NULL,
  `sppd_tgl` date NOT NULL,
  `sppd_dest` varchar(100) NOT NULL,
  `sppd_catt` varchar(255) NOT NULL,
  `sppd_tuj` varchar(255) NOT NULL,
  `sppd_dsr` varchar(255) NOT NULL,
  `sppd_ket` varchar(255) NOT NULL,
  `sppd_depart` date NOT NULL,
  `sppd_arrive` date NOT NULL,
  `sppd_status` int(1) NOT NULL,
  `sppd_desc` varchar(255) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_create_id` int(11) NOT NULL,
  `sppd_read_stat` int(1) NOT NULL,
  `reserve_status` int(1) NOT NULL,
  `temp_comment` varchar(255) NOT NULL,
  `fix_date` int(1) NOT NULL,
  PRIMARY KEY (`sppd_num`),
  UNIQUE KEY `sppd_id` (`sppd_id`),
  KEY `emp_id` (`emp_id`),
  KEY `emp_id_2` (`emp_id`),
  KEY `emp_id_3` (`emp_id`),
  KEY `emp_create_id` (`emp_create_id`),
  CONSTRAINT `sppd_data_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_data_ibfk_2` FOREIGN KEY (`emp_create_id`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_data`
--

LOCK TABLES `sppd_data` WRITE;
/*!40000 ALTER TABLE `sppd_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_day_fee`
--

DROP TABLE IF EXISTS `sppd_day_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_day_fee` (
  `fee_day_id` int(11) NOT NULL AUTO_INCREMENT,
  `sppd_num` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `lama` int(3) NOT NULL,
  `day_amount` double NOT NULL,
  `percentage` int(3) NOT NULL,
  PRIMARY KEY (`fee_day_id`),
  KEY `sppd_num` (`sppd_num`),
  CONSTRAINT `sppd_day_fee_ibfk_1` FOREIGN KEY (`sppd_num`) REFERENCES `sppd_data` (`sppd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_day_fee`
--

LOCK TABLES `sppd_day_fee` WRITE;
/*!40000 ALTER TABLE `sppd_day_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_day_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_examine`
--

DROP TABLE IF EXISTS `sppd_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_examine` (
  `sppd_num` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `pem_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time NOT NULL,
  `order` int(2) NOT NULL,
  `flag` int(1) NOT NULL,
  `final` int(1) NOT NULL,
  `send_status` int(1) NOT NULL,
  `return_status` int(1) NOT NULL,
  PRIMARY KEY (`sppd_num`,`emp_id`,`pem_id`),
  KEY `sppd_id` (`sppd_num`),
  KEY `emp_id` (`emp_id`),
  KEY `pem_id` (`pem_id`),
  KEY `pem_id_2` (`pem_id`),
  CONSTRAINT `sppd_examine_ibfk_1` FOREIGN KEY (`sppd_num`) REFERENCES `sppd_data` (`sppd_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_examine_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_examine_ibfk_3` FOREIGN KEY (`pem_id`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_examine`
--

LOCK TABLES `sppd_examine` WRITE;
/*!40000 ALTER TABLE `sppd_examine` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_flight_res`
--

DROP TABLE IF EXISTS `sppd_flight_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_flight_res` (
  `flight_res_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_num` int(11) NOT NULL,
  `sppd_num` int(11) NOT NULL,
  `flight_name` varchar(100) NOT NULL,
  `flight_code` varchar(15) NOT NULL,
  `flight_number` varchar(20) NOT NULL,
  `from_city` varchar(50) NOT NULL,
  `to_city` varchar(50) NOT NULL,
  `depart_time` varchar(6) NOT NULL,
  `arrive_time` varchar(6) NOT NULL,
  `depart_date` varchar(10) NOT NULL,
  `arrive_date` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `confirm` int(1) NOT NULL,
  `class` varchar(3) NOT NULL,
  PRIMARY KEY (`flight_res_id`),
  KEY `emp_id` (`emp_num`,`sppd_num`),
  KEY `emp_id_2` (`emp_num`),
  KEY `sppd_id` (`sppd_num`),
  KEY `emp_id_3` (`emp_num`),
  KEY `sppd_id_2` (`sppd_num`),
  KEY `flight_res_id` (`flight_res_id`),
  KEY `from_city` (`from_city`),
  KEY `to_city` (`to_city`),
  CONSTRAINT `sppd_flight_res_ibfk_1` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_flight_res_ibfk_2` FOREIGN KEY (`sppd_num`) REFERENCES `sppd_data` (`sppd_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_flight_res_ibfk_3` FOREIGN KEY (`flight_res_id`) REFERENCES `reservation_data` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_flight_res_ibfk_4` FOREIGN KEY (`from_city`) REFERENCES `airport_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_flight_res_ibfk_5` FOREIGN KEY (`to_city`) REFERENCES `airport_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_flight_res`
--

LOCK TABLES `sppd_flight_res` WRITE;
/*!40000 ALTER TABLE `sppd_flight_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_flight_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_hotel_res`
--

DROP TABLE IF EXISTS `sppd_hotel_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_hotel_res` (
  `hotel_res_id` int(11) NOT NULL AUTO_INCREMENT,
  `sppd_num` int(11) NOT NULL,
  `emp_num` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `duration` int(2) NOT NULL,
  `rooms` int(2) NOT NULL,
  PRIMARY KEY (`hotel_res_id`),
  KEY `sppd_id` (`sppd_num`,`emp_num`),
  KEY `sppd_id_2` (`sppd_num`),
  KEY `emp_id` (`emp_num`),
  KEY `sppd_num` (`sppd_num`),
  CONSTRAINT `sppd_hotel_res_ibfk_1` FOREIGN KEY (`sppd_num`) REFERENCES `sppd_data` (`sppd_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sppd_hotel_res_ibfk_2` FOREIGN KEY (`emp_num`) REFERENCES `hrms_employees` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_hotel_res`
--

LOCK TABLES `sppd_hotel_res` WRITE;
/*!40000 ALTER TABLE `sppd_hotel_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_hotel_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_transport_fee`
--

DROP TABLE IF EXISTS `sppd_transport_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_transport_fee` (
  `fee_trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `sppd_num` int(11) NOT NULL,
  `transport_name` varchar(40) NOT NULL,
  `from_dest` varchar(255) NOT NULL,
  `to_dest` varchar(255) NOT NULL,
  `transport_amount` double NOT NULL,
  `transport_fee` double NOT NULL,
  PRIMARY KEY (`fee_trans_id`),
  KEY `sppd_id` (`sppd_num`),
  KEY `sppd_id_2` (`sppd_num`),
  CONSTRAINT `sppd_transport_fee_ibfk_1` FOREIGN KEY (`sppd_num`) REFERENCES `sppd_data` (`sppd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_transport_fee`
--

LOCK TABLES `sppd_transport_fee` WRITE;
/*!40000 ALTER TABLE `sppd_transport_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppd_transport_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_komen_detail`
--

DROP TABLE IF EXISTS `view_komen_detail`;
/*!50001 DROP VIEW IF EXISTS `view_komen_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_komen_detail` AS SELECT 
 1 AS `comment_id`,
 1 AS `comment`,
 1 AS `nota_id`,
 1 AS `comment_date`,
 1 AS `emp_num`,
 1 AS `status_disposisi`,
 1 AS `emp_firstname`,
 1 AS `emp_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_nomor_nota`
--

DROP TABLE IF EXISTS `view_nomor_nota`;
/*!50001 DROP VIEW IF EXISTS `view_nomor_nota`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_nomor_nota` AS SELECT 
 1 AS `urutan`,
 1 AS `tipe`,
 1 AS `skip_delimiter`,
 1 AS `nota_id`,
 1 AS `format_id`,
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_nota_disposisi`
--

DROP TABLE IF EXISTS `view_nota_disposisi`;
/*!50001 DROP VIEW IF EXISTS `view_nota_disposisi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_nota_disposisi` AS SELECT 
 1 AS `cc_status`,
 1 AS `disposisi_status`,
 1 AS `nota_id`,
 1 AS `emp_num`,
 1 AS `emp_firstname`,
 1 AS `emp_lastname`,
 1 AS `emp_job`,
 1 AS `job_code`,
 1 AS `nota_tindakan`,
 1 AS `sender`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `view_nota_examiner`
--

DROP TABLE IF EXISTS `view_nota_examiner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_nota_examiner` (
  `examine_id` int(11) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  `examiner_id` int(11) DEFAULT NULL,
  `emp_firstname` int(11) DEFAULT NULL,
  `emp_lastname` int(11) DEFAULT NULL,
  `emp_job` int(11) DEFAULT NULL,
  `job_name` int(11) DEFAULT NULL,
  `job_code` int(11) DEFAULT NULL,
  `job_description` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_nota_examiner`
--

LOCK TABLES `view_nota_examiner` WRITE;
/*!40000 ALTER TABLE `view_nota_examiner` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_nota_examiner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_nota_informasi_dash`
--

DROP TABLE IF EXISTS `view_nota_informasi_dash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_nota_informasi_dash` (
  `nota_id` int(11) DEFAULT NULL,
  `nota_number` int(11) DEFAULT NULL,
  `nota_perihal` int(11) DEFAULT NULL,
  `sender_name` int(11) DEFAULT NULL,
  `sender_email` int(11) DEFAULT NULL,
  `receiver_name` int(11) DEFAULT NULL,
  `receiver_email` int(11) DEFAULT NULL,
  `exam_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_nota_informasi_dash`
--

LOCK TABLES `view_nota_informasi_dash` WRITE;
/*!40000 ALTER TABLE `view_nota_informasi_dash` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_nota_informasi_dash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_nota_kepada`
--

DROP TABLE IF EXISTS `view_nota_kepada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_nota_kepada` (
  `cc_status` int(11) DEFAULT NULL,
  `disposisi_status` int(11) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  `emp_num` int(11) DEFAULT NULL,
  `emp_firstname` int(11) DEFAULT NULL,
  `emp_lastname` int(11) DEFAULT NULL,
  `emp_job` int(11) DEFAULT NULL,
  `job_code` int(11) DEFAULT NULL,
  `job_name` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_nota_kepada`
--

LOCK TABLES `view_nota_kepada` WRITE;
/*!40000 ALTER TABLE `view_nota_kepada` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_nota_kepada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_nota_referensi`
--

DROP TABLE IF EXISTS `view_nota_referensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_nota_referensi` (
  `referensi_id` int(11) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  `nota_referensi` int(11) DEFAULT NULL,
  `nota_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_nota_referensi`
--

LOCK TABLES `view_nota_referensi` WRITE;
/*!40000 ALTER TABLE `view_nota_referensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_nota_referensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_nota_tembusan`
--

DROP TABLE IF EXISTS `view_nota_tembusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_nota_tembusan` (
  `cc_status` int(11) DEFAULT NULL,
  `disposisi_status` int(11) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  `emp_num` int(11) DEFAULT NULL,
  `emp_firstname` int(11) DEFAULT NULL,
  `emp_lastname` int(11) DEFAULT NULL,
  `emp_job` int(11) DEFAULT NULL,
  `job_code` int(11) DEFAULT NULL,
  `job_name` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_nota_tembusan`
--

LOCK TABLES `view_nota_tembusan` WRITE;
/*!40000 ALTER TABLE `view_nota_tembusan` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_nota_tembusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `nota_archive_view`
--

/*!50001 DROP VIEW IF EXISTS `nota_archive_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nota_archive_view` AS select `d`.`nota_id` AS `nota_id`,`d`.`nota_number` AS `nota_number`,`d`.`nota_perihal` AS `nota_perihal`,`d`.`nota_isi` AS `nota_isi`,`d`.`nota_kode_masalah` AS `kode_masalah`,`getJobName`(`d`.`nota_creator_num`) AS `creator`,`getJobName`(`d`.`nota_sender_num`) AS `sender`,`getJobName`(`d`.`nota_disposisi_num`) AS `forwarder`,`d`.`nota_read_status` AS `nota_read_status`,`f`.`emp_num` AS `emp_num`,`d`.`nota_date` AS `nota_date`,`fm`.`nota_create_date` AS `create_date` from ((`nota_data` `d` join `nota_folder` `f`) join `nota_folder_mapping` `fm`) where ((`d`.`nota_id` = `fm`.`nota_id`) and (`fm`.`archive_status` = 1) and (`fm`.`folder_id` = `f`.`folder_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nota_custom_view`
--

/*!50001 DROP VIEW IF EXISTS `nota_custom_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nota_custom_view` AS select `fm`.`mapping_id` AS `mapping_id`,`d`.`nota_id` AS `nota_id`,`d`.`nota_number` AS `nota_number`,`d`.`nota_perihal` AS `nota_perihal`,`d`.`nota_isi` AS `nota_isi`,`d`.`nota_creator_num` AS `nota_creator_num`,`d`.`nota_sender_num` AS `nota_sender_num`,`d`.`nota_disposisi_num` AS `nota_disposisi_num`,`d`.`nota_read_status` AS `nota_read_status`,`d`.`nota_date` AS `nota_date`,`d`.`nota_kode_masalah` AS `nota_kode_masalah`,`getJobName`(`d`.`nota_creator_num`) AS `creator`,`getJobName`(`d`.`nota_sender_num`) AS `sender`,`getJobName`(`d`.`nota_disposisi_num`) AS `forwarder`,`f`.`folder_name` AS `folder_name`,`f`.`emp_num` AS `emp_num`,`fm`.`nota_create_date` AS `create_date`,`o`.`segera` AS `segera` from (((`nota_data` `d` join `nota_folder` `f`) join `nota_folder_mapping` `fm`) join `nota_options` `o`) where ((`d`.`nota_id` = `fm`.`nota_id`) and (`fm`.`archive_status` = 0) and (`fm`.`folder_id` = `f`.`folder_id`) and (`d`.`nota_id` = `o`.`nota_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nota_draft_view`
--

/*!50001 DROP VIEW IF EXISTS `nota_draft_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nota_draft_view` AS select `d`.`nota_id` AS `nota_id`,`d`.`nota_number` AS `nota_number`,`d`.`nota_perihal` AS `nota_perihal`,`d`.`nota_isi` AS `nota_isi`,`d`.`nota_kode_masalah` AS `kode_masalah`,`getJobName`(`d`.`nota_creator_num`) AS `creator`,`getJobName`(`d`.`nota_disposisi_num`) AS `forwarder`,`d`.`nota_read_status` AS `nota_read_status`,`f`.`emp_num` AS `emp_num`,`d`.`nota_date` AS `nota_date`,`fm`.`nota_create_date` AS `create_date` from ((`nota_data` `d` join `nota_folder` `f`) join `nota_folder_mapping` `fm`) where ((`d`.`nota_id` = `fm`.`nota_id`) and (`fm`.`archive_status` = 0) and (`fm`.`folder_id` = `f`.`folder_id`) and (`f`.`folder_name` like 'draft')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nota_inbox_view`
--

/*!50001 DROP VIEW IF EXISTS `nota_inbox_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nota_inbox_view` AS select `d`.`nota_id` AS `nota_id`,`d`.`nota_number` AS `nota_number`,`d`.`nota_perihal` AS `nota_perihal`,`d`.`nota_isi` AS `nota_isi`,`d`.`nota_creator_num` AS `nota_creator_num`,`d`.`nota_sender_num` AS `nota_sender_num`,`d`.`nota_disposisi_num` AS `nota_disposisi_num`,`d`.`nota_read_status` AS `nota_read_status`,`d`.`nota_date` AS `nota_date`,`d`.`nota_kode_masalah` AS `nota_kode_masalah`,`getEmpName`(`d`.`nota_creator_num`) AS `creator`,`getJobName`(`d`.`nota_sender_num`) AS `sender`,`getJobName`(`d`.`nota_disposisi_num`) AS `forwarder`,`f`.`emp_num` AS `emp_num`,`fm`.`nota_create_date` AS `create_date`,`o`.`segera` AS `segera` from (((`nota_data` `d` join `nota_folder` `f`) join `nota_folder_mapping` `fm`) join `nota_options` `o`) where ((`d`.`nota_id` = `fm`.`nota_id`) and (`fm`.`archive_status` = 0) and (`fm`.`folder_id` = `f`.`folder_id`) and (`f`.`folder_name` like 'inbox') and (`d`.`nota_id` = `o`.`nota_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nota_progress_view`
--

/*!50001 DROP VIEW IF EXISTS `nota_progress_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nota_progress_view` AS select `ex`.`examine_id` AS `examine_id`,`ex`.`exam_date` AS `exam_date`,`ex`.`exam_queue` AS `exam_queue`,`ex`.`nota_id` AS `nota_id`,`n`.`nota_perihal` AS `nota_perihal`,`n`.`nota_date` AS `nota_date`,`ex`.`examiner_id` AS `examiner_id`,`emp`.`emp_firstname` AS `emp_firstname`,`ex`.`ok_status` AS `ok_status`,`ex`.`return_status` AS `return_status`,`ex`.`reject_status` AS `reject_status`,`ex`.`read_status` AS `read_status`,`ex`.`sent_status` AS `sent_status`,`ex`.`status` AS `status`,`o`.`segera` AS `segera` from (((`nota_data` `n` join `hrms_employees` `emp`) join `nota_examine` `ex`) join `nota_options` `o`) where ((`ex`.`nota_id` = `n`.`nota_id`) and (`ex`.`examiner_id` = `emp`.`emp_num`) and (`n`.`nota_id` = `o`.`nota_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nota_sent_view`
--

/*!50001 DROP VIEW IF EXISTS `nota_sent_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nota_sent_view` AS select `d`.`nota_id` AS `nota_id`,`d`.`nota_number` AS `nota_number`,`d`.`nota_perihal` AS `nota_perihal`,`d`.`nota_isi` AS `nota_isi`,`d`.`nota_kode_masalah` AS `kode_masalah`,`getEmpName`(`d`.`nota_creator_num`) AS `creator`,`getEmpName`(`d`.`nota_disposisi_num`) AS `forwarder`,`d`.`nota_read_status` AS `nota_read_status`,`f`.`emp_num` AS `emp_num`,`d`.`nota_date` AS `nota_date`,`fm`.`nota_create_date` AS `create_date`,`o`.`segera` AS `segera` from (((`nota_data` `d` join `nota_folder` `f`) join `nota_folder_mapping` `fm`) join `nota_options` `o`) where ((`d`.`nota_id` = `fm`.`nota_id`) and (`fm`.`archive_status` = 0) and (`fm`.`folder_id` = `f`.`folder_id`) and (`f`.`folder_name` like 'sent') and (`d`.`nota_id` = `o`.`nota_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_komen_detail`
--

/*!50001 DROP VIEW IF EXISTS `view_komen_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_komen_detail` AS select `n`.`comment_id` AS `comment_id`,`n`.`comment` AS `comment`,`n`.`nota_id` AS `nota_id`,`n`.`comment_date` AS `comment_date`,`n`.`emp_num` AS `emp_num`,`n`.`status_disposisi` AS `status_disposisi`,`e`.`emp_firstname` AS `emp_firstname`,`e`.`emp_lastname` AS `emp_lastname` from (`nota_comment` `n` join `hrms_employees` `e`) where (`e`.`emp_num` = `n`.`emp_num`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_nomor_nota`
--

/*!50001 DROP VIEW IF EXISTS `view_nomor_nota`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_nomor_nota` AS select `n`.`urutan` AS `urutan`,`n`.`tipe` AS `tipe`,`n`.`skip_delimiter` AS `skip_delimiter`,`c`.`nota_id` AS `nota_id`,`c`.`format_id` AS `format_id`,`c`.`value` AS `value` from (`nota_format_code` `n` join `nota_nomor` `c`) where (`n`.`id_format_code` = `c`.`format_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_nota_disposisi`
--

/*!50001 DROP VIEW IF EXISTS `view_nota_disposisi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_nota_disposisi` AS select `r`.`cc_status` AS `cc_status`,`r`.`disposisi_status` AS `disposisi_status`,`r`.`nota_id` AS `nota_id`,`r`.`emp_num` AS `emp_num`,`e`.`emp_firstname` AS `emp_firstname`,`e`.`emp_lastname` AS `emp_lastname`,`e`.`emp_job` AS `emp_job`,`getJobName`(`r`.`emp_num`) AS `job_code`,`r`.`nota_tindakan` AS `nota_tindakan`,`getJobName`(`r`.`emp_from`) AS `sender` from (`nota_receiver` `r` join `hrms_employees` `e`) where ((`r`.`emp_num` = `e`.`emp_num`) and (`r`.`cc_status` = 0) and (`r`.`disposisi_status` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-26 16:44:44
