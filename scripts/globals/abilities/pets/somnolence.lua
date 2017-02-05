---------------------------------------------------
-- Somnolence
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(35);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local duration = utils.clamp(30 + chr / 2 + summoning, 20, 60) + tp / 50;

    local damageBonus = summoningDamageBonus(master, 30, 0.7, 100, 70);
    local damage = avatarMagicalMove(target, pet, skill, ELE_DARK, damageBonus, 1.8, damageBonus / 2000);


    local success = MobStatusEffectMove(pet, target, EFFECT_WEIGHT, 80, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_WEIGHT);
    end

    return damage;
end