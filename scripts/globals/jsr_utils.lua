require("scripts/globals/status");
require("scripts/globals/utils");

WOOD = "woodworking"
FISH = "fishing"
SMIT = "smithing"
GOLD = "goldsmithing"
WEAV = "weaving"
LEAT = "leathercraft"
BONE = "bonecraft"
ALCH = "alchemy"
COOK = "cooking"


AUGMENT_HP = 1;
AUGMENT_HPNEG = 5;
AUGMENT_MP = 9;
AUGMENT_MPNEG = 13;
AUGMENT_HPMP = 17;
AUGMENT_HPNEGMP = 21;
AUGMENT_MPNEGHP = 19;

AUGMENT_HPHEAL = 51;
AUGMENT_MPHEAL = 52;

AUGMENT_REGEN = 137;
AUGMENT_REFRESH = 138;
AUGMENT_RECYCLE = 212;

AUGMENT_RAPIDSHOT = 139;
AUGMENT_FASTCAST = 140;
AUGMENT_CONSERVEMP = 141;
AUGMENT_STORETP = 142;
AUGMENT_DBLATK = 143;
AUGMENT_TRPLATTACK = 144;
AUGMENT_COUNTER = 145;
AUGMENT_DUALWIELD = 146;
AUGMENT_TREASUREHUNTER = 147;
AUGMENT_MARTIALARTS = 151;
AUGMENT_KICKATTACKS = 194;
AUGMENT_SHIELDMASTERY = 153;
AUGMENT_SUBTLEBLOW = 195;
AUGMENT_ZANSHIN = 198;
AUGMENT_SNAPSHOT = 211;
AUGMENT_RECYCLE = 212;
AUGMENT_OCCULT_ACUMEN = 237; --TODO: Implement
AUGMENT_BLOOD_BOON = 233;
AUGMENT_BLOODPACTDELAY = 320;
AUGMENT_STATUSRES = 61;
AUGMENT_AVATARPERP = 321;
AUGMENT_SONGSPELLTIME = 322;
AUGMENT_CURESPELLTIME = 323; --TODO: Implement

AUGMENT_WSKILL_ACC = 326;
AUGMENT_WSKILL_DAM = 327; --TODO: Implement
AUGMENT_SKILLCHAIN_DAM = 332;
AUGMENT_CONSERVETP = 333;
AUGMENT_CRITDAMAGE = 328;
AUGMENT_MAGICBURST_DMG = 334;
AUGMENT_MAGICCRIT_DMG = 335;
AUGMENT_WALTZ_TPCOST = 342; --TODO: Implement
AUGMENT_DRAINASPIR_POTENCY = 343;

AUGMENT_CUREPOTENCY = 329;
AUGMENT_WALTZPOTENCY = 330;
AUGMENT_WALTZ_DELAY = 331; --TODO: Implement
AUGMENT_TPBONUS = 353; --+50 per point
AUGMENT_QUADATK = 354;
AUGMENT_CURERCVD = 356;
AUGMENT_SAVETP = 360; --TODO: Implement (+10 per point)

AUGMENT_MAGICDAM = 362;
AUGMENT_BLOCKCHANCE = 363;
AUGMENT_REGENPOTENCY = 371; --TODO: Implement
AUGMENT_ENHANCE_DURATION = 1248; --TODO: Implement
AUGMENT_HELIXDURATION = 1250;

AUGMENT_SKILL_H2H = 257;
AUGMENT_SKILL_DAGGER = 258;
AUGMENT_SKILL_SWORD = 259;
AUGMENT_SKILL_GREATSWORD = 260;
AUGMENT_SKILL_AXE = 261;
AUGMENT_SKILL_GREATAXE = 262;
AUGMENT_SKILL_SCYTHE = 263;
AUGMENT_SKILL_POLEARM = 264;
AUGMENT_SKILL_KATANA = 265;
AUGMENT_SKILL_GREATKATANA = 266;
AUGMENT_SKILL_CLUB = 267;
AUGMENT_SKILL_STAFF = 268;
AUGMENT_SKILL_AME = 278;
AUGMENT_SKILL_ARA = 279;
AUGMENT_SKILL_AMA = 280;
AUGMENT_SKILL_ARCHERY = 281;
AUGMENT_SKILL_MARKSMANSHIP = 282;
AUGMENT_SKILL_THROWING = 283;
AUGMENT_SKILL_SHIELD = 286;
AUGMENT_SKILL_DIVINE = 288;
AUGMENT_SKILL_HEALING = 289;
AUGMENT_SKILL_ENHANCE = 290;
AUGMENT_SKILL_ENFEEBLE = 291;
AUGMENT_SKILL_ELEMENTAL = 292;
AUGMENT_SKILL_DARK = 293;
AUGMENT_SKILL_SUMMONING = 294;
AUGMENT_SKILL_NINJITSU = 295;
AUGMENT_SKILL_SINGING = 296;
AUGMENT_SKILL_BLUE = 299;

AUGMENT_ACC = 23;
AUGMENT_ACCNEG = 24;
AUGMENT_ATK = 25;
AUGMENT_ATKNEG = 26;
AUGMENT_RACC = 27;
AUGMENT_RACCNEG = 27;
AUGMENT_RATK = 29;
AUGMENT_RATKNEG = 29;
AUGMENT_EVA = 31;
AUGMENT_EVANEG = 32;
AUGMENT_MEVA = 37;
AUGMENT_MEVANEG = 38;
AUGMENT_MATK = 133;
AUGMENT_MDEF = 134;
AUGMENT_DEF = 33;
AUGMENT_DEFNEG = 34;
AUGMENT_MDEFNEG = 58;
AUGMENT_RACC = 27;
AUGMENT_RACCNEG = 28;
AUGMENT_MACC = 35;
AUGMENT_MACCNEG = 36;
AUGMENT_HASTE = 49;
AUGMENT_SLOW = 50;
AUGMENT_ENMITY = 39;
AUGMENT_ENMITYNEG = 40;
AUGMENT_CRITRATE = 41;
AUGMENT_STORESUBTLE = 44;


AUGMENT_ACCRNGACC = 129;
AUGMENT_ATKRATK = 130;
AUGMENT_MACCMATK = 131;
AUGMENT_DBLATKCRIT = 132;


AUGMENT_UDMGPHYS = 54;
AUGMENT_UDMGMAG = 55;
AUGMENT_UDMG = 71;

AUGMENT_MAGCRIT = 57;
AUGMENT_SPELLINTERRUPT = 53;

AUGMENT_RESIST_SLEEP = 176;
AUGMENT_RESIST_POISON = 177;
AUGMENT_RESIST_PARALYZE = 178;
AUGMENT_RESIST_BLIND = 179;
AUGMENT_RESIST_SILENCE = 180;
AUGMENT_RESIST_PETRIFY = 181;
AUGMENT_RESIST_VIRUS = 182;
AUGMENT_RESIST_CURSE = 183;
AUGMENT_RESIST_SLOW = 187;
AUGMENT_RESIST_CHARM = 188;


AUGMENT_PET_ACC = 96;
AUGMENT_PET_ATK = 97;
AUGMENT_PET_EVA = 98;
AUGMENT_PET_DEF = 99;
AUGMENT_PET_CRIT = 102;
AUGMENT_PET_ENMITY = 104;
AUGMENT_PET_ENMITYNEG = 105;
AUGMENT_PET_MAGACCATK = 108;
AUGMENT_PET_DBLATKCRIT = 109;
AUGMENT_PET_REGEN = 110;
AUGMENT_PET_HASTE = 111;
AUGMENT_PET_UDMG = 112;
AUGMENT_PET_STORETP = 115;
AUGMENT_PET_SUBTLEBLOW = 116;
AUGMENT_PET_MEVA = 117;
AUGMENT_PET_MDEF = 119;
AUGMENT_PET_TPBONUS = 122; --+20 per point
AUGMENT_PET_DBLATK = 123;

AUGMENT_PET_STR = 1792;
AUGMENT_PET_DEX = 1793;
AUGMENT_PET_VIT = 1794;
AUGMENT_PET_AGI = 1795;
AUGMENT_PET_INT = 1796;
AUGMENT_PET_MND = 1797;
AUGMENT_PET_CHR = 1798;

AUGMENT_STAT_STR = 512;
AUGMENT_STAT_DEX = 513;
AUGMENT_STAT_VIT = 514;
AUGMENT_STAT_AGI = 515;
AUGMENT_STAT_INT = 516;
AUGMENT_STAT_MND = 517;
AUGMENT_STAT_CHR = 518;

AUGMENT_STAT_STRNEG = 519;
AUGMENT_STAT_DEXNEG = 520;
AUGMENT_STAT_VITNEG = 521;
AUGMENT_STAT_AGINEG = 522;
AUGMENT_STAT_INTNEG = 523;
AUGMENT_STAT_MNDNEG = 524;
AUGMENT_STAT_CHRNEG = 525;

AUGMENT_STAT_STR_DEX = 550;
AUGMENT_STAT_STR_VIT= 551;
AUGMENT_STAT_STR_AGI= 552;
AUGMENT_STAT_DEX_AGI= 553;
AUGMENT_STAT_INT_MND = 554;
AUGMENT_STAT_STR_CHR = 557;
AUGMENT_STAT_MND_CHR = 555;
AUGMENT_STAT_STR_INT = 558;
AUGMENT_STAT_STR_MND = 559;
AUGMENT_STAT_INT_MND_CHR = 556;

local onePosStats = {526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549};

local statCombos = {AUGMENT_STAT_STR_DEX , AUGMENT_STAT_STR_VIT, AUGMENT_STAT_STR_AGI, AUGMENT_STAT_DEX_AGI, AUGMENT_STAT_INT_MND , AUGMENT_STAT_STR_CHR , AUGMENT_STAT_MND_CHR , AUGMENT_STAT_STR_INT , AUGMENT_STAT_STR_MND , AUGMENT_STAT_INT_MND_CHR};

AUGMENT_FIRERES = 768;
AUGMENT_ICERES = 769;
AUGMENT_WINDRES = 770;
AUGMENT_EARTHRES = 771;
AUGMENT_THUNDERRES = 772;
AUGMENT_WATERRES = 773;
AUGMENT_LIGHTRES = 774;
AUGMENT_DARKRES = 775;

AUGMENT_FIRERESNEG = 776;
AUGMENT_ICERESNEG = 777;
AUGMENT_WINDRESNEG = 778;
AUGMENT_EARTHRESNEG = 779;
AUGMENT_THUNDERRESNEG = 780;
AUGMENT_WATERRESNEG = 781;
AUGMENT_LIGHTRESNEG = 782;
AUGMENT_DARKRESNEG = 783;
AUGMENT_ALLDARK = 793;
AUGMENT_ALLLIGHT = 792;
AUGMENT_ALLRES = 796;
AUGMENT_ALLRESNEG = 797;


