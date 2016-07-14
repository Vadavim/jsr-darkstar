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
    return weaponElementalDamage(player, target, damage, 25, ELE_DARK, 20, 35);
end;