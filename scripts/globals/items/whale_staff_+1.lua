-----------------------------------------
-- ID: 17534
-- Item: Whale Staff +1
-- Additional Effect: Water Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 100, ELE_WATER, 8, 15);
end;