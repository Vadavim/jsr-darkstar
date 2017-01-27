require("scripts/globals/jsr_augment");

-- Recipes Level 1 - 30 (requires Airlixir and 1000 gil)

local noviceRecipes = {
    {13164, AUGMENT_ACC, 1, AUGMENT_PET_ACC, 3, 0, 0, 0, 0}, -- Agile Gorget
    {13674, AUGMENT_HP, 8, AUGMENT_STAT_DEX, 4, 0, 0, 0, 0}, -- Agile Mantle
    {16296, AUGMENT_PET_STR, 3, AUGMENT_PET_VIT, 3, 0, 0, 0, 0}, -- Armiger's Lace
    {17211, AUGMENT_RAPIDSHOT, 8, 0, 0, 0, 0, 0, 0}, -- Amogavar Bow
    {17708, AUGMENT_MP, 10, AUGMENT_STAT_INT_MND, 5, 0, 0, 0, 0}, -- Auriga Xiphos
    {16935, AUGMENT_STAT_VITNEG, 10, AUGMENT_STAT_STR, 10, 0, 0, 0, 0}, -- Barbarian's Sword
    {13506, AUGMENT_FIRERES, 20, AUGMENT_ICERES, 20, 0, 0, 0, 0}, -- Bomb Ring
    {13359, AUGMENT_HPHEAL, 5, AUGMENT_DEF, 1, AUGMENT_DRAINASPIR_POTENCY, 10, 0, 0}, -- Bloodbead Earring
    {13057, AUGMENT_HPMP, 10, AUGMENT_PET_MEVA, 10, 0, 0, 0, 0}, -- Buburimu Goret
    {13367, AUGMENT_HP, 5, AUGMENT_DEF, 2, AUGMENT_PET_ATK, 2, 0, 0}, -- Bull Earring
    {13086, AUGMENT_SKILL_DIVINE, 5, AUGMENT_LIGHTATT, 5, 0, 0, 0, 0}, -- Cerulean Pendant
    {13623, AUGMENT_HP, 10, AUGMENT_VIT, 4, AUGMENT_PET_VIT, 8, 0, 0}, -- Earth Mantle
    {17936, AUGMENT_STAT_CHR, 5, AUGMENT_PET_ACC, 3, AUGMENT_PET_ATK, 6, 0, 0}, -- De Saintre's Axe
    {19044, AUGMENT_STAT_DEX, 1, AUGMENT_PET_DEX, 4, 0, 0, 0, 0}, -- Disciple Grip
    {15183, AUGMENT_DEF, 6, AUGMENT_PET_AGI, 3, AUGMENT_PET_EVA, 5, 0, 0}, -- Dobson Bandana
    {13096, AUGMENT_DARKRES, 8, AUGMENT_PET_ATK, 5, 0, 0, 0, 0}, -- Dog Collar
    {13238, AUGMENT_MP, 10, AUGMENT_PET_INT, 2, AUGMENT_PET_MND, 2, AUGMENT_PET_CHR, 2}, -- Druid's Rope
    {12404, AUGMENT_STAT_CHR, 3, AUGMENT_ACC, 5, AUGMENT_HP, 6, 0, 0}, -- Elegant Shield
    {12341, AUGMENT_RESIST_SILENCE, 8, AUGMENT_MP, 14, 0, 0, 0, 0}, -- Faerie Shield
    {11531, AUGMENT_PET_ATK, 5, AUGMENT_PET_DEF, 5, AUGMENT_PET_ENMITY, 2, AUGMENT_DEF, 4}, -- Fidelity Mantle
    {14466, AUGMENT_MP, 25, AUGMENT_STR, 3, AUGMENT_PET_DEF, 5, AUGMENT_PET_STR, 5}, -- Fomor Tunic
    {1322, AUGMENT_BLOOD_BOON, 5, AUGMENT_CONSERVEMP, 5, AUGMENT_PET_HASTE, 1, 0, 0}, -- Force Belt
    {12485, AUGMENT_RESIST_POISON, 12, AUGMENT_RESIST_PARALYZE, 12, AUGMENT_RESIST_BLIND, 12, 0, 0}, -- Fungus Hat
    {17786, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, AUGMENT_SKILL_NINJITSU, 5, 0, 0}, -- Ganko
    {18412, AUGMENT_STORETP, 10, AUGMENT_SKILL_NINJITSU, 5, 0, 0, 0, 0}, -- Gassan
    {17594, AUGMENT_HP, 5, AUGMENT_REGEN, 1, AUGMENT_PET_REGEN, 1, 0, 0}, -- Gelong Staff
    {13101, AUGMENT_ALLRES, 5, AUGMENT_HPMP, 10, AUGMENT_RESIST_BLIND, 10, 0, 0}, -- Green Scarf
    {17820, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, AUGMENT_MEVA, 5, 0, 0}, -- Gunromaru
    {13127, AUGMENT_HP, 20, AUGMENT_DEF, 3, AUGMENT_PET_DEF, 15, 0, 0}, -- Guarding Gorget
    {17693, AUGMENT_HP, 10, AUGMENT_DEF, 5, AUGMENT_LIGHTATT, 15, 0, 0}, -- Grudge Sword
    {14806, AUGMENT_HP, 5, AUGMENT_PET_DEX, 2, AUGMENT_PET_STR, 2, 0, 0}, -- Intruder Earring
    {12932, AUGMENT_SUBTLEBLOW, 5, AUGMENT_HP, 8, AUGMENT_DEF, 5, 0, 0}, -- Jujitsu Sitabaki
    {17811, AUGMENT_STORETP, 25, AUGMENT_HP, 5, 0, 0, 0, 0}, -- Katayama Ichimonji
    {13508, AUGMENT_DEF, 2, AUGMENT_STAT_VIT, 7, AUGMENT_PET_VIT, 3, 0, 0}, -- Maldust Ring
    {13510, AUGMENT_DEF, 2, AUGMENT_STAT_STR, 7, AUGMENT_PET_STR, 3, 0, 0}, -- Malflame Ring
    {13511, AUGMENT_DEF, 2, AUGMENT_STAT_DEX, 7, AUGMENT_PET_DEX, 3, 0, 0}, -- Malflash Ring
    {13507, AUGMENT_DEF, 2, AUGMENT_STAT_MND, 7, AUGMENT_PET_MND, 3, 0, 0}, -- Malflood Ring
    {13509, AUGMENT_DEF, 2, AUGMENT_STAT_INT, 7, AUGMENT_PET_INT, 3, 0, 0}, -- Malfrost Ring
    {13512, AUGMENT_DEF, 2, AUGMENT_STAT_AGI, 7, AUGMENT_PET_AGI, 3, 0, 0}, -- Malgust Ring
    {15287, AUGMENT_DEF, 2, AUGMENT_STAT_INT_MND, 2, AUGMENT_PET_INT, 2, AUGMENT_PET_MND, 2}, -- Mantra Belt
    {15348, AUGMENT_HP, 3, AUGMENT_PET_DEF, 15, 0, 0, 0, 0}, -- Mountain Gaiters
    {14465, AUGMENT_DEF, 4, AUGMENT_STAT_INT, 4, 0, 0, 0, 0}, -- Nanban Kariginu
    {13404, AUGMENT_DEF, 2, AUGMENT_ENMITY, 1, 0, 0, 0, 0}, -- Nemesis Earring
    {17794, AUGMENT_DBLATKCRIT, 2, AUGMENT_STAT_INT, 4, 0, 0, 0, 0}, -- Niokiyotsuna
    {17787, AUGMENT_STAT_STR_INT, 5, AUGMENT_SKILL_NINJITSU, 5, 0, 0, 0, 0}, -- Ohaguro
    {13227, AUGMENT_VIT, 1, AUGMENT_HP, 5, AUGMENT_PET_VIT, 2, 0, 0}, -- Plate Belt
    {16687, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, 0, 0, 0, 0}, -- Platoon Axe
    {17519, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, 0, 0, 0, 0}, -- Platoon Cesti
    {18209, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, 0, 0, 0, 0}, -- Platoon Cutter
    {17571, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, 0, 0, 0, 0}, -- Platoon Pole
    {17202, AUGMENT_RACC, 5, AUGMENT_RAPIDSHOT, 15, 0, 0, 0, 0}, -- Platoon Bow
    {17271, AUGMENT_RACC, 5, AUGMENT_RAPIDSHOT, 15, 0, 0, 0, 0}, -- Platoon Gun
    {17692, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, 0, 0, 0, 0}, -- Platoon Spatah
    {16959, AUGMENT_STORETP, 10, AUGMENT_WSKILL_DAM, 25, 0, 0, 0, 0}, -- Platoon Sword
    {18171, AUGMENT_RATK, 30, AUGMENT_SNAPSHOT, 10, 0, 0, 0, 0}, -- Platoon Disc
    {13675, AUGMENT_STAT_STR_VIT, 6, AUGMENT_HP, 15, AUGMENT_PET_STR, 6, AUGMENT_PET_VIT, 6}, -- Rarguard Mantle
    {15468, AUGMENT_HP, 25, AUGMENT_FIRERES, 15, AUGMENT_PET_VIT, 6, AUGMENT_PET_ENMITY, 4}, -- Resentment Cape
    {13576, AUGMENT_SKILL_DARK, 3, AUGMENT_DARKRES, 10, 0, 0, 0, 0}, -- Night Cape
    {12298, AUGMENT_STAT_INT, 2, AUGMENT_PET_MAGACCATK, 2, 0, 0, 0, 0}, -- Parana Shield
    {13095, AUGMENT_RESIST_PETRIFY, 10, AUGMENT_STAT_VIT, 3, AUGMENT_PET_VIT, 5, 0, 0}, -- Sand Charm
    {14885, AUGMENT_MP, 5, AUGMENT_PET_MAGACCATK, 2, 0, 0, 0, 0}, -- Sennight Bangles
    {13116, AUGMENT_HP, 5, AUGMENT_STAT_VIT, 1, AUGMENT_PET_STORETP, 5, 0, 0}, -- Silver Name Tag
    {15219, AUGMENT_STAT_STR_INT, 1, AUGMENT_PET_STR, 2, AUGMENT_PET_INT, 2, 0, 0}, -- Sinister Mask
    {17463, AUGMENT_HPMP, 10, AUGMENT_DBLATKCRIT, 5, 0, 0, 0, 0}, -- Sealed Mace
    {13365, AUGMENT_HP, 5, AUGMENT_PET_DEF, 5, 0, 0, 0, 0}, -- Shield Earring
    {15222, AUGMENT_STORESUBTLE, 10, AUGMENT_DEF, 10, 0, 0, 0, 0}, -- Spelunker's Hat
    {18610, AUGMENT_MPHEAL, 3, 0, 0, 0, 0, 0, 0}, -- Spiro Staff
    {16014, AUGMENT_STAT_STR, 1, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_ATK, 6}, -- Stormer Earring
    {16015, AUGMENT_STAT_VIT, 1, AUGMENT_DEF, 4, AUGMENT_PET_DEF, 6, 0, 0}, -- Esse Earring
    {13013, AUGMENT_HP, 15, AUGMENT_DEF, 8, 0, 0, 0, 0}, -- Stumbling Sandals
    {19045, AUGMENT_STAT_INT, 1, AUGMENT_PET_INT, 4, 0, 0, 0, 0}, -- Succubus Grip
    {16672, AUGMENT_CRITRATE, 5, AUGMENT_CRITDAMAGE, 20, 0, 0, 0, 0}, -- Tigerhunter
    {19043, AUGMENT_STAT_STR, 1, AUGMENT_PET_STR, 4, 0, 0, 0, 0}, -- Tenax Strap
    {13625, AUGMENT_DEF, 2, AUGMENT_MP, 10, AUGMENT_PET_INT, 3, 0, 0}, -- Tundra Mantle
    {13360, AUGMENT_EVA, 1, AUGMENT_PET_EVA, 6, 0, 0, 0, 0}, -- Twinstone Earring
    {12341, AUGMENT_RESIST_POISON, 20, AUGMENT_MP, 8, 0, 0, 0, 0}, -- Tropical Shield
    {13364, AUGMENT_HPMP, 6, 0, 0, AUGMENT_PET_ENMITY, 2, 0, 0}, -- Valor Earring
    {15503, AUGMENT_ALLRES, 4, AUGMENT_ENMITY, 1, 0, 0, 0, 0}, -- Van Pendant
    {15547, AUGMENT_STAT_INT_MND_CHR, 1, AUGMENT_PET_INT, 1, AUGMENT_PET_MND, 1, AUGMENT_PET_CHR, 1}, -- Vilma's Ring
    {13139, AUGMENT_SKILL_ENFEEBLE, 2, AUGMENT_SKILL_ENHANCE, 2, AUGMENT_PET_MAGACCATK, 2, 0, 0}, -- Yinyang Lorgnette

    -- CONQUEST EQUIPMENT
    {12822, AUGMENT_HPMP, 5, AUGMENT_PET_AGI, 2, 0, 0, 0, 0}, -- Centurian's Cuisses
    {12950, AUGMENT_HP, 5, AUGMENT_ATK, 2, AUGMENT_PET_ATK, 4, 0, 0}, -- Centurian's Greaves
    {12694, AUGMENT_HP, 5, AUGMENT_PET_DEX, 2, 0, 0, 0, 0}, -- Centurian's Finger Gauntlets
    {12438, AUGMENT_DEF, 3, AUGMENT_PET_DEF, 5, 0, 0, 0, 0}, -- Centurian's Visor
    {17028, AUGMENT_HP, 5, AUGMENT_ATK, 2, 0, 0, 0, 0}, -- Freesword's Club
    {17130, AUGMENT_HP, 5, AUGMENT_MP, 5, AUGMENT_MEVA, 5, AUGMENT_PET_MEVA, 10}, -- Freesword's Staff
    {12915, AUGMENT_HP, 10, AUGMENT_PET_ENMITY, 3, 0, 0, 0, 0}, -- Freesword's Slops
    {17159, AUGMENT_HP, 5, AUGMENT_RACC, 2, AUGMENT_RAPIDSHOT, 5, 0, 0}, -- Freesword's Bow
    {16648, AUGMENT_HP, 10, AUGMENT_DEFNEG, 10, AUGMENT_ATK, 10, 0, 0}, -- Legionnaire's Axe
    {17223, AUGMENT_HP, 5, AUGMENT_RATK, 5, 0, 0, 0, 0}, -- Legionnaire's Crossbow
    {13003, AUGMENT_HP, 5, AUGMENT_HPHEAL, 5, AUGMENT_BLOCKCHANCE, 1, 0, 0}, -- Legionnaire's Leggings
    {12629, AUGMENT_REGEN, 1, AUGMENT_PET_REGEN, 1, 0, 0, 0, 0}, -- Legionnaire's Harness
    {12752, AUGMENT_STAT_CHR, 3, AUGMENT_HPHEAL, 5, 0, 0, 0, 0}, -- Legionnaire's Mittens
    {17128, AUGMENT_HP, 15, AUGMENT_MP, 15, AUGMENT_MEVA, 5, AUGMENT_PET_MEVA, 10}, -- Legionnaire's Staff
    {13221, AUGMENT_PET_STR, 2, AUGMENT_PET_VIT, 2, AUGMENT_PET_INT, 2, AUGMENT_PET_DEX, 2}, -- Mercenary's Captain's Belt
    {12470, AUGMENT_HPMP, 5, AUGMENT_PET_STR, 1, AUGMENT_PET_DEX, 1, 0, 0}, -- Mercenary Captain's Headgear
    {12854, AUGMENT_HP, 5, AUGMENT_PET_EVA, 3, 0, 0, 0, 0}, -- Mercenary Captain's Hose
    {12598, AUGMENT_HPMP, 5, AUGMENT_PET_DEX, 1, AUGMENT_PET_AGI, 1, AUGMENT_PET_DEF, 3}, -- Mercenary Doublet
    {12726, AUGMENT_HPMP, 5, AUGMENT_PET_AGI, 2, 0, 0, 0, 0}, -- Mercenary's Captain's Gloves
    {12982, AUGMENT_HPMP, 5, AUGMENT_PET_AGI, 2, 0, 0, 0, 0}, -- Mercenary's Captain's Gaiters
    {12484, AUGMENT_STAT_INT_MND, 5, AUGMENT_SKILLCHAIN_DAM, 10, 0, 0, 0, 0}, -- Mercenary's Hachimaki
    {12470, AUGMENT_HP, 5, AUGMENT_PET_DEX, 1, AUGMENT_PET_AGI, 1, 0, 0}, -- Mercenary's Headgear
    {12975, AUGMENT_STAT_INT_MND, 2, AUGMENT_MEVA, 5, 0, 0, 0, 0}, -- Mercenary's Kyahan
    {12719, AUGMENT_STAT_INT_MND, 3, AUGMENT_ZANSHIN, 5, 0, 0, 0, 0}, -- Mercenary's Tekko
    {17103, AUGMENT_DEF, 6, AUGMENT_PET_DEF, 6, 0, 0, 0, 0}, -- Mercenary's Pole
    {12653, AUGMENT_STAT_INT_MND, 2, AUGMENT_SUBTLEBLOW, 5, 0, 0, 0, 0}, -- Mercenary's Gi
    {13102, AUGMENT_REGEN, 1, AUGMENT_PET_REGEN, 1, 0, 0, 0, 0}, -- Paisley Scarf
    {13099, AUGMENT_DEF, 4, AUGMENT_MPHEAL, 1, 0, 0, 0, 0}, -- Republican Iron Medal
    {16554, AUGMENT_MDEF, 5, AUGMENT_STAT_INT, 5, 0, 0, 0, 0}, -- Royal Archer's Sword
    {17167, AUGMENT_MP, 8, AUGMENT_RATK, 4, 0, 0, 0, 0}, -- Royal Archer's Longbow
    {13004, AUGMENT_MDEF, 5, AUGMENT_PET_MDEF, 5, AUGMENT_PET_MEVA, 5, 0, 0}, -- Royal Footman's Boots
    {12510, AUGMENT_WSKILL_ACC, 4, AUGMENT_PET_ACC, 2, 0, 0, 0, 0}, -- Royal Footman's Bandana
    {13045, AUGMENT_HPMP, 5, AUGMENT_PET_AGI, 2, 0, 0, 0, 0}, -- Royal Footman's Clogs
    {13104, AUGMENT_ATK, 3, AUGMENT_PET_ATK, 3, 0, 0, 0, 0}, -- Royal Squire's Collar
    {12431, AUGMENT_MDEF, 2, AUGMENT_MEVA, 2, AUGMENT_PET_MDEF, 3, AUGMENT_PET_MEVA, 3}, -- Royal Squire's Helm
    {12687, AUGMENT_PET_ACC, 2, 0, 0, 0, 0, 0, 0}, -- Royal Squire's Mufflers
    {12943, AUGMENT_STAT_INT_MND, 1, AUGMENT_MEVA, 4, AUGMENT_PET_MEVA, 4, 0, 0}, -- Royal Squire's Sollerets
    {17357, AUGMENT_STAT_STR_VIT, 5, AUGMENT_HP, 5, 0, 0, 0, 0}, -- Royal Spearman's Horn
    {12630, AUGMENT_DEF, 5, AUGMENT_PET_DEF, 5, 0, 0, 0, 0}, -- Royal Footman's Vest
    {13718, AUGMENT_MP, 5, AUGMENT_PET_INT, 1, AUGMENT_PET_AGI, 1, 0, 0}, -- Royal Footman's tunic
    {16852, AUGMENT_ATK, 2, AUGMENT_THUNDERATT, 10, 0, 0, 0, 0}, -- Royal Spearman's Spear
    {13174, AUGMENT_MDEF, 4, AUGMENT_MEVA, 4, AUGMENT_PET_MDEF, 6, AUGMENT_PET_MEVA, 6}, -- Willpower Torque

    -- JOB EARRINGS
    {13435, AUGMENT_DEF, 1, AUGMENT_PET_VIT, 2, 0, 0, 0, 0}, -- Mercenary's Earring
    {13436, AUGMENT_DEF, 1, AUGMENT_SUBTLEBLOW, 4, AUGMENT_PET_VIT, 2, 0, 0}, -- Wrestler's Earring (Latent: +30 HP, +2 Counter)
    {13437, AUGMENT_DEF, 1, AUGMENT_MP, 5, AUGMENT_PET_MND, 2, 0, 0}, -- Healer's Earring (Latent: Enmity -1, Healing +10)
    {13438, AUGMENT_DEF, 1, AUGMENT_MP, 5, AUGMENT_PET_INT, 1, 0, 0}, -- Wizard's Earring
    {13439, AUGMENT_DEF, 1, AUGMENT_MP, 5, AUGMENT_PET_INT, 1, 0, 0}, -- Warlock's Earring (Latent: MP Heal +1, Enfeebling +5)
    {14729, AUGMENT_DEF, 1, AUGMENT_EVA, 1, AUGMENT_PET_DEX, 1, 0, 0}, -- Pilferer's Earring (Latent: Dex +2, Crit +1%)
    {14730, AUGMENT_DEF, 1, AUGMENT_MDEF, 1, AUGMENT_PET_VIT, 2, 0, 0}, -- Esquire's Earring (Latent: DEF +5, DEFP +5%)
    {14731, AUGMENT_DEF, 1, AUGMENT_MP, 5, AUGMENT_PET_STR, 2, 0, 0}, -- Killer Earring (Latent: ATK +5, ATKP +5%)
    {14732, AUGMENT_DEF, 1, AUGMENT_HP, 5, AUGMENT_PET_STR, 2, 0, 0}, -- Trimmer's Earring
    {14733, AUGMENT_DEF, 1, AUGMENT_HP, 5, AUGMENT_PET_ENMITYNEG, 3, 0, 0}, -- Singer's Earring (Latent: EVA +5, Singing +10, REQUIEM +2)
    {14734, AUGMENT_DEF, 1, AUGMENT_HP, 5, AUGMENT_PET_CHR, 2, 0, 0}, -- Beater's Earring (Latent: RACC +3, RATK +6)
    {14735, AUGMENT_DEF, 1, AUGMENT_HP, 5, AUGMENT_PET_ACC, 1, 0, 0}, -- Ashigaru Earring (Latent: Parring +10, +3 Zanshin)
    {14736, AUGMENT_DEF, 1, AUGMENT_EVA, 1, AUGMENT_PET_EVA, 1, 0, 0}, -- Genin Earring (Latent: AGI +4, Ninjitsu +10)
    {14737, AUGMENT_DEF, 1, AUGMENT_ATK, 1, AUGMENT_PET_ATK, 2, 0, 0}, -- Wyvern Earring
    {14738, AUGMENT_DEF, 1, AUGMENT_STAT_CHR, 1, AUGMENT_PET_INT, 1, 0, 0}, -- Magician's Earring (Latent: MP +30, Summoning +10)

    -- JOB SHIELDS
    {12389, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 4, 0, 0, 0, 0}, -- Mercenary's Targe (Latent: HP +5, MP +20)
    {12390, AUGMENT_SUBTLEBLOW, 5, AUGMENT_PET_SUBTLEBLOW, 10, 0, 0, 0, 0}, -- Wrestler's Aspis (Latent: INT +8, MND +8)
    {12391, AUGMENT_REGEN, 1, AUGMENT_PET_REGEN, 1, 0, 0, 0, 0}, -- Healer's Shield (Latent: Dex +6, Regen +1)
    {12392, AUGMENT_MP, 8, AUGMENT_STAT_STR_INT, 1, AUGMENT_PET_STR, 1, AUGMENT_PET_INT, 1}, -- Wizard's Shield (latent: STR +6)
    {12393, AUGMENT_HPMP, 4, AUGMENT_PET_DEF, 4, 0, 0, 0, 0}, -- Warlock's Shield (Latent: +7 HPMP, +5 Enspell Damage)
    {12394, AUGMENT_HP, 5, AUGMENT_STAT_AGI, 1, AUGMENT_PET_AGI, 2, 0, 0}, -- Pilferer's Aspis (Latent: SHIELD +20, CRIT +2%)
    {12395, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 4, 0, 0}, -- Varlet's Targe (Latent: AGI +6, Enmity +5)
    {12396, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 4, 0, 0}, -- Killer Targe (Latent: MP +30, CHR +8)
    {12397, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_STR, 3, 0, 0}, -- Trimmer's Aspis (Latent: MND +8, Killer Effects +4)
    {12398, AUGMENT_HPMP, 2, AUGMENT_STAT_CHR, 1, AUGMENT_PET_DEF, 4, 0, 0}, -- Singer's Shield (Latent: PARRY +20, REQUIEM +2)
    {12399, AUGMENT_RATK, 3, AUGMENT_PET_AGI, 2, 0, 0, 0, 0}, -- Beater's Aspis (LATENT: Evasion +8)
    {12400, AUGMENT_RATK, 3, AUGMENT_PET_AGI, 2, 0, 0, 0, 0}, -- Ashigaru's Target (LATENT: Throwing +20)
    {12401, AUGMENT_HP, 5, AUGMENT_ATK, 2, AUGMENT_PET_ATK, 2, 0, 0}, -- Genin Aspis (LATENT: Attack +5, MATK +5)
    {12402, AUGMENT_HP, 5, AUGMENT_FIRERES, 10, AUGMENT_ICERES, 10, AUGMENT_THUNDERRES, 10}, -- Wyvern Targe
    {12402, AUGMENT_DEF, 4, AUGMENT_PET_INT, 3, AUGMENT_PET_MND, 3, 0, 0}, -- Magician's Shield (Latent: HP +20, MP +10)

    -- JOB BACK
    {13659, AUGMENT_DEF, 1, AUGMENT_HP, 5, AUGMENT_PET_DEF, 4, 0, 0}, -- Mercenary Mantle
    {13660, AUGMENT_HP, 3, AUGMENT_SUBTLEBLOW, 4, AUGMENT_PET_SUBTLEBLOW, 6, 0, 0}, -- Wrestler's Mantle (Latent: -15 delay, +5 Counter)
    {13661, AUGMENT_HP, 5, AUGMENT_SKILL_HEALING, 10, AUGMENT_PET_MND, 4, 0, 0}, -- Healer's Mantle (Latent: +8 MDEF, CURE POTENCY +8%)
    {13662, AUGMENT_MP, 5, AUGMENT_PET_INT, 2, 0, 0, 0, 0}, -- Wizard's Mantle (Latent: +4 MPHEAL)
    {13663, AUGMENT_HPMP, 5, AUGMENT_PET_ENMITY, -3, 0, 0, 0, 0}, -- Warlock's Mantle (Latent: +2 Fast Cast, +10 Enhancing)
    {13664, AUGMENT_HP, 5, AUGMENT_ENMITY, 1, AUGMENT_PET_EVA, 2, 0, 0}, -- Pilferer's Mantle (Latent: +4 Evasion, +4 Accuracy)
    {13665, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 4, 0, 0}, -- Esquire's Mantle (Latent: Undead Killer +8, DIVINE +20)
    {13666, AUGMENT_MP, 5, AUGMENT_DRAINASPIR_POTENCY, 5, AUGMENT_PET_INT, 2, 0, 0}, -- Killer Mantle (Latent: DARK +10)
    {13667, AUGMENT_HP, 5, AUGMENT_STAT_AGI, 1, AUGMENT_PET_AGI, 2, 0, 0}, -- Trimmer's Mantle (Latent: RESIST SLOW +20, CHR +5)
    {13668, AUGMENT_HP, 5, AUGMENT_STAT_CHR, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Singer's Mantle (Latent: RESIST SILENCE +20, SINGING +20, Paeon +1)
    {13669, AUGMENT_HP, 5, AUGMENT_RATK, 2, AUGMENT_PET_AGI, 2, 0, 0}, -- Beater's Mantle (Latent: RAPID SHOT +8)
    {13670, AUGMENT_HP, 5, AUGMENT_ATK, 2, AUGMENT_PET_ATK, 2, 0, 0}, -- Ashigaru's Mantle (Latent: +20 Resist Blind, +5 Zanshin)
    {13671, AUGMENT_HP, 5, AUGMENT_EVA, 2, AUGMENT_PET_EVA, 4, 0, 0}, -- Genin's Mantle (Latent: +20 Resist Bind, +20 Ninjitsu)
    {13672, AUGMENT_HP, 5, AUGMENT_FIRERES, 5, AUGMENT_ICERES, 5, AUGMENT_THUNDERRES, 5}, -- Wyvern Mantle (Latent: +12 Attack, +10 Fire/Ice/Thunder Def)
    {13673, AUGMENT_MP, 5, AUGMENT_STAT_CHR, 1, AUGMENT_PET_INT, 2, 0, 0}, -- Magician's Mantle (latent: Summoning +10, CHR +5)

    -- JOB Belt
    {15271, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Axe Belt (Latent: GAXE +5, Attack +2)
    {15272, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Cestus Belt (Latent: H2H +5, Counter +2)
    {15273, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Mace Belt (Latent: Club +10, Regen +1)
    {15274, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Staff Belt (latent: Staff +10, Conserve MP +5)
    {15275, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Rapier Belt (latent: Sword +10, Enspell Damage +3)
    {15276, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Dagger Belt (latent: Dagger +10, Crit +1%)
    {15277, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Shield Belt (latent: Shield +10, Enmity +2, Shield Mastery +15)
    {15278, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Scythe Belt (latent: Scythe +10, Occult Acumen +30)
    {15279, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Pick Belt (latent: Axe +10, Charm Chance +10)
    {15280, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Song Belt (latent: Singing +10, Requiem +2, Paeon +2, Threnody +2)
    {15281, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Gun Belt (latent: Marksmanship +10, Recycling +5)
    {15282, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Katana Obi (latent: Store TP +2, Zanshin +5)
    {15283, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Sarashi (latent: Dual Wield -1%, Ninjitsu +5, Int +2)
    {15284, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Lance Belt (latent: Polearm +10, Jump TP Bonus +100)
    {15285, AUGMENT_HP, 5, AUGMENT_DEF, 1, AUGMENT_PET_DEF, 2, 0, 0}, -- Avatar Belt (latent: Perp -2, Summoning +5, Blood Boon +25)

    -- JOB TORQUES
    {11988, AUGMENT_ENMITY, 1, AUGMENT_ATKNEG, -10, AUGMENT_DEF, 20, AUGMENT_HP, 20}, -- Fighter's Torque
    {11989, AUGMENT_ENMITY, 10, AUGMENT_UDMGPHYS, -10, AUGMENT_CURERCVD, 10, AUGMENT_REGEN, 1}, -- Temple Torque
    {11989, AUGMENT_ENMITY, 10, AUGMENT_CURESPELLTIME -10, AUGMENT_LIGHTATT, 15, AUGMENT_LIGHTACC, 15}, -- Healer's Torque
    {11991, AUGMENT_ENMITY, 20, AUGMENT_CONSERVEMP, 15, 0, 0, 0, 0}, -- Wizard's Torque
    {11992, AUGMENT_ENMITY, 12, AUGMENT_WSKILL_ACC, 20, AUGMENT_SKILLCHAIN_DAM, 20, AUGMENT_MAGICBURST_DMG, 20}, -- Warlock's Torque
    {11993, AUGMENT_SUBTLEBLOW, 15, 0, 0, 0, 0, 0, 0}, -- Rogue's Torque
    {11994, AUGMENT_CURESPELLTIME, -25, AUGMENT_SPELLINTERRUPT, -10, 0, 0, 0}, -- Gallant's Torque
    {11995, AUGMENT_SKILL_ELEMENTAL, 10, AUGMENT_MAGCRIT, 15, 0, 0, 0, 0}, -- Chaos Torque
    {11996, AUGMENT_PET_ENMITY, 5, AUGMENT_PET_SUBTLEBLOW, 25, 0, 0, AUGMENT_PET_REGEN, 1}, -- Beast Torque
    {11997, AUGMENT_SONGSPELLTIME, -15, AUGMENT_DEF, 5, AUGMENT_HP, 25, 0, 0}, -- Choral Torque
    {11998, AUGMENT_RACCNEG, 20, AUGMENT_RAPIDSHOT, 15, 0, 0, 0, 0}, -- Hunter's Torque
    {11999, AUGMENT_ENMITY, 20, AUGMENT_UDMGPHYS, -15, AUGMENT_STAT_AGI, 10, 0, 0}, -- Myochin Shusa
    {12000, AUGMENT_MATK, 8, AUGMENT_STAT_INT, 4, 0, 0, 0, 0}, -- Ninja Shusa
    {12001, AUGMENT_PET_ACC, 8, AUGMENT_PET_DBLATKCRIT, 5, AUGMENT_PET_MAGACCATK, 15, AUGMENT_PET_ENMITY, 25}, -- Drachen Torque
    {12002, AUGMENT_PET_ENMITY, 15, AUGMENT_PET_UDMG, -15, 0, 0, 0, 0}, -- Evoker's Torque
    {12003, AUGMENT_ENMITY, 10, AUGMENT_MACCMATK, 10, 0, 0, 0, 0}, -- Magus's Torque
    {12004, AUGMENT_STAT_STR_AGI, 2, AUGMENT_STORETP, 5, 0, 0, 0, 0}, -- Corsair's Torque
    {12005, AUGMENT_PET_ENMITY, 8, AUGMENT_PET_MDEF, 5, AUGMENT_PET_MEVA, 5, AUGMENT_PET_UDMG, -5}, -- Puppetry Torque
    {12006, AUGMENT_SKILLCHAIN_DAM, 25, AUGMENT_WSKILL_ACC, 20, 0, 0, 0, 0}, -- Dancer's Torque
    {12007, AUGMENT_ENMITY, 15, AUGMENT_CUREPOTENCY, 8, AUGMENT_MACCMATK, 8, 0, 0}, -- Scholar's Torque

    -- SPECIAL ARMOR
    {16097, AUGMENT_MP, 15, AUGMENT_STAT_CHR, 6, 0, 0, 0, 0}, -- Anu's Tiara

}

local expertRecipes = {
    {13567, AUGMENT_DEF, 4, AUGMENT_ICERES, 20, 0, 0, 0, 0}, -- Bomb Queen Ring
}


local function findNoviceRecipe(id)
    for i,v in pairs(noviceRecipes) do
        if (id == v[1]) then return v end;
    end

    return nil;
end

local function findExpertRecipes(id)
    for i,v in pairs(expertRecipes) do
        if (id == v[1]) then return v end;
    end

    return nil;
end

local function findMasterRecipes(id)
    for i,v in pairs(masterRecipes) do
        if (id == v[1]) then return v end;
    end

    return nil;
end

function tryUnleash(player, npc, trade)
    if (trade:getItemCount() ~= 3) then return false end;
    local result = nil;

    local id = trade:getItemId(1);
    if (trade:getItemId(0) == 3974 and trade:getGil() == 1000) then
        result =  findNoviceRecipe(id);
    elseif (trade:getItemId(0) == 3975 and trade:getGil() == 2500) then
        result =  findExpertRecipes(id);
    elseif (trade:getItemId(0) == 3976 and trade:getGil() == 5000) then
        result =  findMasterRecipes(id);
    end

    if (result == nil) then
        return false;
    end


    player:tradeComplete();
    player:addItem(id, 1, result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8]);

    return true;

end