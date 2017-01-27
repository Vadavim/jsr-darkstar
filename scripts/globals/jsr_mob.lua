
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
    if (params.duration == nil) then params.duration = 0; end
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
        target:addStatusEffect(effect, params.power, params.tick, params.duration * resist, 0, params.subPower);
        return subeffect, MSGBASIC_ADD_EFFECT_STATUS, effect;
    end

    return 0, 0, 0;
end


local function canCast(mob, spellid)
    return mob:getMP() > getSpell(spellid):getMPCost();
end



-------------------- ON FIGHT ---------------------

function timedAbility(mob, target, ability, minDelay, maxDelay)
    local time = mob:getBattleTime();
    if (maxDelay == nil) then maxDelay = minDelay; end;

    local lastTime = mob:getLocalVar("ability_" .. tostring(ability));
    if (lastTime + minDelay < time) then
        mob:useJobAbility(ability, target);
        mob:setLocalVar("ability_" .. tostring(ability), time + math.random(minDelay, maxDelay));
        return true;
    end

    return false;
end

function thresholdAbility(mob, target, ability, thresholdStep)
    if (thresholdStep == nil) then thresholdStep = 25; end;
    local lastThresh = mob:getLocalVar("tability_" .. tostring(ability));
    local missing = 100 - mob:getHPP();

    if (missing >= lastThresh + thresholdStep) then
        mob:setLocalVar("tability_" .. tostring(ability), lastThresh + thresholdStep);
        mob:useJobAbility(ability, target);
        return true;
    end
    return false;
end

function limitedAbility(mob, target, ability, numTimes)
    local times = mob:getLocalVar("lability_" .. tostring(ability));

    if (numTimes < times) then
        mob:setLocalVar("lability_" .. tostring(ability), times + 1);
        mob:useJobAbility(ability, target);
        return true;
    end
    return false;
end



function timedMobAbility(mob, target, ability, minDelay, maxDelay, tpAmount)
    local time = mob:getBattleTime();
    if (maxDelay == nil) then maxDelay = minDelay; end;
    if (tpAmount == nil) then tpAmount = 1000; end;

    local ability_name = ability;

    if (type(ability) == "table") then
        ability_name = ability[1];
        local size = 0;

        for i,v in pairs(ability) do
            size = size + 1;
        end

        ability = ability[math.random(1, size)];
    end


    local lastTime = mob:getLocalVar("mobskill_" .. tostring(ability_name));
--    printf("Last: %d\nCur: %d", lastTime, time);
    if (lastTime + minDelay < time ) then
        mob:setLocalVar("freeMobSkill", tpAmount);
        mob:useMobAbility(ability, target);
        mob:setLocalVar("mobskill_" .. tostring(ability_name), time + math.random(minDelay, maxDelay));
        return true;
    end

    return false;
end

function thresholdMobAbility(mob, target, ability, thresholdStep, tpAmount)
    if (thresholdStep == nil) then thresholdStep = 25; end;
    if (tpAmount == nil) then tpAmount = 1000; end;

    local ability_name = ability;

    if (type(ability) == "table") then
        ability_name = ability[1];
        local size = 0;

        for i,v in pairs(ability) do
            size = size + 1;
        end

        ability = ability[math.random(1, size)];
    end


    local lastThresh = mob:getLocalVar("tmobskill_" .. tostring(ability_name));
    local missing = 100 - mob:getHPP();

    if (missing >= lastThresh + thresholdStep) then
        mob:setLocalVar("freeMobSkill", tpAmount);
        mob:setLocalVar("tmobskill_" .. tostring(ability_name), lastThresh + thresholdStep);
        mob:useMobAbility(ability, target);
        return true;
    end
    return false;
end

function limitedMobAbility(mob, target, ability, numTimes, tpAmount)
    local times = mob:getLocalVar("lmobskill_" .. tostring(ability));
    if (tpAmount == nil) then tpAmount = 1000; end;

    if (times < numTimes) then
        mob:setLocalVar("freeMobSkill", tpAmount);
        mob:setLocalVar("lmobskill_" .. tostring(ability), times + 1);
        mob:useMobAbility(ability, target);
        return true;
    end
    return false;
end




function timedSpell(mob, target, spell, minDelay, maxDelay)
    local time = mob:getBattleTime();
    if (maxDelay == nil) then maxDelay = minDelay; end;

    local lastTime = 0;
    local spell_name = spell;

    if (type(spell) == "table") then
        spell_name = spell[1];
        local size = 0;

        for i,v in pairs(spell) do
            local curTime = mob:getLocalVar("spell_" .. tostring(spell_name));
            if (curTime > lastTime) then lastTime = curTime; end;
            size = size + 1;
        end

        spell = spell[math.random(1, size)];
    else
        lastTime = mob:getLocalVar("spell_" .. tostring(spell_name));
    end

    if (lastTime + minDelay < time) then
        if (not canCast(mob, spell)) then return false; end;
        mob:castSpell(spell, target);
        mob:setLocalVar("spell_" .. tostring(spell_name), time + math.random(minDelay, maxDelay));
        return true;
    end

    return false;
end

function thresholdSpell(mob, target, spell, thresholdStep)
    if (thresholdStep == nil) then thresholdStep = 25; end;
    local lastThresh = mob:getLocalVar("tspell_" .. tostring(spell));
    local missing = 100 - mob:getHPP();

    if (not canCast(mob, spell)) then return false; end;

    if (missing >= lastThresh + thresholdStep) then
        mob:setLocalVar("tspell_" .. tostring(spell), lastThresh + thresholdStep);
        mob:castSpell(spell, target);
        return true;
    end
    return false;
end

function limitedSpell(mob, target, spell, numTimes)
    local times = mob:getLocalVar("lspell_" .. tostring(spell));
    if (not canCast(mob, spell)) then return false; end;

    if (times < numTimes) then
        mob:setLocalVar("lspell_" .. tostring(spell), times + 1);
        mob:castSpell(spell, target);
        return true;
    end
    return false;
end

function mobAbilityFlee(mob, target)
    local effects = {EFFECT_EVASION_DOWN, EFFECT_SLOW, EFFECT_WEIGHT, EFFECT_BIND }
    local hasEffect = false;

    for i,v in pairs(effects) do
        if (mob:hasStatusEffect(v)) then
            hasEffect = true;
        end
    end

    if (hasEffect) then
        mob:useJobAbility(ABILITY_FLEE);
        return true;
    end

    return false;
end

---------------- ON MAGIC PREPARE ----------------------




