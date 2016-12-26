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
    local power = 20 + player:getMod(MOD_DODGE_EFFECT);
    player:addStatusEffect(EFFECT_DODGE,power,0,120);
    if (player:getMainJob() == JOBS.MNK) then
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_2, 2, 0, 60);
        target:setMod(MOD_UTSUSEMI, 2);
    else
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE, 1, 0, 60);
        target:setMod(MOD_UTSUSEMI, 1);

    end

end;