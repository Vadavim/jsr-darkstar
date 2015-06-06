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

-- Dumping structure for table dspdb.pet_list
CREATE TABLE IF NOT EXISTS `pet_list` (
  `petid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `poolid` int(10) unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petid`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.pet_list: 76 rows
/*!40000 ALTER TABLE `pet_list` DISABLE KEYS */;
REPLACE INTO `pet_list` (`petid`, `name`, `poolid`, `minLevel`, `maxLevel`, `time`, `element`) VALUES
	(0, 'FireSpirit', 1341, 1, 99, 0, 1),
	(1, 'IceSpirit', 2043, 1, 99, 0, 5),
	(2, 'AirSpirit', 71, 1, 99, 0, 4),
	(3, 'EarthSpirit', 1160, 1, 99, 0, 2),
	(4, 'ThunderSpirit', 3912, 1, 99, 0, 6),
	(5, 'WaterSpirit', 4309, 1, 99, 0, 3),
	(6, 'LightSpirit', 2413, 1, 99, 0, 7),
	(7, 'DarkSpirit', 913, 1, 99, 0, 8),
	(8, 'Carbuncle', 4588, 1, 99, 0, 7),
	(9, 'Fenrir', 4581, 1, 99, 0, 8),
	(10, 'Ifrit', 4582, 1, 99, 0, 1),
	(11, 'Titan', 4583, 1, 99, 0, 2),
	(12, 'Leviathan', 4584, 1, 99, 0, 3),
	(13, 'Garuda', 4585, 1, 99, 0, 4),
	(14, 'Shiva', 4586, 1, 99, 0, 5),
	(15, 'Ramuh', 4587, 1, 99, 0, 6),
	(16, 'Diabolos', 4590, 1, 99, 0, 8),
	(17, 'Alexander', 4589, 1, 99, 0, 7),
	(18, 'Odin', 4591, 1, 99, 0, 8),
	(19, 'Atomos', 1, 1, 99, 0, 0),
	(20, 'CaitSith', 1, 1, 99, 0, 0),
	(21, 'SheepFamiliar', 4598, 23, 35, 3600, 0),
	(22, 'HareFamiliar', 4641, 23, 35, 5400, 0),
	(23, 'CrabFamiliar', 4610, 23, 55, 1800, 0),
	(24, 'CourierCarrie', 4611, 23, 75, 1800, 0),
	(25, 'Homunculus', 4616, 23, 75, 3600, 0),
	(26, 'FlytrapFamiliar', 4619, 28, 40, 3600, 0),
	(27, 'TigerFamiliar', 4604, 28, 40, 3600, 0),
	(28, 'FlowerpotBill', 4602, 28, 40, 3600, 0),
	(29, 'EftFamiliar', 4621, 33, 45, 3600, 0),
	(30, 'LizardFamiliar', 4600, 33, 45, 3600, 0),
	(31, 'MayflyFamiliar', 4596, 33, 45, 3600, 0),
	(32, 'FunguarFamiliar', 4614, 33, 65, 3600, 0),
	(33, 'BeetleFamiliar', 4606, 38, 45, 3600, 0),
	(34, 'AntlionFamiliar', 4625, 38, 50, 3600, 0),
	(35, 'MiteFamiliar', 4623, 43, 55, 3600, 0),
	(36, 'LullabyMelodia', 4599, 43, 55, 3600, 0),
	(37, 'KeenearedSteffi', 4595, 43, 55, 5400, 0),
	(38, 'FlowerpotBen', 4603, 51, 63, 3600, 0),
	(39, 'SaberSiravarde', 4605, 51, 63, 3600, 0),
	(40, 'ColdbloodComo', 4601, 53, 65, 3600, 0),
	(41, 'ShellbusterOrob', 4597, 53, 65, 3600, 0),
	(42, 'VoraciousAudrey', 4620, 53, 75, 3600, 0),
	(43, 'AmbusherAllie', 4622, 58, 75, 3600, 0),
	(44, 'LifedrinkerLars', 4624, 63, 75, 3600, 0),
	(45, 'PanzerGalahad', 4607, 63, 75, 3600, 0),
	(46, 'ChopsueyChucky', 4626, 63, 85, 1800, 0),
	(47, 'AmigoSabotender', 4618, 75, 85, 1200, 0),
	(48, 'Wyvern', 4592, 1, 99, 0, 0),
	(49, 'Crafty Clyvonne', 4608, 76, 90, 7200, 0),
	(50, 'Bloodclaw Shasr', 4609, 90, 99, 7200, 0),
	(51, 'Lucky Lulush', 4612, 76, 99, 7200, 0),
	(52, 'Fatso Fargann', 4613, 81, 99, 7200, 0),
	(53, 'Discreet Louise', 4615, 79, 99, 7200, 0),
	(54, 'Swift Sieghard', 4617, 86, 94, 7200, 0),
	(55, 'Dipper Yuly', 4627, 76, 99, 7200, 0),
	(56, 'Flowerpot Merle', 4628, 76, 99, 10800, 0),
	(57, 'Nursery Nazuna', 4629, 76, 86, 7200, 0),
	(58, 'Mailbuster Ceta', 4630, 85, 95, 7200, 0),
	(59, 'Audacious Anna', 4631, 85, 95, 7200, 0),
	(60, 'Presto Julio', 4632, 83, 93, 7200, 0),
	(61, 'Bugeyed Broncha', 4633, 90, 99, 7200, 0),
	(62, 'Gooey Gerard', 4634, 95, 99, 5400, 0),
	(63, 'Gorefang Hobs', 4635, 93, 99, 7200, 0),
	(64, 'Faithful Falcor', 4636, 86, 99, 5400, 0),
	(65, 'Crude Raphie', 4637, 96, 99, 5400, 0),
	(66, 'Dapper Mac', 4638, 76, 99, 7200, 0),
	(67, 'Slippery Silas', 4639, 23, 99, 1800, 0),
	(68, 'Turbid Toloi', 4640, 23, 99, 3600, 0),
	(69, 'HarlequinFrame', 5124, 1, 99, 0, 0),
	(70, 'ValoredgeFrame', 5125, 1, 99, 0, 0),
	(71, 'SharpshotFrame', 5126, 1, 99, 0, 0),
	(72, 'StormwakerFrame', 5127, 1, 99, 0, 0),
	(73, 'Shawn', 415, 1, 99, 0, 0),
	(74, 'Chocobo', 1360, 1, 99, 0, 0),
	(75, 'Torston', 2793, 1, 99, 0, 0);
/*!40000 ALTER TABLE `pet_list` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
