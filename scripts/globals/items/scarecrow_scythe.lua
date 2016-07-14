-----------------------------------------
-- ID: 16784
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    if (target:getSystem() == SYSTEM_BIRD) then
        return weaponStatus(player, target, 65, ELE_ICE, EFFECT_BIND, 1, 20);
    end
    return 0, 0, 0;
end;