-----------------------------------------
-- ID: 16928
-- Item: Hellfire Sword
-- Additional Effect: Fire Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 30, ELE_FIRE, 8, 15);
end;