AUGMENT_FIREACC = 936;
AUGMENT_ICEACC = 937;
AUGMENT_WINDACC = 938;
AUGMENT_EARTHACC = 939;
AUGMENT_THUNDERACC = 940;
AUGMENT_WATERACC = 941;
AUGMENT_LIGHTACC = 942;
AUGMENT_DARKACC = 943;

AUGMENT_FIREATT = 944;
AUGMENT_ICEATT = 925;
AUGMENT_WINDATT = 946;
AUGMENT_EARTHATT = 947;
AUGMENT_THUNDERATT = 948;
AUGMENT_WATERATT = 949;
AUGMENT_LIGHTATT = 950;
AUGMENT_DARKATT = 951;


AUGMENT_WS_BACKHAND = 1024;
AUGMENT_WS_SPINNINGATTACK = 1025;
AUGMENT_WS_HOWLING = 1026;
AUGMENT_WS_DRAGONKICK = 1027;

AUGMENT_WS_VIPERBITE = 1028;
AUGMENT_WS_SHADOWSTITCH = 1029;
AUGMENT_WS_CYCLONE = 1030;
AUGMENT_WS_EVISCERATION = 1031;

AUGMENT_WS_BURNINGBLADE = 1032;
AUGMENT_WS_SHININGBLADE = 1033;
AUGMENT_WS_CIRCLEBLADE = 1034;
AUGMENT_WS_SAVAGEBLADE = 1035;

AUGMENT_WS_FREEZEBITE = 1036;
AUGMENT_WS_SHOCKWAVE = 1037;
AUGMENT_WS_GROUNDSTRIKE = 1038;
AUGMENT_WS_SICKLEMOON = 1039;

AUGMENT_WS_GALEAXE = 1040;
AUGMENT_WS_SPINNINGAXE = 1041;
AUGMENT_WS_CALAMITY = 1042;
AUGMENT_WS_DECIMATION = 1043;

AUGMENT_WS_IRONTEMPEST = 1044;
AUGMENT_WS_STURMWIND = 1045;
AUGMENT_WS_KEENEDGE = 1046;
AUGMENT_WS_STEELCYCLONE = 1047;

AUGMENT_WS_NIGHTMARESCYTHE = 1048;
AUGMENT_WS_SPINNINGSCYTHE = 1049;
AUGMENT_WS_VORPALSCYTHE = 1050;
AUGMENT_WS_SPIRALHELL = 1051;

AUGMENT_WS_LEGSWEEP = 1052;
AUGMENT_WS_VORPALTHRUST = 1053;
AUGMENT_WS_SKEWER = 1054;
AUGMENT_WS_IMPULSEDRIVE = 1055;

AUGMENT_WS_BLADETO = 1056;
AUGMENT_WS_BLADECHI = 1057;
AUGMENT_WS_BLADETEN = 1058;
AUGMENT_WS_BLADEKU = 1059;

AUGMENT_WS_TACHIGOTEN = 1060;
AUGMENT_WS_TACHIJINPU = 1061;
AUGMENT_WS_TACHIKOKI = 1062;
AUGMENT_WS_TACHIKASHA = 1063;

AUGMENT_WS_BRAINSHAKER = 1064;
AUGMENT_WS_SKULLBREAKER = 1065;
AUGMENT_WS_JUDGMENT = 1066;
AUGMENT_WS_BLACKHALO = 1067;

AUGMENT_WS_ROCKCRUSHER = 1068;
AUGMENT_WS_SHELLCRUSHER = 1069;
AUGMENT_WS_FULLSWING = 1070;
AUGMENT_WS_RETRIBUTION = 1071;

AUGMENT_WS_DULLINGARROW = 1072;
AUGMENT_WS_BLASTARROW = 1073;
AUGMENT_WS_ACHINGARROW = 1074;
AUGMENT_WS_EMPYREALARROW = 1075;

AUGMENT_WS_HOTSHOT = 1076;
AUGMENT_WS_SPLITSHOT = 1077;
AUGMENT_WS_SNIPERSHOT = 1078;
AUGMENT_WS_DETONATOR = 1079;


function noDominantRune(target)
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    
    return (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2);
end;

function addRune(player, rune)
    local runLevel = 0;
    local minRunes = 0;
    if(player:getMainJob() == JOBS.RUN or player:getMainJob() == JOBS.GEO) then
        runLevel = player:getMainLvl();
    else
        runLevel = player:getSubLvl();
    end
    if (runLevel < 35) then
        minRunes = 1;
    elseif (runLevel < 65) then
        minRunes = 2;
    else
        minRunes = 3;
    end
        
    if (player:getActiveRunes() >= minRunes) then
        player:removeOldestRune();
    end
    local power = math.floor(5 + runLevel * 0.3);
    player:addStatusEffect(rune,power,3,300);
end;

function vallationDefense(count)
    if (count == 1) then
        return 50;
    elseif (count == 2) then
        return 65;
    elseif (count == 3) then
        return 80;
    else
        return 0;
    end
end;

function pflugRes(count)
    if (count == 1) then
        return 60;
    elseif (count == 2) then
        return 80;
    elseif (count == 3) then
        return 100;
    else
        return 0;
    end
end;

function createRuneMask(target)
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    
    local mask = 0;
    local subMask = 0;
    
    mask = mask + ignis;
    mask = mask + gelus * 4;
    mask = mask + flabra * 16;
    mask = mask + tellus * 64;
    mask = mask + sulpor * 256;
    mask = mask + unda * 1024;
    mask = mask + lux * 4096;
    mask = mask + tenebrae * 16384;
    return mask;
end;

function applyValianceMask(effect)
    local bit = require("bit")
    local lshift = bit.lshift;
    local rshift = bit.rshift;
    local band = bit.band;
    local mask = effect:getPower();
    
    local ignis = band(mask, 3);
    local gelus = rshift(band(mask, lshift(3, 2)), 2);
    local flabra = rshift(band(mask, lshift(3, 4)), 4);
    local tellus = rshift(band(mask, lshift(3, 6)), 6);
    local sulpor = rshift(band(mask, lshift(3, 8)), 8);
    local unda = rshift(band(mask, lshift(3, 10)), 10);
    local lux = rshift(band(mask, lshift(3, 12)), 12);
    local tenebrae = rshift(band(mask, lshift(3, 14)), 14);
    
    effect:addMod(MOD_FIREDEF, vallationDefense(unda));
    effect:addMod(MOD_ICEDEF, vallationDefense(ignis));
    effect:addMod(MOD_WATERDEF, vallationDefense(sulpor));
    effect:addMod(MOD_EARTHDEF, vallationDefense(flabra));
    effect:addMod(MOD_THUNDERDEF, vallationDefense(tellus));
    effect:addMod(MOD_WINDDEF, vallationDefense(gelus));
    effect:addMod(MOD_LIGHTDEF, vallationDefense(tenebrae));
    effect:addMod(MOD_DARKDEF, vallationDefense(lux));
end;

function applyPflugMask(effect)
    local bit = require("bit")
    local lshift = bit.lshift;
    local rshift = bit.rshift;
    local band = bit.band;
    local mask = effect:getPower();
    
    local ignis = band(mask, 3);
    local gelus = rshift(band(mask, lshift(3, 2)), 2);
    local flabra = rshift(band(mask, lshift(3, 4)), 4);
    local tellus = rshift(band(mask, lshift(3, 6)), 6);
    local sulpor = rshift(band(mask, lshift(3, 8)), 8);
    local unda = rshift(band(mask, lshift(3, 10)), 10);
    local lux = rshift(band(mask, lshift(3, 12)), 12);
    local tenebrae = rshift(band(mask, lshift(3, 14)), 14);
    
    effect:addMod(MOD_FIRERES, pflugRes(unda));
    effect:addMod(MOD_VIRUSRES, pflugRes(unda) / 5);
    effect:addMod(MOD_AMNESIARES, pflugRes(unda) / 5);

    effect:addMod(MOD_ICERES, pflugRes(ignis));
    effect:addMod(MOD_PARALYZERES, pflugRes(ignis) / 5);
    effect:addMod(MOD_BINDRES, pflugRes(ignis) / 5);

    effect:addMod(MOD_WATERRES, pflugRes(sulpor));
    effect:addMod(MOD_POISONRES, pflugRes(sulpor) / 5);

    effect:addMod(MOD_EARTHRES, pflugRes(flabra));
    effect:addMod(MOD_SLOWRES, pflugRes(flabra) / 5);
    effect:addMod(MOD_GRAVITYRES, pflugRes(flabra) / 5);
    effect:addMod(MOD_PETRIFYRES, pflugRes(flabra) / 5);

    effect:addMod(MOD_THUNDERRES, pflugRes(tellus));
    effect:addMod(MOD_STUNRES, pflugRes(tellus) / 5);

    effect:addMod(MOD_WINDRES, pflugRes(gelus));
    effect:addMod(MOD_SILENCERES, pflugRes(gelus) / 5);

    effect:addMod(MOD_LIGHTRES, pflugRes(tenebrae));
    effect:addMod(MOD_CHARMRES, pflugRes(tenebrae) / 5);

    effect:addMod(MOD_DARKRES, pflugRes(lux));
    effect:addMod(MOD_SLEEPRES, pflugRes(lux) / 5);
    effect:addMod(MOD_BLINDRES, pflugRes(lux) / 5);
    effect:addMod(MOD_CURSERES, pflugRes(lux) / 5);
    effect:addMod(MOD_DEATHRES, pflugRes(lux) / 5);
end;

function startConfrontation(player, power, duration, mobs, hardmode)
    local mob = nil;
    player:applyConfrontationToParty(power, duration);
    for k,v in pairs(mobs) do
        mob = SpawnMob(v);
        mob:setSpawner(player);
        mob:updateClaim(player);
        mob:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
        mob:addStatusEffect(EFFECT_CONFRONTATION, power, 0, duration);
        if (hardmode == false) then
            mob:setMobMod(MOBMOD_HARD_MODE, 1);
        else
            mob:addMod(MOD_DEFP, 10);
            mob:addMod(MOD_ATTP, 10);
            mob:addMod(MOD_EVA, 20);
            mob:addMod(MOD_ACC, 20);
            mob:addMod(MOD_MEVA, 20);
            mob:addMod(MOD_MATT, 15);
            mob:addMod(MOD_MACC, 20);
            mob:addMod(MOD_STORETP, 35);
            mob:addMod(MOD_MDEF, 10);
            mob:addMod(MOD_HASTE_MAGIC, 100);
            mob:setMobMod(MOBMOD_HARD_MODE, 2);
        end

        local partySize = player:getPartySize(0);
        if (partySize > 1) then
            mob:addMod(MOD_HPP, (15 * (partySize - 1)));
        end
        printf("Party size is: %d\n", partySize);



        --DespawnMob(mob, 25);
    end
