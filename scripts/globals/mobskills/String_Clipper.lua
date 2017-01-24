---------------------------------------------------
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(16); -- Wasp Sting: Scission

    local numhits = 2;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,1.25,2.5,3.75);
    local dmg = AutomatonFinalAdjustments(target, mob, skill, info.dmg);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    if (mob:isPet()) then
        target:updateEnmityFromDamage(mob,dmg);
    end

    return dmg;
end;

