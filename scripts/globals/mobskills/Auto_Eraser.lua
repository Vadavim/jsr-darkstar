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
    local master = target;
    local light = master:getEffectsCount(EFFECT_LIGHT_MANEUVER);
    target:eraseStatusEffect();
    mob:eraseStatusEffect();

    if (light >= 2) then
        target:eraseStatusEffect();
        mob:eraseStatusEffect();
    end

    if (light >= 3) then
        target:eraseStatusEffect();
        mob:eraseStatusEffect();
    end



    master:delStatusEffect(EFFECT_LIGHT_MANEUVER);
    master:delStatusEffect(EFFECT_LIGHT_MANEUVER);
    master:delStatusEffect(EFFECT_LIGHT_MANEUVER);
    return 0;

end;

