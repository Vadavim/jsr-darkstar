-----------------------------------------
-- ID: 16741
-- Item: Poison Dagger +1
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 30, ELE_WATER, EFFECT_POISON, 17, 30);
end;