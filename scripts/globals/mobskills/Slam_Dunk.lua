---------------------------------------------------
-- Slam Dunk
-- Deals damage to a single target. Additional effect: bind
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
    local dmgmod = 2.4 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

    local typeEffect = EFFECT_BIND;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 20 + hard * 5);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BIND);
        local effect = target:getStatusEffect(EFFECT_BIND);
        if (effect ~= nil) then
            effect:addMod(MOD_DEFP, -40 - hard * 5);
            target:addMod(MOD_DEFP, -40 - hard * 5);
        end

    end



    target:delHP(dmg);
    return dmg;
end;
