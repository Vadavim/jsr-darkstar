---------------------------------------------
--  Triple Attack
--
--  Description: Delivers a threefold attack on a single target.
--  Further Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1 + hard / 12;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    if (hard > 0 and dmg > 0 and info.hitslanded == 3) then
        dmg = dmg * 1.33;
    end

    target:delHP(dmg);
    return dmg;
end;
