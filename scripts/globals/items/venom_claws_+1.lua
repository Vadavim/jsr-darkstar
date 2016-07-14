-----------------------------------------
-- ID: 16417
-- Item: Poison Claws
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 35, ELE_WATER, EFFECT_POISON, 12, 30);
end;