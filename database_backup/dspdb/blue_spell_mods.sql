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

-- Dumping structure for table dspdb.blue_spell_mods
CREATE TABLE IF NOT EXISTS `blue_spell_mods` (
  `spellId` smallint(3) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.blue_spell_mods: 295 rows
DELETE FROM `blue_spell_mods`;
/*!40000 ALTER TABLE `blue_spell_mods` DISABLE KEYS */;
INSERT INTO `blue_spell_mods` (`spellId`, `modid`, `value`) VALUES
	(513, 13, 2),
	(515, 13, 2),
	(517, 0, 0),
	(519, 10, 1),
	(519, 14, 1),
	(519, 2, 10),
	(521, 5, 5),
	(522, 2, -5),
	(522, 5, 5),
	(524, 10, 1),
	(527, 11, 3),
	(529, 8, 1),
	(530, 11, 2),
	(531, 12, 1),
	(532, 9, 3),
	(533, 8, 2),
	(534, 11, 3),
	(535, 12, -1),
	(536, 13, 1),
	(537, 11, 1),
	(538, 12, 1),
	(539, 2, -5),
	(539, 5, 10),
	(540, 10, 2),
	(540, 12, 1),
	(540, 13, 1),
	(541, 2, -5),
	(541, 5, 5),
	(542, 2, -5),
	(542, 5, 5),
	(543, 12, 1),
	(544, 13, 1),
	(545, 2, -5),
	(545, 5, 15),
	(547, 10, 3),
	(548, 10, 1),
	(549, 2, 5),
	(549, 14, 1),
	(551, 13, 1),
	(554, 13, 2),
	(554, 14, 2),
	(554, 2, 5),
	(555, 10, 2),
	(557, 2, -5),
	(557, 5, 15),
	(560, 12, 1),
	(561, 11, 2),
	(563, 11, 1),
	(564, 10, 1),
	(564, 5, 5),
	(565, 2, 5),
	(565, 14, 1),
	(567, 14, 1),
	(567, 2, 5),
	(569, 9, 2),
	(570, 2, -5),
	(570, 5, 5),
	(572, 0, 0),
	(573, 11, 1),
	(574, 0, 0),
	(575, 5, 15),
	(576, 2, 5),
	(576, 14, 1),
	(577, 11, 1),
	(578, 2, 5),
	(579, 11, 2),
	(581, 2, 10),
	(581, 14, 1),
	(582, 11, 1),
	(584, 2, 5),
	(584, 14, 1),
	(585, 2, 5),
	(587, 10, 1),
	(588, 2, -5),
	(589, 9, 1),
	(589, 14, 1),
	(589, 2, 5),
	(591, 8, 3),
	(592, 0, 0),
	(593, 14, 1),
	(593, 2, 5),
	(594, 8, 2),
	(594, 9, 1),
	(595, 10, 3),
	(595, 11, 3),
	(596, 8, 1),
	(597, 13, 1),
	(598, 2, -5),
	(598, 5, 5),
	(599, 2, -5),
	(599, 5, 5),
	(603, 14, 1),
	(603, 2, 10),
	(604, 12, 2),
	(604, 13, 2),
	(605, 2, -5),
	(605, 5, 10),
	(606, 13, 1),
	(608, 12, 1),
	(610, 12, 1),
	(611, 12, 1),
	(611, 13, 1),
	(612, 2, 20),
	(612, 14, 2),
	(613, 12, 3),
	(613, 13, 3),
	(614, 5, 10),
	(614, 10, 2),
	(614, 11, 2),
	(615, 8, 3),
	(615, 9, 3),
	(616, 2, 20),
	(616, 5, 15),
	(617, 10, 1),
	(617, 2, -5),
	(617, 5, 5),
	(618, 8, 1),
	(620, 9, 2),
	(621, 10, 1),
	(622, 12, 1),
	(623, 9, 2),
	(626, 8, 2),
	(628, 9, 2),
	(629, 11, 1),
	(631, 13, 2),
	(632, 10, 1),
	(633, 2, -5),
	(633, 5, 5),
	(634, 2, 15),
	(634, 14, 1),
	(636, 10, 1),
	(637, 8, 3),
	(638, 14, 2),
	(638, 2, 5),
	(640, 13, 2),
	(641, 9, 2),
	(641, 11, 1),
	(642, 2, -5),
	(642, 5, 5),
	(643, 8, 1),
	(643, 9, 1),
	(644, 5, 5),
	(644, 13, 1),
	(645, 2, 5),
	(645, 5, 5),
	(645, 14, 1),
	(646, 5, -5),
	(646, 13, 2),
	(647, 11, 2),
	(648, 5, 3),
	(648, 12, 1),
	(648, 13, 1),
	(650, 10, 1),
	(651, 2, -10),
	(651, 5, 10),
	(652, 2, 5),
	(652, 8, 1),
	(653, 11, 3),
	(654, 2, 10),
	(654, 10, 3),
	(655, 8, 3),
	(656, 9, 2),
	(656, 13, 2),
	(657, 11, 1),
	(657, 10, 2),
	(658, 5, 5),
	(658, 8, 2),
	(659, 8, 2),
	(659, 10, 3),
	(660, 9, 1),
	(660, 11, 2),
	(661, 2, 20),
	(662, 5, 10),
	(662, 13, 1),
	(663, 5, 3),
	(663, 13, 1),
	(663, 14, 1),
	(664, 13, 2),
	(665, 2, -20),
	(665, 11, 5),
	(666, 2, 10),
	(666, 9, 2),
	(666, 13, -3),
	(667, 11, 3),
	(667, 14, -2),
	(668, 5, 7),
	(668, 12, 2),
	(669, 8, 2),
	(669, 9, 2),
	(670, 8, 2),
	(670, 10, 2),
	(670, 9, -1),
	(670, 11, -1),
	(671, 12, 3),
	(671, 14, -2),
	(672, 13, 3),
	(672, 14, -2),
	(673, 9, 3),
	(673, 14, -2),
	(674, 2, -10),
	(674, 9, 2),
	(674, 11, 2),
	(675, 10, 2),
	(677, 8, 3),
	(677, 14, -2),
	(678, 2, 5),
	(678, 5, 5),
	(678, 14, 2),
	(679, 10, 3),
	(679, 14, -2),
	(680, 2, -10),
	(680, 9, 2),
	(680, 12, 2),
	(681, 13, 3),
	(681, 14, -2),
	(682, 2, 15),
	(682, 5, -5),
	(682, 12, -1),
	(683, 12, 2),
	(683, 13, 2),
	(683, 8, -1),
	(683, 10, -1),
	(684, 8, 2),
	(684, 11, 2),
	(685, 2, 15),
	(685, 5, -15),
	(685, 10, 3),
	(686, 8, 2),
	(686, 13, 2),
	(687, 5, 20),
	(687, 12, 4),
	(687, 13, 2),
	(687, 8, -3),
	(687, 10, -3),
	(688, 8, 2),
	(689, 11, 2),
	(689, 13, 2),
	(690, 2, 5),
	(690, 11, 1),
	(692, 2, -5),
	(692, 5, -5),
	(692, 11, 1),
	(692, 9, 1),
	(693, 8, 3),
	(693, 14, 3),
	(694, 2, 15),
	(694, 10, 4),
	(695, 8, 2),
	(695, 9, 2),
	(696, 2, 10),
	(696, 8, 3),
	(696, 10, 3),
	(696, 9, -2),
	(696, 11, -2),
	(697, 12, 5),
	(697, 13, 2),
	(698, 8, 2),
	(698, 11, 2),
	(699, 8, -3),
	(699, 9, 4),
	(700, 9, 6),
	(701, 11, 6),
	(702, 10, 6),
	(703, 8, 6),
	(704, 2, -10),
	(704, 8, 4),
	(704, 9, 4),
	(705, 2, 10),
	(705, 10, 4),
	(706, 2, 15),
	(706, 8, 3),
	(706, 9, 3),
	(706, 12, -3),
	(707, 5, 15),
	(707, 12, 3),
	(708, 0, 0),
	(709, 0, 0),
	(710, 0, 0),
	(711, 0, 0),
	(712, 0, 0),
	(713, 0, 0),
	(714, 0, 0),
	(736, 0, 0),
	(737, 0, 0),
	(738, 0, 0),
	(739, 0, 0),
	(740, 0, 0),
	(741, 0, 0),
	(742, 0, 0),
	(743, 0, 0),
	(744, 0, 0),
	(745, 0, 0),
	(746, 0, 0),
	(603, 66, 2),
	(603, 106, 4);
/*!40000 ALTER TABLE `blue_spell_mods` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
