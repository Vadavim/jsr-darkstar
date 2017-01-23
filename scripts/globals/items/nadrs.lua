-----------------------------------------
-- ID: 17650
-- Item: Nadrs
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 30, ELE_WATER, EFFECT_POISON, 10, 30);
end;