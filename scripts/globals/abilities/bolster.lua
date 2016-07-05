-----------------------------------
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

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
    local pet = player:getPet();
    if (pet ~= nil) then pet:addHP(9999) end;
    player:addStatusEffect(EFFECT_BOLSTER,1,0,180);
    return EFFECT_ECLIPTIC_ATTRITION
end;