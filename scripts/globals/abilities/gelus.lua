-----------------------------------
-- Ability: Ignis
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
    local power = player:getMainLvl() * 3;
   player:addStatusEffect(EFFECT_GELUS,power,0,300);
end;