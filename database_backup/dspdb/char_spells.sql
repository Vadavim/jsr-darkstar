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

-- Dumping structure for table dspdb.char_spells
CREATE TABLE IF NOT EXISTS `char_spells` (
  `charid` int(10) unsigned NOT NULL,
  `spellid` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `idx_char_spells_spellid_charid` (`spellid`,`charid`),
  KEY `char_spells_charid_index` (`charid`),
  KEY `char_spells_spellid_index` (`spellid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dspdb.char_spells: ~835 rows (approximately)
/*!40000 ALTER TABLE `char_spells` DISABLE KEYS */;
INSERT INTO `char_spells` (`charid`, `spellid`) VALUES
	(21828, 1),
	(21828, 2),
	(21828, 3),
	(21828, 4),
	(21828, 5),
	(21828, 6),
	(21828, 7),
	(21828, 8),
	(21828, 9),
	(21828, 10),
	(21828, 11),
	(21828, 12),
	(21828, 13),
	(21828, 14),
	(21828, 15),
	(21828, 16),
	(21828, 17),
	(21828, 18),
	(21828, 19),
	(21828, 20),
	(21828, 21),
	(21828, 22),
	(21828, 23),
	(21828, 24),
	(21828, 25),
	(21828, 26),
	(21828, 27),
	(21828, 28),
	(21828, 29),
	(21828, 30),
	(21828, 31),
	(21828, 32),
	(21828, 33),
	(21828, 34),
	(21828, 35),
	(21828, 36),
	(21828, 37),
	(21828, 38),
	(21828, 39),
	(21828, 40),
	(21828, 41),
	(21828, 42),
	(21828, 43),
	(21828, 44),
	(21828, 45),
	(21828, 46),
	(21828, 47),
	(21828, 48),
	(21828, 49),
	(21828, 50),
	(21828, 51),
	(21828, 52),
	(21828, 53),
	(21828, 54),
	(21828, 55),
	(21828, 56),
	(21828, 57),
	(21828, 58),
	(21828, 59),
	(21828, 60),
	(21828, 61),
	(21828, 62),
	(21828, 63),
	(21828, 64),
	(21828, 65),
	(21828, 66),
	(21828, 67),
	(21828, 68),
	(21828, 69),
	(21828, 70),
	(21828, 71),
	(21828, 72),
	(21828, 73),
	(21828, 74),
	(21828, 75),
	(21828, 76),
	(21828, 77),
	(21828, 78),
	(21828, 79),
	(21828, 80),
	(21828, 81),
	(21828, 82),
	(21828, 83),
	(21828, 84),
	(21828, 85),
	(21828, 86),
	(21828, 87),
	(21828, 88),
	(21828, 89),
	(21828, 90),
	(21828, 91),
	(21828, 92),
	(21828, 93),
	(21828, 94),
	(21828, 95),
	(21828, 96),
	(21828, 97),
	(21828, 98),
	(21828, 99),
	(21828, 100),
	(21828, 101),
	(21828, 102),
	(21828, 103),
	(21828, 104),
	(21828, 105),
	(21828, 106),
	(21828, 107),
	(21828, 108),
	(21828, 109),
	(21828, 110),
	(21828, 111),
	(21828, 112),
	(21828, 113),
	(21828, 114),
	(21828, 115),
	(21828, 116),
	(21828, 117),
	(21828, 118),
	(21828, 119),
	(21828, 120),
	(21828, 121),
	(21828, 122),
	(21828, 123),
	(21828, 124),
	(21828, 125),
	(21828, 126),
	(21828, 127),
	(21828, 128),
	(21828, 129),
	(21828, 130),
	(21828, 131),
	(21828, 132),
	(21828, 133),
	(21828, 134),
	(21828, 135),
	(21828, 136),
	(21828, 137),
	(21828, 138),
	(21828, 139),
	(21828, 140),
	(21828, 141),
	(21828, 142),
	(21828, 143),
	(21828, 144),
	(21828, 145),
	(21828, 146),
	(21828, 147),
	(21828, 148),
	(21828, 149),
	(21828, 150),
	(21828, 151),
	(21828, 152),
	(21828, 153),
	(21828, 154),
	(21828, 155),
	(21828, 156),
	(21828, 157),
	(21828, 158),
	(21828, 159),
	(21828, 160),
	(21828, 161),
	(21828, 162),
	(21828, 163),
	(21828, 164),
	(21828, 165),
	(21828, 166),
	(21828, 167),
	(21828, 168),
	(21828, 169),
	(21828, 170),
	(21828, 171),
	(21828, 172),
	(21828, 173),
	(21828, 174),
	(21828, 175),
	(21828, 176),
	(21828, 177),
	(21828, 178),
	(21828, 179),
	(21828, 180),
	(21828, 181),
	(21828, 182),
	(21828, 183),
	(21828, 184),
	(21828, 185),
	(21828, 186),
	(21828, 187),
	(21828, 188),
	(21828, 189),
	(21828, 190),
	(21828, 191),
	(21828, 192),
	(21828, 193),
	(21828, 194),
	(21828, 195),
	(21828, 196),
	(21828, 197),
	(21828, 198),
	(21828, 199),
	(21828, 200),
	(21828, 201),
	(21828, 202),
	(21828, 203),
	(21828, 204),
	(21828, 205),
	(21828, 206),
	(21828, 207),
	(21828, 208),
	(21828, 209),
	(21828, 210),
	(21828, 211),
	(21828, 212),
	(21828, 213),
	(21828, 214),
	(21828, 215),
	(21828, 216),
	(21828, 217),
	(21828, 218),
	(21828, 219),
	(21828, 220),
	(21828, 221),
	(21828, 222),
	(21828, 223),
	(21828, 224),
	(21828, 225),
	(21828, 226),
	(21828, 227),
	(21828, 228),
	(21828, 229),
	(21828, 230),
	(21828, 231),
	(21828, 232),
	(21828, 233),
	(21828, 234),
	(21828, 235),
	(21828, 236),
	(21828, 237),
	(21828, 238),
	(21828, 239),
	(21828, 240),
	(21828, 241),
	(21828, 242),
	(21828, 243),
	(21828, 244),
	(21828, 245),
	(21828, 246),
	(21828, 247),
	(21828, 248),
	(21828, 249),
	(21828, 250),
	(21828, 251),
	(21828, 252),
	(21828, 253),
	(21828, 254),
	(21828, 255),
	(21828, 256),
	(21828, 257),
	(21828, 258),
	(21828, 259),
	(21828, 260),
	(21828, 261),
	(21828, 262),
	(21828, 263),
	(21828, 264),
	(21828, 265),
	(21828, 266),
	(21828, 267),
	(21828, 268),
	(21828, 269),
	(21828, 270),
	(21828, 271),
	(21828, 272),
	(21828, 273),
	(21828, 274),
	(21828, 275),
	(21828, 276),
	(21828, 277),
	(21828, 278),
	(21828, 279),
	(21828, 280),
	(21828, 281),
	(21828, 282),
	(21828, 283),
	(21828, 284),
	(21828, 285),
	(21828, 286),
	(21828, 287),
	(21828, 288),
	(21828, 289),
	(21828, 290),
	(21828, 291),
	(21828, 292),
	(21828, 293),
	(21828, 294),
	(21828, 295),
	(21828, 296),
	(21828, 297),
	(21828, 298),
	(21828, 299),
	(21828, 300),
	(21828, 301),
	(21828, 302),
	(21828, 303),
	(21828, 304),
	(21828, 305),
	(21828, 306),
	(21828, 307),
	(21828, 308),
	(21828, 309),
	(21828, 310),
	(21828, 311),
	(21828, 312),
	(21828, 313),
	(21828, 314),
	(21828, 315),
	(21828, 316),
	(21828, 317),
	(21828, 318),
	(21828, 319),
	(21828, 320),
	(21828, 321),
	(21828, 322),
	(21828, 323),
	(21828, 324),
	(21828, 325),
	(21828, 326),
	(21828, 327),
	(21828, 328),
	(21828, 329),
	(21828, 330),
	(21828, 331),
	(21828, 332),
	(21828, 333),
	(21828, 334),
	(21828, 335),
	(21828, 336),
	(21828, 337),
	(21828, 338),
	(21828, 339),
	(21828, 340),
	(21828, 341),
	(21828, 342),
	(21828, 343),
	(21828, 344),
	(21828, 345),
	(21828, 346),
	(21828, 347),
	(21828, 348),
	(21828, 349),
	(21828, 350),
	(21828, 351),
	(21828, 352),
	(21828, 353),
	(21828, 354),
	(21828, 355),
	(21828, 356),
	(21828, 357),
	(21828, 358),
	(21828, 359),
	(21828, 360),
	(21828, 361),
	(21828, 362),
	(21828, 363),
	(21828, 364),
	(21828, 365),
	(21828, 366),
	(21828, 367),
	(21828, 368),
	(21828, 369),
	(21828, 370),
	(21828, 371),
	(21828, 372),
	(21828, 373),
	(21828, 374),
	(21828, 375),
	(21828, 376),
	(21828, 377),
	(21828, 378),
	(21828, 379),
	(21828, 380),
	(21828, 381),
	(21828, 382),
	(21828, 383),
	(21828, 384),
	(21828, 385),
	(21828, 386),
	(21828, 387),
	(21828, 388),
	(21828, 389),
	(21828, 390),
	(21828, 391),
	(21828, 392),
	(21828, 393),
	(21828, 394),
	(21828, 395),
	(21828, 396),
	(21828, 397),
	(21828, 398),
	(21828, 399),
	(21828, 400),
	(21828, 401),
	(21828, 402),
	(21828, 403),
	(21828, 404),
	(21828, 405),
	(21828, 406),
	(21828, 407),
	(21828, 408),
	(21828, 409),
	(21828, 410),
	(21828, 411),
	(21828, 412),
	(21828, 413),
	(21828, 414),
	(21828, 415),
	(21828, 416),
	(21828, 417),
	(21828, 418),
	(21828, 419),
	(21828, 420),
	(21828, 421),
	(21828, 422),
	(21828, 423),
	(21828, 424),
	(21828, 425),
	(21828, 426),
	(21828, 427),
	(21828, 428),
	(21828, 429),
	(21828, 430),
	(21828, 431),
	(21828, 432),
	(21828, 433),
	(21828, 434),
	(21828, 435),
	(21828, 436),
	(21828, 437),
	(21828, 438),
	(21828, 439),
	(21828, 440),
	(21828, 441),
	(21828, 442),
	(21828, 443),
	(21828, 444),
	(21828, 445),
	(21828, 446),
	(21828, 447),
	(21828, 448),
	(21828, 449),
	(21828, 450),
	(21828, 451),
	(21828, 452),
	(21828, 453),
	(21828, 454),
	(21828, 455),
	(21828, 456),
	(21828, 457),
	(21828, 458),
	(21828, 459),
	(21828, 460),
	(21828, 461),
	(21828, 462),
	(21828, 463),
	(21828, 464),
	(21828, 465),
	(21828, 466),
	(21828, 467),
	(21828, 468),
	(21828, 469),
	(21828, 470),
	(21828, 471),
	(21828, 472),
	(21828, 473),
	(21828, 474),
	(21828, 475),
	(21828, 476),
	(21828, 477),
	(21828, 478),
	(21828, 479),
	(21828, 480),
	(21828, 481),
	(21828, 482),
	(21828, 483),
	(21828, 484),
	(21828, 485),
	(21828, 486),
	(21828, 487),
	(21828, 488),
	(21828, 489),
	(21828, 490),
	(21828, 491),
	(21828, 492),
	(21828, 493),
	(21828, 494),
	(21828, 495),
	(21828, 496),
	(21828, 497),
	(21828, 498),
	(21828, 499),
	(21828, 500),
	(21828, 501),
	(21828, 502),
	(21828, 503),
	(21828, 504),
	(21828, 505),
	(21828, 506),
	(21828, 507),
	(21828, 508),
	(21828, 509),
	(21828, 510),
	(21828, 511),
	(21828, 512),
	(21828, 513),
	(21828, 515),
	(21828, 517),
	(21828, 519),
	(21828, 521),
	(21828, 522),
	(21828, 524),
	(21828, 527),
	(21828, 529),
	(21828, 530),
	(21828, 531),
	(21828, 532),
	(21828, 533),
	(21828, 534),
	(21828, 535),
	(21828, 536),
	(21828, 537),
	(21828, 538),
	(21828, 539),
	(21828, 540),
	(21828, 541),
	(21828, 542),
	(21828, 543),
	(21828, 544),
	(21828, 545),
	(21828, 547),
	(21828, 548),
	(21828, 549),
	(21828, 551),
	(21828, 554),
	(21828, 555),
	(21828, 557),
	(21828, 560),
	(21828, 561),
	(21828, 563),
	(21828, 564),
	(21828, 565),
	(21828, 567),
	(21828, 569),
	(21828, 570),
	(21828, 572),
	(21828, 573),
	(21828, 574),
	(21828, 575),
	(21828, 576),
	(21828, 577),
	(21828, 578),
	(21828, 579),
	(21828, 581),
	(21828, 582),
	(21828, 584),
	(21828, 585),
	(21828, 587),
	(21828, 588),
	(21828, 589),
	(21828, 591),
	(21828, 592),
	(21828, 593),
	(21828, 594),
	(21828, 595),
	(21828, 596),
	(21828, 597),
	(21828, 598),
	(21828, 599),
	(21828, 603),
	(21828, 604),
	(21828, 605),
	(21828, 606),
	(21828, 608),
	(21828, 610),
	(21828, 611),
	(21828, 612),
	(21828, 613),
	(21828, 614),
	(21828, 615),
	(21828, 616),
	(21828, 617),
	(21828, 618),
	(21828, 620),
	(21828, 621),
	(21828, 622),
	(21828, 623),
	(21828, 626),
	(21828, 628),
	(21828, 629),
	(21828, 631),
	(21828, 632),
	(21828, 633),
	(21828, 634),
	(21828, 636),
	(21828, 637),
	(21828, 638),
	(21828, 640),
	(21828, 641),
	(21828, 642),
	(21828, 643),
	(21828, 644),
	(21828, 645),
	(21828, 646),
	(21828, 647),
	(21828, 648),
	(21828, 649),
	(21828, 650),
	(21828, 651),
	(21828, 652),
	(21828, 653),
	(21828, 654),
	(21828, 655),
	(21828, 656),
	(21828, 657),
	(21828, 658),
	(21828, 659),
	(21828, 660),
	(21828, 661),
	(21828, 662),
	(21828, 663),
	(21828, 664),
	(21828, 665),
	(21828, 666),
	(21828, 667),
	(21828, 668),
	(21828, 669),
	(21828, 670),
	(21828, 671),
	(21828, 672),
	(21828, 673),
	(21828, 674),
	(21828, 675),
	(21828, 676),
	(21828, 677),
	(21828, 678),
	(21828, 679),
	(21828, 680),
	(21828, 681),
	(21828, 682),
	(21828, 683),
	(21828, 684),
	(21828, 685),
	(21828, 686),
	(21828, 687),
	(21828, 688),
	(21828, 689),
	(21828, 690),
	(21828, 691),
	(21828, 692),
	(21828, 693),
	(21828, 694),
	(21828, 695),
	(21828, 696),
	(21828, 697),
	(21828, 698),
	(21828, 699),
	(21828, 700),
	(21828, 701),
	(21828, 702),
	(21828, 703),
	(21828, 704),
	(21828, 705),
	(21828, 706),
	(21828, 707),
	(21828, 708),
	(21828, 709),
	(21828, 710),
	(21828, 711),
	(21828, 712),
	(21828, 713),
	(21828, 714),
	(21828, 715),
	(21828, 716),
	(21828, 717),
	(21828, 718),
	(21828, 719),
	(21828, 720),
	(21828, 721),
	(21828, 722),
	(21828, 723),
	(21828, 724),
	(21828, 725),
	(21828, 726),
	(21828, 727),
	(21828, 728),
	(21828, 736),
	(21828, 737),
	(21828, 738),
	(21828, 739),
	(21828, 740),
	(21828, 741),
	(21828, 742),
	(21828, 743),
	(21828, 744),
	(21828, 745),
	(21828, 746),
	(21828, 747),
	(21828, 748),
	(21828, 749),
	(21828, 768),
	(21828, 769),
	(21828, 770),
	(21828, 771),
	(21828, 772),
	(21828, 773),
	(21828, 774),
	(21828, 775),
	(21828, 776),
	(21828, 777),
	(21828, 778),
	(21828, 779),
	(21828, 780),
	(21828, 781),
	(21828, 782),
	(21828, 783),
	(21828, 784),
	(21828, 785),
	(21828, 786),
	(21828, 787),
	(21828, 788),
	(21828, 789),
	(21828, 790),
	(21828, 791),
	(21828, 792),
	(21828, 793),
	(21828, 794),
	(21828, 795),
	(21828, 796),
	(21828, 797),
	(21828, 798),
	(21828, 799),
	(21828, 800),
	(21828, 801),
	(21828, 802),
	(21828, 803),
	(21828, 804),
	(21828, 805),
	(21828, 806),
	(21828, 807),
	(21828, 808),
	(21828, 809),
	(21828, 810),
	(21828, 811),
	(21828, 812),
	(21828, 813),
	(21828, 814),
	(21828, 815),
	(21828, 816),
	(21828, 817),
	(21828, 818),
	(21828, 819),
	(21828, 820),
	(21828, 821),
	(21828, 822),
	(21828, 823),
	(21828, 824),
	(21828, 825),
	(21828, 826),
	(21828, 827),
	(21828, 828),
	(21828, 829),
	(21828, 830),
	(21828, 831),
	(21828, 832),
	(21828, 833),
	(21828, 834),
	(21828, 835),
	(21828, 836),
	(21828, 837),
	(21828, 838),
	(21828, 839),
	(21828, 840),
	(21828, 841),
	(21828, 842),
	(21828, 843),
	(21828, 844),
	(21828, 845),
	(21828, 846),
	(21828, 847),
	(21828, 848),
	(21828, 849),
	(21828, 850),
	(21828, 851),
	(21828, 852),
	(21828, 853),
	(21828, 854),
	(21828, 855),
	(21828, 856),
	(21828, 857),
	(21828, 858),
	(21828, 859),
	(21828, 860),
	(21828, 861),
	(21828, 862),
	(21828, 863),
	(21828, 864),
	(21828, 865),
	(21828, 866),
	(21828, 867),
	(21828, 868),
	(21828, 869),
	(21828, 870),
	(21828, 871),
	(21828, 872),
	(21828, 873),
	(21828, 874),
	(21828, 875),
	(21828, 876),
	(21828, 877),
	(21828, 878),
	(21828, 879),
	(21828, 880),
	(21828, 881),
	(21828, 882),
	(21828, 883),
	(21828, 884),
	(21828, 885),
	(21828, 886),
	(21828, 887),
	(21828, 888),
	(21828, 889),
	(21828, 890),
	(21828, 891),
	(21828, 892),
	(21828, 893),
	(21828, 894),
	(21828, 895),
	(21828, 900);
/*!40000 ALTER TABLE `char_spells` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
