---------------------------------------------
--  Wings of Gehenna
--
--  Description: Deals damage to players in an area of effect. Additional effect: Knockback &amp; Stun
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
--  Notes:
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

    -- KNOCKBACK

    local typeEffect = EFFECT_STUN;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 4 + hard);

    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_WIND,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
