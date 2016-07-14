-----------------------------------------
-- ID: 17414
-- Item: Pixie Mace
-- Additional Effect: Light Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 40, ELE_LIGHT, 4,8);
end;