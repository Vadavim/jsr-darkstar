-----------------------------------------
-- ID: 16937
-- Ice Brand
-- Additional Effect: Ice Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 100, ELE_ICE, 3, 8);
end;