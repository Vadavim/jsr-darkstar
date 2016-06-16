---------------------------------------------------
-- Uppercut
-- Deals damage to a single target.
-- Type: Physical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local dmgmod = 2.5 + hard / 4;


    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    if (hard > 0 and dmg > 0) then
        mob:lowerEnmity(target, 20 + hard * 5);
    end

    target:delHP(dmg);
    return dmg;
end;
