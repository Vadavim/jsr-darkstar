-----------------------------------
-- Ability: Vallation
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
    if (player:hasStatusEffect(EFFECT_VALIANCE)) then
        player:delStatusEffect(EFFECT_VALIANCE);
    end

    player:addStatusEffect(EFFECT_VALLATION,1,0,120);
end;

