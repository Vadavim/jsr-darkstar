-----------------------------------------
-- ID: 16709
-- Item: Inferno Axe
-- Additional Effect: Fire Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 25, ELE_FIRE, 5, 14);
end;