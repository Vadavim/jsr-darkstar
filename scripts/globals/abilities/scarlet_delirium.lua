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
    local duration = 60;
    if (player:isPC()) then duration = 120; end;
    player:addStatusEffect(EFFECT_SCARLET_DELIRIUM,25,0,duration);
end;