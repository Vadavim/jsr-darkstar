-----------------------------------
-- Ability: Flee
-- Increases movement speed.
-- Obtained: Thief Level 25
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local buff = 90;
    local sFeet = player:getEquipID(SLOT_FEET);
    if (sFeet == 14094) or (sFeet == 15357) then
        buff = buff + 30;
    end
    player:delStatusEffect(EFFECT_WEIGHT);
    player:delStatusEffect(EFFECT_SLOW);
    player:delStatusEffect(EFFECT_BIND);
    player:delStatusEffect(EFFECT_EVASION_DOWN);

    player:addStatusEffect(EFFECT_FLEE,100,0,buff);
end;