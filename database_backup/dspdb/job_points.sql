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

-- Dumping structure for table dspdb.job_points
CREATE TABLE IF NOT EXISTS `job_points` (
  `job_pointid` smallint(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL,
  `upgrade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jobs` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.job_points: 217 rows
/*!40000 ALTER TABLE `job_points` DISABLE KEYS */;
INSERT INTO `job_points` (`job_pointid`, `name`, `upgrade`, `jobs`) VALUES
	(64, 'mighty_strikes_effect', 2, 1),
	(66, 'berserk_effect', 4, 1),
	(68, 'brazen_rush_effect', 2, 1),
	(70, 'defender_effect', 3, 1),
	(72, 'warcry_effect', 3, 1),
	(74, 'aggressor_effect', 1, 1),
	(76, 'retaliation_effect', 1, 1),
	(78, 'restraint_effect', 2, 1),
	(80, 'blood_rage_effect', 1, 1),
	(82, 'double_attack_effect', 1, 1),
	(128, 'hundred_fists_effect', 2, 2),
	(130, 'dodge_effect', 2, 2),
	(132, 'inner_strength_effect', 2, 2),
	(134, 'focus_effect', 2, 1),
	(136, 'chakra_effect', 1, 2),
	(138, 'counterstance_effect', 2, 2),
	(140, 'footwork_effect', 1, 2),
	(142, 'perfect_counter_effect', 1, 2),
	(144, 'impetus_effect', 2, 2),
	(146, 'kick_attacks_effect', 2, 2),
	(192, 'benediction_effect', 1, 3),
	(194, 'divine_seal_effect', 3, 3),
	(196, 'asylum_effect', 4, 3),
	(198, 'magic_accuracy_bonus', 1, 3),
	(200, 'afflatus_solace_effect', 2, 3),
	(202, 'afflatus_misery_effect', 2, 3),
	(204, 'divine_caress_duration', 2, 3),
	(206, 'sacrosanctity_effect', 1, 3),
	(208, 'regen_duration', 3, 3),
	(210, 'bar_spell_effect', 2, 3),
	(256, 'manafont_effect', 3, 4),
	(258, 'elemental_seal_effect', 3, 4),
	(260, 'subtle_sorcery_effect', 1, 4),
	(262, 'magic_burst_damage_bonus', 1, 4),
	(264, 'mana_wall_effect', 1, 4),
	(266, 'magic_accuracy_bonus', 1, 4),
	(268, 'enmity_douse_recast', 2, 4),
	(270, 'manawell_effect', 1, 4),
	(272, 'magic_burst_enmity_decrease', 1, 4),
	(274, 'magic_damage_bonus', 1, 4),
	(320, 'chainspell_effect', 2, 5),
	(322, 'convert_effect', 1, 5),
	(324, 'stymie_effect', 1, 5),
	(326, 'magic_accuracy_bonus', 1, 5),
	(328, 'composure_effect', 1, 5),
	(330, 'magic_atk_bonus', 1, 5),
	(332, 'saboteur_effect', 2, 5),
	(334, 'enfeebling_magic_duration', 1, 5),
	(336, 'quick_magic_effect', 2, 5),
	(338, 'enhancing_magic_duration', 1, 5),
	(384, 'perfect_dodge_effect', 3, 6),
	(386, 'sneak_attack_effect', 1, 6),
	(388, 'larceny_duration', 1, 6),
	(390, 'trick_attack_effect', 1, 6),
	(392, 'steal_recast', 2, 6),
	(394, 'mug_effect', 5, 6),
	(396, 'despoil_effect', 2, 6),
	(398, 'conspirator_effect', 1, 6),
	(400, 'bully_effect', 1, 6),
	(402, 'triple_attack_effect', 1, 6),
	(448, 'invincible_effect', 100, 7),
	(450, 'holy_circle_effect', 1, 7),
	(452, 'intervene_effect', 2, 7),
	(454, 'sentinel_effect', 1, 7),
	(456, 'shield_bash_effect', 10, 7),
	(458, 'cover_duration', 1, 7),
	(460, 'divine_emblem_effect', 2, 7),
	(462, 'sepulcher_duration', 1, 7),
	(464, 'palisade_effect', 1, 7),
	(466, 'enlight_effect', 1, 7),
	(512, 'blood_weapon_effect', 2, 8),
	(514, 'arcane_circle_effect', 1, 8),
	(516, 'soul_enslavement_effect', 1, 8),
	(518, 'last_resort_effect', 2, 8),
	(520, 'souleater_duration', 1, 8),
	(522, 'weapon_bash_effect', 1, 8),
	(530, 'arcane_circle_effect', 1, 8),
	(576, 'familiar_effect', 3, 9),
	(578, 'pet_accuracy_bonus', 1, 9),
	(580, 'unleash_effect', 2, 9),
	(582, 'charm_success_rate', 1, 9),
	(584, 'reward_effect', 1, 9),
	(586, 'pet_attack_speed', 1, 9),
	(588, 'ready_effect', 1, 9),
	(590, 'spur_effect', 3, 9),
	(592, 'run_wild_duration', 2, 9),
	(594, 'pet_enmity', 1, 9),
	(640, 'soul_voice_effect', 2, 10),
	(642, 'minne_effect', 1, 10),
	(644, 'clarion_call_effect', 2, 10),
	(646, 'minuet_effect', 1, 10),
	(648, 'pianissimo_effect', 2, 10),
	(650, 'song_accuracy_bonus', 1, 10),
	(652, 'tenuto_effect', 2, 10),
	(654, 'lullaby_duration', 1, 10),
	(656, 'marcato_effect', 1, 10),
	(658, 'requiem_effect', 3, 10),
	(704, 'eagle_eye_shot_effect', 3, 11),
	(706, 'sharpshot_effect', 2, 11),
	(708, 'overkill_effect', 1, 11),
	(710, 'camouflage_effect', 1, 11),
	(712, 'barrage_effect', 3, 11),
	(714, 'shadowbind_duration', 1, 11),
	(716, 'velocity_shot_effect', 2, 11),
	(718, 'double_shot_effect', 1, 11),
	(720, 'decoy_shot_effect', 1, 11),
	(722, 'unlimited_shot_effect', 1, 11),
	(768, 'meikyo_shisui_effect', 2, 12),
	(770, 'warding_circle_effect', 1, 12),
	(772, 'yaegasumi_effect', 30, 12),
	(774, 'hasso_effect', 1, 12),
	(776, 'meditate_effect', 5, 12),
	(778, 'seigan_effect', 3, 12),
	(780, 'konzen-ittai_effect', 1, 12),
	(782, 'hamanoha_duration', 1, 12),
	(784, 'hagakure_effect', 1, 12),
	(786, 'zanshin_effect', 1, 12),
	(832, 'mijin_gakure_effect', 3, 13),
	(834, 'yonin_effect', 2, 13),
	(836, 'mikage_effect', 3, 13),
	(838, 'innin_effect', 1, 13),
	(840, 'ninjutsu_accuracy_bonus', 1, 13),
	(842, 'ninjutsu_cast_time', 1, 13),
	(844, 'futae_effect', 5, 13),
	(846, 'elemental_ninjutsu_effect', 13, 2),
	(848, 'issekigan_effect', 1, 13),
	(850, 'tactical_parry_effect', 1, 13),
	(896, 'spirit_surge_effect', 1, 14),
	(898, 'ancient_circle_effect', 1, 14),
	(900, 'fly_high_effect', 5, 14),
	(902, 'jump_effect', 3, 14),
	(904, 'spirit_link_effect', 1, 14),
	(906, 'wyvern_max_hp_bonus', 10, 14),
	(908, 'dragon_breaker_duration', 10, 14),
	(910, 'wyvern_breath_effect', 14, 1),
	(912, 'high_jump_effect', 3, 14),
	(914, 'wyvern_attr_Increase_effect', 10, 14),
	(960, 'astral_flow_effect', 5, 15),
	(962, 'spirit_accuracy_bonus', 1, 15),
	(964, 'astral_conduit_effect', 1, 15),
	(966, 'spirit_mag_acc_bonus', 1, 15),
	(968, 'elemental_siphon_effect', 3, 175),
	(970, 'spirit_physical_attack', 2, 15),
	(972, 'mana_cede_effect', 50, 15),
	(974, 'avatars_favor_effect', 3, 15),
	(976, 'spirit_mag_damage', 5, 15),
	(978, 'blood_pact_damage', 3, 15),
	(1024, 'azure_lore_effect', 1, 16),
	(1026, 'blue_magic_point_bonus', 1, 16),
	(1028, 'unbridled_wisdom_effect', 3, 16),
	(1030, 'burst_affinity_bonus', 2, 16),
	(1032, 'chain_affinity_effect', 1, 16),
	(1034, 'phys_blue_magic_effect_acc', 1, 16),
	(1036, 'unbridled_learning _effect', 1, 16),
	(1038, 'unbridled_learning _effect_ii', 1, 16),
	(1040, 'efflux_effect', 1, 16),
	(1042, 'magic_accuracy_bonus', 1, 16),
	(1088, 'wild_card_effect', 1, 17),
	(1090, 'phantom_roll_duration', 2, 17),
	(1092, 'cut_card_effect', 1, 17),
	(1094, 'bust_evasion', 1, 17),
	(1096, 'quick_draw_effect', 2, 17),
	(1098, 'ammo_consumption', 1, 17),
	(1100, 'random_deal_effect', 2, 17),
	(1102, 'ranged_accuracy_bonus', 1, 17),
	(1104, 'triple_shot_effect', 1, 17),
	(1106, 'optimal_range_effect', 1, 17),
	(1152, 'overdrive_effect', 5, 18),
	(1154, 'automaton_hp_and_mp_Bonus', 10, 18),
	(1156, 'heady_artifice_effect', 3, 18),
	(1158, 'activate_effect', 1, 18),
	(1160, 'repair_effect', 3, 18),
	(1162, 'deus_ex_automata_recast', 1, 18),
	(1164, 'tactical_switch', 1, 18),
	(1166, 'cooldown_effect', 1, 18),
	(1168, 'deactivate_effect', 0, 18),
	(1170, 'martial_arts_effect', 1, 18),
	(1216, 'trance_effect', 100, 19),
	(1218, 'step_duration', 1, 19),
	(1220, 'grand_pas_effect', 1, 19),
	(1222, 'samba_duration', 1, 19),
	(1224, 'waltz_potency', 2, 19),
	(1226, 'flourish_i_effect', 10, 19),
	(1228, 'jig_Duration', 1, 19),
	(1230, 'flourish_ii_effect', 2, 19),
	(1232, 'flourishes_iii_effect', 1, 19),
	(1234, 'contradance_effect', 3, 19),
	(1280, 'tabula_rasa_effect', 2, 20),
	(1282, 'light_arts_effect', 3, 20),
	(1284, 'caper_emissarius_effect', 2, 20),
	(1286, 'dark_arts_effect', 3, 20),
	(1288, 'stratagem_effect', 1, 20),
	(1290, 'stratagem_effect_ii', 1, 20),
	(1292, 'stratagem_effect_iii', 2, 20),
	(1294, 'stratagem_effect_iv', 2, 20),
	(1296, 'modus_veritas_effect', 1, 21),
	(1298, 'sublimation_effect', 3, 21),
	(1344, 'bolster_effect', 3, 21),
	(1346, 'life_cycle_effect', 1, 21),
	(1348, 'widened_compass_effect', 3, 21),
	(1350, 'blaze_of_glory_effect', 1, 21),
	(1352, 'magic_atk_bonus', 1, 21),
	(1354, 'magic_accuracy_bonus', 1, 21),
	(1356, 'dematerialize_duration', 1, 21),
	(1358, 'theurgic_focus_effect', 3, 21),
	(1360, 'concentric_pulse_effect', 1, 21),
	(1362, 'indicolure_spell_effect_dur', 2, 21),
	(1408, 'elemental_sforzo_effect', 2, 22),
	(1410, 'rune_enchantment_effect', 1, 22),
	(1412, 'odyllic_subterfuge_effect', 2, 22),
	(1414, 'vallation_duration', 1, 22),
	(1416, 'swordplay_effect', 1, 22),
	(1418, 'swipe_effect', 1, 22),
	(1420, 'embolden_effect', 1, 22),
	(1422, 'vivacious_pulse', 1, 22),
	(1424, 'one_for_all_effect_duration', 1, 22),
	(1426, 'gambit_effect_duration', 1, 22);
/*!40000 ALTER TABLE `job_points` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
