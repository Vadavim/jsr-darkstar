-----------------------------------
-- Ability: Defender
-- Enhances defense but weakens attacks.
-- Obtained: Warrior Level 25
-- Recast Time: 3:00
-- Duration: 3:00
-----------------------------------

require("scripts/globals/settings");
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
    print("USED");
    local subPower = 15;
    if (player:getMainJob() ~= 1) then subPower = 10; end;
    player:delStatusEffect(EFFECT_BERSERK);
    player:addStatusEffect(EFFECT_DEFENDER,1,0,180, 0, subPower);
end;