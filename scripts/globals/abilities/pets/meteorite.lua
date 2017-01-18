---------------------------------------------------
-- Meteorite
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, owner)
    return avatarMagicalMove(target, pet, skill, ELE_LIGHT, 360, 2.8, 0.18);
end
