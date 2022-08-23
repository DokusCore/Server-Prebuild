-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table dokuscore.stores: ~16 rows (approximately)
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`ID`, `Item`, `Name`, `Type`, `Description`, `Limit`, `Buy`, `Sell`, `ItemData`, `Stock`, `Stores`, `Taxation`) VALUES
	(1, 'carrot', 'Carrot', 'Consumable', 'Its orange! Its healty!', 100, 0.02, 0.01, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(2, 'cigar', 'Cigar', 'Consumable', 'Be the boss, and smoke one of these fine brands!', 50, 0.08, 0.03, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(3, 'cigarette', 'Cigarette', 'Consumable', 'Back in the day, they thought this was healty! For Sure!', 50, 0.06, 0.02, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(4, 'cigarette_box', 'Cigarette Box', 'Consumable', 'A box containing 25 cigarettes', 50, 1.7, 1, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(5, 'coffee', 'Coffee', 'Consumable', 'That mornig brew you can\'t go without', 75, 0.1, 0.05, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(6, 'egg', 'Eggs', 'Consumable', 'I think it has something to do with a chicken? hmmmm', 100, 0.02, 0.01, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(7, 'egg_box', 'Egg Box', 'Consumable', 'A box containing 10 eggs', 25, 0.22, 0.1, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(8, 'gold_pan', 'Gold Pan', 'Tool', 'A device to filter gold nuggest out of the water and dirt', 10, 5.75, 2.35, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(9, 'meat_cooked', 'Cooked Meat', 'Consumable', 'That food that make men become beasts. Just throw the meat to them and then RUN!', 75, 0.35, 0.15, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(10, 'water_clean', 'Clean Water', 'Consumable', 'Around 80% of your body is made out of water, at least that is what the future people whisper in my ears.', 35, 0.17, 0.09, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(11, 'whiskey', 'Whiskey', 'Consumable', 'Try to drink this, and walk in a strait line to your horse. I dare you!', 50, 1.2, 0.6, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(12, 'blueberry', 'Blueberry', 'Consumable', 'Its a berry that is not red, but blue!', 100, 0.02, 0.01, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(13, 'blackberry', 'Blackberry', 'Consumable', 'Its a berry that is not blue, but black!', 100, 0.02, 0.01, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(14, 'apple', 'Apple', 'Consumable', 'Oh Oh Adam, what did you do!', 80, 0.04, 0.02, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(15, 'orange', 'Orange', 'Consumable', 'In the old days it was a fruit. In the future, they call it Donald Trump', 25, 0.17, 0.08, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]'),
	(16, 'trumpet', 'Trumpet', 'Instrument', 'Its from brass, its annoying, don\'t buy it, don\'t play it!', 10, 12.75, 5.7, '[{"Sell":0.01,"Buy":0.02,"Store":"Valentine"},{"Sell":0.01,"Buy":0.02,"Store":"SaintDenis"},{"Sell":0.01,"Buy":0.02,"Store":"Blackwater"},{"Sell":0.01,"Buy":0.02,"Store":"Tumbleweed"},{"Sell":0.01,"Buy":0.02,"Store":"Rhodes"},{"Sell":0.01,"Buy":0.02,"Store":"Armadillo"},{"Sell":0.01,"Buy":0.02,"Store":"Strawberry"}]', '[{"Stock":100,"Store":"Valentine"},{"Stock":100,"Store":"SaintDenis"},{"Stock":100,"Store":"Blackwater"},{"Stock":100,"Store":"Tumbleweed"},{"Stock":100,"Store":"Rhodes"},{"Stock":100,"Store":"Armadillo"},{"Stock":100,"Store":"Strawberry"}]', '[{"Buy":true,"Sell":true,"Store":"Valentine"},{"Buy":true,"Sell":true,"Store":"SaintDenis"},{"Buy":true,"Sell":true,"Store":"Blackwater"},{"Buy":true,"Sell":true,"Store":"Tumbleweed"},{"Buy":true,"Sell":true,"Store":"Rhodes"},{"Buy":true,"Sell":true,"Store":"Armadillo"},{"Buy":true,"Sell":true,"Store":"Strawberry"}]', '[{"bTax":0,"sTax":0,"Store":"Valentine"},{"bTax":0,"sTax":0,"Store":"SaintDenis"},{"bTax":0,"sTax":0,"Store":"Blackwater"},{"bTax":0,"sTax":0,"Store":"Tumbleweed"},{"bTax":0,"sTax":0,"Store":"Rhodes"},{"bTax":0,"sTax":0,"Store":"Armadillo"},{"bTax":0,"sTax":0,"Store":"Strawberry"}]');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;