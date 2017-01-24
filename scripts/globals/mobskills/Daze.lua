---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(7); -- Howling Fist: Impaction / Transfixion

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.15;
    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,5.0, 5.5, 6.0);
    local dmg = AutomatonFinalAdjustments(target, mob, skill, info.dmg);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    if (mob:isPet()) then
        target:updateEnmityFromDamage(mob,dmg);
    end
    return dmg;

end;
