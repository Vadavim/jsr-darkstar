---------------------------------------------------
-- Full-Force Blow
-- Deals damage to a single target. Additional effect: Knockback.
-- 0% TP: ??? / 150% TP: ??? / 300% TP: ???
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    ------------ ADD Knockback Animation ------------
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.8 + hard / 5;

    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    if (hard > 0 and dmg > 0) then
        mob:lowerEnmity(target, 20 + hard * 15);
    end
    target:delHP(dmg);
    return dmg;
end;
