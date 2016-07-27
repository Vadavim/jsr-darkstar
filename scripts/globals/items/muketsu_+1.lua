-----------------------------------------
-- ID: 16509
-- Item: Aspir Knife
-- Additional effect: MP Drain
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponDrain(player, target, damage, 60, DRAIN_HP, 4, 10)
end;