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

    --get resist multiplier (1x if no resist)
    local resist = applyPlayerResistance(pet,EFFECT_SLEEP_I,target,
        pet:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_DARK);

    if (resist > 0.5) then
        target:addStatusEffect(EFFECT_SLEEP_I, 1, 0, duration * resist, 0, 2);
        local sleep = target:getStatusEffect(EFFECT_SLEEP_I);
        if (sleep ~= nil) then
            local power = 1 + (level + chr + summoning) / 5;
            target:addMod(MOD_REGEN_DOWN, power);
            sleep:addMod(MOD_REGEN_DOWN, power);
        end
    end





    return EFFECT_SLEEP_I;
end;