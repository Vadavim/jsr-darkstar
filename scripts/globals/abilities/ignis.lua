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
    local minRunes = 0;
    if(player:getMainJob() == JOB_RUN or player:getMainJob() == JOB_GEO) then
        runLevel = player:getMainLvl();
    else
        runLevel = player:getSubLvl();
    end
    if (runLevel < 35) then
        minRunes = 1;
    elseif (runLevel < 65) then
        minRunes = 2;
    else
        minRunes = 3;
    end
    
    
    
    if (player:getActiveRunes() >= minRunes) then
        player:removeOldestRune();
    end
    local power = math.floor(1 + runLevel * 0.777);
    player:addStatusEffect(EFFECT_IGNIS,power,3,60);
end;

