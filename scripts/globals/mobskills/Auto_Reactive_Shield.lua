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
    local power = 1 + (mob:getMainLvl() / 3.5) * fire;
    if (fire == 3) then
        power = power * 1.25;
    end

    mob:addStatusEffect(EFFECT_BLAZE_SPIKES, power, 0, 60);
    skill:setMsg(MSG_BUFF);


    master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
    master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
    master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER);
    return EFFECT_BLAZE_SPIKES;

end;

