---------------------------------------------------
-- Lightning Breath
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/ability");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    return elementalBreathCalc(pet, target, skill, action, ELE_THUNDER);
end
