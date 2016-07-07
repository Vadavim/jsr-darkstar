---------------------------------------------
--  Triclip
--
--  Description: Deals damage in a threefold attack. Additional effect: DEX Down
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Melee
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

    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1.3 + hard / 6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_DEX_DOWN;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 10 + hard * 5, 0, 120);
    if (hard > 0 and info.hitslanded == 3) then
        dmg = dmg * 1.33;
    end


    target:delHP(dmg);
    return dmg;
end;
