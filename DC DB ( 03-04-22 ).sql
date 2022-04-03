-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.7.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dokuscorev2
CREATE DATABASE IF NOT EXISTS `dokuscorev2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dokuscorev2`;

-- Dumping structure for table dokuscorev2.banks
CREATE TABLE IF NOT EXISTS `banks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `CharID` int(11) NOT NULL DEFAULT 1,
  `Type` varchar(50) DEFAULT NULL,
  `Bank` varchar(50) DEFAULT NULL,
  `Money` float NOT NULL,
  `Gold` float NOT NULL,
  `Synced` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.banks: ~0 rows (approximately)
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.blacklist
CREATE TABLE IF NOT EXISTS `blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) DEFAULT NULL,
  `Reason` varchar(50) DEFAULT NULL,
  `Admin` varchar(50) DEFAULT NULL,
  `Until` int(11) NOT NULL DEFAULT -1,
  `IP` varchar(50) DEFAULT NULL,
  `License` varchar(50) DEFAULT NULL,
  `XBoxLive` varchar(50) DEFAULT NULL,
  `MLive` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Steam` (`Steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.blacklist: ~0 rows (approximately)
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `CharID` int(11) NOT NULL DEFAULT 1,
  `Group` varchar(50) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `BirthDate` varchar(50) NOT NULL,
  `Money` float NOT NULL DEFAULT 0,
  `Gold` float NOT NULL DEFAULT 0,
  `XP` int(11) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 0,
  `JobName` varchar(50) NOT NULL DEFAULT 'unemployed',
  `JobGrade` int(11) NOT NULL DEFAULT 0,
  `Coords` varchar(100) DEFAULT NULL,
  `Skin` varchar(5000) DEFAULT NULL,
  `Clothing` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.characters: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.inventory
CREATE TABLE IF NOT EXISTS `inventory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) DEFAULT NULL,
  `CharID` int(11) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Item` varchar(50) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Meta` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.items
CREATE TABLE IF NOT EXISTS `items` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `CTI` varchar(50) DEFAULT NULL,
  `CA` int(11) DEFAULT NULL,
  `InvLimit` int(11) DEFAULT NULL,
  `Metabolism` varchar(50) DEFAULT NULL,
  `CanPlace` varchar(50) DEFAULT NULL,
  `Hunger` float DEFAULT NULL,
  `Thirst` float DEFAULT NULL,
  `Health` int(11) DEFAULT NULL,
  `Stamina` int(11) DEFAULT NULL,
  `GHI` int(11) DEFAULT NULL,
  `GHO` int(11) DEFAULT NULL,
  `GSI` int(11) DEFAULT NULL,
  `GSO` int(11) DEFAULT NULL,
  `Prop` varchar(200) DEFAULT NULL,
  `Animate` varchar(200) DEFAULT NULL,
  `Event` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.items: ~20 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`ID`, `Item`, `Name`, `Type`, `CTI`, `CA`, `InvLimit`, `Metabolism`, `CanPlace`, `Hunger`, `Thirst`, `Health`, `Stamina`, `GHI`, `GHO`, `GSI`, `GSO`, `Prop`, `Animate`, `Event`) VALUES
	(1, 'carrot', 'Carrot', 'Consumable', NULL, 0, 10, 'true', 'false', 5, 2, 0, 0, 0, 0, 0, 0, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(2, 'cigar', 'Cigar', 'Consumable', NULL, 0, 50, 'true', 'false', -5, -15, -8, -15, 30, 0, 0, 0, NULL, NULL, NULL),
	(3, 'cigarette', 'Cigarette', 'Consumable', NULL, 0, 100, 'true', 'false', -5, -15, -5, -13, 25, 0, 0, 0, NULL, NULL, NULL),
	(4, 'cigarette_box', 'Cigarette Box', 'Consumable', 'cigarette', 25, 5, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'coffee', 'Coffee', 'Consumable', NULL, 0, 5, 'true', 'false', -5, 20, 3, 20, 0, 0, 0, 0, 'p_bottleJD01x_ph_r_hand', 'DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK', NULL),
	(6, 'eggs', 'Eggs', 'Consumable', NULL, 0, 50, 'true', 'false', 5, -5, 3, 4, 0, 0, 0, 0, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(7, 'egg_box', 'Egg Box', 'Consumable', 'eggs', 10, 3, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'gold_bar', 'Goldbar', 'Valuta', 'gold_coin', 35, 3, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'gold_nugget', 'Gold Nugget', 'Mineral', NULL, 0, 120, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'gold_coin', 'Gold Coin', 'Valuta', NULL, 0, 200, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'silver_nugget', 'Silver Nugget', 'Mineral', 'silver_coin', 50, 200, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'silver_coin', 'Silver Coin', 'Valuta', NULL, 0, 200, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'gold_pan', 'Gold Pan', 'Tool', NULL, 0, 2, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'horsebrush', 'Horse Brush', 'Tool', NULL, 0, 1, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'lockpick', 'Lock Pick', 'Tool', NULL, 0, 5, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'meat_cooked', 'Cooked Meat', 'Consumable', NULL, 0, 10, 'true', 'false', 30, -10, 10, 25, 0, 0, 0, 0, NULL, NULL, NULL),
	(17, 'meat_uncooked', 'Uncooked Meat', 'Consumable', 'meat_cooked', 1, 10, 'true', 'false', 15, -20, -25, 12, 0, 0, 0, 0, NULL, NULL, NULL),
	(18, 'water_clean', 'Clean Water', 'Consumable', NULL, 0, 10, 'true', 'false', 0, 20, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL),
	(19, 'water_dirty', 'Dirty Water', 'Consumable', 'water_clean', 1, 10, 'true', 'false', 0, 20, -10, 0, 0, 0, 0, 0, NULL, NULL, NULL),
	(20, 'campfire', 'Campfire', 'Tool', NULL, 0, 2, 'false', 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'p_campfire02x', 'WORLD_HUMAN_CROUCH_INSPECT', NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.metabolism
CREATE TABLE IF NOT EXISTS `metabolism` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `CharID` int(11) NOT NULL,
  `Health` float NOT NULL DEFAULT 100,
  `Hunger` float NOT NULL DEFAULT 100,
  `Thirst` float NOT NULL DEFAULT 100,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.metabolism: ~0 rows (approximately)
/*!40000 ALTER TABLE `metabolism` DISABLE KEYS */;
/*!40000 ALTER TABLE `metabolism` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `Music` int(11) NOT NULL DEFAULT 1,
  `Language` varchar(50) NOT NULL,
  `Volume` float DEFAULT 0.3,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Steam` (`Steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.storages
CREATE TABLE IF NOT EXISTS `storages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) DEFAULT NULL,
  `CharID` int(11) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `BoxID` int(11) NOT NULL DEFAULT 0,
  `Meta` varchar(5000) DEFAULT NULL,
  `Coords` varchar(150) DEFAULT NULL,
  `Expiration` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.storages: ~0 rows (approximately)
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `sName` varchar(50) NOT NULL,
  `IP` varchar(50) NOT NULL,
  `License` varchar(50) NOT NULL,
  `XBoxLive` varchar(50) NOT NULL,
  `MLive` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Steam` (`Steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table dokuscorev2.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `sName` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Allowed` varchar(50) DEFAULT NULL,
  `Reason` varchar(50) DEFAULT NULL,
  UNIQUE KEY `Steam` (`Steam`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscorev2.whitelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
