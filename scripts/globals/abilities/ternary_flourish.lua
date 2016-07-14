-----------------------------------
-- Ability: Building Flourish
-- Enhances potency of your next weapon skill. Requires at least one Finishing Move.
-- Obtained: Dancer Level 50
-- Finishing Moves Used: 1-3
-- Recast Time: 00:10
-- Duration: 01:00
--
-- Using one Finishing Move boosts the Accuracy of your next weapon skill.
-- Using two Finishing Moves boosts both the Accuracy and Attack of your next weapon skill.
-- Using three Finishing Moves boosts the Accuracy, Attack and Critical Hit Rate of your next weapon skill.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)

    if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
        return 0,0;
    
    else    
        return MSGBASIC_NO_FINISHINGMOVES,0;
    end;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local duration = 0;

    if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
        duration = 30;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_1);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
        duration = 60;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_2);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
        duration = 90;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_3);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
        duration = 120;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_4);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
        duration = 150;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_5);
    end;
    player:delStatusEffectSilent(EFFECT_TERNARY_FLOURISH);
    player:addStatusEffect(EFFECT_TERNARY_FLOURISH, 10, 0, duration);

end;