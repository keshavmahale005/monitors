/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: task_management_db
-- ------------------------------------------------------
-- Server version	10.5.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` bigint(20) unsigned DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `ip_address` varchar(100) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_audit_user_id` (`user_id`),
  KEY `idx_audit_action` (`action`),
  KEY `idx_audit_entity` (`entity_type`,`entity_id`),
  KEY `idx_audit_created_at` (`created_at`),
  CONSTRAINT `fk_audit_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (72,18,'USER_REGISTERED','USER',18,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-14 13:00:54'),(73,18,'LOGIN','AUTH',18,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-14 13:01:37'),(74,18,'PASSWORD_CHANGED','AUTH',18,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-14 13:01:58'),(75,18,'TASK_CREATED','TASK',10,NULL,'{\"title\":\"Nashik Property\",\"assignedTo\":[11],\"priority\":\"HIGH\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-14 13:02:58'),(76,1,'LOGOUT','AUTH',1,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-14 13:03:43'),(77,11,'LOGIN','AUTH',11,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-14 13:04:25'),(78,11,'LOGOUT','AUTH',11,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 05:08:52'),(79,1,'LOGIN','AUTH',1,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 05:08:53'),(80,1,'USER_CREATED','USER',19,NULL,'{\"name\":\"Sakshi Kudale\",\"email\":\"sakshikudale@sumagoinfotech.in\",\"role\":\"USER\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 05:12:32'),(81,19,'LOGIN','AUTH',19,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 05:13:37'),(82,20,'USER_REGISTERED','USER',20,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 10:26:27'),(83,20,'LOGIN','AUTH',20,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 10:27:18'),(84,20,'PASSWORD_CHANGED','AUTH',20,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 10:27:35'),(85,1,'LOGOUT','AUTH',1,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 12:58:08'),(86,11,'LOGIN','AUTH',11,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-15 12:58:26'),(87,11,'LOGIN','AUTH',11,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0','2026-07-15 12:59:17'),(88,11,'TASK_STATUS_CHANGED','TASK',10,'{\"status\":\"PENDING\"}','{\"status\":\"IN_PROGRESS\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0','2026-07-15 12:59:24'),(89,1,'LOGIN','AUTH',1,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 05:43:42'),(90,1,'USER_UPDATED','USER',18,'{\"name\":\"Satish Krishna Aurange\",\"email\":\"satishaurange@sumagoinfotech.com\",\"role\":\"USER\"}','{\"name\":\"Satish Krishna Aurange\",\"email\":\"satishaurange@sumagoinfotech.com\",\"role\":\"USER\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 05:44:04'),(91,1,'USER_UPDATED','USER',18,'{\"name\":\"Satish Krishna Aurange\",\"email\":\"satishaurange@sumagoinfotech.com\",\"role\":\"USER\"}','{\"name\":\"Satish Krishna Aurange\",\"email\":\"satishaurange@sumagoinfotech.com\",\"role\":\"USER\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 05:44:23'),(92,1,'USER_UPDATED','USER',18,'{\"name\":\"Satish Krishna Aurange\",\"email\":\"satishaurange@sumagoinfotech.com\",\"role\":\"USER\"}','{\"name\":\"Satish Krishna Aurange\",\"email\":\"satishaurange@sumagoinfotech.com\",\"role\":\"USER\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 05:44:41'),(93,1,'LOGOUT','AUTH',1,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 05:45:03'),(94,1,'LOGIN','AUTH',1,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 06:10:05'),(95,11,'TASK_STATUS_CHANGED','TASK',10,'{\"status\":\"IN_PROGRESS\"}','{\"status\":\"PENDING\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 06:12:23'),(96,1,'PASSWORD_RESET_MAILED','USER',18,NULL,'{\"email\":\"satishaurange@sumagoinfotech.com\"}','122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 06:23:54'),(97,1,'LOGOUT','AUTH',1,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 06:24:23'),(98,18,'LOGIN','AUTH',18,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 06:24:42'),(99,18,'PASSWORD_CHANGED','AUTH',18,NULL,NULL,'122.170.13.65','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 06:25:01');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'TASK_ASSIGNED',
  `title` varchar(255) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `task_id` bigint(20) unsigned DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_notif_user_read_created` (`user_id`,`is_read`,`created_at`),
  KEY `idx_notif_task_id` (`task_id`),
  CONSTRAINT `fk_notif_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `fk_notif_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (2,11,'TASK_ASSIGNED','New task assigned to you','Satish Krishna Aurange assigned you the task \"Nashik Property\"',10,0,'2026-07-14 13:02:58');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_otps`
--

DROP TABLE IF EXISTS `registration_otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_otps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `otp_hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `attempts` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_registration_otps_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_otps`
--