end;

function applyBarDurationReduction(target, effect, barType)
    if (target:hasStatusEffect(barType)) then
        local duration = effect:getDuration();
        duration = math.floor(duration * 3 / 2);
        if (duration == 0) then
            duration = 1;
        end
        effect:setDuration(duration);
    end
end;




function jsrReward(player, rewards)
    if (rewards["xp"] ~= nil) then
        player:addLimitPoints(rewards["xp"]);
        player:addExp(rewards["xp"]);
    end

    if (rewards["gil"] ~= nil) then
        player:addGil(rewards["gil"]);
--        player:SayToPlayer("Received " .. tostring(rewards["gil"]) .. " gil.");
        player:messageSpecial(GIL_OBTAINED,rewards["gil"]);
    end

    if (rewards["cp"] ~= nil) then
        player:addCP(rewards["cp"]);
        player:SayToPlayer("Received " .. tostring(rewards["cp"]) .. " cp.");
    end

    if (rewards["beast"] ~= nil) then
        player:addItem(1126, rewards["beast"]);
        if (rewards["beast"] == 1) then
            player:messageSpecial(ITEM_OBTAINED,1126, rewards["beast"]);
        else
            player:SayToPlayer("Received " .. tostring(rewards["beast"]) .. " beastman seals.");
        end
    end

    if (rewards["item"] ~= nil) then
        player:addItem(rewards["item"]);
        player:messageSpecial(ITEM_OBTAINED,rewards["item"]);
    end

    if (rewards["item2"] ~= nil) then
        player:addItem(rewards["item2"]);
        player:messageSpecial(ITEM_OBTAINED,rewards["item2"]);
    end

    if (rewards["augment"] ~= nil) then
        local arr = rewards["augment"];
        player:addItem(arr[1], 1, arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9]);
        player:messageSpecial(ITEM_OBTAINED,arr[1]);
    end

    if (rewards["guild"] ~= nil) then
        local arr = rewards["guild"]
        player:addCurrency("guild_" .. arr[1], arr[2]);
        player:SayToPlayer("Received " .. tostring(arr[2]) .. " " .. arr[1] .. " points.");
    end

    if (rewards["scyld"] ~= nil) then
        player:addCurrency("scyld", rewards["scyld"]);
        player:SayToPlayer("Received " .. tostring(rewards["scyld"]) .. " scylds.");
    end

    if (rewards["jetton"] ~= nil) then
        player:addCurrency("jetton", rewards["jetton"]);
        player:SayToPlayer("Received " .. tostring(rewards["jetton"]) .. " jettons.");
    end

    if (rewards["spark"] ~= nil) then
        player:addCurrency("spark_of_eminence", rewards["spark"]);
        player:SayToPlayer("Received " .. tostring(rewards["spark"]) .. " sparks of eminence.");
    end

end




local augRes = {AUGMENT_WINDRES, AUGMENT_EARTHRES, AUGMENT_FIRERES, AUGMENT_WATERRES, AUGMENT_THUNDERRES, AUGMENT_ICERES, AUGMENT_LIGHTRES, AUGMENT_DARKRES}
local augResNeg = {AUGMENT_WINDRESNEG, AUGMENT_EARTHRESNEG, AUGMENT_FIRERESNEG, AUGMENT_WATERRESNEG, AUGMENT_THUNDERRESNEG, AUGMENT_ICERESNEG, AUGMENT_LIGHTRESNEG, AUGMENT_DARKRESNEG }
local augStats = {AUGMENT_STAT_STR, AUGMENT_STAT_VIT, AUGMENT_STAT_CHR, AUGMENT_STAT_AGI, AUGMENT_STAT_DEX, AUGMENT_STAT_MND, AUGMENT_STAT_INT};
local augStatsNeg = {AUGMENT_STAT_STRNEG, AUGMENT_STAT_VITNEG, AUGMENT_STAT_CHRNEG, AUGMENT_STAT_AGINEG, AUGMENT_STAT_DEXNEG, AUGMENT_STAT_MNDNEG, AUGMENT_STAT_INT};
local augStatus = {AUGMENT_RESIST_BLIND, AUGMENT_RESIST_CURSE, AUGMENT_RESIST_PARALYZE, AUGMENT_RESIST_PETRIFY, AUGMENT_RESIST_POISON, AUGMENT_RESIST_SILENCE, AUGMENT_RESIST_SLEEP, AUGMENT_RESIST_BLIND, AUGMENT_RESIST_SLOW, AUGMENT_RESIST_VIRUS, AUGMENT_RESIST_CHARM};
local augMeleeSkills = {AUGMENT_SKILL_AME,  AUGMENT_SKILL_AXE, AUGMENT_SKILL_CLUB, AUGMENT_SKILL_DAGGER, AUGMENT_SKILL_GREATAXE, AUGMENT_SKILL_GREATKATANA, AUGMENT_SKILL_GREATSWORD, AUGMENT_SKILL_H2H, AUGMENT_SKILL_POLEARM, AUGMENT_SKILL_SCYTHE, AUGMENT_SKILL_STAFF, AUGMENT_SKILL_SWORD, AUGMENT_SKILL_KATANA};
local augRangeSkills = {AUGMENT_SKILL_ARA, AUGMENT_SKILL_ARCHERY, AUGMENT_SKILL_MARKSMANSHIP, AUGMENT_SKILL_THROWING};
local augMagicSkills = {AUGMENT_SKILL_AMA, AUGMENT_SKILL_DARK, AUGMENT_SKILL_DIVINE, AUGMENT_SKILL_HEALING, AUGMENT_SKILL_ELEMENTAL, AUGMENT_SKILL_ENFEEBLE, AUGMENT_SKILL_ENHANCE, AUGMENT_SKILL_SUMMONING, AUGMENT_SKILL_SINGING, AUGMENT_SKILL_NINJITSU, AUGMENT_SKILL_BLUE};
local augDefenseSkills = {AUGMENT_SKILL_SHIELD};

local augEleAcc = {AUGMENT_FIREACC , AUGMENT_ICEACC , AUGMENT_WINDACC , AUGMENT_EARTHACC , AUGMENT_THUNDERACC , AUGMENT_WATERACC , AUGMENT_LIGHTACC , AUGMENT_DARKACC};
local augEleAtt = {AUGMENT_FIREATT , AUGMENT_ICEATT , AUGMENT_WINDATT , AUGMENT_EARTHATT , AUGMENT_THUNDERATT , AUGMENT_WATERATT , AUGMENT_LIGHTATT , AUGMENT_DARKATT};

local augWeaponskillH2H = {AUGMENT_WS_BACKHAND, AUGMENT_WS_SPINNINGATTACK, AUGMENT_WS_HOWLING, AUGMENT_WS_DRAGONKICK};
local augWeaponskillDagger = {AUGMENT_WS_VIPERBITE, AUGMENT_WS_SHADOWSTITCH, AUGMENT_WS_CYCLONE, AUGMENT_WS_EVISCERATION};
local augWeaponskillSword = {AUGMENT_WS_BURNINGBLADE, AUGMENT_WS_SHININGBLADE, AUGMENT_WS_CIRCLEBLADE, AUGMENT_WS_SAVAGEBLADE};
local augWeaponskillGreatsword = {AUGMENT_WS_FREEZEBITE, AUGMENT_WS_SHOCKWAVE, AUGMENT_WS_GROUNDSTRIKE, AUGMENT_WS_SICKLEMOON};
local augWeaponskillAxe = {AUGMENT_WS_GALEAXE, AUGMENT_WS_SPINNINGAXE, AUGMENT_WS_CALAMITY, AUGMENT_WS_DECIMATION};
local augWeaponskillGreataxe = {AUGMENT_WS_IRONTEMPEST, AUGMENT_WS_STURMWIND, AUGMENT_WS_KEENEDGE, AUGMENT_WS_STEELCYCLONE};
local augWeaponskillScythe = {AUGMENT_WS_NIGHTMARESCYTHE, AUGMENT_WS_SPINNINGSCYTHE, AUGMENT_WS_VORPALSCYTHE, AUGMENT_WS_SPIRALHELL};
local augWeaponskillPolearm = {AUGMENT_WS_LEGSWEEP, AUGMENT_WS_VORPALTHRUST, AUGMENT_WS_SKEWER, AUGMENT_WS_IMPULSEDRIVE};
local augWeaponskillKatana = {AUGMENT_WS_BLADETO, AUGMENT_WS_BLADECHI, AUGMENT_WS_BLADETEN, AUGMENT_WS_BLADEKU};
local augWeaponskillGreatKatana = {AUGMENT_WS_TACHIGOTEN, AUGMENT_WS_TACHIJINPU, AUGMENT_WS_TACHIKOKI, AUGMENT_WS_TACHIKASHA};
local augWeaponskillClub = {AUGMENT_WS_BRAINSHAKER, AUGMENT_WS_SKULLBREAKER, AUGMENT_WS_JUDGMENT, AUGMENT_WS_BLACKHALO};
local augWeaponskillStaff = {AUGMENT_WS_ROCKCRUSHER, AUGMENT_WS_SHELLCRUSHER, AUGMENT_WS_FULLSWING, AUGMENT_WS_RETRIBUTION};
local augWeaponskillArchery = {AUGMENT_WS_DULLINGARROW, AUGMENT_WS_BLASTARROW, AUGMENT_WS_ACHINGARROW, AUGMENT_WS_EMPYREALARROW};
local augWeaponskillMarksmanship = {AUGMENT_WS_HOTSHOT, AUGMENT_WS_SPLITSHOT, AUGMENT_WS_SNIPERSHOT, AUGMENT_WS_DETONATOR};

local augPetStat = {AUGMENT_PET_STR, AUGMENT_PET_DEX, AUGMENT_PET_VIT, AUGMENT_PET_AGI, AUGMENT_PET_INT, AUGMENT_PET_MND, AUGMENT_PET_CHR};

