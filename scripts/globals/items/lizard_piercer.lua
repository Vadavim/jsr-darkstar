-----------------------------------------
-- ID: 16784
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    if (target:getSystem() == SYSTEM_LIZARD) then
        return weaponElementalDamage(player, target, damage, 80, ELE_ICE, 4, 10);
    end
    return 0, 0, 0;
end;