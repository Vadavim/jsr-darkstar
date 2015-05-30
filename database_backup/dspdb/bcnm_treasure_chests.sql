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

-- Dumping structure for table dspdb.bcnm_treasure_chests
CREATE TABLE IF NOT EXISTS `bcnm_treasure_chests` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `battlefieldNumber` tinyint(3) DEFAULT NULL,
  `npcId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- Dumping data for table dspdb.bcnm_treasure_chests: 49 rows
/*!40000 ALTER TABLE `bcnm_treasure_chests` DISABLE KEYS */;
INSERT INTO `bcnm_treasure_chests` (`bcnmId`, `battlefieldNumber`, `npcId`) VALUES
	(4, 1, 17346675),
	(4, 2, 17346679),
	(4, 3, 17346683),
	(10, 1, 17346687),
	(10, 2, 17346691),
	(10, 3, 17346695),
	(11, 1, 17346597),
	(11, 2, 17346601),
	(11, 3, 17346605),
	(12, 1, 17346653),
	(12, 2, 17346662),
	(12, 3, 17346671),
	(15, 1, 17346608),
	(15, 2, 17346611),
	(15, 3, 17346614),
	(17, 1, 17346624),
	(17, 2, 17346634),
	(17, 3, 17346644),
	(34, 1, 17350932),
	(35, 1, 17350935),
	(36, 1, 17350938),
	(81, 1, 17367089),
	(81, 2, 17367093),
	(81, 3, 17367097),
	(76, 1, 17367101),
	(76, 2, 17367105),
	(76, 3, 17367109),
	(79, 1, 17367138),
	(79, 2, 17367155),
	(79, 3, 17367172),
	(82, 1, 17367113),
	(82, 2, 17367117),
	(82, 3, 17367121),
	(73, 1, 17367182),
	(73, 2, 17367192),
	(73, 3, 17367202),
	(100, 1, 17375293),
	(100, 2, 17375300),
	(100, 3, 17375307),
	(105, 1, 17375272),
	(105, 2, 17375276),
	(105, 3, 17375280),
	(107, 1, 17375282),
	(107, 2, 17375284),
	(107, 3, 17375286),
	(129, 1, 17444884),
	(129, 2, 17444891),
	(129, 3, 17444898),
	(673, 1, 16810019);
/*!40000 ALTER TABLE `bcnm_treasure_chests` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
