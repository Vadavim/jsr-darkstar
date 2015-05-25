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

-- Dumping structure for table dspdb.server_variables
CREATE TABLE IF NOT EXISTS `server_variables` (
  `name` varchar(50) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.server_variables: 89 rows
/*!40000 ALTER TABLE `server_variables` DISABLE KEYS */;
REPLACE INTO `server_variables` (`name`, `value`) VALUES
	('[BF]Save_The_Children_record', 14),
	('[BF]The_Holy_Crest_record', 600),
	('[BF]Mission_2-3_Horlais_Peak_record', 600),
	('[BF]Mission_2-3_Balgas_Dais_record', 18),
	('[BF]Mission_2-3_Waughroon_record', 600),
	('[BF]Shattering_Stars_job1_record', 600),
	('[BF]Shattering_Stars_job2_record', 600),
	('[BF]Shattering_Stars_job3_record', 600),
	('[BF]Shattering_Stars_job4_record', 600),
	('[BF]Shattering_Stars_job5_record', 600),
	('[BF]Shattering_Stars_job6_record', 600),
	('[BF]Shattering_Stars_job7_record', 600),
	('[BF]Shattering_Stars_job8_record', 600),
	('[BF]Shattering_Stars_job9_record', 600),
	('[BF]Shattering_Stars_job10_record', 600),
	('[BF]Shattering_Stars_job11_record', 600),
	('[BF]Shattering_Stars_job12_record', 600),
	('[BF]Shattering_Stars_job13_record', 600),
	('[BF]Shattering_Stars_job14_record', 600),
	('[BF]Shattering_Stars_job15_record', 600),
	('[BF]Zilart_Mission_4_record', 600),
	('[CHOCOBO][245]Price', 200),
	('[CHOCOBO][244]Time', 1432573556),
	('[CHOCOBO][244]Price', 200),
	('[CHOCOBO][241]Time', 1432573556),
	('[CHOCOBO][241]Price', 100),
	('[CHOCOBO][234]Time', 1432573556),
	('[CHOCOBO][234]Price', 100),
	('[CHOCOBO][230]Time', 1432573556),
	('[CHOCOBO][230]Price', 100),
	('Bastok8-1LastClear', 1432573254),
	('[TEMP]Respawn_qm1_for_curtana', 0),
	('[TEMP]Respawn_qm1_for_rattle', 0),
	('[TEMP]Respawn_qm2_for_offering', 0),
	('[TEMP]Respawn_qm3_for_whistle', 0),
	('[POP]Beryl-footed_Molberry', 0),
	('[POP]Crimson-toothed_Pawberry', 0),
	('[LANTERN]_rancor_nw_last_lit', 0),
	('[LANTERN]_rancor_ne_last_lit', 0),
	('[LANTERN]_rancor_sw_last_lit', 0),
	('[LANTERN]_rancor_se_last_lit', 0),
	('[ZM4]Fire_Headstone_Active', 0),
	('[ZM4]Wind_Headstone_Active', 0),
	('[ZM4]Lightning_Headstone_Active', 0),
	('[ZM4]Light_Headstone_Active', 0),
	('[BF]Mission_5-1_Enter', 0),
	('[BF]Mission_5-1_QuBia_Arena_record', 15),
	('[GUILD]pattern_update', 144),
	('[GUILD]pattern', 3),
	('Old_Prof_Spawn_Location', 5),
	('Heliodromos_ToD', 1432620375),
	('[SEA]Jailer_of_Temperance_PH', 16916525),
	('[SEA]IxAernDRG_PH', 16920791),
	('[CHOCOBO][245]Time', 1432573556),
	('[CHOCOBO][246]Price', 200),
	('[CHOCOBO][246]Time', 1432573556),
	('[CHOCOBO][250]Price', 90),
	('[CHOCOBO][250]Time', 1432573556),
	('[CHOCOBO][252]Price', 90),
	('[CHOCOBO][252]Time', 1432573556),
	('[CHOCOBO][247]Price', 90),
	('[CHOCOBO][247]Time', 1432573556),
	('[CHOCOBO][102]Price', 200),
	('[CHOCOBO][102]Time', 1432573556),
	('[CHOCOBO][108]Price', 200),
	('[CHOCOBO][108]Time', 1432573556),
	('[CHOCOBO][117]Price', 200),
	('[CHOCOBO][117]Time', 1432573556),
	('[CHOCOBO][114]Price', 200),
	('[CHOCOBO][114]Time', 1432573556),
	('[CHOCOBO][124]Price', 200),
	('[CHOCOBO][124]Time', 1432573556),
	('[CHOCOBO][48]Price', 250),
	('[CHOCOBO][48]Time', 1432573556),
	('[CHOCOBO][51]Price', 200),
	('[CHOCOBO][51]Time', 1432573556),
	('[CHOCOBO][80]Price', 150),
	('[CHOCOBO][80]Time', 1432573556),
	('[CHOCOBO][87]Price', 150),
	('[CHOCOBO][87]Time', 1432573556),
	('[CHOCOBO][94]Price', 150),
	('[CHOCOBO][94]Time', 1432573556),
	('[CHOCOBO][82]Price', 200),
	('[CHOCOBO][82]Time', 1432573556),
	('[CHOCOBO][90]Price', 200),
	('[CHOCOBO][90]Time', 1432573556),
	('[CHOCOBO][97]Price', 200),
	('[CHOCOBO][97]Time', 1432573556),
	('[POP]Spiny_Spipi', 1432394956);
/*!40000 ALTER TABLE `server_variables` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
