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

-- Dumping structure for table dspdb.pet_name
CREATE TABLE IF NOT EXISTS `pet_name` (
  `id` smallint(3) unsigned NOT NULL,
  `name` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.pet_name: 1,127 rows
/*!40000 ALTER TABLE `pet_name` DISABLE KEYS */;
INSERT INTO `pet_name` (`id`, `name`) VALUES
	(0, ''),
	(1, 'Azure'),
	(2, 'Cerulean'),
	(3, 'Rygor'),
	(4, 'Firewing'),
	(5, 'Delphyne'),
	(6, 'Ember'),
	(7, 'Rover'),
	(8, 'Max'),
	(9, 'Buster'),
	(10, 'Duke'),
	(11, 'Oscar'),
	(12, 'Maggie'),
	(13, 'Jessie'),
	(14, 'Lady'),
	(15, 'Hien'),
	(16, 'Raiden'),
	(17, 'Lumiere'),
	(18, 'Eisenzahn'),
	(19, 'Pfeil'),
	(20, 'Wuffi'),
	(21, 'George'),
	(22, 'Donryu'),
	(23, 'Qiqiru'),
	(24, 'Karav-Marav'),
	(25, 'Oboro'),
	(26, 'Darug-Borug'),
	(27, 'Mikan'),
	(28, 'Vhiki'),
	(29, 'Sasavi'),
	(30, 'Tatang'),
	(31, 'Nanaja'),
	(32, 'Khocha'),
	(33, 'Dino'),
	(34, 'Chomper'),
	(35, 'Huffy'),
	(36, 'Pouncer'),
	(37, 'Fido'),
	(38, 'Lucy'),
	(39, 'Jake'),
	(40, 'Rocky'),
	(41, 'Rex'),
	(42, 'Rusty'),
	(43, 'Himmelskralle'),
	(44, 'Gizmo'),
	(45, 'Spike'),
	(46, 'Sylvester'),
	(47, 'Milo'),
	(48, 'Tom'),
	(49, 'Toby'),
	(50, 'Felix'),
	(51, 'Komet'),
	(52, 'Bo'),
	(53, 'Molly'),
	(54, 'Unryu'),
	(55, 'Daisy'),
	(56, 'Baron'),
	(57, 'Ginger'),
	(58, 'Muffin'),
	(59, 'Lumineux'),
	(60, 'Quatrevents'),
	(61, 'Toryu'),
	(62, 'Tataba'),
	(63, 'Etoilazuree'),
	(64, 'Grisnuage'),
	(65, 'Belorage'),
	(66, 'Centonnerre'),
	(67, 'Nouvellune'),
	(68, 'Missy'),
	(69, 'Amedeo'),
	(70, 'Tranchevent'),
	(71, 'Soufflefeu'),
	(72, 'Etoile'),
	(73, 'Tonnerre'),
	(74, 'Nuage'),
	(75, 'Foudre'),
	(76, 'Hyuh'),
	(77, 'Orage'),
	(78, 'Lune'),
	(79, 'Astre'),
	(80, 'Waffenzahn'),
	(81, 'Soleil'),
	(82, 'Courageux'),
	(83, 'Koffla-Paffla'),
	(84, 'Venteuse'),
	(85, 'Lunaire'),
	(86, 'Tora'),
	(87, 'Celeste'),
	(88, 'Galja-Mogalja'),
	(89, 'Gaboh'),
	(90, 'Vhyun'),
	(91, 'Orageuse'),
	(92, 'Stellaire'),
	(93, 'Solaire'),
	(94, 'Wirbelwind'),
	(95, 'Blutkralle'),
	(96, 'Bogen'),
	(97, 'Junker'),
	(98, 'Flink'),
	(99, 'Knirps'),
	(100, 'Bodo'),
	(101, 'Soryu'),
	(102, 'Wawaro'),
	(103, 'Totona'),
	(104, 'Levian-Movian'),
	(105, 'Kagero'),
	(106, 'Joseph'),
	(107, 'Paparal'),
	(108, 'Coco'),
	(109, 'Ringo'),
	(110, 'Nonomi'),
	(111, 'Teter'),
	(112, 'Gigima'),
	(113, 'Gogodavi'),
	(114, 'Rurumo'),
	(115, 'Tupah'),
	(116, 'Jyubih'),
	(117, 'Majha'),
	(118, 'Luron'),
	(119, 'Drille'),
	(120, 'Tournefoux'),
	(121, 'Chafouin'),
	(122, 'Plaisantin'),
	(123, 'Loustic'),
	(124, 'Histrion'),
	(125, 'Bobeche'),
	(126, 'Bougrion'),
	(127, 'Rouleteau'),
	(128, 'Allouette'),
	(129, 'Serenade'),
	(130, 'Ficelette'),
	(131, 'Tocadie'),
	(132, 'Caprice'),
	(133, 'Foucade'),
	(134, 'Capillotte'),
	(135, 'Quenotte'),
	(136, 'Pacotille'),
	(137, 'Comedie'),
	(138, 'Kagekiyo'),
	(139, 'Toraoh'),
	(140, 'Genta'),
	(141, 'Kintoki'),
	(142, 'Koumei'),
	(143, 'Pamama'),
	(144, 'Lobo'),
	(145, 'Tsukushi'),
	(146, 'Oniwaka'),
	(147, 'Kenbishi'),
	(148, 'Hannya'),
	(149, 'Mashira'),
	(150, 'Nadeshiko'),
	(151, 'E100'),
	(152, 'Koume'),
	(153, 'X-32'),
	(154, 'Poppo'),
	(155, 'Asuka'),
	(156, 'Sakura'),
	(157, 'Tao'),
	(158, 'Mao'),
	(159, 'Gadget'),
	(160, 'Marion'),
	(161, 'Widget'),
	(162, 'Quirk'),
	(163, 'Sprocket'),
	(164, 'Cogette'),
	(165, 'Lecter'),
	(166, 'Coppelia'),
	(167, 'Sparky'),
	(168, 'Clank'),
	(169, 'Calcobrena'),
	(170, 'Crackle'),
	(171, 'Ricochet'),
	(172, 'Josette'),
	(173, 'Fritz'),
	(174, 'Skippy'),
	(175, 'Pino'),
	(176, 'Mandarin'),
	(177, 'Jackstraw'),
	(178, 'Guignol'),
	(179, 'Moppet'),
	(180, 'Nutcracker'),
	(181, 'Erwin'),
	(182, 'Otto'),
	(183, 'Gustav'),
	(184, 'Muffin'),
	(185, 'Xaver'),
	(186, 'Toni'),
	(187, 'Ina'),
	(188, 'Gerda'),
	(189, 'Petra'),
	(190, 'Verena'),
	(191, 'Rosi'),
	(192, 'Schatzi'),
	(193, 'Warashi'),
	(194, 'Klingel'),
	(195, 'Clochette'),
	(196, 'Campanello'),
	(197, 'Kaiserin'),
	(198, 'Principessa'),
	(199, 'Butler'),
	(200, 'Graf'),
	(201, 'Caro'),
	(202, 'Cara'),
	(203, 'Mademoiselle'),
	(204, 'Herzog'),
	(205, 'Tramp'),
	(206, 'V-1000'),
	(207, 'Hikozaemon'),
	(208, 'Nine'),
	(209, 'Acht'),
	(210, 'Quattro'),
	(211, 'Zero'),
	(212, 'Dreizehn'),
	(213, 'Seize'),
	(214, 'Fukusuke'),
	(215, 'Mataemon'),
	(216, 'Kansuke'),
	(217, 'Polichinelle'),
	(218, 'Tobisuke'),
	(219, 'Sasuke'),
	(220, 'Shijimi'),
	(221, 'Chobi'),
	(222, 'Aurelie'),
	(223, 'Magalie'),
	(224, 'Aurore'),
	(225, 'Caroline'),
	(226, 'Andrea'),
	(227, 'Machinette'),
	(228, 'Clarine'),
	(229, 'Armelle'),
	(230, 'Reinette'),
	(231, 'Dorlote'),
	(232, 'Turlupin'),
	(233, 'Klaxon'),
	(234, 'Bambino'),
	(235, 'Potiron'),
	(236, 'Fustige'),
	(237, 'Amidon'),
	(238, 'Machin'),
	(239, 'Bidulon'),
	(240, 'Tandem'),
	(241, 'Prestidige'),
	(242, 'Purute-Porute'),
	(243, 'Bito-Rabito'),
	(244, 'Cocoa'),
	(245, 'Totomo'),
	(246, 'Centurion'),
	(247, 'A7V'),
	(248, 'Scipio'),
	(249, 'Sentinel'),
	(250, 'Pioneer'),
	(251, 'Seneschal'),
	(252, 'Ginjin'),
	(253, 'Amagatsu'),
	(254, 'Dolly'),
	(255, 'Fantoccini'),
	(256, 'Joe'),
	(257, 'Kikizaru'),
	(258, 'Whippet'),
	(259, 'Punchinello'),
	(260, 'Charlie'),
	(261, 'Midge'),
	(262, 'Petrouchka'),
	(263, 'Schneider'),
	(264, 'Ushabti'),
	(265, 'Noel'),
	(266, 'Yajirobe'),
	(267, 'Hina'),
	(268, 'Nora'),
	(269, 'Shoki'),
	(270, 'Kobina'),
	(271, 'Kokeshi'),
	(272, 'Mame'),
	(273, 'Bishop'),
	(274, 'Marvin'),
	(275, 'Dora'),
	(276, 'Data'),
	(277, 'Robin'),
	(278, 'Robby'),
	(279, 'Porlo-Moperlo'),
	(280, 'Paroko-Puronko'),
	(281, 'Pipima'),
	(282, 'Gagaja'),
	(283, 'Mobil'),
	(284, 'Donzel'),
	(285, 'Archer'),
	(286, 'Shooter'),
	(287, 'Stephen'),
	(288, 'Mk.IV'),
	(289, 'Conjurer'),
	(290, 'Footman'),
	(291, 'Tokotoko'),
	(292, 'Sancho'),
	(293, 'Sarumaro'),
	(294, 'Picket'),
	(295, 'Mushroom'),
	(296, 'G'),
	(297, 'I'),
	(298, 'Q'),
	(299, 'V'),
	(300, 'X'),
	(301, 'Z'),
	(302, 'II'),
	(303, 'IV'),
	(304, 'IX'),
	(305, 'Or'),
	(306, 'VI'),
	(307, 'XI'),
	(308, 'Ace'),
	(309, 'Air'),
	(310, 'Aki'),
	(311, 'Ayu'),
	(312, 'Bat'),
	(313, 'Bec'),
	(314, 'Bel'),
	(315, 'Big'),
	(316, 'Bon'),
	(317, 'Boy'),
	(318, 'Cap'),
	(319, 'Coq'),
	(320, 'Cry'),
	(321, 'Dom'),
	(322, 'Duc'),
	(323, 'Dun'),
	(324, 'End'),
	(325, 'Ete'),
	(326, 'Eye'),
	(327, 'Fat'),
	(328, 'Fee'),
	(329, 'Fer'),
	(330, 'Feu'),
	(331, 'Fog'),
	(332, 'Fox'),
	(333, 'Hot'),
	(334, 'Ice'),
	(335, 'Ice'),
	(336, 'Icy'),
	(337, 'III'),
	(338, 'Jet'),
	(339, 'Joy'),
	(340, 'Leg'),
	(341, 'Max'),
	(342, 'Neo'),
	(343, 'One'),
	(344, 'Pur'),
	(345, 'Ray'),
	(346, 'Red'),
	(347, 'Roi'),
	(348, 'Sea'),
	(349, 'Sky'),
	(350, 'Sui'),
	(351, 'Sun'),
	(352, 'Ten'),
	(353, 'Vif'),
	(354, 'VII'),
	(355, 'XII'),
	(356, 'Aile'),
	(357, 'Ange'),
	(358, 'Ardi'),
	(359, 'Beak'),
	(360, 'Beau'),
	(361, 'Best'),
	(362, 'Bleu'),
	(363, 'Blue'),
	(364, 'Bone'),
	(365, 'Cart'),
	(366, 'Chic'),
	(367, 'Ciel'),
	(368, 'Claw'),
	(369, 'Cool'),
	(370, 'Dame'),
	(371, 'Dark'),
	(372, 'Dore'),
	(373, 'Dray'),
	(374, 'Duke'),
	(375, 'Easy'),
	(376, 'Edel'),
	(377, 'Face'),
	(378, 'Fast'),
	(379, 'Fier'),
	(380, 'Fine'),
	(381, 'Fire'),
	(382, 'Foot'),
	(383, 'Fury'),
	(384, 'Fuyu'),
	(385, 'Gale'),
	(386, 'Girl'),
	(387, 'Goer'),
	(388, 'Gold'),
	(389, 'Good'),
	(390, 'Graf'),
	(391, 'Gray'),
	(392, 'Gust'),
	(393, 'Gute'),
	(394, 'Haoh'),
	(395, 'Haru'),
	(396, 'Held'),
	(397, 'Hero'),
	(398, 'Hope'),
	(399, 'Idol'),
	(400, 'Iris'),
	(401, 'Iron'),
	(402, 'Jack'),
	(403, 'Jade'),
	(404, 'Joli'),
	(405, 'Jung'),
	(406, 'Kiku'),
	(407, 'King'),
	(408, 'Kopf'),
	(409, 'Lady'),
	(410, 'Last'),
	(411, 'Lili'),
	(412, 'Lily'),
	(413, 'Line'),
	(414, 'Long'),
	(415, 'Lord'),
	(416, 'Luft'),
	(417, 'Luna'),
	(418, 'Lune'),
	(419, 'Mama'),
	(420, 'Mars'),
	(421, 'Miel'),
	(422, 'Miss'),
	(423, 'Momo'),
	(424, 'Mond'),
	(425, 'Moon'),
	(426, 'Nana'),
	(427, 'Nice'),
	(428, 'Noir'),
	(429, 'Nono'),
	(430, 'Nova'),
	(431, 'Nuit'),
	(432, 'Ocre'),
	(433, 'Olle'),
	(434, 'Papa'),
	(435, 'Pers'),
	(436, 'Phar'),
	(437, 'Pony'),
	(438, 'Pure'),
	(439, 'Rain'),
	(440, 'Rice'),
	(441, 'Rich'),
	(442, 'Road'),
	(443, 'Rose'),
	(444, 'Rote'),
	(445, 'Roux'),
	(446, 'Ruby'),
	(447, 'Sage'),
	(448, 'Snow'),
	(449, 'Star'),
	(450, 'Tail'),
	(451, 'Trot'),
	(452, 'Vega'),
	(453, 'Vent'),
	(454, 'Vert'),
	(455, 'VIII'),
	(456, 'Vive'),
	(457, 'Wave'),
	(458, 'West'),
	(459, 'Wild'),
	(460, 'Wind'),
	(461, 'Wing'),
	(462, 'XIII'),
	(463, 'Zero'),
	(464, 'Acier'),
	(465, 'Agate'),
	(466, 'Agile'),
	(467, 'Agnes'),
	(468, 'Ailee'),
	(469, 'Alpha'),
	(470, 'Amber'),
	(471, 'Ambre'),
	(472, 'Angel'),
	(473, 'Ardie'),
	(474, 'Arkie'),
	(475, 'Arrow'),
	(476, 'Avian'),
	(477, 'Azure'),
	(478, 'Baron'),
	(479, 'Belle'),
	(480, 'Beryl'),
	(481, 'Black'),
	(482, 'Blade'),
	(483, 'Blaue'),
	(484, 'Blaze'),
	(485, 'Bleue'),
	(486, 'Blitz'),
	(487, 'Blond'),
	(488, 'Blood'),
	(489, 'Bonne'),
	(490, 'Brave'),
	(491, 'Brian'),
	(492, 'Brise'),
	(493, 'Burst'),
	(494, 'Calme'),
	(495, 'Chaos'),
	(496, 'Clair'),
	(497, 'Cloud'),
	(498, 'Comet'),
	(499, 'Comte'),
	(500, 'Court'),
	(501, 'Craft'),
	(502, 'Crete'),
	(503, 'Crown'),
	(504, 'Dance'),
	(505, 'Dandy'),
	(506, 'Devil'),
	(507, 'Diana'),
	(508, 'Doree'),
	(509, 'Dream'),
	(510, 'Eager'),
	(511, 'Eagle'),
	(512, 'Ebony'),
	(513, 'Eisen'),
	(514, 'Ember'),
	(515, 'Engel'),
	(516, 'Fairy'),
	(517, 'Fatty'),
	(518, 'Feder'),
	(519, 'Feuer'),
	(520, 'Fiere'),
	(521, 'Fiery'),
	(522, 'Final'),
	(523, 'Flare'),
	(524, 'Fleet'),
	(525, 'Fleur'),
	(526, 'Flier'),
	(527, 'Flood'),
	(528, 'Flora'),
	(529, 'Flyer'),
	(530, 'Frais'),
	(531, 'Frost'),
	(532, 'Fuchs'),
	(533, 'Galop'),
	(534, 'Geist'),
	(535, 'Gelbe'),
	(536, 'Ghost'),
	(537, 'Glory'),
	(538, 'Grand'),
	(539, 'Great'),
	(540, 'Green'),
	(541, 'Guter'),
	(542, 'Gutes'),
	(543, 'Heart'),
	(544, 'Helle'),
	(545, 'Hiden'),
	(546, 'Hiten'),
	(547, 'Hiver'),
	(548, 'Hobby'),
	(549, 'Hyper'),
	(550, 'Ivory'),
	(551, 'Jaune'),
	(552, 'Jeune'),
	(553, 'Jinpu'),
	(554, 'Jolie'),
	(555, 'Jolly'),
	(556, 'Kluge'),
	(557, 'Knife'),
	(558, 'Komet'),
	(559, 'Kugel'),
	(560, 'Lahme'),
	(561, 'Leste'),
	(562, 'Light'),
	(563, 'Lilas'),
	(564, 'Lucky'),
	(565, 'Lunar'),
	(566, 'Lutin'),
	(567, 'Magic'),
	(568, 'Merry'),
	(569, 'Metal'),
	(570, 'Natsu'),
	(571, 'Neddy'),
	(572, 'Night'),
	(573, 'Ninja'),
	(574, 'Noble'),
	(575, 'Noire'),
	(576, 'Nuage'),
	(577, 'Ocree'),
	(578, 'Olive'),
	(579, 'Oller'),
	(580, 'Olles'),
	(581, 'Omega'),
	(582, 'Opale'),
	(583, 'Orage'),
	(584, 'Patte'),
	(585, 'Peace'),
	(586, 'Penne'),
	(587, 'Petit'),
	(588, 'Pfeil'),
	(589, 'Pluie'),
	(590, 'Plume'),
	(591, 'Pluto'),
	(592, 'Point'),
	(593, 'Pomme'),
	(594, 'Power'),
	(595, 'Quake'),
	(596, 'Queen'),
	(597, 'Queue'),
	(598, 'Reine'),
	(599, 'Reppu'),
	(600, 'Riche'),
	(601, 'Rieur'),
	(602, 'Roter'),
	(603, 'Rotes'),
	(604, 'Rouge'),
	(605, 'Royal'),
	(606, 'Rubin'),
	(607, 'Rubis'),
	(608, 'Saure'),
	(609, 'Serre'),
	(610, 'Smalt'),
	(611, 'Snowy'),
	(612, 'Solar'),
	(613, 'Spark'),
	(614, 'Speed'),
	(615, 'Steed'),
	(616, 'Stern'),
	(617, 'Stone'),
	(618, 'Storm'),
	(619, 'Sturm'),
	(620, 'Stute'),
	(621, 'Super'),
	(622, 'Sweep'),
	(623, 'Sweet'),
	(624, 'Swift'),
	(625, 'Talon'),
	(626, 'Teioh'),
	(627, 'Titan'),
	(628, 'Turbo'),
	(629, 'Ultra'),
	(630, 'Urara'),
	(631, 'Venus'),
	(632, 'Verte'),
	(633, 'Verve'),
	(634, 'Vivid'),
	(635, 'Vogel'),
	(636, 'Young'),
	(637, 'Zippy'),
	(638, 'Airain'),
	(639, 'Ambree'),
	(640, 'Amiral'),
	(641, 'Arashi'),
	(642, 'Archer'),
	(643, 'Ardent'),
	(644, 'Argent'),
	(645, 'Audace'),
	(646, 'Autumn'),
	(647, 'Battle'),
	(648, 'Beaute'),
	(649, 'Beauty'),
	(650, 'Beetle'),
	(651, 'Blauer'),
	(652, 'Blaues'),
	(653, 'Bleuet'),
	(654, 'Blonde'),
	(655, 'Bonbon'),
	(656, 'Breeze'),
	(657, 'Bronze'),
	(658, 'Brumby'),
	(659, 'Bucker'),
	(660, 'Caesar'),
	(661, 'Carmin'),
	(662, 'Cerise'),
	(663, 'Cerule'),
	(664, 'Chance'),
	(665, 'Cinder'),
	(666, 'Citron'),
	(667, 'Claire'),
	(668, 'Cobalt'),
	(669, 'Corail'),
	(670, 'Courte'),
	(671, 'Cuivre'),
	(672, 'Dancer'),
	(673, 'Daring'),
	(674, 'Desert'),
	(675, 'Dobbin'),
	(676, 'Dunkle'),
	(677, 'Elance'),
	(678, 'Emblem'),
	(679, 'Enzian'),
	(680, 'Esprit'),
	(681, 'Etoile'),
	(682, 'Filant'),
	(683, 'Flamme'),
	(684, 'Fleche'),
	(685, 'Flight'),
	(686, 'Flinke'),
	(687, 'Flower'),
	(688, 'Flurry'),
	(689, 'Flying'),
	(690, 'Forest'),
	(691, 'Freeze'),
	(692, 'Freund'),
	(693, 'Friend'),
	(694, 'Frosty'),
	(695, 'Frozen'),
	(696, 'Fubuki'),
	(697, 'Galaxy'),
	(698, 'Ganger'),
	(699, 'Gelber'),
	(700, 'Gelbes'),
	(701, 'Ginger'),
	(702, 'Gloire'),
	(703, 'Glorie'),
	(704, 'Goemon'),
	(705, 'Grande'),
	(706, 'Grenat'),
	(707, 'Groove'),
	(708, 'Grosse'),
	(709, 'Gruene'),
	(710, 'Gustav'),
	(711, 'Hayate'),
	(712, 'Heldin'),
	(713, 'Heller'),
	(714, 'Helles'),
	(715, 'Hengst'),
	(716, 'Hermes'),
	(717, 'Herzog'),
	(718, 'Himmel'),
	(719, 'Humble'),
	(720, 'Idaten'),
	(721, 'Impact'),
	(722, 'Indigo'),
	(723, 'Jagger'),
	(724, 'Jasmin'),
	(725, 'Joyeux'),
	(726, 'Jungle'),
	(727, 'Kaiser'),
	(728, 'Keffel'),
	(729, 'Kleine'),
	(730, 'Kluger'),
	(731, 'Kluges'),
	(732, 'Koloss'),
	(733, 'Lahmer'),
	(734, 'Lahmes'),
	(735, 'Lancer'),
	(736, 'Lander'),
	(737, 'Laurel'),
	(738, 'Leaper'),
	(739, 'Legend'),
	(740, 'Limber'),
	(741, 'Longue'),
	(742, 'Melody'),
	(743, 'Meteor'),
	(744, 'Mirage'),
	(745, 'Mister'),
	(746, 'Motion'),
	(747, 'Muguet'),
	(748, 'Nature'),
	(749, 'Nebula'),
	(750, 'Nether'),
	(751, 'Nimble'),
	(752, 'Olympe'),
	(753, 'Orchid'),
	(754, 'Outlaw'),
	(755, 'Passer'),
	(756, 'Pastel'),
	(757, 'Pelter'),
	(758, 'Pensee'),
	(759, 'Petite'),
	(760, 'Piment'),
	(761, 'Poetic'),
	(762, 'Poulet'),
	(763, 'Preste'),
	(764, 'Pretty'),
	(765, 'Prince'),
	(766, 'Purete'),
	(767, 'Quartz'),
	(768, 'Quasar'),
	(769, 'Rafale'),
	(770, 'Raging'),
	(771, 'Raiden'),
	(772, 'Ramage'),
	(773, 'Rapide'),
	(774, 'Reiche'),
	(775, 'Remige'),
	(776, 'Rieuse'),
	(777, 'Rising'),
	(778, 'Robust'),
	(779, 'Royale'),
	(780, 'Rudolf'),
	(781, 'Runner'),
	(782, 'Saddle'),
	(783, 'Safran'),
	(784, 'Sakura'),
	(785, 'Saphir'),
	(786, 'Saturn'),
	(787, 'Schuss'),
	(788, 'Sekito'),
	(789, 'Selene'),
	(790, 'Senden'),
	(791, 'Serein'),
	(792, 'Shadow'),
	(793, 'Shiden'),
	(794, 'Shinpu'),
	(795, 'Sieger'),
	(796, 'Silber'),
	(797, 'Silent'),
	(798, 'Silver'),
	(799, 'Silver'),
	(800, 'Soleil'),
	(801, 'Sombre'),
	(802, 'Sorrel'),
	(803, 'Sphene'),
	(804, 'Spirit'),
	(805, 'Spring'),
	(806, 'Stream'),
	(807, 'Strike'),
	(808, 'Summer'),
	(809, 'Tekiro'),
	(810, 'Terror'),
	(811, 'Ticket'),
	(812, 'Timide'),
	(813, 'Topaze'),
	(814, 'Tulipe'),
	(815, 'Tycoon'),
	(816, 'Ultime'),
	(817, 'Uranus'),
	(818, 'Veloce'),
	(819, 'Velvet'),
	(820, 'Victor'),
	(821, 'Violet'),
	(822, 'Walker'),
	(823, 'Weisse'),
	(824, 'Winged'),
	(825, 'Winner'),
	(826, 'Winner'),
	(827, 'Winter'),
	(828, 'Wonder'),
	(829, 'Xanthe'),
	(830, 'Yellow'),
	(831, 'Zephyr'),
	(832, 'Ardente'),
	(833, 'Automne'),
	(834, 'Avenger'),
	(835, 'Baronne'),
	(836, 'Battant'),
	(837, 'Blazing'),
	(838, 'Blitzer'),
	(839, 'Camelia'),
	(840, 'Candide'),
	(841, 'Caramel'),
	(842, 'Celeste'),
	(843, 'Cerulee'),
	(844, 'Charbon'),
	(845, 'Charger'),
	(846, 'Chariot'),
	(847, 'Clipper'),
	(848, 'Coureur'),
	(849, 'Crimson'),
	(850, 'Cristal'),
	(851, 'Crystal'),
	(852, 'Cuivree'),
	(853, 'Cyclone'),
	(854, 'Dancing'),
	(855, 'Danseur'),
	(856, 'Diamant'),
	(857, 'Diamond'),
	(858, 'Drafter'),
	(859, 'Dunkler'),
	(860, 'Dunkles'),
	(861, 'Eastern'),
	(862, 'Einhorn'),
	(863, 'Elancee'),
	(864, 'Elegant'),
	(865, 'Emperor'),
	(866, 'Empress'),
	(867, 'Express'),
	(868, 'Farceur'),
	(869, 'Feather'),
	(870, 'Fighter'),
	(871, 'Filante'),
	(872, 'Flinker'),
	(873, 'Flinkes'),
	(874, 'Fortune'),
	(875, 'Fraiche'),
	(876, 'Gagnant'),
	(877, 'Galaxie'),
	(878, 'Gallant'),
	(879, 'Genesis'),
	(880, 'Geoelte'),
	(881, 'Grosser'),
	(882, 'Grosses'),
	(883, 'Gruener'),
	(884, 'Gruenes'),
	(885, 'Harmony'),
	(886, 'Heroine'),
	(887, 'Ikezuki'),
	(888, 'Impulse'),
	(889, 'Javelin'),
	(890, 'Joyeuse'),
	(891, 'Jumping'),
	(892, 'Jupiter'),
	(893, 'Justice'),
	(894, 'Kleiner'),
	(895, 'Kleines'),
	(896, 'Lavande'),
	(897, 'Leaping'),
	(898, 'Legende'),
	(899, 'Liberty'),
	(900, 'Licorne'),
	(901, 'Majesty'),
	(902, 'Marquis'),
	(903, 'Maximal'),
	(904, 'Melodie'),
	(905, 'Mercury'),
	(906, 'Million'),
	(907, 'Miracle'),
	(908, 'Musashi'),
	(909, 'Mustang'),
	(910, 'Nacarat'),
	(911, 'Natural'),
	(912, 'Nemesis'),
	(913, 'Neptune'),
	(914, 'Oeillet'),
	(915, 'Optimal'),
	(916, 'Orageux'),
	(917, 'Ouragan'),
	(918, 'Paprika'),
	(919, 'Parfait'),
	(920, 'Partner'),
	(921, 'Patient'),
	(922, 'Paturon'),
	(923, 'Pegasus'),
	(924, 'Pensive'),
	(925, 'Perfect'),
	(926, 'Peureux'),
	(927, 'Phoenix'),
	(928, 'Plumage'),
	(929, 'Pourpre'),
	(930, 'Poussin'),
	(931, 'Prancer'),
	(932, 'Premium'),
	(933, 'Quantum'),
	(934, 'Radiant'),
	(935, 'Rainbow'),
	(936, 'Rattler'),
	(937, 'Reicher'),
	(938, 'Reiches'),
	(939, 'Roughie'),
	(940, 'Samurai'),
	(941, 'Sautant'),
	(942, 'Scarlet'),
	(943, 'Schweif'),
	(944, 'Sereine'),
	(945, 'Sergent'),
	(946, 'Shinden'),
	(947, 'Shining'),
	(948, 'Shooter'),
	(949, 'Smoking'),
	(950, 'Souffle'),
	(951, 'Special'),
	(952, 'Stylish'),
	(953, 'Sumpter'),
	(954, 'Tempest'),
	(955, 'Tempete'),
	(956, 'Thunder'),
	(957, 'Tornado'),
	(958, 'Torpedo'),
	(959, 'Tristan'),
	(960, 'Trooper'),
	(961, 'Trotter'),
	(962, 'Typhoon'),
	(963, 'Unicorn'),
	(964, 'Vengeur'),
	(965, 'Vermeil'),
	(966, 'Victory'),
	(967, 'Warrior'),
	(968, 'Weisser'),
	(969, 'Weisses'),
	(970, 'Western'),
	(971, 'Whisper'),
	(972, 'Winning'),
	(973, 'Zetsuei'),
	(974, 'Zillion'),
	(975, 'Baroness'),
	(976, 'Battante'),
	(977, 'Blizzard'),
	(978, 'Cannelle'),
	(979, 'Capucine'),
	(980, 'Cerulean'),
	(981, 'Chanceux'),
	(982, 'Charisma'),
	(983, 'Charmant'),
	(984, 'Chocolat'),
	(985, 'Claybank'),
	(986, 'Comtesse'),
	(987, 'Coureuse'),
	(988, 'Danseuse'),
	(989, 'Duchesse'),
	(990, 'Ecarlate'),
	(991, 'Elegante'),
	(992, 'Emeraude'),
	(993, 'Farceuse'),
	(994, 'Farfadet'),
	(995, 'Fringant'),
	(996, 'Gagnante'),
	(997, 'Galloper'),
	(998, 'Galopant'),
	(999, 'Geoelter'),
	(1000, 'Geoeltes'),
	(1001, 'Geschoss'),
	(1002, 'Gorgeous'),
	(1003, 'Hanakaze'),
	(1004, 'Highland'),
	(1005, 'Hyperion'),
	(1006, 'Illusion'),
	(1007, 'Immortal'),
	(1008, 'Imperial'),
	(1009, 'Incarnat'),
	(1010, 'Infinity'),
	(1011, 'Innocent'),
	(1012, 'Jacinthe'),
	(1013, 'Kaiserin'),
	(1014, 'Kristall'),
	(1015, 'Maharaja'),
	(1016, 'Maharani'),
	(1017, 'Marquise'),
	(1018, 'Mataemon'),
	(1019, 'Meilleur'),
	(1020, 'Mercedes'),
	(1021, 'Myosotis'),
	(1022, 'Nebulous'),
	(1023, 'Negative'),
	(1024, 'Nenuphar'),
	(1025, 'Northern'),
	(1026, 'Northern'),
	(1027, 'Obsidian'),
	(1028, 'Orageuse'),
	(1029, 'Orchidee'),
	(1030, 'Parfaite'),
	(1031, 'Patiente'),
	(1032, 'Peureuse'),
	(1033, 'Positive'),
	(1034, 'Princely'),
	(1035, 'Princess'),
	(1036, 'Prodigue'),
	(1037, 'Puissant'),
	(1038, 'Restless'),
	(1039, 'Rhapsody'),
	(1040, 'Roadster'),
	(1041, 'Rutilant'),
	(1042, 'Sautante'),
	(1043, 'Schwarze'),
	(1044, 'Shooting'),
	(1045, 'Silberne'),
	(1046, 'Southern'),
	(1047, 'Speciale'),
	(1048, 'Stallion'),
	(1049, 'Stardust'),
	(1050, 'Surusumi'),
	(1051, 'Tonnerre'),
	(1052, 'Trotteur'),
	(1053, 'Ultimate'),
	(1054, 'Universe'),
	(1055, 'Vaillant'),
	(1056, 'Vengeuse'),
	(1057, 'Xanthous'),
	(1058, 'Zeppelin'),
	(1059, 'Ambitious'),
	(1060, 'Audacieux'),
	(1061, 'Ballistic'),
	(1062, 'Beautiful'),
	(1063, 'Brilliant'),
	(1064, 'Campanule'),
	(1065, 'Capitaine'),
	(1066, 'Chanceuse'),
	(1067, 'Charmante'),
	(1068, 'Clematite'),
	(1069, 'Clochette'),
	(1070, 'Coriandre'),
	(1071, 'Crackling'),
	(1072, 'Destroyer'),
	(1073, 'Excellent'),
	(1074, 'Fantastic'),
	(1075, 'Feathered'),
	(1076, 'Fringante'),
	(1077, 'Galopante'),
	(1078, 'Gingembre'),
	(1079, 'Hurricane'),
	(1080, 'Ichimonji'),
	(1081, 'Impetueux'),
	(1082, 'Incarnate'),
	(1083, 'Lightning'),
	(1084, 'Matsukaze'),
	(1085, 'Meilleure'),
	(1086, 'Menestrel'),
	(1087, 'Merciless'),
	(1088, 'Pendragon'),
	(1089, 'Princesse'),
	(1090, 'Printemps'),
	(1091, 'Puissante'),
	(1092, 'Quadrille'),
	(1093, 'Rosinante'),
	(1094, 'Rutilante'),
	(1095, 'Schwarzer'),
	(1096, 'Schwarzes'),
	(1097, 'Silberner'),
	(1098, 'Silbernes'),
	(1099, 'Sparkling'),
	(1100, 'Speedster'),
	(1101, 'Tournesol'),
	(1102, 'Transient'),
	(1103, 'Trotteuse'),
	(1104, 'Turbulent'),
	(1105, 'Twinkling'),
	(1106, 'Vaillante'),
	(1107, 'Valentine'),
	(1108, 'Velocious'),
	(1109, 'Vermeille'),
	(1110, 'Wonderful'),
	(1111, 'Amatsukaze'),
	(1112, 'Audacieuse'),
	(1113, 'Benevolent'),
	(1114, 'Blistering'),
	(1115, 'Brilliance'),
	(1116, 'Bucephalus'),
	(1117, 'Challenger'),
	(1118, 'Excellente'),
	(1119, 'Impetueuse'),
	(1120, 'Invincible'),
	(1121, 'Malevolent'),
	(1122, 'Millennium'),
	(1123, 'Tranquille'),
	(1124, 'Turbulente'),
	(1125, 'Destruction'),
	(1126, 'Firecracker');
/*!40000 ALTER TABLE `pet_name` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
