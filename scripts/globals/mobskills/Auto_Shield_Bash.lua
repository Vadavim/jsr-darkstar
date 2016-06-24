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
    mob:addTP(skill:getTP() + 250); -- Ability doesn't consume TP (but does give some)
    target:addStatusEffect(EFFECT_STUN, 1, 0, 6);
    return EFFECT_STUN;
end;

