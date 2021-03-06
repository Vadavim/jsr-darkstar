require("scripts/globals/magic");
require("scripts/globals/magicburst")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/summon");

-- Foreword: A lot of this is good estimating since the FFXI playerbase has not found all of info for individual moves.
--            What is known is that they roughly follow player Weaponskill calculations (pDIF, dMOD, ratio, etc) so this is what
--            this set of functions emulates.

-- mob types
-- used in mob:isMobType()
MOBTYPE_NORMAL            = 0x00;
MOBTYPE_PCSPAWNED        = 0x01;
MOBTYPE_NOTORIOUS        = 0x02;
MOBTYPE_FISHED            = 0x04;
MOBTYPE_CALLED            = 0x08;
MOBTYPE_BATTLEFIELD        = 0x10;
MOBTYPE_EVENT            = 0x20;

--skilltype
MOBSKILL_PHYSICAL = 0;
MOBSKILL_MAGICAL = 1;
MOBSKILL_RANGED = 2;
MOBSKILL_BREATH = 4;
MOBSKILL_SPECIAL = 3;

--skillparam (PHYSICAL)
MOBPARAM_NONE = 0;
MOBPARAM_BLUNT = 1;
MOBPARAM_SLASH = 2;
MOBPARAM_PIERCE = 3;
MOBPARAM_H2H = 4;

MOBDRAIN_HP = 0;
MOBDRAIN_MP = 1;
MOBDRAIN_TP = 2;

--skillparam (MAGICAL)
-- this is totally useless and should be removed
-- add resistence using ELE_FIRE, see bomb_toss.lua
MOBPARAM_FIRE = 6;
MOBPARAM_EARTH = 7;
MOBPARAM_WATER = 8;
MOBPARAM_WIND = 9;
MOBPARAM_ICE = 10;
MOBPARAM_THUNDER = 11;
MOBPARAM_LIGHT = 12;
MOBPARAM_DARK = 13;

--shadowbehav (number of shadows to take off)
MOBPARAM_IGNORE_SHADOWS = 0;
MOBPARAM_1_SHADOW = 1;
MOBPARAM_2_SHADOW = 2;
MOBPARAM_3_SHADOW = 3;
MOBPARAM_4_SHADOW = 4;
MOBPARAM_WIPE_SHADOWS = 999;

TP_ACC_VARIES = 0;
TP_ATK_VARIES = 1;
TP_DMG_VARIES = 2;
TP_CRIT_VARIES = 3;
TP_NO_EFFECT = 0;
TP_MACC_BONUS = 1;
TP_MAB_BONUS = 2;
TP_DMG_BONUS = 3;
TP_RANGED = 4;

MSG_NONE = 0; -- display nothing
MSG_USES = 101; -- simple uses message
MSG_FAMILIAR = 108;
MSG_SELF_HEAL = 238;
MSG_ENFEEB_IS = 242; --XXX is petrified.
MSG_ENFEEB = 243; --XXX receives the effect of petrification.
MSG_BUFF = 186;
MSG_DRAIN_HP = 187;
MSG_DRAIN_MP = 225;
MSG_DRAIN_TP = 226;
MSG_NO_EFFECT = 189;
MSG_SHADOW = 31;
MSG_ANTICIPATE = 30;
MSG_DAMAGE = 185; -- player uses, target takes 10 damage. DEFAULT
MSG_MISS = 188;
MSG_RESIST = 85;
MSG_EFFECT_DRAINED = 370; -- <num> status effects are drained from <target>.
MSG_ATTR_DRAINED = 369;
MSG_TP_REDUCED = 362; -- tp reduced to
MSG_DISAPPEAR = 159; -- <target>'s stun effect disappears!
MSG_DISAPPEAR_NUM = 231; -- <num> of <target>'s effects disappear!

BOMB_TOSS_HPP = 1;


local strongSystem = {
    [SYSTEM_PLANTOID] = SYSTEM_BEAST, [SYSTEM_BEAST] = SYSTEM_LIZARD, [SYSTEM_LIZARD] = SYSTEM_VERMIN,
    [SYSTEM_VERMIN] = SYSTEM_PLANTOID, [SYSTEM_AQUAN] = SYSTEM_AMORPH, [SYSTEM_AMORPH] = SYSTEM_BIRD,
    [SYSTEM_BIRD] = SYSTEM_AQUAN, [SYSTEM_UNDEAD] = SYSTEM_ARCANA, [SYSTEM_ARCANA] = SYSTEM_UNDEAD,
    [SYSTEM_DRAGON] = SYSTEM_DEMON, [SYSTEM_DEMON] = SYSTEM_DRAGON, [SYSTEM_BEASTMEN] = SYSTEM_BEASTMEN,
    [SYSTEM_LUMINION] = SYSTEM_LUMORIAN, [SYSTEM_LUMORIAN] = SYSTEM_LUMINION
}


local weakSystem = {
    [SYSTEM_PLANTOID] = SYSTEM_VERMIN, [SYSTEM_BEAST] = SYSTEM_PLANTOID, [SYSTEM_LIZARD] = SYSTEM_BEAST,
    [SYSTEM_VERMIN] = SYSTEM_LIZARD, [SYSTEM_AQUAN] = SYSTEM_BIRD, [SYSTEM_AMORPH] = SYSTEM_AQUAN,
    [SYSTEM_BIRD] = SYSTEM_AMORPH, [SYSTEM_UNDEAD] = SYSTEM_UNDEAD, [SYSTEM_ARCANA] = SYSTEM_ARCANA,
    [SYSTEM_DRAGON] = SYSTEM_DRAGON, [SYSTEM_DEMON] = SYSTEM_DEMON,
    [SYSTEM_LUMINION] = SYSTEM_LUMINION, [SYSTEM_LUMORIAN] = SYSTEM_LUMORIAN
}