local petAugments = {
    {AUGMENT_PET_ACC,           {1, 3},     1, 20, false, 0.0},
    {AUGMENT_PET_ATK,           {1, 3},     1, 20, true, 0.04},
    {AUGMENT_PET_DEF,           {2, 4},     1, 20, true, 0.05},
    {AUGMENT_PET_DBLATK,        {1, 2},     45, 10, false, 0.00},
    {AUGMENT_PET_DBLATKCRIT,    {1, 2},     70, 5, false, 0.00},
    {AUGMENT_PET_ENMITY,        {1, 3},     1, 8, false, 0.00},
    {AUGMENT_PET_ENMITYNEG,     {1, 3},     1, 8, false, 0.00},
    {AUGMENT_PET_CRIT,          {2, 4},     1, 5, false, 0.00},
    {AUGMENT_PET_EVA,           {2, 5},     1, 8, false, 0.00},
    {AUGMENT_PET_MAGACCATK,     {1, 4},     1, 6, false, 0.00},
    {AUGMENT_PET_MDEF,          {3, 6},     1, 12, false, 0.00},
    {AUGMENT_PET_MEVA,          {3, 5},    1, 8, false, 0.00},
    {AUGMENT_PET_REGEN,         {1, 2},     20, 5, true, 0.1},
    {AUGMENT_PET_STORETP,       {2, 5},     30, 5, false, 0.00},
    {AUGMENT_PET_UDMG,          {1, 2},     50, 5, false, 0.00},
    {AUGMENT_PET_SUBTLEBLOW,    {4, 8},    1, 15, false, 0.00},
    {AUGMENT_PET_TPBONUS,       {1, 3},     50, 8, false, 0.00},
    {AUGMENT_PET_HASTE,         {1, 2},     70, 5, false, 0.00},
    {augPetStat,                {2, 4},     1, 40, true, 0.15},
};


local negativeAugments = {
    {AUGMENT_MPNEG,             {3, 10},    1, 10, true, 0.02},
    {AUGMENT_HPNEG,             {5, 20},    1, 10, true, 0.02},
    {AUGMENT_SLOW,              {1, 3},     1, 4, false, 0.02},
    {augStatsNeg,               {2, 5},     1, 25, true, 0.1},
    {AUGMENT_ALLRESNEG,         {4, 7},     1, 4, false, 0.0},
    {AUGMENT_ACCNEG,            {3, 8},    1, 4, false, 0.0},
    {AUGMENT_MACCNEG,           {3, 8},    1, 3, false, 0.0},
    {AUGMENT_EVANEG,           {3, 8},     1, 4, false, 0.0},
    {AUGMENT_DEFNEG,           {3, 5},      1, 8, true, 0.15},
    {AUGMENT_ATKNEG,           {2, 4},      1, 8, true, 0.1},
    {AUGMENT_MEVANEG,          {3, 10},     1, 4, true, 0.1},
}


local jewelryAugments = {
    {AUGMENT_STATUSRES,         {2, 3},     1, 4, false, 0.15},
    {AUGMENT_ENMITY,            {1, 2},     1, 5, false, 0.0},
    {AUGMENT_ENMITYNEG,         {1, 2},     1, 5, false, 0.0},
    {AUGMENT_MAGCRIT,           {1, 2},     55, 5, false, 0.0},
    {AUGMENT_MACC,              {1, 2},     30, 10, false, 0.0},
    {AUGMENT_MAGICBURST_DMG,    {3, 6},    15, 5, false, 0.0},
    {AUGMENT_SPELLINTERRUPT,    {8, 15},   1,  1, false, 0.0},
    {AUGMENT_SKILLCHAIN_DAM,    {3, 6},    15, 5, false, 0.0},
    {AUGMENT_HPNEGMP,           {5, 8},     30, 5, true, 0.15},
    {AUGMENT_BLOOD_BOON,        {1, 2},     50, 3, false, 0.0},
    {AUGMENT_CURESPELLTIME,     {4, 7},    50, 1, false, 0.0},
    {AUGMENT_CONSERVEMP,        {1, 2},     50, 5, false, 0.0},
    {AUGMENT_CONSERVETP,        {1, 2},     50, 5, false, 0.0},
    {AUGMENT_STORESUBTLE,       {0, 2},     65, 5, false, 0.0},
    {AUGMENT_CUREPOTENCY,       {1, 3},     35, 5, false, 0.0},
    {AUGMENT_CURERCVD,          {2, 4},     30, 8, false, 0.0},
    {AUGMENT_DBLATK,            {0, 1},     40, 3, false, 0.0},
    {AUGMENT_TRPLATTACK,        {0, 1},     60, 2, false, 0.0},
    {AUGMENT_FASTCAST,          {0, 2},     65, 3, false, 0.0},
    {AUGMENT_ZANSHIN,           {2, 3},     35, 5, false, 0.0},
    {AUGMENT_SUBTLEBLOW,        {1, 3},     1,  3, false, 0.0},
    {AUGMENT_QUADATK,           {0, 1},     75, 1, false, 0.0},
    {AUGMENT_WALTZPOTENCY,      {1, 3},     35, 3, false, 0.0},
    {AUGMENT_MATK,              {0, 2},     40, 5, false, 0.0},
    {AUGMENT_MDEF,              {1, 3},     40, 5, false, 0.0},
    {AUGMENT_MEVA,              {1, 4},     50, 5, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {2, 6},    1, 3, false, 0.0},
    {AUGMENT_WSKILL_DAM,        {1, 3},     60, 3, false, 0.0},
    {AUGMENT_DBLATKCRIT,        {0, 0},     75, 1, false, 0.0},
    {AUGMENT_SHIELDMASTERY,     {4, 7},   45, 3, false, 0.0},
    {AUGMENT_RAPIDSHOT,         {0, 2},     35, 2, false, 0.0},
    {AUGMENT_SNAPSHOT,          {0, 2},     35, 2, false, 0.0},
    {AUGMENT_HASTE,             {0, 0},     70, 2, false, 0.0},
    {AUGMENT_REGEN,             {0, 1},     25, 5, true, 0.05},
    {onePosStats,               {3, 5},     20, 4, true, 0.075},
    {augStats,                  {0, 2},     1, 25, true, 0.05},
    {statCombos,                {0, 1},     40, 5, true, 0.04},
    {augMagicSkills,            {0, 1},     1, 5, true, 0.025},
    {augMeleeSkills,            {0, 1},     1, 5, true, 0.025},
    {augRangeSkills,            {0, 1},     1, 5, true, 0.025},
    {augEleAcc,                 {1, 4},     1, 5, false, 0.0},
    {augEleAtt,                 {0, 3},     1, 5, false, 0.0},
    {augRes,                    {4, 20},    1, 20, false, 0.0},
    {augStatus,                 {4, 7},     1, 20, false, 0.0},
}

local neckAugments = {
    {AUGMENT_ACCRNGACC,         {0, 2},     30, 4, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 1},     1, 2, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {3, 10},    1, 4, false, 0.0},
    {AUGMENT_MACCMATK,          {0, 2},     70, 1, false, 0.0},
    {AUGMENT_ATKRATK,           {1, 2},     1, 2, true, 0.05},
    {AUGMENT_KICKATTACKS,       {2, 3},     50, 1, false, 0.0},
    {AUGMENT_HP,                {2, 5},    1, 15, true, 0.2},
    {AUGMENT_DEF,               {0, 2},     1, 8, true, 0.08},
    {AUGMENT_HPMP,              {1, 2},     30, 5, true, 0.1},
    {AUGMENT_EVA,               {0, 2},     1, 10, false, 0.0},
    {AUGMENT_TPBONUS,            {0, 2},    60, 4, false, 0.0},
    {AUGMENT_COUNTER,           {0, 2},     50, 3, false, 0.0},
};



local bodyAugment = {
    {AUGMENT_ENMITY,            {0, 2},     20, 3, false, 0.0},
    {AUGMENT_ENMITYNEG,         {0, 2},     20, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 1},     1, 2, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {5, 10},    1, 2, false, 0.0},
    {AUGMENT_ATKRATK,           {0, 2},     1, 2, true, 0.08},
    {AUGMENT_SNAPSHOT,          {0, 2},     35, 5, false, 0.0},
    {AUGMENT_RAPID_SHOT,         {0, 2},    35, 5, false, 0.0},
    {AUGMENT_HP,                {2, 5},    1, 15, true, 0.3},
    {AUGMENT_MPNEGHP,           {3, 10},    30, 8, true, 0.3},
    {AUGMENT_HPMP,              {1, 4},     50, 3, true, 0.2},
    {AUGMENT_DEF,               {0, 2},     1, 15, true, 0.15},
    {AUGMENT_EVA,               {1, 2},     1, 10, false, 0.0},
    {AUGMENT_MATK,              {0, 2},     45, 8, false, 0.0},
    {AUGMENT_MACCMATK,          {0, 2},     70, 8, false, 0.0},
    {AUGMENT_UDMGPHYS,          {1, 3},     1, 3, false, 0.0},
    {AUGMENT_MAGCRIT,           {1, 3},     50, 4, false, 0.0},
    {AUGMENT_MDEF,              {2, 4},     30, 5, false, 0.0},
    {AUGMENT_REGEN,             {0, 1},     25, 5, true, 0.1},
    {AUGMENT_MEVA,              {2, 5},     50, 5, false, 0.0},
    {AUGMENT_COUNTER,           {0, 2},     50, 5, false, 0.0},
    {AUGMENT_HASTE,             {0, 1},     70, 3, false, 0.0},
    {AUGMENT_SUBTLEBLOW,        {2, 4},     1, 5, false, 0.0},
    {AUGMENT_CURERCVD,          {2, 4},     1, 5, false, 0.0},
    {AUGMENT_STORETP,           {0, 2},     65, 5, false, 0.0},
    {AUGMENT_STAT_VIT,          {1, 3},     1, 5, true, 0.05},
    {AUGMENT_STATUSRES,         {2, 4},     1, 5, false, 0.0},
    {augRes,                    {4, 20},    1, 10, false, 0.0},
    {augStatus,                 {5, 8},     1, 10, false, 0.0},
};

