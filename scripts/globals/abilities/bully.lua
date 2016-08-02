-----------------------------------
-- Ability: Steal
-- Steal items from enemy.
-- Obtained: Thief Level 5
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
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

    if (player:getMainJob() == JOBS.THF) then
        thfLevel = player:getMainLvl();
    else
        thfLevel = player:getSubLvl();
    end


    local resist = applyResistanceAbility(player,target,ELE_FIRE,0,20 + (player:getStat(MOD_CHR) - target:getStat(MOD_CHR)));
    if (resist >= 0.25) then
        target:addStatusEffect(EFFECT_INTIMIDATE, 30, 0, 30 * resist);
        return EFFECT_INTIMIDATE;
    end


    return EFFECT_NONE;
end;


