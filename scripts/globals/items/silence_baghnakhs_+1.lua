-----------------------------------------
-- ID: 16438
-- Item: Silence baghnakhs +1
-- Additional Effect: Silence
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 30, ELE_WIND, EFFECT_SILENCE, 1, 40);
end;