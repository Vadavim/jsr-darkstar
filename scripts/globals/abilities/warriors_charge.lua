-----------------------------------
-- Ability: Warrior's Charge
-- Will double your next attack.
-- Obtained: Warrior Level 75 (Merit)
-- Recast Time: 5:00
-- Duration: 1:00 or next attack
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local merits = player:getMerit(MERIT_WARRIORS_CHARGE);
    if (player:hasStatusEffect(EFFECT_BERSERK)) then
        ability:setRecast(180 - merits * 2);
    end

    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local merits = player:getMerit(MERIT_WARRIORS_CHARGE);
    local subPower = 0;

    if (player:hasStatusEffect(EFFECT_DEFENDER)) then
        subPower = 40 + merits * 2;
    end
    player:addStatusEffect(EFFECT_WARRIOR_S_CHARGE,25 + merits,0,60, 0, subPower);
end;