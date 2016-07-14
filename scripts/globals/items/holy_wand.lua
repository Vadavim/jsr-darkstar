-----------------------------------------
-- ID: 17080
-- Item: Holy Maul
-- Additional Effect: Light Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 15, ELE_LIGHT, 20, 35);
end;