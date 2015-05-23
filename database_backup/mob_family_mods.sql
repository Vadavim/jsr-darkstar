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

-- Dumping structure for table dspdb.mob_family_mods
CREATE TABLE IF NOT EXISTS `mob_family_mods` (
  `familyid` smallint(5) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`familyid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Dumping data for table dspdb.mob_family_mods: 71 rows
/*!40000 ALTER TABLE `mob_family_mods` DISABLE KEYS */;
REPLACE INTO `mob_family_mods` (`familyid`, `modid`, `value`, `type`) VALUES
	(175, 29, 50, 0),
	(4, 29, 25, 0),
	(4, 7, 60, 1),
	(74, 29, 25, 0),
	(61, 29, 25, 0),
	(169, 29, 25, 0),
	(110, 29, 13, 0),
	(111, 29, 13, 0),
	(171, 29, 13, 0),
	(47, 240, 2, 0),
	(46, 240, 2, 0),
	(4, 244, 2, 0),
	(193, 3, 40, 1),
	(34, 3, 100, 1),
	(267, 4, 20, 1),
	(87, 4, 18, 1),
	(87, 5, 10, 1),
	(240, 10, 1, 1),
	(169, 10, 1, 1),
	(190, 10, 2, 1),
	(189, 10, 2, 1),
	(46, 10, 3, 1),
	(252, 10, 3, 1),
	(47, 10, 3, 1),
	(245, 10, 4, 1),
	(216, 10, 4, 1),
	(133, 10, 5, 1),
	(184, 10, 5, 1),
	(59, 10, 5, 1),
	(253, 10, 6, 1),
	(254, 10, 6, 1),
	(212, 10, 7, 1),
	(362, 10, 7, 1),
	(169, 11, 15, 1),
	(358, 11, 15, 1),
	(110, 3, 50, 1),
	(111, 3, 50, 1),
	(121, 242, 20, 0),
	(52, 242, 20, 0),
	(358, 16, 1, 1),
	(327, 16, 1, 1),
	(334, 16, 1, 1),
	(337, 16, 1, 1),
	(360, 16, 1, 1),
	(359, 16, 1, 1),
	(258, 36, 60, 1),
	(258, 34, 25, 1),
	(217, 23, 256, 1),
	(274, 23, 256, 1),
	(273, 23, 256, 1),
	(234, 37, 1, 1),
	(72, 29, 10, 0),
	(72, 69, 20, 0),
	(57, 3, 50, 1),
	(72, 3, 50, 1),
	(140, 3, 50, 1),
	(141, 3, 50, 1),
	(207, 3, 50, 1),
	(255, 3, 50, 1),
	(253, 3, 50, 1),
	(194, 3, 50, 1),
	(271, 3, 50, 1),
	(135, 4, 4, 1),
	(193, 14, 704, 1),
	(373, 16, 1, 1),
	(394, 41, 732, 1),
	(394, 42, 733, 1),
	(394, 43, 2, 1),
	(150, 4, 30, 1),
	(394, 4, 30, 1),
	(236, 4, 30, 1),
	(80, 28, 400, 1);
/*!40000 ALTER TABLE `mob_family_mods` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
