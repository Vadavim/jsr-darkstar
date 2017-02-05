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

-- Dumping structure for table dspdb.spots_for_treasure
CREATE TABLE IF NOT EXISTS `spots_for_treasure` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  `rot` int(7) NOT NULL DEFAULT '0',
  `zone` smallint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Dumping data for table dspdb.spots_for_treasure: 4 rows
DELETE FROM `spots_for_treasure`;
/*!40000 ALTER TABLE `spots_for_treasure` DISABLE KEYS */;
INSERT INTO `spots_for_treasure` (`id`, `pos_x`, `pos_y`, `pos_z`, `rot`, `zone`) VALUES
	(1, -424.362, -16.703, -180.199, 247, 100),
	(2, -424.362, -16.703, -180.199, 247, 100),
	(3, -424.362, -16.703, -180.199, 247, 100),
	(4, -398.898, -20.000, -199.372, 12, 100);
/*!40000 ALTER TABLE `spots_for_treasure` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
