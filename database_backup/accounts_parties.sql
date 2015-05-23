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

-- Dumping structure for table dspdb.accounts_parties
CREATE TABLE IF NOT EXISTS `accounts_parties` (
  `charid` int(10) unsigned NOT NULL DEFAULT '0',
  `partyid` int(10) unsigned NOT NULL DEFAULT '0',
  `partyflag` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allianceid` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`charid`),
  CONSTRAINT `accounts_parties_ibfk_1` FOREIGN KEY (`charid`) REFERENCES `accounts_sessions` (`charid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Dumping data for table dspdb.accounts_parties: ~0 rows (approximately)
/*!40000 ALTER TABLE `accounts_parties` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_parties` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