local legAugment = {
    {AUGMENT_ENMITY,            {0, 2},     20, 3, false, 0.0},
    {AUGMENT_ENMITYNEG,         {0, 2},     20, 3, false, 0.0},
    {AUGMENT_ATKRATK,           {0, 1},     35, 2, true, 0.05},
    {AUGMENT_HP,                {1, 3},    1, 10, true, 0.2},
    {AUGMENT_MP,                {0, 3},     1, 10, true, 0.10},
    {AUGMENT_DEF,               {0, 1},     1, 15, true, 0.10},
    {AUGMENT_HPMP,              {2, 3},     30, 4, true, 0.08},
    {AUGMENT_EVA,               {0, 1},     1, 5, false, 0.0},
    {AUGMENT_MATK,              {0, 1},     45, 8, false, 0.0},
    {AUGMENT_MACCMATK,          {0, 1},     70, 8, false, 0.0},
    {AUGMENT_UDMGPHYS,          {0, 2},     1, 3, false, 0.0},
    {AUGMENT_MAGCRIT,           {0, 3},     50, 4, false, 0.0},
    {AUGMENT_MDEF,              {1, 3},     30, 5, false, 0.0},
    {AUGMENT_REGEN,             {0, 0},     25, 5, true, 0.075},
    {AUGMENT_MEVA,              {1, 3},     50, 5, false, 0.0},
    {AUGMENT_HASTE,             {0, 0},     70, 3, false, 0.0},
    {AUGMENT_CURERCVD,          {1, 3},     1, 5, false, 0.0},
    {AUGMENT_SUBTLEBLOW,        {1, 3},     35, 5, false, 0.0},
    {AUGMENT_STORETP,           {0, 2},     65, 5, false, 0.0},
    {AUGMENT_STAT_AGI,          {0, 2},     1, 3, true, 0.05},
    {AUGMENT_STAT_VIT,          {0, 2},     1, 3, true, 0.05},
    {augRes,                    {4, 20},    1, 10, false, 0.0},
    {augStatus,                 {5, 8},     1, 10, false, 0.0},
};

local feetAugment = {
    {AUGMENT_HP,                {1, 3},    1, 8, true, 0.2},
    {AUGMENT_MP,                {1, 3},     1, 8, true, 0.10},
    {AUGMENT_DEF,               {0, 1},     1, 10, true, 0.075},
    {AUGMENT_HPMP,              {2, 3},     30, 4, true, 0.07},
    {AUGMENT_EVA,               {0, 2},     1, 10, false, 0.0},
    {AUGMENT_MAGCRIT,           {0, 1},     50, 4, false, 0.0},
    {AUGMENT_MDEF,              {0, 2},     30, 5, false, 0.0},
    {AUGMENT_REGEN,             {0, 0},     25, 5, true, 0.05},
    {AUGMENT_MEVA,              {2, 4},     20, 5, false, 0.0},
    {AUGMENT_HASTE,             {0, 0},     50, 2, false, 0.0},
    {AUGMENT_STORETP,           {0, 2},     65, 5, false, 0.0},
    {AUGMENT_KICKATTACKS,       {1, 3},     45, 3, false, 0.0},
    {AUGMENT_WALTZ_TPCOST,      {15, 20},   55, 3, false, 0.0},
    {AUGMENT_WALTZPOTENCY,      {2, 4},     30, 3, false, 0.0},
    {AUGMENT_STAT_AGI,          {0, 2},     1, 5, true, 0.05},
    {augRes,                    {4, 20},    1, 10, false, 0.0},
    {augStatus,                 {5, 8},     1, 10, false, 0.0},
};

local handAugment = {
    {AUGMENT_HP,                {1, 3},    1, 10, true, 0.2},
    {AUGMENT_MP,                {1, 3},     1, 10, true, 0.10},
    {AUGMENT_ATKRATK,           {0, 1},     35, 8, true, 0.08},
    {AUGMENT_CRITRATE,          {0, 1},     1, 2, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {5, 10},    1, 2, false, 0.0},
    {AUGMENT_DBLATK,           {0, 1},      35, 2, false, 0.0},
    {AUGMENT_TRPLATTACK,       {0, 0},      60, 2, false, 0.0},
    {AUGMENT_HPMP,              {2, 3},     30, 5, true, 0.07},
    {AUGMENT_ACCRNGACC,         {0, 2},     30, 6, false, 0.0},
    {AUGMENT_MAGCRIT,           {0, 2},     20, 4, false, 0.0},
    {AUGMENT_DBLATKCRIT,        {0, 0},     70, 3, false, 0.0},
    {AUGMENT_QUADATK,           {0, 0},     70, 3, false, 0.0},
    {AUGMENT_SKILLCHAIN_DAM,    {4, 9},     1, 2, false, 0.0},
    {AUGMENT_MAGICBURST_DMG,    {4, 9},     1, 2, false, 0.0},
    {AUGMENT_MACCMATK,          {0, 1},     70, 2, false, 0.0},
    {AUGMENT_SUBTLEBLOW,        {2, 4},     1, 8, false, 0.0},
    {AUGMENT_TPBONUS,           {0, 1},     60, 8, false, 0.0},
    {AUGMENT_STORETP,           {0, 2},     1, 5, false, 0.0},
    {AUGMENT_RAPIDSHOT,         {0, 2},     35, 5, false, 0.0},
    {AUGMENT_SNAPSHOT,          {0, 2},     35, 5, false, 0.0},
    {AUGMENT_STAT_STR,          {0, 2},     1, 5, true, 0.05},
    {AUGMENT_STAT_DEX,          {0, 2},     1, 5, true, 0.05},
    {AUGMENT_STAT_STR_DEX,      {0, 1},     50, 5, true, 0.04},
    {augRes,                    {4, 20},    1, 10, false, 0.0},
    {augStatus,                 {5, 8},     1, 10, false, 0.0},
    {augMeleeSkills,            {0, 1},     1, 4, true, 0.035},
    {augRangeSkills,            {0, 1},     1, 4, true, 0.035},
};

local headAugment = {
    {AUGMENT_HP,                {1, 3},    1, 10, true, 0.2},
    {AUGMENT_MP,                {1, 3},     1, 10, true, 0.2},
    {AUGMENT_HPMP,              {1, 2},     30, 5, true, 0.07},
    {AUGMENT_MAGCRIT,           {0, 2},     50, 4, false, 0.0},
    {AUGMENT_ACCRNGACC,         {0, 2},     30, 3, false, 0.0},
    {AUGMENT_MACC,              {0, 2},     30, 4, false, 0.0},
    {AUGMENT_MDEF,              {1, 3},     1, 4, false, 0.0},
    {AUGMENT_MACCMATK,          {0, 1},     70, 2, false, 0.0},
    {AUGMENT_CONSERVEMP,        {2, 4},     30, 3, false, 0.0},
    {AUGMENT_CONSERVETP,        {2, 4},     30, 3, false, 0.0},
    {AUGMENT_RAPIDSHOT,         {0, 2},     35, 4, false, 0.0},
    {AUGMENT_SKILLCHAIN_DAM,    {5, 8},     1, 2, false, 0.0},
    {AUGMENT_MAGICBURST_DMG,    {5, 8},     1, 2, false, 0.0},
    {AUGMENT_SNAPSHOT,          {0, 2},     35, 5, false, 0.0},
    {AUGMENT_STAT_INT,          {0, 1},     1, 3, true, 0.05},
    {AUGMENT_STAT_MND,          {0, 1},     1, 3, true, 0.05},
    {AUGMENT_STAT_CHR,          {0, 1},     1, 3, true, 0.05},
    {AUGMENT_STAT_INT_MND_CHR,  {0, 1},     60, 5, true, 0.04},
    {augRes,                    {4, 20},    1, 10, false, 0.0},
    {augStatus,                 {5, 8},     1, 10, false, 0.0},
    {augMagicSkills,            {0, 1},     1, 4, true, 0.035},
    {augRangeSkills,            {0, 1},     1, 4, true, 0.035},
};

local backAugment = {
    {AUGMENT_MP,                {2, 4},     1, 10, true, 0.10},
    {AUGMENT_HPNEGMP,           {3, 6},     30, 4, true, 0.3},
    {AUGMENT_MAGCRIT,           {0, 1},     50, 4, false, 0.0},
    {AUGMENT_MDEF,              {1, 3},     1, 4, false, 0.0},
    {AUGMENT_DEF,               {0, 1},     1, 6, true, 0.075},
    {AUGMENT_EVA,               {0, 1},     1, 3, false, 0.0},
    {AUGMENT_MEVA,              {2, 4},     1, 4, false, 0.0},
    {AUGMENT_HASTE,             {0, 0},     70, 3, false, 0.0},
    {AUGMENT_CUREPOTENCY,       {1, 3},     50, 4, false, 0.0},
    {AUGMENT_CURERCVD,          {2, 4},     1, 4, false, 0.0},
    {AUGMENT_REGEN,             {0, 0},     45, 3, true, 0.05},
    {AUGMENT_STAT_INT,          {0, 2},     1, 3, true, 0.05},
    {AUGMENT_STAT_MND,          {0, 2},     1, 3, true, 0.05},
    {AUGMENT_STAT_CHR,          {0, 2},     1, 3, true, 0.05},
    {AUGMENT_STAT_INT_MND_CHR,  {0, 2},     60, 3, true, 0.04},
    {augRes,                    {4, 20},    1, 10, false, 0.0},
    {augStatus,                 {5, 8},     1, 10, false, 0.0},
    {augMagicSkills,            {0, 1},     1, 4, true, 0.035},
};

local waistAugment = {
    {AUGMENT_MPNEGHP,           {2, 4},     1, 10, true, 0.2},
    {AUGMENT_MAGCRIT,           {0, 1},     50, 4, false, 0.0},
    {AUGMENT_DEF,               {0, 1},     1, 10, true, 0.075},
    {AUGMENT_HASTE,             {0, 0},     70, 2, false, 0.0},
    {AUGMENT_CURERCVD,          {2, 4},     1, 4, false, 0.0},
    {AUGMENT_REGEN,             {0, 1},     45, 3, true, 0.05},
    {AUGMENT_STORETP,           {0, 2},     1, 4, false, 0.0},
    {AUGMENT_STAT_VIT,          {0, 2},     1, 5, true, 0.05},
    {AUGMENT_STAT_STR_VIT,      {0, 2},     40, 3, true, 0.05},
    {augRes,                    {4, 20},    1, 10, false, 0.0},
    {augStatus,                 {5, 8},     1, 10, false, 0.0},
    {augMeleeSkills,            {1, 2},     1, 3, true, 0.03},
};

local swordAugments = {
    {AUGMENT_DEF,               {0, 2},     1, 5, true, 0.075},
    {AUGMENT_HP,                {3, 5},     1, 5, true, 0.2},
    {AUGMENT_CURERCVD,          {3, 5},     1, 5, false, 0.0},
    {AUGMENT_CUREPOTENCY,       {2, 4},     30, 3, false, 0.0},
    {AUGMENT_STORETP,           {1, 3},     1, 5, false, 0.0},
    {AUGMENT_DBLATK,            {0, 1},     25, 2, false, 0.0},
    {AUGMENT_DBLATKCRIT,        {0, 1},     70, 2, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 1},     1, 2, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {5, 10},    1, 2, false, 0.0},
    {AUGMENT_STORESUBTLE,       {0, 2},     70, 3, false, 0.0},
    {AUGMENT_STAT_STR_VIT,      {0, 2},     1, 5, true, 0.05},
    {AUGMENT_HASTE,             {1, 2},     55, 3, false, 0.0},
    {AUGMENT_ATK,               {0, 2},     1, 8, true, 0.1},
    {AUGMENT_MDEF,              {1, 3},     1, 4, false, 0.0},
    {AUGMENT_ACCRNGACC,         {0, 2},     1, 8, false, 0.0},
    {AUGMENT_MACCMATK,          {2, 5},     40, 2, false, 0.00},
    {AUGMENT_FIREATT,           {8, 14},   40, 2, false, 0.00},
    {AUGMENT_LIGHTATT,          {10, 20},   20, 2, false, 0.00},
    {AUGMENT_SKILL_SWORD,       {0, 3},     1, 5, true, 0.035},
    {AUGMENT_SKILL_SHIELD,      {2, 4},     20, 5, true, 0.05},
    {augWeaponskillSword,       {0, 2},     1, 6, false, 0.0},
};

