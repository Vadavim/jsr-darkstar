---------------------------------------------
--  Blow
--
--  Description: Damage varies with TP. Additional effect: "Stun."
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 6 * fTP(1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_STUN;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, duration, MOD_STR);
    if (hard > 0) then
        local success = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_DEFENSE_DOWN, 30, 0, hard * 10, MOD_STR);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_DEFENSE_DOWN);
        end
    end


    return dmg;
end;
