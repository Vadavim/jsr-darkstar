-----------------------------------------
-- ID: 16784
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponDispel(player, target, 70, ELE_DARK);
end;