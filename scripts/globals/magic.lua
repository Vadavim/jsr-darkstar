require("scripts/globals/magicburst");
require("scripts/globals/status");
require("scripts/globals/weather");
require("scripts/globals/utils");
require("scripts/globals/settings");

    MMSG_BUFF_FAIL = 75;

DRAIN_HP = 0;
DRAIN_MP = 1;
DRAIN_TP = 2;
    DIVINE_MAGIC_SKILL     = 32;
    HEALING_MAGIC_SKILL    = 33;
    ENHANCING_MAGIC_SKILL  = 34;
    ENFEEBLING_MAGIC_SKILL = 35;
    ELEMENTAL_MAGIC_SKILL  = 36;
    DARK_MAGIC_SKILL       = 37;
    NINJUTSU_SKILL         = 39;
    SUMMONING_SKILL        = 38;
    SINGING_SKILL          = 40;
    STRING_SKILL           = 41;
    WIND_SKILL             = 42;
    BLUE_SKILL             = 43;

    FIRESDAY      = 0;
    EARTHSDAY     = 1;
    WATERSDAY     = 2;
    WINDSDAY      = 3;
    ICEDAY        = 4;
    LIGHTNINGDAY  = 5;
    LIGHTSDAY     = 6;
    DARKSDAY      = 7;

    ELE_NONE      = 0;
    ELE_FIRE      = 1;
    ELE_EARTH     = 2;
    ELE_WATER     = 3;
    ELE_WIND      = 4;
    ELE_ICE       = 5;
    ELE_LIGHTNING = 6;
    -- added both because monsterstpmoves calls it thunder
    ELE_THUNDER   = 6;
    ELE_LIGHT     = 7;
    ELE_DARK      = 8;

    dayStrong = {FIRESDAY, EARTHSDAY, WATERSDAY, WINDSDAY, ICEDAY, LIGHTNINGDAY, LIGHTSDAY, DARKSDAY};
    dayWeak = {WATERSDAY, WINDSDAY, LIGHTNINGDAY, ICEDAY, FIRESDAY, EARTHSDAY, DARKSDAY, LIGHTSDAY};
    singleWeatherStrong = {WEATHER_HOT_SPELL, WEATHER_DUST_STORM, WEATHER_RAIN, WEATHER_WIND, WEATHER_SNOW, WEATHER_THUNDER, WEATHER_AURORAS, WEATHER_GLOOM};
    doubleWeatherStrong = {WEATHER_HEAT_WAVE, WEATHER_SAND_STORM, WEATHER_SQUALL, WEATHER_GALES, WEATHER_BLIZZARDS, WEATHER_THUNDERSTORMS, WEATHER_STELLAR_GLARE, WEATHER_DARKNESS};
    singleWeatherWeak = {WEATHER_RAIN, WEATHER_WIND, WEATHER_THUNDER, WEATHER_SNOW, WEATHER_HOT_SPELL, WEATHER_DUST_STORM, WEATHER_GLOOM, WEATHER_AURORAS};
    doubleWeatherWeak = {WEATHER_SQUALL, WEATHER_GALES, WEATHER_THUNDERSTORMS, WEATHER_BLIZZARDS, WEATHER_HEAT_WAVE, WEATHER_SAND_STORM, WEATHER_DARKNESS, WEATHER_STELLAR_GLARE};
    elementalObi = {MOD_FORCE_FIRE_DWBONUS, MOD_FORCE_EARTH_DWBONUS, MOD_FORCE_WATER_DWBONUS, MOD_FORCE_WIND_DWBONUS, MOD_FORCE_ICE_DWBONUS, MOD_FORCE_LIGHTNING_DWBONUS, MOD_FORCE_LIGHT_DWBONUS, MOD_FORCE_DARK_DWBONUS};
    elementalObiWeak = {MOD_FORCE_WATER_DWBONUS, MOD_FORCE_WIND_DWBONUS, MOD_FORCE_LIGHTNING_DWBONUS, MOD_FORCE_ICE_DWBONUS, MOD_FORCE_FIRE_DWBONUS, MOD_FORCE_EARTH_DWBONUS, MOD_FORCE_DARK_DWBONUS, MOD_FORCE_LIGHT_DWBONUS};
    spellAcc = {MOD_FIREACC, MOD_EARTHACC, MOD_WATERACC, MOD_WINDACC, MOD_ICEACC, MOD_THUNDERACC, MOD_LIGHTACC, MOD_DARKACC};
    spellAtt = {MOD_FIREATT, MOD_EARTHATT, MOD_WATERATT, MOD_WINDATT, MOD_ICEATT, MOD_THUNDERATT, MOD_LIGHTATT, MOD_DARKATT};
    strongAffinityDmg = {MOD_FIRE_AFFINITY_DMG, MOD_EARTH_AFFINITY_DMG, MOD_WATER_AFFINITY_DMG, MOD_WIND_AFFINITY_DMG, MOD_ICE_AFFINITY_DMG, MOD_THUNDER_AFFINITY_DMG, MOD_LIGHT_AFFINITY_DMG, MOD_DARK_AFFINITY_DMG};
    strongAffinityAcc = {MOD_FIRE_AFFINITY_ACC, MOD_EARTH_AFFINITY_ACC, MOD_WATER_AFFINITY_ACC, MOD_WIND_AFFINITY_ACC, MOD_ICE_AFFINITY_ACC, MOD_THUNDER_AFFINITY_ACC, MOD_LIGHT_AFFINITY_ACC, MOD_DARK_AFFINITY_ACC};
    resistMod = {MOD_FIRERES, MOD_EARTHRES, MOD_WATERRES, MOD_WINDRES, MOD_ICERES, MOD_THUNDERRES, MOD_LIGHTRES, MOD_DARKRES};
    defenseMod = {MOD_FIREDEF, MOD_EARTHDEF, MOD_WATERDEF, MOD_WINDDEF, MOD_ICEDEF, MOD_THUNDERDEF, MOD_LIGHTDEF, MOD_DARKDEF};
    absorbMod = {MOD_FIRE_ABSORB, MOD_EARTH_ABSORB, MOD_WATER_ABSORB, MOD_WIND_ABSORB, MOD_ICE_ABSORB, MOD_LTNG_ABSORB, MOD_LIGHT_ABSORB, MOD_DARK_ABSORB};
    nullMod = {MOD_FIRE_NULL, MOD_EARTH_NULL, MOD_WATER_NULL, MOD_WIND_NULL, MOD_ICE_NULL, MOD_LTNG_NULL, MOD_LIGHT_NULL, MOD_DARK_NULL};
    blmMerit = {MERIT_FIRE_MAGIC_POTENCY, MERIT_EARTH_MAGIC_POTENCY, MERIT_WATER_MAGIC_POTENCY, MERIT_WIND_MAGIC_POTENCY, MERIT_ICE_MAGIC_POTENCY, MERIT_LIGHTNING_MAGIC_POTENCY};
    rdmMerit = {MERIT_FIRE_MAGIC_ACCURACY, MERIT_EARTH_MAGIC_ACCURACY, MERIT_WATER_MAGIC_ACCURACY, MERIT_WIND_MAGIC_ACCURACY, MERIT_ICE_MAGIC_ACCURACY, MERIT_LIGHTNING_MAGIC_ACCURACY};
    blmAMIIMerit = {MERIT_FLARE_II, MERIT_QUAKE_II, MERIT_FLOOD_II, MERIT_TORNADO_II, MERIT_FREEZE_II, MERIT_BURST_II};
    barSpells = {EFFECT_BARFIRE, EFFECT_BARSTONE, EFFECT_BARWATER, EFFECT_BARAERO, EFFECT_BARBLIZZARD, EFFECT_BARTHUNDER};



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


local subEffectTable = {
    [EFFECT_POISON] = SUBEFFECT_POISON,
    [EFFECT_PARALYSIS] = SUBEFFECT_PARALYSIS,
    [EFFECT_BLINDNESS] = SUBEFFECT_BLIND,
    [EFFECT_SILENCE] = SUBEFFECT_SILENCE,
    [EFFECT_SLOW] = SUBEFFECT_EVASION_DOWN,
    [EFFECT_EVASION_DOWN] = SUBEFFECT_EVASION_DOWN,
    [EFFECT_AMNESIA] = SUBEFFECT_AMNESIA,
    [EFFECT_ATTACK_DOWN] = SUBEFFECT_ATTACK_DOWN,
    [EFFECT_CHOKE] = SUBEFFECT_CHOKE,
    [EFFECT_CURSE_I] = SUBEFFECT_CURSE,
    [EFFECT_KO] = SUBEFFECT_DEATH,
    [EFFECT_PETRIFICATION] = SUBEFFECT_PETRIFY, [EFFECT_DISEASE] = SUBEFFECT_PLAGUE, [EFFECT_PLAGUE] = SUBEFFECT_PLAGUE,
    [EFFECT_SLEEP_I] = SUBEFFECT_SLEEP, [EFFECT_STUN] = SUBEFFECT_STUN, [EFFECT_WEIGHT] = SUBEFFECT_EVASION_DOWN,
    [EFFECT_BIND] = SUBEFFECT_EVASION_DOWN, [EFFECT_DEFENSE_DOWN] = SUBEFFECT_DEFENSE_DOWN, [EFFECT_SILENCE] = SUBEFFECT_SILENCE,
};



