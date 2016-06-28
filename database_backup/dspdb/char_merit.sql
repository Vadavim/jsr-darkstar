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

-- Dumping structure for table dspdb.char_merit
CREATE TABLE IF NOT EXISTS `char_merit` (
  `charid` int(10) unsigned NOT NULL,
  `meritid` smallint(5) unsigned NOT NULL,
  `upgrades` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `idx_char_merit_meritid_charid` (`meritid`,`charid`),
  KEY `char_merits_charid_index` (`charid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dspdb.char_merit: ~0 rows (approximately)
/*!40000 ALTER TABLE `char_merit` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_merit` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
