---------------------------------------------
--  Foxfire
--
--  Description: Damage varies with TP. Additional effect: "Stun."
--  Type: Physical (Blunt)
-- RDM, THF, PLD, BST, BRD, RNG, NIN, and COR fomors).
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    local job = mob:getMainJob();
    if (job == JOBS.RDM or job == JOBS.THF or job == JOBS.PLD or job == JOBS.BST or job == JOBS.RNG or job == JOBS.BRD or job == JOBS.NIN or job == JOBS.COR) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.6 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_STUN;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 6 + hard * 2);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    target:delHP(dmg);
    return dmg;
end;
