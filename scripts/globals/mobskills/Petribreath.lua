---------------------------------------------
--  Petribreath
--
--  Description: Petrifies targets within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown  cone, Seen up to 15' distance.
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
    if (mob:hasStatusEffect(EFFECT_SILENCE) and math.random(0, 100) < 50) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_DROWN) and math.random(0, 100) < 15) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE) and math.random(0, 100) < 15) then return 0 end;
    local typeEffect = EFFECT_PETRIFICATION;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 20 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    


    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration, MOD_VIT));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 2) * (1 + hard / 5);
        local success2 = MobStatusEffectMove(mob, target, EFFECT_RASP, power, 0, duration);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_RASP);
        end
    end


    return typeEffect;
end;
