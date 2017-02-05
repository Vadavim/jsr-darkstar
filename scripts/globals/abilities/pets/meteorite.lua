---------------------------------------------------
-- Meteorite
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(48);
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    local damage = summoningDamageBonus(summoner, 30, 1, 380);
    return avatarMagicalMove(target, pet, skill, ELE_LIGHT, damage, 2.8, damage / 2000);
end
