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
    local fire = master:getEffectsCount(EFFECT_FIRE_MANEUVER);
    local tp = 200;

    if (fire == 2) then
        tp = 500;
    elseif (fire == 3) then
        tp = 800;
    end

    mob:addTP(tp);
    master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
    master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
    master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
    return 0;

end;

