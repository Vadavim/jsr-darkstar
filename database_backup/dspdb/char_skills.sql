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

-- Dumping structure for table dspdb.char_skills
CREATE TABLE IF NOT EXISTS `char_skills` (
  `charid` int(10) unsigned NOT NULL,
  `skillid` tinyint(2) unsigned NOT NULL,
  `value` smallint(4) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`skillid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=10;

-- Dumping data for table dspdb.char_skills: 44 rows
DELETE FROM `char_skills`;
/*!40000 ALTER TABLE `char_skills` DISABLE KEYS */;
INSERT INTO `char_skills` (`charid`, `skillid`, `value`, `rank`) VALUES
	(21828, 29, 5000, 0),
	(21828, 38, 5000, 0),
	(21828, 1, 5000, 0),
	(21828, 2, 5000, 0),
	(21828, 3, 5000, 0),
	(21828, 4, 5000, 0),
	(21828, 5, 5000, 0),
	(21828, 6, 5000, 0),
	(21828, 7, 5000, 0),
	(21828, 8, 5000, 0),
	(21828, 9, 5000, 0),
	(21828, 10, 5000, 0),
	(21828, 11, 5000, 0),
	(21828, 12, 5000, 0),
	(21828, 13, 5000, 0),
	(21828, 14, 5000, 0),
	(21828, 15, 5000, 0),
	(21828, 16, 5000, 0),
	(21828, 17, 5000, 0),
	(21828, 18, 5000, 0),
	(21828, 19, 5000, 0),
	(21828, 20, 5000, 0),
	(21828, 21, 5000, 0),
	(21828, 22, 5000, 0),
	(21828, 23, 5000, 0),
	(21828, 24, 5000, 0),
	(21828, 25, 5000, 0),
	(21828, 26, 5000, 0),
	(21828, 27, 5000, 0),
	(21828, 28, 5000, 0),
	(21828, 30, 5000, 0),
	(21828, 31, 5000, 0),
	(21828, 32, 5000, 0),
	(21828, 33, 5000, 0),
	(21828, 34, 5000, 0),
	(21828, 35, 5000, 0),
	(21828, 36, 5000, 0),
	(21828, 37, 5000, 0),
	(21828, 39, 5000, 0),
	(21828, 40, 5000, 0),
	(21828, 41, 5000, 0),
	(21828, 42, 5000, 0),
	(21828, 43, 5000, 0),
	(21828, 44, 5000, 0);
/*!40000 ALTER TABLE `char_skills` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
