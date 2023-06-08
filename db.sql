-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Лидер команды');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,21),(2,1,22),(3,1,23),(4,1,24),(5,1,25),(6,1,26),(7,1,27),(8,1,28),(9,1,29),(10,1,30),(11,1,31),(12,1,32),(13,1,33),(14,1,34),(15,1,35),(16,1,36),(17,1,37),(18,1,38),(19,1,39),(20,1,40),(21,1,41),(22,1,42),(23,1,43),(24,1,44),(25,1,45),(26,1,46),(27,1,47),(28,1,48);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_users'),(22,'Can change user',6,'change_users'),(23,'Can delete user',6,'delete_users'),(24,'Can view user',6,'view_users'),(25,'Can add positions',7,'add_positions'),(26,'Can change positions',7,'change_positions'),(27,'Can delete positions',7,'delete_positions'),(28,'Can view positions',7,'view_positions'),(29,'Can add restrictions to task',8,'add_restrictionstotask'),(30,'Can change restrictions to task',8,'change_restrictionstotask'),(31,'Can delete restrictions to task',8,'delete_restrictionstotask'),(32,'Can view restrictions to task',8,'view_restrictionstotask'),(33,'Can add tasks',9,'add_tasks'),(34,'Can change tasks',9,'change_tasks'),(35,'Can delete tasks',9,'delete_tasks'),(36,'Can view tasks',9,'view_tasks'),(37,'Can add task to team',10,'add_tasktoteam'),(38,'Can change task to team',10,'change_tasktoteam'),(39,'Can delete task to team',10,'delete_tasktoteam'),(40,'Can view task to team',10,'view_tasktoteam'),(41,'Can add team',11,'add_team'),(42,'Can change team',11,'change_team'),(43,'Can delete team',11,'delete_team'),(44,'Can view team',11,'view_team'),(45,'Can add user to team',12,'add_usertoteam'),(46,'Can change user to team',12,'change_usertoteam'),(47,'Can delete user to team',12,'delete_usertoteam'),(48,'Can view user to team',12,'view_usertoteam');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_teams_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_teams_users_id` FOREIGN KEY (`user_id`) REFERENCES `user_teams_users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-08 00:24:59.688564','1','Лидер команды',1,'[{\"added\": {}}]',7,1),(2,'2023-06-08 00:25:31.241421','1','Лидер команды',1,'[{\"added\": {}}]',3,1),(3,'2023-06-08 00:25:35.810612','2','oleg oleg oleg',1,'[{\"added\": {}}]',6,1),(4,'2023-06-08 00:25:48.439039','1','Команда 1',1,'[{\"added\": {}}]',11,1),(5,'2023-06-08 00:26:15.642551','1','admin admin admin',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u043c\\u044f\", \"\\u041e\\u0442\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e\", \"\\u0424\\u0430\\u043c\\u0438\\u043b\\u0438\\u044f\", \"\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d\"]}}]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(7,'user_teams','positions'),(8,'user_teams','restrictionstotask'),(9,'user_teams','tasks'),(10,'user_teams','tasktoteam'),(11,'user_teams','team'),(6,'user_teams','users'),(12,'user_teams','usertoteam');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-08 00:21:59.568305'),(2,'contenttypes','0002_remove_content_type_name','2023-06-08 00:21:59.970161'),(3,'auth','0001_initial','2023-06-08 00:22:01.841854'),(4,'auth','0002_alter_permission_name_max_length','2023-06-08 00:22:02.036719'),(5,'auth','0003_alter_user_email_max_length','2023-06-08 00:22:02.064462'),(6,'auth','0004_alter_user_username_opts','2023-06-08 00:22:02.090340'),(7,'auth','0005_alter_user_last_login_null','2023-06-08 00:22:02.120171'),(8,'auth','0006_require_contenttypes_0002','2023-06-08 00:22:02.136252'),(9,'auth','0007_alter_validators_add_error_messages','2023-06-08 00:22:02.160451'),(10,'auth','0008_alter_user_username_max_length','2023-06-08 00:22:02.213255'),(11,'auth','0009_alter_user_last_name_max_length','2023-06-08 00:22:02.299850'),(12,'auth','0010_alter_group_name_max_length','2023-06-08 00:22:02.567660'),(13,'auth','0011_update_proxy_permissions','2023-06-08 00:22:02.608949'),(14,'auth','0012_alter_user_first_name_max_length','2023-06-08 00:22:02.648166'),(15,'user_teams','0001_initial','2023-06-08 00:22:06.837643'),(16,'admin','0001_initial','2023-06-08 00:22:07.630471'),(17,'admin','0002_logentry_remove_auto_add','2023-06-08 00:22:07.663333'),(18,'admin','0003_logentry_add_action_flag_choices','2023-06-08 00:22:07.699409'),(19,'sessions','0001_initial','2023-06-08 00:22:07.827656'),(20,'user_teams','0002_tasks_completed_by','2023-06-08 00:22:07.971901');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1oowsin78py5ud3ikm9lanzk42jfy9pr','.eJxVjMsOwiAURP-FtSEgr-LSvd_Q3AdI1UBS2pXx322TLjSzO3Nm3mKEdSnj2tM8TiwuQovTL0OgZ6p7wQ-o9yap1WWeUO6KPNoub43T63q4fwcFetnWOcTI0bjApDOgZyIPFrxKQat43sIOrTUGN6DR06BMRpWV82QNDeLzBe0EN9Q:1q73Qv:P7Tze320tATL7ujQwCfaWAEAsZwz35ceT3rAlyqdyRg','2023-06-22 00:23:21.637394');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_positions`
--

DROP TABLE IF EXISTS `user_teams_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_positions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_positions`
--

LOCK TABLES `user_teams_positions` WRITE;
/*!40000 ALTER TABLE `user_teams_positions` DISABLE KEYS */;
INSERT INTO `user_teams_positions` VALUES (1,'Лидер команды');
/*!40000 ALTER TABLE `user_teams_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_restrictionstotask`
--

DROP TABLE IF EXISTS `user_teams_restrictionstotask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_restrictionstotask` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `restriction_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_teams_restricti_task_id_717d6577_fk_user_team` (`task_id`),
  KEY `user_teams_restricti_restriction_id_677b4816_fk_user_team` (`restriction_id`),
  CONSTRAINT `user_teams_restricti_restriction_id_677b4816_fk_user_team` FOREIGN KEY (`restriction_id`) REFERENCES `user_teams_positions` (`id`),
  CONSTRAINT `user_teams_restricti_task_id_717d6577_fk_user_team` FOREIGN KEY (`task_id`) REFERENCES `user_teams_tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_restrictionstotask`
--

LOCK TABLES `user_teams_restrictionstotask` WRITE;
/*!40000 ALTER TABLE `user_teams_restrictionstotask` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_teams_restrictionstotask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_tasks`
--

DROP TABLE IF EXISTS `user_teams_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `deadline` date NOT NULL,
  `created_at` date NOT NULL,
  `is_selected` tinyint(1) DEFAULT NULL,
  `completed_at` date DEFAULT NULL,
  `completed_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_teams_tasks_completed_by_id_fabe047a_fk_user_teams_users_id` (`completed_by_id`),
  CONSTRAINT `user_teams_tasks_completed_by_id_fabe047a_fk_user_teams_users_id` FOREIGN KEY (`completed_by_id`) REFERENCES `user_teams_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_tasks`
--

LOCK TABLES `user_teams_tasks` WRITE;
/*!40000 ALTER TABLE `user_teams_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_teams_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_tasktoteam`
--

DROP TABLE IF EXISTS `user_teams_tasktoteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_tasktoteam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_teams_tasktoteam_team_id_822def80_fk_user_teams_team_id` (`team_id`),
  KEY `user_teams_tasktoteam_task_id_e7aec03c_fk_user_teams_tasks_id` (`task_id`),
  CONSTRAINT `user_teams_tasktoteam_task_id_e7aec03c_fk_user_teams_tasks_id` FOREIGN KEY (`task_id`) REFERENCES `user_teams_tasks` (`id`),
  CONSTRAINT `user_teams_tasktoteam_team_id_822def80_fk_user_teams_team_id` FOREIGN KEY (`team_id`) REFERENCES `user_teams_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_tasktoteam`
--

LOCK TABLES `user_teams_tasktoteam` WRITE;
/*!40000 ALTER TABLE `user_teams_tasktoteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_teams_tasktoteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_team`
--

DROP TABLE IF EXISTS `user_teams_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_team`
--

LOCK TABLES `user_teams_team` WRITE;
/*!40000 ALTER TABLE `user_teams_team` DISABLE KEYS */;
INSERT INTO `user_teams_team` VALUES (1,'Команда 1');
/*!40000 ALTER TABLE `user_teams_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_team_users`
--

DROP TABLE IF EXISTS `user_teams_team_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_team_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `team_id` bigint NOT NULL,
  `users_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_teams_team_users_team_id_users_id_c4bd0404_uniq` (`team_id`,`users_id`),
  KEY `user_teams_team_users_users_id_054514a3_fk_user_teams_users_id` (`users_id`),
  CONSTRAINT `user_teams_team_users_team_id_31863d9c_fk_user_teams_team_id` FOREIGN KEY (`team_id`) REFERENCES `user_teams_team` (`id`),
  CONSTRAINT `user_teams_team_users_users_id_054514a3_fk_user_teams_users_id` FOREIGN KEY (`users_id`) REFERENCES `user_teams_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_team_users`
--

LOCK TABLES `user_teams_team_users` WRITE;
/*!40000 ALTER TABLE `user_teams_team_users` DISABLE KEYS */;
INSERT INTO `user_teams_team_users` VALUES (1,1,2);
/*!40000 ALTER TABLE `user_teams_team_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_users`
--

DROP TABLE IF EXISTS `user_teams_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `second_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position_id` bigint DEFAULT NULL,
  `selected_task_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_teams_users_position_id_032e4326_fk_user_teams_positions_id` (`position_id`),
  KEY `user_teams_users_selected_task_id_1f472e27_fk_user_team` (`selected_task_id`),
  CONSTRAINT `user_teams_users_position_id_032e4326_fk_user_teams_positions_id` FOREIGN KEY (`position_id`) REFERENCES `user_teams_positions` (`id`),
  CONSTRAINT `user_teams_users_selected_task_id_1f472e27_fk_user_team` FOREIGN KEY (`selected_task_id`) REFERENCES `user_teams_tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_users`
--

LOCK TABLES `user_teams_users` WRITE;
/*!40000 ALTER TABLE `user_teams_users` DISABLE KEYS */;
INSERT INTO `user_teams_users` VALUES (1,'pbkdf2_sha256$390000$WuLF4JPUspganYTo1MOhDQ$TgYoChi0zGTlhHZAYX2tEf/OpH5VVCmBO6jaLwqhkl0=','2023-06-08 00:23:21.579872',1,'admin','',1,1,'2023-06-08 00:23:05.385327','admin','admin','admin','88451451454',NULL,NULL),(2,'pbkdf2_sha256$390000$HKKxhaEUf0uCnpES7Hahw8$mMr8xwwOoyou7DGhzxqj48tXUwUbFd6nVNxTgliLSkk=',NULL,0,'Oleg123','',0,1,'2023-06-08 00:25:35.481530','oleg','oleg','oleg','+78005553535',1,NULL);
/*!40000 ALTER TABLE `user_teams_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_users_groups`
--

DROP TABLE IF EXISTS `user_teams_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_users_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_teams_users_groups_users_id_group_id_734c61b3_uniq` (`users_id`,`group_id`),
  KEY `user_teams_users_groups_group_id_2899d0ec_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_teams_users_groups_group_id_2899d0ec_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_teams_users_groups_users_id_e5e9cf9c_fk_user_teams_users_id` FOREIGN KEY (`users_id`) REFERENCES `user_teams_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_users_groups`
--

LOCK TABLES `user_teams_users_groups` WRITE;
/*!40000 ALTER TABLE `user_teams_users_groups` DISABLE KEYS */;
INSERT INTO `user_teams_users_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `user_teams_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_users_user_permissions`
--

DROP TABLE IF EXISTS `user_teams_users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_users_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_teams_users_user_pe_users_id_permission_id_a612246d_uniq` (`users_id`,`permission_id`),
  KEY `user_teams_users_use_permission_id_0228a379_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_teams_users_use_permission_id_0228a379_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_teams_users_use_users_id_7ba8abf5_fk_user_team` FOREIGN KEY (`users_id`) REFERENCES `user_teams_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_users_user_permissions`
--

LOCK TABLES `user_teams_users_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_teams_users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_teams_users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teams_usertoteam`
--

DROP TABLE IF EXISTS `user_teams_usertoteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams_usertoteam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `team_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_teams_usertoteam_team_id_f35fbc29_fk_user_teams_team_id` (`team_id`),
  KEY `user_teams_usertoteam_user_id_689b7ba8_fk_user_teams_users_id` (`user_id`),
  CONSTRAINT `user_teams_usertoteam_team_id_f35fbc29_fk_user_teams_team_id` FOREIGN KEY (`team_id`) REFERENCES `user_teams_team` (`id`),
  CONSTRAINT `user_teams_usertoteam_user_id_689b7ba8_fk_user_teams_users_id` FOREIGN KEY (`user_id`) REFERENCES `user_teams_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teams_usertoteam`
--

LOCK TABLES `user_teams_usertoteam` WRITE;
/*!40000 ALTER TABLE `user_teams_usertoteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_teams_usertoteam` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08  5:36:45
