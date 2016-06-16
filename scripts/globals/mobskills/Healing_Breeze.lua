---------------------------------------------
--  Healing Breeze
--
--  Description: Restores HP for party members within area of effect.
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();


    local potency = skill:getParam();

    if (potency == 0) then
        potency = 12;
    end
    potency = potency + hard + (tp - 1000) / 300;

    potency = potency - math.random(0, potency/4);

    if (hard > 0) then
        target:addStatusEffect(EFFECT_REGAIN, 3, 0, 15 + 15 * hard);
    end


    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
