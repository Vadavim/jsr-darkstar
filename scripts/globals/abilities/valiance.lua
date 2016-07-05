-----------------------------------
-- Ability: Valiance
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getActiveRunes() == 0) then
        return MSGBASIC_UNABLE_TO_USE_JA, 0;
    end
    return 0,0;
end;
-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability, action)
    getRuneSpecEffect(player, target, ability, action);
    if (target:hasStatusEffect(EFFECT_VALLATION)) then
        target:delStatusEffect(EFFECT_VALIANCE);
        return;
    end
    local power = createRuneMask(player);
    target:addStatusEffect(EFFECT_VALIANCE,power,0,120);
end;

