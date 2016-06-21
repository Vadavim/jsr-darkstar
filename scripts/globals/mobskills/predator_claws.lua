---------------------------------------------------
-- Predator Claws
-- Delivers a threefold attack. 
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(42); -- Savage Blade: fragmentation / Scission
    pet:addTP(300 + skill:getTP()); -- add tp for using physical skill

    local numhits = 3;
    local accmod = 2;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
    
end