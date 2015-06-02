-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.
-- Obtained: Monk Level 15
-- Recast Time: 5:00
-- Duration: 2:00
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
    local mnkLevel = 0;
    if(player:getMainJob() == JOB_MNK) then
        mnkLevel = player:getMainLvl();
    else
        mnkLevel = player:getSubLvl();
    end
    
    shadowEffect = EFFECT_COPY_IMAGE;
    local shadows = 0;
    if (mnkLevel < 45) then
        shadows = 1;
    else
        shadows = 2;
        shadowEffect = EFFECT_COPY_IMAGE_2;
    end

    
    local sLegs = player:getEquipID(SLOT_LEGS);
    local power = 20
    if(sLegs == 14090 or sLegs == 15353) then
        power = power + 10;
    end
    
    local effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
    
    if (effect == nil) then
		target:addStatusEffectEx(EFFECT_COPY_IMAGE, shadowEffect, shadows, 0, 120);
		target:setMod(MOD_UTSUSEMI, 1);
    end

    player:addStatusEffect(EFFECT_DODGE,power,0,120);
end;