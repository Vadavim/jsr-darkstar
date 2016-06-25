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
    local earth = master:getEffectsCount(EFFECT_EARTH_MANEUVER);
    local power = 10 + (mob:getMainLvl() * 2) * earth;
    if (earth == 3) then
        power = power * 1.25;
    end

    mob:addStatusEffect(EFFECT_STONESKIN, power, 0, 180);
    skill:setMsg(MSG_BUFF);


    master:delStatusEffectSilent(EFFECT_EARTH_MANEUVER);
    master:delStatusEffectSilent(EFFECT_EARTH_MANEUVER);
    master:delStatusEffectSilent(EFFECT_EARTH_MANEUVER);
    return EFFECT_STONESKIN;

end;

