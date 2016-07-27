-----------------------------------------
-- ID: 16927
-- Item: Busuto
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 30, ELE_WATER, EFFECT_POISON, 7, 30);
end;