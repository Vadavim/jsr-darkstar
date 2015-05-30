-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table dspdb.item_mods_pet
CREATE TABLE IF NOT EXISTS `item_mods_pet` (
  `itemId` smallint(5) unsigned NOT NULL,
  `modId` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`,`modId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Dumping data for table dspdb.item_mods_pet: 14 rows
/*!40000 ALTER TABLE `item_mods_pet` DISABLE KEYS */;
INSERT INTO `item_mods_pet` (`itemId`, `modId`, `value`) VALUES
	(11338, 25, 3),
	(11338, 289, 3),
	(11497, 384, 51),
	(11531, 73, 3),
	(14958, 63, 5),
	(15647, 1, 10),
	(15649, 1, 10),
	(15944, 163, -7),
	(16173, 1, 10),
	(16297, 161, -2),
	(16368, 25, 10),
	(17961, 1, 10),
	(18999, 23, 40),
	(28119, 65, 2);
/*!40000 ALTER TABLE `item_mods_pet` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
