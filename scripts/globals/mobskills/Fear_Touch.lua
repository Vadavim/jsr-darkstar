---------------------------------------------------
-- Fear Touch
-- Touches a single target. Additional effect: Slow
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
    local dmgmod = 2.2 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_SLOW;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 128, 0, 120);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
        if (hard > 0) then
            target:dispelStatusEffect();
        end
    end

    target:delHP(dmg);
    return dmg;
end;
