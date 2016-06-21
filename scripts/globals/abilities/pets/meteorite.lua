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
    local dint = pet:getStat(MOD_INT) - target:getStat(MOD_INT) + owner:getMod(MOD_CHR) + owner:getMod(MOD_SUMMONING);
    local dmg = 500 + dint*1.5 + skill:getTP()/5 + pet:getMod(MOD_TP_BONUS) / 5;
    local magicDefense = getElementalDamageReduction(target, ELE_LIGHT);
    local mat = (1 + pet:getMod(MOD_MATT) / 100) * (1 + target:getMod(MOD_MDEF));
    dmg = mobAddBonuses(pet, skill, target, dmg, ELE_LIGHT) * mat * magicDefense;

    target:updateEnmityFromDamage(pet,dmg);
    target:delHP(dmg);
    return dmg;
end
