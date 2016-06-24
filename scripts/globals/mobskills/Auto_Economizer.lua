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
    local maneuverType = EFFECT_DARK_MANEUVER;
    local maneuvers = master:getEffectsCount(maneuverType);
    local percent = 0.15;

    if (maneuvers == 2) then
        percent = 0.30;
    elseif (maneuvers == 3) then
        percent = 0.45;
    end

    mob:addMP(mob:getMaxMP() * percent);

    master:delStatusEffectSilent(maneuverType);
    master:delStatusEffectSilent(maneuverType);
    master:delStatusEffectSilent(maneuverType);
    return 0;

end;

