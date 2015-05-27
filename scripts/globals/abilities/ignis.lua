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
    local runLevel = 0;
    if(player:getMainJob() == JOB_RUN or player:getMainJob() == JOB_GEO) then
        runLevel = player:getMainLvl();
    else
        runLevel = player:getSubLvl();
    end
    local power = math.floor(1 + runLevel * 0.777);
    player:addStatusEffect(EFFECT_IGNIS,power,3,60);
end;

