-----------------------------------
-- Ability: Vallation
-----------------------------------

require("scripts/globals/status");

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
    if (player:hasStatusEffect(EFFECT_VALIANCE)) then
        player:delStatusEffect(EFFECT_VALIANCE);
    end
    player:addStatusEffect(EFFECT_VALLATION,1,0,120);
end;

