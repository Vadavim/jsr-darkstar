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

    -- Drown effect
    local resist = applyResistanceAbility(player, target, ELE_WATER, SKILL_ARC, 0);
    if (resist > 0.125) then
        local power = getElementalDebuffDOT(player:getStat(stat));
        if (player:hasStatusEffect(EFFECT_FLASHY_SHOT)) then
            power = math.floor(power * 1.33);
        end

        -- Remove Burn
        if (target:getStatusEffect(EFFECT_BURN) ~= nil) then
            target:delStatusEffect(EFFECT_BURN);
        end;

        target:addStatusEffect(EFFECT_DROWN,power, 3, 60 * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_DROWN);
    end

    return elementalArrowEffect(player, target, damage, ELE_WATER, stat);
end;