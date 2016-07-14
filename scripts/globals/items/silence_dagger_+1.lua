-----------------------------------------
-- ID: 16508
-- Item: Silence Dagger +1
-- Additional Effect: Silence
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 35, ELE_WIND, EFFECT_SILENCE, 1, 60);
end;