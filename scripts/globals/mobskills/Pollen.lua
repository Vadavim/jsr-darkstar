---------------------------------------------------
--  Pollen
--
--  Description: Restores HP.
--
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local potency = skill:getParam();
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();



    if (potency == 0) then
        potency = 12;
    end

    potency = potency - math.random(0, potency/4);
    potency = (potency + (tp / 250)) * (1 + hard / 5);

    if (hard > 0) then
        mob:setPendingMessage(279, EFFECT_REGAIN);
        mob:addStatusEffect(EFFECT_REGAIN, 5, 0, 15 + 5 * hard);
    end

    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
