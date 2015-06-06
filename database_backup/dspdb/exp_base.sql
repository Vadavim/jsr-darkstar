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

-- Dumping structure for table dspdb.exp_base
CREATE TABLE IF NOT EXISTS `exp_base` (
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=9;

-- Dumping data for table dspdb.exp_base: 100 rows
/*!40000 ALTER TABLE `exp_base` DISABLE KEYS */;
REPLACE INTO `exp_base` (`level`, `exp`) VALUES
	(1, 0),
	(2, 500),
	(3, 750),
	(4, 1000),
	(5, 1250),
	(6, 1500),
	(7, 1750),
	(8, 2000),
	(9, 2200),
	(10, 2400),
	(11, 2600),
	(12, 2800),
	(13, 3000),
	(14, 3200),
	(15, 3400),
	(16, 3600),
	(17, 3800),
	(18, 4000),
	(19, 4200),
	(20, 4400),
	(21, 4600),
	(22, 4800),
	(23, 5000),
	(24, 5100),
	(25, 5200),
	(26, 5300),
	(27, 5400),
	(28, 5500),
	(29, 5600),
	(30, 5700),
	(31, 5800),
	(32, 5900),
	(33, 6000),
	(34, 6100),
	(35, 6200),
	(36, 6300),
	(37, 6400),
	(38, 6500),
	(39, 6600),
	(40, 6700),
	(41, 6800),
	(42, 6900),
	(43, 7000),
	(44, 7100),
	(45, 7200),
	(46, 7300),
	(47, 7400),
	(48, 7500),
	(49, 7600),
	(50, 7700),
	(51, 7800),
	(52, 8000),
	(53, 9200),
	(54, 10400),
	(55, 11600),
	(56, 12800),
	(57, 14000),
	(58, 15200),
	(59, 16400),
	(60, 17600),
	(61, 18800),
	(62, 20000),
	(63, 21500),
	(64, 23000),
	(65, 24500),
	(66, 26000),
	(67, 27500),
	(68, 29000),
	(69, 30500),
	(70, 32000),
	(71, 34000),
	(72, 36000),
	(73, 38000),
	(74, 40000),
	(75, 42000),
	(76, 44000),
	(77, 44500),
	(78, 45000),
	(79, 45500),
	(80, 46000),
	(81, 46500),
	(82, 47000),
	(83, 47500),
	(84, 48000),
	(85, 48500),
	(86, 49000),
	(87, 49500),
	(88, 50000),
	(89, 50500),
	(90, 51000),
	(91, 51500),
	(92, 52000),
	(93, 52500),
	(94, 53000),
	(95, 53500),
	(96, 54000),
	(97, 54500),
	(98, 55000),
	(99, 55500),
	(100, 56000);
/*!40000 ALTER TABLE `exp_base` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
