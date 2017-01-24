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

-- Dumping structure for table dspdb.char_vars
CREATE TABLE IF NOT EXISTS `char_vars` (
  `charid` int(10) unsigned NOT NULL,
  `varname` varchar(30) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`charid`,`varname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.char_vars: 51 rows
/*!40000 ALTER TABLE `char_vars` DISABLE KEYS */;
REPLACE INTO `char_vars` (`charid`, `varname`, `value`) VALUES
	(21828, 'HpTeleportMask1b', 32),
	(21828, 'characterLimbusKey', 22746),
	(21828, 'LimbusID', 1292),
	(21828, 'Scorpio_ConquestWeek', 1467554400),
	(21828, 'dynaWaitxDay', 1469714400),
	(21828, 'elite_115', 1470405600),
	(21828, 'trade_itemid', 1551),
	(21828, 'elite_101', 1470405600),
	(21828, 'trade_bcnmid', 34),
	(21828, 'bcnm_instanceid', 1),
	(21828, 'elite_100', 1470751200),
	(21828, 'elite_107', 1470751200),
	(21828, 'elite_106', 1470751200),
	(21828, 'elite_117', 1470751200),
	(21828, 'elite_108', 1470751200),
	(21828, 'avatar_8', 100),
	(21828, 'elite_103', 1470751200),
	(21828, 'killedFoVNM', 127),
	(21828, 'elite_109', 1470751200),
	(21828, 'elite_126', 1470751200),
	(21828, 'elite_105', 1470751200),
	(21828, 'elite_111', 1470837600),
	(21828, 'elite_110', 1470837600),
	(21828, 'elite_120', 1470837600),
	(21828, 'elite_112', 1470837600),
	(21828, 'elite_127', 1470837600),
	(21828, 'fov_regimeid', 66),
	(21828, 'fov_repeat', 1),
	(21828, 'fov_numneeded1', 7),
	(21828, 'fov_LastReward', 452362),
	(21828, 'z100_kill', 1),
	(21828, 'f226_kill', 1),
	(21828, 's6_kill', 1),
	(21828, 'avatar_9', 100),
	(21828, 'avatar_10', 100),
	(21828, 'avatar_11', 100),
	(21828, 'avatar_12', 100),
	(21828, 'avatar_13', 100),
	(21828, 'avatar_14', 100),
	(21828, 'avatar_15', 100),
	(21828, 'avatar_16', 100),
	(21828, 'totalLevelReward', 1495),
	(21828, 'achv_z100_kill', 1),
	(21828, 'achv_f189_kill', 1),
	(21828, 'achv_s7_kill', 1),
	(21828, 'achv_z103_kill', 4),
	(21828, 'achv_f113_kill', 3),
	(21828, 'achv_s20_kill', 3),
	(21828, 'achv_f206_kill', 1),
	(21828, 'achv_s6_kill', 1),
	(21828, 'achv_z118_kill', 11),
	(21828, 'achv_f197_kill', 6),
	(21828, 'achv_s2_kill', 9),
	(21828, 'achv_f172_kill', 2),
	(21828, 'achv_s1_kill', 2),
	(21828, 'achv_f77_kill', 3);
/*!40000 ALTER TABLE `char_vars` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
