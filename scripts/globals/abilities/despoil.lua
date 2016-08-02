-----------------------------------
-- Ability: Steal
-- Steal items from enemy.
-- Obtained: Thief Level 5
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local effects = {
        {EFFECT_ATTACK_DOWN, EFFECT_ATTACK_BOOST, 25},
        {EFFECT_DEFENSE_DOWN, EFFECT_DEFENSE_BOOST, 25},
        {EFFECT_ACCURACY_DOWN, EFFECT_ACCURACY_BOOST, 25},
        {EFFECT_EVASION_DOWN, EFFECT_EVASION_BOOST, 25},
        {EFFECT_MAGIC_EVASION_DOWN, EFFECT_MAGIC_EVASION_BOOST, 40},
        {EFFECT_MAGIC_ATK_DOWN, EFFECT_MAGIC_ATK_BOOST, 30},
        {EFFECT_MAGIC_DEF_DOWN, EFFECT_MAGIC_DEF_BOOST, 30},
        {EFFECT_INHIBIT_TP, EFFECT_STORE_TP, 40},
        {EFFECT_CRIT_HIT_EVASION_DOWN, EFFECT_POTENCY, 10},
    };

    local filteredEffects = {};
    local filteredSize = 0;
    for i,v in pairs(effects) do
        if (not target:hasStatusEffect(v[1])) then
            table.insert(filteredEffects, v);
            filteredSize = filteredSize + 1;
        end
    end

    if (filteredSize == 0) then
        return 0;
    end

    local thfLevel = player:getMainLvl();

    local stealMod = player:getMod(MOD_STEAL);

    local stealChance = 80 + stealMod * 2 + thfLevel - target:getMainLvl() + player:getStat(MOD_AGI) - target:getStat(MOD_AGI);
    if (math.random(100) <= stealChance) then
        local effect = filteredEffects[math.random(1, filteredSize)];
        target:addStatusEffect(effect[1], effect[3], 0, 90);
        player:addStatusEffect(effect[2], effect[3], 0, 90);
        target:setPendingMessage(278, effect[1]);
        player:setPendingMessage(280, effect[2]);
    end

    return 0;
end;

