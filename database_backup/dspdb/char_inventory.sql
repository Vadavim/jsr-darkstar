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

-- Dumping structure for table dspdb.char_inventory
CREATE TABLE IF NOT EXISTS `char_inventory` (
  `charid` int(10) unsigned NOT NULL,
  `location` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `itemId` smallint(5) unsigned NOT NULL DEFAULT '65535',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `bazaar` int(8) unsigned NOT NULL DEFAULT '0',
  `signature` varchar(20) NOT NULL DEFAULT '',
  `extra` tinyblob,
  PRIMARY KEY (`charid`,`location`,`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=28;

-- Dumping data for table dspdb.char_inventory: 70 rows
/*!40000 ALTER TABLE `char_inventory` DISABLE KEYS */;
REPLACE INTO `char_inventory` (`charid`, `location`, `slot`, `itemId`, `quantity`, `bazaar`, `signature`, `extra`) VALUES
	(21828, 0, 0, 65535, 11862, 0, '', NULL),
	(21828, 8, 25, 16597, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 8, 14853, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 4, 14390, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21830, 0, 0, 65535, 1000, 0, '', NULL),
	(21829, 0, 6, 536, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21829, 0, 5, 16534, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21829, 0, 4, 13005, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21829, 0, 3, 12883, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21829, 0, 2, 12754, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21829, 0, 1, 12631, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 1, 14190, 1, 0, '', _binary 0x020326F10000000000000000000000000000000000000000),
	(21828, 8, 10, 14322, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 11, 15310, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 23, 15294, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 13, 13276, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 9, 14824, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 7, 15160, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 3, 13132, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 6, 14421, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 12, 14306, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21829, 0, 0, 65535, 1000, 0, '', NULL),
	(21830, 0, 1, 12631, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21830, 0, 2, 12754, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21830, 0, 3, 12883, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21830, 0, 4, 13005, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21830, 0, 5, 16534, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21830, 0, 6, 13497, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21830, 0, 7, 536, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 22, 14630, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 16, 17621, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 17, 17621, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 18, 13858, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 24, 17213, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 14, 14187, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 15, 13603, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 19, 13408, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 20, 13408, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 21, 14630, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 23, 17579, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 8, 5, 13126, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 29, 18151, 90, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 1, 1127, 10, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 2, 846, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 3, 4400, 2, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 4, 4358, 12, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 16, 926, 3, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 9, 4358, 12, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 5, 17303, 93, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 6, 16903, 1, 0, '', _binary 0x020301080108010803000000000000000000000000000000),
	(21828, 0, 7, 16903, 1, 0, '', _binary 0x020301080108020805000000000000000000000000000000),
	(21828, 0, 8, 16903, 1, 0, '', _binary 0x020303180000000000000000000000000000000000000000),
	(21828, 0, 10, 856, 10, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 12, 5152, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 13, 5703, 4, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 15, 1126, 23, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 17, 4151, 12, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 21, 924, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 11, 768, 2, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 14, 16606, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 18, 510, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 19, 12729, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 20, 4098, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 22, 4096, 8, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 24, 882, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 25, 4362, 5, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 26, 4099, 6, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 27, 4358, 6, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 28, 852, 3, 0, '', _binary 0x000000000000000000000000000000000000000000000000),
	(21828, 0, 30, 1051, 1, 0, '', _binary 0x000000000000000000000000000000000000000000000000);
/*!40000 ALTER TABLE `char_inventory` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;