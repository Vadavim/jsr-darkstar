-----------------------------------
-- Ability: Snake Eye
-- Your next roll will automatically be a 1.
-- Obtained: Corsair Level 75
-- Recast Time: 0:05:00
-- Duration: 0:01:00 or the next usage of Phantom Roll or Double-Up
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
    player:addStatusEffect(EFFECT_TRIPLE_SHOT, 25, 0, 60);

    return 0;
end;