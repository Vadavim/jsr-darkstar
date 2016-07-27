-----------------------------------------
-- ID: 18451
-- Item: Mokusa
-- Additional Effect: Wind Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 100, ELE_WIND, 3, 8);
end;