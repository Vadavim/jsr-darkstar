require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_STONESKIN)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/1000); --base is around 5~150 level depending
    base = base * (1 + hard / 5);

    local typeEffect = EFFECT_STONESKIN;
    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 300));

    if (hard > 0) then
        local effect = mob:getStatusEffect(EFFECT_STONESKIN);
        if (effect ~= nil) then
            local power = 10 + hard * 5;
            effect:addMod(MOD_ATTP, power);
            target:addMod(MOD_ATTP, power);
        end
    end

    return typeEffect;
end;