-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- V - The base damage of the spell
-- M - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually MOD_INT , except for things like Banish which is MOD_MND)
-- hasMultipleTargetReduction - true ifdamage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
SOFT_CAP = 60; --guesstimated
HARD_CAP = 120; --guesstimated


function doDarkKnightBonusDamage(player, damage)
    if ((player:getMainJob() ~= 8) and (player:getSubJob() ~= 8)) then
        return damage;
    end

    local missing = (player:getMaxHP() - player:getHP()) / 2;
    local bonus = 1 + (100 - player:getHPP()) / 200;
    if (player:getSubJob() == JOBS.DRK and bonus > 1) then
        bonus = 1 + (bonus - 1) / 2;
    end
    return math.floor(damage + bonus);
end

function doOccultAcumen(player, spell)
    local acumen = player:getMod(MOD_OCCULT_ACUMEN);
    if (acumen == 0) then
        return
    end

    local mp = spell:getMPCost();
    local time = spell:castTime();
    local level = player:getMainLvl();

    local tp = acumen + (100 * ((1 + mp) / (level + 10)));
--    tp = tp * ((time + 500) / 3000);
    player:addTP(tp);
end

function calculateMagicDamage(V,M,player,spell,target,skilltype,atttype,hasMultipleTargetReduction)

    local dint = player:getStat(atttype) - target:getStat(atttype);
    local dmg = V;

    if (dint<=0) then --ifdINT penalises, it's always M=1
        dmg = dmg + dint;
        if (dmg <= 0) then --dINT penalty cannot result in negative damage (target absorption)
            return 0;
        end
    elseif (dint > 0 and dint <= SOFT_CAP) then --The standard calc, most spells hit this
        dmg = dmg + (dint*M);
    elseif (dint > 0 and dint > SOFT_CAP and dint < HARD_CAP) then --After SOFT_CAP, INT is only half effective
        dmg = dmg + SOFT_CAP*M + ((dint-SOFT_CAP)*M)/2;
    elseif (dint > 0 and dint > SOFT_CAP and dint >= HARD_CAP) then --After HARD_CAP, INT has no effect.
        dmg = dmg + HARD_CAP*M;
    end


    if (skilltype == DIVINE_MAGIC_SKILL and target:isUndead()) then
        -- 150% bonus damage
        dmg = dmg * 1.5;
    end

    -- printf("dmg: %d dint: %d\n", dmg, dint);

    dmg = doDarkKnightBonusDamage(player, dmg);
    doOccultAcumen(player, spell);
    return dmg;

end;

