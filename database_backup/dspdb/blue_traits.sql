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

-- Dumping structure for table dspdb.blue_traits
CREATE TABLE IF NOT EXISTS `blue_traits` (
  `trait_category` smallint(2) unsigned NOT NULL,
  `trait_points_needed` smallint(2) unsigned NOT NULL,
  `traitid` tinyint(3) unsigned NOT NULL,
  `modifier` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`trait_category`,`trait_points_needed`,`modifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.blue_traits: 41 rows
/*!40000 ALTER TABLE `blue_traits` DISABLE KEYS */;
INSERT INTO `blue_traits` (`trait_category`, `trait_points_needed`, `traitid`, `modifier`, `value`) VALUES
	(1, 2, 32, 230, 8),
	(2, 2, 9, 370, 1),
	(3, 2, 35, 227, 8),
	(4, 2, 24, 295, 1),
	(4, 4, 24, 295, 2),
	(4, 6, 24, 295, 3),
	(4, 8, 24, 295, 4),
	(5, 2, 48, 240, 2),
	(6, 2, 5, 28, 20),
	(7, 2, 39, 231, 8),
	(8, 2, 3, 23, 10),
	(8, 2, 3, 24, 10),
	(9, 2, 11, 357, 10),
	(10, 2, 8, 5, 10),
	(10, 4, 8, 5, 30),
	(11, 2, 4, 1, 10),
	(12, 2, 33, 229, 8),
	(13, 2, 6, 29, 10),
	(14, 8, 10, 369, 1),
	(15, 2, 7, 2, 30),
	(15, 4, 7, 2, 90),
	(16, 2, 1, 25, 10),
	(16, 2, 1, 26, 10),
	(17, 2, 13, 296, 25),
	(18, 2, 2, 69, 10),
	(19, 2, 58, 249, 2),
	(20, 2, 14, 73, 10),
	(20, 4, 14, 73, 25),
	(21, 2, 17, 291, 10),
	(22, 2, 12, 170, 5),
	(22, 4, 12, 170, 15),
	(23, 2, 106, 174, 8),
	(24, 2, 15, 288, 7),
	(24, 4, 16, 302, 5),
	(25, 2, 18, 259, 10),
	(25, 4, 18, 259, 15),
	(25, 6, 18, 259, 25),
	(26, 2, 70, 306, 15),
	(27, 2, 110, 407, 5),
	(28, 2, 20, 0, 0),
	(28, 3, 19, 303, 1);
/*!40000 ALTER TABLE `blue_traits` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
