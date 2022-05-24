-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dokuscore
CREATE DATABASE IF NOT EXISTS `dokuscore` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dokuscore`;

-- Dumping structure for table dokuscore.banks
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

-- Dumping data for table dokuscore.banks: ~0 rows (approximately)
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;

-- Dumping structure for table dokuscore.blacklist
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

-- Dumping data for table dokuscore.blacklist: ~0 rows (approximately)
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;

-- Dumping structure for table dokuscore.characters
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

-- Dumping data for table dokuscore.characters: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table dokuscore.inventory
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

-- Dumping data for table dokuscore.inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

-- Dumping structure for table dokuscore.items
CREATE TABLE IF NOT EXISTS `items` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Description` longtext NOT NULL DEFAULT '--',
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
  `PropPos` varchar(200) DEFAULT NULL,
  `Animation` varchar(200) DEFAULT NULL,
  `AniTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscore.items: ~26 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`ID`, `Item`, `Name`, `Type`, `Description`, `CTI`, `CA`, `InvLimit`, `Metabolism`, `CanPlace`, `Hunger`, `Thirst`, `Health`, `Stamina`, `GHI`, `GHO`, `GSI`, `GSO`, `Prop`, `PropPos`, `Animation`, `AniTime`) VALUES
	(1, 'carrot', 'Carrot', 'Consumable', 'Its orange! Its healty!', NULL, 0, 10, 'true', 'false', 5, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(2, 'cigar', 'Cigar', 'Consumable', 'Be the boss, and smoke one of these fine brands!', NULL, 0, 50, 'true', 'false', -5, -15, -8, -15, 30, 0, 0, 0, NULL, NULL, NULL, NULL),
	(3, 'cigarette', 'Cigarette', 'Consumable', 'Back in the day, they thought this was healty! For Sure!', NULL, 0, 100, 'true', 'false', -5, -15, -5, -13, 25, 0, 0, 0, NULL, NULL, NULL, NULL),
	(4, 'cigarette_box', 'Cigarette Box', 'Consumable', 'A box containing 25 cigarettes', 'cigarette', 25, 5, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'coffee', 'Coffee', 'Consumable', 'That mornig brew you can\'t go without', NULL, 0, 5, 'true', 'false', -10, 20, 3, 20, 20, 10, 30, 60, 'P_MUGCOFFEE01X', 'P_MUGCOFFEE01X_PH_R_HAND', 'DRINK_COFFEE_HOLD', NULL),
	(6, 'egg', 'Eggs', 'Consumable', 'I think it has something to do with a chicken? hmmmm', NULL, 0, 50, 'true', 'false', 5, -5, 3, 4, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(7, 'egg_box', 'Egg Box', 'Consumable', 'A box containing 10 eggs', 'eggs', 10, 3, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(8, 'gold_bar', 'Goldbar', 'Valuta', 'That mineral that everyone is killing each other for, but then refined into a golden bar', 'gold_coin', 35, 3, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'gold_nugget', 'Gold Nugget', 'Mineral', 'Unrefined golden nuggest. Don\'t you wish yours where of gold?', NULL, 0, 120, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'gold_coin', 'Gold Coin', 'Valuta', 'A thing you pay with, but you don\'t want to pay with. Its way to shiny to give away', NULL, 0, 200, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'silver_nugget', 'Silver Nugget', 'Mineral', 'Unrefined silver nuggest. Seriously, don\'t even bother, gold is much better', 'silver_coin', 50, 200, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'silver_coin', 'Silver Coin', 'Valuta', 'A thing you pay with, but most also eat with. weird world we live in don\'t you think?', NULL, 0, 200, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'gold_pan', 'Gold Pan', 'Tool', 'A device to filter gold nuggest out of the water and dirt', NULL, 0, 2, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'horsebrush', 'Horse Brush', 'Tool', 'A simple tool to keep your horse from getting dirty. Soooo Dirty!!!', NULL, 0, 1, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'lockpick', 'Lock Pick', 'Tool', 'For those that do not value other people belongings, then this is your tool!', NULL, 0, 5, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'meat_cooked', 'Cooked Meat', 'Consumable', 'That food that make men become beasts. Just throw the meat to them and then RUN!', NULL, 0, 10, 'true', 'false', 30, -10, 10, 25, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(17, 'meat_uncooked', 'Uncooked Meat', 'Consumable', 'It\'s meat, it\'s uncooked! You should try to eat it, maybe you wound die from it!', 'meat_cooked', 1, 10, 'true', 'false', 15, -20, -25, 12, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(18, 'water_clean', 'Clean Water', 'Consumable', 'Around 80% of your body is made out of water, at least that is what the future people whisper in my ears.', NULL, 0, 10, 'true', 'false', 0, 20, 0, 0, 0, 0, 0, 0, 'p_bottleJD01x', 'p_bottleJD01x_ph_r_hand', 'DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK', NULL),
	(19, 'water_dirty', 'Dirty Water', 'Consumable', 'Cook it before your drink it!', 'water_clean', 1, 10, 'true', 'false', 0, 20, -10, 0, 0, 0, 0, 0, 'p_bottleJD01x', 'p_bottleJD01x_ph_r_hand', 'DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK', NULL),
	(20, 'campfire', 'Campfire', 'Deployable', 'Something to keep you warm at night. If you had a girlfriend, you\'ve would not need one!', NULL, 0, 2, 'true', 'true', -5, -10, 0, -20, 0, 0, 0, 0, 'p_campfire02x', NULL, 'WORLD_HUMAN_CROUCH_INSPECT', '13000'),
	(21, 'whiskey', 'Whiskey', 'Consumable', 'Try to drink this, and walk in a strait line to your horse. I dare you!', NULL, 0, 10, 'true', 'false', -10, -15, 10, -15, 60, 60, 0, 0, 'p_bottleJD01x', 'p_bottleJD01x_ph_r_hand', 'DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK', NULL),
	(22, 'blueberry', 'Blueberry', 'Consumable', 'Its a berry that is not red, but blue!', NULL, 0, 500, 'true', 'false', 2, 2, 2, 2, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(23, 'blackberry', 'Blackberry', 'Consumable', 'Its a berry that is not blue, but black!', NULL, 0, 500, 'true', 'false', 2, 2, 2, 2, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(24, 'apple', 'Apple', 'Consumable', 'Oh Oh Adam, what did you do!', NULL, 0, 150, 'true', 'false', 5, 5, 5, 5, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(25, 'orange', 'Orange', 'Consumable', 'In the old days it was a fruit. In the future, they call it Donald Trump', NULL, 0, 150, 'true', 'false', 5, 10, 5, 5, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL),
	(26, 'trumpet', 'Trumpet', 'Instrument', 'Its from brass, its annoying, don\'t buy it, don\'t play it!', NULL, 0, 1, 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WORLD_HUMAN_TRUMPET', NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table dokuscore.metabolism
CREATE TABLE IF NOT EXISTS `metabolism` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `CharID` int(11) NOT NULL,
  `Health` float NOT NULL DEFAULT 100,
  `Hunger` float NOT NULL DEFAULT 100,
  `Thirst` float NOT NULL DEFAULT 100,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscore.metabolism: ~0 rows (approximately)
/*!40000 ALTER TABLE `metabolism` DISABLE KEYS */;
/*!40000 ALTER TABLE `metabolism` ENABLE KEYS */;

-- Dumping structure for table dokuscore.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Steam` varchar(50) NOT NULL,
  `Music` int(11) NOT NULL DEFAULT 1,
  `Language` varchar(50) NOT NULL,
  `Volume` float DEFAULT 0.3,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Steam` (`Steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscore.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table dokuscore.storages
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