function MobRangedMove(mob,target,skill,numberofhits,accmod,dmgmod,tpeffect,mtp000,mtp150,mtp300,offcratiomod)
    -- this will eventually contian ranged attack code
    local returninfo = {};
    local master = mob:getMaster();

    --get dstr (bias to monsters, so no fSTR)
    local dstr = mob:getStat(MOD_DEX) - target:getStat(MOD_VIT);
    if (master ~= nil) then dstr = dstr + master:getMod(MOD_CHR)  end;
    if (dstr < -40) then
        dstr = -40;
    end

    if (dstr > 40) then
        dstr = 40;
    end

    if (dstr < 0) then dstr = dstr / 2; end;

    local lvluser = mob:getMainLvl();
    local lvltarget = target:getMainLvl();
    local acc = mob:getRACC();
    local eva = target:getEVA();

    local hitMult = 0;
    local damMult = 1;
    if (not target:isPC()) then
        local mobSystem = mob:getSystem();
        local targetSystem = target:getSystem();

        if (strongSystem[mobSystem] == targetSystem) then
            hitMult = 15; damMult = 1.15;
        elseif (weakSystem[mobSystem] == targetSystem) then
            hitMult = -15; damMult = 0.85;
        end
    end



    if (master ~= nil) then acc = acc + master:getMod(MOD_CHR) / 2 end;
    if (target:hasStatusEffect(EFFECT_YONIN) and mob:isFacing(target, 23)) then -- Yonin evasion boost if mob is facing target
    eva = eva + target:getStatusEffect(EFFECT_YONIN):getPower();
    end

    if (mob:isPet() and tpeffect == TP_NO_EFFECT) then
        local barrage = mob:getStatusEffect(EFFECT_BARRAGE);
        if (barrage ~= nil) then
            numberofhits = numberofhits + barrage:getPower();
            mob:delStatusEffect(EFFECT_BARRAGE);
        end
    end

    local foil = target:getStatusEffect(EFFECT_FOIL)
    if (foil ~= nil) then
        acc = acc - foil:getPower();
        target:addTP(foil:getPower() * 5);
        target:delStatusEffect(EFFECT_FOIL);
    end

    if (target:hasStatusEffect(EFFECT_YAEGASUMI)) then
        acc = acc - 100;
        if (target:hasStatusEffect(EFFECT_SEIGAN)) then
            acc = acc - 100;
            target:addTP(1000);
        end
        target:delStatusEffect(EFFECT_YAEGASUMI);
    end


    --apply WSC
    local base = mob:getWeaponDmg() + dstr * 1.5 + mob:getMainLvl() / 2; --todo: change to include WSC
    if (base < 1) then
        base = 1;
    end

    --work out and cap ratio
    if (offcratiomod == nil) then -- default to attack. Pretty much every physical mobskill will use this, Cannonball being the exception.
    offcratiomod = mob:getRATT();
    -- print ("Nothing passed, defaulting to attack");
    end;
    local ratio = offcratiomod/target:getStat(MOD_DEF);

    local lvldiff = lvluser - lvltarget;
    if lvldiff < 0 then
        lvldiff = 0;
    end;

    if (ratio < 1) then
        ratio = ratio + lvldiff * (0.05 * ratio);
    else
        ratio = ratio + lvldiff * 0.05;
    end

    ratio = utils.clamp(ratio, 0, 4.5);

    --work out hit rate for mobs (bias towards them)
    local hitrate = (acc*accmod) - eva + (lvldiff*2) + 75 + hitMult;

    if (mob:isPet() and mob:getMaster():isPC()) then
        hitrate = hitrate + 20;
        base = base * 2.5;
    end



    --work out the base damage for a single hit
    local hitdamage = base + lvldiff;
    if (hitdamage < 1) then
        hitdamage = 1;
    end

    hitdamage = hitdamage * dmgmod * damMult;

    if (tpeffect == TP_DMG_VARIES) then
        hitdamage = hitdamage * MobTPMod(skill:getTP() + mob:getMod(MOD_TP_BONUS));
    end

    local critChance = 0;
    if (tpeffect == TP_CRIT_VARIES) then
        critChance = 25 * fTP(skill:getTP() + mob:getMod(MOD_TP_BONUS), mtp000, mtp150, mtp300);
    end


    --work out min and max cRatio
    local maxRatio = 1;
    local minRatio = 0;

    if (ratio < 0.5) then
        maxRatio = ratio + 0.5;
    elseif ((0.5 <= ratio) and (ratio <= 0.7)) then
        maxRatio = 1;
    elseif ((0.7 < ratio) and (ratio <= 1.2)) then
        maxRatio = ratio + 0.3;
    elseif ((1.2 < ratio) and (ratio <= 1.5)) then
        maxRatio = (ratio * 0.25) + ratio;
    elseif ((1.5 < ratio) and (ratio <= 2.625)) then
        maxRatio = ratio + 0.375;
    elseif ((2.625 < ratio) and (ratio <= 3.25)) then
        maxRatio = 3;
    else
        maxRatio = ratio;
    end


    if (ratio < 0.38) then
        minRatio =  0;
    elseif ((0.38 <= ratio) and (ratio <= 1.25)) then
        minRatio = ratio * (1176 / 1024) - (448 / 1024);
    elseif ((1.25 < ratio) and (ratio <= 1.51)) then
        minRatio = 1;
    elseif ((1.51 < ratio) and (ratio <= 2.44)) then
        minRatio = ratio * (1176 / 1024) - (775 / 1024);
    else
        minRatio = ratio - 0.375;
    end

    --apply ftp (assumes 1~3 scalar linear mod)
    if (tpeffect==TP_DMG_BONUS) then
        hitdamage = hitdamage * fTP(skill:getTP() + mob:getMod(MOD_TP_BONUS), mtp000, mtp150, mtp300);
    end

    --Applying pDIF
    local pdif = 0;

    -- start the hits
    local hitchance = math.random();
    local finaldmg = 0;
    local hitsdone = 1;
    local hitslanded = 0;

    local chance = math.random();

    -- first hit has a higher chance to land
    local firstHitChance = hitrate * 1.5 * 1.2;

    firstHitChance = utils.clamp(firstHitChance, 35, 95);

    if ((chance*100) <= firstHitChance) then
        pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
        pdif = pdif/1000; --multiplier set.
        finaldmg = finaldmg + hitdamage * pdif;
        hitslanded = hitslanded + 1;
    end
    while (hitsdone < numberofhits) do
        chance = math.random();
        if ((chance*100)<=hitrate) then --it hit
        pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
        pdif = pdif/1000; --multiplier set.
        finaldmg = finaldmg + hitdamage * pdif;
        hitslanded = hitslanded + 1;
        end
        hitsdone = hitsdone + 1;
    end

    -- printf("final: %f, hits: %f, acc: %f", finaldmg, hitslanded, hitrate);
    -- printf("ratio: %f, min: %f, max: %f, pdif, %f hitdmg: %f", ratio, minRatio, maxRatio, pdif, hitdamage);

    -- if an attack landed it must do at least 1 damage
    if (hitslanded >= 1 and finaldmg < 1) then
        finaldmg = 1;
    end

    if (critChance + target:getMod(MOD_ENEMYCRITRATE) > math.random(0, 100)) then
        finaldmg = finaldmg * 1.75;
    end


    -- all hits missed
    if (hitslanded == 0 or finaldmg == 0) then
        finaldmg = 0;
        hitslanded = 0;
        skill:setMsg(MSG_MISS);
    end

    returninfo.dmg = finaldmg;
    returninfo.hitslanded = hitslanded;

    return returninfo;
end;

-- PHYSICAL MOVE FUNCTION
-- Call this on every physical move!
-- accmod is a linear multiplier for accuracy (1 default)
-- dmgmod is a linear multiplier for damage (1 default)
-- tpeffect is an enum which can be one of:
-- 0 TP_ACC_VARIES
-- 1 TP_ATK_VARIES
-- 2 TP_DMG_VARIES
-- 3 TP_CRIT_VARIES
-- mtp100/200/300 are the three values for 100% TP, 200% TP, 300% TP just like weaponskills.lua
-- if TP_ACC_VARIES -> three values are acc %s (1.0 is 100% acc, 0.8 is 80% acc, 1.2 is 120% acc)
-- if TP_ATK_VARIES -> three values are attack multiplier (1.5x 0.5x etc)
-- if TP_DMG_VARIES -> three values are