function doBoostGain(caster,target,spell,effect)
    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    --calculate potency
    local magicskill = target:getSkillLevel(ENHANCING_MAGIC_SKILL);

    local potency = math.floor((magicskill - 300) / 10) + 5;

    if (potency > 25) then
        potency = 25;
    elseif (potency < 5) then
        potency = 5;
    end

    --printf("BOOST-GAIN: POTENCY = %d", potency);

    --Only one Boost Effect can be active at once, so if the player has any we have to cancel & overwrite
    local effectOverwrite = {80, 81, 82, 83, 84, 85, 86};

    for i, effect in ipairs(effectOverwrite) do
            --printf("BOOST-GAIN: CHECKING FOR EFFECT %d...",effect);
            if (caster:hasStatusEffect(effect)) then
                --printf("BOOST-GAIN: HAS EFFECT %d, DELETING...",effect);
                caster:delStatusEffect(effect);
            end
    end

    if (target:addStatusEffect(effect,potency,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end
end;

function doEnspell(caster,target,spell,effect)

    if (effect==EFFECT_BLOOD_WEAPON) then
        target:addStatusEffect(EFFECT_BLOOD_WEAPON,1,0,60);
        return;
    end

    if (effect==EFFECT_SOUL_ENSLAVEMENT) then
        target:addStatusEffect(EFFECT_SOUL_ENSLAVEMENT,1,0,30);
        return;
    end

    local duration = 300;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end
    --calculate potency
    local magicskill = target:getSkillLevel(ENHANCING_MAGIC_SKILL);

    local potency = 3 + math.floor((6*magicskill)/100);
    if (magicskill>200) then
        potency = 5 + math.floor((5*magicskill)/100);
    end

    if (caster:hasStatusEffect(EFFECT_EBULLIENCE)) then
        potency = potency * 1.5;
    end


    if (target:addStatusEffect(effect,potency,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end
end;


 ---------------------------------
 --   getCurePower returns the caster's cure power
 --   getCureFinal returns the final cure amount
 --   Source: http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
 ---------------------------------
 function getCurePower(caster,isBlueMagic)
    local MND = caster:getStat(MOD_MND);
    local VIT = caster:getStat(MOD_VIT);
    local skill = caster:getSkillLevel(HEALING_MAGIC_SKILL) + caster:getMod(MOD_HEALING);
    local power = math.floor(MND/2) + math.floor(VIT/4) + skill;
    return power;
end;
function getCurePowerOld(caster)
    local MND = caster:getStat(MOD_MND);
    local VIT = caster:getStat(MOD_VIT);
    local skill = caster:getSkillLevel(HEALING_MAGIC_SKILL) + caster:getMod(MOD_HEALING);--it's healing magic skill for the BLU cures as well
    local power = ((3 * MND) + VIT + (3 * math.floor(skill/5)));
    return power;
end;
function getBaseCure(power,divisor,constant,basepower)
    return ((power - basepower) / divisor) + constant;
end;
function getBaseCureOld(power,divisor,constant)
    return (power / 2) / divisor + constant;
end;

function getCureFinal(caster,spell,basecure,minCure,isBlueMagic)
    if (basecure < minCure) then
        basecure = minCure;
    end

    local potency = 1 + (caster:getMod(MOD_CURE_POTENCY) / 100);
    if (potency > 1.5) then
        potency = 1.5;
    end

    local dSeal = 1;
    if (caster:hasStatusEffect(EFFECT_DIVINE_SEAL)) then
        dSeal = 2;
    end

    local rapture = 1;
    if (isBlueMagic == false) then --rapture doesn't affect BLU cures as they're not white magic
        if (caster:hasStatusEffect(EFFECT_RAPTURE)) then
            rapture = 1.5 + caster:getMod(MOD_RAPTURE_AMOUNT)/100;
        end
    end

    local dayWeatherBonus = 1;
    local ele = spell:getElement();

    local castersWeather = caster:getWeather();

    if (castersWeather == singleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (castersWeather == singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif (castersWeather == doubleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif (castersWeather == doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    local dayElement = VanadielDayElement();
    if (dayElement == dayStrong[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (dayElement == dayWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    end

    if (dayWeatherBonus > 1.4) then
        dayWeatherBonus = 1.4;
    end

    local final = math.floor(math.floor(math.floor(math.floor(basecure) * potency) * dayWeatherBonus) * rapture) * dSeal;
    return final;
end;

function getCureAsNukeFinal(caster,spell,power,divisor,constant,basepower)
    return getCureFinal(caster,spell,power,divisor,constant,basepower);
end;

-----------------------------------
--     Returns the staff bonus for the caster and spell.
-----------------------------------

-- affinities that strengthen/weaken the index element


function AffinityBonusDmg(caster,ele)

    local affinity = caster:getMod(strongAffinityDmg[ele]);
    local bonus = 1.00 + affinity * 0.05; -- 5% per level of affinity
    bonus = bonus + caster:getMod(spellAtt[ele]) / 100; -- add elemental attack
    -- print(bonus);
    return bonus;
end;

function AffinityBonusAcc(caster,ele)

    local affinity = caster:getMod(strongAffinityAcc[ele]);
    local bonus = 0 + affinity * 10; -- 10 acc per level of affinity
    -- print(bonus);
    return bonus;
end;

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
--
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.

function applyResistance(player,spell,target,diff,skill,bonus)
    return applyResistanceEffect(player, spell, target, diff, skill, bonus, nil);
end;

-- USED FOR Status Effect Enfeebs (blind, slow, para, etc.)
-- Output:
-- The factor to multiply down duration (1/2 1/4 1/8 1/16)

function applyResistanceEffect(player,spell,target,diff,skill,bonus,effect)

    -- If Stymie is active, as long as the mob is not immune then the effect is not resisted
    if (effect ~= nil) then -- Dispel's script doesn't have an "effect" to send here, nor should it.
        if (skill == ENFEEBLING_MAGIC_SKILL and player:hasStatusEffect(EFFECT_STYMIE) and target:canGainStatusEffect(effect)) then
            player:delStatusEffect(EFFECT_STYMIE);
            return 1;
        end
    end

    if (skill == SINGING_SKILL and player:hasStatusEffect(EFFECT_TROUBADOUR)) then
        if (math.random(0,99) < player:getMerit(MERIT_TROUBADOUR)-25) then
            return 1.0;
        end
    end

    local element = spell:getElement();
    local percentBonus = 0;
    local magicaccbonus = getSpellBonusAcc(player, target, spell);

    if (skill == SKILL_BLU) then
        local system = target:getSystem();
        local spellSystem = spell:getBase();
        if (strongSystem[spellSystem] == system) then
            magicaccbonus = magicaccbonus + 10;
        elseif (weakSystem[spellSystem] == system) then
            magicaccbonus = magicaccbonus - 10;
        end
    end

    if (diff > 10) then
        magicaccbonus = magicaccbonus + 10 + (diff - 10)/2;
    else
        magicaccbonus = magicaccbonus + diff;
    end

    if (bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

    if(effect ~= nil) then
        percentBonus = percentBonus - getEffectResistance(target, effect);
    end

    local p = getMagicHitRate(player, target, skill, element, percentBonus, magicaccbonus);

    return getMagicResist(p);
end;

-- Applies resistance for things that may not be spells - ie. Quick Draw
function applyResistanceAbility(player,target,element,skill,bonus)
    local p = getMagicHitRate(player, target, skill, element, 0, bonus);

    return getMagicResist(p);
end;

-- Applies resistance for additional effects
function applyResistanceAddEffect(player,target,element,bonus)
    local p = getMagicHitRate(player, target, 0, element, 0, bonus);

    return getMagicResist(p);
end;

function applyResistanceItemEffect(player,target,element,bonus)
    local diff = (player:getStat(MOD_CHR) - target:getStat(MOD_CHR));
    bonus = bonus + math.max(0, diff) + 10;

    local p = getMagicHitRate(player, target, 0, element, 0, bonus);

    return getMagicResist(p);
end;

function getMagicHitRate(caster, target, skillType, element, percentBonus, bonusAcc)
    -- resist everything if magic shield is active
    if (target:hasStatusEffect(EFFECT_MAGIC_SHIELD, 0)) then
        return 0;
    end

    local magiceva = 0;

    if (bonusAcc == nil) then
        bonusAcc = 0;
    end

    -- Get the base acc (just skill + skill mod (79 + skillID = ModID) + magic acc mod)
    local magicacc = caster:getMod(MOD_MACC) + caster:getILvlMacc();

    if (skillType ~= 0) then
--        magicacc = magicacc + caster:getSkillLevel(skillType) + caster:getMod(79 + skillType);
        magicacc = magicacc + caster:getSkillLevel(skillType);

        -- JSR: singing skill also adds instrument (if one exists)
        if (skillType == SKILL_SNG) then
            local iType = caster:getWeaponSkillType(SLOT_RANGED);
            if (iType == SKILL_WND or iType == SKILL_STR) then
                magicacc = magicacc + math.floor(caster:getWeaponSkillLevel(SLOT_RANGED) / 10);
            end

        end

    else
        -- for mob skills / additional effects which don't have a skill
        magicacc = magicacc + utils.getSkillLvl(1, caster:getMainLvl());
    end

    local resMod = 0; -- Some spells may possibly be non elemental, but have status effects.
    if (element ~= ELE_NONE) then
        resMod = target:getMod(resistMod[element]);

        -- Add acc for elemental affinity accuracy and element specific accuracy
        local affinityBonus = AffinityBonusAcc(caster, element);
        local elementBonus = caster:getMod(spellAcc[element]);
        -- print(elementBonus);
        bonusAcc = bonusAcc + affinityBonus + elementBonus;
    end

    -- Base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
    local magiceva = target:getMod(MOD_MEVA) + resMod;

    magicacc = magicacc + bonusAcc;

    return calculateMagicHitRate(magicacc, magiceva, percentBonus, caster:getMainLvl(), target:getMainLvl());
end

function calculateMagicHitRate(magicacc, magiceva, percentBonus, casterLvl, targetLvl)
    local p = 0;
    --add a scaling bonus or penalty based on difference of targets level from caster
    local levelDiff = utils.clamp(casterLvl - targetLvl, -10, 10);

    p = 60 - 0.5 * (magiceva - magicacc) + levelDiff * 2 + percentBonus;

--     printf("P: %f, macc: %f, meva: %f, bonus: %d%%, leveldiff: %d", p, magicacc, magiceva, percentBonus, levelDiff);

    return utils.clamp(p, 5, 95);
end

-- Returns resistance value from given magic hit rate (p)
function getMagicResist(magicHitRate)

    local p = magicHitRate / 100;
    local resist = 1;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half = (1 - p);
    local quart = ((1 - p)^2);
    local eighth = ((1 - p)^3);
    local sixteenth = ((1 - p)^4);
--     print("HALF: "..half);
--     print("QUART: "..quart);
--     print("EIGHTH: "..eighth);
--     print("SIXTEENTH: "..sixteenth);

    local resvar = math.random();

    -- Determine final resist based on which thresholds have been crossed.
    if (resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif (resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif (resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif (resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("1.0");
    end

    return resist;
end


function applyEmbolden(caster, power, duration)
    if (caster:hasStatusEffect(EFFECT_EMBOLDEN)) then
        caster:delStatusEffect(EFFECT_EMBOLDEN);
        return power * 1.5, duration * 0.5;
    end
    return power, duration;
end

-- Returns the amount of resistance the
-- target has to the given effect (stun, sleep, etc..)
function getEffectResistance(target, effect)
    local effectres = 0;
    if (effect == EFFECT_SLEEP_I or effect == EFFECT_SLEEP_II) then
        effectres = MOD_SLEEPRES;
    elseif(effect == EFFECT_LULLABY) then
        effectres = MOD_LULLABYRES;
    elseif (effect == EFFECT_POISON) then
        effectres = MOD_POISONRES;
    elseif (effect == EFFECT_PARALYZE) then
        effectres = MOD_PARALYZERES;
    elseif (effect == EFFECT_BLINDNESS) then
        effectres = MOD_BLINDRES
    elseif (effect == EFFECT_SILENCE) then
        effectres = MOD_SILENCERES;
    elseif (effect == EFFECT_PLAGUE or effect == EFFECT_DISEASE) then
        effectres = MOD_VIRUSRES;
    elseif (effect == EFFECT_PETRIFICATION) then
        effectres = MOD_PETRIFYRES;
    elseif (effect == EFFECT_BIND) then
        effectres = MOD_BINDRES;
    elseif (effect == EFFECT_CURSE_I or effect == EFFECT_CURSE_II or effect == EFFECT_BANE) then
        effectres = MOD_CURSERES;
    elseif (effect == EFFECT_WEIGHT) then
        effectres = MOD_GRAVITYRES;
    elseif (effect == EFFECT_SLOW or effect == EFFECT_ELEGY) then
        effectres = MOD_SLOWRES;
    elseif (effect == EFFECT_STUN) then
        effectres = MOD_STUNRES;
    elseif (effect == EFFECT_CHARM) then
        effectres = MOD_CHARMRES;
    elseif (effect == EFFECT_AMNESIA) then
        effectres = MOD_AMNESIARES;
    end

    if (effectres ~= 0) then
        return target:getMod(effectres);
    end

    return 0;
end;

-- Returns the bonus magic accuracy for any spell
function getSpellBonusAcc(caster, target, spell)
    local magicAccBonus = 0;
    local spellId = spell:getID();
    local element = spell:getElement();
    local castersWeather = caster:getWeather();
    local skill = spell:getSkillType();
    local spellGroup = spell:getSpellGroup();

    if caster:hasStatusEffect(EFFECT_ALTRUISM) and spellGroup == SPELLGROUP_WHITE then
      magicAccBonus = magicAccBonus + caster:getStatusEffect(EFFECT_ALTRUISM):getPower();
    end

    if caster:hasStatusEffect(EFFECT_FOCALIZATION) and spellGroup == SPELLGROUP_BLACK then
      magicAccBonus = magicAccBonus + caster:getStatusEffect(EFFECT_FOCALIZATION):getPower();
    end

    local skillchainTier, skillchainCount = FormMagicBurst(element, target);

    --add acc for BLM AMII spells
    if (spellId == 205 or spellId == 207 or spellId == 209 or spellId == 211 or spellId == 213 or spellId == 215) then
        -- no bonus if the caster has zero merit investment - don't want to give them a negative bonus
        if (caster:getMerit(blmAMIIMerit[element]) ~= 0) then
            -- bonus value granted by merit is 1; subtract 1 since unlock doesn't give an accuracy bonus
            magicAccBonus = magicAccBonus + (caster:getMerit(blmAMIIMerit[element]) - 1) * 5;
        end
    end

    --add acc for skillchains
    if (skillchainTier > 0) then
        magicAccBonus = magicAccBonus + 40; -- JSR: higher bonus to acc for skillchains
    end

    --Add acc for klimaform
    if (caster:hasStatusEffect(EFFECT_KLIMAFORM) and (castersWeather == singleWeatherStrong[element] or castersWeather == doubleWeatherStrong[element])) then
        magicAccBonus = magicAccBonus + 15;
    end

    --Add acc for dark seal
    if (skill == DARK_MAGIC_SKILL and caster:hasStatusEffect(EFFECT_DARK_SEAL)) then
        magicAccBonus = magicAccBonus + 256;
    end

    --add acc for RDM group 1 merits
    if (element > 0 and element <= 6) then
        magicAccBonus = magicAccBonus + caster:getMerit(rdmMerit[element]);
    end

    -- BLU mag acc merits - nuke acc is handled in bluemagic.lua
    if (skill == BLUE_SKILL) then
        magicAccBonus = magicAccBonus + caster:getMerit(MERIT_MAGICAL_ACCURACY);
    end

    return magicAccBonus;
end;

function handleAfflatusMisery(caster, spell, dmg)
    if (caster:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then
        local misery = caster:getMod(MOD_AFFLATUS_MISERY);
        local miseryMax = caster:getMaxHP() / 4;

        -- BGwiki puts the boost capping at 200% bonus at 1/4th max HP.
        if (misery > miseryMax) then
            misery = miseryMax;
        end;

        -- Damage is 2x at boost cap.
        local boost = 1 + (misery / miseryMax);

        dmg = math.floor(dmg * boost);

        local party = caster:getParty(true, false);
        local mostInjured = 100;
        local target = nil;
        if (party ~= nil) then
            for i,member in ipairs(party) do
                if (not (target ~= nil and target:getID() == caster:getID())) then
                    if (member:getHPP() < mostInjured) then
                        mostInjured = member:getHPP();
                        target = member;
                    end
                end
            end
        end
        if (target ~= nil) then
            target:addHP(dmg * 0.33);
        end


        -- printf("AFFLATUS MISERY: Damage boosted by %f to %d", boost, dmg);

        --Afflatus Mod is Used Up...
        caster:setMod(MOD_AFFLATUS_MISERY, 0)
    end
    return dmg;
end;

 function finalMagicAdjustments(caster,target,spell,dmg)
    --Handles target's HP adjustment and returns UNSIGNED dmg (absorb message is set in this function)
    if (caster:isMob()) then dmg = dmg * 0.75; end

    -- handle multiple targets
    if (caster:isSpellAoE(spell:getID())) then
        local total = spell:getTotalTargets();

        if (total > 9) then
            -- ga spells on 10+ targets = 0.4
            dmg = dmg * 0.4;
        elseif (total > 1) then
            -- -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total);
        end

        if (not target:hasStatusEffect(EFFECT_SUBTLE_SORCERY)) then
            if (target:getModelSize() >= 1) then dmg = dmg * 1.25; end
            if (target:getFamily() == 47) then dmg = dmg * 1.33; end
        end

        -- kill shadows
        -- target:delStatusEffect(EFFECT_COPY_IMAGE);
        -- target:delStatusEffect(EFFECT_BLINK);
    else
        -- this logic will eventually be moved here
        -- dmg = utils.takeShadows(target, dmg, 1);

        -- if (dmg == 0) then
            -- spell:setMsg(31);
            -- return 1;
        -- end
    end

    local skill = spell:getSkillType();
    if (skill == ELEMENTAL_MAGIC_SKILL) then
        dmg = dmg * ELEMENTAL_POWER;
    elseif (skill == DARK_MAGIC_SKILL) then
        dmg = dmg * DARK_POWER;
    elseif (skill == NINJUTSU_SKILL) then
        dmg = dmg * NINJUTSU_POWER;
    elseif (skill == DIVINE_MAGIC_SKILL) then
        dmg = dmg * DIVINE_POWER;
    end

    dmg = target:magicDmgTaken(dmg);
    if (caster:hasStatusEffect(EFFECT_CURSE_I)) then
        local factor = 10;
        if (caster:isMob()) then factor = 2; end
        caster:delHP(dmg / factor);
    end

    if (dmg > 0) then
        dmg = dmg - target:getMod(MOD_PHALANX);
        dmg = utils.clamp(dmg, 0, 99999);
    end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg);
    dmg = utils.clamp(dmg, -99999, 99999);

    if (dmg < 0) then
        dmg = target:addHP(-dmg);
        spell:setMsg(7);
    else
        target:delHP(dmg);
        target:handleAfflatusMiseryDamage(dmg);
        target:updateEnmityFromDamage(caster,dmg);
        -- Only add TP if the target is a mob
--        if (target:getObjType() ~= TYPE_PC) then
            local dAGI = 1.0 + utils.clamp((caster:getStat(MOD_AGI) - target:getStat(MOD_AGI)) * 0.75, -30.0, 30.0) / 100;
            target:addTP(100 * dAGI * ( 1 + target:getMod(MOD_STORETP) / 100));
--        end
    end

    return dmg;
 end;

function finalMagicNonSpellAdjustments(caster,target,ele,dmg)
    --Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)

    dmg = target:magicDmgTaken(dmg);
    if (caster:hasStatusEffect(EFFECT_CURSE_I)) then
        local factor = 10;
        if (caster:isMob()) then factor = 2; end
        caster:delHP(dmg / factor);
    end


    if (dmg > 0) then
        dmg = dmg - target:getMod(MOD_PHALANX);
        dmg = utils.clamp(dmg, 0, 99999);
    end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg);

    dmg = utils.clamp(dmg, -99999, 99999);

    if (dmg < 0) then
        dmg = -(target:addHP(-dmg));
    else
        target:delHP(dmg);
    end
    --Not updating enmity from damage, as this is primarily used for additional effects (which don't generate emnity)
    -- in the case that updating enmity is needed, do it manually after calling this
    --target:updateEnmityFromDamage(caster,dmg);

    return dmg;
end;

function adjustForTarget(target,dmg,ele)
    if (dmg > 0 and math.random(0,99) < target:getMod(absorbMod[ele])) then
        if (target:hasStatusEffect(EFFECT_LIEMENT)) then
            target:addMP(dmg * 0.35 * (target:getMod(absorbMod[ele]) / 100));
            return -(dmg * (target:getMod(absorbMod[ele]) / 100));
        end

        return -dmg;
    end
    if (math.random(0,99) < target:getMod(nullMod[ele])) then
        return 0;
    end
    --Moved non element specific absorb and null mod checks to core
    --TODO: update all lua calls to magicDmgTaken with appropriate element and remove this function
    return dmg;
end;

function calculateMagicBurst(caster, spell, target)

    local burst = 1.0;

    if (spell:getSpellGroup() == 3 and not caster:hasStatusEffect(EFFECT_BURST_AFFINITY)) then
        return burst;
    end

    local skillchainTier, skillchainCount = FormMagicBurst(spell:getElement(), target);
	--JSR: higher magic burst damage from skillchain
    if (skillchainTier > 0) then
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

        if (caster:hasStatusEffect(EFFECT_IMMANENCE)) then
            burst = burst + 0.35;
        end

        --add burst bonus for BLM AMII spells
        if (spell:getID() == 205 or spell:getID() == 207 or spell:getID() == 209 or spell:getID() == 211 or spell:getID() == 213 or spell:getID() == 215) then
            if (caster:getMerit(blmAMIIMerit[spell:getElement()]) ~= 0) then -- no bonus if the caster has zero merit investment - don't want to give them a negative bonus
                burst = burst + (caster:getMerit(blmAMIIMerit[spell:getElement()]) - 1) * 0.03; -- bonus value granted by merit is 1; subtract 1 since unlock doesn't give a magic burst bonus
                -- print((caster:getMerit(blmAMIIMerit[spell:getElement()]) - 1) * 0.03)
            end
        end
    end

    -- Add in Magic Burst Bonus Modifier
    if (burst > 1) then
        burst = burst + (caster:getMod(MOD_MAG_BURST_BONUS) / 100);
        target:setLocalVar("xpBonus", target:getLocalVar("xpBonus") + 10);
        --JSR: casters gain MP based on magic burst (TEMP DISABLED)
--        local burstMP = math.floor(burst * spell:getMPCost());
--        caster:doMagicBurstMP(burstMP);
    end

    return burst;
end;

function addBonuses(caster, spell, target, dmg, bonusmab)
    local ele = spell:getElement();

    local affinityBonus = AffinityBonusDmg(caster, ele);
    dmg = math.floor(dmg * affinityBonus);

    if (bonusmab == nil) then
        bonusmab = 0;
    end

    local magicDefense = getElementalDamageReduction(target, ele);
    dmg = math.floor(dmg * magicDefense);

    local dayWeatherBonus = 1.00;
    local weather = caster:getWeather();

    if (weather == singleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (caster:getWeather() == singleWeatherWeak[ele]) then
        if (math.random() < 0.75 or caster:getMod(elementalObiWeak[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif (weather == doubleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif (weather == doubleWeatherWeak[ele]) then
        if (math.random() < 0.75 or caster:getMod(elementalObiWeak[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    local dayElement = VanadielDayElement();
    if (dayElement == dayStrong[ele]) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(MOD_DAY_NUKE_BONUS)/100; -- sorc. tonban(+1)/zodiac ring
        if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (dayElement == dayWeak[ele]) then
        if (math.random() < 0.75 or caster:getMod(elementalObiWeak[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4;
    end

    dmg = math.floor(dmg * dayWeatherBonus);

    local burst = calculateMagicBurst(caster, spell, target);

    if (burst > 1.0) then
        spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
    end

    dmg = math.floor(dmg * burst);
    local mabbonus = 0;

    if (spell:getID() >= 245 and spell:getID() <= 248) then -- Drain/Aspir (II)
        mabbonus = 1 + caster:getMod(MOD_ENH_DRAIN_ASPIR)/100;
        -- print(mabbonus);
    else
        local mab = caster:getMod(MOD_MATT) + bonusmab;

        local mab_crit = caster:getMod(MOD_MAGIC_CRITHITRATE);
        if( math.random(1,100) < mab_crit ) then
           mab = mab + ( 10 + caster:getMod(MOD_MAGIC_CRIT_DMG_INCREASE ) );
        end

        local mdefBarBonus = 0;
        if (ele > 0 and ele <= 6) then
            mab = mab + caster:getMerit(blmMerit[ele]);
            if (target:hasStatusEffect(barSpells[ele])) then -- bar- spell magic defense bonus
                mdefBarBonus = target:getStatusEffect(barSpells[ele]):getSubPower();
            end
        end
        mabbonus = (100 + mab) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus);
    end

    if (mabbonus < 0) then
        mabbonus = 0;
    end

    dmg = math.floor(dmg * mabbonus);

    if (caster:hasStatusEffect(EFFECT_EBULLIENCE)) then
        dmg = dmg * 1.2 + caster:getMod(MOD_EBULLIENCE_AMOUNT)/100;
    end

    dmg = math.floor(dmg);

    -- print(affinityBonus);
    -- print(speciesReduction);
    -- print(dayWeatherBonus);
    -- print(burst);
    -- print(mab);
    -- print(magicDmgMod);

    return dmg;
end;


function addBonusesWeaponskill(caster, ele, target, dmg, params)

    local affinityBonus = AffinityBonusDmg(caster, ele);
    dmg = math.floor(dmg * affinityBonus * affinityBonus);

    local magicDefense = getElementalDamageReduction(target, ele);
    dmg = math.floor(dmg * magicDefense * magicDefense);

    local dayWeatherBonus = 1.00;
    local weather = caster:getWeather();

    if (weather == singleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.15;
            end
        end
        if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.15;
        end
    elseif (caster:getWeather() == singleWeatherWeak[ele]) then
        if (math.random() < 0.75 or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.15;
        end
    elseif (weather == doubleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.15;
            end
        end
        if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.35;
        end
    elseif (weather == doubleWeatherWeak[ele]) then
        if (math.random() < 0.75 or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.35;
        end
    end

    local dayElement = VanadielDayElement();
    if (dayElement == dayStrong[ele]) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(MOD_DAY_NUKE_BONUS)/100; -- sorc. tonban(+1)/zodiac ring
        if (math.random() < 0.75 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.15;
        end
    elseif (dayElement == dayWeak[ele]) then
        if (math.random() < 0.75 or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.15;
        end
    end

    if dayWeatherBonus > 1.65 then
        dayWeatherBonus = 1.65;
    end

    dmg = math.floor(dmg * dayWeatherBonus);

    local mab = 1;
    local mdefBarBonus = 0;
    if (ele > 0 and ele <= 6 and target:hasStatusEffect(barSpells[ele])) then -- bar- spell magic defense bonus
    mdefBarBonus = target:getStatusEffect(barSpells[ele]):getSubPower();
    end

    if (params ~= nil and params.bonusmab ~= nil and params.includemab == true) then
        mab = (100 + caster:getMod(MOD_MATT) + params.bonusmab) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus);
    elseif (params == nil or (params ~= nil and params.includemab == true)) then
        mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus);
    end

    if (mab < 0) then
        mab = 0;
    end

    dmg = math.floor(dmg * mab);

    -- print(affinityBonus);
    -- print(speciesReduction);
    -- print(dayWeatherBonus);
    -- print(burst);
    -- print(mab);
    -- print(magicDmgMod);

    return dmg;
end;

function addBonusesAbility(caster, ele, target, dmg, params, dChance)
    if (dChance == nil) then
        dChance = 0.75;
    end


    local affinityBonus = AffinityBonusDmg(caster, ele);
    dmg = math.floor(dmg * affinityBonus);

    local magicDefense = getElementalDamageReduction(target, ele);
    dmg = math.floor(dmg * magicDefense);

    local dayWeatherBonus = 1.00;
    local weather = caster:getWeather();

    if (weather == singleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < dChance or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < dChance or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (caster:getWeather() == singleWeatherWeak[ele]) then
        if (math.random() < dChance or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif (weather == doubleWeatherStrong[ele]) then
        if (caster:getMod(MOD_IRIDESCENCE) >= 1) then
            if (math.random() < dChance or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < dChance or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif (weather == doubleWeatherWeak[ele]) then
        if (math.random() < dChance or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    local dayElement = VanadielDayElement();
    if (dayElement == dayStrong[ele]) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(MOD_DAY_NUKE_BONUS)/100; -- sorc. tonban(+1)/zodiac ring
        if (math.random() < dChance or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (dayElement == dayWeak[ele]) then
        if (math.random() < dChance or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    end

    if dayWeatherBonus > 1.5 then
        dayWeatherBonus = 1.5;
    end

    dmg = math.floor(dmg * dayWeatherBonus);

    local mab = 1;
    local mdefBarBonus = 0;
    if (ele > 0 and ele <= 6 and target:hasStatusEffect(barSpells[ele])) then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(barSpells[ele]):getSubPower();
    end

    if (params ~= nil and params.bonusmab ~= nil and params.includemab == true) then
        mab = (100 + caster:getMod(MOD_MATT) + params.bonusmab) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus);
    elseif (params == nil or (params ~= nil and params.includemab == true)) then
        mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus);
    end

    if (mab < 0) then
        mab = 0;
    end

    dmg = math.floor(dmg * mab);

    if (params.magicburst == true and params.ability ~= nil) then
        local burst = calculateMagicBurstAbility(caster, target, ele);
        if (burst > 1) then
            params.ability:setMsg(379);
            dmg = dmg * burst;
        end
    end


    -- print(affinityBonus);
    -- print(speciesReduction);
    -- print(dayWeatherBonus);
    -- print(burst);
    -- print(mab);
    -- print(magicDmgMod);

    return dmg;
end;

-- get elemental damage reduction
function getElementalDamageReduction(target, element)
    local defense = 1;
    if (element > 0) then
        defense = 1 - (target:getMod(defenseMod[element]) / 256);
--        defense = 1 - (target:getMod(defenseMod[element]) / 100);


        return utils.clamp(defense, 0.0, 2.0);
    end

    return defense;
end

---------------------------------------------------------------------
--     Elemental Debuff Potency functions
---------------------------------------------------------------------

function getElementalDebuffDOT(INT)
    --JSR: elemental DOT is much stronger now
	local DOT = 1 + math.floor(INT / 5);
    --if (INT<= 39) then
    --    DOT = 1;
    --elseif (INT <= 69) then
    --    DOT = 2;
    --elseif (INT <= 99) then
    --    DOT = 3;
    --elseif (INT <= 149) then
    --    DOT = 4;
    --else
    --    DOT = 5;
    --end
    return DOT;
end;

function getElementalDebuffStatDownFromDOT(dot)
    --JSR: elemental debuff is much stronger now
	local stat_down = 5 + math.floor(dot / 2);
    --if (dot == 1) then
    --    stat_down = 5;
    --elseif (dot == 2) then
    --    stat_down = 7;
    --elseif (dot == 3) then
    --    stat_down = 9;
    --elseif (dot == 4) then
    --    stat_down = 11;
    --else
    --    stat_down = 13;
    --end
    return stat_down;
end;

function getHelixDuration(caster)
    --Dark Arts will further increase Helix duration, but testing is ongoing.

    local casterLevel = caster:getMainLvl();
    local duration = 30; --fallthrough
    if (casterLevel <= 39) then
        duration = 30;
    elseif (casterLevel <= 59) then
        duration = 60;
    elseif (casterLevel <= 99) then
        duration = 90;
    end
    return duration;
end;

function isHelixSpell(spell)
    --Dark Arts will further increase Helix duration, but testing is ongoing.

    local id = spell:getID();
    if id >= 278 and id <= 285 then
        return true;
    end
    return false;
end;

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
    -- Process resitances
    local staff = AffinityBonusAcc(caster, spell:getElement());
    -- print("staff=" .. staff);
    local dCHR = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));
    -- print("dCHR=" .. dCHR);
    local resm = applyResistance(caster, spell, target, dCHR, SINGING_SKILL, staff);
    -- print("rsem=" .. resm);

    if (resm < 0.5) then
        -- print("resm resist");
        spell:setMsg(85);
        return EFFECT_THRENODY;
    end


    -- Remove previous Threnody
    target:delStatusEffect(EFFECT_THRENODY);

    local iBoost = caster:getMod(MOD_THRENODY_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    local power = basePower + iBoost*5;
    local duration = baseDuration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    -- JSR: handle DoT
    local DoT = 1 + caster:getStat(MOD_CHR) / 6;
    local element = modifier - 53;
    local params = {};
    params.bonusmab = 0; params.includemab = true;
    DoT = addBonusesAbility(caster, element, target, DoT, params) + iBoost;

    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        DoT = DoT * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
        DoT = DoT * 1.5;
    end

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    -- Set spell message and apply status effect
    target:addStatusEffect(EFFECT_THRENODY, power, 0, duration, 0, modifier, 0);

    -- get the effect so we can add a DoT
    local effect = target:getStatusEffect(EFFECT_THRENODY);
    effect:addMod(MOD_REGEN_DOWN, DoT);
    target:addMod(MOD_REGEN_DOWN, DoT);

    return EFFECT_THRENODY;
end;

function handleNinjutsuDebuff(caster, target, spell, basePower, baseDuration, modifier)
    -- Add new
    target:addStatusEffectEx(EFFECT_NINJUTSU_ELE_DEBUFF, 0, basePower, 0, baseDuration, 0, modifier, 0);
    return EFFECT_NINJUTSU_ELE_DEBUFF;
end;

-- Returns true if you can overwrite the effect
-- Example: canOverwrite(target, EFFECT_SLOW, 25)
function canOverwrite(target, effect, power, mod)
    mod = mod or 1;

    local statusEffect = target:getStatusEffect(effect);

    -- effect not found so overwrite
    if (statusEffect == nil) then
        return true;
    end

    -- overwrite if its weaker
    if (statusEffect:getPower()*mod > power) then
        return false;
    end

    return true;
end

function doElementalNuke(caster, spell, target, spellParams)
    local DMG = 0;
    local V = 0;
    local M = 0;
    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local hasMultipleTargetReduction = spellParams.hasMultipleTargetReduction; --still unused!!!
    local resistBonus = spellParams.resistBonus;
    local mDMG = caster:getMod(MOD_MAGIC_DAMAGE);

    if (caster:isPet()) then
        local master = caster:getMaster()
        dINT = dINT + master:getMod(MOD_CHR);
        if (caster:getSystem() == SYSTEM_ELEMENTAL) then
            resistBonus = resistBonus + master:getMod(MOD_SUMMONING);
        end
    end


    --[[
            Calculate base damage:
            D = mDMG + V + (dINT × M)
            D is then floored
            For dINT reduce by amount factored into the V value (example: at 134 INT, when using V100 in the calculation, use dINT = 134-100 = 34)
      ]]

    if (dINT <= 49) then
        V = spellParams.V0;
        M = spellParams.M0;
        DMG = math.floor(DMG + mDMG + V + (dINT * M));

        if (DMG <= 0) then
            return 0;
        end

    elseif (dINT >= 50 and dINT <= 99) then
        V = spellParams.V50;
        M = spellParams.M50;
        DMG = math.floor(DMG + mDMG + V + ((dINT - 50) * M));

    elseif (dINT >= 100 and dINT <= 199) then
        V = spellParams.V100;
        M = spellParams.M100;
        DMG = math.floor(DMG + mDMG + V + ((dINT - 100) * M));

    elseif (dINT > 199) then
        V = spellParams.V200;
        M = spellParams.M200;
        DMG = math.floor(DMG + mDMG + V + ((dINT - 200) * M));
    end


    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    local mabBonus = 0;
    local maccBonus = 0;
    local burstBonus = 0;
    local returnBonus = 0;
    local card = caster:getMod(MOD_CARDINAL_CHANT);
    if (card > 0) then
        local isRa = spell:getID() >= 828 and spell:getID() <= 839;

        local baseMab = 3 + card * 2;
        local baseMacc = 5 + card * 3;
        local baseReturn = 7 + card * 3;
        local baseBurst = 5 + card * 5;
        if (isRa) then
            baseMab = baseMab + 4;
            baseMacc = baseMacc + 6;
            baseReturn = baseReturn + 5;
            baseBurst = baseBurst + 8;
            if (caster:hasStatusEffect(EFFECT_THEURGIC_FOCUS)) then
                DMG = DMG * 1.5;
                caster:delStatusEffect(EFFECT_THEURGIC_FOCUS);
            end

        end;

        local rot = caster:getRotPos();

        if (rot >= 0 and rot <= 64) then
            maccBonus = ((rot) / 64) * baseMacc;
            mabBonus = ((64 - rot) / 64) * baseMab;
        elseif (rot >= 64 and rot <= 128) then
            burstBonus = ((rot - 64) / 64) * baseBurst;
            maccBonus = ((128 - rot) / 64) * baseMacc;
        elseif (rot >= 128 and rot <= 192) then
            returnBonus = ((rot - 128) / 64) * baseReturn;
            burstBonus = ((192 - rot) / 64) * baseBurst;
        elseif (rot >= 192 and rot <= 255) then
            mabBonus = ((rot - 192) / 64) * baseMab;
            returnBonus = ((255 - rot) / 64) * baseReturn;
        end

        if (caster:hasStatusEffect(EFFECT_COLLIMATED_FERVOR)) then
            mabBonus = mabBonus * 2.5;
            maccBonus = maccBonus * 2.5;
            burstBonus = burstBonus * 2.5;
            returnBonus = returnBonus * 2.5;
            caster:delStatusEffect(EFFECT_COLLIMATED_FERVOR);
        end

        if (caster:hasStatusEffect(EFFECT_IMMANENCE) and spell:getElement() ~= 0) then
            local element = spell:getElement();
            if (element == 1) then
                target:pushSkillchain(33); -- Burning Blade = Liquifaction
            elseif (element == 2) then
                target:pushSkillchain(32); -- Fast Blade: Scission
            elseif (element == 3) then
                target:pushSkillchain(18); -- Shadowstitch: Reverberation
            elseif (element == 4) then
                target:pushSkillchain(4); -- Backhand Blow = Detonation
            elseif (element == 5) then
                target:pushSkillchain(50); -- Frostbite = Induration
            elseif (element == 6) then
                target:pushSkillchain(83); -- Armor Break: Impaction
            end
        end



        caster:addMP(spell:getMPCost() * (returnBonus / 100));

    end


    --get resist multiplier (1x if no resist)
    local diff = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyResistance(caster, spell, target, diff, ELEMENTAL_MAGIC_SKILL, resistBonus + maccBonus);

    --get the resisted damage
    local consume = caster:getStatusEffect(EFFECT_CONSUME_MANA);
    if (consume ~= nil) then
        DMG = DMG + consume:getPower();
        caster:delStatusEffect(EFFECT_CONSUME_MANA);
    end


    DMG = DMG * resist;


    caster:addMod(MOD_MAG_BURST_BONUS, burstBonus);
    DMG = addBonuses(caster, spell, target, DMG, mabBonus);

    --add in target adjustment
    local ele = spell:getElement();
    DMG = adjustForTarget(target, DMG, ele);

    --add in final adjustments
    DMG = finalMagicAdjustments(caster, target, spell, DMG);

    DMG = doDarkKnightBonusDamage(caster, DMG);
    doOccultAcumen(caster, spell);

    local pet = caster:getPet();
    if (pet ~= nil and pet:getLocalVar("isLuopan") == 1 and DMG > 0) then
        local heal = DMG * 0.15;
        if (caster:getMainJob() ~= JOBS.GEO) then heal = heal / 2; end;
        pet:addHP(heal);
    end

    --end


    caster:delMod(MOD_MAG_BURST_BONUS, burstBonus);

    return DMG;
end

function doDivineNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    if (caster:hasStatusEffect(EFFECT_DIVINE_EMBLEM)) then
        V = V * 1.5;
        M = M * 1.5;
        resistBonus = resistBonus + 50;
    end

    local dmg =  doNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus,DIVINE_MAGIC_SKILL,MOD_MND);
    if (caster:hasStatusEffect(EFFECT_DIVINE_EMBLEM)) then
        target:updateEnmityFromDamage(caster,dmg * 0.5);
        caster:delStatusEffect(EFFECT_DIVINE_EMBLEM);
    end

end

function doNinjutsuNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus,mabBonus)
    mabBonus = mabBonus or 0;
    local skill = caster:getSkillLevel(SKILL_NIN) + caster:getMod(MOD_NINJUTSU); -- JSR: Ninjitsu mod counts as double
    local bonusacc = 0;

    if (M == 0.5) then
        V = V * (1 + utils.clamp((skill - 50) * 0.005, 0, 5));
    elseif (M == 1) then
        V = V * (1 + utils.clamp((skill - 150) * 0.005, 0, 5));
    elseif (M == 1.5) then
        bonusacc = bonusacc + 20;
        V = V * 1.3 * (1 + utils.clamp((skill - 200) * 0.005, 0, 8));
    end

    M = M * 2;
    if (caster:getLocalVar("critHit") ~= 0) then
        caster:setLocalVar("critHit", 0);
        mabBonus = mabBonus + 20;
    end

    if (caster:getLocalVar("parried") ~= 0) then
        caster:setLocalVar("parried", 0);
        mabBonus = mabBonus + 20;
    end

    if (caster:getLocalVar("usedWeaponskill") ~= 0) then
        caster:setLocalVar("usedWeaponskill", 0);
        mabBonus = mabBonus + 20;
    end


    mabBonus = mabBonus + caster:getMod(MOD_NIN_NUKE_BONUS); -- "enhances ninjutsu damage" bonus
    if (caster:hasStatusEffect(EFFECT_INNIN) and caster:isBehind(target, 23)) then -- Innin mag atk bonus from behind, guesstimating angle at 23 degrees
        mabBonus = mabBonus + caster:getStatusEffect(EFFECT_INNIN):getPower();
    end
    return doNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus + bonusacc,NINJUTSU_SKILL,MOD_INT,mabBonus);
end

function doNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus,skill,modStat,mabBonus)
    --calculate raw damage
    local dmg = calculateMagicDamage(V,M,caster,spell,target,skill,modStat,hasMultipleTargetReduction);
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster,spell,target,caster:getStat(modStat)-target:getStat(modStat),skill,resistBonus);
    --get the resisted damage
    dmg = dmg*resist;
    if (skill == NINJUTSU_SKILL) then
        if (caster:getMainJob() == JOBS.NIN) then -- NIN main gets a bonus to their ninjutsu nukes
            local ninSkillBonus = 100;
            if (spell:getID() % 3 == 2) then -- ichi nuke spell ids are 320, 323, 326, 329, 332, and 335
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(SKILL_NIN) - 50)/2); -- getSkillLevel includes bonuses from merits and modifiers (ie. gear)
            elseif (spell:getID() % 3 == 0) then -- ni nuke spell ids are 1 more than their corresponding ichi spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(SKILL_NIN) - 125)/2);
            else -- san nuke spell, also has ids 1 more than their corresponding ni spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(SKILL_NIN) - 275)/2);
            end
            ninSkillBonus = utils.clamp(ninSkillBonus, 100, 200); -- bonus caps at +100%, and does not go negative
            dmg = dmg * ninSkillBonus/100;
        end
        -- boost with Futae
        if (caster:hasStatusEffect(EFFECT_FUTAE)) then
            dmg = math.floor(dmg * 1.50);
            caster:delStatusEffect(EFFECT_FUTAE);
        end
    end

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg,mabBonus);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments
    dmg = finalMagicAdjustments(caster,target,spell,dmg);
    return dmg;
end

function doDivineBanishNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    local skill = DIVINE_MAGIC_SKILL;
    local modStat = MOD_MND;


    if (caster:hasStatusEffect(EFFECT_DIVINE_EMBLEM)) then
        V = V * 1.5;
        M = M * 1.5;
        resistBonus = resistBonus + 50;
    end




    --calculate raw damage
    local dmg = calculateMagicDamage(V,M,caster,spell,target,skill,modStat,hasMultipleTargetReduction);




    --get resist multiplier (1x if no resist)
    local misery = caster:getStatusEffect(EFFECT_AFFLATUS_MISERY);
    if (misery ~= nil) then
        resistBonus = resistBonus + misery:getSubPower();
    end

    local resist = applyResistance(caster,spell,target,caster:getStat(modStat)-target:getStat(modStat),skill,resistBonus);
    --get the resisted damage
    dmg = dmg*resist;

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --handling afflatus misery
    if (spell:getID() ~= 21) then
        dmg = handleAfflatusMisery(caster, spell, dmg);
    end

    --add in final adjustments
    dmg = finalMagicAdjustments(caster,target,spell,dmg);

    if (caster:hasStatusEffect(EFFECT_DIVINE_EMBLEM)) then
        target:updateEnmityFromDamage(caster,dmg * 0.5);
        caster:delStatusEffect(EFFECT_DIVINE_EMBLEM);
    end


    return dmg;
end

function calculateDurationForLvl(duration, spellLvl, targetLvl)
    if (targetLvl < spellLvl) then
        return duration * targetLvl / spellLvl;
    end

    return duration;
end

function calculateBarspellPower(caster,enhanceSkill)
    local meritBonus = caster:getMerit(MERIT_BAR_SPELL_EFFECT);
    local equipBonus = caster:getMod(MOD_BARSPELL_AMOUNT);
    --printf("Barspell: Merit Bonus +%d", meritBonus);

    if (enhanceSkill == nil or enhanceSkill < 0) then
        enhanceSkill = 0;
    end

    local power = 40 + 0.2 * enhanceSkill + meritBonus + equipBonus;

    return power;
end

-- Output magic hit rate for all levels
function outputMagicHitRateInfo()
    for casterLvl = 1, 75 do

        printf("");
        printf("-------- CasterLvl: %d", casterLvl);

        for lvlMod = -5, 20 do

            local targetLvl = casterLvl + lvlMod;

            if(targetLvl >= 0) then
                -- assume BLM spell, A+
                local magicAcc = utils.getSkillLvl(6, casterLvl);
                -- assume default monster magic eva, D
                local magicEvaRank = 3;
                local rate = 0;

                local magicEva = utils.getMobSkillLvl(magicEvaRank, targetLvl);

                local dINT = (lvlMod + 1) * -1;

                if (dINT > 10) then
                    magicAcc = magicAcc + 10 + (dINT - 10)/2;
                else
                    magicAcc = magicAcc + dINT;
                end

                local magicHitRate = calculateMagicHitRate(magicAcc, magicEva, 0, casterLvl, targetLvl);

                printf("Lvl: %d vs %d, %d%%, MA: %d, ME: %d", casterLvl, targetLvl, magicHitRate, magicAcc, magicEva);
            end

        end
    end
end;

function doCarol(caster, target, spell, element)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = 20;

    if (sLvl+iLvl > 200) then
        power = power + math.floor((sLvl+iLvl-200) / 10);
    end

    if (power >= 40) then
        power = 40;
    end

    local iBoost = caster:getMod(MOD_CAROL_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost*5;

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
        caster:delStatusEffect(EFFECT_MARCATO);
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_CAROL,power,0,duration,caster:getID(), element, 1)) then
        spell:setMsg(75);
    end

    return EFFECT_CAROL;
end


-- Bard Stuff
function doMadrigal(caster, target, spell, tier)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = 5 * tier + math.floor((sLvl+iLvl) / 20);

    if (power >= 15 * tier) then
        power = 15 * tier + (power - 15 * tier) / 2;
    end

    local iBoost = caster:getMod(MOD_MADRIGAL_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    if (iBoost > 0) then
        power = power + 1 + (iBoost-1)*3;
    end

    power =  power + caster:getMerit(MERIT_MADRIGAL_EFFECT);

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_MADRIGAL,power,0,duration,caster:getID(), 0, tier)) then
        spell:setMsg(75);
    end

    return EFFECT_MADRIGAL;
end

-- Bar Stuff

function doBarStatus(caster, target, spell, effect)
    local meritBonus = caster:getMerit(MERIT_BAR_SPELL_EFFECT);
    --printf("Barspell: Merit Bonus +%d", meritBonus);

    local enhanceSkill = caster:getSkillLevel(34);

    local duration = 180 + enhanceSkill * 2;

    local power = 1 + 0.1 * enhanceSkill;
    if (power > 10) then
        power = 10 + (power - 10) / 2;
    end

    power = power + meritBonus / 2;

    if (caster:hasStatusEffect(EFFECT_PERPETUANCE)) then
        duration = duration * 2;
    end

    if (caster:hasStatusEffect(EFFECT_RAPTURE)) then
        power = power * 1.5;
    end

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    power, duration = applyEmbolden(caster, power, duration);

    target:addStatusEffect(effect,power,0,duration);

    return effect;
end



-- Bard Stuff
function doMarch(caster, target, spell, tier)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = (5 * tier) + math.floor(sLvl + iLvl) / 8;
    if (power >= 38 * tier) then
        power = 38 * tier + (power - 38 * tier) / 2;
    end


    local iBoost = caster:getMod(MOD_MARCH_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost*12;

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    end

    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_MARCH,power,0,duration,caster:getID(), 0, tier)) then
        spell:setMsg(75);
    end

    return EFFECT_MARCH;
end


function doMambo(caster, target, spell, tier)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    -- Since nobody knows the evasion values for mambo, I'll just make shit up! (aka - same as madrigal)
    local power = 5 * tier + math.floor((sLvl+iLvl) / 20);

    if (power >= 15 * tier) then
        power = 15 * tier + (power - 15 * tier) / 2;
    end

    local iBoost = caster:getMod(MOD_MAMBO_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    if (iBoost > 0) then
        power = power + 1 + (iBoost-1)*4;
    end

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    end

    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_MAMBO,power,0,duration,caster:getID(), 0, tier)) then
        spell:setMsg(75);
    end

    return EFFECT_MAMBO;
end

function doRequiem(caster, target, spell, tier)
    local effect = EFFECT_REQUIEM;
    local duration = 30 + tier * 10;

    local pCHR = caster:getStat(MOD_CHR);
    local power = tier * 2 + math.floor(pCHR * 0.1);
    local mCHR = target:getStat(MOD_CHR);
    local dCHR = (pCHR - mCHR);
    local resm = applyResistance(caster,spell,target,dCHR,SINGING_SKILL,0);
    if (resm < 0.5) then
        spell:setMsg(85);--resist message
        return 1;
    end

    local iBoost = caster:getMod(MOD_REQUIEM_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + 1 + (iBoost * tier * 0.5);

    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 2;
        duration = duration * 0.5;
    end
    caster:delStatusEffect(EFFECT_MARCATO);

    -- apply weather / element / mab / etc.
    local params = {}; params.bonusmab = 0; params.includemab = true;
    power = addBonusesAbility(caster, 7, target, power, params, 1.0);

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end


    target:delStatusEffectSilent(effect);
    target:addStatusEffect(effect,power,0,duration);

    return effect;
end


function doMinuet(caster, target, spell, tier)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = (tier * 3) + math.floor((sLvl + iLvl)/10);

    if (power >= tier * 12) then
        power = tier * 12 + (power - tier * 12) / 2;
    end


    local iBoost = caster:getMod(MOD_MINUET_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    if (iBoost > 0) then
        power = power + iBoost * tier;
    end

    power =  power + caster:getMerit(MERIT_MINUET_EFFECT);

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    end

    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_MINUET,power,0,duration,caster:getID(), 0, tier)) then
        spell:setMsg(75);
    end

    return EFFECT_MINUET;
end



function doMinne(caster, target, spell, tier)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = (tier * 5) + math.floor((sLvl + iLvl)/4);

    if (power >= tier * 25) then
        power = tier * 25 + (power - tier * 25) / 2;
    end

    local iBoost = caster:getMod(MOD_MINNE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    if (iBoost > 0) then
        power = power + iBoost * tier * 3;
    end

    power =  power + caster:getMerit(MERIT_MINNE_EFFECT);

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    end

    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_MINNE,power,0,duration,caster:getID(), 0, tier)) then
        spell:setMsg(75);
    end

    return EFFECT_MINNE;
end



function checkPaeon(caster, tier)
    local cost = 100 + tier * 50;
    if (caster:getTP() < cost) then
        return 1;
    else
        return 0;
    end
end

function doPaeon(caster, target, spell, tier)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = tier;
    if (sLvl+iLvl > 50 + tier * 50) then power = power + 1; end
    caster:delTP(100 + tier * 50);

    local iBoost = caster:getMod(MOD_PAEON_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;

    local duration = 120;

    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
        caster:delStatusEffect(EFFECT_MARCATO);
    end

    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_PAEON,power,0,duration,caster:getID(), 0, tier)) then
        spell:setMsg(75);
    end

    return EFFECT_PAEON;
end


function checkEtude(caster, tier)
    local cost = 100;
    print(caster:getTP() < cost);
    if (tier == 2) then cost = 150 end;
    if (caster:getTP() < cost) then
        return 1;
    else
        return 0;
    end
end

function doEtude(caster, target, spell, stat, tier)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = 0;
    local cost = 0;

    if (tier == 1) then
        cost = 100;
        if (sLvl+iLvl <= 181) then
            power = 3;
        elseif ((sLvl+iLvl >= 182) and (sLvl+iLvl <= 235)) then
            power = 4;
        elseif ((sLvl+iLvl >= 236) and (sLvl+iLvl <= 288)) then
            power = 5;
        elseif ((sLvl+iLvl >= 289) and (sLvl+iLvl <= 342)) then
            power = 6;
        elseif ((sLvl+iLvl >= 343) and (sLvl+iLvl <= 396)) then
            power = 7;
        elseif ((sLvl+iLvl >= 397) and (sLvl+iLvl <= 449)) then
            power = 8;
        elseif (sLvl+iLvl >= 450) then
            power = 9;
        end
    elseif (tier == 2) then
        cost = 150;
        if (sLvl+iLvl <= 416) then
            power = 12;
        elseif ((sLvl+iLvl >= 417) and (sLvl+iLvl <= 445)) then
            power = 13;
        elseif ((sLvl+iLvl >= 446) and (sLvl+iLvl <= 474)) then
            power = 14;
        elseif (sLvl+iLvl >= 475) then
            power = 15;
        end
    end

    caster:delTP(cost);

    local iBoost = caster:getMod(MOD_ETUDE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
        caster:delStatusEffect(EFFECT_MARCATO);
    end


    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_ETUDE,power,0,duration,caster:getID(), stat, tier)) then
        spell:setMsg(75);
    end

    return EFFECT_ETUDE;

end

function checkLuopan(caster, target, spell, spellName)
    if (not caster:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA;
    end

    local pet = caster:getPet();
    if (pet ~= nil) then
        if (pet:getLocalVar(spellName) > 0) then
            return MSGBASIC_EFFECT_ALREADY_ACTIVE;
        end
        if (pet:getLocalVar("isLuopan") == 0) then
            return MSGBASIC_ALREADY_HAS_A_PET;
        end

    end
    return 0;
end

function doLuopan(caster, target, spell, spellName, degenBase, degenDivider)
    local pet = caster:getPet();
    if (pet == nil) then
        caster:spawnPet(75);
        pet = caster:getPet();
        pet:addStatusEffect(EFFECT_VOIDWATCHER, 1, 3, 30000);
        pet:setLocalVar("isLuopan", 1);
    end

    pet:setLocalVar("indiCount", pet:getLocalVar("indiCount") + 1);
    pet:setLocalVar("indiDegen", pet:getLocalVar("indiDegen") + degenBase + pet:getMainLvl() / degenDivider);
    local degen = degenBase + pet:getMainLvl() / degenDivider;
    local bonus = 0;
    if (caster:hasStatusEffect(EFFECT_BLAZE_OF_GLORY)) then
        bonus = 50;
        caster:delStatusEffect(EFFECT_BLAZE_OF_GLORY);
        pet:delHP(pet:getHP() / 2);
        pet:addMod(MOD_HPP, -50);
    end

    pet:setLocalVar("mpSpent", pet:getLocalVar("mpSpent") + spell:getMPCost());
    pet:setLocalVar(spellName, 1 + bonus);
end



function calculateMagicBurstAbility(caster, target, element)

    local burst = 1.0;

    local skillchainTier, skillchainCount = FormMagicBurst(element, target);
    --JSR: higher magic burst damage from skillchain
    if (skillchainTier > 0) then
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

    -- Add in Magic Burst Bonus Modifier
    if (burst > 1) then
        burst = burst + (caster:getMod(MOD_MAG_BURST_BONUS) / 100);
        target:setLocalVar("xpBonus", target:getLocalVar("xpBonus") + 10);
        --JSR: casters gain MP based on magic burst (TEMP DISABLED)
        --        local burstMP = math.floor(burst * spell:getMPCost());
        --        caster:doMagicBurstMP(burstMP);
    end

    return burst;
end;


-- outputMagicHitRateInfo();



function weaponElementalDamage(player, target, damage, chance, element, eleMin, eleMax)
    if (math.random(0,99) <= chance + player:getMod(MOD_CHR)) then
        return 0,0,0;
    else
        local dmg = math.random(eleMin,eleMax);
        local params = {};
        params.bonusmab = 0;
        params.includemab = true;
        dmg = addBonusesAbility(player, element, target, dmg, params);
        dmg = dmg * applyResistanceItemEffect(player,target,element,25);
        dmg = adjustForTarget(target,dmg,element);
        dmg = finalMagicNonSpellAdjustments(player,target,element,dmg);

        local message = MSGBASIC_ADD_EFFECT_DMG;
        if (dmg < 0) then
            message = MSGBASIC_ADD_EFFECT_HEAL;
        end
        local subeffect = SUBEFFECT_NONE;
        if (element == ELE_FIRE) then subeffect = SUBEFFECT_FIRE_DAMAGE;
        elseif (element == ELE_WATER) then subeffect = SUBEFFECT_WATER_DAMAGE;
        elseif (element == ELE_ICE) then subeffect = SUBEFFECT_ICE_DAMAGE;
        elseif (element == ELE_WIND) then subeffect = SUBEFFECT_WIND_DMAAGE;
        elseif (element == ELE_EARTH) then subeffect = SUBEFFECT_EARTH_DAMAGE;
        elseif (element == ELE_THUNDER) then subeffect = SUBEFFECT_THUNDER_DAMAGE;
        elseif (element == ELE_LIGHT) then subeffect = SUBEFFECT_LIGHT_DAMAGE;
        elseif (element == ELE_DARK) then subeffect = SUBEFFECT_DARK_DAMAGE;
        end

        return subeffect,message,dmg;
    end
end


function weaponDrain(player, target, damage, chance, drainType, eleMin, eleMax)
    if (math.random(0,99) >= chance + player:getMod(MOD_CHR) * 1.5 or target:isUndead()) then
        return 0,0,0;
    end

    local drain = math.random(eleMin,eleMax);
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    -- drain = addBonusesAbility(player, ELE_DARK, target, drain, params);
    drain = drain * applyResistanceItemEffect(player,target,ELE_DARK,35);
    drain = adjustForTarget(target,drain,ELE_DARK);
    drain = finalMagicNonSpellAdjustments(player,target,ELE_DARK,drain);

    if (drainType == DRAIN_HP) then
        if (drain > target:getHP()) then
            drain = target:getHP();
            target:addHP(-drain);
        end
        return SUBEFFECT_HP_DRAIN, MSGBASIC_ADD_EFFECT_HP_DRAIN, player:addHP(drain);
    elseif (drainType == DRAIN_MP) then
        if (drain > target:getMP()) then
            drain = target:getMP();
            target:addMP(-drain);
        end
        return SUBEFFECT_MP_DRAIN, MSGBASIC_ADD_EFFECT_MP_DRAIN, player:addMP(drain);
    elseif (drainType == DRAIN_TP) then
        if (drain > target:getTP()) then
            drain = target:getTP();
            target:addTP(-drain);
        end
        return SUBEFFECT_TP_DRAIN, MSGBASIC_ADD_EFFECT_TP_DRAIN, player:addTP(drain);
    end
end

function weaponStatus(player, target, chance, element, effect, power, duration, subPower)
    if (math.random(0,99) >= chance + player:getMod(MOD_CHR) * 1.5 or target:hasStatusEffect(effect)) then
        return 0,0,0;
    end

    local effectRes = getEffectResistance(target, effect);
    local resist = applyResistanceItemEffect(player,target,element,-effectRes);
    if (subPower == nil) then subPower = 0 end;
    if (resist >= 0.25) then
        target:addStatusEffect(effect, power, 3, duration * resist, 0, subPower);

        local subEffect = subEffectTable[effect];
        if (subEffect == nil) then subEffect = SUBEFFECT_NONE end;

        return subEffect, MSGBASIC_ADD_EFFECT_STATUS, effect;
    end
    return 0,0,0;

end

function weaponDispel(player, target, chance, element)
    if (math.random(0,99) >= chance + player:getMod(MOD_CHR) * 1.5 or target:hasStatusEffect(effect)) then
        return 0,0,0;
    end

    local resist = applyResistanceItemEffect(player,target,element,0);
    if (resist >= 0.5) then
        local dispel = target:dispelStatusEffect();
        if (dispel == EFFECT_NONE) then
            return 0,0,0;
        end
        return SUBEFFECT_DISPEL, MSGBASIC_ADD_EFFECT_DISPEL, dispel;
    end
    return 0,0,0;

end



