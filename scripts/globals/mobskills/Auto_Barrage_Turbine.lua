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
    local maneuverType = EFFECT_WIND_MANEUVER;
    local maneuvers = master:getEffectsCount(maneuverType);
    local arrows = 1 + maneuvers;
    if (maneuvers == 3) then arrows = arrows + 1; end;

    mob:addStatusEffect(EFFECT_BARRAGE, arrows, 0, 120);
    skill:setMsg(MSG_BUFF);

    master:delStatusEffectSilent(maneuverType);
    master:delStatusEffectSilent(maneuverType);
    master:delStatusEffectSilent(maneuverType);
    return EFFECT_BARRAGE;

end;

