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

-- Dumping structure for table dspdb.abilities_charges
CREATE TABLE IF NOT EXISTS `abilities_charges` (
  `recastId` smallint(5) unsigned NOT NULL,
  `job` tinyint(2) unsigned NOT NULL,
  `level` tinyint(2) unsigned NOT NULL,
  `maxCharges` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `chargeTime` smallint(4) unsigned NOT NULL DEFAULT '0',
  `meritModID` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recastId`,`job`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- Dumping data for table dspdb.abilities_charges: 9 rows
DELETE FROM `abilities_charges`;
/*!40000 ALTER TABLE `abilities_charges` DISABLE KEYS */;
INSERT INTO `abilities_charges` (`recastId`, `job`, `level`, `maxCharges`, `chargeTime`, `meritModID`) VALUES
	(231, 20, 10, 1, 240, 0),
	(231, 20, 30, 2, 120, 0),
	(231, 20, 45, 3, 80, 0),
	(231, 20, 60, 4, 60, 0),
	(231, 20, 75, 5, 48, 0),
	(195, 17, 40, 2, 60, 1410),
	(102, 9, 25, 3, 30, 0),
	(195, 17, 55, 3, 50, 1410),
	(195, 17, 70, 4, 40, 1410);
/*!40000 ALTER TABLE `abilities_charges` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
