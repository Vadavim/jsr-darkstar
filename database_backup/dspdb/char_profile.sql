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

-- Dumping structure for table dspdb.char_profile
CREATE TABLE IF NOT EXISTS `char_profile` (
  `charid` int(10) unsigned NOT NULL,
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_sandoria` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rank_bastok` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rank_windurst` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `fame_sandoria` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_bastok` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_windurst` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_norg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_jeuno` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_konschtat` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_tahrongi` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_latheine` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_misareaux` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_vunkerl` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_attohwa` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_altepa` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_grauberg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_uleguerand` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_adoulin` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.char_profile: 1 rows
/*!40000 ALTER TABLE `char_profile` DISABLE KEYS */;
REPLACE INTO `char_profile` (`charid`, `rank_points`, `rank_sandoria`, `rank_bastok`, `rank_windurst`, `fame_sandoria`, `fame_bastok`, `fame_windurst`, `fame_norg`, `fame_jeuno`, `fame_aby_konschtat`, `fame_aby_tahrongi`, `fame_aby_latheine`, `fame_aby_misareaux`, `fame_aby_vunkerl`, `fame_aby_attohwa`, `fame_aby_altepa`, `fame_aby_grauberg`, `fame_aby_uleguerand`, `fame_adoulin`) VALUES
	(21828, 0, 1, 1, 1, 65, 0, 960, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `char_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
