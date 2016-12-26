-----------------------------------
-- Ability: Flee
-- Increases movement speed.
-- Obtained: Thief Level 25
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------

require("scripts/globals/status");

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
    local duration = 90 + player:getMod(MOD_FLEE_DURATION);
    player:addStatusEffect(EFFECT_FLEE,100,0,duration);
    player:delStatusEffect(EFFECT_WEIGHT);
    player:delStatusEffect(EFFECT_SLOW);
    player:delStatusEffect(EFFECT_BIND);
    player:delStatusEffect(EFFECT_EVASION_DOWN);
end;