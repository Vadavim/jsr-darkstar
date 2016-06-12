-----------------------------------
-- Ability: Warcry
-- Enhances attacks of party members within area of effect.
-- Obtained: Warrior Level 35
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
    local merit = player:getMerit(MERIT_SAVAGERY);

    local power = 5;
    local subPower = 0;
    if (player:hasStatusEffect(EFFECT_BERSERK)) then
        power = 7;
    elseif (player:hasStatusEffect(EFFECT_DEFENDER)) then
        subPower = 10;
    end

    target:addStatusEffect(EFFECT_BLOOD_RAGE,power,0,30,0,subPower);
end;