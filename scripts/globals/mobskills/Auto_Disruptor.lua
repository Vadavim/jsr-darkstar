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
    target:dispelStatusEffect();


    master:delStatusEffect(EFFECT_DARK_MANEUVER);
    master:delStatusEffect(EFFECT_DARK_MANEUVER);
    master:delStatusEffect(EFFECT_DARK_MANEUVER);
    return 0;

end;

