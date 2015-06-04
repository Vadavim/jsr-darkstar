-----------------------------------
-- Ability: Valiance
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    if (target:hasStatusEffect(EFFECT_VALLATION)) then
        return;
    end
    local power = createValiationMask(player);
    target:addStatusEffect(EFFECT_VALIANCE,power,0,120);
end;

