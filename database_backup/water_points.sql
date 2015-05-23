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

-- Dumping structure for table dspdb.water_points
CREATE TABLE IF NOT EXISTS `water_points` (
  `waterid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zoneid` smallint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pointid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,2) NOT NULL DEFAULT '0.00',
  `pos_y` float(7,2) NOT NULL DEFAULT '0.00',
  `pos_z` float(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`waterid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.water_points: 1 rows
/*!40000 ALTER TABLE `water_points` DISABLE KEYS */;
REPLACE INTO `water_points` (`waterid`, `zoneid`, `type`, `pointid`, `pos_x`, `pos_y`, `pos_z`) VALUES
	(1, 100, 0, 0, 0.00, 0.00, 0.00);
/*!40000 ALTER TABLE `water_points` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
