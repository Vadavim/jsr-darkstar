---------------------------------------------------
-- Nether Blast
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(38);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local resist = applyPlayerResistance(pet,-1,target,
        pet:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_DARK);

    if (resist >= 0.25) then
        local power = 4 + (level + chr + summoning) / 6;
        power = addBonusesAbility(pet, ELE_DARK, target, power, nil, 0.77);
        target:delStatusEffect(EFFECT_DIA);
        target:addStatusEffect(EFFECT_BIO, power, 0, (60 + tp / 20) * resist, 0, 15);
        target:setPendingMessage(277, EFFECT_BIO);
    end

    return avatarMagicalMove(target, pet, skill, ELE_DARK, 200, 2.5, 0.11);
end