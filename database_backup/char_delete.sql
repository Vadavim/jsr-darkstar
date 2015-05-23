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

-- Dumping structure for trigger dspdb.char_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `char_delete` BEFORE DELETE ON `chars` FOR EACH ROW BEGIN
	DELETE FROM `char_effects`   WHERE `charid` = OLD.charid;
	DELETE FROM `char_equip`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_exp`       WHERE `charid` = OLD.charid;
	DELETE FROM `char_inventory` WHERE `charid` = OLD.charid;
	DELETE FROM `char_jobs`      WHERE `charid` = OLD.charid;
	DELETE FROM `char_look`      WHERE `charid` = OLD.charid;
	DELETE FROM `char_pet`       WHERE `charid` = OLD.charid;
	DELETE FROM `char_points`    WHERE `charid` = OLD.charid;
	DELETE FROM `char_profile`   WHERE `charid` = OLD.charid;
	DELETE FROM `char_skills`    WHERE `charid` = OLD.charid;
	DELETE FROM `char_stats`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_storage`   WHERE `charid` = OLD.charid;
	DELETE FROM `char_vars`      WHERE `charid` = OLD.charid;
	DELETE FROM `char_weapon_skill_points` WHERE `charid` = OLD.charid;
	DELETE FROM `auction_house`  WHERE `seller` = OLD.charid;
	DELETE FROM `delivery_box`   WHERE `charid` = OLD.charid;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