local greatswordAugments = {
    {AUGMENT_DEF,               {1, 3},     1, 5, true, 0.15},
    {AUGMENT_HPMP,              {3, 5},     1, 3, true, 0.1},
    {AUGMENT_STORETP,           {0, 4},    1, 5, false, 0.0},
    {AUGMENT_DBLATK,            {0, 1},     25, 2, false, 0.0},
    {AUGMENT_DBLATKCRIT,        {2, 4},     70, 2, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 2},     1, 2, false, 0.0},
    {AUGMENT_STAT_STR_INT,      {1, 3},     1, 5, true, 0.065},
    {AUGMENT_HASTE,             {2, 4},     55, 3, false, 0.0},
    {AUGMENT_ATK,               {2, 5},     1, 8, true, 0.15},
    {AUGMENT_MEVA,              {5, 12},     1, 8, true, 0.070},
    {AUGMENT_REGEN,             {2, 5},     35, 3, true, 0.08},
    {AUGMENT_MDEF,              {2, 5},     1, 4, false, 0.00},
    {AUGMENT_MACCMATK,          {5, 8},     1, 2, false, 0.00},
    {AUGMENT_ICEATT,            {12, 18},   30, 3, false, 0.00},
    {AUGMENT_SKILL_GREATSWORD,  {1, 4},     1, 4, true, 0.045},
    {augWeaponskillGreatSword,  {0, 2},     1, 6, false, 0.0},
};

local staffAugments = {
    {AUGMENT_DEF,               {1, 3},     1, 5, true, 0.2},
    {AUGMENT_HPMP,              {3, 5},     1, 3, true, 0.1},
    {AUGMENT_STORETP,           {3, 5},    1, 5, false, 0.0},
    {AUGMENT_STAT_INT_MND_CHR,  {0, 1},     1, 5, true, 0.065},
    {AUGMENT_HASTE,             {3, 6},     55, 3, false, 0.0},
    {AUGMENT_ATK,               {4, 8},     1, 8, true, 0.20},
    {AUGMENT_REGEN,             {2, 5},     35, 3, true, 0.1},
    {AUGMENT_MDEF,              {5, 11},     1, 4, false, 0.00},
    {AUGMENT_ENMITYNEG,         {2, 5},     1, 4, false, 0.00},
    {AUGMENT_MATK,              {0, 2},     30, 2, false, 0.00},
    {AUGMENT_MACCMATK,          {0, 1},     70, 2, false, 0.00},
    {AUGMENT_ICEATT,            {5, 7},     30, 1, false, 0.00},
    {AUGMENT_FIREATT,           {5, 7},     30, 1, false, 0.00},
    {AUGMENT_THUNDERATT,        {5, 7},     30, 1, false, 0.00},
    {AUGMENT_EARTHATT,          {5, 7},     30, 1, false, 0.00},
    {AUGMENT_WINDATT,           {5, 7},     30, 1, false, 0.00},
    {AUGMENT_WATERATT,          {5, 7},     30, 1, false, 0.00},
    {AUGMENT_LIGHTATT,          {5, 7},     30, 1, false, 0.00},
    {AUGMENT_DARKATT,           {5, 7},     30, 1, false, 0.00},
    {AUGMENT_FASTCAST,          {2, 4},     70, 2, false, 0.00},
    {AUGMENT_SKILL_STAFF,       {3, 6},     1, 8, true, 0.05},
    {AUGMENT_SKILL_ELEMENTAL,   {1, 3},     50, 3, true, 0.035},
    {AUGMENT_SKILL_ENFEEBLE,    {1, 3},     50, 3, true, 0.035},
    {augWeaponskillStaff,  {1, 3},     1, 4, false, 0.0},
};

local clubAugment = {
    {AUGMENT_DEF,               {1, 3},     1, 5, true, 0.15},
    {AUGMENT_MP,                {3, 5},     1, 3, true, 0.2},
    {AUGMENT_STORETP,           {2, 5},     1, 5, false, 0.0},
    {AUGMENT_ACC,               {2, 4},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_MND,      {0, 2},     1, 5, true, 0.065},
    {AUGMENT_CUREPOTENCY,       {3, 5},     1, 2, false, 0},
    {AUGMENT_HASTE,             {2, 4},     55, 3, false, 0.0},
    {AUGMENT_ATK,               {3, 6},     1, 8, true, 0.15},
    {AUGMENT_MDEF,              {4, 8},     1, 4, false, 0.00},
    {AUGMENT_MACCMATK,          {3, 5},     70, 2, false, 0.00},
    {AUGMENT_LIGHTATT,          {6, 15},    1, 3, false, 0.00},
    {AUGMENT_FASTCAST,          {2, 4},     70, 2, false, 0.00},
    {AUGMENT_SKILL_CLUB,        {2, 4},     1, 8, true, 0.035},
    {AUGMENT_SKILL_SHIELD,      {2, 4},     20, 5, true, 0.05},
    {AUGMENT_SKILL_DIVINE,      {2, 5},     1, 3, true, 0.05},
    {augWeaponskillClub,  {1, 3},     1, 4, false, 0.0},
};

local axeAugment = {
    {AUGMENT_STORETP,           {0, 2},     1, 5, false, 0.0},
    {AUGMENT_ACC,               {0, 2},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_AGI,      {0, 1},     1, 5, true, 0.065},
    {AUGMENT_HASTE,             {0, 2},     55, 3, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_WSKILL_DAM,        {3, 5},    1, 3, false, 0.10},
    {AUGMENT_CRITRATE,          {0, 1},     1, 5, false, 0.0},
    {AUGMENT_CONSERVETP,        {3, 8},     1, 5, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {8, 12},   1, 2, false, 0.0},
    {AUGMENT_ATK,               {1, 3},     1, 8, true, 0.15},
    {AUGMENT_SKILL_AXE,        {0, 1},      1, 4, true, 0.035},
    {augWeaponskillAxe,  {0, 2},     1, 6, false, 0.0},
};

local daggerAugment = {
    {AUGMENT_STORETP,           {1, 3},     1, 5, false, 0.0},
    {AUGMENT_ACCRNGACC,         {0, 2},     1, 3, false, 0.0},
    {AUGMENT_STAT_DEX_AGI,      {0, 1},     1, 5, true, 0.065},
    {AUGMENT_HASTE,             {4, 6},     55, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 3},     1, 5, false, 0.0},
    {AUGMENT_CONSERVETP,        {5, 10},    30, 5, false, 0.0},
    {AUGMENT_SUBTLEBLOW,        {3, 5},     1, 3, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_EVA,               {1, 2},     1, 3, false, 0.0},
    {AUGMENT_QUADATK,           {0, 1},     70, 2, false, 0.0},
    {AUGMENT_CONSERVEMP,        {4, 10},     30, 5, false, 0.0},
    {AUGMENT_ZANSHIN,           {3, 8},     30, 2, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {5, 12},    1, 3, false, 0.0},
    {AUGMENT_MAGCRIT,           {3, 6},     40, 8, false, 0.10},
    {AUGMENT_ATK,               {1, 3},     1, 8, true, 0.10},
    {AUGMENT_WINDATT,          {4, 9},    30, 3, false, 0.00},
    {AUGMENT_MACCMATK,          {5, 10},    55, 2, false, 0.00},
    {AUGMENT_SKILL_DAGGER,      {0, 1},     1, 4, true, 0.035},
    {augWeaponskillDagger,      {0, 2},     1, 6, false, 0.0},
};

local greataxeAugment = {
    {AUGMENT_STORETP,           {1, 5},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR,          {1, 3},     1, 5, true, 0.08},
    {AUGMENT_HASTE,             {1, 2},     55, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 2},     1, 5, false, 0.0},
    {AUGMENT_CONSERVETP,        {6, 10},    30, 5, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_WSKILL_DAM,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_DBLATK,            {0, 2},     70, 3, false, 0.0},
    {AUGMENT_ZANSHIN,           {3, 8},     30, 2, false, 0.0},
    {AUGMENT_COUNTER,           {3, 5},     1, 3, false, 0.0},
    {AUGMENT_SKILLCHAIN_DAM,    {8, 15},    30, 3, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {8, 15},    1, 2, false, 0.0},
    {AUGMENT_ATK,               {1, 4},     1, 8, true, 0.15},
    {AUGMENT_SKILL_GREATAXE,    {0, 2},     1, 4, true, 0.045},
    {augWeaponskillGreataxe,    {0, 2},     1, 6, false, 0.0},
};

local polearmAugment = {
    {AUGMENT_STORETP,           {1, 5},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_DEX,      {0, 2},     1, 5, true, 0.065},
    {AUGMENT_ACC,               {0, 3},     1, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 2},     1, 5, false, 0.0},
    {AUGMENT_HASTE,             {2, 4},     55, 3, false, 0.0},
    {AUGMENT_EVA,               {5, 10},     1, 3, false, 0.0},
    {AUGMENT_CONSERVETP,        {8, 12},    30, 5, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_WSKILL_DAM,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_DBLATK,            {0, 1},     70, 5, false, 0.0},
    {AUGMENT_SKILLCHAIN_DAM,    {10, 20},    30, 3, false, 0.0},
    {AUGMENT_THUNDERATT,        {12, 15},     30, 4, false, 0.10},
    {AUGMENT_ATK,               {2, 4},     1, 8, true, 0.15},
    {AUGMENT_SKILL_POLEARM,     {0, 1},     1, 4, true, 0.035},
    {augWeaponskillPolearm,    {0, 2},     1, 6, false, 0.0},
};

