---------------------------------------------------
-- Epoxy Spread
-- AOE Bind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local typeEffect = EFFECT_BIND;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));
    enmityStatusCheck(target, mob, skill, 15 + hard * 20);
    if (hard > 0) then
        skill:setKnockback(5);
    end


    return typeEffect;
end;