function MobPhysicalMove(mob,target,skill,numberofhits,accmod,dmgmod,tpeffect,mtp000,mtp150,mtp300,offcratiomod)
    local returninfo = {};
    local master = mob:getMaster();

    --get dstr (bias to monsters, so no fSTR)
    local dstr = mob:getStat(MOD_STR) - target:getStat(MOD_VIT);
    local strMult = 1
    if (master == nil) then
        strMult = strMult + mob:getMainLvl() / 25;
    end

    if (master ~= nil) then dstr = dstr + master:getMod(MOD_CHR)  end;
    if (dstr < -40) then
        dstr = -40;
    end

    if (dstr > 40) then
        dstr = 40;
    end

    if (dstr < 0) then dstr = dstr / 2 end;

    local hitMult = 0;
    local damMult = 1;
    if (not target:isPC()) then
        local mobSystem = mob:getSystem();
        local targetSystem = target:getSystem();

        if (strongSystem[mobSystem] == targetSystem) then
            hitMult = 15; damMult = 1.15;
        elseif (weakSystem[mobSystem] == targetSystem) then
            hitMult = -15; damMult = 0.85;
        end
    end



    local lvluser = mob:getMainLvl();
    local lvltarget = target:getMainLvl();
    local acc = mob:getACC();
    local eva = target:getEVA();
    if (master ~= nil) then acc = acc + master:getMod(MOD_CHR) / 2 end;
    if (target:hasStatusEffect(EFFECT_YONIN) and mob:isFacing(target, 23)) then -- Yonin evasion boost if mob is facing target
        eva = eva + target:getStatusEffect(EFFECT_YONIN):getPower();
    end



    local foil = target:getStatusEffect(EFFECT_FOIL)
    if (foil ~= nil) then
        acc = acc - foil:getPower();
        target:addTP(foil:getPower() * 5);
        target:delStatusEffect(EFFECT_FOIL);
    end

    if (target:hasStatusEffect(EFFECT_YAEGASUMI)) then
        acc = acc - 100;
        if (target:hasStatusEffect(EFFECT_SEIGAN)) then
            acc = acc - 100;
            target:addTP(1000);
        end
        target:delStatusEffect(EFFECT_YAEGASUMI);
    end

    --apply WSC
    local base = mob:getWeaponDmg() + (dstr * 1.5) + mob:getMainLvl() / 2; --todo: change to include WSC
    if (base < 1) then
        base = 1;
    end

    --work out and cap ratio
    if (offcratiomod == nil) then -- default to attack. Pretty much every physical mobskill will use this, Cannonball being the exception.
        offcratiomod = mob:getStat(MOD_ATT);
        -- print ("Nothing passed, defaulting to attack");
    end;
    local ratio = offcratiomod/target:getStat(MOD_DEF);

    local lvldiff = lvluser - lvltarget;
    if lvldiff < 0 then
        lvldiff = 0;
    end;

    if (not mob:isPet()) then
        if (ratio < 1) then
            ratio = ratio + lvldiff * (0.05 * ratio);
        else
            ratio = ratio + lvldiff * 0.05;
        end
    end
    ratio = utils.clamp(ratio, 0, 4);
    
    --work out hit rate for mobs (bias towards them)
    local hitrate = (acc*accmod) - eva + (lvldiff*2) + 75 + hitMult;
    local attackBonus = 0;
    if (mob:isPet() and mob:getMaster():isPC()) then
        hitrate = hitrate + 20;
        attackBonus = attackBonus + 20;
        base = base * 2.5;
    end

--    if (mob:getLocalVar("isAlly") == 1) then
--        hitrate = hitrate + 20;
--        attackBonus = attackBonus + 30;
--    end

    -- printf("acc: %f, eva: %f, hitrate: %f", acc, eva, hitrate);
    hitrate = utils.clamp(hitrate, 20, 95);

    --work out the base damage for a single hit
    local hitdamage = base + lvldiff;
    if (hitdamage < 1) then
        hitdamage = 1;
    end

    hitdamage = hitdamage * dmgmod * damMult;

    local damageMult = 0;

    if (tpeffect == TP_DMG_VARIES) then
        hitdamage = hitdamage * MobTPMod(skill:getTP() + mob:getMod(MOD_TP_BONUS));
    end

    local critChance = 0;
    if (tpeffect == TP_CRIT_VARIES) then
        critChance = 25 * fTP(skill:getTP() + mob:getMod(MOD_TP_BONUS), mtp000, mtp150, mtp300);
    end

    --apply ftp (assumes 1~3 scalar linear mod)
    if (tpeffect==TP_DMG_BONUS) then
        damageMult = fTP(skill:getTP() + mob:getMod(MOD_TP_BONUS), mtp000, mtp150, mtp300);
        --        hitdamage = hitdamage * fTP(skill:getTP() + mob:getMod(MOD_TP_BONUS), mtp000, mtp150, mtp300);
    end


    --work out min and max cRatio
    local maxRatio = 1;
    local minRatio = 0;
    
    if (ratio < 0.5) then
        maxRatio = ratio + 0.5;
    elseif ((0.5 <= ratio) and (ratio <= 0.7)) then
        maxRatio = 1;
    elseif ((0.7 < ratio) and (ratio <= 1.2)) then
        maxRatio = ratio + 0.3;
    elseif ((1.2 < ratio) and (ratio <= 1.5)) then
        maxRatio = (ratio * 0.25) + ratio;
    elseif ((1.5 < ratio) and (ratio <= 2.625)) then
        maxRatio = ratio + 0.375;
    elseif ((2.625 < ratio) and (ratio <= 3.25)) then
        maxRatio = 3;
    else 
        maxRatio = ratio;
    end
    

    if (ratio < 0.38) then
        minRatio =  0;
    elseif ((0.38 <= ratio) and (ratio <= 1.25)) then
        minRatio = ratio * (1176 / 1024) - (448 / 1024);
    elseif ((1.25 < ratio) and (ratio <= 1.51)) then
        minRatio = 1;
    elseif ((1.51 < ratio) and (ratio <= 2.44)) then
        minRatio = ratio * (1176 / 1024) - (775 / 1024);
    else
        minRatio = ratio - 0.375;
    end


    --Applying pDIF
    local pdif = 0;

    -- start the hits
    local hitchance = math.random();
    local finaldmg = 0;
    local hitsdone = 1;
    local hitslanded = 0;

    local chance = math.random();

    -- first hit has a higher chance to land
    local firstHitChance = hitrate * 1.5;

    firstHitChance = utils.clamp(firstHitChance, 35, 95);

    if ((chance*100) <= firstHitChance) then
        local crit = (critChance + target:getMod(MOD_ENEMYCRITRATE) > math.random(0, 100));
        local pdif = mob:getDamageRatio(target, crit, attackBonus);
