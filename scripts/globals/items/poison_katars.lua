-----------------------------------------
-- ID: 16403
-- Item: Poison Katars
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 30, ELE_WATER, EFFECT_POISON, 9, 30);
end;
