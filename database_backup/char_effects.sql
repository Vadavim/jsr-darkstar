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

-- Dumping structure for table dspdb.char_effects
CREATE TABLE IF NOT EXISTS `char_effects` (
  `charid` int(10) unsigned NOT NULL,
  `effectid` smallint(5) unsigned NOT NULL,
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `power` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tick` int(10) unsigned NOT NULL DEFAULT '0',
  `duration` int(10) unsigned NOT NULL DEFAULT '0',
  `subid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subpower` smallint(5) NOT NULL DEFAULT '0',
  `tier` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `charid` (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.char_effects: 8 rows
/*!40000 ALTER TABLE `char_effects` DISABLE KEYS */;
REPLACE INTO `char_effects` (`charid`, `effectid`, `icon`, `power`, `tick`, `duration`, `subid`, `subpower`, `tier`) VALUES
	(21829, 794, 0, 0, 1000, 0, 0, 0, 0),
	(21829, 795, 0, 7, 500, 0, 0, 0, 0),
	(21830, 794, 0, 0, 100, 0, 0, 0, 0),
	(21830, 795, 0, 7, 50, 0, 0, 0, 0);
/*!40000 ALTER TABLE `char_effects` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
