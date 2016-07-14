-----------------------------------------
-- ID: Beluga
-- Beluga
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 25, ELE_WATER, 12, 24);
end;