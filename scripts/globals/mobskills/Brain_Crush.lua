---------------------------------------------------
-- Brain Crush
-- Deals damage to single target. Additional effect: Silence
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
    local tp = skill:getTP();
    local duration =  45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)



    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.3 + hard / 6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);

    local typeEffect = EFFECT_SILENCE;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, duration, MOD_STR);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_SILENCE);
    end

    if (hard > 0) then
        local success2 = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_ADDLE, 40 + hard * 5, 0, duration * 2);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_ADDLE);
        end
    end


    return dmg;
end;
