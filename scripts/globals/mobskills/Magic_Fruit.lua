---------------------------------------------
--  Magic Fruit
--
--  Description: Restores HP for the target party member.
--  Type: Magical (Light)
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
    local tp = skill:getTP();

    local potency = skill:getParam();

    if (potency == 0) then
        potency = 9;
    end

    potency = (potency + tp / 500) * (1 + hard / 4);

    potency = potency - math.random(0, potency/4);

    if (hard > 0) then
        local amount = purgeNegative(target, 3 + hard);
        potency = potency + amount;
    end


    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
