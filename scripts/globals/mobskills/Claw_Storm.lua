---------------------------------------------
--  Claw Storm
--
--  Description: Slashes a single target in a threefold attack. Additional effect: Poison
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
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

    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1.1 + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);

    local typeEffect = EFFECT_POISON;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, (mob:getMainLvl()/2.5) * (1 + hard / 4), 3, 30, MOD_STR);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0 ) then
        if (success == 242) then
            local success2 = MobPhysicalStatusEffectMove(mob, target, EFECT_DISEASE, 1, 0, 30 + hard * 15, MOD_STR);
            if (success2 == 242) then
                target:setPendingMessage(277, EFFECT_DISEASE);
            end
        end

    end

    return dmg;
end;