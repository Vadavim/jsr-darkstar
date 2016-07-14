-----------------------------------------
-- ID: 18032
-- Item: Adder Jambiya
-- Additional Effect: Impairs evasion
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 30, ELE_ICE, EFFECT_EVASION_DOWN, 10, 60);
end;