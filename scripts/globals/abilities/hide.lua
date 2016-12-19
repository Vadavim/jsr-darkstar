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

    local duration = math.random(30, 300);

    if (not player:isMob()) then
        player:addStatusEffect(EFFECT_HIDE,1,0,(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
    end
    target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_2, 2, 0, 60);
    target:setMod(MOD_UTSUSEMI, 2);
end;