---------------------------------------------------
-- Grim Halo
-- Deals damage to a all targets. Additional effect: Knockback
--  Only used by Fomors that wield a two-handed weapon (principally WAR, BLM, DRK, SAM, DRG, and SMN fomors).
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local job = mob:getMainJob();
    if (job == JOBS.WAR or job == JOBS.BLM or job == JOBS.DRK or job == JOBS.SAM or job == JOBS.DRG or job == JOBS.SMN) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    -- Needs Knockback added
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.5 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
