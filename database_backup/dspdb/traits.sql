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

-- Dumping structure for table dspdb.traits
CREATE TABLE IF NOT EXISTS `traits` (
  `traitid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `modifier` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` smallint(5) NOT NULL DEFAULT '0',
  `required_expansion` varchar(7) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.traits: 719 rows
DELETE FROM `traits`;
/*!40000 ALTER TABLE `traits` DISABLE KEYS */;
INSERT INTO `traits` (`traitid`, `name`, `job`, `level`, `rank`, `modifier`, `value`, `required_expansion`) VALUES
	(1, 'accuracy bonus', 11, 10, 1, 25, 10, NULL),
	(1, 'accuracy bonus', 11, 10, 1, 26, 10, NULL),
	(1, 'accuracy bonus', 11, 30, 2, 25, 22, NULL),
	(1, 'accuracy bonus', 11, 30, 2, 26, 22, NULL),
	(1, 'accuracy bonus', 11, 50, 3, 25, 35, NULL),
	(1, 'accuracy bonus', 11, 50, 3, 26, 35, NULL),
	(1, 'accuracy bonus', 11, 70, 4, 25, 48, NULL),
	(1, 'accuracy bonus', 11, 70, 4, 26, 48, NULL),
	(1, 'accuracy bonus', 11, 86, 5, 25, 60, 'ABYSSEA'),
	(1, 'accuracy bonus', 11, 86, 5, 26, 60, 'ABYSSEA'),
	(1, 'accuracy bonus', 14, 30, 1, 25, 10, NULL),
	(1, 'accuracy bonus', 14, 30, 1, 26, 10, NULL),
	(1, 'accuracy bonus', 14, 50, 2, 25, 22, 'TOAU'),
	(1, 'accuracy bonus', 14, 50, 2, 26, 22, 'TOAU'),
	(1, 'accuracy bonus', 14, 78, 3, 25, 35, 'ABYSSEA'),
	(1, 'accuracy bonus', 14, 78, 3, 26, 35, 'ABYSSEA'),
	(1, 'accuracy bonus', 19, 30, 1, 25, 10, 'WOTG'),
	(1, 'accuracy bonus', 19, 30, 1, 26, 10, 'WOTG'),
	(1, 'accuracy bonus', 19, 60, 2, 25, 22, 'WOTG'),
	(1, 'accuracy bonus', 19, 60, 2, 26, 22, 'WOTG'),
	(1, 'accuracy bonus', 19, 80, 3, 25, 35, 'ABYSSEA'),
	(1, 'accuracy bonus', 19, 80, 3, 26, 35, 'ABYSSEA'),
	(2, 'evasion bonus', 6, 10, 1, 68, 10, NULL),
	(2, 'evasion bonus', 6, 30, 2, 68, 22, NULL),
	(2, 'evasion bonus', 6, 50, 3, 68, 35, NULL),
	(2, 'evasion bonus', 6, 70, 4, 68, 48, NULL),
	(2, 'evasion bonus', 6, 76, 5, 68, 60, 'ABYSSEA'),
	(2, 'evasion bonus', 18, 20, 1, 68, 10, 'TOAU'),
	(2, 'evasion bonus', 18, 40, 2, 68, 22, 'TOAU'),
	(2, 'evasion bonus', 18, 60, 3, 68, 35, 'TOAU'),
	(2, 'evasion bonus', 18, 80, 4, 68, 48, 'TOAU'),
	(2, 'evasion bonus', 19, 15, 1, 68, 10, 'WOTG'),
	(2, 'evasion bonus', 19, 45, 2, 68, 22, 'WOTG'),
	(2, 'evasion bonus', 19, 75, 3, 68, 35, 'WOTG'),
	(3, 'attack bonus', 1, 30, 1, 23, 10, NULL),
	(3, 'attack bonus', 1, 30, 1, 24, 10, NULL),
	(3, 'attack bonus', 1, 91, 2, 23, 22, 'ABYSSEA'),
	(3, 'attack bonus', 1, 91, 2, 24, 22, 'ABYSSEA'),
	(3, 'attack bonus', 8, 10, 1, 23, 10, NULL),
	(3, 'attack bonus', 8, 10, 1, 24, 10, NULL),
	(3, 'attack bonus', 8, 30, 2, 23, 22, NULL),
	(3, 'attack bonus', 8, 30, 2, 24, 22, NULL),
	(3, 'attack bonus', 8, 50, 3, 23, 35, NULL),
	(3, 'attack bonus', 8, 50, 3, 24, 35, NULL),
	(3, 'attack bonus', 8, 70, 4, 23, 48, NULL),
	(3, 'attack bonus', 8, 70, 4, 24, 48, NULL),
	(3, 'attack bonus', 8, 76, 5, 23, 60, 'ABYSSEA'),
	(3, 'attack bonus', 8, 76, 5, 24, 60, 'ABYSSEA'),
	(3, 'attack bonus', 8, 91, 6, 23, 72, 'ABYSSEA'),
	(3, 'attack bonus', 8, 91, 6, 24, 72, 'ABYSSEA'),
	(3, 'attack bonus', 14, 10, 1, 23, 10, NULL),
	(3, 'attack bonus', 14, 10, 1, 24, 10, NULL),
	(3, 'attack bonus', 14, 91, 2, 23, 22, 'ABYSSEA'),
	(3, 'attack bonus', 14, 91, 2, 24, 22, 'ABYSSEA'),
	(4, 'defense bonus', 1, 10, 1, 1, 10, NULL),
	(4, 'defense bonus', 1, 50, 2, 1, 22, NULL),
	(4, 'defense bonus', 7, 10, 1, 1, 10, NULL),
	(4, 'defense bonus', 7, 30, 2, 1, 22, NULL),
	(4, 'defense bonus', 7, 50, 3, 1, 35, NULL),
	(4, 'defense bonus', 7, 70, 4, 1, 48, NULL),
	(4, 'defense bonus', 7, 76, 5, 1, 60, 'ABYSSEA'),
	(4, 'defense bonus', 7, 91, 6, 1, 72, 'ABYSSEA'),
	(5, 'magic atk. bonus', 4, 10, 1, 28, 20, NULL),
	(5, 'magic atk. bonus', 4, 30, 2, 28, 24, NULL),
	(5, 'magic atk. bonus', 4, 50, 3, 28, 28, NULL),
	(5, 'magic atk. bonus', 4, 70, 4, 28, 32, NULL),
	(5, 'magic atk. bonus', 4, 81, 5, 28, 36, 'ABYSSEA'),
	(5, 'magic atk. bonus', 4, 91, 6, 28, 40, 'ABYSSEA'),
	(5, 'magic atk. bonus', 5, 20, 1, 28, 20, 'WOTG'),
	(5, 'magic atk. bonus', 5, 40, 2, 28, 24, 'WOTG'),
	(5, 'magic atk. bonus', 5, 86, 3, 28, 28, 'ABYSSEA'),
	(6, 'magic def. bonus', 3, 10, 1, 29, 10, NULL),
	(6, 'magic def. bonus', 3, 30, 2, 29, 12, NULL),
	(6, 'magic def. bonus', 3, 50, 3, 29, 14, NULL),
	(6, 'magic def. bonus', 3, 70, 4, 29, 16, NULL),
	(6, 'magic def. bonus', 3, 81, 5, 29, 18, 'ABYSSEA'),
	(6, 'magic def. bonus', 3, 91, 6, 29, 20, 'ABYSSEA'),
	(6, 'magic def. bonus', 5, 25, 1, 29, 10, NULL),
	(6, 'magic def. bonus', 5, 45, 2, 29, 12, NULL),
	(6, 'magic def. bonus', 5, 96, 3, 29, 14, 'ABYSSEA'),
	(7, 'max hp boost', 1, 30, 1, 2, 30, 'SOA'),
	(7, 'max hp boost', 1, 50, 2, 2, 60, 'SOA'),
	(7, 'max hp boost', 1, 70, 3, 2, 120, 'SOA'),
	(7, 'max hp boost', 1, 90, 4, 2, 180, 'SOA'),
	(7, 'max hp boost', 2, 15, 1, 2, 30, NULL),
	(7, 'max hp boost', 2, 25, 2, 2, 60, NULL),
	(7, 'max hp boost', 2, 35, 3, 2, 120, NULL),
	(7, 'max hp boost', 2, 45, 4, 2, 180, NULL),
	(7, 'max hp boost', 2, 55, 5, 2, 240, 'ABYSSEA'),
	(7, 'max hp boost', 2, 65, 6, 2, 280, 'ABYSSEA'),
	(7, 'max hp boost', 7, 45, 1, 2, 30, 'SOA'),
	(7, 'max hp boost', 7, 85, 2, 2, 60, 'SOA'),
	(7, 'max hp boost', 13, 20, 1, 2, 30, 'SOA'),
	(7, 'max hp boost', 13, 40, 2, 2, 60, 'SOA'),
	(7, 'max hp boost', 13, 60, 3, 2, 120, 'SOA'),
	(7, 'max hp boost', 13, 80, 4, 2, 180, 'SOA'),
	(7, 'max hp boost', 13, 99, 5, 2, 240, 'SOA'),
	(7, 'max hp boost', 22, 20, 1, 2, 30, 'SOA'),
	(7, 'max hp boost', 22, 40, 2, 2, 60, 'SOA'),
	(7, 'max hp boost', 22, 60, 3, 2, 120, 'SOA'),
	(7, 'max hp boost', 22, 80, 4, 2, 180, 'SOA'),
	(7, 'max hp boost', 22, 99, 5, 2, 240, 'SOA'),
	(8, 'max mp boost', 15, 5, 1, 5, 10, NULL),
	(8, 'max mp boost', 15, 15, 2, 5, 20, NULL),
	(8, 'max mp boost', 15, 30, 3, 5, 40, NULL),
	(8, 'max mp boost', 15, 45, 4, 5, 60, NULL),
	(8, 'max mp boost', 15, 60, 5, 5, 80, 'ABYSSEA'),
	(8, 'max mp boost', 15, 75, 6, 5, 100, 'ABYSSEA'),
	(8, 'max mp boost', 20, 30, 1, 5, 10, 'WOTG'),
	(8, 'max mp boost', 20, 88, 2, 5, 20, 'ABYSSEA'),
	(9, 'auto regen', 3, 20, 1, 370, 1, NULL),
	(9, 'auto regen', 3, 40, 2, 370, 2, 'ABYSSEA'),
	(10, 'auto refresh', 7, 35, 1, 369, 1, NULL),
	(10, 'auto refresh', 15, 25, 1, 369, 1, NULL),
	(10, 'auto refresh', 15, 80, 2, 369, 2, 'ABYSSEA'),
	(11, 'rapid shot', 11, 15, 1, 359, 10, NULL),
	(11, 'rapid shot', 17, 15, 1, 359, 10, 'TOAU'),
	(12, 'fast cast', 5, 15, 1, 170, 10, NULL),
	(12, 'fast cast', 5, 35, 2, 170, 15, NULL),
	(12, 'fast cast', 5, 55, 3, 170, 20, NULL),
	(12, 'fast cast', 5, 76, 4, 170, 25, 'ABYSSEA'),
	(12, 'fast cast', 5, 89, 5, 170, 30, 'ABYSSEA'),
	(13, 'conserve mp', 4, 20, 1, 296, 25, NULL),
	(13, 'conserve mp', 20, 25, 1, 296, 25, 'WOTG'),
	(14, 'store tp', 12, 10, 1, 73, 10, NULL),
	(14, 'store tp', 12, 30, 2, 73, 15, NULL),
	(14, 'store tp', 12, 50, 3, 73, 20, NULL),
	(14, 'store tp', 12, 70, 4, 73, 25, NULL),
	(14, 'store tp', 12, 90, 5, 73, 30, 'ABYSSEA'),
	(15, 'double attack', 1, 25, 1, 288, 10, NULL),
	(16, 'triple attack', 6, 15, 1, 302, 2, NULL),
	(16, 'triple attack', 6, 25, 2, 302, 3, NULL),
	(17, 'counter', 2, 10, 1, 291, 10, NULL),
	(17, 'counter', 2, 30, 2, 291, 12, NULL),
	(18, 'dual wield', 6, 20, 1, 259, 10, 'ABYSSEA'),
	(18, 'dual wield', 6, 40, 2, 259, 15, 'ABYSSEA'),
	(18, 'dual wield', 6, 60, 3, 259, 25, 'ABYSSEA'),
	(18, 'dual wield', 13, 10, 1, 259, 10, NULL),
	(18, 'dual wield', 13, 25, 2, 259, 15, NULL),
	(18, 'dual wield', 13, 45, 3, 259, 25, NULL),
	(18, 'dual wield', 13, 65, 4, 259, 30, NULL),
	(18, 'dual wield', 13, 85, 5, 259, 35, NULL),
	(18, 'dual wield', 19, 20, 1, 259, 10, 'ABYSSEA'),
	(18, 'dual wield', 19, 40, 2, 259, 15, 'ABYSSEA'),
	(18, 'dual wield', 19, 60, 3, 259, 25, 'ABYSSEA'),
	(18, 'dual wield', 19, 80, 4, 259, 30, 'ABYSSEA'),
	(19, 'treasure hunter', 6, 15, 1, 303, 1, NULL),
	(20, 'gilfinder', 6, 5, 1, 0, 0, NULL),
	(20, 'gilfinder', 6, 85, 2, 0, 0, 'ABYSSEA'),
	(21, 'alertness', 11, 5, 1, 110, 10, NULL),
	(22, 'stealth', 13, 5, 1, 358, 3, NULL),
	(23, 'martial arts', 2, 1, 1, 173, 80, NULL),
	(23, 'martial arts', 2, 16, 2, 173, 100, NULL),
	(23, 'martial arts', 2, 31, 3, 173, 120, NULL),
	(23, 'martial arts', 2, 46, 4, 173, 140, NULL),
	(23, 'martial arts', 2, 61, 5, 173, 160, NULL),
	(23, 'martial arts', 2, 75, 6, 173, 180, NULL),
	(23, 'martial arts', 2, 82, 7, 173, 200, 'ABYSSEA'),
	(23, 'martial arts', 18, 25, 1, 173, 80, 'TOAU'),
	(23, 'martial arts', 18, 50, 2, 173, 100, 'TOAU'),
	(23, 'martial arts', 18, 75, 3, 173, 120, 'TOAU'),
	(23, 'martial arts', 18, 86, 4, 173, 140, 'ABYSSEA'),
	(23, 'martial arts', 18, 97, 5, 173, 160, 'ABYSSEA'),
	(24, 'clear mind', 3, 20, 1, 71, 3, NULL),
	(24, 'clear mind', 3, 35, 2, 71, 6, NULL),
	(24, 'clear mind', 3, 50, 3, 71, 9, NULL),
	(24, 'clear mind', 3, 50, 3, 295, 1, NULL),
	(24, 'clear mind', 3, 65, 4, 71, 12, NULL),
	(24, 'clear mind', 3, 80, 5, 71, 15, 'ABYSSEA'),
	(24, 'clear mind', 3, 80, 5, 295, 2, 'ABYSSEA'),
	(24, 'clear mind', 3, 96, 6, 71, 18, 'ABYSSEA'),
	(24, 'clear mind', 3, 96, 6, 295, 3, 'ABYSSEA'),
	(24, 'clear mind', 4, 15, 1, 71, 3, NULL),
	(24, 'clear mind', 4, 30, 2, 71, 6, NULL),
	(24, 'clear mind', 4, 45, 3, 71, 9, NULL),
	(24, 'clear mind', 4, 45, 3, 295, 1, NULL),
	(24, 'clear mind', 4, 60, 4, 71, 12, NULL),
	(24, 'clear mind', 4, 75, 5, 71, 15, NULL),
	(24, 'clear mind', 4, 75, 5, 295, 2, NULL),
	(24, 'clear mind', 4, 91, 6, 71, 18, 'ABYSSEA'),
	(24, 'clear mind', 4, 91, 6, 295, 3, 'ABYSSEA'),
	(24, 'clear mind', 5, 31, 1, 71, 3, NULL),
	(24, 'clear mind', 5, 53, 2, 71, 6, NULL),
	(24, 'clear mind', 5, 75, 3, 71, 9, NULL),
	(24, 'clear mind', 5, 75, 3, 295, 1, NULL),
	(24, 'clear mind', 5, 91, 4, 71, 12, 'ABYSSEA'),
	(24, 'clear mind', 5, 91, 4, 295, 1, 'ABYSSEA'),
	(24, 'clear mind', 15, 15, 1, 71, 3, NULL),
	(24, 'clear mind', 15, 30, 2, 71, 6, NULL),
	(24, 'clear mind', 15, 45, 3, 71, 9, NULL),
	(24, 'clear mind', 15, 45, 3, 295, 1, NULL),
	(24, 'clear mind', 15, 60, 4, 71, 12, NULL),
	(24, 'clear mind', 15, 70, 5, 71, 15, NULL),
	(24, 'clear mind', 15, 70, 5, 295, 2, NULL),
	(24, 'clear mind', 15, 91, 6, 71, 18, 'ABYSSEA'),
	(24, 'clear mind', 15, 91, 6, 295, 3, 'ABYSSEA'),
	(24, 'clear mind', 20, 20, 1, 71, 3, 'WOTG'),
	(24, 'clear mind', 20, 35, 2, 71, 6, 'WOTG'),
	(24, 'clear mind', 20, 50, 3, 71, 9, 'WOTG'),
	(24, 'clear mind', 20, 50, 3, 295, 1, 'WOTG'),
	(24, 'clear mind', 20, 65, 4, 71, 12, 'WOTG'),
	(24, 'clear mind', 20, 76, 5, 71, 15, 'ABYSSEA'),
	(24, 'clear mind', 20, 76, 5, 295, 2, 'ABYSSEA'),
	(24, 'clear mind', 20, 96, 6, 71, 18, 'ABYSSEA'),
	(24, 'clear mind', 20, 96, 6, 295, 3, 'ABYSSEA'),
	(25, 'shield mastery', 5, 30, 10, 485, 10, NULL),
	(25, 'shield mastery', 5, 70, 20, 485, 20, NULL),
	(25, 'shield mastery', 7, 20, 10, 485, 10, NULL),
	(25, 'shield mastery', 7, 35, 20, 485, 20, NULL),
	(25, 'shield mastery', 7, 50, 30, 485, 30, NULL),
	(25, 'shield mastery', 7, 65, 40, 485, 40, 'ABYSSEA'),
	(32, 'beast killer', 9, 10, 1, 230, 8, NULL),
	(33, 'plantoid killer', 9, 10, 1, 229, 8, NULL),
	(34, 'vermin killer', 9, 10, 1, 224, 8, NULL),
	(35, 'lizard killer', 9, 10, 1, 227, 8, NULL),
	(36, 'bird killer', 9, 10, 1, 225, 8, NULL),
	(37, 'amorph killer', 9, 10, 1, 226, 8, NULL),
	(38, 'aquan killer', 9, 10, 1, 228, 8, NULL),
	(39, 'undead killer', 7, 5, 1, 231, 8, NULL),
	(41, 'arcana killer', 8, 25, 1, 232, 8, NULL),
	(42, 'demon killer', 12, 40, 1, 234, 8, NULL),
	(43, 'dragon killer', 14, 25, 1, 233, 8, NULL),
	(48, 'resist sleep', 7, 20, 1, 240, 8, NULL),
	(48, 'resist sleep', 7, 40, 2, 240, 12, NULL),
	(48, 'resist sleep', 7, 60, 3, 240, 16, NULL),
	(49, 'resist poison', 11, 20, 1, 241, 8, NULL),
	(49, 'resist poison', 11, 40, 2, 241, 12, NULL),
	(49, 'resist poison', 11, 60, 3, 241, 16, NULL),
	(50, 'resist paralyze', 8, 20, 1, 242, 8, NULL),
	(50, 'resist paralyze', 8, 40, 2, 242, 12, NULL),
	(50, 'resist paralyze', 8, 60, 3, 242, 16, NULL),
	(50, 'resist paralyze', 8, 75, 4, 242, 20, NULL),
	(50, 'resist paralyze', 17, 5, 1, 242, 8, 'TOAU'),
	(50, 'resist paralyze', 17, 25, 2, 242, 12, 'TOAU'),
	(50, 'resist paralyze', 17, 45, 3, 242, 16, 'TOAU'),
	(50, 'resist paralyze', 17, 65, 4, 242, 20, 'TOAU'),
	(51, 'resist blind', 12, 5, 1, 243, 8, NULL),
	(51, 'resist blind', 12, 25, 2, 243, 12, NULL),
	(51, 'resist blind', 12, 45, 3, 243, 16, NULL),
	(51, 'resist blind', 12, 65, 4, 243, 20, NULL),
	(52, 'resist silence', 10, 5, 1, 244, 8, NULL),
	(52, 'resist silence', 10, 25, 2, 244, 12, NULL),
	(52, 'resist silence', 10, 45, 3, 244, 16, NULL),
	(52, 'resist silence', 10, 65, 4, 244, 20, NULL),
	(49, 'resist poison', 11, 75, 4, 241, 20, NULL),
	(52, 'resist silence', 20, 10, 1, 244, 8, 'WOTG'),
	(52, 'resist silence', 20, 40, 2, 244, 12, 'WOTG'),
	(52, 'resist silence', 20, 70, 3, 244, 16, 'WOTG'),
	(52, 'resist silence', 20, 10, 1, 56, 10, 'WOTG'),
	(53, 'resist petrify', 5, 10, 1, 246, 8, NULL),
	(53, 'resist petrify', 5, 30, 2, 246, 12, NULL),
	(53, 'resist petrify', 5, 50, 3, 246, 16, NULL),
	(53, 'resist petrify', 5, 70, 4, 246, 20, NULL),
	(54, 'resist virus', 1, 15, 1, 245, 8, NULL),
	(54, 'resist virus', 1, 35, 2, 245, 12, NULL),
	(54, 'resist virus', 1, 55, 3, 245, 16, NULL),
	(54, 'resist virus', 1, 70, 4, 245, 20, NULL),
	(55, 'resist curse', 0, 0, 1, 248, 2, NULL),
	(56, 'resist stun', 0, 0, 1, 251, 2, NULL),
	(57, 'resist bind', 13, 10, 1, 247, 8, NULL),
	(57, 'resist bind', 13, 30, 2, 247, 12, NULL),
	(57, 'resist bind', 13, 50, 3, 247, 16, NULL),
	(57, 'resist bind', 13, 70, 4, 247, 20, NULL),
	(58, 'resist gravity', 6, 20, 1, 249, 8, NULL),
	(58, 'resist gravity', 6, 40, 2, 249, 12, NULL),
	(58, 'resist gravity', 6, 60, 3, 249, 16, NULL),
	(58, 'resist gravity', 6, 75, 4, 249, 20, NULL),
	(48, 'resist sleep', 7, 75, 4, 240, 20, NULL),
	(59, 'resist slow', 9, 15, 1, 250, 8, NULL),
	(59, 'resist slow', 9, 35, 2, 250, 12, NULL),
	(59, 'resist slow', 9, 55, 3, 250, 16, NULL),
	(59, 'resist slow', 9, 75, 4, 250, 20, NULL),
	(59, 'resist slow', 9, 81, 5, 250, 7, 'ABYSSEA'),
	(59, 'resist slow', 15, 20, 1, 250, 8, NULL),
	(59, 'resist slow', 15, 40, 2, 250, 12, NULL),
	(59, 'resist slow', 15, 60, 3, 250, 16, NULL),
	(59, 'resist slow', 15, 75, 4, 250, 20, NULL),
	(59, 'resist slow', 18, 10, 1, 250, 8, 'TOAU'),
	(59, 'resist slow', 18, 50, 2, 250, 12, 'TOAU'),
	(59, 'resist slow', 18, 70, 3, 250, 16, 'TOAU'),
	(59, 'resist slow', 18, 75, 4, 250, 20, 'TOAU'),
	(59, 'resist slow', 19, 20, 1, 250, 8, 'WOTG'),
	(52, 'resist silence', 20, 70, 3, 56, 30, 'WOTG'),
	(52, 'resist silence', 20, 40, 2, 56, 20, 'WOTG'),
	(60, 'resist charm', 0, 0, 1, 252, 2, NULL),
	(63, 'resist amnesia', 9, 15, 1, 253, 8, 'SOA'),
	(63, 'resist amnesia', 9, 35, 2, 253, 12, 'SOA'),
	(63, 'resist amnesia', 9, 55, 3, 253, 16, 'SOA'),
	(63, 'resist amnesia', 9, 75, 4, 253, 20, 'SOA'),
	(63, 'resist amnesia', 17, 30, 1, 54, 10, 'SOA'),
	(63, 'resist amnesia', 17, 50, 2, 253, 12, 'SOA'),
	(63, 'resist amnesia', 17, 70, 3, 253, 16, 'SOA'),
	(63, 'resist amnesia', 18, 15, 1, 253, 8, 'SOA'),
	(63, 'resist amnesia', 18, 35, 2, 253, 12, 'SOA'),
	(63, 'resist amnesia', 18, 55, 3, 253, 16, 'SOA'),
	(63, 'resist amnesia', 18, 75, 4, 253, 20, 'SOA'),
	(64, 'treasure hunter ii', 6, 45, 2, 303, 1, NULL),
	(65, 'treasure hunter iii', 6, 90, 3, 303, 1, 'ABYSSEA'),
	(66, 'kick attacks', 2, 51, 1, 292, 10, NULL),
	(66, 'kick attacks', 2, 71, 2, 292, 13, NULL),
	(66, 'kick attacks', 2, 96, 3, 292, 15, 'ABYSSEA'),
	(67, 'subtle blow', 2, 5, 1, 289, 5, NULL),
	(67, 'subtle blow', 2, 15, 2, 289, 10, NULL),
	(67, 'subtle blow', 2, 30, 3, 289, 15, NULL),
	(67, 'subtle blow', 2, 45, 4, 289, 20, NULL),
	(67, 'subtle blow', 2, 60, 5, 289, 25, NULL),
	(67, 'subtle blow', 13, 15, 1, 289, 5, NULL),
	(67, 'subtle blow', 13, 30, 2, 289, 10, NULL),
	(67, 'subtle blow', 13, 45, 3, 289, 15, NULL),
	(67, 'subtle blow', 13, 60, 4, 289, 20, NULL),
	(67, 'subtle blow', 13, 75, 5, 289, 25, NULL),
	(67, 'subtle blow', 13, 91, 6, 289, 27, 'ABYSSEA'),
	(67, 'subtle blow', 19, 25, 1, 289, 5, 'WOTG'),
	(67, 'subtle blow', 19, 45, 2, 289, 10, 'WOTG'),
	(67, 'subtle blow', 19, 65, 3, 289, 15, 'WOTG'),
	(67, 'subtle blow', 19, 86, 4, 289, 20, 'ABYSSEA'),
	(68, 'assassin', 6, 60, 1, 0, 0, 'COP'),
	(69, 'divine veil', 3, 50, 1, 0, 0, 'COP'),
	(70, 'zanshin', 12, 20, 1, 306, 15, 'COP'),
	(70, 'zanshin', 12, 35, 2, 306, 25, 'COP'),
	(70, 'zanshin', 12, 50, 3, 306, 35, 'COP'),
	(70, 'zanshin', 12, 75, 4, 306, 45, 'COP'),
	(70, 'zanshin', 12, 95, 5, 306, 50, 'ABYSSEA'),
	(71, 'savagery', 1, 75, 1, 0, 0, 'TOAU'),
	(72, 'aggressive aim', 1, 75, 1, 0, 0, 'TOAU'),
	(73, 'invigorate', 2, 75, 1, 0, 24, 'TOAU'),
	(74, 'penance', 2, 75, 1, 0, 0, 'TOAU'),
	(75, 'aura steal', 6, 75, 1, 0, 0, 'TOAU'),
	(76, 'ambush', 6, 75, 1, 0, 0, 'TOAU'),
	(77, 'iron will', 7, 75, 1, 0, 0, 'TOAU'),
	(78, 'guardian', 7, 75, 1, 0, 0, 'TOAU'),
	(79, 'muted soul', 8, 75, 1, 0, 0, 'TOAU'),
	(80, 'desperate blows', 8, 75, 1, 0, 0, 'TOAU'),
	(81, 'beast affinity ', 9, 75, 1, 0, 0, 'TOAU'),
	(82, 'beast healer', 9, 75, 1, 0, 0, 'TOAU'),
	(83, 'snapshot', 11, 75, 1, 0, 0, 'TOAU'),
	(84, 'recycle', 11, 20, 1, 305, 10, 'TOAU'),
	(84, 'recycle', 17, 35, 1, 305, 25, 'TOAU'),
	(85, 'ikishoten', 12, 75, 1, 0, 0, 'TOAU'),
	(86, 'overwhelm', 12, 75, 1, 0, 0, 'TOAU'),
	(87, 'ninja tool expert.', 13, 75, 1, 308, 0, 'TOAU'),
	(88, 'empathy', 14, 75, 1, 0, 0, 'TOAU'),
	(89, 'strafe', 14, 75, 1, 0, 0, 'TOAU'),
	(90, 'enchainment', 16, 75, 1, 0, 0, 'TOAU'),
	(91, 'assimilation', 16, 75, 1, 0, 0, 'TOAU'),
	(92, 'winning streak', 17, 75, 1, 0, 0, 'TOAU'),
	(93, 'loaded deck', 17, 75, 1, 0, 0, 'TOAU'),
	(94, 'fine-tuning', 18, 75, 1, 0, 0, 'TOAU'),
	(95, 'optimization', 18, 75, 1, 0, 0, 'TOAU'),
	(96, 'closed position', 19, 75, 1, 0, 0, 'WOTG'),
	(97, 'stormsurge', 20, 75, 1, 0, 0, 'WOTG'),
	(100, 'tactical parry', 8, 88, 10, 486, 20, 'ABYSSEA'),
	(100, 'tactical parry', 8, 98, 20, 486, 30, 'ABYSSEA'),
	(100, 'tactical parry', 13, 35, 10, 486, 20, 'ABYSSEA'),
	(100, 'tactical parry', 13, 70, 20, 486, 30, 'ABYSSEA'),
	(106, 'skillchain bonus', 13, 70, 3, 174, 25, 'ABYSSEA'),
	(100, 'tactical parry', 19, 77, 10, 486, 20, 'ABYSSEA'),
	(100, 'tactical parry', 19, 84, 20, 486, 30, 'ABYSSEA'),
	(100, 'tactical parry', 19, 91, 30, 486, 40, 'ABYSSEA'),
	(100, 'tactical parry', 19, 97, 40, 486, 50, 'ABYSSEA'),
	(100, 'tactical parry', 17, 20, 10, 486, 20, NULL),
	(100, 'tactical parry', 22, 5, 10, 486, 20, NULL),
	(100, 'tactical parry', 22, 20, 20, 486, 30, NULL),
	(106, 'skillchain bonus', 2, 85, 1, 174, 8, 'ABYSSEA'),
	(106, 'skillchain bonus', 2, 95, 2, 174, 12, 'ABYSSEA'),
	(106, 'skillchain bonus', 12, 78, 1, 174, 8, 'ABYSSEA'),
	(106, 'skillchain bonus', 12, 88, 2, 174, 12, 'ABYSSEA'),
	(106, 'skillchain bonus', 12, 98, 3, 174, 16, 'ABYSSEA'),
	(106, 'skillchain bonus', 13, 30, 1, 174, 15, 'ABYSSEA'),
	(106, 'skillchain bonus', 13, 45, 2, 174, 20, 'ABYSSEA'),
	(106, 'skillchain bonus', 19, 45, 1, 174, 8, 'ABYSSEA'),
	(106, 'skillchain bonus', 19, 58, 2, 174, 12, 'ABYSSEA'),
	(106, 'skillchain bonus', 19, 71, 3, 174, 16, 'ABYSSEA'),
	(106, 'skillchain bonus', 19, 84, 4, 174, 20, 'ABYSSEA'),
	(106, 'skillchain bonus', 19, 97, 4, 174, 23, 'ABYSSEA'),
	(110, 'mag. burst bonus', 4, 45, 1, 487, 15, 'ABYSSEA'),
	(110, 'mag. burst bonus', 4, 70, 2, 487, 20, 'ABYSSEA'),
	(98, 'crit dam bonus', 6, 20, 1, 421, 5, 'ABYSSEA'),
	(110, 'mag. burst bonus', 8, 75, 5, 487, 35, 'ABYSSEA'),
	(110, 'mag. burst bonus', 8, 60, 4, 487, 30, 'ABYSSEA'),
	(110, 'mag. burst bonus', 5, 85, 1, 487, 5, 'ABYSSEA'),
	(110, 'mag. burst bonus', 5, 95, 2, 487, 7, 'ABYSSEA'),
	(110, 'mag. burst bonus', 13, 15, 1, 487, 15, 'ABYSSEA'),
	(110, 'mag. burst bonus', 13, 30, 2, 487, 20, 'ABYSSEA'),
	(110, 'mag. burst bonus', 20, 79, 1, 487, 5, 'ABYSSEA'),
	(110, 'mag. burst bonus', 20, 89, 2, 487, 7, 'ABYSSEA'),
	(110, 'mag. burst bonus', 20, 99, 3, 487, 9, 'ABYSSEA'),
	(114, 'tranquil heart', 3, 21, 1, 0, 0, 'ABYSSEA'),
	(114, 'tranquil heart', 5, 26, 1, 0, 0, 'ABYSSEA'),
	(114, 'tranquil heart', 20, 30, 1, 0, 0, 'ABYSSEA'),
	(117, 'tenacity', 22, 5, 1, 240, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 241, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 242, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 243, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 244, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 245, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 246, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 247, 5, 'SOA'),
	(117, 'tenacity', 22, 5, 1, 248, 5, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 240, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 241, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 242, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 243, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 244, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 245, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 246, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 247, 7, 'SOA'),
	(117, 'tenacity', 22, 25, 2, 248, 7, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 240, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 241, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 242, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 243, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 244, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 245, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 246, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 247, 9, 'SOA'),
	(117, 'tenacity', 22, 45, 3, 248, 9, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 240, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 241, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 242, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 243, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 244, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 245, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 246, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 247, 11, 'SOA'),
	(117, 'tenacity', 22, 75, 4, 248, 11, 'SOA'),
	(6, 'magic def. bonus', 22, 10, 1, 29, 10, 'SOA'),
	(6, 'magic def. bonus', 22, 30, 2, 29, 12, 'SOA'),
	(6, 'magic def. bonus', 22, 50, 3, 29, 14, 'SOA'),
	(6, 'magic def. bonus', 22, 70, 4, 29, 16, 'SOA'),
	(9, 'auto regen', 22, 10, 1, 370, 1, 'SOA'),
	(9, 'auto regen', 22, 20, 2, 370, 2, 'SOA'),
	(13, 'conserve mp', 21, 10, 1, 296, 25, 'SOA'),
	(13, 'conserve mp', 21, 25, 2, 296, 28, 'SOA'),
	(13, 'conserve mp', 21, 40, 3, 296, 31, 'SOA'),
	(13, 'conserve mp', 21, 55, 4, 296, 34, 'SOA'),
	(13, 'conserve mp', 21, 70, 5, 296, 37, 'SOA'),
	(24, 'clear mind', 21, 75, 4, 71, 12, 'SOA'),
	(24, 'clear mind', 21, 40, 2, 71, 6, 'SOA'),
	(24, 'clear mind', 21, 60, 3, 71, 9, 'SOA'),
	(24, 'clear mind', 21, 60, 3, 295, 1, 'SOA'),
	(8, 'max mp boost', 21, 30, 1, 5, 10, 'SOA'),
	(8, 'max mp boost', 21, 60, 2, 5, 20, 'SOA'),
	(123, 'daken', 13, 25, 1, 844, 20, 'SOA'),
	(32, 'beast killer', 9, 20, 2, 230, 10, NULL),
	(32, 'beast killer', 9, 35, 3, 230, 12, NULL),
	(32, 'beast killer', 9, 50, 4, 230, 14, NULL),
	(32, 'beast killer', 9, 65, 5, 230, 16, NULL),
	(33, 'plantoid killer', 9, 20, 2, 229, 10, NULL),
	(33, 'plantoid killer', 9, 35, 3, 229, 12, NULL),
	(33, 'plantoid killer', 9, 50, 4, 229, 14, NULL),
	(33, 'plantoid killer', 9, 65, 5, 229, 16, NULL),
	(34, 'vermin killer', 9, 20, 2, 224, 10, NULL),
	(34, 'vermin killer', 9, 35, 3, 224, 12, NULL),
	(34, 'vermin killer', 9, 50, 4, 224, 14, NULL),
	(34, 'vermin killer', 9, 65, 5, 224, 16, NULL),
	(35, 'lizard killer', 9, 20, 2, 227, 10, NULL),
	(35, 'lizard killer', 9, 35, 3, 227, 12, NULL),
	(35, 'lizard killer', 9, 65, 5, 227, 16, NULL),
	(35, 'lizard killer', 9, 50, 4, 227, 14, NULL),
	(36, 'bird killer', 9, 20, 2, 225, 10, NULL),
	(36, 'bird killer', 9, 35, 3, 225, 12, NULL),
	(36, 'bird killer', 9, 50, 4, 225, 14, NULL),
	(36, 'bird killer', 9, 65, 5, 225, 16, NULL),
	(37, 'amorph killer', 9, 20, 2, 226, 10, NULL),
	(37, 'amorph killer', 9, 35, 3, 226, 12, NULL),
	(37, 'amorph killer', 9, 50, 4, 226, 14, NULL),
	(37, 'amorph killer', 9, 65, 5, 226, 16, NULL),
	(38, 'aquan killer', 9, 20, 2, 228, 10, NULL),
	(38, 'aquan killer', 9, 35, 3, 228, 12, NULL),
	(38, 'aquan killer', 9, 50, 4, 228, 14, NULL),
	(38, 'aquan killer', 9, 65, 5, 228, 16, NULL),
	(7, 'max hp boost', 9, 15, 1, 2, 30, NULL),
	(7, 'max hp boost', 9, 30, 2, 2, 60, NULL),
	(7, 'max hp boost', 9, 50, 3, 2, 120, NULL),
	(7, 'max hp boost', 9, 65, 4, 2, 180, NULL),
	(7, 'max hp boost', 2, 75, 7, 2, 320, 'ABYSSEA'),
	(67, 'subtle blow', 2, 75, 6, 289, 30, NULL),
	(17, 'counter', 2, 50, 3, 291, 14, NULL),
	(17, 'counter', 2, 70, 4, 291, 16, NULL),
	(60, 'resist charm', 10, 5, 1, 60, 10, NULL),
	(60, 'resist charm', 10, 65, 4, 252, 20, NULL),
	(51, 'resist blind', 6, 65, 4, 61, 40, NULL),
	(51, 'resist blind', 6, 45, 3, 61, 30, NULL),
	(10, 'auto refresh', 8, 35, 1, 369, 1, NULL),
	(110, 'mag. burst bonus', 8, 15, 1, 487, 15, 'ABYSSEA'),
	(110, 'mag. burst bonus', 8, 30, 2, 487, 20, 'ABYSSEA'),
	(110, 'mag. burst bonus', 8, 45, 3, 487, 25, 'ABYSSEA'),
	(112, 'elemental celerity', 4, 30, 1, 840, 10, NULL),
	(112, 'elemental celerity', 4, 45, 2, 840, 15, NULL),
	(112, 'elemental celerity', 4, 60, 3, 840, 20, NULL),
	(112, 'elemental celerity', 4, 75, 4, 840, 25, NULL),
	(109, 'occult acumen', 4, 20, 1, 841, 50, NULL),
	(109, 'occult acumen', 8, 30, 1, 841, 50, NULL),
	(109, 'occult acumen', 8, 50, 2, 841, 65, NULL),
	(109, 'occult acumen', 8, 70, 3, 841, 80, NULL),
	(127, 'smite', 8, 35, 2, 849, 15, 'WOTG'),
	(127, 'smite', 8, 15, 1, 849, 10, 'WOTG'),
	(100, 'tactical parry', 22, 35, 30, 486, 40, NULL),
	(100, 'tactical parry', 17, 40, 20, 486, 30, NULL),
	(100, 'tactical parry', 17, 60, 30, 486, 40, NULL),
	(21, 'alertness', 11, 5, 1, 108, 10, NULL),
	(21, 'alertness', 11, 5, 1, 109, 10, NULL),
	(21, 'alertness', 11, 5, 1, 107, 10, NULL),
	(21, 'alertness', 11, 5, 1, 31, 10, NULL),
	(112, 'dead aim', 11, 35, 1, 165, 10, NULL),
	(112, 'dead aim', 11, 50, 2, 165, 20, NULL),
	(112, 'dead aim', 11, 65, 3, 165, 30, NULL),
	(36, 'bird killer', 11, 35, 1, 225, 8, NULL),
	(32, 'beast killer', 11, 10, 1, 230, 8, NULL),
	(108, 'conserve tp', 14, 30, 1, 842, 15, 'ABYSSEA'),
	(108, 'conserve tp', 14, 50, 2, 842, 20, 'ABYSSEA'),
	(108, 'conserve tp', 14, 70, 3, 842, 25, 'ABYSSEA'),
	(108, 'conserve tp', 19, 15, 1, 842, 15, 'ABYSSEA'),
	(108, 'conserve tp', 19, 35, 2, 842, 20, 'ABYSSEA'),
	(108, 'conserve tp', 19, 55, 3, 842, 25, 'ABYSSEA'),
	(108, 'conserve tp', 19, 75, 4, 842, 30, 'ABYSSEA'),
	(107, 'fencer', 5, 35, 1, 843, 200, 'ABYSSEA'),
	(107, 'fencer', 1, 45, 1, 843, 200, 'ABYSSEA'),
	(107, 'fencer', 10, 65, 2, 843, 300, 'ABYSSEA'),
	(107, 'fencer', 10, 35, 1, 843, 200, 'ABYSSEA'),
	(107, 'fencer', 5, 65, 2, 843, 300, 'ABYSSEA'),
	(107, 'fencer', 17, 65, 2, 843, 300, 'ABYSSEA'),
	(107, 'fencer', 17, 35, 1, 843, 200, 'ABYSSEA'),
	(107, 'fencer', 1, 58, 2, 843, 300, 'ABYSSEA'),
	(107, 'fencer', 1, 71, 3, 843, 400, 'ABYSSEA'),
	(99, 'crit defense', 7, 25, 1, 166, 1, NULL),
	(99, 'crit defense', 7, 45, 2, 166, 2, NULL),
	(99, 'crit defense', 7, 65, 3, 166, 3, NULL),
	(16, 'triple attack', 6, 75, 3, 302, 8, NULL),
	(9, 'auto regen', 3, 60, 3, 370, 3, 'ABYSSEA'),
	(9, 'auto regen', 22, 30, 3, 370, 3, 'SOA'),
	(9, 'auto regen', 22, 40, 4, 370, 4, 'SOA'),
	(9, 'auto regen', 22, 50, 5, 370, 5, 'SOA'),
	(1, 'accuracy bonus', 22, 20, 1, 25, 10, 'WOTG'),
	(1, 'accuracy bonus', 22, 20, 1, 26, 10, 'WOTG'),
	(1, 'accuracy bonus', 22, 40, 2, 25, 22, 'WOTG'),
	(1, 'accuracy bonus', 22, 40, 2, 26, 22, 'WOTG'),
	(1, 'accuracy bonus', 22, 60, 3, 25, 35, 'WOTG'),
	(1, 'accuracy bonus', 22, 60, 3, 26, 35, 'WOTG'),
	(100, 'tactical parry', 22, 50, 40, 486, 50, NULL),
	(100, 'tactical parry', 22, 65, 50, 486, 60, NULL),
	(100, 'tactical parry', 22, 75, 60, 486, 70, NULL),
	(118, 'inquartata', 22, 15, 1, 110, 20, 'SOA'),
	(118, 'inquartata', 22, 30, 2, 110, 25, 'SOA'),
	(118, 'inquartata', 22, 45, 3, 110, 30, 'SOA'),
	(118, 'inquartata', 22, 60, 4, 110, 35, 'SOA'),
	(118, 'inquartata', 22, 75, 5, 110, 40, 'SOA'),
	(9, 'auto regen', 22, 60, 6, 370, 6, 'SOA'),
	(9, 'auto regen', 22, 70, 7, 370, 7, 'SOA'),
	(123, 'daken', 13, 40, 2, 844, 25, 'SOA'),
	(123, 'daken', 13, 55, 3, 844, 30, 'SOA'),
	(123, 'daken', 13, 70, 4, 844, 35, 'SOA'),
	(110, 'mag. burst bonus', 13, 45, 3, 487, 25, 'ABYSSEA'),
	(110, 'mag. burst bonus', 13, 60, 4, 487, 30, 'ABYSSEA'),
	(110, 'mag. burst bonus', 13, 75, 5, 487, 35, 'ABYSSEA'),
	(98, 'crit dam bonus', 6, 35, 2, 421, 10, 'ABYSSEA'),
	(98, 'crit dam bonus', 6, 50, 3, 421, 15, 'ABYSSEA'),
	(98, 'crit dam bonus', 6, 65, 4, 421, 20, 'ABYSSEA'),
	(54, 'resist virus', 1, 15, 1, 54, 10, NULL),
	(54, 'resist virus', 1, 35, 2, 54, 20, NULL),
	(54, 'resist virus', 1, 50, 3, 54, 30, NULL),
	(54, 'resist virus', 1, 70, 4, 54, 40, NULL),
	(53, 'resist petrify', 5, 10, 1, 57, 10, NULL),
	(53, 'resist petrify', 5, 30, 2, 57, 20, NULL),
	(53, 'resist petrify', 5, 50, 3, 57, 30, NULL),
	(53, 'resist petrify', 5, 70, 4, 57, 40, NULL),
	(58, 'resist gravity', 6, 20, 1, 57, 10, NULL),
	(58, 'resist gravity', 6, 40, 2, 57, 20, NULL),
	(58, 'resist gravity', 6, 60, 3, 57, 30, NULL),
	(58, 'resist gravity', 6, 75, 4, 57, 40, NULL),
	(48, 'resist sleep', 7, 20, 1, 61, 10, NULL),
	(48, 'resist sleep', 7, 40, 2, 61, 20, NULL),
	(48, 'resist sleep', 7, 60, 3, 61, 30, NULL),
	(48, 'resist sleep', 7, 75, 4, 61, 40, NULL),
	(50, 'resist paralyze', 8, 20, 1, 55, 10, NULL),
	(50, 'resist paralyze', 8, 40, 2, 55, 20, NULL),
	(50, 'resist paralyze', 8, 60, 3, 55, 30, NULL),
	(50, 'resist paralyze', 8, 75, 4, 55, 40, NULL),
	(59, 'resist slow', 9, 15, 1, 57, 10, NULL),
	(59, 'resist slow', 9, 35, 2, 57, 20, NULL),
	(59, 'resist slow', 9, 55, 3, 57, 30, NULL),
	(59, 'resist slow', 9, 75, 4, 57, 40, NULL),
	(63, 'resist amnesia', 9, 15, 1, 54, 10, 'SOA'),
	(63, 'resist amnesia', 9, 35, 2, 54, 20, 'SOA'),
	(63, 'resist amnesia', 9, 55, 3, 54, 30, 'SOA'),
	(63, 'resist amnesia', 9, 75, 4, 54, 40, 'SOA'),
	(52, 'resist silence', 10, 5, 1, 56, 10, NULL),
	(52, 'resist silence', 10, 25, 2, 56, 20, NULL),
	(52, 'resist silence', 10, 45, 3, 56, 30, NULL),
	(52, 'resist silence', 10, 65, 4, 56, 40, NULL),
	(49, 'resist poison', 11, 20, 1, 59, 10, NULL),
	(49, 'resist poison', 11, 40, 2, 59, 20, NULL),
	(49, 'resist poison', 11, 60, 3, 59, 30, NULL),
	(49, 'resist poison', 11, 75, 4, 59, 40, NULL),
	(51, 'resist blind', 12, 5, 1, 61, 10, NULL),
	(51, 'resist blind', 12, 25, 2, 61, 20, NULL),
	(51, 'resist blind', 12, 45, 3, 61, 30, NULL),
	(51, 'resist blind', 12, 65, 4, 61, 40, NULL),
	(57, 'resist bind', 13, 10, 1, 55, 10, NULL),
	(57, 'resist bind', 13, 30, 2, 55, 20, NULL),
	(57, 'resist bind', 13, 50, 3, 55, 30, NULL),
	(57, 'resist bind', 13, 70, 4, 55, 40, NULL),
	(59, 'resist slow', 15, 20, 1, 57, 10, NULL),
	(59, 'resist slow', 15, 40, 2, 57, 20, NULL),
	(59, 'resist slow', 15, 60, 3, 57, 30, NULL),
	(59, 'resist slow', 15, 75, 4, 57, 40, NULL),
	(50, 'resist paralyze', 17, 5, 1, 55, 10, 'TOAU'),
	(50, 'resist paralyze', 17, 25, 2, 55, 20, 'TOAU'),
	(50, 'resist paralyze', 17, 45, 3, 55, 30, 'TOAU'),
	(50, 'resist paralyze', 17, 65, 4, 55, 40, 'TOAU'),
	(63, 'resist amnesia', 17, 30, 1, 253, 8, 'SOA'),
	(63, 'resist amnesia', 17, 50, 2, 54, 20, 'SOA'),
	(63, 'resist amnesia', 17, 70, 3, 54, 30, 'SOA'),
	(59, 'resist slow', 18, 10, 1, 57, 10, 'TOAU'),
	(59, 'resist slow', 18, 50, 2, 57, 20, 'TOAU'),
	(59, 'resist slow', 18, 70, 3, 57, 30, 'TOAU'),
	(63, 'resist amnesia', 18, 15, 1, 54, 10, 'SOA'),
	(63, 'resist amnesia', 18, 35, 2, 54, 20, 'SOA'),
	(63, 'resist amnesia', 18, 55, 3, 54, 30, 'SOA'),
	(63, 'resist amnesia', 18, 75, 4, 54, 40, 'SOA'),
	(59, 'resist slow', 19, 20, 1, 57, 10, 'WOTG'),
	(59, 'resist slow', 19, 45, 2, 57, 20, 'WOTG'),
	(59, 'resist slow', 19, 65, 3, 57, 30, 'WOTG'),
	(55, 'resist curse', 8, 5, 1, 248, 8, NULL),
	(55, 'resist curse', 8, 75, 6, 61, 60, NULL),
	(55, 'resist curse', 8, 60, 5, 61, 50, NULL),
	(55, 'resist curse', 8, 45, 4, 61, 40, NULL),
	(55, 'resist curse', 8, 30, 3, 61, 30, NULL),
	(55, 'resist curse', 8, 15, 2, 61, 20, NULL),
	(55, 'resist curse', 8, 5, 1, 61, 10, NULL),
	(60, 'resist charm', 10, 65, 4, 60, 40, NULL),
	(60, 'resist charm', 10, 45, 3, 60, 30, NULL),
	(60, 'resist charm', 10, 25, 2, 60, 20, NULL),
	(49, 'resist poison', 13, 40, 2, 241, 12, NULL),
	(49, 'resist poison', 13, 20, 1, 241, 8, NULL),
	(60, 'resist charm', 10, 45, 3, 252, 16, NULL),
	(60, 'resist charm', 10, 25, 2, 252, 12, NULL),
	(60, 'resist charm', 10, 5, 1, 252, 8, NULL),
	(49, 'resist poison', 13, 75, 4, 59, 40, NULL),
	(49, 'resist poison', 13, 60, 3, 59, 30, NULL),
	(49, 'resist poison', 13, 40, 2, 59, 20, NULL),
	(49, 'resist poison', 13, 20, 1, 59, 10, NULL),
	(49, 'resist poison', 13, 75, 4, 241, 20, NULL),
	(49, 'resist poison', 13, 60, 3, 241, 16, NULL),
	(16, 'triple attack', 6, 65, 3, 302, 7, NULL),
	(16, 'triple attack', 6, 55, 3, 302, 6, NULL),
	(16, 'triple attack', 6, 45, 3, 302, 5, NULL),
	(16, 'triple attack', 6, 35, 3, 302, 4, NULL),
	(51, 'resist blind', 6, 25, 2, 61, 20, NULL),
	(51, 'resist blind', 6, 15, 1, 61, 10, NULL),
	(51, 'resist blind', 6, 65, 4, 243, 20, NULL),
	(51, 'resist blind', 6, 45, 3, 243, 16, NULL),
	(51, 'resist blind', 6, 25, 2, 243, 12, NULL),
	(51, 'resist blind', 6, 15, 1, 243, 8, NULL),
	(55, 'resist curse', 8, 15, 2, 248, 12, NULL),
	(55, 'resist curse', 8, 30, 3, 248, 16, NULL),
	(55, 'resist curse', 8, 45, 4, 248, 20, NULL),
	(55, 'resist curse', 8, 60, 5, 248, 24, NULL),
	(55, 'resist curse', 8, 75, 6, 248, 30, NULL),
	(56, 'resist stun', 14, 15, 1, 251, 8, NULL),
	(56, 'resist stun', 14, 35, 2, 251, 12, NULL),
	(56, 'resist stun', 14, 55, 3, 251, 16, NULL),
	(56, 'resist stun', 14, 75, 4, 251, 20, NULL),
	(56, 'resist stun', 14, 15, 1, 58, 10, NULL),
	(56, 'resist stun', 14, 35, 2, 58, 20, NULL),
	(56, 'resist stun', 14, 55, 3, 58, 30, NULL),
	(56, 'resist stun', 14, 75, 4, 58, 40, NULL),
	(57, 'resist bind', 14, 15, 1, 247, 8, NULL),
	(57, 'resist bind', 14, 35, 2, 247, 12, NULL),
	(57, 'resist bind', 14, 55, 3, 247, 16, NULL),
	(57, 'resist bind', 14, 75, 4, 247, 20, NULL),
	(57, 'resist bind', 14, 15, 1, 55, 10, NULL),
	(57, 'resist bind', 14, 35, 2, 55, 20, NULL),
	(57, 'resist bind', 14, 55, 3, 55, 30, NULL),
	(57, 'resist bind', 14, 75, 4, 55, 40, NULL),
	(54, 'resist virus', 11, 20, 1, 245, 8, NULL),
	(54, 'resist virus', 11, 40, 2, 245, 12, NULL),
	(54, 'resist virus', 11, 60, 3, 245, 16, NULL),
	(54, 'resist virus', 11, 75, 4, 245, 20, NULL),
	(54, 'resist virus', 11, 20, 1, 54, 10, NULL),
	(54, 'resist virus', 11, 40, 2, 54, 20, NULL),
	(54, 'resist virus', 11, 60, 3, 54, 30, NULL),
	(54, 'resist virus', 11, 75, 4, 54, 40, NULL),
	(60, 'resist charm', 19, 5, 1, 60, 10, NULL),
	(60, 'resist charm', 19, 65, 4, 252, 20, NULL),
	(60, 'resist charm', 19, 65, 4, 60, 40, NULL),
	(60, 'resist charm', 19, 45, 3, 60, 30, NULL),
	(60, 'resist charm', 19, 25, 2, 60, 20, NULL),
	(60, 'resist charm', 19, 45, 3, 252, 16, NULL),
	(60, 'resist charm', 19, 25, 2, 252, 12, NULL),
	(60, 'resist charm', 19, 5, 1, 252, 8, NULL),
	(56, 'resist stun', 12, 15, 1, 251, 8, NULL),
	(56, 'resist stun', 12, 35, 2, 251, 12, NULL),
	(56, 'resist stun', 12, 55, 3, 251, 16, NULL),
	(56, 'resist stun', 12, 75, 4, 251, 20, NULL),
	(56, 'resist stun', 12, 15, 1, 58, 10, NULL),
	(56, 'resist stun', 12, 35, 2, 58, 20, NULL),
	(56, 'resist stun', 12, 55, 3, 58, 30, NULL),
	(56, 'resist stun', 12, 75, 4, 58, 40, NULL),
	(105, 'blood boon', 15, 50, 2, 845, 25, NULL),
	(105, 'blood boon', 15, 35, 1, 845, 20, NULL),
	(105, 'blood boon', 15, 65, 3, 845, 30, NULL),
	(105, 'blood boon', 15, 75, 4, 845, 35, NULL),
	(116, 'cardinal chant', 21, 5, 1, 846, 1, 'ABYSSEA'),
	(116, 'cardinal chant', 21, 25, 2, 846, 2, 'ABYSSEA'),
	(116, 'cardinal chant', 21, 45, 3, 846, 3, 'ABYSSEA'),
	(116, 'cardinal chant', 21, 65, 4, 846, 4, 'ABYSSEA'),
	(24, 'clear mind', 21, 20, 1, 71, 3, 'SOA'),
	(15, 'double attack', 1, 40, 2, 288, 12, NULL),
	(15, 'double attack', 1, 55, 2, 288, 14, NULL),
	(15, 'double attack', 1, 70, 2, 288, 16, NULL),
	(127, 'smite', 8, 55, 3, 849, 20, 'WOTG'),
	(127, 'smite', 8, 75, 4, 849, 25, 'WOTG'),
	(22, 'stealth', 13, 45, 2, 358, 5, NULL),
	(22, 'stealth', 6, 5, 1, 358, 3, NULL),
	(22, 'stealth', 6, 25, 2, 358, 5, NULL),
	(22, 'stealth', 6, 40, 3, 358, 7, NULL),
	(22, 'stealth', 6, 60, 4, 358, 9, NULL);
/*!40000 ALTER TABLE `traits` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
