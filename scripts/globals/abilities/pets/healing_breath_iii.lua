---------------------------------------------------
-- Healing Breath III
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
   return healingBreathCalc(pet, target, skill, action, 3);
end
