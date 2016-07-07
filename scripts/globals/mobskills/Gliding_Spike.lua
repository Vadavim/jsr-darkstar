---------------------------------------------
--  Gliding Spike
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

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local numhits = 1;
    local accmod = 1;
    if (mob:hasStatusEffect(EFFECT_WEIGHT)) then accmod = accmod * 0.8; end
    if (mob:hasStatusEffect(EFFECT_BIND)) then accmod = accmod * 0.5; end
    local dmgmod = 2.5 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);

    local typeEffect = EFFECT_STUN;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_STUN);
        if (hard > 0) then
            target:addStatusEffect(EFFECT_BIND, 1, 0, 10 + hard * 5);
            target:setPendingMessage(277, EFFECT_BIND);
        end

    end



    target:delHP(dmg);
    return dmg;
end;
