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

-- Dumping structure for table dspdb.char_recast
CREATE TABLE IF NOT EXISTS `char_recast` (
  `charid` int(10) NOT NULL,
  `id` smallint(5) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  `recast` smallint(5) NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table dspdb.char_recast: 13 rows
/*!40000 ALTER TABLE `char_recast` DISABLE KEYS */;
INSERT INTO `char_recast` (`charid`, `id`, `time`, `recast`, `type`) VALUES
	(21828, 48, 1467075667, 0, 1),
	(21828, 112, 1467075667, 0, 1),
	(21828, 79, 1467075667, 0, 1),
	(21828, 78, 1467075667, 0, 1),
	(21828, 42, 1467075667, 0, 1),
	(21828, 77, 1467075667, 0, 1),
	(21828, 254, 1467075667, 0, 1),
	(21828, 76, 1467075667, 0, 1),
	(21828, 75, 1467075667, 0, 1),
	(21828, 80, 1467075667, 0, 1),
	(21828, 73, 1467075667, 0, 1),
	(21828, 0, 1467075667, 0, 1),
	(21828, 74, 1467075667, 0, 1);
/*!40000 ALTER TABLE `char_recast` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
