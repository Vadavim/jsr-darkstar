-----------------------------------
-- Ability: Ancient Circle
-- Grants resistance, defense, and attack against dragons to party members within the area of effect.
-- Obtained: Dragoon Level 5
-- Recast Time: 5:00
-- Duration: 03:00
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
    local bonus = player:getMerit(MERIT_ANCIENT_CIRCLE_RECAST) / 10;
    target:addStatusEffect(EFFECT_ANCIENT_CIRCLE,8 + bonus,0,180);
end;