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

-- Dumping structure for table dspdb.char_points
CREATE TABLE IF NOT EXISTS `char_points` (
  `charid` int(10) NOT NULL,
  `sandoria_cp` int(10) unsigned NOT NULL DEFAULT '0',
  `bastok_cp` int(10) unsigned NOT NULL DEFAULT '0',
  `windurst_cp` int(10) unsigned NOT NULL DEFAULT '0',
  `sandoria_supply` int(10) unsigned NOT NULL DEFAULT '0',
  `bastok_supply` int(10) unsigned NOT NULL DEFAULT '0',
  `windurst_supply` int(10) unsigned NOT NULL DEFAULT '0',
  `beastman_seal` int(10) unsigned NOT NULL DEFAULT '0',
  `kindred_seal` smallint(5) unsigned NOT NULL DEFAULT '0',
  `kindred_crest` smallint(5) unsigned NOT NULL DEFAULT '0',
  `high_kindred_crest` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sacred_kindred_crest` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ancient_beastcoin` smallint(5) unsigned NOT NULL DEFAULT '0',
  `valor_point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scyld` smallint(5) unsigned NOT NULL DEFAULT '0',
  `guild_fishing` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_woodworking` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_smithing` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_goldsmithing` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_weaving` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_leathercraft` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_bonecraft` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_alchemy` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_cooking` int(10) unsigned NOT NULL DEFAULT '0',
  `cinder` int(10) unsigned NOT NULL DEFAULT '0',
  `fire_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ice_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `wind_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `earth_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `lightning_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `water_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `light_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `dark_fewell` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ballista_point` int(10) unsigned NOT NULL DEFAULT '0',
  `fellow_point` int(10) unsigned NOT NULL DEFAULT '0',
  `chocobuck_sandoria` smallint(4) unsigned NOT NULL DEFAULT '0',
  `chocobuck_bastok` smallint(4) unsigned NOT NULL DEFAULT '0',
  `chocobuck_windurst` smallint(4) unsigned NOT NULL DEFAULT '0',
  `research_mark` int(10) unsigned NOT NULL DEFAULT '0',
  `tunnel_worm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `morion_worm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `phantom_worm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `moblin_marble` int(10) unsigned NOT NULL DEFAULT '0',
  `infamy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `prestige` smallint(5) unsigned NOT NULL DEFAULT '0',
  `legion_point` int(10) unsigned NOT NULL DEFAULT '0',
  `spark_of_eminence` int(10) unsigned NOT NULL DEFAULT '0',
  `shining_star` int(10) unsigned NOT NULL DEFAULT '0',
  `imperial_standing` int(10) unsigned NOT NULL DEFAULT '0',
  `runic_portal` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `leujaoam_assault_point` int(10) unsigned NOT NULL DEFAULT '0',
  `mamool_assault_point` int(10) unsigned NOT NULL DEFAULT '0',
  `lebros_assault_point` int(10) unsigned NOT NULL DEFAULT '0',
  `periqia_assault_point` int(10) unsigned NOT NULL DEFAULT '0',
  `ilrusi_assault_point` int(10) unsigned NOT NULL DEFAULT '0',
  `nyzul_isle_assault_point` int(10) unsigned NOT NULL DEFAULT '0',
  `zeni_point` int(10) unsigned NOT NULL DEFAULT '0',
  `jetton` int(10) unsigned NOT NULL DEFAULT '0',
  `therion_ichor` int(10) unsigned NOT NULL DEFAULT '0',
  `maw` int(10) unsigned NOT NULL DEFAULT '0',
  `past_sandoria_tp` int(10) unsigned NOT NULL DEFAULT '0',
  `past_bastok_tp` int(10) unsigned NOT NULL DEFAULT '0',
  `past_windurst_tp` int(10) unsigned NOT NULL DEFAULT '0',
  `allied_notes` int(10) unsigned NOT NULL DEFAULT '0',
  `bayld` int(10) unsigned NOT NULL DEFAULT '0',
  `kinetic_unit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `obsidian_fragment` int(10) unsigned NOT NULL DEFAULT '0',
  `lebondopt_wing` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pulchridopt_wing` smallint(5) unsigned NOT NULL DEFAULT '0',
  `mweya_plasm` int(10) unsigned NOT NULL DEFAULT '0',
  `cruor` int(10) unsigned NOT NULL DEFAULT '0',
  `resistance_credit` int(10) unsigned NOT NULL DEFAULT '0',
  `dominion_note` int(10) unsigned NOT NULL DEFAULT '0',
  `fifth_echelon_trophy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fourth_echelon_trophy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `third_echelon_trophy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `second_echelon_trophy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `first_echelon_trophy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cave_points` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `op_credits` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `traverser_stones` int(10) unsigned NOT NULL DEFAULT '0',
  `voidstones` int(10) unsigned NOT NULL DEFAULT '0',
  `kupofried_corundums` int(10) unsigned NOT NULL DEFAULT '0',
  `imprimaturs` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pheromone_sacks` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table dspdb.char_points: 3 rows
/*!40000 ALTER TABLE `char_points` DISABLE KEYS */;
REPLACE INTO `char_points` (`charid`, `sandoria_cp`, `bastok_cp`, `windurst_cp`, `sandoria_supply`, `bastok_supply`, `windurst_supply`, `beastman_seal`, `kindred_seal`, `kindred_crest`, `high_kindred_crest`, `sacred_kindred_crest`, `ancient_beastcoin`, `valor_point`, `scyld`, `guild_fishing`, `guild_woodworking`, `guild_smithing`, `guild_goldsmithing`, `guild_weaving`, `guild_leathercraft`, `guild_bonecraft`, `guild_alchemy`, `guild_cooking`, `cinder`, `fire_fewell`, `ice_fewell`, `wind_fewell`, `earth_fewell`, `lightning_fewell`, `water_fewell`, `light_fewell`, `dark_fewell`, `ballista_point`, `fellow_point`, `chocobuck_sandoria`, `chocobuck_bastok`, `chocobuck_windurst`, `research_mark`, `tunnel_worm`, `morion_worm`, `phantom_worm`, `moblin_marble`, `infamy`, `prestige`, `legion_point`, `spark_of_eminence`, `shining_star`, `imperial_standing`, `runic_portal`, `leujaoam_assault_point`, `mamool_assault_point`, `lebros_assault_point`, `periqia_assault_point`, `ilrusi_assault_point`, `nyzul_isle_assault_point`, `zeni_point`, `jetton`, `therion_ichor`, `maw`, `past_sandoria_tp`, `past_bastok_tp`, `past_windurst_tp`, `allied_notes`, `bayld`, `kinetic_unit`, `obsidian_fragment`, `lebondopt_wing`, `pulchridopt_wing`, `mweya_plasm`, `cruor`, `resistance_credit`, `dominion_note`, `fifth_echelon_trophy`, `fourth_echelon_trophy`, `third_echelon_trophy`, `second_echelon_trophy`, `first_echelon_trophy`, `cave_points`, `id_tags`, `op_credits`, `traverser_stones`, `voidstones`, `kupofried_corundums`, `imprimaturs`, `pheromone_sacks`) VALUES
	(21828, 67728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21829, 0, 0, 0, 12582880, 12582880, 12582880, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21830, 0, 0, 0, 12582880, 12582880, 12582880, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `char_points` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
