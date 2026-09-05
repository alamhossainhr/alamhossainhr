-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: personalportfolio
-- ------------------------------------------------------
-- Server version	8.0.46

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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add site setting',7,'add_sitesetting'),(26,'Can change site setting',7,'change_sitesetting'),(27,'Can delete site setting',7,'delete_sitesetting'),(28,'Can view site setting',7,'view_sitesetting'),(29,'Can add social link',8,'add_sociallink'),(30,'Can change social link',8,'change_sociallink'),(31,'Can delete social link',8,'delete_sociallink'),(32,'Can view social link',8,'view_sociallink'),(33,'Can add page view',9,'add_pageview'),(34,'Can change page view',9,'change_pageview'),(35,'Can delete page view',9,'delete_pageview'),(36,'Can view page view',9,'view_pageview'),(37,'Can add skill category',10,'add_skillcategory'),(38,'Can change skill category',10,'change_skillcategory'),(39,'Can delete skill category',10,'delete_skillcategory'),(40,'Can view skill category',10,'view_skillcategory'),(41,'Can add skill',11,'add_skill'),(42,'Can change skill',11,'change_skill'),(43,'Can delete skill',11,'delete_skill'),(44,'Can view skill',11,'view_skill'),(45,'Can add technology',12,'add_technology'),(46,'Can change technology',12,'change_technology'),(47,'Can delete technology',12,'delete_technology'),(48,'Can view technology',12,'view_technology'),(49,'Can add project category',13,'add_projectcategory'),(50,'Can change project category',13,'change_projectcategory'),(51,'Can delete project category',13,'delete_projectcategory'),(52,'Can view project category',13,'view_projectcategory'),(53,'Can add project',14,'add_project'),(54,'Can change project',14,'change_project'),(55,'Can delete project',14,'delete_project'),(56,'Can view project',14,'view_project'),(57,'Can add project image',15,'add_projectimage'),(58,'Can change project image',15,'change_projectimage'),(59,'Can delete project image',15,'delete_projectimage'),(60,'Can view project image',15,'view_projectimage'),(61,'Can add case study',16,'add_casestudy'),(62,'Can change case study',16,'change_casestudy'),(63,'Can delete case study',16,'delete_casestudy'),(64,'Can view case study',16,'view_casestudy'),(65,'Can add experience',17,'add_experience'),(66,'Can change experience',17,'change_experience'),(67,'Can delete experience',17,'delete_experience'),(68,'Can view experience',17,'view_experience'),(69,'Can add education',18,'add_education'),(70,'Can change education',18,'change_education'),(71,'Can delete education',18,'delete_education'),(72,'Can view education',18,'view_education'),(73,'Can add service',19,'add_service'),(74,'Can change service',19,'change_service'),(75,'Can delete service',19,'delete_service'),(76,'Can view service',19,'view_service'),(77,'Can add achievement',20,'add_achievement'),(78,'Can change achievement',20,'change_achievement'),(79,'Can delete achievement',20,'delete_achievement'),(80,'Can view achievement',20,'view_achievement'),(81,'Can add certificate',21,'add_certificate'),(82,'Can change certificate',21,'change_certificate'),(83,'Can delete certificate',21,'delete_certificate'),(84,'Can view certificate',21,'view_certificate'),(85,'Can add testimonial',22,'add_testimonial'),(86,'Can change testimonial',22,'change_testimonial'),(87,'Can delete testimonial',22,'delete_testimonial'),(88,'Can view testimonial',22,'view_testimonial'),(89,'Can add resume download',23,'add_resumedownload'),(90,'Can change resume download',23,'change_resumedownload'),(91,'Can delete resume download',23,'delete_resumedownload'),(92,'Can view resume download',23,'view_resumedownload'),(93,'Can add blog category',24,'add_blogcategory'),(94,'Can change blog category',24,'change_blogcategory'),(95,'Can delete blog category',24,'delete_blogcategory'),(96,'Can view blog category',24,'view_blogcategory'),(97,'Can add blog post',25,'add_blogpost'),(98,'Can change blog post',25,'change_blogpost'),(99,'Can delete blog post',25,'delete_blogpost'),(100,'Can view blog post',25,'view_blogpost'),(101,'Can add contact message',26,'add_contactmessage'),(102,'Can change contact message',26,'change_contactmessage'),(103,'Can delete contact message',26,'delete_contactmessage'),(104,'Can view contact message',26,'view_contactmessage'),(105,'Can add product order',27,'add_productorder'),(106,'Can change product order',27,'change_productorder'),(107,'Can delete product order',27,'delete_productorder'),(108,'Can view product order',27,'view_productorder'),(109,'Can add digital product',28,'add_digitalproduct'),(110,'Can change digital product',28,'change_digitalproduct'),(111,'Can delete digital product',28,'delete_digitalproduct'),(112,'Can view digital product',28,'view_digitalproduct'),(113,'Can add store category',29,'add_storecategory'),(114,'Can change store category',29,'change_storecategory'),(115,'Can delete store category',29,'delete_storecategory'),(116,'Can view store category',29,'view_storecategory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$vmThDHlnPeO8ZWGZ4vq1Kw$BxR/B1nsWNc8FKXptIfRhsSLxNImQLCcYBRLirz1/PA=','2026-08-16 08:06:55.000000',1,'alam','Alam','Hossain','alam@alamhossain.com',1,1,'2026-08-16 07:25:07.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogcategory`
--

DROP TABLE IF EXISTS `blog_blogcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogcategory`
--

LOCK TABLES `blog_blogcategory` WRITE;
/*!40000 ALTER TABLE `blog_blogcategory` DISABLE KEYS */;
INSERT INTO `blog_blogcategory` VALUES (1,'HR Analytics','hr-analytics');
/*!40000 ALTER TABLE `blog_blogcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost`
--

DROP TABLE IF EXISTS `blog_blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogpost` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `views_count` int unsigned NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blog_blogpost_author_id_ffcc150f_fk_auth_user_id` (`author_id`),
  KEY `blog_blogpost_category_id_0e9835dd_fk_blog_blogcategory_id` (`category_id`),
  CONSTRAINT `blog_blogpost_author_id_ffcc150f_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blogpost_category_id_0e9835dd_fk_blog_blogcategory_id` FOREIGN KEY (`category_id`) REFERENCES `blog_blogcategory` (`id`),
  CONSTRAINT `blog_blogpost_chk_1` CHECK ((`views_count` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost`
--

LOCK TABLES `blog_blogpost` WRITE;
/*!40000 ALTER TABLE `blog_blogpost` DISABLE KEYS */;
INSERT INTO `blog_blogpost` VALUES (1,'Leveraging SQL Window Functions for Workforce Absenteeism Analysis','leveraging-sql-window-functions-for-workforce-absenteeism-analysis','','How to use T-SQL and window functions to detect consecutive employee absenteeism patterns.','Tracking patterns of absenteeism is essential for operational workforce management. Using SQL window functions such as LEAD and LAG allows HR analysts to identify trends before they escalate into compliance concerns...',1,1,2,'Leveraging SQL Window Functions for Workforce Absenteeism Analysis','How to use T-SQL and window functions to detect consecutive employee absenteeism patterns.','2026-08-16 07:26:26.249129','2026-08-16 07:26:26.249129',1,1);
/*!40000 ALTER TABLE `blog_blogpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_contactmessage`
--

DROP TABLE IF EXISTS `contact_contactmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_contactmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_interested` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` char(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_contactmessage`
--

LOCK TABLES `contact_contactmessage` WRITE;
/*!40000 ALTER TABLE `contact_contactmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_contactmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_pageview`
--

DROP TABLE IF EXISTS `core_pageview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_pageview` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `page_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` char(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  `visited_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_pagevi_visited_74ac27_idx` (`visited_at`,`page_path`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_pageview`
--

LOCK TABLES `core_pageview` WRITE;
/*!40000 ALTER TABLE `core_pageview` DISABLE KEYS */;
INSERT INTO `core_pageview` VALUES (1,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:26:47.111084'),(2,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:27:48.171837'),(3,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:28:50.664924'),(4,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:29:07.992029'),(5,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:31:36.137327'),(6,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:31:54.777023'),(7,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:32:14.587578'),(8,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:33:41.163310'),(9,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:36:38.624265'),(10,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:37:31.225151'),(11,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:40:20.007831'),(12,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:40:20.471793'),(13,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:40:20.673296'),(14,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:40:20.877859'),(15,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:40:21.032173'),(16,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:40:21.193905'),(17,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:40:25.151940'),(18,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:41:46.079884'),(19,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:41:46.792391'),(20,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:41:46.968360'),(21,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:09.515021'),(22,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:11.099172'),(23,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:11.271825'),(24,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:11.439967'),(25,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:11.611267'),(26,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:11.779907'),(27,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:11.971187'),(28,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:12.153420'),(29,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:12.311735'),(30,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:12.500114'),(31,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:12.675187'),(32,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:12.901126'),(33,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:13.110736'),(34,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:13.326857'),(35,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:42:16.311640'),(36,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:44:26.435639'),(37,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:44:27.326377'),(38,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:44:43.674194'),(39,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:44:57.625158'),(40,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:47:46.933614'),(41,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:47:47.574732'),(42,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:47:47.877340'),(43,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:49:24.505573'),(44,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:49:25.179238'),(45,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:54:23.587691'),(46,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:54:24.384830'),(47,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:54:24.838881'),(48,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 07:54:46.091320'),(49,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:01:23.564421'),(50,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:01:34.608907'),(51,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:01:35.262953'),(52,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:01:40.809187'),(53,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:02:50.575793'),(54,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:03:04.439441'),(55,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:04:32.781134'),(56,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:04:33.641608'),(57,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:04:36.384620'),(58,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:04:41.328897'),(59,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:04:50.415105'),(60,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:04:52.136242'),(61,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:06:20.630439'),(62,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:06:21.354530'),(63,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:06:44.824405'),(64,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:16:18.386634'),(65,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:16:24.261329'),(66,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:26:11.994744'),(67,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:30:08.822478'),(68,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:30:31.100435'),(69,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 08:30:34.818679'),(70,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 09:36:50.707207'),(71,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 09:37:03.264547'),(72,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 11:04:00.929187'),(73,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 11:04:07.309236'),(74,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:19:02.950236'),(75,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:19:08.821843'),(76,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:19:10.125520'),(77,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:19:14.771381'),(78,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:19:15.251827'),(79,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:19:15.978556'),(80,'/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:47:34.448581'),(81,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:47:47.419015'),(82,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 12:51:15.192731'),(83,'/about/','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-16 13:26:12.193408');
/*!40000 ALTER TABLE `core_pageview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sitesetting`
--

DROP TABLE IF EXISTS `core_sitesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_sitesetting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `site_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title_suffix` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hero_headline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hero_subheadline` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_intro` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_statement` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_meta_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_analytics_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_experience` int unsigned NOT NULL,
  `projects_completed` int unsigned NOT NULL,
  `reports_dashboards_developed` int unsigned NOT NULL,
  `hr_processes_automated` int unsigned NOT NULL,
  `resume_drive_link` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `core_sitesetting_chk_1` CHECK ((`years_experience` >= 0)),
  CONSTRAINT `core_sitesetting_chk_2` CHECK ((`projects_completed` >= 0)),
  CONSTRAINT `core_sitesetting_chk_3` CHECK ((`reports_dashboards_developed` >= 0)),
  CONSTRAINT `core_sitesetting_chk_4` CHECK ((`hr_processes_automated` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sitesetting`
--

LOCK TABLES `core_sitesetting` WRITE;
/*!40000 ALTER TABLE `core_sitesetting` DISABLE KEYS */;
INSERT INTO `core_sitesetting` VALUES (1,'Md. Alam Hossain','Strategic HR & Payroll Expert in Bangladesh','Turning HR, Payroll & Workforce Data Into Smarter Business Decisions.','HR and payroll professional with strong experience in workforce management, payroll processing, HRIS, SQL reporting, data analytics, automation, and web-based HR solutions.','I bridge the gap between regulatory labor compliance, complex multi-tier payroll logic, and modern software development.','contact@alamhossain.com','+880 1700-000000','8801700000000','Dhaka, Bangladesh','Connecting People, Payroll, Data & Technology to drive organizational productivity.','Portfolio of Md. Alam Hossain - Senior HR & Payroll Specialist, HRIS Consultant, SQL Data Analyst, and Full-Stack Django Developer.',NULL,'','',6,18,75,14,'https://drive.google.com/file/d/1CX_4GRi2MAPbmiC5Xv1mk52GWfGYTEng/view?usp=drive_link');
/*!40000 ALTER TABLE `core_sitesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sociallink`
--

DROP TABLE IF EXISTS `core_sociallink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_sociallink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `platform` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `core_sociallink_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sociallink`
--

LOCK TABLES `core_sociallink` WRITE;
/*!40000 ALTER TABLE `core_sociallink` DISABLE KEYS */;
INSERT INTO `core_sociallink` VALUES (1,'linkedin','https://linkedin.com','bi bi-linkedin',1),(2,'github','https://github.com','bi bi-github',2);
/*!40000 ALTER TABLE `core_sociallink` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-08-16 08:16:08.271861','1','MBAHRM - Presidency University',1,'[{\"added\": {}}]',18,1),(2,'2026-08-16 08:17:04.970648','1','MBA - Presidency University',2,'[{\"changed\": {\"fields\": [\"Degree\"]}}]',18,1),(3,'2026-08-16 08:18:45.414443','1','alam',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"User permissions\"]}}]',4,1),(4,'2026-08-16 12:51:10.516005','1','Site Configuration (Md. Alam Hossain)',2,'[{\"changed\": {\"fields\": [\"Site title suffix\", \"Resume drive link\"]}}]',7,1),(5,'2026-08-16 13:26:08.804218','3','Metric Value: 100% - Statutory Compliance Rate',1,'[{\"added\": {}}]',20,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(24,'blog','blogcategory'),(25,'blog','blogpost'),(26,'contact','contactmessage'),(5,'contenttypes','contenttype'),(9,'core','pageview'),(7,'core','sitesetting'),(8,'core','sociallink'),(20,'portfolio','achievement'),(16,'portfolio','casestudy'),(21,'portfolio','certificate'),(28,'portfolio','digitalproduct'),(18,'portfolio','education'),(17,'portfolio','experience'),(27,'portfolio','productorder'),(14,'portfolio','project'),(13,'portfolio','projectcategory'),(15,'portfolio','projectimage'),(23,'portfolio','resumedownload'),(19,'portfolio','service'),(11,'portfolio','skill'),(10,'portfolio','skillcategory'),(29,'portfolio','storecategory'),(12,'portfolio','technology'),(22,'portfolio','testimonial'),(6,'sessions','session');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-08-16 07:11:19.116345'),(2,'auth','0001_initial','2026-08-16 07:11:19.692036'),(3,'admin','0001_initial','2026-08-16 07:11:19.826559'),(4,'admin','0002_logentry_remove_auto_add','2026-08-16 07:11:19.835871'),(5,'admin','0003_logentry_add_action_flag_choices','2026-08-16 07:11:19.842147'),(6,'contenttypes','0002_remove_content_type_name','2026-08-16 07:11:19.970056'),(7,'auth','0002_alter_permission_name_max_length','2026-08-16 07:11:20.037559'),(8,'auth','0003_alter_user_email_max_length','2026-08-16 07:11:20.058084'),(9,'auth','0004_alter_user_username_opts','2026-08-16 07:11:20.065143'),(10,'auth','0005_alter_user_last_login_null','2026-08-16 07:11:20.120509'),(11,'auth','0006_require_contenttypes_0002','2026-08-16 07:11:20.122883'),(12,'auth','0007_alter_validators_add_error_messages','2026-08-16 07:11:20.129708'),(13,'auth','0008_alter_user_username_max_length','2026-08-16 07:11:20.189595'),(14,'auth','0009_alter_user_last_name_max_length','2026-08-16 07:11:20.250453'),(15,'auth','0010_alter_group_name_max_length','2026-08-16 07:11:20.266106'),(16,'auth','0011_update_proxy_permissions','2026-08-16 07:11:20.286139'),(17,'auth','0012_alter_user_first_name_max_length','2026-08-16 07:11:20.345060'),(18,'sessions','0001_initial','2026-08-16 07:11:20.377042'),(19,'blog','0001_initial','2026-08-16 07:26:18.989356'),(20,'contact','0001_initial','2026-08-16 07:26:19.005571'),(21,'core','0001_initial','2026-08-16 07:26:19.063099'),(22,'portfolio','0001_initial','2026-08-16 07:26:19.633471'),(23,'portfolio','0002_digitalproduct_storecategory_productorder_and_more','2026-08-16 08:00:56.916461');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('g9hxtp79eklih5tywunvw4rhc9u1b09t','.eJxVjMsOwiAQRf-FtSEwZQZw6d5vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiZ2ZZKffLfj4yG0H6e7brfPY27rMge8KP-jg157y83K4fwfVj_qtBU6TjVYWhWimKHRIBj0aImGyKSgjEKoIWgRJ4ClZazWJAgAlqITs_QGtzTaU:1wvVtP:gU6WrNLDUqhk1hypLlDm3qVIHaNiWWL3Z3bzBOUzxaY','2026-08-30 08:06:55.695579');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_achievement`
--

DROP TABLE IF EXISTS `portfolio_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_achievement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric_value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_achievement_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_achievement`
--

LOCK TABLES `portfolio_achievement` WRITE;
/*!40000 ALTER TABLE `portfolio_achievement` DISABLE KEYS */;
INSERT INTO `portfolio_achievement` VALUES (1,'Payroll Turnaround Acceleration','85% Faster','Reduced end-of-month salary compilation timeline from 4 working days to 4 hours.','Process Automation',0),(2,'Enterprise Workforce Records Managed','2,500+ Staff','Successfully architected relational database schemas handling master employee data and daily biometric logs.','HRIS & Database',0),(3,'Statutory Compliance Rate','Metric Value: 100%','Maintained flawless regulatory alignment with the Bangladesh Labor Act and Income Tax Act across multiple corporate operational cycles.','Labor Law & Audit',3);
/*!40000 ALTER TABLE `portfolio_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_casestudy`
--

DROP TABLE IF EXISTS `portfolio_casestudy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_casestudy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `problem` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `solution` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tools_used` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `portfolio_casestudy_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_casestudy`
--

LOCK TABLES `portfolio_casestudy` WRITE;
/*!40000 ALTER TABLE `portfolio_casestudy` DISABLE KEYS */;
INSERT INTO `portfolio_casestudy` VALUES (1,'Automating Multi-Tier Payroll Calculations','automating-multi-tier-payroll-calculations','Payroll Optimization','Calculating overtime, statutory deductions, and tax slabs manually in spreadsheets took 4 days every month.','Constructed parameterized SQL Server Stored Procedures and a custom validation script to compute 2,000+ payslips in minutes.','100% computational accuracy, zero tax reporting discrepancies, and 90% reduction in processing time.','MS SQL Server, T-SQL, Python, Excel',1,0,'2026-08-16 07:26:26.230496');
/*!40000 ALTER TABLE `portfolio_casestudy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_certificate`
--

DROP TABLE IF EXISTS `portfolio_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_certificate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuing_organization` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `credential_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_certificate`
--

LOCK TABLES `portfolio_certificate` WRITE;
/*!40000 ALTER TABLE `portfolio_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_digitalproduct`
--

DROP TABLE IF EXISTS `portfolio_digitalproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_digitalproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(220) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_asset` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `downloads_count` int unsigned NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `portfolio_digitalpro_category_id_ff0a49a1_fk_portfolio` (`category_id`),
  CONSTRAINT `portfolio_digitalpro_category_id_ff0a49a1_fk_portfolio` FOREIGN KEY (`category_id`) REFERENCES `portfolio_storecategory` (`id`),
  CONSTRAINT `portfolio_digitalproduct_chk_1` CHECK ((`downloads_count` >= 0)),
  CONSTRAINT `portfolio_digitalproduct_chk_2` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_digitalproduct`
--

LOCK TABLES `portfolio_digitalproduct` WRITE;
/*!40000 ALTER TABLE `portfolio_digitalproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_digitalproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_education`
--

DROP TABLE IF EXISTS `portfolio_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_education` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `degree` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_year` int unsigned NOT NULL,
  `completion_year` int unsigned DEFAULT NULL,
  `result` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_education_chk_1` CHECK ((`start_year` >= 0)),
  CONSTRAINT `portfolio_education_chk_2` CHECK ((`completion_year` >= 0)),
  CONSTRAINT `portfolio_education_chk_3` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_education`
--

LOCK TABLES `portfolio_education` WRITE;
/*!40000 ALTER TABLE `portfolio_education` DISABLE KEYS */;
INSERT INTO `portfolio_education` VALUES (1,'MBA','Presidency University','HRM',2025,2026,'3.83','I have completed MBA in HRM from Presidency University.','education/MBA_Logo.png',1);
/*!40000 ALTER TABLE `portfolio_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_experience`
--

DROP TABLE IF EXISTS `portfolio_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_current` tinyint(1) NOT NULL,
  `responsibilities` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `achievements` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `technologies_used` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_experience_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_experience`
--

LOCK TABLES `portfolio_experience` WRITE;
/*!40000 ALTER TABLE `portfolio_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_productorder`
--

DROP TABLE IF EXISTS `portfolio_productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_productorder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_expires_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `download_token` (`download_token`),
  KEY `portfolio_productord_product_id_d767f311_fk_portfolio` (`product_id`),
  CONSTRAINT `portfolio_productord_product_id_d767f311_fk_portfolio` FOREIGN KEY (`product_id`) REFERENCES `portfolio_digitalproduct` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_productorder`
--

LOCK TABLES `portfolio_productorder` WRITE;
/*!40000 ALTER TABLE `portfolio_productorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_project`
--

DROP TABLE IF EXISTS `portfolio_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(220) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_challenge` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `engineered_solution` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_features` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_impact` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_or_company` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_demo_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `portfolio_project_category_id_d3e22b6f_fk_portfolio` (`category_id`),
  CONSTRAINT `portfolio_project_category_id_d3e22b6f_fk_portfolio` FOREIGN KEY (`category_id`) REFERENCES `portfolio_projectcategory` (`id`),
  CONSTRAINT `portfolio_project_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_project`
--

LOCK TABLES `portfolio_project` WRITE;
/*!40000 ALTER TABLE `portfolio_project` DISABLE KEYS */;
INSERT INTO `portfolio_project` VALUES (1,'Enterprise Employee & Attendance System','enterprise-employee-attendance-system','','Comprehensive Django-based HR web application featuring employee master records, shift management, and biometric logs integration.','Manual attendance reconciliation for over 1,500 factory workers was leading to 2-day payroll delays and calculation errors.','Engineered a normalized database architecture in MySQL with Django views to process raw biometric punches, auto-detect late/absent statuses, and trigger shift alerts.','* Real-time biometric punch sync\n* Shift roster scheduling engine\n* Granular role-based permissions\n* Exportable audit-ready Excel reports','Reduced monthly attendance preparation time by 80% and eliminated manual punch-entry errors.','Full Stack Developer & Systems Designer','4 Months',NULL,NULL,NULL,1,1,0,'2026-08-16 07:26:26.224185','2026-08-16 07:26:26.224185',1);
/*!40000 ALTER TABLE `portfolio_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_project_technologies`
--

DROP TABLE IF EXISTS `portfolio_project_technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_project_technologies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `technology_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portfolio_project_techno_project_id_technology_id_cd84a2f8_uniq` (`project_id`,`technology_id`),
  KEY `portfolio_project_te_technology_id_c4b04f89_fk_portfolio` (`technology_id`),
  CONSTRAINT `portfolio_project_te_project_id_e9d36f9e_fk_portfolio` FOREIGN KEY (`project_id`) REFERENCES `portfolio_project` (`id`),
  CONSTRAINT `portfolio_project_te_technology_id_c4b04f89_fk_portfolio` FOREIGN KEY (`technology_id`) REFERENCES `portfolio_technology` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_project_technologies`
--

LOCK TABLES `portfolio_project_technologies` WRITE;
/*!40000 ALTER TABLE `portfolio_project_technologies` DISABLE KEYS */;
INSERT INTO `portfolio_project_technologies` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,6);
/*!40000 ALTER TABLE `portfolio_project_technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_projectcategory`
--

DROP TABLE IF EXISTS `portfolio_projectcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_projectcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_projectcategory`
--

LOCK TABLES `portfolio_projectcategory` WRITE;
/*!40000 ALTER TABLE `portfolio_projectcategory` DISABLE KEYS */;
INSERT INTO `portfolio_projectcategory` VALUES (1,'HR Technology','hr-technology'),(2,'SQL & Analytics','sql-analytics');
/*!40000 ALTER TABLE `portfolio_projectcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_projectimage`
--

DROP TABLE IF EXISTS `portfolio_projectimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_projectimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_projectima_project_id_9276d60f_fk_portfolio` (`project_id`),
  CONSTRAINT `portfolio_projectima_project_id_9276d60f_fk_portfolio` FOREIGN KEY (`project_id`) REFERENCES `portfolio_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_projectimage`
--

LOCK TABLES `portfolio_projectimage` WRITE;
/*!40000 ALTER TABLE `portfolio_projectimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_projectimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_resumedownload`
--

DROP TABLE IF EXISTS `portfolio_resumedownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_resumedownload` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `downloaded_at` datetime(6) NOT NULL,
  `ip_address` char(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_resumedownload`
--

LOCK TABLES `portfolio_resumedownload` WRITE;
/*!40000 ALTER TABLE `portfolio_resumedownload` DISABLE KEYS */;
INSERT INTO `portfolio_resumedownload` VALUES (1,'2026-08-16 12:19:18.221020','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36'),(2,'2026-08-16 12:51:16.759079','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36');
/*!40000 ALTER TABLE `portfolio_resumedownload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_service`
--

DROP TABLE IF EXISTS `portfolio_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailed_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_service_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_service`
--

LOCK TABLES `portfolio_service` WRITE;
/*!40000 ALTER TABLE `portfolio_service` DISABLE KEYS */;
INSERT INTO `portfolio_service` VALUES (1,'Payroll & Final Settlement Architecture','bi bi-cash-stack','End-to-end payroll processing logic, compliance audits, and final settlement computations.','Audit-proof calculations covering gratuity, earned leave encashment, notice pay, and statutory tax deductions compliant with regional labor acts.',1,0),(2,'Custom Django HR Application Development','bi bi-laptop','Web-based HRIS, KPI tracking systems, and automated approval workflows.','Custom web systems built using Python/Django and MySQL tailored to organizational operational hierarchies.',1,0);
/*!40000 ALTER TABLE `portfolio_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_skill`
--

DROP TABLE IF EXISTS `portfolio_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_skill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proficiency_percentage` int unsigned NOT NULL,
  `icon_class` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_skill_category_id_dbcf3ac0_fk_portfolio` (`category_id`),
  CONSTRAINT `portfolio_skill_category_id_dbcf3ac0_fk_portfolio` FOREIGN KEY (`category_id`) REFERENCES `portfolio_skillcategory` (`id`),
  CONSTRAINT `portfolio_skill_chk_1` CHECK ((`proficiency_percentage` >= 0)),
  CONSTRAINT `portfolio_skill_chk_2` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_skill`
--

LOCK TABLES `portfolio_skill` WRITE;
/*!40000 ALTER TABLE `portfolio_skill` DISABLE KEYS */;
INSERT INTO `portfolio_skill` VALUES (1,'Payroll Processing & Tax',98,NULL,1,0,1),(2,'Final Settlement & Benefits',95,NULL,1,0,1),(3,'Labor Law & Compliance',90,NULL,1,0,1),(4,'Microsoft SQL Server / T-SQL',92,NULL,1,0,2),(5,'Workforce Analytics & Dashboards',88,NULL,1,0,2),(6,'Advanced Excel & Power Query',95,NULL,1,0,2),(7,'Python & Django Web Apps',85,NULL,1,0,3),(8,'MySQL Database Architecture',88,NULL,1,0,3);
/*!40000 ALTER TABLE `portfolio_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_skillcategory`
--

DROP TABLE IF EXISTS `portfolio_skillcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_skillcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `portfolio_skillcategory_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_skillcategory`
--

LOCK TABLES `portfolio_skillcategory` WRITE;
/*!40000 ALTER TABLE `portfolio_skillcategory` DISABLE KEYS */;
INSERT INTO `portfolio_skillcategory` VALUES (1,'HR & Payroll','hr-payroll','bi bi-people-fill',1),(2,'Data & Analytics','data-analytics','bi bi-database-fill-check',2),(3,'Development & Tools','development-tools','bi bi-code-square',3);
/*!40000 ALTER TABLE `portfolio_skillcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_storecategory`
--

DROP TABLE IF EXISTS `portfolio_storecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_storecategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `portfolio_storecategory_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_storecategory`
--

LOCK TABLES `portfolio_storecategory` WRITE;
/*!40000 ALTER TABLE `portfolio_storecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_storecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_technology`
--

DROP TABLE IF EXISTS `portfolio_technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_technology` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_technology`
--

LOCK TABLES `portfolio_technology` WRITE;
/*!40000 ALTER TABLE `portfolio_technology` DISABLE KEYS */;
INSERT INTO `portfolio_technology` VALUES (1,'Python','bg-secondary'),(2,'Django','bg-secondary'),(3,'MySQL','bg-secondary'),(4,'MS SQL Server','bg-secondary'),(5,'Advanced Excel','bg-secondary'),(6,'Bootstrap 5','bg-secondary'),(7,'Power BI','bg-secondary'),(8,'JavaScript','bg-secondary');
/*!40000 ALTER TABLE `portfolio_technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_testimonial`
--

DROP TABLE IF EXISTS `portfolio_testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_testimonial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int unsigned NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `display_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_testimonial_chk_1` CHECK ((`rating` >= 0)),
  CONSTRAINT `portfolio_testimonial_chk_2` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_testimonial`
--

LOCK TABLES `portfolio_testimonial` WRITE;
/*!40000 ALTER TABLE `portfolio_testimonial` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_testimonial` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-16 19:27:05
