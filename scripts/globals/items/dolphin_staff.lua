-----------------------------------------
-- ID: 17134
-- Item: Dolphin Staff
-- Additional Effect: Water Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 100, ELE_WATER, 4, 12);
end;