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

-- Dumping structure for table dspdb.item_latents
CREATE TABLE IF NOT EXISTS `item_latents` (
  `itemId` smallint(5) unsigned NOT NULL,
  `modId` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `latentId` smallint(5) NOT NULL,
  `latentParam` smallint(5) NOT NULL,
  PRIMARY KEY (`itemId`,`modId`,`value`,`latentId`,`latentParam`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Dumping data for table dspdb.item_latents: 1,268 rows
/*!40000 ALTER TABLE `item_latents` DISABLE KEYS */;
REPLACE INTO `item_latents` (`itemId`, `modId`, `value`, `latentId`, `latentParam`) VALUES
	(10293, 25, 50, 50, 31),
	(10293, 26, 50, 50, 31),
	(10293, 30, 50, 50, 31),
	(10679, 8, 10, 10, 0),
	(10679, 9, 10, 10, 0),
	(10679, 10, 10, 10, 0),
	(10679, 11, 10, 10, 0),
	(10719, 12, 10, 11, 0),
	(10719, 13, 10, 11, 0),
	(10719, 14, 10, 11, 0),
	(10807, 370, 1, 26, 0),
	(10961, 60, -40, 13, 14),
	(10961, 61, -40, 13, 14),
	(10962, 60, -50, 13, 14),
	(10962, 61, -50, 13, 14),
	(10962, 169, -12, 13, 14),
	(10975, 23, 13, 52, 8),
	(10975, 25, 13, 52, 8),
	(11300, 369, 1, 40, 0),
	(11312, 8, 5, 7, 100),
	(11355, 14, 1, 26, 1),
	(11355, 27, -1, 0, 75),
	(11367, 1, 30, 49, 4277),
	(11367, 1, 30, 49, 4278),
	(11367, 1, 40, 49, 4590),
	(11367, 1, 40, 49, 4605),
	(11367, 1, 40, 49, 5928),
	(11367, 1, 40, 49, 5929),
	(11367, 1, 50, 49, 4405),
	(11367, 1, 50, 49, 4604),
	(11367, 23, 40, 49, 4590),
	(11367, 23, 40, 49, 4605),
	(11367, 23, 50, 49, 4277),
	(11367, 23, 50, 49, 4278),
	(11367, 23, 60, 49, 5928),
	(11367, 23, 60, 49, 5929),
	(11367, 230, 5, 49, 4604),
	(11367, 232, 5, 49, 4604),
	(11367, 288, 1, 49, 4277),
	(11367, 288, 5, 49, 4278),
	(11367, 302, 1, 49, 5928),
	(11367, 302, 2, 49, 5929),
	(11474, 161, -3, 26, 0),
	(11474, 163, -3, 26, 1),
	(11486, 28, 4, 37, 4),
	(11546, 288, 1, 32, 0),
	(11547, 163, -1, 36, 0),
	(11585, 27, -3, 0, 100),
	(11587, 25, 12, 13, 75),
	(11589, 115, 3, 32, 0),
	(11589, 116, 3, 32, 0),
	(11590, 112, 3, 36, 0),
	(11590, 113, 3, 36, 0),
	(11671, 302, 2, 55, 100),
	(11811, 369, 1, 50, 30),
	(11811, 370, 1, 50, 30),
	(11811, 456, 1, 50, 30),
	(12366, 2, 7, 53, 0),
	(12366, 5, 7, 53, 0),
	(12367, 2, 8, 53, 0),
	(12367, 5, 8, 53, 0),
	(12368, 8, 3, 53, 0),
	(12369, 8, 4, 53, 0),
	(12374, 7, 15, 53, 0),
	(12376, 10, 3, 53, 0),
	(12377, 10, 4, 53, 0),
	(12389, 2, 5, 8, 1),
	(12389, 5, 20, 8, 1),
	(12390, 12, 8, 8, 2),
	(12390, 13, 8, 8, 2),
	(12391, 9, 6, 8, 3),
	(12391, 370, 1, 8, 3),
	(12392, 8, 8, 8, 4),
	(12393, 2, 7, 8, 5),
	(12393, 5, 7, 8, 5),
	(12393, 432, 5, 8, 5),
	(12394, 109, 20, 8, 6),
	(12394, 165, 2, 8, 6),
	(12395, 11, 6, 8, 7),
	(12395, 27, 5, 8, 7),
	(12396, 5, 30, 8, 8),
	(12396, 14, 8, 8, 8),
	(12397, 13, 8, 8, 9),
	(12397, 224, 4, 8, 9),
	(12397, 225, 4, 8, 9),
	(12397, 226, 4, 8, 9),
	(12397, 227, 4, 8, 9),
	(12397, 228, 4, 8, 9),
	(12397, 229, 4, 8, 9),
	(12398, 110, 20, 8, 10),
	(12398, 436, 2, 8, 10),
	(12399, 68, 8, 8, 11),
	(12400, 106, 20, 8, 12),
	(12401, 23, 5, 8, 13),
	(12401, 28, 5, 8, 13),
	(12402, 167, 1, 8, 14),
	(12403, 2, 20, 8, 15),
	(12403, 5, 10, 8, 15),
	(12461, 369, 1, 13, 4),
	(12589, 370, 2, 13, 3),
	(12621, 370, 2, 13, 3),
	(12717, 71, 5, 13, 6),
	(12742, 1, 32, 56, 0),
	(12742, 68, 5, 56, 0),
	(12742, 369, -4, 56, 0),
	(12751, 71, 4, 13, 6),
	(13097, 2, 200, 26, 0),
	(13097, 5, 50, 26, 1),
	(13097, 8, 20, 28, 0),
	(13097, 9, 20, 35, 0),
	(13097, 10, 20, 29, 0),
	(13097, 11, 20, 31, 0),
	(13097, 12, 20, 34, 0),
	(13097, 13, 20, 30, 0),
	(13097, 14, 20, 36, 0),
	(13138, 5, 30, 26, 0),
	(13138, 27, -3, 26, 1),
	(13140, 1, 7, 53, 1),
	(13140, 23, 5, 53, 1),
	(13140, 25, 5, 53, 1),
	(13141, 5, 50, 53, 1),
	(13142, 1, 7, 53, 1),
	(13142, 2, 15, 53, 1),
	(13142, 68, 7, 53, 1),
	(13143, 368, 25, 13, 2),
	(13143, 368, 25, 13, 19),
	(13145, 28, 8, 4, 51),
	(13162, 2, 10, 26, 0),
	(13162, 5, 10, 26, 1),
	(13162, 8, 5, 28, 0),
	(13162, 9, 5, 35, 0),
	(13162, 10, 5, 29, 0),
	(13162, 11, 5, 31, 0),
	(13162, 12, 5, 34, 0),
	(13162, 13, 5, 30, 0),
	(13162, 14, 5, 36, 0),
	(13178, 8, 4, 25, 0),
	(13178, 10, 4, 25, 0),
	(13185, 291, 1, 0, 50),
	(13185, 370, 1, 0, 50),
	(13241, 8, 3, 28, 0),
	(13242, 12, 3, 34, 0),
	(13243, 11, 3, 31, 0),
	(13244, 10, 3, 29, 0),
	(13245, 9, 3, 35, 0),
	(13246, 13, 3, 30, 0),
	(13248, 167, 8, 13, 4),
	(13277, 24, 5, 53, 0),
	(13278, 24, 6, 53, 0),
	(13279, 370, 8, 0, 50),
	(13286, 288, 2, 2, 75),
	(13287, 291, 2, 2, 75),
	(13288, 374, 10, 2, 75),
	(13289, 28, 10, 2, 76),
	(13291, 298, 3, 2, 75),
	(13292, 385, 10, 2, 75),
	(13293, 385, 10, 2, 75),
	(13294, 224, 3, 2, 75),
	(13294, 225, 3, 2, 75),
	(13294, 226, 3, 2, 75),
	(13294, 227, 3, 2, 75),
	(13294, 228, 3, 2, 75),
	(13294, 229, 3, 2, 75),
	(13294, 230, 3, 2, 75),
	(13294, 231, 3, 2, 75),
	(13294, 232, 3, 2, 75),
	(13294, 233, 3, 2, 75),
	(13294, 234, 3, 2, 75),
	(13294, 235, 3, 2, 75),
	(13294, 236, 3, 2, 75),
	(13294, 237, 3, 2, 75),
	(13294, 238, 3, 2, 75),
	(13295, 455, -25, 2, 75),
	(13296, 27, -2, 2, 75),
	(13297, 25, 5, 2, 75),
	(13298, 167, 4, 2, 75),
	(13299, 361, 10, 2, 75),
	(13300, 346, 1, 2, 75),
	(13399, 23, 10, 26, 0),
	(13399, 24, 10, 26, 1),
	(13400, 26, 5, 13, 9),
	(13400, 26, 5, 13, 20),
	(13416, 68, 15, 13, 5),
	(13419, 63, 20, 2, 25),
	(13420, 291, 5, 2, 25),
	(13421, 160, -30, 2, 25),
	(13422, 160, -30, 2, 25),
	(13423, 163, -77, 2, 25),
	(13424, 68, 15, 2, 25),
	(13425, 168, 30, 2, 25),
	(13426, 161, -20, 2, 25),
	(13427, 304, 5, 2, 25),
	(13428, 161, -30, 2, 25),
	(13429, 161, -30, 2, 25),
	(13430, 243, 20, 2, 25),
	(13431, 167, 20, 2, 25),
	(13432, 288, 5, 2, 25),
	(13433, 160, -20, 2, 25),
	(13435, 10, 2, 8, 1),
	(13436, 2, 30, 8, 2),
	(13436, 291, 2, 8, 2),
	(13437, 27, -1, 8, 3),
	(13437, 112, 10, 8, 3),
	(13438, 115, 5, 8, 4),
	(13439, 71, 1, 8, 5),
	(13439, 114, 5, 8, 5),
	(13557, 5, 6, 53, 0),
	(13557, 9, 1, 53, 0),
	(13557, 13, 3, 53, 0),
	(13558, 1, 4, 53, 0),
	(13558, 10, 2, 53, 0),
	(13558, 11, 2, 53, 0),
	(13559, 2, 6, 53, 0),
	(13559, 8, 2, 53, 0),
	(13559, 12, 3, 53, 0),
	(13560, 3, -15, 28, 0),
	(13560, 23, 15, 28, 0),
	(13560, 24, 15, 28, 0),
	(13561, 6, -15, 34, 0),
	(13561, 115, 15, 34, 0),
	(13562, 3, -15, 31, 0),
	(13562, 68, 15, 31, 0),
	(13563, 1, 15, 29, 0),
	(13563, 3, -15, 29, 0),
	(13564, 3, -15, 35, 0),
	(13564, 25, 15, 35, 0),
	(13564, 26, 15, 35, 0),
	(13565, 6, -15, 30, 0),
	(13565, 296, 15, 30, 0),
	(13572, 1, 10, 26, 0),
	(13572, 27, 3, 26, 1),
	(13651, 161, -5, 26, 1),
	(13652, 161, -6, 26, 1),
	(13655, 161, -20, 13, 7),
	(13658, 10, 20, 32, 0),
	(13659, 27, 1, 8, 1),
	(13660, 173, 15, 8, 2),
	(13660, 291, 5, 8, 2),
	(13661, 29, 8, 8, 3),
	(13661, 374, 8, 8, 3),
	(13662, 71, 1, 8, 4),
	(13663, 113, 10, 8, 5),
	(13663, 170, 2, 8, 5),
	(13664, 25, 4, 8, 6),
	(13664, 68, 4, 8, 6),
	(13665, 111, 20, 8, 7),
	(13665, 231, 8, 8, 7),
	(13666, 116, 10, 8, 8),
	(13667, 14, 5, 8, 9),
	(13667, 250, 20, 8, 9),
	(13668, 119, 20, 8, 10),
	(13668, 244, 20, 8, 10),
	(13668, 435, 1, 8, 10),
	(13669, 359, 8, 8, 11),
	(13670, 243, 20, 8, 12),
	(13670, 305, 5, 8, 12),
	(13671, 119, 20, 8, 13),
	(13671, 247, 20, 8, 13),
	(13672, 15, 10, 8, 14),
	(13672, 16, 10, 8, 14),
	(13672, 19, 10, 8, 14),
	(13672, 23, 12, 8, 14),
	(13673, 14, 5, 8, 15),
	(13673, 117, 10, 8, 15),
	(13693, 369, 1, 13, 2),
	(13693, 369, 1, 13, 19),
	(13693, 370, 1, 13, 2),
	(13693, 370, 1, 13, 19),
	(13789, 1, 44, 0, 25),
	(13789, 23, 12, 0, 25),
	(13790, 1, 45, 0, 25),
	(13790, 23, 13, 0, 25),
	(13846, 369, 1, 13, 4),
	(13870, 2, 50, 49, 4468),
	(13870, 2, 50, 49, 4596),
	(13870, 5, 50, 49, 4468),
	(13870, 5, 50, 49, 4596),
	(13870, 14, 14, 49, 4468),
	(13870, 14, 14, 49, 4596),
	(13875, 68, 8, 52, 3),
	(13878, 1, 23, 0, 50),
	(13878, 23, 10, 0, 50),
	(13879, 1, 24, 0, 50),
	(13879, 23, 11, 0, 50),
	(13880, 370, 1, 53, 1),
	(13891, 2, 10, 53, 0),
	(13892, 2, 12, 53, 0),
	(13893, 5, 14, 53, 0),
	(13894, 5, 16, 53, 0),
	(13897, 2, 5, 53, 0),
	(13897, 5, 5, 53, 0),
	(13898, 2, 6, 53, 0),
	(13898, 5, 6, 53, 0),
	(13899, 3, 15, 53, 0),
	(13900, 5, 15, 53, 0),
	(13903, 5, 10, 53, 0),
	(13904, 5, 12, 53, 0),
	(13905, 12, 3, 53, 0),
	(13905, 13, 3, 53, 0),
	(13906, 12, 4, 53, 0),
	(13906, 13, 4, 53, 0),
	(13910, 1, 30, 49, 4277),
	(13910, 1, 30, 49, 4278),
	(13910, 1, 40, 49, 4590),
	(13910, 1, 40, 49, 4605),
	(13910, 1, 40, 49, 5928),
	(13910, 1, 40, 49, 5929),
	(13910, 1, 50, 49, 4405),
	(13910, 1, 50, 49, 4604),
	(13910, 23, 40, 49, 4590),
	(13910, 23, 40, 49, 4605),
	(13910, 23, 50, 49, 4277),
	(13910, 23, 50, 49, 4278),
	(13910, 23, 60, 49, 5928),
	(13910, 23, 60, 49, 5929),
	(13910, 230, 5, 49, 4604),
	(13910, 232, 5, 49, 4604),
	(13910, 288, 1, 49, 4277),
	(13910, 288, 5, 49, 4278),
	(13910, 302, 1, 49, 5928),
	(13910, 302, 2, 49, 5929),
	(13913, 370, 10, 30, 0),
	(13913, 370, 10, 32, 0),
	(13925, 291, 1, 0, 25),
	(13949, 1, 30, 49, 4277),
	(13949, 1, 30, 49, 4278),
	(13949, 1, 40, 49, 4590),
	(13949, 1, 40, 49, 4605),
	(13949, 1, 40, 49, 5928),
	(13949, 1, 40, 49, 5929),
	(13949, 1, 50, 49, 4405),
	(13949, 1, 50, 49, 4604),
	(13949, 23, 40, 49, 4590),
	(13949, 23, 40, 49, 4605),
	(13949, 23, 50, 49, 4277),
	(13949, 23, 50, 49, 4278),
	(13949, 23, 60, 49, 5928),
	(13949, 23, 60, 49, 5929),
	(13949, 230, 5, 49, 4604),
	(13949, 232, 5, 49, 4604),
	(13949, 288, 1, 49, 4277),
	(13949, 288, 5, 49, 4278),
	(13949, 302, 1, 49, 5928),
	(13949, 302, 2, 49, 5929),
	(13972, 1, 30, 49, 4277),
	(13972, 1, 30, 49, 4278),
	(13972, 1, 40, 49, 4590),
	(13972, 1, 40, 49, 4605),
	(13972, 1, 40, 49, 5928),
	(13972, 1, 40, 49, 5929),
	(13972, 1, 50, 49, 4405),
	(13972, 1, 50, 49, 4604),
	(13972, 23, 40, 49, 4590),
	(13972, 23, 40, 49, 4605),
	(13972, 23, 50, 49, 4277),
	(13972, 23, 50, 49, 4278),
	(13972, 23, 60, 49, 5928),
	(13972, 23, 60, 49, 5929),
	(13972, 230, 5, 49, 4604),
	(13972, 232, 5, 49, 4604),
	(13972, 288, 1, 49, 4277),
	(13972, 288, 5, 49, 4278),
	(13972, 302, 1, 49, 5928),
	(13972, 302, 2, 49, 5929),
	(14005, 25, 8, 52, 3),
	(14008, 1, 16, 0, 75),
	(14008, 23, 8, 0, 75),
	(14009, 1, 17, 0, 75),
	(14009, 23, 9, 0, 75),
	(14014, 11, 2, 53, 1),
	(14014, 68, 7, 53, 1),
	(14015, 10, 2, 53, 1),
	(14015, 68, 5, 53, 1),
	(14016, 11, 2, 53, 1),
	(14016, 108, 10, 53, 1),
	(14017, 12, 1, 53, 1),
	(14017, 13, 1, 53, 1),
	(14017, 113, 7, 53, 1),
	(14017, 114, 7, 53, 1),
	(14026, 25, 9, 52, 3),
	(14027, 25, 10, 52, 3),
	(14029, 26, 5, 53, 0),
	(14030, 26, 6, 53, 0),
	(14033, 5, 10, 53, 0),
	(14034, 5, 12, 53, 0),
	(14035, 8, 2, 53, 0),
	(14036, 8, 3, 53, 0),
	(14039, 8, 1, 53, 0),
	(14040, 8, 2, 53, 0),
	(14045, 23, 5, 53, 0),
	(14045, 24, 5, 53, 0),
	(14046, 23, 7, 53, 0),
	(14046, 24, 7, 53, 0),
	(14047, 2, 14, 53, 0),
	(14048, 2, 16, 53, 0),
	(14049, 25, 5, 53, 0),
	(14050, 25, 6, 53, 0),
	(14055, 23, 7, 1, 75),
	(14056, 23, 8, 1, 75),
	(14062, 346, 0, 9, 8),
	(14065, 370, 1, 26, 0),
	(14066, 370, 1, 26, 0),
	(14101, 169, 25, 26, 1),
	(14122, 68, 8, 52, 3),
	(14137, 10, 3, 53, 0),
	(14138, 10, 4, 53, 0),
	(14141, 9, 1, 53, 0),
	(14142, 9, 2, 53, 0),
	(14143, 11, 2, 53, 0),
	(14144, 11, 3, 53, 0),
	(14147, 25, 3, 53, 0),
	(14147, 26, 3, 53, 0),
	(14148, 25, 4, 53, 0),
	(14148, 26, 4, 53, 0),
	(14153, 23, 5, 53, 0),
	(14153, 24, 5, 53, 0),
	(14154, 23, 7, 53, 0),
	(14154, 24, 7, 53, 0),
	(14155, 11, 2, 53, 0),
	(14156, 11, 3, 53, 0),
	(14157, 12, 3, 53, 0),
	(14158, 12, 4, 53, 0),
	(14164, 12, 1, 37, 0),
	(14164, 116, 3, 37, 0),
	(14165, 12, 2, 37, 0),
	(14165, 116, 5, 37, 0),
	(14166, 169, 12, 52, 2),
	(14167, 169, 12, 52, 2),
	(14178, 291, 1, 0, 25),
	(14226, 68, 10, 26, 1),
	(14261, 2, 14, 53, 0),
	(14262, 2, 16, 53, 0),
	(14267, 23, 5, 53, 0),
	(14267, 24, 5, 53, 0),
	(14268, 23, 7, 53, 0),
	(14268, 24, 7, 53, 0),
	(14271, 2, 10, 53, 0),
	(14272, 2, 12, 53, 0),
	(14275, 5, 14, 53, 0),
	(14276, 5, 16, 53, 0),
	(14277, 13, 3, 53, 0),
	(14278, 13, 4, 53, 0),
	(14287, 9, 2, 37, 4),
	(14287, 11, 2, 37, 4),
	(14287, 14, 4, 37, 4),
	(14288, 4, 20, 26, 0),
	(14288, 7, 20, 26, 1),
	(14289, 4, 25, 26, 0),
	(14289, 7, 25, 26, 1),
	(14299, 291, 1, 0, 25),
	(14340, 23, 6, 53, 0),
	(14340, 24, 6, 53, 0),
	(14341, 23, 8, 53, 0),
	(14341, 24, 8, 53, 0),
	(14342, 2, 6, 53, 0),
	(14342, 108, 6, 53, 0),
	(14343, 2, 7, 53, 0),
	(14343, 108, 7, 53, 0),
	(14346, 108, 3, 53, 0),
	(14347, 108, 4, 53, 0),
	(14352, 14, 1, 53, 0),
	(14353, 14, 2, 53, 0),
	(14354, 108, 4, 53, 0),
	(14355, 108, 6, 53, 0),
	(14356, 1, 6, 53, 0),
	(14357, 1, 8, 53, 0),
	(14358, 12, 2, 53, 0),
	(14359, 12, 3, 53, 0),
	(14360, 11, 3, 53, 0),
	(14361, 11, 4, 53, 0),
	(14362, 5, 18, 53, 0),
	(14363, 5, 20, 53, 0),
	(14376, 291, 1, 0, 25),
	(14401, 346, 2, 9, 7),
	(14410, 346, 2, 9, 6),
	(14413, 369, 1, 5, 49),
	(14428, 169, 12, 54, 19),
	(14429, 169, 12, 54, 20),
	(14430, 169, 12, 54, 21),
	(14443, 369, 1, 26, 1),
	(14443, 370, 1, 26, 0),
	(14448, 10, 6, 1, 71),
	(14449, 10, 7, 1, 71),
	(14509, 8, 8, 10, 0),
	(14509, 9, 8, 10, 0),
	(14509, 10, 8, 10, 0),
	(14509, 11, 8, 10, 0),
	(14646, 29, 10, 32, 0),
	(14659, 369, 2, 0, 50),
	(14659, 370, 15, 0, 50),
	(14725, 68, 5, 25, 0),
	(14726, 68, 6, 25, 0),
	(14729, 9, 2, 8, 6),
	(14729, 165, 1, 8, 6),
	(14730, 1, 5, 8, 7),
	(14730, 63, 5, 8, 7),
	(14731, 23, 5, 8, 8),
	(14731, 62, 5, 8, 8),
	(14732, 25, 5, 8, 9),
	(14733, 68, 5, 8, 10),
	(14733, 68, 10, 8, 10),
	(14733, 436, 2, 8, 10),
	(14734, 24, 6, 8, 11),
	(14734, 26, 3, 8, 11),
	(14735, 110, 10, 8, 12),
	(14735, 306, 3, 8, 12),
	(14736, 11, 4, 8, 13),
	(14736, 118, 10, 8, 13),
	(14737, 384, 51, 8, 14),
	(14738, 5, 30, 8, 15),
	(14738, 117, 10, 8, 15),
	(14783, 8, 4, 26, 1),
	(14783, 10, 4, 26, 1),
	(14806, 4, 40, 53, 1),
	(14814, 25, -6, 52, 8),
	(14814, 30, 2, 52, 8),
	(14819, 291, 1, 0, 25),
	(14876, 23, 10, 7, 1000),
	(14878, 23, 12, 7, 1000),
	(14901, 1, 30, 49, 4277),
	(14901, 1, 30, 49, 4278),
	(14901, 1, 40, 49, 4590),
	(14901, 1, 40, 49, 4605),
	(14901, 1, 40, 49, 5928),
	(14901, 1, 40, 49, 5929),
	(14901, 1, 50, 49, 4405),
	(14901, 1, 50, 49, 4604),
	(14901, 23, 40, 49, 4590),
	(14901, 23, 40, 49, 4605),
	(14901, 23, 50, 49, 4277),
	(14901, 23, 50, 49, 4278),
	(14901, 23, 60, 49, 5928),
	(14901, 23, 60, 49, 5929),
	(14901, 230, 5, 49, 4604),
	(14901, 232, 5, 49, 4604),
	(14901, 288, 1, 49, 4277),
	(14901, 288, 5, 49, 4278),
	(14901, 302, 1, 49, 5928),
	(14901, 302, 2, 49, 5929),
	(14921, 8, 13, 26, 2),
	(14921, 384, 41, 26, 2),
	(14946, 346, 1, 13, 2),
	(14946, 346, 1, 13, 19),
	(14954, 5, 35, 14, 0),
	(14954, 71, 1, 14, 0),
	(14954, 168, -5, 14, 0),
	(15067, 1, 21, 48, 0),
	(15068, 1, 6, 48, 0),
	(15069, 385, 200, 48, 0),
	(15084, 110, 10, 26, 1),
	(15096, 8, 8, 10, 0),
	(15096, 9, 8, 10, 0),
	(15096, 10, 8, 10, 0),
	(15096, 11, 8, 10, 0),
	(15096, 12, -8, 10, 0),
	(15096, 13, -8, 10, 0),
	(15096, 14, -8, 10, 0),
	(15114, 8, 12, 26, 1),
	(15114, 384, 41, 26, 1),
	(15126, 8, -8, 11, 0),
	(15126, 9, -8, 11, 0),
	(15126, 10, -8, 11, 0),
	(15126, 11, -8, 11, 0),
	(15126, 12, 8, 11, 0),
	(15126, 13, 8, 11, 0),
	(15126, 14, 8, 11, 0),
	(15129, 68, 10, 26, 1),
	(15144, 9, 7, 26, 1),
	(15174, 25, 12, 10, 50),
	(15174, 167, 4, 10, 49),
	(15174, 404, 25, 10, 49),
	(15186, 2, 1, 51, 30),
	(15186, 2, 1, 51, 34),
	(15186, 2, 1, 51, 40),
	(15186, 2, 1, 51, 44),
	(15186, 2, 1, 51, 47),
	(15186, 2, 1, 51, 50),
	(15186, 2, 1, 51, 55),
	(15186, 2, 1, 51, 58),
	(15186, 2, 1, 51, 61),
	(15186, 2, 1, 51, 65),
	(15186, 2, 1, 51, 70),
	(15186, 2, 1, 51, 73),
	(15186, 2, 1, 51, 75),
	(15186, 2, 14, 51, 20),
	(15186, 5, 1, 51, 30),
	(15186, 5, 1, 51, 34),
	(15186, 5, 1, 51, 40),
	(15186, 5, 1, 51, 44),
	(15186, 5, 1, 51, 47),
	(15186, 5, 1, 51, 50),
	(15186, 5, 1, 51, 55),
	(15186, 5, 1, 51, 58),
	(15186, 5, 1, 51, 61),
	(15186, 5, 1, 51, 65),
	(15186, 5, 1, 51, 70),
	(15186, 5, 1, 51, 73),
	(15186, 5, 1, 51, 75),
	(15186, 5, 14, 51, 20),
	(15187, 288, 3, 7, 1000),
	(15188, 288, 2, 7, 1000),
	(15197, 25, 3, 26, 1),
	(15209, 8, 4, 1, 75),
	(15210, 8, 5, 1, 75),
	(15220, 370, 1, 52, 3),
	(15257, 110, 12, 26, 2),
	(15271, 23, 2, 8, 1),
	(15271, 85, 5, 8, 1),
	(15272, 80, 5, 8, 2),
	(15272, 291, 2, 8, 2),
	(15273, 90, 10, 8, 3),
	(15273, 370, 1, 8, 3),
	(15274, 91, 10, 8, 4),
	(15274, 296, 5, 8, 4),
	(15275, 82, 10, 8, 5),
	(15275, 432, 3, 8, 5),
	(15276, 81, 10, 8, 6),
	(15276, 165, 1, 8, 6),
	(15277, 27, 2, 8, 7),
	(15277, 109, 10, 8, 7),
	(15277, 485, 15, 8, 7),
	(15278, 86, 10, 8, 8),
	(15278, 841, 30, 8, 8),
	(15279, 84, 10, 8, 9),
	(15279, 391, 10, 8, 9),
	(15280, 119, 5, 8, 10),
	(15280, 435, 2, 8, 10),
	(15280, 436, 2, 8, 10),
	(15280, 437, 2, 8, 10),
	(15281, 105, 10, 8, 11),
	(15281, 305, 5, 8, 11),
	(15282, 73, 2, 8, 12),
	(15282, 306, 5, 8, 12),
	(15283, 12, 2, 8, 13),
	(15283, 118, 5, 8, 13),
	(15283, 259, 1, 8, 13),
	(15284, 87, 10, 8, 14),
	(15284, 361, 100, 8, 14),
	(15285, 117, 5, 8, 15),
	(15285, 346, 2, 8, 15),
	(15285, 845, 25, 8, 15),
	(15328, 370, 2, 13, 11),
	(15338, 68, 10, 26, 1),
	(15345, 384, 31, 1, 75),
	(15346, 384, 41, 1, 75),
	(15364, 169, 25, 26, 2),
	(15392, 24, 7, 7, 1000),
	(15394, 24, 8, 7, 1000),
	(15406, 68, 3, 1, 75),
	(15407, 68, 4, 1, 75),
	(15468, 163, -12, 53, 1),
	(15504, 23, 3, 53, 0),
	(15504, 25, 3, 53, 0),
	(15506, 369, 1, 1, 85),
	(15516, 24, 7, 52, 8),
	(15516, 26, -16, 52, 8),
	(15530, 368, 1, 10, 50),
	(15530, 368, 10, 10, 50),
	(15530, 404, 5, 10, 50),
	(15532, 369, -2, 56, 0),
	(15532, 370, 1, 12, 3),
	(15532, 370, 20, 56, 0),
	(15543, 8, 1, 51, 45),
	(15543, 8, 1, 51, 60),
	(15543, 8, 1, 51, 75),
	(15543, 9, 1, 51, 45),
	(15543, 9, 1, 51, 60),
	(15543, 9, 1, 51, 75),
	(15544, 2, 5, 51, 45),
	(15544, 2, 5, 51, 60),
	(15544, 2, 5, 51, 75),
	(15544, 10, 1, 51, 45),
	(15544, 10, 1, 51, 60),
	(15544, 10, 1, 51, 75),
	(15544, 11, 1, 51, 45),
	(15544, 11, 1, 51, 60),
	(15544, 11, 1, 51, 75),
	(15545, 5, 5, 51, 45),
	(15545, 5, 5, 51, 60),
	(15545, 5, 5, 51, 75),
	(15545, 12, 1, 51, 45),
	(15545, 12, 1, 51, 60),
	(15545, 12, 1, 51, 75),
	(15545, 13, 1, 51, 45),
	(15545, 13, 1, 51, 60),
	(15545, 13, 1, 51, 75),
	(15557, 6, -15, 32, 0),
	(15557, 116, 15, 32, 0),
	(15573, 68, 10, 26, 2),
	(15589, 12, 8, 11, 0),
	(15589, 13, 8, 11, 0),
	(15589, 14, 8, 11, 0),
	(15592, 68, 12, 26, 2),
	(15677, 9, 7, 26, 2),
	(15760, 5, 15, 28, 0),
	(15760, 28, 4, 28, 0),
	(15784, 5, 30, 8, 3),
	(15815, 2, 20, 26, 0),
	(15815, 5, 20, 26, 0),
	(15816, 2, 20, 26, 0),
	(15816, 5, 20, 26, 0),
	(15835, 23, 5, 4, 5),
	(15928, 370, 1, 26, 0),
	(15946, 384, 61, 52, 4),
	(15955, 421, 2, 13, 44),
	(15955, 421, 2, 13, 48),
	(15955, 421, 2, 13, 49),
	(15955, 421, 2, 13, 50),
	(15955, 421, 2, 13, 51),
	(15955, 421, 2, 13, 52),
	(15955, 421, 2, 13, 53),
	(15955, 421, 2, 13, 54),
	(15955, 421, 2, 13, 126),
	(15955, 421, 2, 13, 163),
	(15955, 421, 2, 13, 376),
	(15975, 122, 5, 8, 16),
	(15976, 24, 5, 8, 17),
	(15977, 27, -2, 8, 18),
	(15981, 73, 2, 13, 117),
	(15982, 1, 8, 13, 74),
	(15983, 23, 7, 13, 75),
	(15996, 24, 3, 26, 0),
	(15997, 24, 4, 26, 0),
	(16014, 23, 4, 22, 1),
	(16015, 2, 20, 22, 2),
	(16016, 27, -1, 22, 3),
	(16017, 28, 1, 22, 4),
	(16018, 30, 1, 22, 5),
	(16019, 9, 1, 22, 6),
	(16020, 10, 1, 22, 7),
	(16021, 8, 1, 22, 8),
	(16022, 315, 1, 22, 9),
	(16023, 14, 1, 22, 10),
	(16024, 24, 1, 22, 11),
	(16025, 73, 1, 22, 12),
	(16026, 68, 4, 22, 13),
	(16027, 25, 1, 22, 14),
	(16028, 5, 15, 22, 15),
	(16029, 2, 10, 22, 16),
	(16029, 5, 10, 22, 16),
	(16030, 26, 1, 22, 17),
	(16031, 314, 1, 22, 18),
	(16032, 289, 3, 22, 19),
	(16033, 71, 1, 22, 20),
	(16058, 161, -1, 52, 7),
	(16071, 48, 5, 13, 5),
	(16071, 165, 5, 13, 5),
	(16132, 25, -20, 26, 1),
	(16133, 25, -30, 26, 1),
	(16154, 346, 2, 9, 13),
	(16217, 240, 5, 8, 16),
	(16218, 242, 5, 8, 17),
	(16219, 107, 5, 8, 18),
	(16238, 369, 1, 13, 3),
	(16251, 71, 3, 52, 1),
	(16280, 73, 4, 52, 5),
	(16306, 25, 20, 13, 4),
	(16355, 23, 25, 0, 25),
	(16355, 25, 25, 0, 25),
	(16367, 8, 4, 52, 1),
	(16378, 14, 1, 26, 1),
	(16378, 27, -1, 0, 75),
	(16408, 8, 7, 56, 0),
	(16408, 291, 1, 56, 0),
	(16408, 369, -4, 56, 0),
	(16426, 25, 2, 0, 1),
	(16426, 25, 2, 0, 10),
	(16426, 25, 2, 0, 19),
	(16426, 25, 2, 0, 28),
	(16426, 25, 2, 0, 37),
	(16426, 25, 2, 0, 46),
	(16426, 25, 2, 0, 55),
	(16426, 25, 2, 0, 64),
	(16426, 25, 2, 0, 73),
	(16426, 25, 2, 0, 82),
	(16426, 25, 2, 0, 92),
	(16563, 9, 5, 56, 0),
	(16563, 366, 4, 56, 0),
	(16563, 369, -4, 56, 0),
	(16602, 23, 12, 6, 1000),
	(16602, 25, 5, 6, 1000),
	(16602, 366, 4, 6, 1000),
	(16605, 23, 16, 13, 94),
	(16605, 23, 16, 13, 95),
	(16605, 23, 16, 13, 96),
	(16605, 23, 16, 13, 97),
	(16605, 23, 16, 13, 98),
	(16605, 23, 16, 13, 99),
	(16605, 23, 16, 13, 277),
	(16605, 23, 16, 13, 278),
	(16605, 23, 16, 13, 279),
	(16605, 23, 16, 13, 280),
	(16605, 23, 16, 13, 281),
	(16605, 23, 16, 13, 282),
	(16605, 25, 8, 13, 94),
	(16605, 25, 8, 13, 95),
	(16605, 25, 8, 13, 96),
	(16605, 25, 8, 13, 97),
	(16605, 25, 8, 13, 98),
	(16605, 25, 8, 13, 99),
	(16605, 25, 8, 13, 277),
	(16605, 25, 8, 13, 278),
	(16605, 25, 8, 13, 279),
	(16605, 25, 8, 13, 280),
	(16605, 25, 8, 13, 281),
	(16605, 25, 8, 13, 282),
	(16647, 23, 5, 56, 0),
	(16647, 369, -2, 56, 0),
	(16647, 370, 10, 56, 0),
	(16728, 25, 10, 26, 1),
	(16732, 8, 1, 53, 1),
	(16733, 8, 2, 53, 1),
	(16735, 2, -20, 47, 0),
	(16735, 57, -10, 47, 0),
	(16735, 59, -10, 47, 0),
	(16793, 2, -20, 47, 0),
	(16793, 58, -10, 47, 0),
	(16793, 60, -10, 47, 0),
	(16883, 25, 10, 52, 3),
	(16892, 2, -20, 47, 0),
	(16892, 59, -10, 47, 0),
	(16892, 61, -10, 47, 0),
	(16899, 110, 5, 25, 0),
	(16911, 366, 1, 0, 1),
	(16911, 366, 1, 0, 10),
	(16911, 366, 1, 0, 19),
	(16911, 366, 1, 0, 28),
	(16911, 366, 1, 0, 37),
	(16911, 366, 1, 0, 46),
	(16911, 366, 1, 0, 55),
	(16911, 366, 1, 0, 64),
	(16911, 366, 1, 0, 73),
	(16911, 366, 1, 0, 82),
	(16911, 366, 1, 0, 92),
	(16948, 10, 2, 53, 1),
	(16949, 10, 3, 53, 1),
	(16952, 2, -20, 47, 0),
	(16952, 55, -10, 47, 0),
	(16952, 57, -10, 47, 0),
	(16976, 23, 18, 6, 1000),
	(16976, 25, 5, 6, 1000),
	(16976, 366, 6, 6, 1000),
	(17070, 370, 20, 52, 3),
	(17073, 369, 2, 7, 20),
	(17073, 406, 20, 7, 20),
	(17093, 12, 8, 56, 0),
	(17093, 13, 8, 56, 0),
	(17093, 14, 8, 56, 0),
	(17093, 28, 15, 56, 0),
	(17093, 369, -4, 56, 0),
	(17158, 26, 5, 56, 0),
	(17158, 27, -2, 56, 0),
	(17158, 369, -4, 56, 0),
	(17165, 370, 5, 26, 0),
	(17192, 165, 3, 21, 10),
	(17204, 56, 15, 31, 0),
	(17204, 376, 10, 31, 0),
	(17207, 376, 13, 47, 0),
	(17212, 24, 5, 37, 4),
	(17212, 24, 10, 37, 3),
	(17212, 24, 10, 37, 5),
	(17212, 24, 15, 37, 2),
	(17212, 24, 15, 37, 6),
	(17212, 24, 20, 37, 1),
	(17212, 24, 20, 37, 7),
	(17212, 24, 25, 37, 0),
	(17212, 26, 5, 37, 0),
	(17212, 26, 10, 37, 1),
	(17212, 26, 10, 37, 7),
	(17212, 26, 15, 37, 2),
	(17212, 26, 15, 37, 6),
	(17212, 26, 20, 37, 3),
	(17212, 26, 20, 37, 5),
	(17212, 26, 25, 37, 4),
	(17269, 24, 8, 53, 1),
	(17270, 24, 9, 53, 1),
	(17275, 165, 6, 47, 0),
	(17275, 376, 13, 47, 0),
	(17333, 10, 1, 56, 0),
	(17333, 24, 10, 56, 0),
	(17333, 369, -1, 56, 0),
	(17365, 8, 4, 25, 0),
	(17446, 5, 18, 53, 1),
	(17447, 5, 20, 53, 1),
	(17448, 13, 1, 53, 1),
	(17449, 13, 2, 53, 1),
	(17451, 165, 6, 47, 0),
	(17451, 366, 13, 47, 0),
	(17456, 2, -10, 47, 0),
	(17456, 5, -10, 47, 0),
	(17456, 57, -10, 47, 0),
	(17456, 59, -10, 47, 0),
	(17461, 23, 10, 56, 0),
	(17461, 112, 6, 56, 0),
	(17461, 369, -4, 56, 0),
	(17465, 12, 8, 28, 0),
	(17465, 13, 8, 28, 0),
	(17465, 54, 15, 28, 0),
	(17471, 23, 10, 0, 25),
	(17471, 25, 10, 0, 25),
	(17501, 14, 3, 53, 1),
	(17502, 9, 2, 53, 1),
	(17502, 14, 4, 53, 1),
	(17502, 110, 10, 53, 1),
	(17507, 2, -20, 47, 0),
	(17507, 57, -10, 47, 0),
	(17507, 59, -10, 47, 0),
	(17509, 165, 6, 47, 0),
	(17509, 366, 13, 47, 0),
	(17527, 2, -10, 47, 0),
	(17527, 5, -10, 47, 0),
	(17527, 54, -10, 47, 0),
	(17527, 60, -10, 47, 0),
	(17539, 2, 10, 53, 1),
	(17539, 5, 10, 53, 1),
	(17540, 2, 12, 53, 1),
	(17540, 5, 12, 53, 1),
	(17581, 56, 15, 31, 0),
	(17581, 111, 13, 31, 0),
	(17581, 115, 13, 31, 0),
	(17589, 165, 6, 47, 0),
	(17589, 366, 13, 47, 0),
	(17590, 25, 10, 49, 4468),
	(17590, 25, 10, 49, 4596),
	(17590, 171, 83, 49, 4468),
	(17590, 171, 83, 49, 4596),
	(17591, 25, 12, 49, 4468),
	(17591, 25, 12, 49, 4596),
	(17591, 171, 80, 49, 4468),
	(17591, 171, 80, 49, 4596),
	(17592, 25, 10, 49, 4468),
	(17592, 25, 10, 49, 4596),
	(17592, 171, 83, 49, 4468),
	(17592, 171, 83, 49, 4596),
	(17599, 315, 25, 52, 8),
	(17616, 2, -20, 47, 0),
	(17616, 55, -10, 47, 0),
	(17616, 57, -10, 47, 0),
	(17619, 25, 12, 26, 0),
	(17624, 165, 7, 13, 3),
	(17649, 25, 12, 26, 1),
	(17654, 2, -20, 47, 0),
	(17654, 54, -10, 47, 0),
	(17654, 56, -10, 47, 0),
	(17662, 366, -2, 15, 2),
	(17662, 366, -2, 15, 3),
	(17662, 366, -2, 15, 4),
	(17662, 366, -2, 15, 5),
	(17662, 366, -2, 15, 6),
	(17662, 366, 2, 15, 2),
	(17662, 366, 2, 15, 3),
	(17662, 366, 2, 15, 4),
	(17662, 366, 2, 15, 5),
	(17666, 24, 4, 53, 1),
	(17666, 26, 4, 53, 1),
	(17667, 24, 5, 53, 1),
	(17667, 26, 5, 53, 1),
	(17670, 9, 3, 53, 1),
	(17671, 9, 4, 53, 1),
	(17672, 2, 5, 53, 1),
	(17672, 5, 5, 53, 1),
	(17673, 2, 6, 53, 1),
	(17673, 5, 6, 53, 1),
	(17674, 5, 14, 53, 1),
	(17675, 5, 16, 53, 1),
	(17676, 2, 18, 53, 1),
	(17677, 2, 20, 53, 1),
	(17680, 5, 18, 53, 1),
	(17681, 5, 20, 53, 1),
	(17697, 56, 15, 31, 0),
	(17697, 366, 8, 31, 0),
	(17699, 165, 6, 47, 0),
	(17699, 366, 13, 47, 0),
	(17711, 431, 1, 21, 14),
	(17720, 366, 1, 15, 2),
	(17720, 366, 1, 15, 3),
	(17720, 366, 1, 15, 4),
	(17720, 366, 1, 15, 5),
	(17720, 366, 1, 15, 6),
	(17741, 23, 15, 6, 1000),
	(17741, 25, 5, 6, 1000),
	(17741, 366, 6, 6, 1000),
	(17766, 10, 2, 16, 3),
	(17766, 10, 2, 16, 4),
	(17766, 10, 2, 16, 5),
	(17766, 10, 2, 16, 6),
	(17773, 2, -20, 47, 0),
	(17773, 54, -10, 47, 0),
	(17773, 60, -10, 47, 0),
	(17788, 8, 4, 32, 0),
	(17788, 27, 1, 32, 0),
	(17791, 54, 15, 28, 0),
	(17791, 366, 7, 28, 0),
	(17793, 165, 6, 47, 0),
	(17793, 366, 13, 47, 0),
	(17814, 23, 10, 52, 6),
	(17815, 2, -20, 47, 0),
	(17815, 55, -10, 47, 0),
	(17815, 61, -10, 47, 0),
	(17824, 54, 15, 28, 0),
	(17824, 366, 10, 28, 0),
	(17827, 165, 6, 47, 0),
	(17827, 366, 13, 47, 0),
	(17831, 369, 1, 13, 2),
	(17831, 370, 1, 13, 19),
	(17843, 121, 3, 53, 1),
	(17931, 9, 2, 53, 1),
	(17932, 9, 3, 53, 1),
	(17933, 2, -20, 47, 0),
	(17933, 56, -10, 47, 0),
	(17933, 58, -10, 47, 0),
	(17941, 56, 15, 31, 0),
	(17941, 366, 5, 31, 0),
	(17944, 165, 6, 47, 0),
	(17944, 366, 13, 47, 0),
	(17946, 23, 18, 6, 1000),
	(17946, 25, 5, 6, 1000),
	(17946, 366, 6, 6, 1000),
	(17947, 24, 3, 53, 0),
	(17947, 26, 3, 53, 0),
	(17952, 160, 2, 15, 2),
	(17952, 160, 2, 15, 3),
	(17952, 160, 2, 15, 4),
	(17952, 160, 2, 15, 5),
	(17952, 160, 2, 15, 6),
	(17952, 366, 2, 16, 2),
	(17952, 366, 2, 16, 3),
	(17952, 366, 2, 16, 4),
	(17952, 366, 2, 16, 5),
	(17970, 9, 1, 16, 3),
	(17970, 9, 1, 16, 4),
	(17970, 9, 1, 16, 5),
	(17970, 9, 1, 16, 6),
	(17970, 23, 2, 16, 3),
	(17970, 23, 2, 16, 4),
	(17970, 23, 2, 16, 5),
	(17970, 23, 2, 16, 6),
	(17972, 11, 1, 53, 1),
	(17973, 11, 2, 53, 1),
	(17978, 23, 5, 53, 1),
	(17979, 23, 7, 53, 1),
	(17983, 366, 1, 0, 1),
	(17983, 366, 1, 0, 10),
	(17983, 366, 1, 0, 19),
	(17983, 366, 1, 0, 28),
	(17983, 366, 1, 0, 37),
	(17983, 366, 1, 0, 46),
	(17983, 366, 1, 0, 55),
	(17983, 366, 1, 0, 64),
	(17983, 366, 1, 0, 73),
	(17983, 366, 1, 0, 82),
	(17983, 366, 1, 0, 92),
	(17990, 5, 14, 53, 1),
	(17991, 5, 16, 53, 1),
	(18000, 56, 15, 31, 0),
	(18000, 366, 10, 31, 0),
	(18005, 165, 6, 47, 0),
	(18005, 366, 15, 47, 0),
	(18015, 23, 16, 6, 1000),
	(18015, 25, 5, 6, 1000),
	(18015, 366, 7, 6, 1000),
	(18021, 366, 5, 21, 11),
	(18036, 5, 10, 53, 1),
	(18037, 5, 12, 53, 1),
	(18049, 56, 15, 31, 0),
	(18049, 366, 8, 31, 0),
	(18053, 165, 6, 47, 0),
	(18053, 366, 13, 47, 0),
	(18063, 25, 13, 21, 13),
	(18070, 25, 3, 53, 1),
	(18071, 25, 4, 53, 1),
	(18072, 23, 8, 53, 1),
	(18073, 23, 9, 53, 1),
	(18075, 8, 2, 26, 2),
	(18084, 9, 6, 56, 0),
	(18084, 288, 5, 56, 0),
	(18084, 369, -2, 56, 0),
	(18091, 54, 15, 28, 0),
	(18091, 366, 12, 28, 0),
	(18097, 165, 6, 47, 0),
	(18097, 366, 13, 47, 0),
	(18099, 23, 24, 6, 1000),
	(18099, 25, 5, 6, 1000),
	(18099, 366, 5, 6, 1000),
	(18132, 25, 4, 53, 1),
	(18132, 26, 4, 53, 1),
	(18133, 25, 5, 53, 1),
	(18133, 26, 5, 53, 1),
	(18134, 8, 2, 53, 1),
	(18135, 8, 3, 53, 1),
	(18144, 2, -20, 47, 0),
	(18144, 56, -10, 47, 0),
	(18144, 58, -10, 47, 0),
	(18146, 2, -20, 47, 0),
	(18146, 57, -10, 47, 0),
	(18146, 59, -10, 47, 0),
	(18165, 2, 30, 26, 0),
	(18165, 68, 10, 26, 1),
	(18206, 25, 5, 56, 0),
	(18206, 167, 9, 56, 0),
	(18206, 369, -3, 56, 0),
	(18213, 54, 15, 28, 0),
	(18213, 366, 10, 28, 0),
	(18217, 165, 6, 47, 0),
	(18217, 366, 13, 47, 0),
	(18256, 23, 1, 25, 0),
	(18256, 25, 1, 25, 0),
	(18256, 68, 1, 25, 0),
	(18261, 59, 7, 48, 0),
	(18261, 366, 15, 48, 0),
	(18262, 59, 9, 48, 0),
	(18262, 366, 2, 48, 0),
	(18267, 61, 7, 48, 0),
	(18267, 366, 22, 48, 0),
	(18268, 61, 9, 48, 0),
	(18268, 366, 3, 48, 0),
	(18273, 58, 7, 48, 0),
	(18273, 366, 39, 48, 0),
	(18274, 58, 9, 48, 0),
	(18274, 366, 8, 48, 0),
	(18279, 56, 7, 48, 0),
	(18279, 366, 79, 48, 0),
	(18280, 56, 9, 48, 0),
	(18280, 366, 5, 48, 0),
	(18285, 60, 7, 48, 0),
	(18285, 366, 45, 48, 0),
	(18286, 60, 9, 48, 0),
	(18286, 366, 4, 48, 0),
	(18291, 60, 7, 48, 0),
	(18291, 366, 86, 48, 0),
	(18292, 60, 9, 48, 0),
	(18292, 366, 4, 48, 0),
	(18297, 57, 7, 48, 0),
	(18297, 366, 81, 48, 0),
	(18298, 57, 9, 48, 0),
	(18298, 366, 2, 48, 0),
	(18303, 55, 7, 48, 0),
	(18303, 366, 81, 48, 0),
	(18304, 55, 9, 48, 0),
	(18304, 366, 3, 48, 0),
	(18309, 61, 7, 48, 0),
	(18309, 366, 32, 48, 0),
	(18310, 61, 9, 48, 0),
	(18310, 366, 7, 48, 0),
	(18315, 56, 7, 48, 0),
	(18315, 366, 75, 48, 0),
	(18316, 56, 9, 48, 0),
	(18316, 366, 3, 48, 0),
	(18321, 58, 7, 48, 0),
	(18321, 366, 28, 48, 0),
	(18322, 58, 9, 48, 0),
	(18322, 366, 5, 48, 0),
	(18327, 54, 7, 48, 0),
	(18327, 366, 54, 48, 0),
	(18328, 54, 9, 48, 0),
	(18328, 366, 3, 48, 0),
	(18333, 54, 7, 48, 0),
	(18333, 366, 38, 48, 0),
	(18334, 54, 9, 48, 0),
	(18334, 366, 3, 48, 0),
	(18339, 14, 1, 48, 0),
	(18339, 55, 7, 48, 0),
	(18340, 14, 2, 48, 0),
	(18340, 55, 9, 48, 0),
	(18341, 14, 3, 48, 0),
	(18341, 452, 2, 48, 0),
	(18345, 59, 7, 48, 0),
	(18345, 366, 67, 48, 0),
	(18346, 59, 9, 48, 0),
	(18346, 366, 3, 48, 0),
	(18352, 54, 15, 28, 0),
	(18352, 366, 5, 28, 0),
	(18358, 23, 14, 6, 1000),
	(18358, 25, 5, 6, 1000),
	(18358, 366, 5, 6, 1000),
	(18374, 54, 15, 28, 0),
	(18374, 366, 9, 28, 0),
	(18378, 165, 6, 47, 0),
	(18378, 366, 13, 47, 0),
	(18390, 28, 3, 8, 4),
	(18422, 62, 1, 13, 66),
	(18422, 62, 1, 13, 444),
	(18422, 62, 1, 13, 445),
	(18422, 62, 1, 13, 446),
	(18425, 23, 10, 6, 1000),
	(18425, 25, 5, 6, 1000),
	(18425, 366, 5, 6, 1000),
	(18445, 73, 10, 0, 50),
	(18486, 171, -30, 25, 0),
	(18491, 23, 10, 6, 1000),
	(18491, 25, 5, 6, 1000),
	(18491, 366, 5, 6, 1000),
	(18508, 8, 1, 16, 3),
	(18508, 8, 1, 16, 4),
	(18508, 8, 1, 16, 5),
	(18508, 8, 1, 16, 6),
	(18508, 25, 2, 16, 3),
	(18508, 25, 2, 16, 4),
	(18508, 25, 2, 16, 5),
	(18508, 25, 2, 16, 6),
	(18581, 431, 2, 21, 8),
	(18588, 23, 15, 6, 1000),
	(18588, 25, 5, 6, 1000),
	(18588, 366, 6, 6, 1000),
	(18717, 24, 18, 6, 1000),
	(18717, 26, 5, 6, 1000),
	(18717, 366, 6, 6, 1000),
	(18718, 24, 18, 6, 1000),
	(18718, 26, 5, 6, 1000),
	(18718, 366, 4, 6, 1000),
	(18741, 23, 10, 9, 4),
	(18757, 8, 2, 37, 4),
	(18757, 9, 2, 37, 4),
	(18758, 8, 3, 37, 4),
	(18758, 9, 3, 37, 4),
	(18768, 23, 12, 9, 4),
	(18771, 23, 1, 16, 3),
	(18771, 23, 1, 16, 4),
	(18771, 23, 1, 16, 5),
	(18771, 23, 1, 16, 6),
	(18850, 23, 14, 6, 1000),
	(18850, 25, 5, 6, 1000),
	(18850, 366, 5, 6, 1000),
	(18859, 370, 3, 0, 50),
	(18943, 23, 14, 6, 1000),
	(18943, 25, 5, 6, 1000),
	(18943, 366, 5, 6, 1000),
	(18949, 302, 1, 0, 25),
	(18958, 8, 1, 16, 3),
	(18958, 8, 1, 16, 4),
	(18958, 8, 1, 16, 5),
	(18958, 8, 1, 16, 6),
	(19108, 366, 5, 0, 75),
	(19120, 25, 6, 13, 368),
	(19120, 25, 6, 13, 369),
	(19120, 25, 6, 13, 370),
	(19123, 73, 12, 7, 1000),
	(19125, 9, 1, 16, 3),
	(19125, 9, 1, 16, 4),
	(19125, 9, 1, 16, 5),
	(19125, 9, 1, 16, 6),
	(19126, 23, 20, 6, 1000),
	(19126, 165, 8, 6, 1000),
	(19161, 8, 1, 16, 3),
	(19161, 8, 1, 16, 4),
	(19161, 8, 1, 16, 5),
	(19161, 8, 1, 16, 6),
	(19222, 24, 3, 52, 3),
	(19233, 13, 1, 16, 3),
	(19233, 13, 1, 16, 4),
	(19233, 13, 1, 16, 5),
	(19233, 13, 1, 16, 6),
	(19234, 11, 1, 16, 3),
	(19234, 11, 1, 16, 4),
	(19234, 11, 1, 16, 5),
	(19234, 11, 1, 16, 6),
	(19279, 9, 1, 16, 3),
	(19279, 9, 1, 16, 4),
	(19279, 9, 1, 16, 5),
	(19279, 9, 1, 16, 6),
	(19306, 8, 1, 16, 3),
	(19306, 8, 1, 16, 4),
	(19306, 8, 1, 16, 5),
	(19306, 8, 1, 16, 6),
	(19306, 23, 2, 16, 3),
	(19306, 23, 2, 16, 4),
	(19306, 23, 2, 16, 5),
	(19306, 23, 2, 16, 6);
/*!40000 ALTER TABLE `item_latents` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
