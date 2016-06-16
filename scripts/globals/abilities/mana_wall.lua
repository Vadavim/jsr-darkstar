-----------------------------------
-- Ability: Subtle Sorcery
-- Recast Time: 60 seconds
-- Duration: 60 seconds
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
    player:addStatusEffect(EFFECT_MANA_WALL,1,0,300);
end;