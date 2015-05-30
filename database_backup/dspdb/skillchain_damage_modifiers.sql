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

-- Dumping structure for table dspdb.skillchain_damage_modifiers
CREATE TABLE IF NOT EXISTS `skillchain_damage_modifiers` (
  `chain_level` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `chain_count` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `initial_modifier` int(3) NOT NULL DEFAULT '1',
  `magic_burst_modifier` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`chain_level`,`chain_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.skillchain_damage_modifiers: 20 rows
/*!40000 ALTER TABLE `skillchain_damage_modifiers` DISABLE KEYS */;
INSERT INTO `skillchain_damage_modifiers` (`chain_level`, `chain_count`, `initial_modifier`, `magic_burst_modifier`) VALUES
	('1', '1', 500, 1300),
	('1', '2', 600, 1350),
	('1', '3', 700, 1400),
	('1', '4', 800, 1450),
	('1', '5', 900, 1500),
	('2', '1', 600, 1300),
	('2', '2', 750, 1350),
	('2', '3', 1000, 1400),
	('2', '4', 1250, 1450),
	('2', '5', 1500, 1500),
	('3', '1', 1000, 1300),
	('3', '2', 1500, 1350),
	('3', '3', 1750, 1400),
	('3', '4', 2000, 1450),
	('3', '5', 2250, 1500),
	('4', '1', 1000, 1300),
	('4', '2', 1500, 1350),
	('4', '3', 1750, 1400),
	('4', '4', 2000, 1450),
	('4', '5', 2250, 1500);
/*!40000 ALTER TABLE `skillchain_damage_modifiers` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
