-----------------------------------------
-- ID: 17117
-- Item: Hypno Staff
-- Additional Effect: Sleep
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 35, ELE_DARK, EFFECT_SLEEP_I, 1, 30);
end;