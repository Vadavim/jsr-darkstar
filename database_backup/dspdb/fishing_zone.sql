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

-- Dumping structure for table dspdb.fishing_zone
CREATE TABLE IF NOT EXISTS `fishing_zone` (
  `zoneid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `fishid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`zoneid`,`fishid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=27;

-- Dumping data for table dspdb.fishing_zone: 872 rows
DELETE FROM `fishing_zone`;
/*!40000 ALTER TABLE `fishing_zone` DISABLE KEYS */;
INSERT INTO `fishing_zone` (`zoneid`, `name`, `fishid`) VALUES
	(1, 'Phanauet Channel', 5125),
	(1, 'Phanauet Channel', 4469),
	(1, 'Phanauet Channel', 4315),
	(1, 'Phanauet Channel', 4428),
	(1, 'Phanauet Channel', 4402),
	(1, 'Phanauet Channel', 5126),
	(1, 'Phanauet Channel', 4319),
	(1, 'Phanauet Channel', 4472),
	(1, 'Phanauet Channel', 4426),
	(1, 'Phanauet Channel', 4354),
	(1, 'Phanauet Channel', 4427),
	(2, 'Carpenters\' Landing', 5125),
	(2, 'Carpenters\' Landing', 4472),
	(2, 'Carpenters\' Landing', 4469),
	(2, 'Carpenters\' Landing', 4428),
	(2, 'Carpenters\' Landing', 688),
	(2, 'Carpenters\' Landing', 5126),
	(2, 'Carpenters\' Landing', 4354),
	(2, 'Carpenters\' Landing', 90),
	(2, 'Carpenters\' Landing', 14117),
	(3, 'Manaclipper', 4443),
	(3, 'Manaclipper', 4360),
	(3, 'Manaclipper', 4514),
	(3, 'Manaclipper', 4471),
	(3, 'Manaclipper', 624),
	(3, 'Manaclipper', 5121),
	(3, 'Manaclipper', 5128),
	(3, 'Manaclipper', 4385),
	(3, 'Manaclipper', 4399),
	(3, 'Manaclipper', 4485),
	(3, 'Manaclipper', 5120),
	(3, 'Manaclipper', 4480),
	(3, 'Manaclipper', 5131),
	(3, 'Manaclipper', 5127),
	(3, 'Manaclipper', 4318),
	(3, 'Manaclipper', 4314),
	(3, 'Manaclipper', 4476),
	(3, 'Manaclipper', 90),
	(4, 'Bibiki Bay', 4443),
	(4, 'Bibiki Bay', 4360),
	(4, 'Bibiki Bay', 5128),
	(4, 'Bibiki Bay', 4385),
	(4, 'Bibiki Bay', 4471),
	(4, 'Bibiki Bay', 14242),
	(4, 'Bibiki Bay', 12522),
	(4, 'Bibiki Bay', 90),
	(4, 'Bibiki Bay', 624),
	(11, 'Oldton Movalpolos', 4472),
	(11, 'Oldton Movalpolos', 4515),
	(11, 'Oldton Movalpolos', 4313),
	(11, 'Oldton Movalpolos', 4429),
	(11, 'Oldton Movalpolos', 4316),
	(11, 'Oldton Movalpolos', 16655),
	(11, 'Oldton Movalpolos', 16606),
	(11, 'Oldton Movalpolos', 1638),
	(11, 'Oldton Movalpolos', 1624),
	(24, 'Lufaise Meadows', 4428),
	(24, 'Lufaise Meadows', 5130),
	(24, 'Lufaise Meadows', 4454),
	(24, 'Lufaise Meadows', 5129),
	(24, 'Lufaise Meadows', 688),
	(24, 'Lufaise Meadows', 4427),
	(25, 'Misareaux Coast', 4401),
	(25, 'Misareaux Coast', 4428),
	(25, 'Misareaux Coast', 4427),
	(25, 'Misareaux Coast', 5130),
	(25, 'Misareaux Coast', 4463),
	(25, 'Misareaux Coast', 13456),
	(25, 'Misareaux Coast', 4443),
	(25, 'Misareaux Coast', 4500),
	(25, 'Misareaux Coast', 4514),
	(26, 'Tavnazian Safehold', 4472),
	(27, 'Phomiuna Aqueducts', 4472),
	(46, 'Open sea route to Al Zahbi', 4443),
	(46, 'Open sea route to Al Zahbi', 5449),
	(46, 'Open sea route to Al Zahbi', 5132),
	(46, 'Open sea route to Al Zahbi', 4403),
	(46, 'Open sea route to Al Zahbi', 5141),
	(46, 'Open sea route to Al Zahbi', 5450),
	(46, 'Open sea route to Al Zahbi', 4480),
	(46, 'Open sea route to Al Zahbi', 5452),
	(46, 'Open sea route to Al Zahbi', 4485),
	(46, 'Open sea route to Al Zahbi', 5134),
	(46, 'Open sea route to Al Zahbi', 5127),
	(46, 'Open sea route to Al Zahbi', 90),
	(46, 'Open sea route to Al Zahbi', 14117),
	(47, 'Open sea route to Mhaura', 4443),
	(47, 'Open sea route to Mhaura', 5449),
	(47, 'Open sea route to Mhaura', 5132),
	(47, 'Open sea route to Mhaura', 4403),
	(47, 'Open sea route to Mhaura', 5141),
	(47, 'Open sea route to Mhaura', 5450),
	(47, 'Open sea route to Mhaura', 4480),
	(47, 'Open sea route to Mhaura', 5452),
	(47, 'Open sea route to Mhaura', 4485),
	(47, 'Open sea route to Mhaura', 5134),
	(47, 'Open sea route to Mhaura', 5127),
	(47, 'Open sea route to Mhaura', 90),
	(47, 'Open sea route to Mhaura', 14117),
	(48, 'Al Zahbi', 2341),
	(48, 'Al Zahbi', 4401),
	(48, 'Al Zahbi', 4472),
	(48, 'Al Zahbi', 4310),
	(48, 'Al Zahbi', 5458),
	(48, 'Al Zahbi', 5460),
	(48, 'Al Zahbi', 5459),
	(48, 'Al Zahbi', 90),
	(48, 'Al Zahbi', 14117),
	(48, 'Al Zahbi', 14242),
	(50, 'Aht Urhgan Whitegate', 2341),
	(50, 'Aht Urhgan Whitegate', 5447),
	(50, 'Aht Urhgan Whitegate', 5449),
	(50, 'Aht Urhgan Whitegate', 5448),
	(50, 'Aht Urhgan Whitegate', 14117),
	(50, 'Aht Urhgan Whitegate', 14242),
	(51, 'Wajaom Woodlands', 5461),
	(51, 'Wajaom Woodlands', 4428),
	(51, 'Wajaom Woodlands', 5458),
	(51, 'Wajaom Woodlands', 5459),
	(51, 'Wajaom Woodlands', 5460),
	(51, 'Wajaom Woodlands', 5462),
	(51, 'Wajaom Woodlands', 5137),
	(51, 'Wajaom Woodlands', 90),
	(51, 'Wajaom Woodlands', 14117),
	(51, 'Wajaom Woodlands', 14242),
	(52, 'Bhaflau Thickets', 5461),
	(52, 'Bhaflau Thickets', 4428),
	(52, 'Bhaflau Thickets', 5458),
	(52, 'Bhaflau Thickets', 5459),
	(52, 'Bhaflau Thickets', 5460),
	(52, 'Bhaflau Thickets', 5462),
	(52, 'Bhaflau Thickets', 5137),
	(52, 'Bhaflau Thickets', 90),
	(52, 'Bhaflau Thickets', 14242),
	(53, 'Nashmau', 2341),
	(53, 'Nashmau', 5453),
	(53, 'Nashmau', 5456),
	(53, 'Nashmau', 5454),
	(53, 'Nashmau', 5455),
	(53, 'Nashmau', 5133),
	(53, 'Nashmau', 14117),
	(53, 'Nashmau', 14242),
	(54, 'Arrapago Reef', 5453),
	(54, 'Arrapago Reef', 5456),
	(54, 'Arrapago Reef', 5135),
	(54, 'Arrapago Reef', 5454),
	(54, 'Arrapago Reef', 5455),
	(54, 'Arrapago Reef', 5462),
	(54, 'Arrapago Reef', 14117),
	(54, 'Arrapago Reef', 14242),
	(57, 'Talacca Cove', 5136),
	(57, 'Talacca Cove', 5453),
	(57, 'Talacca Cove', 5454),
	(57, 'Talacca Cove', 5455),
	(57, 'Talacca Cove', 5457),
	(57, 'Talacca Cove', 14117),
	(57, 'Talacca Cove', 14242),
	(58, 'Silver Sea route to Nashmau', 2341),
	(58, 'Silver Sea route to Nashmau', 5449),
	(58, 'Silver Sea route to Nashmau', 4403),
	(58, 'Silver Sea route to Nashmau', 5450),
	(58, 'Silver Sea route to Nashmau', 5448),
	(58, 'Silver Sea route to Nashmau', 5452),
	(58, 'Silver Sea route to Nashmau', 5451),
	(58, 'Silver Sea route to Nashmau', 5140),
	(58, 'Silver Sea route to Nashmau', 5134),
	(59, 'Silver Sea route to Al Zahbi', 2341),
	(59, 'Silver Sea route to Al Zahbi', 5449),
	(59, 'Silver Sea route to Al Zahbi', 4403),
	(59, 'Silver Sea route to Al Zahbi', 5450),
	(59, 'Silver Sea route to Al Zahbi', 5448),
	(59, 'Silver Sea route to Al Zahbi', 5452),
	(59, 'Silver Sea route to Al Zahbi', 5451),
	(59, 'Silver Sea route to Al Zahbi', 5140),
	(59, 'Silver Sea route to Al Zahbi', 5134),
	(61, 'Mount Zhayolm', 5447),
	(61, 'Mount Zhayolm', 5449),
	(61, 'Mount Zhayolm', 5448),
	(61, 'Mount Zhayolm', 14242),
	(65, 'Mamook', 5461),
	(65, 'Mamook', 5458),
	(65, 'Mamook', 5459),
	(65, 'Mamook', 5139),
	(65, 'Mamook', 5460),
	(65, 'Mamook', 90),
	(65, 'Mamook', 14117),
	(65, 'Mamook', 14242),
	(68, 'Aydeewa Subterrane', 4313),
	(68, 'Aydeewa Subterrane', 4309),
	(68, 'Aydeewa Subterrane', 14117),
	(68, 'Aydeewa Subterrane', 14242),
	(68, 'Aydeewa Subterrane', 2216),
	(79, 'Caedarva Mire', 5138),
	(79, 'Caedarva Mire', 5465),
	(79, 'Caedarva Mire', 5463),
	(79, 'Caedarva Mire', 4428),
	(79, 'Caedarva Mire', 5458),
	(79, 'Caedarva Mire', 5464),
	(79, 'Caedarva Mire', 4472),
	(79, 'Caedarva Mire', 14117),
	(81, 'East Ronfaure [S]', 4472),
	(81, 'East Ronfaure [S]', 4379),
	(81, 'East Ronfaure [S]', 4426),
	(81, 'East Ronfaure [S]', 4354),
	(81, 'East Ronfaure [S]', 4427),
	(81, 'East Ronfaure [S]', 688),
	(81, 'East Ronfaure [S]', 14242),
	(81, 'East Ronfaure [S]', 13454),
	(82, 'Jugner Forest [S]', 4401),
	(82, 'Jugner Forest [S]', 13456),
	(82, 'Jugner Forest [S]', 4472),
	(82, 'Jugner Forest [S]', 4528),
	(82, 'Jugner Forest [S]', 4402),
	(82, 'Jugner Forest [S]', 14117),
	(82, 'Jugner Forest [S]', 14242),
	(82, 'Jugner Forest [S]', 16655),
	(82, 'Jugner Forest [S]', 688),
	(82, 'Jugner Forest [S]', 4426),
	(82, 'Jugner Forest [S]', 4469),
	(82, 'Jugner Forest [S]', 4428),
	(82, 'Jugner Forest [S]', 4427),
	(82, 'Jugner Forest [S]', 4454),
	(82, 'Jugner Forest [S]', 90),
	(82, 'Jugner Forest [S]', 12522),
	(82, 'Jugner Forest [S]', 4379),
	(82, 'Jugner Forest [S]', 4354),
	(83, 'Vunkerl Inlet [S]', 4401),
	(83, 'Vunkerl Inlet [S]', 4428),
	(83, 'Vunkerl Inlet [S]', 4426),
	(83, 'Vunkerl Inlet [S]', 4469),
	(83, 'Vunkerl Inlet [S]', 5472),
	(83, 'Vunkerl Inlet [S]', 14242),
	(83, 'Vunkerl Inlet [S]', 14117),
	(83, 'Vunkerl Inlet [S]', 4443),
	(83, 'Vunkerl Inlet [S]', 4360),
	(83, 'Vunkerl Inlet [S]', 4514),
	(83, 'Vunkerl Inlet [S]', 4481),
	(83, 'Vunkerl Inlet [S]', 5466),
	(83, 'Vunkerl Inlet [S]', 4461),
	(83, 'Vunkerl Inlet [S]', 5468),
	(83, 'Vunkerl Inlet [S]', 5473),
	(83, 'Vunkerl Inlet [S]', 5475),
	(83, 'Vunkerl Inlet [S]', 90),
	(83, 'Vunkerl Inlet [S]', 688),
	(84, 'Batallia Downs [S]', 4443),
	(84, 'Batallia Downs [S]', 4360),
	(84, 'Batallia Downs [S]', 4403),
	(84, 'Batallia Downs [S]', 4483),
	(84, 'Batallia Downs [S]', 4482),
	(84, 'Batallia Downs [S]', 5128),
	(84, 'Batallia Downs [S]', 4399),
	(84, 'Batallia Downs [S]', 4451),
	(84, 'Batallia Downs [S]', 4384),
	(84, 'Batallia Downs [S]', 16537),
	(84, 'Batallia Downs [S]', 16655),
	(84, 'Batallia Downs [S]', 16606),
	(84, 'Batallia Downs [S]', 13456),
	(87, 'Bastok Markets [S]', 4401),
	(87, 'Bastok Markets [S]', 4515),
	(87, 'Bastok Markets [S]', 4426),
	(87, 'Bastok Markets [S]', 4469),
	(87, 'Bastok Markets [S]', 4428),
	(87, 'Bastok Markets [S]', 90),
	(87, 'Bastok Markets [S]', 14117),
	(87, 'Bastok Markets [S]', 14242),
	(87, 'Bastok Markets [S]', 13454),
	(88, 'North Gustaberg [S]', 4472),
	(88, 'North Gustaberg [S]', 4515),
	(88, 'North Gustaberg [S]', 4426),
	(88, 'North Gustaberg [S]', 4429),
	(88, 'North Gustaberg [S]', 4427),
	(88, 'North Gustaberg [S]', 14242),
	(88, 'North Gustaberg [S]', 90),
	(88, 'North Gustaberg [S]', 4477),
	(88, 'North Gustaberg [S]', 14117),
	(89, 'Grauberg [S]', 5469),
	(89, 'Grauberg [S]', 5474),
	(89, 'Grauberg [S]', 4429),
	(89, 'Grauberg [S]', 4515),
	(89, 'Grauberg [S]', 4477),
	(89, 'Grauberg [S]', 5470),
	(89, 'Grauberg [S]', 14242),
	(89, 'Grauberg [S]', 14117),
	(90, 'Pashhow Marshlands [S]', 4515),
	(90, 'Pashhow Marshlands [S]', 4469),
	(90, 'Pashhow Marshlands [S]', 4402),
	(90, 'Pashhow Marshlands [S]', 5471),
	(90, 'Pashhow Marshlands [S]', 12522),
	(91, 'Rolanberry Fields [S]', 4401),
	(91, 'Rolanberry Fields [S]', 4472),
	(91, 'Rolanberry Fields [S]', 4469),
	(91, 'Rolanberry Fields [S]', 4428),
	(91, 'Rolanberry Fields [S]', 4402),
	(91, 'Rolanberry Fields [S]', 14242),
	(91, 'Rolanberry Fields [S]', 16606),
	(91, 'Rolanberry Fields [S]', 90),
	(91, 'Rolanberry Fields [S]', 16537),
	(91, 'Rolanberry Fields [S]', 12316),
	(91, 'Rolanberry Fields [S]', 13456),
	(91, 'Rolanberry Fields [S]', 16655),
	(94, 'Windurst Waters [S]', 4472),
	(94, 'Windurst Waters [S]', 4401),
	(94, 'Windurst Waters [S]', 4464),
	(94, 'Windurst Waters [S]', 4427),
	(94, 'Windurst Waters [S]', 90),
	(94, 'Windurst Waters [S]', 14117),
	(94, 'Windurst Waters [S]', 14242),
	(95, 'West Sarutabaruta [S]', 4401),
	(95, 'West Sarutabaruta [S]', 4472),
	(95, 'West Sarutabaruta [S]', 4469),
	(95, 'West Sarutabaruta [S]', 4428),
	(95, 'West Sarutabaruta [S]', 90),
	(95, 'West Sarutabaruta [S]', 14242),
	(95, 'West Sarutabaruta [S]', 4360),
	(95, 'West Sarutabaruta [S]', 4514),
	(95, 'West Sarutabaruta [S]', 4481),
	(95, 'West Sarutabaruta [S]', 4383),
	(95, 'West Sarutabaruta [S]', 4399),
	(95, 'West Sarutabaruta [S]', 4471),
	(95, 'West Sarutabaruta [S]', 4461),
	(95, 'West Sarutabaruta [S]', 624),
	(99, 'Oztroja Castle [S]', 4472),
	(99, 'Oztroja Castle [S]', 14117),
	(100, 'West Ronfaure', 4401),
	(100, 'West Ronfaure', 4472),
	(100, 'West Ronfaure', 4469),
	(100, 'West Ronfaure', 4402),
	(100, 'West Ronfaure', 688),
	(100, 'West Ronfaure', 90),
	(100, 'West Ronfaure', 14117),
	(100, 'West Ronfaure', 14242),
	(101, 'East Ronfaure', 4472),
	(101, 'East Ronfaure', 4379),
	(101, 'East Ronfaure', 4426),
	(101, 'East Ronfaure', 4354),
	(101, 'East Ronfaure', 4427),
	(101, 'East Ronfaure', 688),
	(101, 'East Ronfaure', 14242),
	(101, 'East Ronfaure', 13454),
	(102, 'La Theine Plateau', 4401),
	(102, 'La Theine Plateau', 4472),
	(102, 'La Theine Plateau', 4469),
	(102, 'La Theine Plateau', 4428),
	(102, 'La Theine Plateau', 4402),
	(102, 'La Theine Plateau', 90),
	(102, 'La Theine Plateau', 12522),
	(103, 'Valkurm Dunes', 4443),
	(103, 'Valkurm Dunes', 4360),
	(103, 'Valkurm Dunes', 4500),
	(103, 'Valkurm Dunes', 4514),
	(103, 'Valkurm Dunes', 4385),
	(103, 'Valkurm Dunes', 4484),
	(103, 'Valkurm Dunes', 688),
	(103, 'Valkurm Dunes', 90),
	(103, 'Valkurm Dunes', 12522),
	(103, 'Valkurm Dunes', 14242),
	(103, 'Valkurm Dunes', 13456),
	(104, 'Jugner Forest', 4401),
	(104, 'Jugner Forest', 13456),
	(104, 'Jugner Forest', 4472),
	(104, 'Jugner Forest', 4528),
	(104, 'Jugner Forest', 4402),
	(104, 'Jugner Forest', 14117),
	(104, 'Jugner Forest', 14242),
	(104, 'Jugner Forest', 16655),
	(104, 'Jugner Forest', 688),
	(104, 'Jugner Forest', 4426),
	(104, 'Jugner Forest', 4469),
	(104, 'Jugner Forest', 4428),
	(104, 'Jugner Forest', 4427),
	(104, 'Jugner Forest', 4454),
	(104, 'Jugner Forest', 90),
	(104, 'Jugner Forest', 12522),
	(104, 'Jugner Forest', 4379),
	(104, 'Jugner Forest', 4354),
	(105, 'Batallia Downs', 4443),
	(105, 'Batallia Downs', 4360),
	(105, 'Batallia Downs', 4403),
	(105, 'Batallia Downs', 4483),
	(105, 'Batallia Downs', 4482),
	(105, 'Batallia Downs', 5128),
	(105, 'Batallia Downs', 4399),
	(105, 'Batallia Downs', 4451),
	(105, 'Batallia Downs', 4384),
	(105, 'Batallia Downs', 16537),
	(105, 'Batallia Downs', 16655),
	(105, 'Batallia Downs', 16606),
	(105, 'Batallia Downs', 13456),
	(106, 'North Gustaberg', 4472),
	(106, 'North Gustaberg', 4515),
	(106, 'North Gustaberg', 4426),
	(106, 'North Gustaberg', 4429),
	(106, 'North Gustaberg', 4427),
	(106, 'North Gustaberg', 14242),
	(106, 'North Gustaberg', 90),
	(106, 'North Gustaberg', 4477),
	(106, 'North Gustaberg', 14117),
	(107, 'South Gustaberg', 4443),
	(107, 'South Gustaberg', 4360),
	(107, 'South Gustaberg', 4514),
	(107, 'South Gustaberg', 4481),
	(107, 'South Gustaberg', 4383),
	(107, 'South Gustaberg', 4385),
	(107, 'South Gustaberg', 4471),
	(107, 'South Gustaberg', 4461),
	(107, 'South Gustaberg', 90),
	(107, 'South Gustaberg', 14242),
	(109, 'Pashhow Marshlands', 4472),
	(109, 'Pashhow Marshlands', 4515),
	(109, 'Pashhow Marshlands', 4469),
	(109, 'Pashhow Marshlands', 4402),
	(109, 'Pashhow Marshlands', 16655),
	(109, 'Pashhow Marshlands', 12522),
	(109, 'Pashhow Marshlands', 13456),
	(110, 'Rolanberry Fields', 4401),
	(110, 'Rolanberry Fields', 4472),
	(110, 'Rolanberry Fields', 4469),
	(110, 'Rolanberry Fields', 4428),
	(110, 'Rolanberry Fields', 4402),
	(110, 'Rolanberry Fields', 14242),
	(110, 'Rolanberry Fields', 16606),
	(110, 'Rolanberry Fields', 90),
	(110, 'Rolanberry Fields', 16537),
	(110, 'Rolanberry Fields', 12316),
	(110, 'Rolanberry Fields', 13456),
	(110, 'Rolanberry Fields', 16655),
	(111, 'Beaucedine Glacier', 688),
	(111, 'Beaucedine Glacier', 13454),
	(111, 'Beaucedine Glacier', 4470),
	(111, 'Beaucedine Glacier', 4454),
	(111, 'Beaucedine Glacier', 16451),
	(111, 'Beaucedine Glacier', 14242),
	(111, 'Beaucedine Glacier', 13456),
	(111, 'Beaucedine Glacier', 4403),
	(111, 'Beaucedine Glacier', 4483),
	(111, 'Beaucedine Glacier', 4482),
	(111, 'Beaucedine Glacier', 14117),
	(111, 'Beaucedine Glacier', 4384),
	(111, 'Beaucedine Glacier', 4399),
	(111, 'Beaucedine Glacier', 5128),
	(113, 'Cape Teriggan', 4443),
	(113, 'Cape Teriggan', 4500),
	(113, 'Cape Teriggan', 4385),
	(113, 'Cape Teriggan', 4484),
	(113, 'Cape Teriggan', 14117),
	(114, 'Eastern Altepa Desert', 4401),
	(114, 'Eastern Altepa Desert', 4472),
	(114, 'Eastern Altepa Desert', 4306),
	(114, 'Eastern Altepa Desert', 4291),
	(114, 'Eastern Altepa Desert', 16606),
	(114, 'Eastern Altepa Desert', 13454),
	(115, 'West Sarutabaruta', 4401),
	(115, 'West Sarutabaruta', 4472),
	(115, 'West Sarutabaruta', 4469),
	(115, 'West Sarutabaruta', 4428),
	(115, 'West Sarutabaruta', 90),
	(115, 'West Sarutabaruta', 14242),
	(115, 'West Sarutabaruta', 4360),
	(115, 'West Sarutabaruta', 4514),
	(115, 'West Sarutabaruta', 4481),
	(115, 'West Sarutabaruta', 4383),
	(115, 'West Sarutabaruta', 4399),
	(115, 'West Sarutabaruta', 4471),
	(115, 'West Sarutabaruta', 4461),
	(115, 'West Sarutabaruta', 624),
	(116, 'East Sarutabaruta', 4401),
	(116, 'East Sarutabaruta', 4464),
	(116, 'East Sarutabaruta', 4462),
	(116, 'East Sarutabaruta', 4473),
	(116, 'East Sarutabaruta', 14242),
	(116, 'East Sarutabaruta', 90),
	(116, 'East Sarutabaruta', 4472),
	(116, 'East Sarutabaruta', 4360),
	(116, 'East Sarutabaruta', 4514),
	(116, 'East Sarutabaruta', 4481),
	(116, 'East Sarutabaruta', 4383),
	(116, 'East Sarutabaruta', 4399),
	(116, 'East Sarutabaruta', 4471),
	(116, 'East Sarutabaruta', 4461),
	(116, 'East Sarutabaruta', 624),
	(118, 'Buburimu Peninsula', 4403),
	(118, 'Buburimu Peninsula', 4484),
	(118, 'Buburimu Peninsula', 4399),
	(118, 'Buburimu Peninsula', 624),
	(118, 'Buburimu Peninsula', 16655),
	(118, 'Buburimu Peninsula', 90),
	(118, 'Buburimu Peninsula', 14117),
	(118, 'Buburimu Peninsula', 14242),
	(118, 'Buburimu Peninsula', 13454),
	(118, 'Buburimu Peninsula', 13456),
	(120, 'Sauromugue Champaign', 4403),
	(120, 'Sauromugue Champaign', 4483),
	(120, 'Sauromugue Champaign', 5128),
	(120, 'Sauromugue Champaign', 4399),
	(120, 'Sauromugue Champaign', 4451),
	(120, 'Sauromugue Champaign', 4384),
	(120, 'Sauromugue Champaign', 16537),
	(120, 'Sauromugue Champaign', 90),
	(120, 'Sauromugue Champaign', 16606),
	(120, 'Sauromugue Champaign', 14117),
	(120, 'Sauromugue Champaign', 14242),
	(121, 'The Sanctuary of Zi\'Tah', 4428),
	(121, 'The Sanctuary of Zi\'Tah', 4528),
	(121, 'The Sanctuary of Zi\'Tah', 4402),
	(121, 'The Sanctuary of Zi\'Tah', 688),
	(122, 'Ro\'Maeve', 4472),
	(122, 'Ro\'Maeve', 13454),
	(122, 'Ro\'Maeve', 13456),
	(123, 'Yuhtunga Jungle', 4401),
	(123, 'Yuhtunga Jungle', 4472),
	(123, 'Yuhtunga Jungle', 4289),
	(123, 'Yuhtunga Jungle', 4464),
	(123, 'Yuhtunga Jungle', 4290),
	(123, 'Yuhtunga Jungle', 4579),
	(123, 'Yuhtunga Jungle', 4473),
	(123, 'Yuhtunga Jungle', 4307),
	(123, 'Yuhtunga Jungle', 14242),
	(123, 'Yuhtunga Jungle', 13454),
	(123, 'Yuhtunga Jungle', 90),
	(123, 'Yuhtunga Jungle', 688),
	(124, 'Yhoator Jungle', 4401),
	(124, 'Yhoator Jungle', 4464),
	(124, 'Yhoator Jungle', 4307),
	(124, 'Yhoator Jungle', 4472),
	(124, 'Yhoator Jungle', 4289),
	(124, 'Yhoator Jungle', 4462),
	(124, 'Yhoator Jungle', 14242),
	(124, 'Yhoator Jungle', 13454),
	(124, 'Yhoator Jungle', 688),
	(124, 'Yhoator Jungle', 4290),
	(124, 'Yhoator Jungle', 4579),
	(124, 'Yhoator Jungle', 14117),
	(124, 'Yhoator Jungle', 16655),
	(125, 'Western Altepa Desert', 4401),
	(125, 'Western Altepa Desert', 4469),
	(125, 'Western Altepa Desert', 4306),
	(125, 'Western Altepa Desert', 4291),
	(125, 'Western Altepa Desert', 4477),
	(125, 'Western Altepa Desert', 90),
	(126, 'Qufim Island', 4403),
	(126, 'Qufim Island', 4483),
	(126, 'Qufim Island', 4482),
	(126, 'Qufim Island', 4399),
	(126, 'Qufim Island', 4384),
	(126, 'Qufim Island', 14117),
	(126, 'Qufim Island', 14242),
	(126, 'Qufim Island', 13454),
	(126, 'Qufim Island', 5128),
	(126, 'Qufim Island', 4474),
	(126, 'Qufim Island', 12316),
	(126, 'Qufim Island', 16537),
	(126, 'Qufim Island', 90),
	(126, 'Qufim Island', 13456),
	(126, 'Qufim Island', 4478),
	(140, 'Ghelsba Outpost', 4472),
	(140, 'Ghelsba Outpost', 4469),
	(140, 'Ghelsba Outpost', 4402),
	(142, 'Yughott Grotto', 4472),
	(142, 'Yughott Grotto', 16655),
	(142, 'Yughott Grotto', 12522),
	(142, 'Yughott Grotto', 14117),
	(142, 'Yughott Grotto', 13456),
	(143, 'Palborough Mines', 4472),
	(143, 'Palborough Mines', 4515),
	(143, 'Palborough Mines', 4426),
	(143, 'Palborough Mines', 4429),
	(143, 'Palborough Mines', 90),
	(145, 'Giddeus', 4472),
	(145, 'Giddeus', 4469),
	(145, 'Giddeus', 4428),
	(145, 'Giddeus', 4402),
	(145, 'Giddeus', 90),
	(145, 'Giddeus', 4426),
	(145, 'Giddeus', 4462),
	(145, 'Giddeus', 4427),
	(145, 'Giddeus', 13456),
	(149, 'Davoi', 4401),
	(149, 'Davoi', 4426),
	(149, 'Davoi', 4469),
	(149, 'Davoi', 4428),
	(149, 'Davoi', 4427),
	(149, 'Davoi', 4402),
	(149, 'Davoi', 4463),
	(149, 'Davoi', 688),
	(149, 'Davoi', 4472),
	(149, 'Davoi', 90),
	(149, 'Davoi', 14117),
	(149, 'Davoi', 16606),
	(151, 'Castle Oztroja', 4472),
	(153, 'Boyahda Tree', 4401),
	(153, 'The Boyahda Tree', 4426),
	(153, 'The Boyahda Tree', 4428),
	(153, 'The Boyahda Tree', 4308),
	(153, 'The Boyahda Tree', 688),
	(153, 'The Boyahda Tree', 90),
	(153, 'The Boyahda Tree', 13454),
	(154, 'Dragon\'s Aery', 4401),
	(154, 'Dragon\'s Aery', 4472),
	(154, 'Dragon\'s Aery', 4473),
	(154, 'Dragon\'s Aery', 688),
	(154, 'Dragon\'s Aery', 16537),
	(154, 'Dragon\'s Aery', 90),
	(154, 'Dragon\'s Aery', 13454),
	(159, 'Temple of Uggalepih', 4472),
	(160, 'Den of Rancor', 4443),
	(160, 'Den of Rancor', 4514),
	(160, 'Den of Rancor', 4383),
	(160, 'Den of Rancor', 4399),
	(160, 'Den of Rancor', 4288),
	(160, 'Den of Rancor', 4305),
	(160, 'Den of Rancor', 624),
	(160, 'Den of Rancor', 16606),
	(160, 'Den of Rancor', 14242),
	(160, 'Den of Rancor', 887),
	(166, 'Ranguemont Pass', 4472),
	(167, 'Bostaunieux Oubliette', 4472),
	(167, 'Bostaunieux Oubliette', 16537),
	(167, 'Bostaunieux Oubliette', 14117),
	(167, 'Bostaunieux Oubliette', 14242),
	(167, 'Bostaunieux Oubliette', 13454),
	(172, 'Zeruhn Mines', 4401),
	(172, 'Zeruhn Mines', 4472),
	(172, 'Zeruhn Mines', 4426),
	(172, 'Zeruhn Mines', 4429),
	(172, 'Zeruhn Mines', 90),
	(172, 'Zeruhn Mines', 14117),
	(172, 'Zeruhn Mines', 14242),
	(172, 'Zeruhn Mines', 4515),
	(172, 'Zeruhn Mines', 4469),
	(173, 'Korroloka Tunnel', 4401),
	(173, 'Korroloka Tunnel', 4472),
	(173, 'Korroloka Tunnel', 4515),
	(173, 'Korroloka Tunnel', 4514),
	(173, 'Korroloka Tunnel', 4429),
	(173, 'Korroloka Tunnel', 4291),
	(173, 'Korroloka Tunnel', 16655),
	(173, 'Korroloka Tunnel', 90),
	(173, 'Korroloka Tunnel', 12522),
	(173, 'Korroloka Tunnel', 16606),
	(173, 'Korroloka Tunnel', 14117),
	(173, 'Korroloka Tunnel', 14242),
	(173, 'Korroloka Tunnel', 887),
	(174, 'Kuftal Tunnel', 4306),
	(174, 'Kuftal Tunnel', 4291),
	(174, 'Kuftal Tunnel', 4309),
	(174, 'Kuftal Tunnel', 12522),
	(174, 'Kuftal Tunnel', 14242),
	(176, 'Sea Serpent Grotto', 4443),
	(176, 'Sea Serpent Grotto', 4360),
	(176, 'Sea Serpent Grotto', 4514),
	(176, 'Sea Serpent Grotto', 4361),
	(176, 'Sea Serpent Grotto', 4580),
	(176, 'Sea Serpent Grotto', 4399),
	(176, 'Sea Serpent Grotto', 4461),
	(176, 'Sea Serpent Grotto', 4304),
	(176, 'Sea Serpent Grotto', 1135),
	(176, 'Sea Serpent Grotto', 14242),
	(176, 'Sea Serpent Grotto', 1210),
	(176, 'Sea Serpent Grotto', 16606),
	(176, 'Sea Serpent Grotto', 887),
	(176, 'Sea Serpent Grotto', 624),
	(176, 'Sea Serpent Grotto', 90),
	(191, 'Dangruf Wadi', 4472),
	(193, 'Ordelle\'s Caves', 4472),
	(193, 'Ordelle\'s Caves', 90),
	(193, 'Ordelle\'s Caves', 12522),
	(193, 'Ordelle\'s Caves', 14117),
	(193, 'Ordelle\'s Caves', 14242),
	(193, 'Ordelle\'s Caves', 13456),
	(196, 'Gusgen Mines', 4472),
	(196, 'Gusgen Mines', 4515),
	(196, 'Gusgen Mines', 4426),
	(196, 'Gusgen Mines', 4429),
	(196, 'Gusgen Mines', 4427),
	(196, 'Gusgen Mines', 4477),
	(196, 'Gusgen Mines', 16537),
	(196, 'Gusgen Mines', 16655),
	(196, 'Gusgen Mines', 90),
	(196, 'Gusgen Mines', 14117),
	(196, 'Gusgen Mines', 14242),
	(204, 'Fei\'Yin', 4472),
	(208, 'Quicksand Caves', 4309),
	(208, 'Quicksand Caves', 14242),
	(208, 'Quicksand Caves', 4472),
	(213, 'Labyrinth of Onzozo', 14117),
	(213, 'Labyrinth of Onzozo', 887),
	(220, 'Ferry for Selbina', 4360),
	(220, 'Ferry for Selbina', 4514),
	(220, 'Ferry for Selbina', 4361),
	(220, 'Ferry for Selbina', 4480),
	(220, 'Ferry for Selbina', 5128),
	(220, 'Ferry for Selbina', 4399),
	(220, 'Ferry for Selbina', 4479),
	(220, 'Ferry for Selbina', 4485),
	(220, 'Ferry for Selbina', 4451),
	(220, 'Ferry for Selbina', 4476),
	(220, 'Ferry for Selbina', 4305),
	(220, 'Ferry for Selbina', 14242),
	(221, 'Ferry for Mhaura', 4360),
	(221, 'Ferry for Mhaura', 4514),
	(221, 'Ferry for Mhaura', 4361),
	(221, 'Ferry for Mhaura', 4480),
	(221, 'Ferry for Mhaura', 5128),
	(221, 'Ferry for Mhaura', 4399),
	(221, 'Ferry for Mhaura', 4479),
	(221, 'Ferry for Mhaura', 4485),
	(221, 'Ferry for Mhaura', 4451),
	(221, 'Ferry for Mhaura', 4476),
	(221, 'Ferry for Mhaura', 4305),
	(221, 'Ferry for Mhaura', 14242),
	(227, 'Ferry for Selbina (pirate)', 4360),
	(227, 'Ferry for Selbina (pirate)', 4514),
	(227, 'Ferry for Selbina (pirate)', 4361),
	(227, 'Ferry for Selbina (pirate)', 4480),
	(227, 'Ferry for Selbina (pirate)', 5128),
	(227, 'Ferry for Selbina (pirate)', 4399),
	(227, 'Ferry for Selbina (pirate)', 4479),
	(227, 'Ferry for Selbina (pirate)', 4485),
	(227, 'Ferry for Selbina (pirate)', 4451),
	(227, 'Ferry for Selbina (pirate)', 4476),
	(227, 'Ferry for Selbina (pirate)', 4305),
	(227, 'Ferry for Selbina (pirate)', 14242),
	(227, 'Ferry for Selbina (pirate)', 4475),
	(227, 'Ferry for Selbina (pirate)', 5127),
	(228, 'Ferry for Mhaura (pirate)', 4360),
	(228, 'Ferry for Mhaura (pirate)', 4514),
	(228, 'Ferry for Mhaura (pirate)', 4361),
	(228, 'Ferry for Mhaura (pirate)', 4480),
	(228, 'Ferry for Mhaura (pirate)', 5128),
	(228, 'Ferry for Mhaura (pirate)', 4399),
	(228, 'Ferry for Mhaura (pirate)', 4479),
	(228, 'Ferry for Mhaura (pirate)', 4485),
	(228, 'Ferry for Mhaura (pirate)', 4451),
	(228, 'Ferry for Mhaura (pirate)', 4476),
	(228, 'Ferry for Mhaura (pirate)', 4305),
	(228, 'Ferry for Mhaura (pirate)', 14242),
	(228, 'Ferry for Mhaura (pirate)', 4475),
	(228, 'Ferry for Mhaura (pirate)', 5127),
	(231, 'North San dOria', 4401),
	(231, 'Northern San d\'Oria', 4472),
	(231, 'Northern San d\'Oria', 4426),
	(231, 'Northern San d\'Oria', 4427),
	(231, 'Northern San d\'Oria', 90),
	(231, 'Northern San d\'Oria', 14117),
	(231, 'Northern San d\'Oria', 14242),
	(231, 'Northern San d\'Oria', 13454),
	(232, 'Port San D\'Oria', 4401),
	(232, 'Port San d\'Oria', 4472),
	(232, 'Port San d\'Oria', 4426),
	(232, 'Port San d\'Oria', 4469),
	(232, 'Port San d\'Oria', 4427),
	(232, 'Port San d\'Oria', 90),
	(232, 'Port San d\'Oria', 14117),
	(232, 'Port San d\'Oria', 14242),
	(234, 'Bastok Mines', 4472),
	(234, 'Bastok Mines', 4515),
	(234, 'Bastok Mines', 4426),
	(234, 'Bastok Mines', 4429),
	(234, 'Bastok Mines', 90),
	(234, 'Bastok Mines', 14117),
	(234, 'Bastok Mines', 14242),
	(234, 'Bastok Mines', 13454),
	(235, 'Bastok Markets', 4401),
	(235, 'Bastok Markets', 4515),
	(235, 'Bastok Markets', 4426),
	(235, 'Bastok Markets', 4469),
	(235, 'Bastok Markets', 4428),
	(235, 'Bastok Markets', 90),
	(235, 'Bastok Markets', 14117),
	(235, 'Bastok Markets', 14242),
	(235, 'Bastok Markets', 13454),
	(236, 'Port Bastok', 4443),
	(236, 'Port Bastok', 4360),
	(236, 'Port Bastok', 4514),
	(236, 'Port Bastok', 4385),
	(236, 'Port Bastok', 4461),
	(236, 'Port Bastok', 90),
	(236, 'Port Bastok', 14117),
	(236, 'Port Bastok', 14242),
	(238, 'Windurst Waters', 4401),
	(238, 'Windurst Waters', 4472),
	(238, 'Windurst Waters', 4515),
	(238, 'Windurst Waters', 4464),
	(238, 'Windurst Waters', 4427),
	(238, 'Windurst Waters', 90),
	(238, 'Windurst Waters', 14117),
	(238, 'Windurst Waters', 14242),
	(239, 'Windurst Walls', 4401),
	(239, 'Windurst Walls', 4472),
	(239, 'Windurst Walls', 4464),
	(239, 'Windurst Walls', 4427),
	(239, 'Windurst Walls', 90),
	(239, 'Windurst Walls', 14117),
	(239, 'Windurst Walls', 14242),
	(240, 'Port Windurst', 4360),
	(240, 'Port Windurst', 4514),
	(240, 'Port Windurst', 4461),
	(240, 'Port Windurst', 624),
	(240, 'Port Windurst', 90),
	(240, 'Port Windurst', 12522),
	(240, 'Port Windurst', 14117),
	(241, 'Windurst Woods', 4401),
	(241, 'Windurst Woods', 4472),
	(241, 'Windurst Woods', 4464),
	(241, 'Windurst Woods', 4427),
	(241, 'Windurst Woods', 14117),
	(241, 'Windurst Woods', 14242),
	(241, 'Windurst Woods', 13454),
	(241, 'Windurst Woods', 13456),
	(242, 'Heavens_Tower', 14242),
	(242, 'Heavens_Tower', 13454),
	(242, 'Heavens_Tower', 13456),
	(245, 'Lower Jeuno', 4443),
	(245, 'Lower Jeuno', 4360),
	(245, 'Lower Jeuno', 4403),
	(245, 'Lower Jeuno', 4483),
	(245, 'Lower Jeuno', 4482),
	(245, 'Lower Jeuno', 4384),
	(245, 'Lower Jeuno', 90),
	(245, 'Lower Jeuno', 14117),
	(245, 'Lower Jeuno', 14242),
	(245, 'Lower Jeuno', 13454),
	(246, 'Port Jeuno', 4443),
	(246, 'Port Jeuno', 4360),
	(246, 'Port Jeuno', 4403),
	(246, 'Port Jeuno', 4483),
	(246, 'Port Jeuno', 4482),
	(246, 'Port Jeuno', 4384),
	(246, 'Port Jeuno', 16451),
	(246, 'Port Jeuno', 90),
	(246, 'Port Jeuno', 13454),
	(247, 'Rabao', 4401),
	(247, 'Rabao', 4472),
	(247, 'Rabao', 4306),
	(247, 'Rabao', 4291),
	(247, 'Rabao', 90),
	(247, 'Rabao', 12522),
	(247, 'Rabao', 13454),
	(248, 'Selbina', 4360),
	(248, 'Selbina', 4443),
	(248, 'Selbina', 4501),
	(248, 'Selbina', 4500),
	(248, 'Selbina', 4514),
	(248, 'Selbina', 90),
	(248, 'Selbina', 14117),
	(248, 'Selbina', 13456),
	(248, 'Selbina', 4385),
	(249, 'Mhaura', 4360),
	(249, 'Mhaura', 4403),
	(249, 'Mhaura', 624),
	(249, 'Mhaura', 90),
	(249, 'Mhaura', 14117),
	(249, 'Mhaura', 13454),
	(249, 'Mhaura', 13456),
	(250, 'Kazham', 4443),
	(250, 'Kazham', 4360),
	(250, 'Kazham', 4514),
	(250, 'Kazham', 4580),
	(250, 'Kazham', 624),
	(250, 'Kazham', 688),
	(250, 'Kazham', 90),
	(250, 'Kazham', 14242),
	(250, 'Kazham', 13454),
	(252, 'Norg', 4443),
	(252, 'Norg', 4360),
	(252, 'Norg', 4514),
	(252, 'Norg', 4580),
	(252, 'Norg', 624),
	(252, 'Norg', 90),
	(252, 'Norg', 14117),
	(252, 'Norg', 14242),
	(252, 'Norg', 13454);
/*!40000 ALTER TABLE `fishing_zone` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
