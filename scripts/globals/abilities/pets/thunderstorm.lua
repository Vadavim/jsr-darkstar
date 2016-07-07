---------------------------------------------------
-- Geocrush
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local merits = master:getMerit(MERIT_THUNDERSTORM);
    return avatarMagicalMove(target, pet, skill, ELE_EARTH, 512 + merits * 5, 4.0, 0.24);
end

