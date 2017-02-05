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
    ability:setRecast(25);
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    local damage = summoningDamageBonus(summoner, 70, 0.8, 140, 57);
    return avatarMagicalMove(target, pet, skill, ELE_WATER, damage, 1.8, damage / 2000);
end

