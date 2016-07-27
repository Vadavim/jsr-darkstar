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
    if (target:getSystem() == SYSTEM_VERMIN) then
        return weaponDrain(player, target, damage, 100, DRAIN_HP, 8, 20)
    end
    return 0, 0, 0;
end;