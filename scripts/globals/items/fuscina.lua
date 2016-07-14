-----------------------------------------
-- ID: 18104
-- Item: Fuscina
-- Additional Effect: Lightning Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponElementalDamage(player, target, damage, 20, ELE_THUNDER, 6, 12);
end;