---------------------------------------------
--  Feather Storm
--  Description: Additional effect: Poison. Chance of effect varies with TP.
--  Type: Physical (Piercing)
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
    local duration = 60 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)


    local numhits = 1;
    local accmod = 1.2;
    local dmgmod = 2.2 + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);

    local typeEffect = EFFECT_POISON;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, (1 + mob:getMainLvl()/5) * (1 + hard / 5), 3, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_POISON);
        if (hard > 0) then
            local success2 = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_PLAGUE, 1 + hard, 3, duration);
            if (success2 == 242) then
                target:setPendingMessage(277, EFFECT_PLAGUE);
            end

        end

    end



    target:delHP(dmg);
    return dmg;
end;
