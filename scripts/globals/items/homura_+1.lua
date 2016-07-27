-----------------------------------------
-- ID: 16986
-- Item: Homura +1
-- Additional Effect: Fire Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 35, ELE_FIRE, 6, 14);
end;