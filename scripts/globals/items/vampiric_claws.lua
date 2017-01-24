-----------------------------------------
-- ID: 17510
-- Item: Vampiric Claws
-- Additional effect: HP Drain
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponDrain(player, target, damage, 100, DRAIN_HP, 5, 8)
end;