local greatkatanaAugment = {
    {AUGMENT_STORETP,           {0, 3},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_INT,      {1, 2},     1, 5, true, 0.065},
    {AUGMENT_ACC,               {0, 2},     1, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 1},     1, 3, false, 0.0},
    {AUGMENT_COUNTER,           {3, 5},     1, 3, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_HASTE,             {1, 3},     55, 3, false, 0.0},
    {AUGMENT_EVA,               {8, 12},     1, 3, false, 0.0},
    {AUGMENT_MEVA,              {8, 12},     1, 2, false, 0.0},
    {AUGMENT_CONSERVETP,        {8, 12},    30, 5, false, 0.0},
    {AUGMENT_DBLATK,            {0, 2},     70, 5, false, 0.0},
    {AUGMENT_SKILLCHAIN_DAM,    {5, 12},    1, 5, false, 0.0},
    {AUGMENT_ATK,               {2, 4},     1, 8, true, 0.15},
    {AUGMENT_SKILL_GREATKATANA,     {0, 1},     1, 4, true, 0.035},
    {augWeaponskillGreatKatana,    {0, 2},     1, 6, false, 0.0},
};

local scytheAugment = {
    {AUGMENT_STORETP,           {1, 3},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_INT,      {1, 3},     1, 5, true, 0.065},
    {AUGMENT_ACC,               {0, 3},     1, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 2},     1, 3, false, 0.0},
    {AUGMENT_HASTE,             {1, 2},     55, 3, false, 0.0},
    {AUGMENT_CONSERVETP,        {8, 12},    30, 5, false, 0.0},
    {AUGMENT_MAGICBURST_DMG,    {10, 15},    30, 3, false, 0.0},
    {AUGMENT_WSKILL_DAM,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_MAGICDAM,          {4, 6},    40, 2, false, 0.15},
    {AUGMENT_OCCULT_ACUMEN,    {8, 25},    30, 3, false, 0.0},
    {AUGMENT_MATK,             {5, 10},    50, 3, false, 0.0},
    {AUGMENT_ATK,               {2, 4},     1, 8, true, 0.20},
    {AUGMENT_DARKATT,        {12, 15},     30, 4, false, 0.10},
    {AUGMENT_SKILL_SCYTHE,     {0, 2},     1, 4, true, 0.045},
    {augWeaponskillScythe,    {0, 2},     1, 6, false, 0.0},
};

local h2hAugment = {
    {AUGMENT_STORETP,           {0, 3},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_AGI,      {0, 2},     1, 5, true, 0.065},
    {AUGMENT_ACC,               {0, 2},     1, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 1},     1, 3, false, 0.0},
    {AUGMENT_DBLATKCRIT,        {0, 1},     70, 3, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_WSKILL_DAM,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_SUBTLEBLOW,        {3, 5},     1, 3, false, 0.0},
    {AUGMENT_EVA,               {5, 10},     1, 3, false, 0.0},
    {AUGMENT_MEVA,              {5, 10},     1, 3, false, 0.0},
    {AUGMENT_HASTE,             {1, 3},     55, 3, false, 0.0},
    {AUGMENT_CONSERVETP,        {4, 8},     50, 5, false, 0.0},
    {AUGMENT_ATK,               {1, 3},     1, 8, true, 0.10},
    {AUGMENT_KICKATTACKS,       {2, 4},     35, 4, false, 0.10},
    {AUGMENT_SKILL_H2H,         {0, 2},     1, 4, true, 0.035},
    {augWeaponskillH2H,    {0, 2},     1, 6, false, 0.0},
};

local katanaAugment = {
    {AUGMENT_STORETP,           {1, 3},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_DEX,      {0, 2},     1, 5, true, 0.065},
    {AUGMENT_ACC,               {0, 2},     1, 3, false, 0.0},
    {AUGMENT_CRITRATE,          {0, 1},     1, 3, false, 0.0},
    {AUGMENT_SUBTLEBLOW,        {3, 5},     1, 3, false, 0.0},
    {AUGMENT_DBLATKCRIT,        {0, 1},     70, 3, false, 0.0},
    {AUGMENT_CRITDAMAGE,        {5, 10},     1, 3, false, 0.0},
    {AUGMENT_WSKILL_ACC,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_WSKILL_DAM,        {4, 8},    1, 3, false, 0.10},
    {AUGMENT_HASTE,             {1, 3},     55, 3, false, 0.0},
    {AUGMENT_CONSERVETP,        {4, 8},     50, 5, false, 0.0},
    {AUGMENT_ATK,               {1, 4},     1, 8, true, 0.10},
    {AUGMENT_MACCMATK,          {4, 6},     40, 8, false, 0.10},
    {AUGMENT_MAGICBURST_DMG,    {8, 12},     1, 8, false, 0.10},
    {AUGMENT_SKILL_KATANA,      {0, 1},     1, 4, true, 0.035},
    {AUGMENT_SKILL_NINJITSU,    {2, 4},     30, 4, true, 0.05},
    {augWeaponskillKatana,    {0, 2},     1, 6, false, 0.0},
};

local bowAugment = {
    {AUGMENT_STORETP,           {0, 2},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_AGI,      {0, 2},     1, 3, true, 0.04},
    {AUGMENT_RACC,              {2, 4},     1, 8, false, 0.0},
    {AUGMENT_HP,                {3, 5},     1, 4, true, 0.15},
    {AUGMENT_RATK,               {1, 4},    1, 8, true, 0.15},
    {AUGMENT_RAPIDSHOT,          {1, 3},    1, 5, false, 0.15},
    {AUGMENT_SNAPSHOT,           {1, 3},    1, 5, false, 0.10},
    {AUGMENT_RECYCLE,           {8, 12},    1, 5, false, 0.10},
    {AUGMENT_CONSERVETP,        {1, 3},     30, 5, false, 0.0},
    {AUGMENT_SKILL_ARCHERY,     {1, 2},     1, 4, true, 0.035},
};

local markAugment = {
    {AUGMENT_STORETP,           {0, 2},     1, 3, false, 0.0},
    {AUGMENT_STAT_AGI,         {0, 2},     1, 3, true, 0.05},
    {AUGMENT_RACC,              {2, 4},     1, 8, false, 0.0},
    {AUGMENT_HP,                {3, 5},     1, 4, true, 0.15},
    {AUGMENT_RATK,               {1, 4},    1, 8, true, 0.15},
    {AUGMENT_RAPIDSHOT,          {1, 3},    1, 5, false, 0.15},
    {AUGMENT_SNAPSHOT,           {1, 3},    1, 5, false, 0.10},
    {AUGMENT_RECYCLE,           {8, 12},    1, 5, false, 0.10},
    {AUGMENT_CONSERVETP,        {1, 3},     30, 5, false, 0.0},
    {AUGMENT_SKILL_MARKSMANSHIP,     {1, 2},     1, 4, true, 0.035},
};

local throwingAugment = {
    {AUGMENT_STORETP,           {0, 2},     1, 3, false, 0.0},
    {AUGMENT_STAT_DEX_AGI,      {1, 2},     1, 3, true, 0.04},
    {AUGMENT_RACC,              {8, 15},     1, 8, false, 0.0},
    {AUGMENT_HP,                {3, 5},     1, 4, true, 0.15},
    {AUGMENT_RATK,               {5, 15},    1, 8, true, 0.2},
    {AUGMENT_RAPIDSHOT,          {5, 10},    1, 5, false, 0.15},
    {AUGMENT_SNAPSHOT,           {5, 10},    1, 5, false, 0.10},
    {AUGMENT_CONSERVETP,        {1, 3},     30, 5, false, 0.0},
    {AUGMENT_SKILL_THROWING,     {3, 5},     1, 4, true, 0.05},
};

local animatorAugment = {
    {AUGMENT_STORETP,           {1, 3},     1, 3, false, 0.0},
    {AUGMENT_STAT_DEX_AGI,      {2, 3},     1, 3, true, 0.04},
    {AUGMENT_HP,                {3, 5},     1, 4, true, 0.15},
    {AUGMENT_EVA,               {5, 8},     1, 4, false, 0.15},
    {AUGMENT_DBLATKCRIT,        {1, 2},     70, 4, false, 0.15},
    {AUGMENT_HASTE,             {1, 2},     70, 4, false, 0.15},
    {AUGMENT_SKILL_AME,         {2, 4},     1, 4, true, 0.05},
    {AUGMENT_SKILL_ARA,         {2, 4},     1, 4, true, 0.05},
    {AUGMENT_SKILL_AMA,         {2, 4},     1, 4, true, 0.05},
    {augRes,                    {4, 20},    1, 4, false, 0.0},
    {augStatus,                 {5, 8},     1, 4, false, 0.0},
};

local instrumentAugment = {
    {AUGMENT_STORETP,           {4, 8},     1, 3, false, 0.0},
    {AUGMENT_CONSERVETP,        {8, 15},     1, 3, false, 0.0},
    {AUGMENT_STAT_STR_CHR,      {1, 3},     1, 3, true, 0.05},
    {AUGMENT_STAT_STR_DEX,      {1, 3},     1, 3, true, 0.05},
    {AUGMENT_HP,                {3, 5},     1, 4, true, 0.15},
    {AUGMENT_MEVA,              {10, 15},     1, 4, false, 0.15},
    {AUGMENT_DEF,               {3, 5},     1, 4, true, 0.15},
    {AUGMENT_ATK,               {3, 5},     1, 4, true, 0.15},
    {AUGMENT_SKILL_SINGING,     {0, 1},     1, 4, true, 0.025},
    {AUGMENT_SONGSPELLTIME,     {15, 20},   1, 3, false, 0.05},
    {augRes,                    {4, 20},    1, 4, false, 0.0},
    {augStatus,                 {5, 8},     1, 4, false, 0.0},
};

local shieldAugment = {
    {AUGMENT_STORETP,           {1, 4},     1, 2, false, 0.0},
    {AUGMENT_CONSERVETP,        {5, 8},     1, 2, false, 0.0},
    {AUGMENT_CONSERVEMP,        {5, 8},     1, 2, false, 0.0},
    {AUGMENT_STAT_STR_VIT,      {1, 3},     1, 3, true, 0.05},
    {AUGMENT_HPMP,              {2, 4},     1, 4, true, 0.15},
    {AUGMENT_MEVA,              {5, 8},     40, 4, false, 0.15},
    {AUGMENT_STATUSRES,         {3, 5},     1, 4, false, 0.15},
    {AUGMENT_ZANSHIN,           {5, 8},     1, 2, false, 0.15},
    {AUGMENT_MDEF,              {5, 8},     1, 4, false, 0.15},
    {AUGMENT_SKILL_SHIELD,      {2, 3},     1, 4, true, 0.05},
    {AUGMENT_DEF,               {1, 3},     1, 4, true, 0.10},
    {AUGMENT_ALLRES,            {4, 8},     60, 2, false, 0.0},
    {AUGMENT_ALLDARK,           {3, 12},    45, 2, false, 0.0},
    {AUGMENT_ALLLIGHT,          {3, 12},    45, 2, false, 0.0},
    {augRes,                    {4, 20},    1, 4, false, 0.0},
    {augStatus,                 {5, 8},     1, 4, false, 0.0},
};



