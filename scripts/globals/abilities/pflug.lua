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
    end;
    return 0,0;
end;
-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)

    local power = createRuneMask(player);
    target:addStatusEffect(EFFECT_PFLUG,power,0,120);
end;

