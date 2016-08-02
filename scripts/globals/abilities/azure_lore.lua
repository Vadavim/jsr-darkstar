-----------------------------------
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

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
    player:addStatusEffect(EFFECT_AZURE_LORE, 1, 0, 120);
    player:resetRecast(RECAST_ABILITY, 78); -- Affinity
    player:resetRecast(RECAST_ABILITY, 79); -- Affinity
    return EFFECT_AZURE_LORE
end;