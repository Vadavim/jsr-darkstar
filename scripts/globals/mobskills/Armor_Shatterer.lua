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
    skill:setSkillchain(141); -- Blade Shun: Fusion / Impaction

    local numhits = 4;
    local accmod = 1;
    local dmgmod = 1.15;
    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,1.5, 2.0, 2.5);
    local dmg = AutomatonFinalAdjustments(target, mob, skill, info.dmg);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    if (mob:isPet()) then
        target:updateEnmityFromDamage(mob,dmg);
    end

    local success = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_DEFENSE_DOWN, 25, 0, 15 + skill:getTP() / 50);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_DEFENSE_DOWN_II);
    end
    return dmg;
end;