--        pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
--        pdif = pdif/1000; --multiplier set.
--        finaldmg = finaldmg + hitdamage * pdif;
        finaldmg = finaldmg + hitdamage * pdif;
        local critresult = 0;
        if (crit == true) then critresult = 1; end;
--        printf("Crit: %d, min/max: %f/%f, pdif: %f", crit, minRatio, maxRatio, pdif);
        print("Crit: " .. tostring(critresult) .. ", min/max: " .. tostring(minRatio) .. "/" .. tostring(maxRatio) .. " pdif: " .. tostring(pdif));

        hitslanded = hitslanded + 1;
    end
    while (hitsdone < numberofhits) do
        chance = math.random();
        if ((chance*100)<=hitrate) then --it hit
            local crit = (critChance + target:getMod(MOD_ENEMYCRITRATE) > math.random(0, 100));
            local pdif = mob:getDamageRatio(target, crit, 0);
            --        pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
            --        pdif = pdif/1000; --multiplier set.
            --        finaldmg = finaldmg + hitdamage * pdif;
            finaldmg = finaldmg + hitdamage * pdif;
            hitslanded = hitslanded + 1;
        end
        hitsdone = hitsdone + 1;
    end

    -- printf("final: %f, hits: %f, acc: %f", finaldmg, hitslanded, hitrate);
    -- printf("ratio: %f, min: %f, max: %f, pdif, %f hitdmg: %f", ratio, minRatio, maxRatio, pdif, hitdamage);

    -- if an attack landed it must do at least 1 damage
    if (hitslanded >= 1 and finaldmg < 1) then
        finaldmg = 1;
    end

--    if (critChance + target:getMod(MOD_ENEMYCRITRATE) < math.random(0, 100)) then
--        if (mob:getMaster() ~= nil) then
--            finaldmg = finaldmg * 1.75;
--        else
--            finaldmg = finaldmg * 1.4;
--        end
--
--    end

    -- all hits missed
    if (hitslanded == 0 or finaldmg == 0) then
        finaldmg = 0;
        hitslanded = 0;
        skill:setMsg(MSG_MISS);
    end

    returninfo.dmg = finaldmg;
    returninfo.hitslanded = hitslanded;

    return returninfo;

end

function purgeNegative(target, times)
    if (times == nil) then
        times = 100;
    end

    local currentCount = times;

    if (times > 0 and target:delStatusEffect(EFFECT_POISON)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_POISON_II)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_DISEASE)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_PLAGUE)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_BLINDNESS)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_WEIGHT)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_BIND)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_SLEEP)) then times = times - 1 end;


    if (times > 0 and target:delStatusEffect(EFFECT_MND_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_STR_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_AGI_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_DEX_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_INT_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_CHR_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_VIT_DOWN)) then times = times - 1 end;

    if (times > 0 and target:delStatusEffect(EFFECT_BURN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_FROST)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_CHOKE)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_SHOCK)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_DROWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_RASP)) then times = times - 1 end;

    if (times > 0 and target:delStatusEffect(EFFECT_ACCURACY_DOWN_II)) then times = times - 1 end;

    if (times > 0 and target:delStatusEffect(EFFECT_EVASION_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_EVASION_DOWN_II)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_ACCURACY_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_ACCURACY_DOWN_II)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_DEFENSE_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_DEFENSE_DOWN_II)) then times = times - 1 end;

    if (times > 0 and target:delStatusEffect(EFFECT_MAGIC_ACC_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_MAGIC_ACC_DOWN_II)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_MAGIC_ATK_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_MAGIC_ATK_DOWN_II)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_MAGIC_EVASION_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_MAGIC_EVASION_DOWN_II)) then times = times - 1 end;

    if (times > 0 and target:delStatusEffect(EFFECT_ATTACK_DOWN)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_ATTACK_DOWN_II)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_SLOW)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_SLOW_II)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_PARALYSIS)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_PARALYSIS_II)) then times = times - 1 end;

    if (times > 0 and target:delStatusEffect(EFFECT_DIA)) then times = times - 1 end;
    if (times > 0 and target:delStatusEffect(EFFECT_BIO)) then times = times - 1 end;
    return currentCount - times;
end

-- MAGICAL MOVE
-- Call this on every magical move!
-- mob/target/skill should be passed from onMobWeaponSkill.
-- dmg is the base damage (V value), accmod is a multiplier for accuracy (1 default, more than 1 = higher macc for mob),
-- ditto for dmg mod but more damage >1 (equivalent of M value)
-- tpeffect is an enum from one of:
-- 0 = TP_NO_EFFECT
-- 1 = TP_MACC_BONUS
-- 2 = TP_MAB_BONUS
-- 3 = TP_DMG_BONUS
-- tpvalue affects the strength of having more TP along the following lines:
-- TP_NO_EFFECT -> tpvalue has no effect.
-- TP_MACC_BONUS -> direct multiplier to macc (1 for default)
-- TP_MAB_BONUS -> direct multiplier to mab (1 for default)
-- TP_DMG_BONUS -> direct multiplier to damage (V+dINT) (1 for default)
--Examples:
-- TP_DMG_BONUS and TP=100, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 150
-- TP_DMG_BONUS and TP=200, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 300
-- TP_DMG_BONUS and TP=100, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 300
-- TP_DMG_BONUS and TP=200, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 600

function MobMagicalMove(mob,target,skill,damage,element,dmgmod,tpeffect,tpvalue, mtp000, mtp150, mtp300)
    returninfo = {};
    --get all the stuff we need
    local resist = 1
    local master = mob:getMaster();
    if (not mob:isPet() and mob:isMob()) then
        local damBonus = (mob:getStat(MOD_INT) - target:getStat(MOD_INT)) / 100;
        damage = damage * 1.25 * (1 + damBonus);
    end


    local hitMult = 0;
    local damMult = 1;
    if (not target:isPC()) then
        local mobSystem = mob:getSystem();
        local targetSystem = target:getSystem();

        if (strongSystem[mobSystem] == targetSystem) then
            hitMult = 0.15; damMult = 1.15;
        elseif (weakSystem[mobSystem] == targetSystem) then
            hitMult = -0.15; damMult = 0.85;
        end
    end

    local mdefBarBonus = 0;
    if (element > 0 and element <= 6 and target:hasStatusEffect(barSpells[element])) then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(barSpells[element]):getSubPower();
        if (mdefBarBonus > 0) then
            mob:setLocalVar("bonusXP", mob:getLocalVar("bonusXP") + 5);
        end

    end
    -- plus 100 forces it to be a number
    local mab = (100 + mob:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus);

    if (mab > 2.5) then
        mab = 2.5;
    end

    if (mab < 0.3) then
        mab = 0.3;
    end

    local dInt = (mob:getStat(MOD_INT) - target:getStat(MOD_INT));
    if (master ~= nil) then
        mab = mab + master:getMod(MOD_CHR) / 400.0
        dInt = dInt + master:getMod(MOD_CHR);
    end;

