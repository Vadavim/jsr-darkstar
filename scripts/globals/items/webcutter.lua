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
        return weaponStatus(player, target, 65, ELE_THUNDER, EFFECT_STUN, 1, 4);
    end
    return 0, 0, 0;
end;