-- Dumping data for table dokuscore.storages: ~0 rows (approximately)
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;

-- Dumping structure for table dokuscore.stores
CREATE TABLE IF NOT EXISTS `stores` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '--',
  `Type` varchar(50) COLLATE utf8mb4_bin DEFAULT '--',
  `Description` longtext COLLATE utf8mb4_bin DEFAULT '--',
  `Limit` int(11) NOT NULL DEFAULT 25,
  `Buy` float NOT NULL DEFAULT 0.1,
  `Sell` float NOT NULL DEFAULT 0.05,
  `ItemData` longtext COLLATE utf8mb4_bin DEFAULT '--',
  `Stock` longtext COLLATE utf8mb4_bin DEFAULT '--',
  `Stores` longtext COLLATE utf8mb4_bin DEFAULT '--',
  `Taxation` longtext COLLATE utf8mb4_bin DEFAULT '--',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table dokuscore.stores: ~21 rows (approximately)
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`ID`, `Item`, `Name`, `Type`, `Description`, `Limit`, `Buy`, `Sell`, `ItemData`, `Stock`, `Stores`, `Taxation`) VALUES
	(1, 'carrot', 'Carrot', 'Consumable', 'Its orange! Its healty!', 50, 0.08, 0.05, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(2, 'cigar', 'Cigar', 'Consumable', 'Be the boss, and smoke one of these fine brands!', 75, 0.17, 0.11, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(3, 'cigarette', 'Cigarette', 'Consumable', 'Back in the day, they thought this was healty! For Sure!', 100, 0.02, 0.01, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(4, 'cigarette_box', 'Cigarette Box', 'Consumable', 'A box containing 25 cigarettes', 30, 0.51, 0.12, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(5, 'coffee', 'Coffee', 'Consumable', 'That mornig brew you can\'t go without', 60, 0.25, 0.12, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(6, 'egg', 'Eggs', 'Consumable', 'I think it has something to do with a chicken? hmmmm', 100, 0.05, 0.01, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(7, 'egg_box', 'Egg Box', 'Consumable', 'A box containing 10 eggs', 25, 0.5, 0.1, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(8, 'gold_pan', 'Gold Pan', 'Tool', 'A device to filter gold nuggest out of the water and dirt', 10, 2.48, 1.52, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(9, 'horsebrush', 'Horse Brush', 'Tool', 'A simple tool to keep your horse from getting dirty. Soooo Dirty!!!', 15, 0.75, 0.35, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(10, 'lockpick', 'Lock Pick', 'Tool', 'For those that do not value other people belongings, then this is your tool!', 30, 0.53, 0.15, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(11, 'meat_cooked', 'Cooked Meat', 'Consumable', 'That food that make men become beasts. Just throw the meat to them and then RUN!', 55, 0.22, 0.09, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(12, 'meat_uncooked', 'Uncooked Meat', 'Consumable', 'It\'s meat, it\'s uncooked! You should try to eat it, maybe you wound die from it!', 55, 0.32, 0.15, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(13, 'water_clean', 'Clean Water', 'Consumable', 'Around 80% of your body is made out of water, at least that is what the future people whisper in my ears.', 50, 0.45, 0.25, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(14, 'campfire', 'Campfire', 'Deployable', 'Something to keep you warm at night. If you had a girlfriend, you\'ve would not need one!', 10, 2.75, 1.27, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(15, 'whiskey', 'Whiskey', 'Consumable', 'Try to drink this, and walk in a strait line to your horse. I dare you!', 35, 1.95, 0.55, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(16, 'blueberry', 'Blueberry', 'Consumable', 'Its a berry that is not red, but blue!', 200, 0.04, 0.03, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(17, 'blackberry', 'Blackberry', 'Consumable', 'Its a berry that is not blue, but black!', 200, 0.04, 0.03, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(18, 'apple', 'Apple', 'Consumable', 'Oh Oh Adam, what did you do!', 75, 0.15, 0.07, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(19, 'orange', 'Orange', 'Consumable', 'In the old days it was a fruit. In the future, they call it Donald Trump', 50, 0.39, 0.15, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(20, 'trumpet', 'Trumpet', 'Instrument', 'Its from brass, its annoying, don\'t buy it, don\'t play it!', 5, 5.98, 3.27, '[{"Sell":0.05,"Store":"Valentine","Buy":0.08},{"Sell":0.05,"Store":"SaintDenis","Buy":0.08},{"Sell":0.05,"Store":"Blackwater","Buy":0.08},{"Sell":0.05,"Store":"Tumbleweed","Buy":0.08},{"Sell":0.05,"Store":"Rhodes","Buy":0.08},{"Sell":0.05,"Store":"Armadillo","Buy":0.08},{"Sell":0.05,"Store":"Strawberry","Buy":0.08}]', '[{"Store":"Valentine","Stock":50},{"Store":"SaintDenis","Stock":50},{"Store":"Blackwater","Stock":50},{"Store":"Tumbleweed","Stock":50},{"Store":"Rhodes","Stock":50},{"Store":"Armadillo","Stock":50},{"Store":"Strawberry","Stock":50}]', '[{"Buy":true,"Store":"Valentine","Sell":true},{"Buy":true,"Store":"SaintDenis","Sell":true},{"Buy":true,"Store":"Blackwater","Sell":true},{"Buy":true,"Store":"Tumbleweed","Sell":true},{"Buy":true,"Store":"Rhodes","Sell":true},{"Buy":true,"Store":"Armadillo","Sell":true},{"Buy":true,"Store":"Strawberry","Sell":true}]', '[{"bTax":0,"Store":"Valentine","sTax":0},{"bTax":0,"Store":"SaintDenis","sTax":0},{"bTax":0,"Store":"Blackwater","sTax":0},{"bTax":0,"Store":"Tumbleweed","sTax":0},{"bTax":0,"Store":"Rhodes","sTax":0},{"bTax":0,"Store":"Armadillo","sTax":0},{"bTax":0,"Store":"Strawberry","sTax":0}]'),
	(56, 'cigar', 'Cigar', 'Consumable', 'Be the boss, and smoke one of these fine brands!', 25, 0.1, 0.05, '[{"Sell":0.05,"Buy":0.1,"Store":"Valentine"},{"Sell":0.05,"Buy":0.1,"Store":"SaintDenis"},{"Sell":0.05,"Buy":0.1,"Store":"Blackwater"},{"Sell":0.05,"Buy":0.1,"Store":"Tumbleweed"},{"Sell":0.05,"Buy":0.1,"Store":"Rhodes"},{"Sell":0.05,"Buy":0.1,"Store":"Armadillo"},{"Sell":0.05,"Buy":0.1,"Store":"Strawberry"}]', '[{"Stock":25,"Store":"Valentine"},{"Stock":25,"Store":"SaintDenis"},{"Stock":25,"Store":"Blackwater"},{"Stock":25,"Store":"Tumbleweed"},{"Stock":25,"Store":"Rhodes"},{"Stock":25,"Store":"Armadillo"},{"Stock":25,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

-- Dumping structure for table dokuscore.system
CREATE TABLE IF NOT EXISTS `system` (
  `steam_id` varchar(50) NOT NULL,
  `discord_id` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`steam_id`,`discord_id`),
  UNIQUE KEY `steam_discord_unique_steam_id` (`steam_id`),
  UNIQUE KEY `steam_discord_unique_discord_id` (`discord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscore.system: ~0 rows (approximately)
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
/*!40000 ALTER TABLE `system` ENABLE KEYS */;

-- Dumping structure for table dokuscore.users
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

-- Dumping data for table dokuscore.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table dokuscore.whitelist
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

-- Dumping data for table dokuscore.whitelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
