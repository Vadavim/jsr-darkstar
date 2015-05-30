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

-- Dumping structure for table dspdb.elevators
CREATE TABLE IF NOT EXISTS `elevators` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `elevator` int(10) unsigned NOT NULL DEFAULT '0',
  `upperDoor` int(10) unsigned NOT NULL DEFAULT '0',
  `lowerDoor` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `regime` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=38;

-- Dumping data for table dspdb.elevators: 23 rows
/*!40000 ALTER TABLE `elevators` DISABLE KEYS */;
INSERT INTO `elevators` (`id`, `name`, `elevator`, `upperDoor`, `lowerDoor`, `status`, `regime`) VALUES
	(1, 'Pso\'Xja_Elvtr_1', 16814442, 16814443, 16814444, 1, 1),
	(2, 'Pso\'Xja_Elvtr_2', 16814461, 16814462, 16814463, 1, 1),
	(3, 'Pso\'Xja_Elvtr_3', 16814464, 16814465, 16814466, 1, 1),
	(8, 'Pso\'Xja_1', 16814480, 0, 0, 1, 1),
	(9, 'Pso\'Xja_2', 16814481, 0, 0, 1, 1),
	(10, 'Pso\'Xja_3', 16814482, 0, 0, 1, 1),
	(11, 'Pso\'Xja_4', 16814483, 0, 0, 1, 1),
	(12, 'Pso\'Xja_5', 16814484, 0, 0, 1, 1),
	(13, 'Pso\'Xja_6', 16814485, 0, 0, 1, 1),
	(14, 'Pso\'Xja_Elvtr_4', 16814486, 16814487, 16814488, 1, 1),
	(15, 'Pso\'Xja_Elvtr_5', 16814505, 16814506, 16814507, 1, 1),
	(16, 'Pso\'Xja_Elvtr_6', 16814508, 16814509, 16814510, 1, 1),
	(17, 'Pso\'Xja_Elvtr_7', 16814511, 16814512, 16814513, 1, 1),
	(18, 'Pso\'Xja_Dspprng_Tls_4', 16814516, 0, 0, 1, 1),
	(19, 'Pso\'Xja_Dspprng_Tls_1', 16814517, 0, 0, 1, 1),
	(20, 'Pso\'Xja_Dspprng_Tls_2', 16814518, 0, 0, 1, 1),
	(21, 'Fort_Ghelsba_Elvtr', 17354989, 17354991, 17354990, 0, 0),
	(22, 'Palborough_Mines_Elvtr', 17363342, 17363336, 17363335, 0, 0),
	(23, 'Davoi_Elvtr', 17387995, 17387998, 17387996, 0, 0),
	(24, 'Kuftal_Tunnel_Dspprng_Rck', 17490280, 0, 0, 1, 1),
	(25, 'Port_Bastok_Drwbrdg', 17743962, 17743963, 17743964, 1, 1),
	(26, 'Metalworks_Elvtr_1', 17748035, 17748036, 17748037, 1, 1),
	(27, 'Metalworks_Elvtr_2', 17748038, 17748039, 17748040, 1, 1);
/*!40000 ALTER TABLE `elevators` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
