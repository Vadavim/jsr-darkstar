---------------------------------------------------
-- Screwdriver
-- Deals critical damage. Chance of critical hit varies with TP.
-- 100% TP: ??? / 200% TP: ??? / 300% TP: ???
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local numhits = 1;
    local accmod = 1;
    local dmgmod = math.random(2,3) + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1,1.5,2);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    if (hard > 0) then
        mob:lowerEnmity(target, 15 + hard * 5);
    end

    return dmg;
end
