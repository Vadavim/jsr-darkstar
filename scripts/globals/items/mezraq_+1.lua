-----------------------------------------
-- ID: 18119
-- Item: Dark Mezraq +1
-- Additional Effect: Impairs evasion
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponStatus(player, target, 45, ELE_ICE, EFFECT_EVASION_DOWN, 25, 25);
end;