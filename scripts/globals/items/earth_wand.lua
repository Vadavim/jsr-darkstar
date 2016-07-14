-----------------------------------------
-- ID: 17076
-- Item: Earth Wand
-- Additional Effect: Earth Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 15, ELE_EARTH, 8, 18);
end;