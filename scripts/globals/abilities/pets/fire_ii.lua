---------------------------------------------------
-- Fire 2
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(25);
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    return avatarMagicalMove(target, pet, skill, ELE_FIRE, 120, 1.8, 0.06);
end