local function join(T)
    local joinedTable = {}
    for i,v in pairs(T) do
        for i2,v2 in pairs(v) do
            table.insert(joinedTable, v2);
        end

    end
    return joinedTable;
end

local function createWeightedTable(T, itemlvl)
    local totalWeight = 0
    local newTable = {}
    local augments = {};

    -- First get total weight table
    for i, v in pairs(T) do
        if v[3] <= itemlvl then
            totalWeight = totalWeight + v[4];
            table.insert(newTable, {v, totalWeight});
        end
    end


    for pick = 1,3 do
        -- now randomly pick based on weighted roll
        local roll = math.random(1, totalWeight);
        for i, item in pairs(newTable) do
            if (roll <= item[2]) then
                totalWeight = 0;

                -- remove from table so we can do another pick
                table.insert(augments, item[1]);
                table.remove(newTable, i);

                -- recalculate weight
                for num,remaining in pairs(newTable) do
                    totalWeight = totalWeight + remaining[2];
                    remaining[2] = totalWeight;
                end
                break;

            end
        end
    end

    return augments;
end

local function getAugmentValue(augs, itemlvl)
    local finalAugs = {};
    for  num,aug in pairs(augs) do
        local scales = aug[5];
        local scaleRate = aug[6];
        local min = aug[2][1];
        local max = aug[2][2];
        if (scales == true) then
            min = math.floor(min + (itemlvl * scaleRate) / 2);
            max = math.floor(max + itemlvl * scaleRate);
        end

        local augment = aug[1];

        -- If this is a table, we need to randomly pick an augment from it to pair with the modifier we rolled
        if (type(augment) == "table") then
            local size = 0;
            for i,v in pairs(augment) do
                size = size + 1;
            end
            augment = augment[math.random(1, size)];
        end

        table.insert(finalAugs, {augment, math.random(min, max)});
    end
    return finalAugs;
end

function pickAugments(item)
    local negChance = math.random(0, 100);
    local petChance = math.random(0, 100);
    local thirdChance = math.random(0, 100);
    local augmentTable = {}
    local iLevel = item:getLevel();
    if (iLevel == 0) then return nil end;
    local slot = item:getSlotID();

    if      (slot == SLOT_NECK)                                     then augmentTable = join({neckAugments, jewelryAugments});
    elseif  (slot == SLOT_RING1 or slot == SLOT_RING2)              then augmentTable = join({jewelryAugments});
    elseif  (slot == SLOT_EAR1 or slot == slot_EAR2)                then augmentTable = join({jewelryAugments});
    elseif  (slot == SLOT_BACK)                                     then augmentTable = join({backAugment});
    elseif  (slot == SLOT_LEGS)                                     then augmentTable = join({legAugment});
    elseif  (slot == SLOT_HANDS)                                    then augmentTable = join({handAugment});
    elseif  (slot == SLOT_HEAD)                                     then augmentTable = join({headAugment});
    elseif  (slot == SLOT_FEET)                                     then augmentTable = join({feetAugment});
    elseif  (slot == SLOT_WAIST)                                    then augmentTable = join({waistAugment});
    elseif  (slot == SLOT_BODY)                                     then augmentTable = join({bodyAugment});
    elseif  (slot == SLOT_SUB and item:isType(ITEM_ARMOR))          then augmentTable = join({shieldAugment});
    else
        local skillType = item:getSkillType();
        if      (skillType == SKILL_ARC)                            then augmentTable = join({bowAugment});
        elseif  (skillType == SKILL_MRK)                            then augmentTable = join({markAugment});
        elseif  (skillType == SKILL_SWD)                            then augmentTable = join({swordAugments});
        elseif  (skillType == SKILL_GSD)                            then augmentTable = join({greatswordAugments});
        elseif  (skillType == SKILL_GKT)                            then augmentTable = join({greatkatanaAugment});
        elseif  (skillType == SKILL_GAX)                            then augmentTable = join({greataxeAugment});
        elseif  (skillType == SKILL_AXE)                            then augmentTable = join({axeAugment});
        elseif  (skillType == SKILL_DAG)                            then augmentTable = join({daggerAugment});
        elseif  (skillType == SKILL_CLB)                            then augmentTable = join({clubAugment});
        elseif  (skillType == SKILL_STF)                            then augmentTable = join({staffAugments});
        elseif  (skillType == SKILL_THR)                            then augmentTable = join({throwingAugment});
        elseif  (skillType == SKILL_KAT)                            then augmentTable = join({katanaAugment});
        elseif  (skillType == SKILL_H2H)                            then augmentTable = join({h2hAugment});
        elseif  (skillType == SKILL_POL)                            then augmentTable = join({polearmAugment});
        elseif  (skillType == SKILL_WND or skillType == SKILL_STR)  then augmentTable = join({instrumentAugment});
        end
    end

    if (augmentTable[1] == nil) then return nil end;

    -- Pick three augments (we may now use them all)
    local pickedAugments = getAugmentValue(createWeightedTable(augmentTable, iLevel), iLevel);

    -- Pick negative augments (we also may now use them)
    local negs = getAugmentValue(createWeightedTable(negativeAugments, iLevel), iLevel);

    local finalAugments = {pickedAugments[1][1], pickedAugments[1][2], pickedAugments[2][1], pickedAugments[2][2]};

    -- Either we don't pick a third augment, we pick a third augment, or we add a negative augment. We could also choose a pet aug.
--    table.insert(finalAugments, pickedAugments[3][1]);
--    table.insert(finalAugments, pickedAugments[3][2]);

    if (petChance < 15) then
        local petPick = getAugmentValue(createWeightedTable(petAugments, iLevel), iLevel);
        table.insert(finalAugments, petPick[1][1]);
        table.insert(finalAugments, petPick[1][2]);
        table.insert(finalAugments, negs[1][1]);
        table.insert(finalAugments, negs[1][2]);
    elseif(thirdChance < 25) then
        table.insert(finalAugments, pickedAugments[3][1]);
        table.insert(finalAugments, pickedAugments[3][2]);
        table.insert(finalAugments, negs[1][1]);
        table.insert(finalAugments, negs[1][2]);
    elseif(negChance < 45) then
        table.insert(finalAugments, 0);
        table.insert(finalAugments, 0);
        table.insert(finalAugments, negs[1][1]);
        table.insert(finalAugments, negs[1][2]);
    end


--    elseif (chance < 75) then
--        table.insert(finalAugments, negs[1][1]);
--        table.insert(finalAugments, negs[1][2]);
--    elseif (chance < 85) then
--        local petPick = getAugmentValue(createWeightedTable(petAugments, iLevel), iLevel);
--        table.insert(petPick, negs[1][1]);
--        table.insert(petPick, negs[1][2]);
--    end

    return finalAugments;
end

function testPick()
    local finalAugs = pickAugments(SLOT_NECK, 75);
        for i,v in pairs(finalAugs) do
            print(v);
        end
--    local combinedTable = {}
--    for i,v in pairs(neckAugments) do
--        table.insert(combinedTable, v);
--    end
--
--    for i,v in pairs(jewelryAugments) do
--        table.insert(combinedTable, v);
--    end
--
--
--    local pick = createWeightedTable(combinedTable, 75);
--    local finalAugment = getAugmentValue(pick, 75);

end


local function createNeckAugment(player, itemid)
    local chance = math.random(0, 100);

    for i, aug in pairs(neckAugments) do
    end

end

--    {AUGMENT_HPHEAL,            {2, 8},     5, true, 0.15},
--    {AUGMENT_MPHEAL,            {1, 3},     5, true, 0.05},

function tradeElite(player, npc, trade, tier, monsters)
    local count = trade:getItemCount();
    local beastSeals = trade:hasItemQty(1126, tier);
    local gil = trade:getGil();
    local thirdSlot = trade:getItem(2);

    -- normal mode
    if (count == 1 + tier and beastSeals == true and gil == tier * 300) then
        npc:setLocalVar("trader", player:getID());
        npc:setLocalVar("traded", 0);
        player:tradeComplete();
        startConfrontation(player, 10, 600, monsters, false);

    -- hard mode
    elseif (count == 2 + tier and beastSeals == true and gil == tier * 1200 and thirdSlot ~= 0) then
        npc:setLocalVar("trader", player:getID());
        npc:setLocalVar("traded", thirdSlot);
        player:tradeComplete();
        startConfrontation(player, 10, 600, monsters, true);
end

end

function rewardElite(player, npc, items)
    local tradedItem = npc:getLocalVar("traded");
    local killed = player:getLocalVar("killedFoVNM");
    local trader = npc:getLocalVar("trader");
    if (killed == 1 and trader == player:getID()) then
        player:setLocalVar("killedFoVNM", 0);
        npc:setLocalVar("trader", 0);
        npc:setLocalVar("traded", 0);

        -- reward basic item
        local size = 0;
        for i,v in pairs(items) do
            size = size + 1;
        end
        local id = items[math.random(1, size)];
        local item = getItem(id);
        local augments = pickAugments(item);
        local reward = {["augment"] = {id, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8]}};
        jsrReward(player, reward);

        -- reward second item if player traded one
        if (tradedItem ~= 0) then
            item = getItem(tradedItem);
            augments = pickAugments(item);
            reward = {["augment"] = {tradedItem, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8]}};
            jsrReward(player, reward);
        end

    end

end


function rewardTemporaryItem(player)
    local level = player:getMainLvl();
    local hasMP = player:getMaxMP() > 25;
    local statPotions = {4207, 4205, 4211, 4209, 4199, 4203};
    local boostItems = { -- Count: 18
        5440, -- Dusty Wing
        5392, -- Champion's Drink
        5389, -- Spy's Drink
        5386, -- Fighter's Drink
        5385, -- Barbarian's Drink
        5849, -- Berserker's Drink
        5241, -- Giant's Drink
        5395, -- Cleric's Drink
        5770, -- Super Reraiser
        5322, -- Healing Powder
        5832, -- Healing Mist
        5833, -- Mana Mist
        4255, -- Mana Powder
        5393, -- Monarch's Drink
        4174, -- Vile Elixir
        4175, -- Vile Elixir +1
        4254, -- Megalixir
        4155 -- Remedy
    };


    local item = 0;
    local rand = math.random(0, 100);
    if (rand <= 15) then
       item = statPotions[math.random(1,6)];
    else
        item = boostItems[math.random(1,18)];
    end

    player:addTempItem(item);
    player:messageSpecial(ITEM_OBTAINED, item);
end




