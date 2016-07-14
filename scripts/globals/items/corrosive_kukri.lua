-----------------------------------------
-- ID: 16494
-- Item: Corrosive Kukri
-- Additional Effect: Weakens defense
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 30, ELE_WIND, EFFECT_DEFENSE_DOWN, 12, 30);
end;