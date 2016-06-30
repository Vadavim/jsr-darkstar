---------------------------------------------------
-- Catharsis
-- Description: Restores HP.
---------------------------------------------------
require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:getCurrentRegion() == REGION_TAVNAZIA) then
        return 0;
    end

    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local potency = skill:getParam();

    if (potency == 0) then
        potency = 12;
    end
    potency = potency + hard * 2;
    potency = reduced_healing_factor(target) * potency;

    if (hard > 0) then
        removeNegative(mob, hard + 1);
    end


    potency = potency - math.random(0, potency/4);
    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;