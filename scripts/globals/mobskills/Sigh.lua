---------------------------------------------
--  Sigh
--
--  Description: Self Evasion Boost. Extremely potent, but quickly decays over time.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Very sharp evasion increase.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_EVASION_BOOST;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    skill:setMsg(MobBuffMove(mob, typeEffect, 50 + hard * 5, 3, 30 + hard * 10));
    return typeEffect;
end;
