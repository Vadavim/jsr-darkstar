
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
--------------- ADDITIONAL EFFECTS ----------------
local subEffectStatusTable = {
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

local subEffectElementTable = {
    [ELE_WATER] = SUBEFFECT_WATER_DAMAGE,
    [ELE_FIRE] = SUBEFFECT_FIRE_DAMAGE,
    [ELE_ICE] = SUBEFFECT_ICE_DAMAGE,
    [ELE_WIND] = SUBEFFECT_WIND_DAMAGE,
    [ELE_THUNDER] = SUBEFFECT_LIGHTNING_DAMAGE,
    [ELE_DARK] = SUBEFFECT_DARKNESS_DAMAGE,
    [ELE_LIGHT] = SUBEFFECT_LIGHT_DAMAGE,
    [ELE_EARTH] = SUBEFFECT_EARTH_DAMAGE,
};

local effectElements = {
    [EFFECT_POISON] = ELE_WATER, [EFFECT_DROWN] = ELE_WATER, [EFFECT_CHARM_I] = ELE_WATER, [EFFECT_CHARM_II] = ELE_WATER, [EFFECT_ATTACK_DOWN] = ELE_WATER, [EFFECT_STR_DOWN] = ELE_WATER,
    [EFFECT_DISEASE] = ELE_FIRE, [EFFECT_PLAGUE] = ELE_FIRE, [EFFECT_BURN] = ELE_FIRE, [EFFECT_ADDLE] = ELE_FIRE, [EFFECT_AMNESIA] = ELE_FIRE, [EFFECT_MAGIC_ATK_DOWN] = ELE_FIRE, [EFFECT_MAGIC_ACC_DOWN] = ELE_FIRE, [EFFECT_INT_DOWN] = ELE_FIRE,
    [EFFECT_PETRIFICATION] = ELE_EARTH, [EFFECT_GRADUAL_PETRIFICATION] = ELE_EARTH, [EFFECT_SLOW] = ELE_EARTH, [EFFECT_RASP] = ELE_EARTH, [EFFECT_ACCURACY_DOWN] = ELE_EARTH, [EFFECT_DEX_DOWN] = ELE_EARTH,
    [EFFECT_DEFENSE_DOWN] = ELE_WIND, [EFFECT_CHOKE] = ELE_WIND, [EFFECT_MUTE] = ELE_WIND, [EFFECT_SILENCE] = ELE_WIND, [EFFECT_VIT_DOWN] = ELE_WIND,
    [EFFECT_AGI_DOWN] = ELE_ICE, [EFFECT_EVASION_DOWN] = ELE_ICE, [EFFECT_CRIT_HIT_EVASION_DOWN] = ELE_ICE, [EFFECT_FROST] = ELE_ICE, [EFFECT_PARALYSIS] = ELE_ICE, [EFFECT_BIND] = ELE_ICE,
    [EFFECT_MND_DOWN] = ELE_THUNDER, [EFFECT_MAGIC_DEF_DOWN] = ELE_THUNDER, [EFFECT_MAGIC_EVASION_DOWN] = ELE_THUNDER, [EFFECT_SHOCK] = ELE_THUNDER, [EFFECT_STUN] = ELE_THUNDER,
    [EFFECT_BIO] = ELE_DARK, [EFFECT_BLINDNESS] = ELE_DARK, [EFFECT_TERROR] = ELE_DARK, [EFFECT_DOOM] = ELE_DARK, [EFFECT_CURSE_I] = ELE_DARK, [EFFECT_CURSE_II] = ELE_DARK, [EFFECT_BANE] = ELE_DARK, [EFFECT_KO] = ELE_DARK, [EFFECT_SLEEP_I] = ELE_DARK, [EFFECT_SLEEP_II] = ELE_DARK, [EFFECT_CHR_DOWN] = ELE_DARK,
    [EFFECT_DIA] = ELE_LIGHT, [EFFECT_LULLABY] = ELE_LIGHT,
};

function mobAddElement(mob, target, damage, element, params)

    if (params.chance ~= nil and math.random(0, 100) > params.chance) then
        return 0, 0, 0;
    end

    local dmg = 0;
    if (params.damageScale ~= nil) then
        dmg = damage * params.damageScale;
    else
        dmg = math.random(params.min, params.max);
    end

    if (params.includemab == nil) then params.includemab = false; end
    if (params.bonusmab == nil) then params.bonusmab = 0; end
    if (params.bonusAcc == nil) then params.bonusAcc = 0; end
    if (params.diffStat == nil) then params.diffStat = MOD_INT; end
    if (params.effectRes == nil) then params.effectRes = EFFECT_NONE; end

    local subeffect = subEffectElementTable[element];
    if (subeffect == nil) then subeffect = SUBEFFECT_NONE end;
    dmg = addBonusesAbility(mob, element, target, dmg, params);
    local diff = mob:getStat(params.diffStat) - target:getStat(params.diffStat);
    local resist = applyPlayerResistance(mob, params.effectRes, target, diff, params.bonusAcc, element);

    dmg = dmg * resist;
    dmg = adjustForTarget(target,dmg,element);
    dmg = finalMagicNonSpellAdjustments(mob,target,element,dmg);

    return subeffect, MSGBASIC_ADD_EFFECT_DMG, dmg;
end


function mobAddStatus(mob, target, damage, effect, params)
    if (effect == nil) then
        print("[DEBUG]: effect is nil in mobAddStatus");
        return 0,0,0;
    end


    if (target:hasStatusEffect(effect) or  (params.chance ~= nil and math.random(0, 100) > params.chance)) then
        return 0, 0, 0;
    end


    if (params.bonusAcc == nil) then params.bonusAcc = 0; end
    if (params.diffStat == nil) then params.diffStat = MOD_INT; end
    if (params.dur == nil) then params.dur = 0; end
    if (params.power == nil) then params.power = 0; end
    if (params.subPower == nil) then params.subPower = 0; end
    if (params.minResist == nil) then params.minResist = 0.5; end
    if (params.tick == nil) then params.tick = 0; end

    local element = ELE_NONE;
    local effectElement = effectElements[effect];
    if (element == nil) then effectElement = ELE_NONE; end;
    local subeffect = subEffectStatusTable[effect];
    if (subeffect == nil) then subeffect = SUBEFFECT_NONE end;

    local diff = mob:getStat(params.diffStat) - target:getStat(params.diffStat);
    local resist = applyPlayerResistance(mob, effect, target, diff, params.bonusAcc, element);
    if (resist >= params.minResist) then
        target:addStatusEffect(effect, params.power, params.tick, params.dur, 0, params.subPower);
        return subeffect, MSGBASIC_ADD_EFFECT_STATUS, effect;
    end

    return 0, 0, 0;
end





-------------------- ON FIGHT ---------------------

---------------- ON MAGIC PREPARE ----------------------




