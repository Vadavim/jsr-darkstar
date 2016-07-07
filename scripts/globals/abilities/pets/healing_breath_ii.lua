---------------------------------------------------
-- Healing Breath II
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
  return healingBreathCalc(pet, target, skill, action, 2);
end
