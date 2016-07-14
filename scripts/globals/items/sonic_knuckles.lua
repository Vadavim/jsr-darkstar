-----------------------------------------
-- ID: 16434
-- Item: Sonic Knuckles
-- Additional Effect: Wind Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 35, ELE_WIND, 8, 20);
end;