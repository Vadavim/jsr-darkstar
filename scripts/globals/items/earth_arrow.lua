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

    -- Rasp effect
    local resist = applyResistanceAbility(player, target, ELE_EARTH, SKILL_ARC, 0);
    if (resist > 0.125) then
        local power = getElementalDebuffDOT(player:getStat(stat));

        -- Remove Shock
        if (target:getStatusEffect(EFFECT_SHOCK) ~= nil) then
            target:delStatusEffect(EFFECT_SHOCK);
        end;

        target:addStatusEffect(EFFECT_RASP,power, 3, 60 * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_RASP);
    end

    return elementalArrowEffect(player, target, damage, ELE_EARTH, stat);
end;