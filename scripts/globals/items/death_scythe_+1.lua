-----------------------------------------
-- ID: 16791
-- Item: Death Scythe +1
-- Additional Effect: Drains HP
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    return weaponDrain(player, target, damage, 100, DRAIN_HP, 20, 50)
end;