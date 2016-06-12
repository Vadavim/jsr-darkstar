-----------------------------------
-- Ability: Sulpor
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils")

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
    addRune(player, EFFECT_SULPOR);
end;

