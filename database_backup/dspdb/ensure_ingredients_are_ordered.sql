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

-- Dumping structure for trigger dspdb.ensure_ingredients_are_ordered
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `ensure_ingredients_are_ordered` BEFORE INSERT ON `synth_recipes` FOR EACH ROW BEGIN
          IF NEW.Ingredient2 > 0 AND NEW.Ingredient1 > NEW.Ingredient2
          THEN
            SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:synth_recipes] - `Ingredient1` is larger than Ingredient2';
          END IF;

          IF NEW.Ingredient3 > 0 AND NEW.Ingredient2 > NEW.Ingredient3
          THEN
            SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:synth_recipes] - `Ingredient2` is larger than Ingredient3';
          END IF;

          IF NEW.Ingredient4 > 0 AND NEW.Ingredient3 > NEW.Ingredient4
          THEN
            SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:synth_recipes] - `Ingredient3` is larger than Ingredient4';
          END IF;

          IF NEW.Ingredient5 > 0 AND NEW.Ingredient4 > NEW.Ingredient5
          THEN
            SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:synth_recipes] - `Ingredient4` is larger than Ingredient5';
          END IF;

          IF NEW.Ingredient6 > 0 AND NEW.Ingredient5 > NEW.Ingredient6
          THEN
            SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:synth_recipes] - `Ingredient5` is larger than Ingredient6';
          END IF;

          IF NEW.Ingredient7 > 0 AND NEW.Ingredient6 > NEW.Ingredient7
          THEN
            SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:synth_recipes] - `Ingredient6` is larger than Ingredient7';
          END IF;

          IF NEW.Ingredient8 > 0 AND NEW.Ingredient7 > NEW.Ingredient8
          THEN
            SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:synth_recipes] - `Ingredient7` is larger than Ingredient8';
          END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
