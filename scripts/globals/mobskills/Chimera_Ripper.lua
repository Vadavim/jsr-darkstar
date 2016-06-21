---------------------------------------------------
-- Chimera Ripper
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(33); -- Freezebite: Detonation / Induration

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,1.5, 2.0, 3.0);
    local dmg = AutomatonFinalAdjustments(target, mob, skill, info.dmg);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    if (mob:isPet()) then
        target:updateEnmityFromDamage(mob,dmg);
    end


    return dmg;
end;

