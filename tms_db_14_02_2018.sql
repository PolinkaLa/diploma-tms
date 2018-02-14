-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.17-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных tms_db
CREATE DATABASE IF NOT EXISTS `tms_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tms_db`;

-- Дамп структуры для таблица tms_db.checklist
CREATE TABLE IF NOT EXISTS `checklist` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.checklist: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` (`id`, `fk_project_id`, `title`, `created_date`, `active_status`) VALUES
	(1, 1, 'чеклист', '2017-12-02 17:56:06', NULL);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;

-- Дамп структуры для таблица tms_db.level
CREATE TABLE IF NOT EXISTS `level` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.level: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` (`id`, `name`) VALUES
	(1, 'smoke'),
	(2, 'regres');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;

-- Дамп структуры для таблица tms_db.project
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `active_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.project: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `title`, `created_date`, `active_status`) VALUES
	(1, 'Test Project', '2017-12-02 17:55:32', NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Дамп структуры для таблица tms_db.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.role: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`) VALUES
	(1, 'admin'),
	(2, 'intern');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Дамп структуры для таблица tms_db.run_status
CREATE TABLE IF NOT EXISTS `run_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.run_status: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `run_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `run_status` ENABLE KEYS */;

-- Дамп структуры для таблица tms_db.test
CREATE TABLE IF NOT EXISTS `test` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.test: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`, `fk_checklist_id`, `fk_user_id`, `fk_type_id`, `fk_level_id`, `title`, `description`, `created_date`, `updated_date`, `file_name`) VALUES
	(1, 1, 1, 1, 1, 'проверка', NULL, '2017-12-02 17:56:48', '2017-12-02 17:56:48', NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- Дамп структуры для таблица tms_db.type
CREATE TABLE IF NOT EXISTS `type` (
 `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.type: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id`, `name`) VALUES
	(1, 'ui'),
	(2, 'func');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;

-- Дамп структуры для таблица tms_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_role_id` int(10) NOT NULL,
  `principal_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `principal_name_UNIQUE` (`principal_name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `_idx` (`fk_role_id`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`fk_role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tms_db.user: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `fk_role_id`, `principal_name`) VALUES
	(1, 1, 'lp'),
	(2, 1, 'polina');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
