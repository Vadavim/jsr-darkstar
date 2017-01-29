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

    local duration = math.random(360, 600);

    if (not player:isMob()) then
        player:addStatusEffect(EFFECT_HIDE,1,0,(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
    end

    local heal = 1 + player:getMainLvl() / 2;
    if (player:getMainJob() == JOBS.THF) then
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_2, 2, 0, 300);
        target:setMod(MOD_UTSUSEMI, 2);
    else
    heal = heal / 2;
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_1, 1, 0, 300);
    target:setMod(MOD_UTSUSEMI, 1);
    end

    local healBonus = (1 + player:getMod(MOD_HPHEAL) / 50);

    local effect = target:getStatusEffect(EFFECT_HIDE);
    if (effect ~= nil) then
        effect:addMod(MOD_REGEN, heal * healBonus);
        target:addMod(MOD_REGEN, heal * healBonus);
    end

end;