-----------------------------------------
-- Item: Water Arrow
-- Additional Effect: Water Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/jsr_item");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local stat = MOD_MND;
    if (player:getStat(MOD_INT) > player:getStat(MOD_MND)) then
        stat = MOD_INT;
    end

    return elementalArrowEffect(player, target, damage, ELE_WIND, stat);
end;