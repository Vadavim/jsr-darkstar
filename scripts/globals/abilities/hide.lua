-----------------------------------
-- Ability: Hide
-- User becomes invisible.
-- Obtained: Thief Level 45
-- Recast Time: 5:00
-- Duration: Random
-----------------------------------

require("scripts/globals/settings");
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

    local thfLevel = 0;
    if(player:getMainJob() == JOB_THF) then
        thfLevel = player:getMainLvl();
    else
        thfLevel = player:getSubLvl();
    end
    
    shadowEffect = EFFECT_COPY_IMAGE;
    local shadows = 0;
    if (thfLevel < 45) then
        shadows = 1;
    else
        shadows = 2;
        shadowEffect = EFFECT_COPY_IMAGE_2;
    end

    local duration = math.random(500, 1000);
    
    local effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
    
    if (effect == nil) then
		target:addStatusEffectEx(EFFECT_COPY_IMAGE, shadowEffect, shadows, 0, 120);
		target:setMod(MOD_UTSUSEMI, 2);
    end

    player:addStatusEffect(EFFECT_HIDE,1,0,(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
end;