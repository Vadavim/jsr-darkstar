-----------------------------------------
-- ID: 17071
-- Item: Heat Rod
-- Additional Effect: Lightning Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 15, ELE_LIGHTNING, 12, 24);
end;