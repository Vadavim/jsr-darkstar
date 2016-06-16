---------------------------------------------
--  Pinecone Bomb
--
--  Description: Single target damage with sleep.
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local dmgmod = 2.3 + hard / 4;


    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);

    local typeEffect = EFFECT_SLEEP_I;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30, MOD_MND);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_SLEEP_I);
    end

    target:delHP(dmg);
    return dmg;
end;
