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

-- Dumping structure for table dspdb.status_effects
CREATE TABLE IF NOT EXISTS `status_effects` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `flags` int(8) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `negative_id` smallint(5) unsigned DEFAULT '0',
  `overwrite` smallint(5) unsigned NOT NULL DEFAULT '0',
  `block_id` smallint(5) unsigned DEFAULT '0',
  `remove_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `element` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min_duration` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.status_effects: 597 rows
/*!40000 ALTER TABLE `status_effects` DISABLE KEYS */;
INSERT INTO `status_effects` (`id`, `name`, `flags`, `type`, `negative_id`, `overwrite`, `block_id`, `remove_id`, `element`, `min_duration`) VALUES
	(0, 'ko', 0, 0, 0, 0, 0, 0, 0, 0),
	(1, 'weakness', 0, 0, 0, 3, 0, 0, 0, 1),
	(2, 'sleep', 48, 2, 19, 2, 193, 0, 8, 1),
	(3, 'poison', 16416, 0, 0, 2, 0, 0, 3, 1),
	(4, 'paralysis', 16416, 0, 0, 1, 0, 0, 5, 1),
	(5, 'blindness', 16416, 0, 0, 1, 0, 0, 8, 1),
	(6, 'silence', 16416, 0, 0, 2, 0, 0, 4, 1),
	(7, 'petrification', 32, 7, 0, 2, 10, 0, 2, 1),
	(8, 'disease', 20512, 8, 0, 2, 0, 0, 1, 1),
	(9, 'curse', 16416, 9, 0, 2, 0, 0, 8, 1),
	(10, 'stun', 34, 0, 0, 2, 7, 0, 6, 1),
	(11, 'bind', 16418, 0, 0, 2, 0, 0, 5, 1),
	(12, 'weight', 16418, 0, 32, 1, 0, 0, 4, 1),
	(13, 'slow', 16418, 0, 33, 1, 0, 0, 2, 1),
	(14, 'charm', 32, 0, 0, 2, 0, 0, 3, 1),
	(15, 'doom', 32, 0, 0, 2, 0, 0, 8, 1),
	(16, 'amnesia', 32, 0, 0, 2, 0, 0, 1, 1),
	(17, 'charm', 32, 0, 0, 2, 0, 0, 3, 1),
	(18, 'gradual_petrification', 32, 7, 0, 2, 0, 0, 2, 1),
	(19, 'sleep', 48, 2, 0, 2, 0, 0, 8, 1),
	(20, 'curse', 4128, 9, 0, 2, 0, 0, 8, 1),
	(21, 'addle', 16418, 0, 0, 2, 0, 0, 1, 1),
	(22, 'intimidate', 32, 0, 0, 2, 0, 0, 0, 1),
	(23, 'kaustra', 32, 0, 228, 0, 0, 0, 0, 1),
	(28, 'terror', 32, 7, 0, 0, 0, 0, 8, 1),
	(29, 'mute', 32, 0, 0, 2, 0, 6, 4, 1),
	(30, 'bane', 16416, 0, 0, 2, 0, 9, 8, 1),
	(31, 'plague', 20512, 8, 0, 2, 0, 0, 1, 1),
	(32, 'flee', 33, 0, 12, 0, 0, 0, 4, 0),
	(33, 'haste', 33, 0, 13, 0, 0, 0, 4, 0),
	(34, 'blaze_spikes', 33, 34, 0, 0, 0, 0, 1, 0),
	(35, 'ice_spikes', 33, 34, 0, 0, 0, 0, 5, 0),
	(36, 'blink', 33, 36, 0, 1, 66, 0, 4, 0),
	(37, 'stoneskin', 33, 0, 0, 2, 0, 0, 2, 0),
	(38, 'shock_spikes', 33, 34, 0, 0, 0, 0, 6, 0),
	(39, 'aquaveil', 33, 0, 0, 0, 0, 0, 3, 0),
	(40, 'protect', 33, 0, 0, 0, 0, 0, 7, 0),
	(41, 'shell', 33, 0, 0, 0, 0, 0, 7, 0),
	(42, 'regen', 33, 0, 0, 0, 0, 0, 7, 0),
	(43, 'refresh', 33, 0, 0, 0, 0, 0, 7, 0),
	(44, 'mighty_strikes', 32, 0, 0, 0, 0, 0, 1, 0),
	(45, 'boost', 37, 0, 0, 0, 0, 0, 1, 0),
	(46, 'hundred_fists', 32, 0, 0, 0, 0, 0, 6, 0),
	(47, 'manafont', 32, 0, 0, 0, 0, 0, 3, 0),
	(48, 'chainspell', 32, 0, 0, 0, 0, 0, 6, 0),
	(49, 'perfect_dodge', 32, 0, 0, 0, 0, 0, 4, 0),
	(50, 'invincible', 32, 0, 0, 0, 0, 0, 2, 0),
	(51, 'blood_weapon', 32, 94, 0, 0, 0, 0, 8, 0),
	(52, 'soul_voice', 32, 0, 0, 0, 0, 0, 7, 0),
	(53, 'eagle_eye_shot', 32, 0, 0, 0, 0, 0, 6, 0),
	(54, 'meikyo_shisui', 32, 0, 0, 0, 0, 0, 6, 0),
	(55, 'astral_flow', 32, 0, 0, 0, 0, 0, 6, 0),
	(56, 'berserk', 33, 56, 0, 0, 0, 0, 1, 0),
	(57, 'defender', 33, 56, 0, 0, 0, 0, 2, 0),
	(58, 'aggressor', 33, 0, 0, 0, 0, 0, 0, 0),
	(59, 'focus', 33, 0, 0, 0, 0, 0, 0, 0),
	(60, 'dodge', 33, 0, 0, 0, 0, 0, 0, 0),
	(61, 'counterstance', 33, 0, 0, 0, 0, 0, 0, 0),
	(62, 'sentinel', 33, 0, 0, 0, 0, 0, 0, 0),
	(63, 'souleater', 32, 0, 0, 0, 0, 0, 0, 0),
	(64, 'last_resort', 33, 0, 0, 0, 0, 0, 0, 0),
	(65, 'sneak_attack', 37, 0, 0, 0, 0, 0, 0, 0),
	(66, 'copy_image', 33, 0, 0, 0, 0, 36, 4, 0),
	(67, 'third_eye', 33, 0, 0, 0, 0, 0, 0, 0),
	(68, 'warcry', 33, 0, 0, 0, 0, 0, 0, 0),
	(69, 'invisible', 3429, 0, 0, 2, 0, 0, 4, 0),
	(70, 'deodorize', 2341, 0, 0, 2, 0, 0, 4, 0),
	(71, 'sneak', 2341, 0, 0, 2, 0, 0, 4, 0),
	(72, 'sharpshot', 33, 0, 0, 0, 0, 0, 0, 0),
	(73, 'barrage', 33, 73, 0, 0, 0, 0, 0, 0),
	(74, 'holy_circle', 33, 0, 0, 0, 0, 0, 0, 0),
	(75, 'arcane_circle', 33, 0, 0, 0, 0, 0, 0, 0),
	(76, 'hide', 3429, 0, 0, 0, 0, 0, 0, 0),
	(77, 'camouflage', 3429, 0, 0, 0, 0, 0, 0, 0),
	(78, 'divine_seal', 161, 0, 0, 0, 0, 0, 0, 0),
	(79, 'elemental_seal', 161, 0, 0, 0, 0, 0, 0, 0),
	(80, 'str_boost', 33, 0, 136, 0, 0, 0, 1, 0),
	(81, 'dex_boost', 33, 0, 137, 0, 0, 0, 6, 0),
	(82, 'vit_boost', 33, 0, 138, 0, 0, 0, 2, 0),
	(83, 'agi_boost', 33, 0, 139, 0, 0, 0, 4, 0),
	(84, 'int_boost', 33, 0, 140, 0, 0, 0, 5, 0),
	(85, 'mnd_boost', 33, 0, 141, 0, 0, 0, 3, 0),
	(86, 'chr_boost', 33, 0, 142, 0, 0, 0, 7, 0),
	(87, 'trick_attack', 37, 0, 0, 0, 0, 0, 0, 0),
	(88, 'max_hp_boost', 33, 0, 144, 0, 0, 0, 7, 0),
	(89, 'max_mp_boost', 33, 0, 145, 0, 0, 0, 8, 0),
	(90, 'accuracy_boost', 33, 0, 146, 0, 0, 0, 6, 0),
	(91, 'attack_boost', 33, 0, 147, 0, 0, 0, 1, 0),
	(92, 'evasion_boost', 33, 0, 148, 0, 0, 0, 4, 0),
	(93, 'defense_boost', 33, 0, 149, 0, 0, 0, 2, 0),
	(94, 'enfire', 33, 94, 51, 0, 0, 0, 1, 0),
	(95, 'enblizzard', 33, 94, 51, 0, 0, 0, 5, 0),
	(96, 'enaero', 33, 94, 51, 0, 0, 0, 4, 0),
	(97, 'enstone', 33, 94, 51, 0, 0, 0, 2, 0),
	(98, 'enthunder', 33, 94, 51, 0, 0, 0, 6, 0),
	(99, 'enwater', 33, 94, 51, 0, 0, 0, 3, 0),
	(100, 'barfire', 33, 100, 0, 0, 0, 0, 3, 0),
	(101, 'barblizzard', 33, 100, 0, 0, 0, 0, 1, 0),
	(102, 'baraero', 33, 100, 0, 0, 0, 0, 5, 0),
	(103, 'barstone', 33, 100, 0, 0, 0, 0, 4, 0),
	(104, 'barthunder', 33, 100, 0, 0, 0, 0, 2, 0),
	(105, 'barwater', 33, 100, 0, 0, 0, 0, 6, 0),
	(106, 'barsleep', 33, 106, 0, 0, 0, 0, 7, 0),
	(107, 'barpoison', 33, 106, 0, 0, 0, 0, 6, 0),
	(108, 'barparalyze', 33, 106, 0, 0, 0, 0, 1, 0),
	(109, 'barblind', 33, 106, 0, 0, 0, 0, 7, 0),
	(110, 'barsilence', 33, 106, 0, 0, 0, 0, 5, 0),
	(111, 'barpetrify', 33, 106, 0, 0, 0, 0, 4, 0),
	(112, 'barvirus', 33, 106, 0, 0, 0, 0, 3, 0),
	(113, 'reraise', 33, 0, 0, 0, 0, 0, 7, 0),
	(114, 'cover', 32, 0, 0, 0, 0, 0, 0, 0),
	(115, 'unlimited_shot', 32, 73, 0, 0, 0, 0, 0, 0),
	(116, 'phalanx', 33, 0, 0, 0, 0, 0, 7, 0),
	(117, 'warding_circle', 33, 0, 0, 0, 0, 0, 0, 0),
	(118, 'ancient_circle', 33, 0, 0, 0, 0, 0, 0, 0),
	(119, 'str_boost', 33, 0, 0, 0, 0, 0, 1, 0),
	(120, 'dex_boost', 33, 0, 0, 0, 0, 0, 6, 0),
	(121, 'vit_boost', 33, 0, 0, 0, 0, 0, 2, 0),
	(122, 'agi_boost', 33, 0, 0, 0, 0, 0, 4, 0),
	(123, 'int_boost', 33, 0, 0, 0, 0, 0, 5, 0),
	(124, 'mnd_boost', 33, 0, 0, 0, 0, 0, 3, 0),
	(125, 'chr_boost', 33, 0, 0, 0, 0, 0, 7, 0),
	(126, 'spirit_surge', 32, 0, 0, 0, 0, 0, 0, 0),
	(127, 'costume', 164, 0, 0, 0, 0, 0, 0, 0),
	(128, 'burn', 16418, 0, 0, 0, 133, 129, 1, 0),
	(129, 'frost', 16418, 0, 0, 0, 128, 130, 5, 0),
	(130, 'choke', 16418, 0, 0, 0, 129, 131, 4, 0),
	(131, 'rasp', 16418, 0, 0, 0, 130, 132, 2, 0),
	(132, 'shock', 16418, 0, 0, 0, 131, 133, 6, 0),
	(133, 'drown', 16418, 0, 0, 0, 132, 128, 3, 0),
	(134, 'dia', 16418, 0, 135, 0, 0, 0, 7, 0),
	(135, 'bio', 16418, 0, 134, 0, 0, 0, 8, 0),
	(136, 'str_down', 16418, 0, 0, 0, 0, 80, 3, 0),
	(137, 'dex_down', 16418, 0, 0, 0, 0, 81, 2, 0),
	(138, 'vit_down', 16418, 0, 0, 0, 0, 82, 4, 0),
	(139, 'agi_down', 16418, 0, 0, 0, 0, 83, 5, 0),
	(140, 'int_down', 16418, 0, 0, 0, 0, 84, 1, 0),
	(141, 'mnd_down', 16418, 0, 0, 0, 0, 85, 6, 0),
	(142, 'chr_down', 16418, 0, 0, 0, 0, 86, 8, 0),
	(143, 'level_restriction', 0, 0, 0, 0, 0, 0, 0, 0),
	(144, 'max_hp_down', 16418, 0, 0, 0, 0, 88, 8, 0),
	(145, 'max_mp_down', 16418, 0, 0, 0, 0, 89, 7, 0),
	(146, 'accuracy_down', 16418, 0, 0, 0, 0, 90, 2, 0),
	(147, 'attack_down', 16418, 0, 0, 0, 0, 91, 3, 0),
	(148, 'evasion_down', 16418, 0, 0, 0, 0, 92, 5, 0),
	(149, 'defense_down', 16418, 0, 0, 0, 0, 93, 4, 0),
	(150, 'physical_shield', 33, 0, 0, 0, 0, 0, 0, 0),
	(151, 'arrow_shield', 33, 0, 0, 0, 0, 0, 0, 0),
	(152, 'magic_shield', 33, 0, 0, 0, 0, 0, 0, 0),
	(153, 'damage_spikes', 33, 34, 0, 0, 0, 0, 0, 0),
	(154, 'shining_ruby', 33, 0, 0, 0, 0, 0, 0, 0),
	(155, 'medicine', 0, 0, 0, 0, 0, 0, 0, 0),
	(156, 'flash', 16418, 0, 0, 2, 0, 0, 7, 0),
	(157, 'sj_restriction', 0, 0, 0, 0, 0, 0, 0, 0),
	(158, 'provoke', 32, 0, 0, 0, 0, 0, 0, 0),
	(159, 'penalty', 32, 0, 0, 0, 0, 0, 0, 0),
	(160, 'preparations', 32, 0, 0, 0, 0, 0, 0, 0),
	(161, 'sprint', 32, 0, 0, 0, 0, 0, 0, 0),
	(162, 'enchantment', 32, 0, 0, 0, 0, 0, 0, 0),
	(163, 'azure_lore', 32, 0, 0, 0, 0, 0, 0, 0),
	(164, 'chain_affinity', 32, 0, 0, 0, 0, 0, 0, 0),
	(165, 'burst_affinity', 32, 0, 0, 0, 0, 0, 0, 0),
	(166, 'overdrive', 32, 0, 0, 0, 0, 0, 0, 0),
	(167, 'magic_def_down', 16418, 0, 0, 0, 0, 0, 0, 0),
	(168, 'inhibit_tp', 32, 0, 0, 0, 0, 0, 8, 0),
	(169, 'potency', 32, 0, 0, 0, 0, 0, 0, 0),
	(170, 'regain', 32, 0, 0, 0, 0, 0, 7, 0),
	(171, 'pax', 32, 0, 0, 0, 0, 0, 0, 0),
	(172, 'intension', 32, 0, 0, 0, 0, 0, 0, 0),
	(173, 'dread_spikes', 33, 34, 0, 0, 0, 0, 0, 0),
	(174, 'magic_acc_down', 16418, 0, 0, 0, 0, 0, 1, 0),
	(175, 'magic_atk_down', 16418, 0, 0, 0, 0, 0, 2, 0),
	(176, 'quickening', 164, 0, 0, 0, 0, 0, 0, 0),
	(177, 'encumbrance', 32, 0, 0, 0, 0, 0, 0, 0),
	(178, 'firestorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(179, 'hailstorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(180, 'windstorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(181, 'sandstorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(182, 'thunderstorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(183, 'rainstorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(184, 'aurorastorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(185, 'voidstorm', 32, 0, 0, 0, 0, 0, 0, 0),
	(186, 'helix', 32, 0, 0, 0, 0, 0, 0, 0),
	(187, 'sublimation_activated', 32, 0, 0, 0, 0, 0, 0, 0),
	(188, 'sublimation_complete', 32, 0, 0, 0, 0, 0, 0, 0),
	(189, 'max_tp_down', 16418, 0, 0, 0, 0, 0, 8, 0),
	(190, 'magic_atk_boost', 33, 0, 0, 0, 0, 0, 5, 0),
	(191, 'magic_def_boost', 33, 0, 0, 0, 0, 0, 3, 0),
	(192, 'requiem', 65568, 0, 0, 1, 0, 0, 7, 0),
	(193, 'lullaby', 65584, 2, 19, 2, 2, 0, 7, 0),
	(194, 'elegy', 65570, 0, 0, 1, 0, 0, 2, 0),
	(195, 'paeon', 65825, 0, 0, 4, 0, 0, 7, 0),
	(196, 'ballad', 65825, 0, 0, 4, 0, 0, 7, 0),
	(197, 'minne', 65825, 0, 0, 4, 0, 0, 2, 0),
	(198, 'minuet', 65825, 0, 0, 4, 0, 0, 1, 0),
	(199, 'madrigal', 65825, 0, 0, 4, 0, 0, 6, 0),
	(200, 'prelude', 65825, 0, 0, 4, 0, 0, 0, 0),
	(201, 'mambo', 65825, 0, 0, 4, 0, 0, 0, 0),
	(202, 'aubade', 65825, 0, 0, 4, 0, 0, 0, 0),
	(203, 'pastoral', 65825, 0, 0, 4, 0, 0, 0, 0),
	(204, 'hum', 65824, 0, 0, 4, 0, 0, 0, 0),
	(205, 'fantasia', 65825, 0, 0, 4, 0, 0, 0, 0),
	(206, 'operetta', 65825, 0, 0, 4, 0, 0, 0, 0),
	(207, 'capriccio', 65825, 0, 0, 4, 0, 0, 0, 0),
	(208, 'serenade', 65824, 0, 0, 4, 0, 0, 0, 0),
	(209, 'round', 65825, 0, 0, 4, 0, 0, 0, 0),
	(210, 'gavotte', 65825, 0, 0, 4, 0, 0, 0, 0),
	(211, 'fugue', 65824, 0, 0, 4, 0, 0, 0, 0),
	(212, 'rhapsody', 65824, 0, 0, 4, 0, 0, 0, 0),
	(213, 'aria', 65824, 0, 0, 4, 0, 0, 0, 0),
	(214, 'march', 65825, 0, 0, 4, 0, 0, 0, 0),
	(215, 'etude', 65825, 0, 0, 4, 0, 0, 0, 0),
	(216, 'carol', 65825, 0, 0, 4, 0, 0, 0, 0),
	(217, 'threnody', 66080, 0, 0, 1, 0, 0, 0, 0),
	(218, 'hymnus', 65824, 0, 0, 4, 0, 0, 0, 0),
	(219, 'mazurka', 65824, 0, 0, 0, 0, 0, 0, 0),
	(220, 'sirvente', 288, 0, 0, 4, 0, 0, 0, 0),
	(221, 'dirge', 288, 0, 0, 4, 0, 0, 0, 0),
	(222, 'scherzo', 288, 0, 0, 4, 0, 0, 0, 0),
	(223, 'nocturne', 288, 0, 0, 4, 0, 0, 0, 0),
	(227, 'store_tp', 32, 0, 0, 0, 0, 0, 0, 0),
	(228, 'embrava', 32, 0, 23, 0, 0, 0, 0, 0),
	(229, 'manawell', 32, 0, 0, 0, 0, 0, 0, 0),
	(230, 'spontaneity', 32, 0, 0, 0, 0, 0, 0, 0),
	(231, 'marcato', 32, 0, 0, 0, 0, 0, 0, 0),
	(233, 'auto-regen', 32, 0, 0, 4, 0, 0, 0, 0),
	(234, 'auto-refresh', 32, 0, 0, 4, 0, 0, 0, 0),
	(235, 'fishing_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(236, 'woodworking_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(237, 'smithing_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(238, 'goldsmithing_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(239, 'clothcraft_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(240, 'leathercraft_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(241, 'bonecraft_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(242, 'alchemy_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(243, 'cooking_imagery', 262176, 0, 0, 0, 0, 0, 0, 0),
	(244, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0),
	(245, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0),
	(246, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0),
	(247, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0),
	(248, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0),
	(249, 'dedication', 0, 0, 0, 0, 0, 0, 0, 0),
	(250, 'ef_badge', 32, 0, 0, 0, 0, 0, 0, 0),
	(251, 'food', 32800, 0, 0, 2, 0, 0, 0, 0),
	(252, 'chocobo', 164, 0, 0, 0, 0, 0, 0, 0),
	(253, 'signet', 0, 0, 0, 0, 0, 0, 0, 0),
	(254, 'battlefield', 524288, 0, 0, 0, 0, 0, 0, 0),
	(256, 'sanction', 0, 0, 0, 0, 0, 0, 0, 0),
	(257, 'besieged', 0, 0, 0, 0, 0, 0, 0, 0),
	(258, 'illusion', 32, 0, 0, 0, 0, 0, 0, 0),
	(259, 'encumbrance', 32, 0, 0, 0, 0, 0, 0, 0),
	(260, 'obliviscence', 32, 0, 0, 0, 0, 0, 0, 0),
	(261, 'impairment', 32, 0, 0, 0, 0, 0, 0, 0),
	(262, 'omerta', 32, 0, 0, 0, 0, 0, 0, 0),
	(263, 'debilitation', 32, 0, 0, 0, 0, 0, 0, 0),
	(264, 'pathos', 32, 0, 0, 0, 0, 0, 0, 0),
	(265, 'flurry', 32, 0, 0, 0, 0, 0, 0, 0),
	(266, 'concentration', 32, 0, 0, 0, 0, 0, 0, 0),
	(267, 'allied_tags', 524320, 0, 0, 0, 0, 0, 0, 0),
	(268, 'sigil', 32, 0, 0, 0, 0, 0, 0, 0),
	(269, 'level_sync', 0, 0, 0, 0, 0, 0, 0, 0),
	(270, 'aftermath_lv1', 32, 0, 0, 0, 0, 0, 0, 0),
	(271, 'aftermath_lv2', 32, 0, 0, 0, 0, 0, 0, 0),
	(272, 'aftermath_lv3', 32, 0, 0, 0, 0, 0, 0, 0),
	(273, 'aftermath', 32, 0, 0, 0, 0, 0, 0, 0),
	(274, 'enlight', 33, 94, 51, 0, 0, 0, 0, 0),
	(275, 'auspice', 32, 94, 51, 0, 0, 0, 7, 0),
	(276, 'confrontation', 524320, 0, 0, 0, 0, 0, 0, 0),
	(277, 'enfire_ii', 33, 94, 51, 0, 0, 0, 0, 0),
	(278, 'enblizzard_ii', 33, 94, 51, 0, 0, 0, 0, 0),
	(279, 'enaero_ii', 33, 94, 51, 0, 0, 0, 0, 0),
	(280, 'enstone_ii', 33, 94, 51, 0, 0, 0, 0, 0),
	(281, 'enthunder_ii', 33, 94, 51, 0, 0, 0, 0, 0),
	(282, 'enwater_ii', 33, 94, 51, 0, 0, 0, 0, 0),
	(283, 'perfect_defense', 32, 0, 0, 0, 0, 0, 0, 0),
	(284, 'egg', 32, 0, 0, 0, 0, 0, 0, 0),
	(285, 'visitant', 32, 0, 0, 0, 0, 0, 0, 0),
	(286, 'baramnesia', 33, 106, 0, 0, 0, 0, 0, 0),
	(287, 'atma', 32, 0, 0, 0, 0, 0, 0, 0),
	(288, 'endark', 33, 94, 51, 0, 0, 0, 0, 0),
	(289, 'enmity_boost', 32, 0, 0, 0, 0, 0, 1, 0),
	(290, 'subtle_blow_plus', 32, 0, 0, 0, 0, 0, 0, 0),
	(291, 'enmity_down', 16418, 0, 0, 0, 0, 0, 3, 0),
	(292, 'pennant', 524320, 0, 0, 0, 0, 0, 0, 0),
	(293, 'negate_petrify', 289, 0, 0, 0, 7, 0, 0, 0),
	(294, 'negate_terror', 289, 0, 0, 0, 28, 0, 0, 0),
	(295, 'negate_amnesia', 289, 0, 0, 0, 16, 0, 0, 0),
	(296, 'negate_doom', 289, 0, 0, 0, 15, 0, 0, 0),
	(297, 'negate_poison', 289, 0, 0, 0, 3, 0, 0, 0),
	(298, 'critical_hit_evasion_down', 16418, 0, 0, 0, 0, 0, 0, 0),
	(299, 'overload', 32, 0, 0, 0, 0, 0, 0, 0),
	(300, 'fire_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(301, 'ice_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(302, 'wind_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(303, 'earth_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(304, 'thunder_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(305, 'water_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(306, 'light_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(307, 'dark_maneuver', 818, 0, 0, 4, 0, 0, 0, 0),
	(308, 'double-up_chance', 288, 0, 0, 0, 0, 0, 0, 0),
	(309, 'bust', 288, 0, 0, 0, 0, 0, 0, 0),
	(310, 'fighters_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(311, 'monks_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(312, 'healers_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(313, 'wizards_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(314, 'warlocks_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(315, 'rogues_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(316, 'gallants_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(317, 'chaos_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(318, 'beast_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(319, 'choral_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(320, 'hunters_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(321, 'samurai_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(322, 'ninja_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(323, 'drachen_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(324, 'evokers_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(325, 'maguss_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(326, 'corsairs_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(327, 'puppet_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(328, 'dancers_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(329, 'scholars_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(330, 'bolters_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(331, 'casters_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(332, 'coursers_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(333, 'blitzers_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(334, 'tacticians_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(335, 'allies_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(336, 'misers_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(337, 'companions_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(338, 'avengers_roll', 131360, 0, 0, 0, 0, 0, 0, 0),
	(340, 'warriors_charge', 37, 0, 0, 0, 0, 0, 0, 0),
	(341, 'formless_strikes', 32, 0, 0, 0, 0, 0, 0, 0),
	(342, 'assassins_charge', 37, 0, 0, 0, 0, 0, 0, 0),
	(343, 'feint', 32, 0, 0, 0, 0, 0, 0, 0),
	(344, 'fealty', 32, 0, 0, 0, 0, 0, 0, 0),
	(345, 'dark_seal', 161, 0, 0, 0, 0, 0, 0, 0),
	(346, 'diabolic_eye', 32, 0, 0, 0, 0, 0, 0, 0),
	(347, 'nightingale', 32, 0, 0, 0, 0, 0, 0, 0),
	(348, 'troubadour', 32, 0, 0, 0, 0, 0, 0, 0),
	(349, 'killer_instinct', 32, 0, 0, 0, 0, 0, 0, 0),
	(350, 'stealth_shot', 32, 0, 0, 0, 0, 0, 0, 0),
	(351, 'flashy_shot', 32, 0, 0, 0, 0, 0, 0, 0),
	(352, 'sange', 32, 73, 0, 0, 0, 0, 0, 0),
	(353, 'hasso', 33, 353, 0, 0, 0, 0, 0, 0),
	(354, 'seigan', 33, 353, 0, 0, 0, 0, 0, 0),
	(355, 'convergence', 32, 0, 0, 0, 0, 0, 0, 0),
	(356, 'diffusion', 32, 0, 0, 0, 0, 0, 0, 0),
	(357, 'snake_eye', 32, 0, 0, 0, 0, 0, 0, 0),
	(358, 'light_arts', 288, 0, 0, 0, 0, 0, 0, 0),
	(359, 'dark_arts', 288, 0, 0, 0, 0, 0, 0, 0),
	(360, 'penury', 32, 0, 0, 0, 0, 0, 0, 0),
	(361, 'parsimony', 32, 0, 0, 0, 0, 0, 0, 0),
	(362, 'celerity', 32, 0, 0, 0, 0, 0, 0, 0),
	(363, 'alacrity', 32, 0, 0, 0, 0, 0, 0, 0),
	(364, 'rapture', 32, 0, 0, 0, 0, 0, 0, 0),
	(365, 'ebullience', 32, 0, 0, 0, 0, 0, 0, 0),
	(366, 'accession', 32, 0, 0, 0, 0, 0, 0, 0),
	(367, 'manifestation', 32, 0, 0, 0, 0, 0, 0, 0),
	(368, 'drain_samba', 32, 368, 0, 0, 0, 0, 0, 0),
	(369, 'aspir_samba', 32, 368, 0, 0, 0, 0, 0, 0),
	(370, 'haste_samba', 32, 368, 0, 0, 0, 0, 0, 0),
	(371, 'velocity_shot', 32, 0, 0, 0, 0, 0, 0, 0),
	(375, 'building_flourish', 32, 0, 0, 0, 0, 0, 0, 0),
	(376, 'trance', 32, 0, 0, 0, 0, 0, 0, 0),
	(377, 'tabula_rasa', 32, 0, 0, 0, 0, 0, 0, 0),
	(378, 'drain_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(379, 'aspir_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(380, 'haste_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(381, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0),
	(382, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0),
	(383, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0),
	(384, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0),
	(385, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0),
	(386, 'lethargic_daze_1', 32, 0, 0, 0, 0, 0, 0, 0),
	(387, 'lethargic_daze_2', 32, 0, 0, 0, 0, 0, 0, 0),
	(388, 'lethargic_daze_3', 32, 0, 0, 0, 0, 0, 0, 0),
	(389, 'lethargic_daze_4', 32, 0, 0, 0, 0, 0, 0, 0),
	(390, 'lethargic_daze_5', 32, 0, 0, 0, 0, 0, 0, 0),
	(391, 'sluggish_daze_1', 32, 0, 0, 0, 0, 0, 0, 0),
	(392, 'sluggish_daze_2', 32, 0, 0, 0, 0, 0, 0, 0),
	(393, 'sluggish_daze_3', 32, 0, 0, 0, 0, 0, 0, 0),
	(394, 'sluggish_daze_4', 32, 0, 0, 0, 0, 0, 0, 0),
	(395, 'sluggish_daze_5', 32, 0, 0, 0, 0, 0, 0, 0),
	(396, 'weakened_daze_1', 32, 0, 0, 0, 0, 0, 0, 0),
	(397, 'weakened_daze_2', 32, 0, 0, 0, 0, 0, 0, 0),
	(398, 'weakened_daze_3', 32, 0, 0, 0, 0, 0, 0, 0),
	(399, 'weakened_daze_4', 32, 0, 0, 0, 0, 0, 0, 0),
	(400, 'weakened_daze_5', 32, 0, 0, 0, 0, 0, 0, 0),
	(401, 'addendum_white', 288, 0, 0, 0, 0, 0, 0, 0),
	(402, 'addendum_black', 288, 0, 0, 0, 0, 0, 0, 0),
	(403, 'reprisal', 33, 34, 0, 0, 0, 0, 0, 0),
	(404, 'magic_evasion_down', 16418, 0, 0, 0, 0, 0, 0, 0),
	(405, 'retaliation', 32, 0, 0, 0, 0, 0, 0, 0),
	(406, 'footwork', 288, 0, 0, 0, 0, 0, 0, 0),
	(407, 'klimaform', 32, 0, 0, 0, 0, 0, 0, 0),
	(408, 'sekkanoki', 32, 0, 0, 0, 0, 0, 0, 0),
	(409, 'pianissimo', 32, 0, 0, 0, 0, 0, 0, 0),
	(410, 'saber_dance', 32, 0, 0, 0, 0, 0, 0, 0),
	(411, 'fan_dance', 32, 0, 0, 0, 0, 0, 0, 0),
	(412, 'altruism', 32, 0, 0, 0, 0, 0, 0, 0),
	(413, 'focalization', 32, 0, 0, 0, 0, 0, 0, 0),
	(414, 'tranquility', 32, 0, 0, 0, 0, 0, 0, 0),
	(415, 'equanimity', 32, 0, 0, 0, 0, 0, 0, 0),
	(416, 'enlightenment', 32, 0, 0, 0, 0, 0, 0, 0),
	(417, 'afflatus_solace', 289, 0, 0, 0, 0, 0, 0, 0),
	(418, 'afflatus_misery', 289, 0, 0, 0, 0, 0, 0, 0),
	(419, 'composure', 33, 0, 0, 0, 0, 0, 0, 0),
	(420, 'yonin', 289, 420, 0, 0, 0, 0, 0, 0),
	(421, 'innin', 289, 420, 0, 0, 0, 0, 0, 0),
	(422, 'carbuncles_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(423, 'ifrits_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(424, 'shivas_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(425, 'garudas_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(426, 'titans_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(427, 'ramuhs_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(428, 'leviathans_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(429, 'fenrirs_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(430, 'diaboloss_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(431, 'avatars_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(432, 'multi_strikes', 32, 0, 0, 0, 0, 0, 0, 0),
	(433, 'double_shot', 32, 0, 0, 0, 0, 0, 0, 0),
	(434, 'transcendency', 256, 0, 0, 0, 0, 0, 0, 0),
	(435, 'restraint', 32, 0, 0, 0, 0, 0, 0, 0),
	(436, 'perfect_counter', 32, 0, 0, 0, 0, 0, 0, 0),
	(437, 'mana_wall', 32, 0, 0, 0, 0, 0, 0, 0),
	(438, 'divine_emblem', 32, 0, 0, 0, 0, 0, 0, 0),
	(439, 'nether_void', 32, 0, 0, 0, 0, 0, 0, 0),
	(440, 'sengikori', 32, 0, 0, 0, 0, 0, 0, 0),
	(441, 'futae', 32, 0, 0, 0, 0, 0, 0, 0),
	(442, 'presto', 32, 0, 0, 0, 0, 0, 0, 0),
	(443, 'climactic_flourish', 32, 0, 0, 0, 0, 0, 0, 0),
	(444, 'copy_image', 32, 36, 0, 0, 0, 0, 0, 0),
	(445, 'copy_image', 32, 36, 0, 0, 0, 0, 0, 0),
	(446, 'copy_image', 32, 36, 0, 0, 0, 0, 0, 0),
	(447, 'multi_shots', 32, 0, 0, 0, 0, 0, 0, 0),
	(448, 'bewildered_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(449, 'bewildered_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(450, 'bewildered_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(451, 'bewildered_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(452, 'bewildered_daze', 32, 0, 0, 0, 0, 0, 0, 0),
	(453, 'divine_caress', 32, 0, 0, 0, 0, 0, 0, 0),
	(454, 'saboteur', 32, 0, 0, 0, 0, 0, 0, 0),
	(455, 'tenuto', 32, 0, 0, 0, 0, 0, 0, 0),
	(456, 'spur', 32, 0, 0, 0, 0, 0, 0, 0),
	(457, 'efflux', 32, 0, 0, 0, 0, 0, 0, 0),
	(458, 'earthen_armor', 32, 0, 0, 0, 0, 0, 0, 0),
	(459, 'divine_caress', 32, 0, 0, 0, 0, 0, 0, 0),
	(460, 'blood_rage', 32, 0, 0, 0, 0, 0, 0, 0),
	(461, 'impetus', 32, 0, 0, 0, 0, 0, 0, 0),
	(462, 'conspirator', 32, 0, 0, 0, 0, 0, 0, 0),
	(463, 'sepulcher', 32, 0, 0, 0, 0, 0, 0, 0),
	(464, 'arcane_crest', 32, 0, 0, 0, 0, 0, 0, 0),
	(465, 'hamanoha', 32, 0, 0, 0, 0, 0, 0, 0),
	(466, 'dragon_breaker', 32, 0, 0, 0, 0, 0, 0, 0),
	(467, 'triple_shot', 32, 0, 0, 0, 0, 0, 0, 0),
	(468, 'striking_flourish', 32, 0, 0, 0, 0, 0, 0, 0),
	(469, 'perpetuance', 32, 0, 0, 0, 0, 0, 0, 0),
	(470, 'immanence', 32, 0, 0, 0, 0, 0, 0, 0),
	(471, 'migawari', 32, 0, 0, 0, 0, 0, 0, 0),
	(472, 'ternary_flourish', 32, 0, 0, 0, 0, 0, 0, 0),
	(473, 'muddle', 32, 0, 0, 0, 0, 0, 0, 0),
	(474, 'prowess', 768, 0, 0, 0, 0, 0, 0, 0),
	(475, 'voidwatcher', 32, 0, 0, 0, 0, 0, 0, 0),
	(476, 'ensphere', 32, 0, 0, 0, 0, 0, 0, 0),
	(477, 'sacrosanctity', 32, 0, 0, 0, 0, 0, 0, 0),
	(478, 'palisade', 32, 0, 0, 0, 0, 0, 0, 0),
	(479, 'scarlet_delirium', 32, 0, 0, 0, 0, 0, 0, 0),
	(480, 'scarlet_delirium', 32, 0, 0, 0, 0, 0, 0, 0),
	(482, 'decoy_shot', 32, 0, 0, 0, 0, 0, 0, 0),
	(483, 'hagakure', 32, 0, 0, 0, 0, 0, 0, 0),
	(484, 'issekigan', 32, 0, 0, 0, 0, 0, 0, 0),
	(485, 'unbridled_learning', 32, 0, 0, 0, 0, 0, 0, 0),
	(486, 'counter_boost', 32, 0, 0, 0, 0, 0, 0, 0),
	(487, 'endrain', 32, 94, 0, 0, 0, 0, 0, 0),
	(488, 'enaspir', 32, 94, 0, 0, 0, 0, 0, 0),
	(489, 'afterglow', 32, 0, 0, 0, 0, 0, 0, 0),
	(490, 'brazen_rush', 32, 0, 0, 0, 0, 0, 0, 0),
	(491, 'inner_strength', 32, 0, 0, 0, 0, 0, 0, 0),
	(492, 'asylum', 32, 0, 0, 0, 0, 0, 0, 0),
	(493, 'subtle_sorcery', 32, 0, 0, 0, 0, 0, 0, 0),
	(494, 'stymie', 32, 0, 0, 0, 0, 0, 0, 0),
	(496, 'intervene', 32, 0, 0, 0, 0, 0, 0, 0),
	(497, 'soul_enslavement', 32, 0, 0, 0, 0, 0, 0, 0),
	(498, 'unleash', 32, 0, 0, 0, 0, 0, 0, 0),
	(499, 'clarion_call', 32, 0, 0, 0, 0, 0, 0, 0),
	(500, 'overkill', 32, 0, 0, 0, 0, 0, 0, 0),
	(501, 'yaegasumi', 32, 0, 0, 0, 0, 0, 0, 0),
	(502, 'mikage', 32, 0, 0, 0, 0, 0, 0, 0),
	(503, 'fly_high', 32, 0, 0, 0, 0, 0, 0, 0),
	(504, 'astral_conduit', 32, 0, 0, 0, 0, 0, 0, 0),
	(505, 'unbridled_wisdom', 32, 0, 0, 0, 0, 0, 0, 0),
	(507, 'grand_pas', 32, 0, 0, 0, 0, 0, 0, 0),
	(508, 'widened_compass', 32, 0, 0, 0, 0, 0, 0, 0),
	(509, 'odyllic_subterfuge', 32, 0, 0, 0, 0, 0, 0, 0),
	(510, 'ergon_might', 32, 0, 0, 0, 0, 0, 0, 0),
	(511, 'reive_mark', 524320, 0, 0, 0, 0, 0, 0, 0),
	(512, 'ionis', 32, 0, 0, 0, 0, 0, 0, 0),
	(513, 'bolstered', 32, 0, 0, 0, 0, 0, 0, 0),
	(515, 'lasting_emanation', 32, 0, 0, 0, 0, 0, 0, 0),
	(516, 'ecliptic_attrition', 32, 0, 0, 0, 0, 0, 0, 0),
	(517, 'collimated_fervor', 32, 0, 0, 0, 0, 0, 0, 0),
	(518, 'dematerialize', 32, 0, 0, 0, 0, 0, 0, 0),
	(519, 'theurgic_focus', 32, 0, 0, 0, 0, 0, 0, 0),
	(522, 'elemental_sforzo', 32, 0, 0, 0, 0, 0, 0, 0),
	(523, 'ignis', 33, 0, 0, 4, 0, 0, 0, 0),
	(524, 'gelus', 33, 0, 0, 4, 0, 0, 0, 0),
	(525, 'flabra', 33, 0, 0, 4, 0, 0, 0, 0),
	(526, 'tellus', 33, 0, 0, 4, 0, 0, 0, 0),
	(527, 'sulpor', 33, 0, 0, 4, 0, 0, 0, 0),
	(528, 'unda', 33, 0, 0, 4, 0, 0, 0, 0),
	(529, 'lux', 33, 0, 0, 4, 0, 0, 0, 0),
	(530, 'tenebrae', 33, 0, 0, 4, 0, 0, 0, 0),
	(531, 'vallation', 32, 0, 0, 0, 0, 0, 0, 0),
	(532, 'swordplay', 32, 0, 0, 0, 0, 0, 0, 0),
	(533, 'pflug', 32, 0, 0, 0, 0, 0, 0, 0),
	(534, 'emboldened', 32, 0, 0, 0, 0, 0, 0, 0),
	(535, 'valiance', 32, 0, 0, 0, 0, 0, 0, 0),
	(536, 'gambit', 32, 0, 0, 0, 0, 0, 0, 0),
	(537, 'liement', 32, 0, 0, 0, 0, 0, 0, 0),
	(538, 'one_for_all', 32, 0, 0, 0, 0, 0, 0, 0),
	(539, 'regen_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(540, 'poison_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(541, 'refresh_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(542, 'str_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(543, 'dex_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(544, 'vit_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(545, 'agi_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(546, 'int_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(547, 'mnd_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(548, 'chr_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(549, 'attack_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(550, 'defense_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(551, 'magic_atk_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(552, 'magic_def_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(553, 'accuracy_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(554, 'evasion_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(555, 'magic_acc_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(556, 'magic_evasion_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(557, 'attack_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(558, 'defense_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(559, 'magic_atk_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(560, 'magic_def_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(561, 'accuracy_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(562, 'evasion_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(563, 'magic_acc_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(564, 'magic_evasion_down_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(565, 'slow_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(566, 'paralysis_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(567, 'weight_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(568, 'foil', 32, 0, 0, 0, 0, 0, 0, 0),
	(569, 'blaze_of_glory', 32, 0, 0, 0, 0, 0, 0, 0),
	(570, 'battuta', 32, 0, 0, 0, 0, 0, 0, 0),
	(571, 'rayke', 32, 0, 0, 0, 0, 0, 0, 0),
	(572, 'avoidance_down', 32, 0, 0, 0, 0, 0, 0, 0),
	(573, 'deluge_spikes', 32, 0, 0, 0, 0, 0, 0, 0),
	(574, 'fast_cast', 32, 0, 0, 0, 0, 0, 0, 0),
	(575, 'gestation', 32, 0, 0, 0, 0, 0, 0, 0),
	(576, 'doubt', 32, 0, 0, 0, 0, 0, 0, 0),
	(577, 'cait_siths_favor', 32, 0, 0, 0, 0, 0, 0, 0),
	(578, 'fishy_intuition', 32, 0, 0, 0, 0, 0, 0, 0),
	(579, 'commitment', 32, 0, 0, 0, 0, 0, 0, 0),
	(580, 'haste_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(581, 'flurry_ii', 32, 0, 0, 0, 0, 0, 0, 0),
	(768, 'abyssea_str', 256, 0, 0, 0, 0, 0, 1, 0),
	(769, 'abyssea_dex', 256, 0, 0, 0, 0, 0, 6, 0),
	(770, 'abyssea_vit', 256, 0, 0, 0, 0, 0, 2, 0),
	(771, 'abyssea_agi', 256, 0, 0, 0, 0, 0, 4, 0),
	(772, 'abyssea_int', 256, 0, 0, 0, 0, 0, 5, 0),
	(773, 'abyssea_mnd', 256, 0, 0, 0, 0, 0, 3, 0),
	(774, 'abyssea_chr', 256, 0, 0, 0, 0, 0, 7, 0),
	(775, 'abyssea_hp', 256, 0, 0, 0, 0, 0, 7, 0),
	(776, 'abyssea_mp', 256, 0, 0, 0, 0, 0, 8, 0),
	(777, 'prowess_casket_rate', 768, 0, 0, 0, 0, 0, 0, 0),
	(778, 'prowess_skill_rate', 768, 0, 0, 0, 0, 0, 0, 0),
	(779, 'prowess_crystal_yeild', 768, 0, 0, 0, 0, 0, 0, 0),
	(780, 'prowess_th', 768, 0, 0, 0, 0, 0, 0, 0),
	(781, 'prowess_attack_speed', 768, 0, 0, 0, 0, 0, 0, 0),
	(782, 'prowess_hp_mp', 768, 0, 0, 0, 0, 0, 0, 0),
	(783, 'prowess_acc_racc', 768, 0, 0, 0, 0, 0, 0, 0),
	(784, 'prowess_att_ratt', 768, 0, 0, 0, 0, 0, 0, 0),
	(785, 'prowess_macc_matk', 768, 0, 0, 0, 0, 0, 0, 0),
	(786, 'prowess_cure_potency', 768, 0, 0, 0, 0, 0, 0, 0),
	(787, 'prowess_ws_dmg', 768, 0, 0, 0, 0, 0, 0, 0),
	(788, 'prowess_killer', 768, 0, 0, 0, 0, 0, 0, 0),
	(789, 'field_support_food', 32800, 0, 0, 2, 0, 0, 0, 0),
	(790, 'mark_of_seed', 768, 0, 0, 0, 0, 0, 0, 0),
	(791, 'all_miss', 32, 0, 0, 0, 0, 0, 0, 0),
	(792, 'super_buff', 32, 0, 0, 0, 0, 0, 0, 0),
	(793, 'ninjutsu_ele_debuff', 544, 0, 0, 0, 0, 0, 0, 0),
	(794, 'healing', 372, 0, 0, 0, 0, 0, 0, 0),
	(795, 'leavegame', 372, 0, 0, 0, 0, 0, 0, 0),
	(796, 'haste_samba_haste_effect', 320, 0, 0, 0, 0, 0, 0, 0),
	(797, 'teleport', 32, 0, 0, 0, 0, 0, 0, 0),
	(798, 'chainbound', 32, 0, 0, 0, 0, 0, 0, 0),
	(799, 'skillchain', 32, 0, 0, 0, 0, 0, 0, 0),
	(800, 'dynamis', 0, 0, 0, 0, 0, 0, 0, 0),
	(801, 'meditate', 32, 0, 0, 0, 0, 0, 7, 0);
/*!40000 ALTER TABLE `status_effects` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
