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

-- Dumping structure for table dspdb.guilds
CREATE TABLE IF NOT EXISTS `guilds` (
  `id` tinyint(1) unsigned NOT NULL,
  `points_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Dumping data for table dspdb.guilds: 9 rows
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
INSERT INTO `guilds` (`id`, `points_name`) VALUES
	(0, 'guild_fishing'),
	(1, 'guild_woodworking'),
	(2, 'guild_smithing'),
	(3, 'guild_goldsmithing'),
	(4, 'guild_weaving'),
	(5, 'guild_leathercraft'),
	(6, 'guild_bonecraft'),
	(7, 'guild_alchemy'),
	(8, 'guild_cooking');
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