--    if (tpeffect==TP_DMG_BONUS) then
--        damage = damage * ((((skill:getTP() + mob:getMod(MOD_TP_BONUS)) / 10)*tpvalue)/100);
--    end

    if (tpeffect==TP_DMG_BONUS) then
        damage = damage * fTP(skill:getTP() + mob:getMod(MOD_TP_BONUS), mtp000, mtp150, mtp300);
    end

    if (tpeffect == TP_DMG_VARIES or tpeffect == TP_MAB_BONUS) then
        damage = damage * MobTPMod(skill:getTP() + mob:getMod(MOD_TP_BONUS));
    end

    -- resistence is added last
    local finaldmg = (damage + dInt) * mab * dmgmod * damMult;
     printf("power: %f, bonus: %f", damage, mab);

    local lvldiff = mob:getMainLvl() - target:getMainLvl();
    if lvldiff < 0 then
        lvldiff = 0;
    end;

    if (not mob:isPet()) then
        finaldmg = finaldmg * utils.clamp(1 + lvldiff * 0.05, 1, 2);
    end

    -- get resistence
    local accBonus = 0;
    if (mob:isPet() and mob:getMaster() ~= nil) then
        local master = mob:getMaster();
        local petID = master:getPetID();
        if (petID ~= nil) then
            if (master:getPetID() >= 0 and master:getPetID() <= 20) then -- check to ensure pet is avatar
--                avatarAccBonus = utils.clamp(master:getSkillLevel(SKILL_SUM) - master:getMaxSkillLevel(mob:getMainLvl(), JOBS.SMN, SUMMONING_SKILL), 0, 200);
                accBonus = skill:getTP() / 50;
            end
        end
    end

    if (mob:getLocalVar("isAlly") >= 1) then
        accBonus = accBonus + 20;
    end

    resist = applyPlayerResistance(mob,nil,target,dInt,accBonus,element);

--    local magicDefense = getElementalDamageReduction(target, element);

    finaldmg = finaldmg * resist
    finaldmg = mobAddBonuses(mob, skill, target, finaldmg, element);

    returninfo.dmg = finaldmg;

    return returninfo;

end

--mob version
--effect = EFFECT_WHATEVER if enfeeble
--statmod = the stat to account for resist (INT,MND,etc) e.g. MOD_INT
--This determines how much the monsters ability resists on the player.
function applyPlayerResistance(mob,effect,target,diff,bonus,element)
    local percentBonus = 0;
    local magicaccbonus = 0;

    if (diff > 10) then
        magicaccbonus = magicaccbonus + 10 + (diff - 10)/2;
    else
        magicaccbonus = magicaccbonus + diff;
    end


    if (not target:isPC()) then
        local mobSystem = mob:getSystem();
        local targetSystem = target:getSystem();

        if (strongSystem[mobSystem] == targetSystem) then
            magicaccbonus = magicaccbonus + 15;
        elseif (weakSystem[mobSystem] == targetSystem) then
            magicaccbonus = magicaccbonus - 15;
        end
    end



    if (mob:isPet() and mob:getMaster() ~= nil) then
        local master = mob:getMaster();
        magicaccbonus = magicaccbonus + master:getMod(MOD_CHR) / 2;
        if (master:getMainJob() == JOBS.SMN) then
            magicaccbonus = magicaccbonus + master:getMod(MOD_SUMMONING) / 2;
        end
    end



    local foil = target:getStatusEffect(EFFECT_FOIL)
    if (foil ~= nil) then
        magicaccbonus = magicaccbonus - foil:getPower();
        target:addTP(foil:getPower() * 5);
        target:delStatusEffect(EFFECT_FOIL);
    end

    if (target:hasStatusEffect(EFFECT_YAEGASUMI)) then
        magicaccbonus = magicaccbonus - 100;
        if (target:hasStatusEffect(EFFECT_SEIGAN)) then
            magicaccbonus = magicaccbonus - 100;
            target:addTP(1000);
        end
        target:delStatusEffect(EFFECT_YAEGASUMI);
    end

    if (bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

    if(effect ~= nil) then
        local statRes = getEffectResistance(target, effect);
        if (statRes >= 5) then
            mob:setLocalVar("bonusXP", mob:getLocalVar("bonusXP") + 5);
        end

        percentBonus = percentBonus - getEffectResistance(target, effect);
    end

    local p = getMagicHitRate(mob, target, 0, element, percentBonus, magicaccbonus);

    return getMagicResist(p);
end;

function mobAddBonuses(caster, spell, target, dmg, ele)

--    local magicDefense = getElementalDamageReduction(target, ele);
--    dmg = math.floor(dmg * magicDefense);

    local dayWeatherBonus = 1.00;

    if caster:getWeather() == singleWeatherStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif caster:getWeather() == singleWeatherWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif caster:getWeather() == doubleWeatherStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif caster:getWeather() == doubleWeatherWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    if VanadielDayElement() == dayStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif VanadielDayElement() == dayWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    end

    if dayWeatherBonus > 1.5 then
        dayWeatherBonus = 1.5;
    end


    if (ele > 0) then
        dmg = dmg * (1 + caster:getMod(spellAtt[ele]) / 100);
        local magicDefense = getElementalDamageReduction(target, ele);
        dmg = math.floor(dmg * magicDefense);
    end

    dmg = math.floor(dmg * dayWeatherBonus);

    local burst = calculateMobMagicBurst(caster, ele, target);

    -- not sure what to do for this yet
    -- if (burst > 1.0) then
        -- spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
    -- end

    dmg = math.floor(dmg * burst);

--    local mdefBarBonus = 0;
--    if (ele > 0 and ele <= 6 and target:hasStatusEffect(barSpells[ele])) then -- bar- spell magic defense bonus
--        mdefBarBonus = target:getStatusEffect(barSpells[ele]):getSubPower();
--    end
--    mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus) ;
--
--    dmg = math.floor(dmg * mab);

    local magicDmgMod = (256 + target:getMod(MOD_DMGMAGIC)) / 256;
    dmg = math.floor(dmg * magicDmgMod);

    -- print(affinityBonus);
    -- print(speciesReduction);
    -- print(dayWeatherBonus);
    -- print(burst);
    -- print(mab);
    -- print(magicDmgMod);

    return dmg;
end

function calculateMobMagicBurst(caster, ele, target)

    local burst = 1.0;

    local skillchainTier, skillchainCount = MobFormMagicBurst(ele, target);

    if (skillchainTier > 0) then
        --JSR: mob skillchain bonus for magic bursting
        if (skillchainCount == 1) then
            burst = 1.6;
        elseif (skillchainCount == 2) then
            burst = 1.7;
        elseif (skillchainCount == 3) then
             burst = 1.8;
        elseif (skillchainCount == 4) then
            burst = 1.9;
        elseif (skillchainCount == 5) then
            burst = 2.0;
        else
            -- Something strange is going on if this occurs.
            burst = 1.0;
        end
    end

    return burst;
end;

