-----------------------------------------
-- Sleepga
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);

    local duration = utils.clamp(45 + chr + summoning, 45, 90) + tp / 50;

    local success = MobStatusEffectMove(pet, target, EFFECT_SLEEP_I, 1, 0, duration);

    return EFFECT_SLEEP_I;
end;