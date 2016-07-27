---------------------------------------------
--  Battle Dance
--
--  Description: Delivers an area attack. Additional effect: DEX Down. Duration of effect varies with TP.
--  Type: Physical (Slashing)
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
    local duration = 90 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);
    target:delHP(dmg);

    local typeEffect = EFFECT_DEX_DOWN;

    local power = (10 + mob:getMainLvl() / 10) * (1 + hard / 3);
    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, duration);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_DEX_DOWN);
    end

    return dmg;
end;
