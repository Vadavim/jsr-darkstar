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
    skill:setSkillchain(41); -- Swift Blade: Gravitation
    target:dispelStatusEffect();

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.35;
    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,2.5, 3.5, 4.5);
    local dmg = AutomatonFinalAdjustments(target, mob, skill, info.dmg);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    if (mob:isPet()) then
        target:updateEnmityFromDamage(mob,dmg);
    end
    return dmg;

end;
