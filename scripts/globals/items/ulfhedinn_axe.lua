-----------------------------------------
-- ID: 16784
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local family = target:getFamily();
    if (family == 142 or family == 143) then
        return weaponElementalDamage(player, target, damage, 100, ELE_ICE, 20, 80);
    end
    return 0, 0, 0;
end;