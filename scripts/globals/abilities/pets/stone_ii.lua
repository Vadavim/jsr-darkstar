---------------------------------------------------
-- Stone 2
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(25);
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    return avatarMagicalMove(target, pet, skill, ELE_WIND, 120, 1.8, 0.05);
end

