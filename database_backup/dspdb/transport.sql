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

-- Dumping structure for table dspdb.transport
CREATE TABLE IF NOT EXISTS `transport` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` tinytext NOT NULL,
  `transport` int(10) unsigned NOT NULL DEFAULT '0',
  `door` int(10) unsigned NOT NULL DEFAULT '0',
  `dock_x` float(7,3) NOT NULL DEFAULT '0.000',
  `dock_y` float(7,3) NOT NULL DEFAULT '0.000',
  `dock_z` float(7,3) NOT NULL DEFAULT '0.000',
  `dock_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `boundary` smallint(5) unsigned NOT NULL DEFAULT '0',
  `anim_arrive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `anim_depart` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time_offset` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_interval` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_anim_arrive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time_waiting` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_anim_depart` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `zone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.transport: 17 rows
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
REPLACE INTO `transport` (`id`, `name`, `transport`, `door`, `dock_x`, `dock_y`, `dock_z`, `dock_rot`, `boundary`, `anim_arrive`, `anim_depart`, `time_offset`, `time_interval`, `time_anim_arrive`, `time_waiting`, `time_anim_depart`, `zone`) VALUES
	(1, 'Kazham-Jeuno_Airship', 17801320, 17801319, -4.000, -3.497, 32.125, 128, 512, 18, 19, 90, 360, 20, 50, 20, 226),
	(2, 'Jeuno-Kazham_Airship', 17784936, 17784935, -4.000, 10.450, 117.000, 64, 477, 24, 25, 270, 360, 20, 50, 20, 226),
	(3, 'Jeuno-Sandoria_Airship', 17784936, 17784932, -68.000, 10.450, 117.000, 64, 474, 18, 19, 0, 360, 12, 60, 12, 223),
	(4, 'Jeuno-Windurst_Airship', 17784936, 17784934, -6.000, 10.450, -117.000, 192, 476, 22, 23, 90, 360, 12, 60, 12, 225),
	(5, 'Jeuno-Bastok_Airship', 17784936, 17784933, -70.000, 10.450, -117.000, 192, 475, 20, 21, 180, 360, 12, 60, 16, 224),
	(6, 'Sandoria-Jeuno_Airship', 17727598, 17727595, 20.000, -2.000, 44.000, 64, 369, 18, 19, 180, 360, 12, 60, 16, 223),
	(7, 'Windurst-Jeuno_Airship', 17760420, 17760419, 242.281, -3.522, 61.994, 96, 416, 18, 19, 270, 360, 18, 60, 14, 225),
	(8, 'Bastok-Jeuno_Airship', 17743971, 17743965, -36.458, 6.365, -77.322, 128, 315, 18, 19, 0, 360, 14, 60, 16, 224),
	(9, 'Selbina-Mhaura_Boat', 17793088, 17793087, 9.294, 0.000, -69.775, 0, 485, 18, 19, 372, 480, 18, 90, 17, 220),
	(10, 'Mhaura-Selbina_Boat', 17797182, 17797181, -0.516, 0.003, -8.409, 0, 493, 18, 19, 372, 480, 18, 90, 17, 221),
	(11, 'Mhaura-Whitegate_Boat', 17797182, 17797181, -0.516, 0.003, -8.409, 0, 493, 18, 19, 142, 480, 18, 80, 17, 46),
	(12, 'Whitegate-Mhaura_Boat', 16982042, 16982040, -20.726, 3.389, -154.231, 0, 569, 18, 19, 142, 480, 18, 80, 16, 47),
	(13, 'Whitegate-Nashmau_Boat', 16982042, 16982041, 20.726, 3.389, 154.231, 128, 570, 20, 21, 282, 480, 18, 180, 17, 58),
	(14, 'Nashmau-Whitegate_Boat', 16994323, 16994322, 3.240, 3.389, -114.221, 0, 571, 22, 23, 282, 480, 18, 180, 16, 59),
	(15, 'Manaclip_Bibiki-Tours', 16793913, 16793914, 491.500, 0.000, 687.400, 128, 0, 18, 19, 710, 720, 20, 40, 20, 3),
	(16, 'Manaclip_Bibiki-Purgonorgo', 16793913, 16793914, 491.500, 0.000, 687.400, 128, 0, 18, 19, 270, 720, 20, 40, 20, 3),
	(17, 'Manaclip_Purgonorgo-Bibiki', 16793913, 16793915, -392.000, 0.000, -364.000, 128, 0, 20, 21, 500, 720, 20, 40, 20, 3);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
