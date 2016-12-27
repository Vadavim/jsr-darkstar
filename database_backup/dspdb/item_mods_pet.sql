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

-- Dumping structure for table dspdb.item_mods_pet
CREATE TABLE IF NOT EXISTS `item_mods_pet` (
  `itemId` smallint(5) unsigned NOT NULL,
  `modId` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`,`modId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Dumping data for table dspdb.item_mods_pet: 46 rows
/*!40000 ALTER TABLE `item_mods_pet` DISABLE KEYS */;
REPLACE INTO `item_mods_pet` (`itemId`, `modId`, `value`) VALUES
	(11338, 25, 3),
	(11338, 289, 3),
	(11497, 384, 51),
	(11531, 73, 3),
	(14958, 63, 5),
	(15647, 1, 10),
	(15649, 1, 10),
	(15944, 163, -7),
	(16173, 1, 10),
	(16297, 161, -2),
	(16368, 25, 10),
	(17961, 1, 10),
	(18999, 23, 40),
	(28119, 65, 2),
	(15116, 25, 14),
	(14923, 25, 14),
	(14228, 25, 14),
	(15575, 25, 14),
	(15146, 23, 14),
	(15679, 23, 14),
	(14468, 27, 5),
	(15101, 165, 3),
	(14514, 165, 4),
	(10684, 165, 6),
	(19005, 28, 20),
	(19772, 28, 1),
	(21361, 28, 6),
	(11619, 368, 25),
	(11612, 28, 2),
	(28356, 28, 5),
	(11739, 28, 2),
	(11739, 27, 2),
	(10299, 288, 2),
	(10296, 25, 3),
	(10296, 26, 3),
	(10296, 30, 3),
	(10530, 28, 5),
	(10531, 28, 5),
	(10532, 28, 5),
	(10664, 28, 4),
	(10744, 165, 5),
	(14449, 370, 6),
	(13279, 291, 2),
	(17135, 431, 1),
	(17562, 431, 1),
	(17576, 431, 1);
/*!40000 ALTER TABLE `item_mods_pet` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
