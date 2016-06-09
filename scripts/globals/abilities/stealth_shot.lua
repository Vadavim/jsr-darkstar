-----------------------------------
-- Ability: Stealth Shot
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
    local bonus = player:getMerit(MERIT_STEALTH_SHOT);
    player:addStatusEffect(EFFECT_STEALTH_SHOT,20 + bonus * 2,0,180);
    return EFFECT_STEALTH_SHOT;
end;