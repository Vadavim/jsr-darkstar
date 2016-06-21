---------------------------------------------------
-- Geocrush
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local merits = master:getMerit(MERIT_METEOR_STRIKE);
    return avatarMagicalMove(target, pet, skill, ELE_FIRE, 512 + merits * 5, 3.0, 0.16);
end

