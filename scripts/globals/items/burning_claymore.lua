-----------------------------------------
-- ID: 16929
-- Item: Burning Claymore
-- Additional Effect: Fire Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 30, ELE_FIRE, 5, 12);
end;