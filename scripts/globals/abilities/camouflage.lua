-----------------------------------
-- Ability: Camouflage
-- Become hidden from enemies.
-- Obtained: Ranger Level 20
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

    local duration = math.random(30, 300);
    
    local rngLevel = 0;
    if(player:getMainJob() == JOB_RNG) then
        rngLevel = player:getMainLvl();
    else
        rngLevel = player:getSubLvl();
    end
    
    shadowEffect = EFFECT_COPY_IMAGE;
    local shadows = 0;
    if (rngLevel < 45) then
        shadows = 1;
    else
        shadows = 2;
        shadowEffect = EFFECT_COPY_IMAGE_2;
    end
    

    if (target:getEquipID(SLOT_BODY) == 14224) then -- Hunter's Jerkin
        duration = duration * 1.3;
    elseif (target:getEquipID(SLOT_BODY) == 15571) then -- Hunter's Jerkin +1
        duration = duration * 1.5;
    end
    player:addStatusEffect(EFFECT_CAMOUFLAGE,1,0,(math.floor(duration) * SNEAK_INVIS_DURATION_MULTIPLIER));
    
    local effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
    
    if (effect == nil) then
		target:addStatusEffectEx(EFFECT_COPY_IMAGE, shadowEffect, shadows, 0, 120);
		target:setMod(MOD_UTSUSEMI, 1);
    end
end;