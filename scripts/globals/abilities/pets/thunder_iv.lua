---------------------------------------------------
-- Aero 2
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(48);
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    return avatarMagicalMove(target, pet, skill, ELE_THUNDER, 320, 3.0, 0.14);
end

