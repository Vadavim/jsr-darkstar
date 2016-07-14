-----------------------------------------
-- ID: 16784
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    if (target:getSystem() == SYSTEM_VERMIN) then
        return weaponStatus(player, target, 50, ELE_WIND, EFFECT_WEIGHT, 70, 45);
    end
    return 0, 0, 0;
end;