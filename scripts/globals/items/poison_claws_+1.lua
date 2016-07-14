-----------------------------------------
-- ID: 16439
-- Item: Poison Claws +1
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 35, ELE_WATER, EFFECT_POISON, 9, 30);
end;
