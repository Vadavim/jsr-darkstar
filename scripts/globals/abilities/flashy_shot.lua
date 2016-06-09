-----------------------------------
-- Ability: Flashy Shot
-----------------------------------

require("scripts/globals/settings");
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
    local bonus = player:getMerit(MERIT_FLASHY_SHOT);
    player:addStatusEffect(EFFECT_FLASHY_SHOT,10 + bonus,0,180);
    return EFFECT_FLASHY_SHOT;
end;