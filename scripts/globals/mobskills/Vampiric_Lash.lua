---------------------------------------------
--  Vampiric Lash
--
--  Description: Deals dark damage to a single target. Additional effect: Drain
--  Type: Magical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes: In ToAU zones, this has an additional effect of absorbing all status effects, including food.
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


    local dmgmod = 0.8 + hard / 4;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_DARK,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);
    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg));
    MobDrainStatusEffectMove(mob, target);
    MobDrainStatusEffectMove(mob, target);

    if (hard > 0) then
        local power = 1 + (mob:getMainLvl() / 5) * (1 + hard / 4);
        local success = MobStatusEffectMove(mob, target, EFFECT_BIO, power, 3, 15 * hard, EFFECTFLAG_ERASABLE, 10 );
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_BIO);
        end
    end

    return dmg;
end;
