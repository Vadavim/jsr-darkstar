---------------------------------------------
--  Whip Tongue
--
--  Description: Whiplashes a single target with its tongue. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Unknown
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

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.8 + hard / 8;
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then accmod = accmod * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then accmod = accmod * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then accmod = accmod * 0.8 end;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_STUN;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4 + hard);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_STUN);
        if (hard > 0) then
            target:dispelStatusEffect();
        end

    end


    target:delHP(dmg);
    return dmg;
end;
