-----------------------------------------
-- ID: 16784
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    if (target:getSystem() == SYSTEM_UNDEAD) then
        return weaponElementalDamage(player, target, damage, 100, ELE_FIRE, 22, 75);
    end
    return 0, 0, 0;
end;