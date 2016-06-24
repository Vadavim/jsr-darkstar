---------------------------------------------------
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    mob:addTP(skill:getTP()); -- Ability doesn't consume TP
    local master = mob:getMaster();
    local wind = master:getEffectsCount(EFFECT_WIND_MANEUVER);


    if (wind == 1) then
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_2, 2, 0, 120);
        target:setMod(MOD_UTSUSEMI, 2);
    elseif (wind == 2) then
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_3, 3, 0, 120);
        target:setMod(MOD_UTSUSEMI, 3);
    else
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_4, 4, 0, 120);
        target:setMod(MOD_UTSUSEMI, 4);
    end

    master:delStatusEffect(EFFECT_WIND_MANEUVER);
    master:delStatusEffect(EFFECT_WIND_MANEUVER);
    master:delStatusEffect(EFFECT_WIND_MANEUVER);

    return EFFECT_COPY_IMAGE;
end;

