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

-- Dumping structure for table dspdb.char_stats
CREATE TABLE IF NOT EXISTS `char_stats` (
  `charid` int(10) unsigned NOT NULL,
  `hp` smallint(4) unsigned NOT NULL DEFAULT '50',
  `mp` smallint(4) unsigned NOT NULL DEFAULT '50',
  `nameflags` int(10) unsigned NOT NULL DEFAULT '0',
  `mhflag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mjob` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sjob` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `death` int(10) unsigned NOT NULL DEFAULT '0',
  `2h` int(10) unsigned NOT NULL DEFAULT '0',
  `title` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bazaar_message` blob,
  `zoning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mlvl` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `slvl` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `pet_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pet_type` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pet_hp` smallint(4) unsigned NOT NULL DEFAULT '0',
  `pet_mp` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.char_stats: 3 rows
/*!40000 ALTER TABLE `char_stats` DISABLE KEYS */;
REPLACE INTO `char_stats` (`charid`, `hp`, `mp`, `nameflags`, `mhflag`, `mjob`, `sjob`, `death`, `2h`, `title`, `bazaar_message`, `zoning`, `mlvl`, `slvl`, `pet_id`, `pet_type`, `pet_hp`, `pet_mp`) VALUES
	(21828, 1541, 546, 262144, 0, 8, 3, 1908, 0, 206, NULL, 0, 75, 37, 0, 0, 0, 0),
	(21829, 40, 0, 262144, 0, 1, 0, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0),
	(21830, 40, 0, 0, 0, 1, 0, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `char_stats` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