-- Calculates breath damage
-- mob is a mob reference to get hp and lvl
-- percent is the percentage to take from HP
-- base is calculated from main level to create a minimum
-- Equation: (HP * percent) + (LVL / base)
-- cap is optional, defines a maximum damage
function MobBreathMove(mob, target, percent, base, element, cap)
    local damage = (mob:getHP() * percent) + (mob:getMainLvl() / base);

    if (cap == nil) then
        -- cap max damage
        cap = math.floor(mob:getHP()/5);
    end
    if (mob:isNM()) then
        local otherCap = 7 * mob:getMainLvl();
        if (otherCap < cap) then cap = otherCap; end;
    end




    -- Deal bonus damage vs mob ecosystem
    local systemBonus = utils.getSystemStrengthBonus(mob, target);
    damage = damage + (damage * (systemBonus * 0.25));

    if (mob:hasStatusEffect(EFFECT_CHOKE)) then
        damage = damage * 0.85;
    end

    if (mob:hasStatusEffect(EFFECT_DROWN)) then
        damage = damage * 0.85;
    end

    if (mob:hasStatusEffect(EFFECT_SILENCE)) then
        damage = damage * 0.75;
    end


    -- elemental resistence
    if (element ~= nil and element > 0) then
        -- no skill available, pass nil
        local resist = applyPlayerResistance(mob,nil,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,element);

        -- get elemental damage reduction
        local defense = getElementalDamageReduction(target, element)

        damage = damage * resist * defense;
    end

    damage = utils.clamp(damage, 1, cap);

    return damage;
end;

function MobFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)

    -- physical attack missed, skip rest
    if (skill:hasMissMsg()) then
        return 0;
    end

    --handle pd
    if ((target:hasStatusEffect(EFFECT_PERFECT_DODGE) or target:hasStatusEffect(EFFECT_ALL_MISS) )
            and skilltype==MOBSKILL_PHYSICAL) then
        skill:setMsg(MSG_MISS);
        return 0;
    end

    -- set message to damage
    -- this is for AoE because its only set once
    skill:setMsg(MSG_DAMAGE);

    --Handle shadows depending on shadow behaviour / skilltype
    if (shadowbehav ~= MOBPARAM_WIPE_SHADOWS and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows.

        if (skill:isAoE() or skill:isConal()) then
            shadowbehav = MobTakeAoEShadow(mob, target, shadowbehav);
        end

        dmg = utils.takeShadows(target, dmg, shadowbehav);

        -- dealt zero damage, so shadows took hit
        if (dmg == 0) then
            skill:setMsg(MSG_SHADOW);
            return shadowbehav;
        end

    elseif (shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
        target:delStatusEffect(EFFECT_COPY_IMAGE);
        target:delStatusEffect(EFFECT_BLINK);
        target:delStatusEffect(EFFECT_THIRD_EYE);
    end

    if (skilltype == MOBSKILL_PHYSICAL and skill:isSingle() == false) then
        target:delStatusEffect(EFFECT_THIRD_EYE);
    end

    --handle Third Eye using shadowbehav as a guide
    if (skilltype == MOBSKILL_PHYSICAL and utils.thirdeye(target)) then
        skill:setMsg(MSG_ANTICIPATE);
        return 0;
    end

    if (skilltype == MOBSKILL_PHYSICAL) then

        dmg = target:physicalDmgTaken(dmg);

    elseif (skilltype == MOBSKILL_MAGICAL) then

        dmg = target:magicDmgTaken(dmg);

    elseif (skilltype == MOBSKILL_BREATH) then

        dmg = target:breathDmgTaken(dmg);

    elseif (skilltype == MOBSKILL_RANGED) then

        dmg = target:rangedDmgTaken(dmg);

    end

    --handling phalanx
    dmg = dmg - target:getMod(MOD_PHALANX);

    if (dmg < 0) then
        return 0;
    end

    dmg = utils.stoneskin(target, dmg);

    if (dmg > 0) then
        target:wakeUp();
        target:updateEnmityFromDamage(mob,dmg);
        target:handleAfflatusMiseryDamage(dmg);
    end
    if (dmg == nil) then dmg = 0; end;

    return dmg;
end;

-- returns true if mob attack hit
-- used to stop tp move status effects
function MobPhysicalHit(skill)
    -- if message is not the default. Then there was a miss, shadow taken etc
    return skill:hasMissMsg() == false;
end;

-- function MobHit()
-- end;

-- function MobAoEHit()
-- end;

-- function MobMagicHit()
-- end;

-- function MobMagicAoEHit()
-- end;

function MobDrainMove(mob, target, drainType, drain)

    if (target:isUndead() == false) then

        if (drainType == MOBDRAIN_MP) then
            -- can't go over limited mp
            if (target:getMP() < drain) then
                drain = target:getMP();
            end

            target:delMP(drain);
            mob:addMP(drain);

            return MSG_DRAIN_MP;
        elseif (drainType == MOBDRAIN_TP) then
            -- can't go over limited tp
            if (target:getTP() < drain) then
                drain = target:getTP();
            end

            target:delTP(drain);
            mob:addTP(drain);

            return MSG_DRAIN_TP;
        elseif (drainType == MOBDRAIN_HP) then
            -- can't go over limited hp
            if (target:getHP() < drain) then
                drain = target:getHP();
            end

            target:delHP(drain);
            mob:addHP(drain * 3);

            return MSG_DRAIN_HP;
        end

    else
        -- it's undead so just deal damage
        -- can't go over limited hp
        if (target:getHP() < drain) then
            drain = target:getHP();
        end

        target:delHP(drain);
        return MSG_DAMAGE;
    end

    return MSG_NO_EFFECT;
end;

function MobPhysicalDrainMove(mob, target, skill, drainType, drain)
    if (MobPhysicalHit(skill)) then
        return MobDrainMove(mob, target, drainType, drain);
    end

    return MSG_MISS;
end;

function MobDrainAttribute(mob, target, typeEffect, power, tick, duration)
    local positive = nil;
    if (typeEffect == EFFECT_STR_DOWN) then
        positive = EFFECT_STR_BOOST;
    elseif (typeEffect == EFFECT_DEX_DOWN) then
        positive = EFFECT_DEX_BOOST;
    elseif (typeEffect == EFFECT_AGI_DOWN) then
        positive = EFFECT_AGI_BOOST;
    elseif (typeEffect == EFFECT_VIT_DOWN) then
        positive = EFFECT_VIT_BOOST;
    elseif (typeEffect == EFFECT_MND_DOWN) then
        positive = EFFECT_MND_BOOST;
    elseif (typeEffect == EFFECT_INT_DOWN) then
        positive = EFFECT_INT_BOOST;
    elseif (typeEffect == EFFECT_CHR_DOWN) then
        positive = EFFECT_CHR_BOOST;
    end

    if (positive ~= nil) then
        local results = MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);

        if (results == MSG_ENFEEB_IS) then
            mob:addStatusEffect(positive, power, tick, duration);

            return MSG_ATTR_DRAINED;
        end

        return MSG_MISS;
    end

    return MSG_NO_EFFECT;
end;

function MobDrainStatusEffectMove(mob, target)
    -- try to drain buff
    local effect = target:stealStatusEffect();
    local dmg = 0;

    if (effect ~= nil) then
        if (mob:hasStatusEffect(effect:getType()) == false) then
            -- add to myself
            mob:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), effect:getDuration());
        end
        -- add buff to myself
        return MSG_EFFECT_DRAINED;
    end

    return MSG_NO_EFFECT;
