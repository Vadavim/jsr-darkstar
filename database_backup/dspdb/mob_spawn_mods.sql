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

-- Dumping structure for table dspdb.mob_spawn_mods
CREATE TABLE IF NOT EXISTS `mob_spawn_mods` (
  `mobid` int(10) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `is_mob_mod` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mobid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Dumping data for table dspdb.mob_spawn_mods: 229 rows
/*!40000 ALTER TABLE `mob_spawn_mods` DISABLE KEYS */;
REPLACE INTO `mob_spawn_mods` (`mobid`, `modid`, `value`, `is_mob_mod`) VALUES
	(16806117, 288, 40, 0),
	(17240232, 23, 50, 0),
	(17240232, 288, 40, 0),
	(17186927, 368, 33, 0),
	(17195221, 368, 33, 0),
	(17363080, 368, 33, 0),
	(17424488, 302, 25, 0),
	(17424488, 288, 25, 0),
	(17424488, 23, 60, 0),
	(17371142, 16, -1, 1),
	(17371142, 1, 20, 1),
	(17371142, 2, 33, 1),
	(17371143, 16, 2, 1),
	(17371143, 1, 20, 1),
	(17371143, 2, 25, 1),
	(17433009, 1, 15000, 1),
	(17433009, 2, 18000, 1),
	(17433009, 302, 15, 0),
	(17596720, 1, 19000, 1),
	(17596720, 2, 32767, 1),
	(17269106, 1, 15000, 1),
	(17269106, 2, 30545, 1),
	(17485980, 1, 1200, 1),
	(17485980, 2, 1950, 1),
	(17486129, 1, 3600, 1),
	(17486129, 2, 6079, 1),
	(17486031, 1, 1200, 1),
	(17486031, 2, 1903, 1),
	(17228242, 1, 21000, 1),
	(17228242, 2, 31300, 1),
	(17289575, 12, 15, 1),
	(16887889, 12, 15, 1),
	(17297441, 12, 25, 1),
	(17408018, 12, 20, 1),
	(16806227, 12, 8, 1),
	(16806227, 49, 1, 1),
	(16896161, 12, 15, 1),
	(16797969, 12, 15, 1),
	(16797969, 49, 1, 1),
	(16900314, 12, 15, 1),
	(17309982, 1, 1500, 1),
	(17309982, 2, 18000, 1),
	(17309980, 1, 1500, 1),
	(17309980, 2, 29036, 1),
	(17309981, 1, 1500, 1),
	(17309981, 2, 28608, 1),
	(17309983, 1, 1500, 1),
	(17309983, 2, 28886, 1),
	(17236202, 12, 15, 1),
	(17236202, 160, 50, 0),
	(17236202, 169, 10, 0),
	(17236202, 16, 1, 1),
	(17236204, 16, 1, 1),
	(17236204, 12, 15, 1),
	(17236204, 169, 10, 0),
	(17236203, 169, 10, 0),
	(17236203, 12, 15, 1),
	(17236203, 16, 1, 1),
	(17236203, 23, 8, 1),
	(17367080, 33, 30, 1),
	(17367082, 33, 30, 1),
	(17367085, 34, 30, 1),
	(17375263, 34, 30, 1),
	(17375267, 34, 30, 1),
	(17465360, 34, 30, 1),
	(17465360, 33, 30, 1),
	(17465362, 33, 30, 1),
	(17465364, 33, 30, 1),
	(16806215, 26, 32, 1),
	(16806216, 26, 32, 1),
	(16806217, 26, 32, 1),
	(17207308, 1, 15000, 1),
	(17207308, 2, 20000, 1),
	(17235987, 1, 1076, 1),
	(17235987, 2, 2765, 1),
	(17203216, 1, 15000, 1),
	(17203216, 2, 20000, 1),
	(17555863, 1, 20000, 1),
	(17555863, 2, 30000, 1),
	(17309954, 1, 18000, 1),
	(17309954, 2, 29250, 1),
	(17506370, 1, 17986, 1),
	(17506370, 2, 27482, 1),
	(17502568, 1, 18227, 1),
	(17502568, 2, 18606, 1),
	(17629524, 1, 6000, 1),
	(17629524, 2, 9234, 1),
	(17629641, 1, 6000, 1),
	(17629641, 2, 9234, 1),
	(17629640, 1, 6000, 1),
	(17629640, 2, 9234, 1),
	(17629621, 1, 6000, 1),
	(17629621, 2, 9234, 1),
	(17629483, 1, 6000, 1),
	(17629483, 2, 9234, 1),
	(17629421, 1, 2100, 1),
	(17629421, 2, 4500, 1),
	(17629412, 1, 2100, 1),
	(17629412, 2, 4500, 1),
	(17629561, 1, 650, 1),
	(17629561, 2, 1450, 1),
	(17629281, 1, 2100, 1),
	(17629281, 2, 4500, 1),
	(17629643, 1, 6000, 1),
	(17629643, 2, 9234, 1),
	(17629403, 1, 4800, 1),
	(17629403, 2, 6000, 1),
	(17629238, 1, 2000, 1),
	(17629238, 2, 6000, 1),
	(17629301, 1, 1000, 1),
	(17629301, 2, 3000, 1),
	(17629264, 1, 10000, 1),
	(17629264, 2, 13640, 1),
	(17629644, 1, 6000, 1),
	(17629644, 2, 9234, 1),
	(17629430, 1, 1200, 1),
	(17629430, 2, 3000, 1),
	(16990474, 1, 5000, 1),
	(16990474, 2, 7000, 1),
	(17404331, 1, 20000, 1),
	(17404331, 2, 24000, 1),
	(17461478, 1, 3000, 1),
	(17461478, 2, 9900, 1),
	(17285460, 1, 379, 1),
	(17285460, 2, 900, 1),
	(17490231, 1, 6000, 1),
	(17490231, 2, 9500, 1),
	(17297440, 13, 1800, 1),
	(17297441, 13, 3600, 1),
	(17301537, 13, 1800, 1),
	(17301538, 13, 3600, 1),
	(17408018, 13, 3600, 1),
	(17408019, 13, 3600, 1),
	(17649731, 13, 1200, 1),
	(17613130, 13, 1800, 1),
	(17596720, 13, 1800, 1),
	(17649730, 13, 600, 1),
	(17269106, 13, 1200, 1),
	(17228242, 13, 1200, 1),
	(16990474, 13, 3600, 1),
	(17490016, 1, 6000, 1),
	(17490016, 2, 9100, 1),
	(17617158, 1, 15000, 1),
	(17617158, 2, 18000, 1),
	(17617158, 12, 20, 1),
	(17383433, 16, 1, 1),
	(17383441, 16, 1, 1),
	(17383440, 16, 1, 1),
	(17391765, 16, 1, 1),
	(17391802, 16, 1, 1),
	(17391806, 16, 1, 1),
	(17391848, 16, 1, 1),
	(17391727, 16, 1, 1),
	(17391766, 16, 1, 1),
	(17391803, 16, 1, 1),
	(17391849, 16, 1, 1),
	(17396127, 16, 1, 1),
	(17396133, 16, 1, 1),
	(17396132, 16, 1, 1),
	(17396134, 16, 1, 1),
	(17396137, 16, 1, 1),
	(16814432, 1, 18000, 1),
	(16814432, 2, 19800, 1),
	(16814432, 9, 80, 1),
	(16814432, 170, 50, 0),
	(16814432, 168, 2, 0),
	(16814432, 29, 33, 0),
	(16921015, 387, -95, 0),
	(16921015, 390, -95, 0),
	(16921016, 60, 100, 0),
	(16921016, 61, -100, 0),
	(16921017, 60, -100, 0),
	(16921017, 61, 100, 0),
	(16912838, 407, 150, 0),
	(16912838, 7, 60, 1),
	(16912838, 16, 1, 1),
	(16912838, 32, 1, 1),
	(17572197, 16, 1, 1),
	(17572198, 16, 1, 1),
	(17572199, 16, 1, 1),
	(17572200, 16, 1, 1),
	(17621014, 49, 1, 1),
	(17621015, 49, 1, 1),
	(17621016, 49, 1, 1),
	(17621017, 49, 1, 1),
	(17453064, 49, 1, 1),
	(16904202, 49, 1, 1),
	(17506670, 49, 1, 1),
	(16926464, 49, 1, 1),
	(16916815, 49, 1, 1),
	(16916816, 49, 1, 1),
	(16916817, 49, 1, 1),
	(17326081, 50, 25, 1),
	(17293486, 51, 1, 1),
	(17293486, 31, 5, 1),
	(17428812, 17, 1, 1),
	(17428811, 1, 2000, 1),
	(17428811, 2, 5625, 1),
	(16986431, 16, 1, 1),
	(16986428, 55, 180, 1),
	(16986429, 55, 180, 1),
	(16986430, 55, 180, 1),
	(16986431, 55, 180, 1),
	(16998871, 55, 180, 1),
	(16998872, 55, 180, 1),
	(16998873, 55, 180, 1),
	(16998874, 55, 180, 1),
	(16990473, 55, 180, 1),
	(16990474, 55, 180, 1),
	(17027471, 55, 180, 1),
	(17027472, 55, 180, 1),
	(17027473, 55, 180, 1),
	(17027474, 55, 180, 1),
	(17027485, 55, 180, 1),
	(17031598, 55, 180, 1),
	(17031599, 55, 180, 1),
	(17031600, 55, 180, 1),
	(17043887, 55, 180, 1),
	(17043888, 55, 180, 1),
	(17056157, 55, 180, 1),
	(17056186, 55, 180, 1),
	(17072171, 55, 180, 1),
	(17072172, 55, 180, 1),
	(17072178, 55, 180, 1),
	(17072179, 55, 180, 1),
	(17101202, 55, 180, 1),
	(17101203, 55, 180, 1),
	(17101204, 55, 180, 1),
	(17101205, 55, 180, 1);
/*!40000 ALTER TABLE `mob_spawn_mods` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
