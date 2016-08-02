-----------------------------------
-- Ability: Steal
-- Steal items from enemy.
-- Obtained: Thief Level 5
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");


-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)

    if (player:getFreeSlotsCount() == 0) then
        return MSGBASIC_FULL_INVENTORY,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local thfLevel;
    local stolen = 0;

    if (player:getMainJob() == JOBS.THF) then
        thfLevel = player:getMainLvl();
    else
        thfLevel = player:getSubLvl();
    end

    local stealMod = player:getMod(MOD_STEAL);

    local stealChance = 80 + stealMod * 2 + thfLevel - target:getMainLvl() + player:getStat(MOD_AGI) - target:getStat(MOD_AGI);

    if (target:isMob() and math.random(100) < stealChance) then
        local effect = target:stealStatusEffect();
        if (effect ~= nil) then
            -- add to myself
            local duration = effect:getDuration();
            if (duration > 300) then duration = 300; end
            player:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), duration, 0, effect:getSubPower());
            -- add buff to myself
            ability:setMsg(370);
            return 1;
        end
    end

    return EFFECT_NONE;
end;


