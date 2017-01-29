---------------------------------------------------
--  Fortifying Wail
--  Family: Qutrub
--  Description: Let's out a wail that applies Protect to itself and nearby allies.
--  Type: Enhancing
--  Can be dispelled: Yes
--  Utsusemi/Blink absorb: N/A
--  Range: AoE
--  Notes:
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_PROTECT)) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = 30 + mob:getMainLvl() * 1.5;
    local duration = 300;
    local typeEffect = EFFECT_PROTECT;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    return typeEffect;
end;