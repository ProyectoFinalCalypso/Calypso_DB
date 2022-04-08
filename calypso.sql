CREATE DATABASE  IF NOT EXISTS `calypso` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `calypso`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: calypso
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `id_agency` int NOT NULL AUTO_INCREMENT,
  `acronym` varchar(10) NOT NULL,
  `full_name` varchar(60) NOT NULL,
  `website_url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_agency`,`full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'PADI','Professional Association of Diving Instructors','https://www.padi.com/es'),(2,'SSI','Scuba Schools International','https://www.divessi.com/es/'),(3,'GUE','Global Underwater Explorers','https://www.gue.com/es'),(4,'UTD','Unified Team Diving','https://utdscubadiving.com/'),(5,'CMAS','Confederation Mondiale des Activités Subaquatiques','https://www.cmas.org/'),(6,'IANTD','International Association of Nitrox and Technical Divers','https://www.iantdspain.com/'),(7,'NAUI','National Association of Underwater Instructors','https://www.naui.org/'),(8,'ACUC','American Canadian Underwater Certifications','https://acuc.es/'),(9,'SNSI','Scuba Nitrox Safety International','https://scubasnsi.goscubasnsi.com/?lang=es'),(11,'BSAC','British Sub-Aqua Club','https://www.bsac.com/home/'),(12,'SDI','Scuba Diving International','https://www.tdisdi.com/?lang=es'),(13,'TDI','Technical Diving International','https://www.tdisdi.com/?lang=es'),(14,'FEDAS','Federación Española de Actividades Subacuáticas','http://fedas.es/');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buddies_diving`
--

DROP TABLE IF EXISTS `buddies_diving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buddies_diving` (
  `id_relation_buddy` int NOT NULL AUTO_INCREMENT,
  `diving_id` int NOT NULL,
  `user_id` int NOT NULL,
  `buddy_id` int NOT NULL,
  PRIMARY KEY (`id_relation_buddy`),
  KEY `FK_relacion_diving_id_idx` (`diving_id`),
  KEY `FK_relacion_buddy_id_idx` (`buddy_id`),
  KEY `FK_relacion_user_id` (`user_id`),
  CONSTRAINT `FK_buddies_buddy_id` FOREIGN KEY (`buddy_id`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FK_buddies_divelog_id` FOREIGN KEY (`diving_id`) REFERENCES `divelog` (`id_divelog`),
  CONSTRAINT `FK_buddies_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buddies_diving`
--

LOCK TABLES `buddies_diving` WRITE;
/*!40000 ALTER TABLE `buddies_diving` DISABLE KEYS */;
INSERT INTO `buddies_diving` VALUES (1,2,0,1),(2,3,1,0),(3,2,0,2);
/*!40000 ALTER TABLE `buddies_diving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certification` (
  `id_certification` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `agency_id` int NOT NULL,
  `max_deep` int NOT NULL,
  `decompresion` tinyint NOT NULL,
  `cave_diving` tinyint NOT NULL,
  `dpv` tinyint NOT NULL,
  PRIMARY KEY (`id_certification`),
  KEY `FK_certification_agency_id_idx` (`agency_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_certification_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id_agency`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `divelog`
--

DROP TABLE IF EXISTS `divelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divelog` (
  `id_divelog` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `num_dive` int NOT NULL,
  `start_date_time` datetime NOT NULL,
  `dive_length` int NOT NULL,
  `max_depth` double NOT NULL,
  `avg_depth` double DEFAULT NULL,
  `deco_time` int DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `gas_consumption` double DEFAULT NULL,
  `buddy_name` varchar(35) DEFAULT NULL,
  `diving_center` varchar(45) DEFAULT NULL,
  `location` varchar(35) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `notes` varchar(150) DEFAULT NULL,
  `photo1` longtext,
  `photo2` longtext,
  `photo3` longtext,
  `photo4` longtext,
  PRIMARY KEY (`id_divelog`),
  KEY `FK_divelog_user_id_idx` (`user_id`),
  CONSTRAINT `FK_divelog_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id_equipment` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `type` varchar(15) NOT NULL,
  `date_purchase` date DEFAULT NULL,
  `last_check_date` date DEFAULT NULL,
  `check_recommended_months` int DEFAULT NULL,
  `check_recommended_hours` int DEFAULT NULL,
  `check_recommended_dives` int DEFAULT NULL,
  `used_dives` int DEFAULT NULL,
  `used_dives_after_check` int DEFAULT NULL,
  `used_hours` double DEFAULT NULL,
  `used_hours_after_check` double DEFAULT NULL,
  PRIMARY KEY (`id_equipment`),
  KEY `FK_equipment_user_id_idx` (`user_id`),
  CONSTRAINT `FK_equipment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `planning`
--

DROP TABLE IF EXISTS `planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planning` (
  `id_planning` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `dive_center` varchar(45) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_planning`),
  KEY `FK_user_id_idx` (`user_id`),
  CONSTRAINT `FK_planning_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(25) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `photo` longtext COMMENT 'Images encoded in Base64',
  `birth_date` int DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `password_hash` varchar(128) NOT NULL COMMENT 'SHA-2 512bits (128 characters)',
  `email` varchar(45) NOT NULL,
  `register_date` date NOT NULL,
  `public_profile` tinyint NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `user_certification`
--

DROP TABLE IF EXISTS `user_certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_certification` (
  `id_user_certification` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `certification_id` int NOT NULL,
  `date_certification` date NOT NULL,
  `instructor_code` varchar(15) DEFAULT NULL,
  `instructor_name` varchar(35) DEFAULT NULL,
  `diving_center` varchar(35) DEFAULT NULL,
  `location` varchar(25) DEFAULT NULL,
  `county` varchar(25) DEFAULT NULL,
  `frontal_photo` longtext,
  `back_photo` longtext,
  PRIMARY KEY (`id_user_certification`),
  KEY `FK_relation_user_id_idx` (`user_id`),
  KEY `FK_relacion_certicicacion_id_idx` (`certification_id`),
  CONSTRAINT `FK_relation_certification_id` FOREIGN KEY (`certification_id`) REFERENCES `certification` (`id_certification`),
  CONSTRAINT `FK_relation_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `user_subscription`
--

DROP TABLE IF EXISTS `user_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subscription` (
  `id_subscription` int NOT NULL AUTO_INCREMENT,
  `lider_user_id` int NOT NULL,
  `follower_user_id` int NOT NULL,
  `date_subscription` date NOT NULL,
  PRIMARY KEY (`id_subscription`),
  KEY `FK_lider_user_id_idx` (`lider_user_id`),
  KEY `FK_follower_user_id_idx` (`follower_user_id`),
  CONSTRAINT `FK_Subscription_follower_user_id` FOREIGN KEY (`follower_user_id`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FK_subscription_lider_user_id` FOREIGN KEY (`lider_user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08 23:12:06
