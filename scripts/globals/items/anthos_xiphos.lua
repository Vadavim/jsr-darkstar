-----------------------------------------
-- ID: 17750
-- Item: Anthos Xiphos
-- Additional Effect: Water Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 80, ELE_WATER, 2, 5);
end;