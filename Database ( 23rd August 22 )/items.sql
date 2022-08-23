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
  `UseEvent` varchar(50) DEFAULT 'false',
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
  `Event` varchar(100) DEFAULT NULL,
  `Meta` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dokuscore.items: ~30 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`ID`, `Item`, `Name`, `Type`, `Description`, `CTI`, `CA`, `InvLimit`, `Metabolism`, `CanPlace`, `UseEvent`, `Hunger`, `Thirst`, `Health`, `Stamina`, `GHI`, `GHO`, `GSI`, `GSO`, `Prop`, `PropPos`, `Animation`, `AniTime`, `Event`, `Meta`) VALUES
	(1, 'carrot', 'Carrot', 'Consumable', 'Its orange! Its healty!', NULL, 0, 10, 'true', 'false', 'false', 5, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(2, 'cigar', 'Cigar', 'Consumable', 'Be the boss, and smoke one of these fine brands!', NULL, 0, 50, 'true', 'false', 'false', -5, -15, -8, -15, 30, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'cigarette', 'Cigarette', 'Consumable', 'Back in the day, they thought this was healty! For Sure!', NULL, 0, 100, 'true', 'false', 'false', -5, -15, -5, -13, 25, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'cigarette_box', 'Cigarette Box', 'Consumable', 'A box containing 25 cigarettes', 'cigarette', 25, 5, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'coffee', 'Coffee', 'Consumable', 'That mornig brew you can\'t go without', NULL, 0, 5, 'true', 'false', 'false', -10, 20, 3, 20, 20, 10, 30, 60, 'P_MUGCOFFEE01X', 'P_MUGCOFFEE01X_PH_R_HAND', 'DRINK_COFFEE_HOLD', NULL, NULL, NULL),
	(6, 'egg', 'Eggs', 'Consumable', 'I think it has something to do with a chicken? hmmmm', NULL, 0, 50, 'true', 'false', 'false', 5, -5, 3, 4, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(7, 'egg_box', 'Egg Box', 'Consumable', 'A box containing 10 eggs', 'eggs', 10, 3, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(8, 'gold_bar', 'Goldbar', 'Valuta', 'That mineral that everyone is killing each other for, but then refined into a golden bar', 'gold_coin', 35, 3, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'gold_nugget', 'Gold Nugget', 'Mineral', 'Unrefined golden nuggest. Don\'t you wish yours where of gold?', NULL, 0, 120, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'gold_coin', 'Gold Coin', 'Valuta', 'A thing you pay with, but you don\'t want to pay with. Its way to shiny to give away', NULL, 0, 200, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'silver_nugget', 'Silver Nugget', 'Mineral', 'Unrefined silver nuggest. Seriously, don\'t even bother, gold is much better', 'silver_coin', 50, 200, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'silver_coin', 'Silver Coin', 'Valuta', 'A thing you pay with, but most also eat with. weird world we live in don\'t you think?', NULL, 0, 200, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'gold_pan', 'Gold Pan', 'Tool', 'A device to filter gold nuggest out of the water and dirt', NULL, 0, 2, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'horsebrush', 'Horse Brush', 'Tool', 'A simple tool to keep your horse from getting dirty. Soooo Dirty!!!', NULL, 0, 1, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'lockpick', 'Lock Pick', 'Tool', 'For those that do not value other people belongings, then this is your tool!', NULL, 0, 5, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'meat_cooked', 'Cooked Meat', 'Consumable', 'That food that make men become beasts. Just throw the meat to them and then RUN!', NULL, 0, 10, 'true', 'false', 'false', 30, -10, 10, 25, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(17, 'meat_uncooked', 'Uncooked Meat', 'Consumable', 'It\'s meat, it\'s uncooked! You should try to eat it, maybe you wound die from it!', 'meat_cooked', 1, 10, 'true', 'false', 'false', 15, -20, -25, 12, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(18, 'water_clean', 'Clean Water', 'Consumable', 'Around 80% of your body is made out of water, at least that is what the future people whisper in my ears.', NULL, 0, 10, 'true', 'false', 'false', 0, 20, 0, 0, 0, 0, 0, 0, 'p_bottleJD01x', 'p_bottleJD01x_ph_r_hand', 'DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_CHUG_A', NULL, NULL, NULL),
	(19, 'water_dirty', 'Dirty Water', 'Consumable', 'Cook it before your drink it!', 'water_clean', 1, 10, 'true', 'false', 'false', 0, 20, -10, 0, 0, 0, 0, 0, 'p_bottleJD01x', 'p_bottleJD01x_ph_r_hand', 'DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_CHUG_A', NULL, NULL, NULL),
	(20, 'campfire', 'Campfire', 'Deployable', 'Something to keep you warm at night. If you had a girlfriend, you\'ve would not need one!', NULL, 0, 2, 'true', 'true', 'false', -5, -10, 0, -20, 0, 0, 0, 0, 'p_campfire02x', NULL, 'WORLD_HUMAN_CROUCH_INSPECT', '13000', NULL, NULL),
	(21, 'whiskey', 'Whiskey', 'Consumable', 'Try to drink this, and walk in a strait line to your horse. I dare you!', NULL, 0, 10, 'true', 'false', 'false', -10, -15, 10, -15, 60, 60, 0, 0, 'p_bottleJD01x', 'p_bottleJD01x_ph_r_hand', 'DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_CHUG_TRANS', NULL, NULL, NULL),
	(22, 'blueberry', 'Blueberry', 'Consumable', 'Its a berry that is not red, but blue!', NULL, 0, 500, 'true', 'false', 'false', 2, 2, 2, 2, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(23, 'blackberry', 'Blackberry', 'Consumable', 'Its a berry that is not blue, but black!', NULL, 0, 500, 'true', 'false', 'false', 2, 2, 2, 2, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(24, 'apple', 'Apple', 'Consumable', 'Oh Oh Adam, what did you do!', NULL, 0, 150, 'true', 'false', 'false', 5, 5, 5, 5, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(25, 'orange', 'Orange', 'Consumable', 'In the old days it was a fruit. In the future, they call it Donald Trump', NULL, 0, 150, 'true', 'false', 'false', 5, 10, 5, 5, 0, 0, 0, 0, NULL, NULL, 'EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND', NULL, NULL, NULL),
	(26, 'trumpet', 'Trumpet', 'Instrument', 'Its from brass, its annoying, don\'t buy it, don\'t play it!', NULL, 0, 1, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WORLD_HUMAN_TRUMPET', NULL, NULL, NULL),
	(27, 'scratchcard', 'Scratch Card', 'Consumable', 'Everyone could be a winner!', NULL, 0, 10, 'false', 'false', 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"Type":"Client", "Event":"DokusCore:ScratchCards:Show:Random", "Delete":"true"}', NULL),
	(30, 'scratchprize', 'Scratch Winning Card', 'Consumable', 'A winning scratch card', NULL, 0, 10, 'false', 'false', 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"Type":"Client", "Event":"DokusCore:ScratchCards:Get:Rewards"}', NULL),
	(31, 'rowboat', 'Row Boat', 'Boat', 'At least it stays afloat', NULL, 0, 0, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{ "CanSell":"true", "CanBuy":"true", "SellPrice":10.0, "BuyPrice":15.0 }'),
	(32, 'rowboatSwamp', 'Swamp Row Boat', 'Boat', 'You\'re at least safe from Aligators haha', NULL, 0, 0, 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{ "CanSell":"true", "CanBuy":"true", "SellPrice":15.0, "BuyPrice":30.0 }');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
