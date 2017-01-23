-----------------------------------------
-- ID: 18503
-- Item: Mammut
-- Additional Effect: Ice Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 50, ELE_ICE, 5, 16);
end;