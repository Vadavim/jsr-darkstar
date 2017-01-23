-----------------------------------------
-- ID: 17114
-- Item: Holy Maul +1
-- Additional Effect: Light Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 25, ELE_LIGHT, 12, 24);
end;