LOCK TABLES `registration_otps` WRITE;
/*!40000 ALTER TABLE `registration_otps` DISABLE KEYS */;
INSERT INTO `registration_otps` VALUES (10,'keshavmahale@sumagoinfotech.com','$2a$10$4cnU5un1gebi7y7LGdDkvumYmyAz12fQMSaeSoHvTDqSuuG..orsO','2026-07-14 16:05:34',0,0,'2026-07-14 15:55:34','2026-07-14 15:55:34'),(11,'sakshikudale@sumagoinfotech.in','$2a$10$0NkdGzoQJ/60OWJp/b7a7eYnCT7kkHB.MPS7iw0cRO8Gi3BabiqJq','2026-07-15 05:19:57',0,0,'2026-07-15 05:09:57','2026-07-15 05:09:57');
/*!40000 ALTER TABLE `registration_otps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `applied_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES (1,'001_create_users_table.sql','2026-07-11 17:58:16'),(2,'002_create_tasks_table.sql','2026-07-11 17:58:16'),(3,'003_create_task_status_history_table.sql','2026-07-11 17:58:16'),(4,'004_create_audit_logs_table.sql','2026-07-11 17:58:16'),(5,'005_create_task_assignees_and_notes.sql','2026-07-13 08:56:13'),(6,'006_create_notifications_table.sql','2026-07-13 10:16:57'),(7,'007_registration_and_password_flags.sql','2026-07-14 12:26:03');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_assignees`
--

DROP TABLE IF EXISTS `task_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_assignees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `assigned_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_task_assignees` (`task_id`,`user_id`),
  KEY `idx_ta_user_id` (`user_id`),
  CONSTRAINT `fk_ta_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `fk_ta_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_assignees`
--

LOCK TABLES `task_assignees` WRITE;
/*!40000 ALTER TABLE `task_assignees` DISABLE KEYS */;
INSERT INTO `task_assignees` VALUES (11,10,11,'2026-07-14 13:02:58');
/*!40000 ALTER TABLE `task_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_notes`
--

DROP TABLE IF EXISTS `task_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_tn_task_id` (`task_id`),
  KEY `idx_tn_user_id` (`user_id`),
  CONSTRAINT `fk_tn_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `fk_tn_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_notes`
--

LOCK TABLES `task_notes` WRITE;
/*!40000 ALTER TABLE `task_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status_history`
--

DROP TABLE IF EXISTS `task_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `old_status` varchar(50) DEFAULT NULL,
  `new_status` varchar(50) NOT NULL,
  `changed_by` bigint(20) unsigned NOT NULL,
  `changed_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_tsh_task_id` (`task_id`),
  KEY `idx_tsh_changed_by` (`changed_by`),
  KEY `idx_tsh_changed_at` (`changed_at`),
  CONSTRAINT `fk_tsh_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_tsh_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status_history`
--

LOCK TABLES `task_status_history` WRITE;
/*!40000 ALTER TABLE `task_status_history` DISABLE KEYS */;
INSERT INTO `task_status_history` VALUES (16,10,NULL,'PENDING',18,'2026-07-14 13:02:58'),(17,10,'PENDING','IN_PROGRESS',11,'2026-07-15 12:59:24'),(18,10,'IN_PROGRESS','PENDING',11,'2026-07-16 06:12:23');
/*!40000 ALTER TABLE `task_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `assigned_by` bigint(20) unsigned NOT NULL,
  `assigned_to` bigint(20) unsigned NOT NULL,
  `assigned_date` datetime NOT NULL DEFAULT current_timestamp(),
  `due_date` datetime DEFAULT NULL,
  `priority` enum('LOW','MEDIUM','HIGH','URGENT') NOT NULL DEFAULT 'MEDIUM',
  `status` enum('PENDING','IN_PROGRESS','COMPLETED') NOT NULL DEFAULT 'PENDING',
  `completion_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_tasks_assigned_by` (`assigned_by`),
  KEY `idx_tasks_assigned_to` (`assigned_to`),
  KEY `idx_tasks_status` (`status`),
  KEY `idx_tasks_priority` (`priority`),
  KEY `idx_tasks_assigned_date` (`assigned_date`),
  KEY `idx_tasks_due_date` (`due_date`),
  KEY `idx_tasks_is_deleted` (`is_deleted`),
  KEY `idx_tasks_assigned_to_status_deleted` (`assigned_to`,`status`,`is_deleted`),
  KEY `idx_tasks_assigned_by_status_deleted` (`assigned_by`,`status`,`is_deleted`),
  KEY `idx_tasks_assigned_date_deleted` (`assigned_date`,`is_deleted`),
  KEY `fk_tasks_deleted_by` (`deleted_by`),
  CONSTRAINT `fk_tasks_assigned_by` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_tasks_assigned_to` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_tasks_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (10,'Nashik Property','Need to complete project By 18.0726',18,11,'2026-07-14 13:02:58','2026-07-18 13:02:00','HIGH','PENDING',NULL,0,NULL,NULL,'2026-07-14 13:02:58','2026-07-16 06:12:23');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('SUPER_ADMIN','USER') NOT NULL DEFAULT 'USER',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_users_email` (`email`),
  KEY `idx_users_role` (`role`),
  KEY `idx_users_is_active` (`is_active`),
  KEY `idx_users_is_deleted` (`is_deleted`),
  KEY `fk_users_deleted_by` (`deleted_by`),
  CONSTRAINT `fk_users_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','admin@taskmanager.com','$2a$10$rIPjnFG7UxylH4cFe4X5BOH4j4XTnF2QueCFd4G55Y0cEKzZYnrv2','SUPER_ADMIN',1,0,0,NULL,NULL,'2026-07-11 17:58:29','2026-07-11 17:58:29'),(11,'Keshav Mahale','keshavmahale@sumagoinfotech.in','$2a$10$c0SaGMWic9H2Z.RhspFja./.Dmb6YVcr2JNmVZVYPgu3prd7.xKzW','USER',1,0,0,NULL,NULL,'2026-07-14 11:55:18','2026-07-14 11:58:44'),(12,'Shankar Tanaji Tile','shankartile@sumagoinfotech.com','$2a$10$5HuhunsEL48EOCyO4iyyX./yo/ua3byNppPZROc6IayLVrDqPgmDW','USER',1,0,0,NULL,NULL,'2026-07-14 12:08:57','2026-07-14 12:12:30'),(13,'Rohini Mahesh Gaikwad','tester@sumagoinfotech.com','$2a$10$lgYb4.O1KtddiRa1MLwv5OppB8aItNzJzHvgsYqXZveMHDFjul5QC','USER',1,0,0,NULL,NULL,'2026-07-14 12:19:52','2026-07-14 12:53:22'),(18,'Satish Krishna Aurange','satishaurange@sumagoinfotech.com','$2a$10$WOWWCN0lDsLI6pZpAUztkuJNzwDMdrjc9.x27P77zCApz3eTiwmma','USER',1,0,0,NULL,NULL,'2026-07-14 13:00:53','2026-07-16 06:25:01'),(19,'Sakshi Kudale','sakshikudale@sumagoinfotech.in','$2a$10$ZT4Lm./R.0iQ7TJQ6iS2rOABnuC.ek9XNVCVnVZ7Ix.oviV8.qG06','USER',1,0,0,NULL,NULL,'2026-07-15 05:12:32','2026-07-15 05:12:32'),(20,'Savita Baburao Hajare','savita.hajare@sumagoinfotech.com','$2a$10$vg0wFhYHu2FYlACrin0PU.A8kcUASF6bNcjV9NafttV.yzLVoc7ry','USER',1,0,0,NULL,NULL,'2026-07-15 10:26:26','2026-07-15 10:27:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'task_management_db'
--

--
-- Dumping routines for database 'task_management_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-19 10:15:04
