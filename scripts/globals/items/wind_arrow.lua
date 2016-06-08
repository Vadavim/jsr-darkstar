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

    -- Choke effect
    local resist = applyResistanceAbility(player, target, ELE_WIND, SKILL_ARC, 0);
    if (resist > 0.125) then
        local power = getElementalDebuffDOT(player:getStat(stat));

        -- Remove Rasp
        if (target:getStatusEffect(EFFECT_RASP) ~= nil) then
            target:delStatusEffect(EFFECT_RASP);
        end;

        target:addStatusEffect(EFFECT_CHOKE,power, 3, 60 * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_CHOKE);
    end

    return elementalArrowEffect(player, target, damage, ELE_WIND, stat);
end;