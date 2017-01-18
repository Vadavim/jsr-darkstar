---------------------------------------------------
-- Stone 4
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(48);
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    return avatarMagicalMove(target, pet, skill, ELE_EARTH, 400, 3.0, 0.20);
end

