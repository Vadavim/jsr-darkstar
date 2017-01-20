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

-- Dumping structure for table dspdb.char_storage
CREATE TABLE IF NOT EXISTS `char_storage` (
  `charid` int(10) unsigned NOT NULL,
  `inventory` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `safe` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `locker` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `satchel` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `sack` tinyint(2) unsigned zerofill NOT NULL DEFAULT '05',
  `case` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `wardrobe` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `wardrobe2` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `wardrobe3` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `wardrobe4` tinyint(2) unsigned NOT NULL DEFAULT '5',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.char_storage: 1 rows
/*!40000 ALTER TABLE `char_storage` DISABLE KEYS */;
REPLACE INTO `char_storage` (`charid`, `inventory`, `safe`, `locker`, `satchel`, `sack`, `case`, `wardrobe`, `wardrobe2`, `wardrobe3`, `wardrobe4`) VALUES
	(21828, 80, 80, 80, 5, 80, 80, 80, 80, 80, 80);
/*!40000 ALTER TABLE `char_storage` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
