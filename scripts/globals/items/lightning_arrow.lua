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

    -- Shock effect
    local resist = applyResistanceAbility(player, target, ELE_THUNDER, SKILL_ARC, 0);
    if (resist > 0.125) then
        local power = getElementalDebuffDOT(player:getStat(stat));
        if (player:hasStatusEffect(EFFECT_FLASHY_SHOT)) then
            power = math.floor(power * 1.33);
        end

        -- Remove Drown
        if (target:getStatusEffect(EFFECT_DROWN) ~= nil) then
            target:delStatusEffect(EFFECT_DROWN);
        end;

        target:addStatusEffect(EFFECT_SHOCK,power, 3, 60 * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_SHOCK);
    end

    return elementalArrowEffect(player, target, damage, ELE_THUNDER, stat);
end;