end;

function tpModifier(skill, scale1, scale2)
    local tp = skill:getTP();
    if (tp < 1000) then
        return 1
    end

    local base = tp / 1000;

    if (scale1 ~= nil) then
        base = base * (1 + (tp - 1000 ) / 2000)
    end

    if (scale2 ~= nil and tp > 2000) then
        base = base * (1 + (tp - 2000 ) / 1000)
    end


    return (tp / 1000) * (1 + tp / 3000);
end

function enmityStatusCheck(target, mob, skill, amount)
    if (mob:isMob() == false) then return end;
    if (skill:getMsg() == MSG_ENFEEB_IS) then
        mob:lowerEnmity(target, amount);
    end
end



function reduced_healing_factor(target)
    local factor = 1.0;
    if (target:getStatusEffect(EFFECT_POISON) ~= nil) then
        factor = factor * 0.75;
    end

    if (target:getStatusEffect(EFFECT_BIO) ~= nil) then
        factor = factor * 0.75;
    end

    if (target:getStatusEffect(EFFECT_DISEASE) ~= nil) then
        factor = factor * 0.66;
    end

    if (target:getStatusEffect(EFFECT_PLAGUE) ~= nil) then
        factor = factor * 0.66;
    end

    if (target:getStatusEffect(EFFECT_RASP) ~= nil) then
        factor = factor * 0.75;
    end


    return factor;
end

-- Adds a status effect to a target
function MobStatusEffectMove(mob, target, typeEffect, power, tick, duration, specificStat, accBonus)

    if (target:canGainStatusEffect(typeEffect, power)) then
        local statmod = MOD_INT;
        local defStatMod = MOD_INT;

        local element = mob:getStatusEffectElement(typeEffect);

        if (specificStat ~= nil) then
            statmod = specificStat;
            defStatMod = specificStat;
            if (statmod == MOD_STR) then
                edefStatMod = MOD_VIT;
            end
        end

        if (accBonus == nil) then accBonus = 0; end;


        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(defStatMod),accBonus,element);

        if (resist >= 0.25) then

            local totalDuration = utils.clamp(duration * resist, 1);
            target:addStatusEffect(typeEffect, power, tick, totalDuration);

            return MSG_ENFEEB_IS;
        end

        return MSG_MISS; -- resist !
    end
    return MSG_NO_EFFECT; -- no effect
end;

-- similar to status effect move except, this will not land if the attack missed
function MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, tick, duration, specificStat)

    if (MobPhysicalHit(skill)) then
        return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration, specificStat);
    end

    return MSG_MISS;
end;

-- similar to statuseffect move except it will only take effect if facing
function MobGazeMove(mob, target, typeEffect, power, tick, duration, specificStat)
    if (mob:hasStatusEffect(EFFECT_BLINDNESS) and math.random(0, 100) < 10) then
        return MSG_NO_EFFECT;
    end

    if (mob:hasStatusEffect(EFFECT_FLASH) and math.random(0, 100) < 50) then
        return MSG_NO_EFFECT;
    end

    if (mob:hasStatusEffect(EFFECT_FLASH) and math.random(0, 100) < 50) then
        return MSG_NO_EFFECT;
    end

    if (target:isFacing(mob)) then
        return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration, specificStat);
    end
    return MSG_NO_EFFECT;
end;

function MobRoarMove(mob, target, typeEffect, power, tick, duration, specificStat)
    if (mob:hasStatusEffect(EFFECT_DROWN) and math.random(0, 100) < 10 ) then
        return MSG_NO_EFFECT;
    end

    if (mob:hasStatusEffect(EFFECT_CHOKE) and math.random(0, 100) < 10 ) then
        return MSG_NO_EFFECT;
    end

    if (mob:hasStatusEffect(EFFECT_SILENCE) and math.random(0, 100) < 50 ) then
        return MSG_NO_EFFECT;
    end

    return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration, specificStat);
end;

function MobBuffMove(mob, typeEffect, power, tick, duration)

    if (mob:addStatusEffect(typeEffect,power,tick,duration)) then
        return MSG_BUFF;
    end
    return MSG_NO_EFFECT;
end;

function MobHealMove(target, heal)

    local mobHP = target:getHP();
    local mobMaxHP = target:getMaxHP();

    local factor = 1.0;
    if (target:getStatusEffect(EFFECT_POISON) ~= nil) then
        factor = factor * 0.75;
    end

    if (target:getStatusEffect(EFFECT_BIO) ~= nil) then
        factor = factor * 0.75;
    end

    if (target:getStatusEffect(EFFECT_DISEASE) ~= nil) then
        factor = factor * 0.66;
    end

    if (target:getStatusEffect(EFFECT_PLAGUE) ~= nil) then
        factor = factor * 0.66;
    end

    if (target:getStatusEffect(EFFECT_RASP) ~= nil) then
        factor = factor * 0.75;
    end


    if (mobHP+heal > mobMaxHP) then
        heal = mobMaxHP - mobHP;
    end

    heal = heal * factor;

    target:wakeUp();

    target:addHP(heal);

    return heal;
end

function MobTakeAoEShadow(mob, target, max)

    -- this is completely crap and should be using actual nin skill
    -- TODO fix this
    if (target:getMainJob() == JOBS.NIN and math.random() < 0.6) then
        max = max - 1;
        if (max < 1) then
            max = 1;
        end
    end

    return math.random(1, max);
end;

function MobTPMod(tp)
    -- increase damage based on tp
    if (tp >= 3000) then
        return 2;
    elseif (tp >= 2000) then
        return 1.5;
    end
    return 1;
end;

function fTP(tp,ftp1,ftp2,ftp3)
    if tp < 1000 then tp = 1000 end
    if (tp>=1000 and tp<2000) then
        return ftp1 + ( ((ftp2-ftp1)/1000) * (tp-1000));
    elseif (tp>=2000 and tp<=3000) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/1000) * (tp-2000));
    else
        print("fTP error: TP value is not between 100-300!");
    end
    return 1; -- no ftp mod
end;

function avatarMagicalMove(target, pet, skill, element, baseDamage, intMult, tpMult)
    local master = pet:getMaster();
    local dINT = pet:getStat(MOD_INT) - target:getStat(MOD_INT) + master:getMod(MOD_CHR) + master:getMod(MOD_SUMMONING) / 2;
    local tp = skill:getTP()
    local damage = baseDamage + (tpMult * (tp + pet:getMod(MOD_TP_BONUS))) + (dINT * intMult) ;

    damage = MobMagicalMove(pet,target,skill,damage,element,1,TP_NO_EFFECT,0);
    damage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);

    target:delHP(damage);
    target:updateEnmityFromDamage(pet,damage);

    return damage;
