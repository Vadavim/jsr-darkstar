---------------------------------------------------
-- Frog Kick
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
    local numhits = 2;
    local accmod = 0.8;
    if (mob:hasStatusEffect(EFFECT_WEIGHT)) then
        accmod = accmod - 0.1;
    end
    if (mob:hasStatusEffect(EFFECT_BIND)) then
        accmod = accmod - 0.2;
    end


    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local dmgmod = 1.5 + hard / 6;

    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
