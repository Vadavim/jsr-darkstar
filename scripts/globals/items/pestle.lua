-----------------------------------------
-- ID: 18599
-- Item: Pestle
-- Additional effect: MP Drain
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    return weaponDrain(player, target, damage, 50, DRAIN_MP, 3, 8)
end;