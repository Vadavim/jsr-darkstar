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

-- Dumping structure for table dspdb.useful_items
CREATE TABLE IF NOT EXISTS `useful_items` (
  `name` char(50) DEFAULT NULL,
  `type` char(50) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.useful_items: ~82 rows (approximately)
/*!40000 ALTER TABLE `useful_items` DISABLE KEYS */;
REPLACE INTO `useful_items` (`name`, `type`, `itemid`, `level`, `notes`) VALUES
	('beluga', 'scythe', 18953, 40, 'available'),
	('mutilator', 'scythe', 18046, 40, 'horlais bcnm'),
	('falcastra', 'scythe', 16771, 47, 'eldieme chest'),
	('smiting_scythe_+1', 'scythe', 18960, 54, 'available'),
	('vassago_scythe', 'scythe', 16788, 58, 'waughroon bcnm'),
	('blackjack', 'scythe', 18066, 69, 'bloody bones NM'),
	('vendetta', 'scythe', 18951, 69, 'available past'),
	('havoc_scythe', 'scythe', 18047, 70, 'available elite'),
	('molioness_sickle', 'scythe', 18947, 70, 'available elite'),
	('king_maker', 'scythe', 18048, 70, 'available bcnm'),
	('zareehkl_scythe', 'scythe', 18949, 71, 'available elite'),
	('faucheuse', 'scythe', 18952, 69, 'available past'),
	('gravedigger', 'scythe', 18053, 73, 'available bcnm'),
	('white_joker', 'scythe', 18950, 74, 'available NM velionis'),
	('trident', 'polearm', 16837, 45, 'available'),
	('schwarz_lance', 'polearm', 18087, 60, 'available bcnm'),
	('skystrider', 'polearm', 18128, 69, 'available past'),
	('bourdonasse', 'polearm', 18092, 70, 'available bcnm'),
	('schiltron_spear', 'polearm', 18089, 60, 'available bcnm'),
	('dreizack', 'polearm', 18088, 72, 'available elite'),
	('tomoe', 'polearm', 18126, 72, 'available elite'),
	('achilles_spear', 'polearm', 18127, 74, 'available elite'),
	('dabo', 'polearm', 18129, 75, 'available elite'),
	('mezraq_+1', 'polearm', 18129, 75, 'available elite'),
	('mercurial_sword', 'greatsword', 18377, 62, 'available'),
	('balisarde', 'greatsword', 19156, 69, 'available past'),
	('gloom_claymore', 'greatsword', 18386, 70, 'available basic'),
	('ferrara', 'greatsword', 19154, 70, 'available basic'),
	('naglering', 'greatsword', 19153, 4, 'available elite'),
	('algol', 'greatsword', 18385, 5, 'available elite'),
	('magnet_knife', 'dagger', 18026, 70, 'available'),
	('palladium_dagger', 'dagger', 18027, 70, 'available basic'),
	('cinquedea', 'dagger', 19123, 71, 'available elite'),
	('matrons_knife', 'dagger', 18028, 71, 'available basic'),
	('xs_knife', 'dagger', 18019, 72, 'available'),
	('papilio_kirpan', 'dagger', 19126, 72, 'available'),
	('stylet', 'dagger', 17996, 71, 'available basic'),
	('bartholomews_knife', 'dagger', 17623, 71, 'available'),
	('dragon_staff', 'staff', 17597, 40, 'available'),
	('rockmasher', 'staff', 17106, 56, 'really available'),
	('archalauss_pole', 'staff', 17574, 60, 'available'),
	('catalyst', 'staff', 18597, 69, 'available past'),
	('kebbie', 'staff', 18596, 69, 'available past'),
	('mercurial_pole', 'staff', 17586, 70, 'available'),
	('grim_staff', 'staff', 17576, 71, 'available bcnm'),
	('alkalurops', 'staff', 18593, 73, 'available'),
	('mekki_shakki', 'staff', 18595, 73, 'available'),
	('dorje', 'staff', 18594, 75, 'available elite'),
	('wurger', 'bow', 19222, 21, 'available'),
	('shikar_bow', 'bow', 17203, 40, 'available bcnm'),
	('eurytos_bow', 'bow', 17187, 55, 'available bcnm'),
	('sarnga', 'bow', 17190, 59, 'available bcnm'),
	('amanokakoyumi', 'bow', 19215, 69, 'available past'),
	('failnaught', 'bow', 19216, 69, 'available past'),
	('murderer', 'gun', 19218, 69, 'available past'),
	('gosveneurs_bow', 'crossbow', 17245, 69, 'available bcnm elite'),
	('octant', 'crossbow', 19232, 71, 'available'),
	('peacemaker', 'available', 18706, 72, 'available basic'),
	('grand_Crossbow', 'crossbow', 19208, 74, 'available elite'),
	('veuglaire', 'gun', 19235, 74, 'available basic'),
	('fourth_division_gun', 'gun', 18727, 60, 'available past'),
	('armbrust', 'crossbow', 17235, 58, 'available bcnm'),
	('trump_gun', 'gun', 18702, 40, 'available'),
	('useshi', 'knuckles', 18760, 69, 'available past'),
	('acantha_shavers', 'knuckles', 18761, 69, 'available past'),
	('shenlongs_baghnakhs', 'knuckles', 18759, 71, 'available elite'),
	('eriks_axe', 'greataxe', 18487, 68, 'available'),
	('alastor', 'greataxe', 18499, 69, 'available past'),
	('sparth', 'greataxe', 18500, 69, 'available past'),
	('fourth_division_toporok', 'greataxe', 18494, 71, 'available'),
	('gawains_axe', 'greataxe', 18211, 71, 'available past'),
	('foolkiller', 'greataxe', 18497, 72, 'available elite'),
	('angel_lyre', 'instrument', 17840, 71, 'available bcnm'),
	('iron_ram_horn', 'instrument', 17853, 60, 'available past'),
	('requiem_flute', 'instrument', 17852, 72, 'available'),
	('harlequins_horn', 'instrument', 17838, 70, 'available bcnm'),
	('cradle_horn', 'instrument', 17854, 70, 'available past'),
	('kogitsunemaru', 'katana', 18428, 62, 'available past'),
	('otori', 'katana', 18418, 74, 'available'),
	('kugui', 'katana', 18419, 74, 'available basic'),
	('oninohocho', 'katana', 18430, 73, 'available'),
	('shusui', 'katana', 18429, 72, 'available elite'),
	('yagentoshiro', 'katana', 19272, 69, 'available past'),
	('osoraku', 'katana', 19271, 69, 'available past'),
	('imanotsurugi', 'katana', 17799, 67, 'available'),
	('mokusa', 'greatkatana', 18451, 30, 'available'),
	('amakura', 'greatkatana', 18445, 57, 'available'),
	('omokage', 'greatkatana', 17822, 60, 'available bcnm'),
	('namioyogi', 'greatkatana', 18449, 69, 'available past'),
	('mukademaru', 'greatkatana', 18450, 69, 'available past'),
	('nanatsusayanotachi', 'greatkatana', 18447, 57, 'available elite');
/*!40000 ALTER TABLE `useful_items` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
