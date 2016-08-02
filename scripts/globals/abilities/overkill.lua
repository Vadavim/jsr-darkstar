-----------------------------------
-- Ability: Camouflage
-- Become hidden from enemies.
-- Obtained: Ranger Level 20
-- Recast Time: 5:00
-- Duration: Random
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
    player:addStatusEffect(EFFECT_OVERKILL,1,0,60);
end;