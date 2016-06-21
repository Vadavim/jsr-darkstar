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
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local resist = applyPlayerResistance(pet,-1,target,
        pet:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_DARK);

    if (resist >= 0.25) then
        local power = 5 + (level + chr + summoning) / 3;
        target:addStatusEffect(EFFECT_BIO, power, 0, 45, 0, (60 + tp / 50) * resist);
        target:setPendingMessage(277, EFFECT_BIO);
    end

    return avatarMagicalMove(target, pet, skill, ELE_DARK, 300, 2.5, 0.11);
end