end


function doAstralFlow(target, pet, skill, master, element)
    local dINT = math.floor((pet:getStat(MOD_INT) + master:getMod(MOD_CHR)) - target:getStat(MOD_INT));
    local favorTypes = {
        [8] = EFFECT_CARBUNCLE_S_FAVOR, [9] = EFFECT_FENRIR_S_FAVOR, [10] = EFFECT_IFRIT_S_FAVOR,
        [11] = EFFECT_TITAN_S_FAVOR, [12] = EFFECT_LEVIATHAN_S_FAVOR, [13] = EFFECT_GARUDA_S_FAVOR,
        [14] = EFFECT_SHIVA_S_FAVOR, [15] = EFFECT_RAMUH_S_FAVOR,
        [16] = EFFECT_DIABOLOS_S_FAVOR, [20] = EFFECT_CAIT_SITH_S_FAVOR};

    local level = pet:getMainLvl();
    local summoning = master:getSkillLevel(SKILL_SUM) + master:getMod(MOD_SUMMONING)
    local damage = 20 + (summoning * 2.5);
    damage = damage + (dINT * (1 + level * 0.05));
    damage = damage * (1 + skill:getTP() / 2000);
    damage = damage * (0.5 + (pet:getHPP() / 200 ));
    damage = MobMagicalMove(pet,target,skill,damage,element,1,TP_NO_EFFECT,0);
    damage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);


    -- add Avatar's Favor for 5 minutes
    local type = favorTypes[master:getPetID()];
    local favor = pet:getStatusEffect(type);
    if (favor ~= nil) then
        local favorPower = favor:getPower();
        local party = master:getParty(true);
        if (party ~= nil) then
            for i,member in ipairs(party) do
                member:addStatusEffect(type, favorPower, 0, 300);
            end
        end
    end


    master:delStatusEffect(EFFECT_ASTRAL_FLOW);
    target:delHP(damage);
    target:updateEnmityFromDamage(pet,damage);
    pet:delHP(99999);

    return damage;
end

function getEffects(effectList, target, effectTypes)
    local counter = 0;
    for i,effectType in ipairs(effectTypes) do
        local effect = target:getStatusEffect(effectType);
        if (effect ~= nil) then
            counter = counter + 1;
            effectList[counter] = effectType;
        end
    end

    return effectList, counter;
end

function removeNegative(target, times)
    if (times == nil) then times = 100; end
    local negatives = {
        EFFECT_POISON,
        EFFECT_POISON_II,
        EFFECT_SILENCE,
        EFFECT_AMNESIA,
        EFFECT_ADDLE,
        EFFECT_CHARM_I,
        EFFECT_CHARM_II,
        EFFECT_SLEEP_I,
        EFFECT_SLEEP_II,
        EFFECT_BIND,
        EFFECT_DISEASE,
        EFFECT_PLAGUE,
        EFFECT_PARALYSIS,
        EFFECT_PARALYSIS_II,
        EFFECT_SLOW,
        EFFECT_SLOW_II,
        EFFECT_ATTACK_DOWN,
        EFFECT_ATTACK_DOWN_II,
        EFFECT_MAGIC_ATK_DOWN,
        EFFECT_MAGIC_ATK_DOWN_II,
        EFFECT_ACCURACY_DOWN,
        EFFECT_ACCURACY_DOWN_II,
        EFFECT_MAGIC_ACC_DOWN,
        EFFECT_MAGIC_ACC_DOWN_II,
        EFFECT_EVASION_DOWN,
        EFFECT_EVASION_DOWN_II,
        EFFECT_MAGIC_EVASION_DOWN,
        EFFECT_MAGIC_EVASION_DOWN_II,
        EFFECT_VIT_DOWN,
        EFFECT_STR_DOWN,
        EFFECT_AGI_DOWN,
        EFFECT_INT_DOWN,
        EFFECT_CHR_DOWN,
        EFFECT_MND_DOWN,
        EFFECT_DEX_DOWN,
        EFFECT_WEIGHT,
        EFFECT_WEIGHT_II,
        EFFECT_DIA,
        EFFECT_BIO,
        EFFECT_BLINDNESS,
        EFFECT_REQUIEM,
        EFFECT_ELEGY,
        EFFECT_BURN,
        EFFECT_FROST,
        EFFECT_CHOKE,
        EFFECT_RASP,
        EFFECT_DROWN,
        EFFECT_SHOCK
    };

    local removed = 0;
    local effects, counter = getEffects(negatives, target);
    while (times > 0) do
        if (counter == 0) then
            return removed;
        end

        local randEffect = effects[math.random(1, counter)];
        target:delStatusEffect(randEffect);
        effects.remove(counter);
        removed = removed + 1;
        counter = counter - 1;
        times = times - 1;
    end

    return removed;
end

function AutomatonFinalAdjustments(target, pet, skill, damage)
    local master = pet:getMaster();
    local dark = master:getEffectsCount(EFFECT_DARK_MANEUVER);
    local fire = master:getEffectsCount(EFFECT_FIRE_MANEUVER);
    local light = master:getEffectsCount(EFFECT_LIGHT_MANEUVER);
    if (pet:hasAttachment(8677) and dark > 0 and damage > 0) then -- Smoke Screen
        print("Blind");
        local success = MobStatusEffectMove(pet, target, EFFECT_BLINDNESS, 25, 0, 60);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_BLINDNESS);
        end
    end

    if (pet:hasAttachment(8455) and fire > 0 and damage > 0) then -- Flame Holder
        damage = damage * (1 + fire * 0.15);
        if (fire == 3) then damage = damage * 1.10 end;
        master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
        master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
        master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
    end

    if (pet:hasAttachment(8651) and light > 0 and damage > 0) then -- Arcanic Cell
        pet:addMP(damage * (light * 0.15));
    end

    return damage;
end


function elementalBreathCalc(pet, target, skill, action, element)
    require("scripts/globals/ability");
    local master = pet:getMaster()
    ---------- Deep Breathing ----------
    -- 0 for none
    -- 1 for first merit
    -- 0.25 for each merit after the first
    -- TODO: 0.1 per merit for augmented AF2 (10663 *w/ augment*)
    local deep = 1;
    if (pet:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST) == true) then
        deep = 1 + (50 + (master:getMerit(MERIT_DEEP_BREATHING))*5) / 100;
        pet:delStatusEffect(EFFECT_MAGIC_ATK_BOOST);
    end

    local gear = master:getMod(MOD_WYVERN_BREATH)/256; -- Master gear that enhances breath

    local tpBonus = 1 + (pet:getTP() / 1200);
    pet:setTP(0)


    local dmgmod = MobBreathMove(pet, target, 0.185, pet:getMainLvl()*15, element); -- Works out to (hp/6) + 15, as desired
    dmgmod = dmgmod * deep * (1 + gear / 100) * tpBonus;

    local dmg = AbilityFinalAdjustments(dmgmod,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
