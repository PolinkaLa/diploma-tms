-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: tms_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_project_id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `active_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_project_id_idx` (`fk_project_id`),
  KEY `_idx` (`fk_project_id`),
  CONSTRAINT `fk_project_id` FOREIGN KEY (`fk_project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (1,1,'чеклист','2017-12-02 17:56:06',NULL),(2,1,'backend','2018-03-28 19:34:38',NULL),(3,1,'frontend','2018-03-28 19:34:38',NULL),(4,2,'авторизация','2018-03-28 19:34:38',NULL),(5,2,'тесты','2018-03-28 19:34:38',NULL),(6,2,'экспорт','2018-03-28 19:34:38',NULL),(7,3,'анализ аналогов','2018-03-28 19:34:38',NULL),(8,3,'диаграммы','2018-03-28 19:34:38',NULL),(9,3,'реализация','2018-03-28 19:34:38',NULL);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'smoke'),(2,'regres');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `active_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Test Project','2017-12-02 17:55:32','\0'),(2,'TMS','2018-03-28 19:31:32',NULL),(3,'Diploma','2018-03-28 19:31:32',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'intern');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run`
--

DROP TABLE IF EXISTS `run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
/*!40000 ALTER TABLE `run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_status`
--

DROP TABLE IF EXISTS `run_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_status`
--

LOCK TABLES `run_status` WRITE;
/*!40000 ALTER TABLE `run_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `run_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_checklist_id` int(10) DEFAULT NULL,
  `fk_user_id` int(10) DEFAULT NULL,
  `fk_type_id` int(10) DEFAULT NULL,
  `fk_level_id` int(10) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_checklist_id_idx` (`fk_checklist_id`),
  KEY `fk_type_id_idx` (`fk_type_id`),
  KEY `fk_user_id_idx` (`fk_user_id`),
  KEY `fk_level_id_idx` (`fk_level_id`),
  CONSTRAINT `fk_checklist_id` FOREIGN KEY (`fk_checklist_id`) REFERENCES `checklist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_level_id` FOREIGN KEY (`fk_level_id`) REFERENCES `level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_id` FOREIGN KEY (`fk_type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,1,1,1,1,'проверка','екпапвпуке','2017-12-02 17:56:48','2017-12-02 17:56:48',NULL),(2,1,1,1,1,'testfrombrowser','lol','2018-02-27 23:07:55','2018-02-27 23:07:55',NULL),(3,2,1,1,1,'апрпарапрап','укеукеук','2018-03-28 19:47:38','2018-03-28 19:47:38',NULL),(4,2,1,1,1,'гонрекепеук','акваыва','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(5,3,1,1,1,'впапрапрап вапвпа ',' апапмв','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(6,3,1,1,1,'апвапап ','вапвап ','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(7,4,1,1,1,'лдап авторизация','ввести короптативный логин','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(8,4,1,1,1,'выход из приложения','разлогиться ','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(9,5,1,1,1,'выбор проекта','выбрать проект из списка','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(10,5,1,1,1,'выбор чеклиста','выбрать чеклист из списка относительно проекта','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(11,6,1,1,1,'скачивание файла','проерить что файл скачивается','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(12,6,1,1,1,'не пустой файл','проверить что в файле сожердится информация из тпблицы','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(13,7,1,1,1,'выбор аналогов','выбрать 2 - 3 аналога','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(14,7,1,1,1,'анализ аналогов','подготовить критерии сравнения аналогов','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(15,8,1,1,1,'диаграмм бд','экспортировать из воркбенча','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(16,8,1,1,1,'программная архитектура','представить как описать мвс','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(17,9,1,1,1,'реализация модулей','подготовть приложение для проданшен сервера','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL),(18,9,1,1,1,'тестирование','провести тестирование','2018-03-28 19:47:39','2018-03-28 19:47:39',NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run`
--

DROP TABLE IF EXISTS `test_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_run` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_test_id` int(10) NOT NULL,
  `fk_run_id` int(10) NOT NULL,
  `fk_run_status_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_id_idx` (`fk_test_id`),
  KEY `fk_run_id_idx` (`fk_run_id`),
  KEY `fk_run_status_id_idx` (`fk_run_status_id`),
  CONSTRAINT `fk_run_id` FOREIGN KEY (`fk_run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_status_id` FOREIGN KEY (`fk_run_status_id`) REFERENCES `run_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_id` FOREIGN KEY (`fk_test_id`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run`
--

LOCK TABLES `test_run` WRITE;
/*!40000 ALTER TABLE `test_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'ui'),(2,'func');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_role_id` int(10) NOT NULL,
  `principal_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `principal_name_UNIQUE` (`principal_name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `_idx` (`fk_role_id`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`fk_role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'lp'),(2,1,'polina'),(3,1,'lappo'),(5,1,'lappoPolina');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-29  1:35:31
