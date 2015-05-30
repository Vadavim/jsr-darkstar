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

-- Dumping structure for table dspdb.item_puppet
CREATE TABLE IF NOT EXISTS `item_puppet` (
  `itemid` smallint(5) unsigned NOT NULL,
  `name` tinytext NOT NULL,
  `slot` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `element` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.item_puppet: 88 rows
/*!40000 ALTER TABLE `item_puppet` DISABLE KEYS */;
INSERT INTO `item_puppet` (`itemid`, `name`, `slot`, `element`) VALUES
	(8193, 'harlequin_head', 1, 2236962),
	(8194, 'valoredge_x-900_head', 1, 33698307),
	(8195, 'sharpshot_z-500_head', 1, 35783427),
	(8196, 'stormwaker_y-700_head', 1, 540025392),
	(8197, 'soulsoother_c-1000_head', 1, 53486128),
	(8198, 'spiritreaver_m-400_head', 1, 808460848),
	(8224, 'harlequin_frame', 2, 858993459),
	(8225, 'valoredge_x-900_frame', 2, 590562084),
	(8226, 'sharpshot_z-500_frame', 2, 590623779),
	(8227, 'stormwaker_y-700_frame', 2, 1127428674),
	(8449, 'strobe', 3, 1),
	(8450, 'tension_spring', 3, 2),
	(8451, 'inhibitor', 3, 1),
	(8452, 'tension_spring_ii', 3, 3),
	(8453, 'attuner', 3, 2),
	(8454, 'reactive_shield', 3, 2),
	(8455, 'flame_holder', 3, 1),
	(8456, 'heat_capacitor', 3, 2),
	(8457, 'strobe_ii', 3, 2),
	(8458, 'tension_spring_iii', 3, 4),
	(8481, 'mana_booster', 3, 32),
	(8482, 'loudspeaker', 3, 32),
	(8483, 'scanner', 3, 16),
	(8484, 'loudspeaker_ii', 3, 48),
	(8485, 'tactical_processor', 3, 32),
	(8486, 'tranquilizer', 3, 32),
	(8487, 'ice_maker', 3, 16),
	(8488, 'power_cooler', 3, 32),
	(8489, 'loudspeaker_iii', 3, 64),
	(8490, 'tranquilizer_ii', 3, 48),
	(8513, 'accelerator', 3, 512),
	(8514, 'scope', 3, 512),
	(8515, 'pattern_reader', 3, 256),
	(8516, 'accelerator_ii', 3, 768),
	(8517, 'drum_magazine', 3, 512),
	(8518, 'turbo_charger', 3, 512),
	(8519, 'replicator', 3, 256),
	(8520, 'barrage_turbine', 3, 768),
	(8521, 'turbo_charger_ii', 3, 768),
	(8522, 'accelerator_iii', 3, 1024),
	(8523, 'scope_ii', 3, 512),
	(8545, 'shock_absorber', 3, 4096),
	(8546, 'armor_plate', 3, 8192),
	(8547, 'analyzer', 3, 4096),
	(8548, 'armor_plate_ii', 3, 12288),
	(8549, 'equalizer', 3, 8192),
	(8550, 'schurzen', 3, 8192),
	(8551, 'hammermill', 3, 4096),
	(8552, 'barrier_module', 3, 8192),
	(8553, 'shock_absorber_ii', 3, 8192),
	(8554, 'armor_plate_iii', 3, 16384),
	(8577, 'stabilizer', 3, 131072),
	(8578, 'volt_gun', 3, 131072),
	(8579, 'heat_seeker', 3, 65536),
	(8580, 'stabilizer_ii', 3, 196608),
	(8581, 'target_marker', 3, 131072),
	(8582, 'dynamo', 3, 131072),
	(8583, 'coiler', 3, 131072),
	(8584, 'galvanizer', 3, 131072),
	(8585, 'stabilizer_iii', 3, 262144),
	(8586, 'coiler_ii', 3, 196608),
	(8609, 'mana_jammer', 3, 2097152),
	(8610, 'heatsink', 3, 1048576),
	(8611, 'stealth_screen', 3, 1048576),
	(8612, 'mana_jammer_ii', 3, 3145728),
	(8613, 'mana_channeler', 3, 2097152),
	(8614, 'condenser', 3, 1048576),
	(8615, 'steam_jacket', 3, 1048576),
	(8616, 'percolator', 3, 1048576),
	(8617, 'mana_jammer_iii', 3, 4194304),
	(8618, 'stealth_screen_ii', 3, 2097152),
	(8641, 'auto-repair_kit', 3, 33554432),
	(8642, 'flashbulb', 3, 33554432),
	(8643, 'damage_gauge', 3, 16777216),
	(8644, 'auto-repair_kit_ii', 3, 50331648),
	(8645, 'eraser', 3, 33554432),
	(8646, 'optic_fiber', 3, 16777216),
	(8648, 'vivi-valve', 3, 33554432),
	(8649, 'vivi-valve_ii', 3, 50331648),
	(8650, 'auto-repair_kit_iii', 3, 67108864),
	(8673, 'mana_tank', 3, 536870912),
	(8674, 'mana_converter', 3, 536870912),
	(8675, 'mana_conserver', 3, 268435456),
	(8676, 'mana_tank_ii', 3, 805306368),
	(8677, 'smoke_screen', 3, 536870912),
	(8678, 'economizer', 3, 268435456),
	(8680, 'disruptor', 3, 536870912),
	(8681, 'mana_tank_iii', 3, 1073741824);
/*!40000 ALTER TABLE `item_puppet` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
