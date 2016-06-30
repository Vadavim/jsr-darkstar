---------------------------------------------------
-- Scissor Guard
-- Enhances defense 100%.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_DEFENSE_BOOST)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 60));
    return typeEffect;
end;
