---------------------------------------------------
--
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");
require("scripts/globals/utils");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(30);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP();
    local duration = utils.clamp(180 + chr * 6 + summoning * 6, 30, 360);
    local power = 300 + tp / 25;

    local success = MobStatusEffectMove(pet, target, EFFECT_SLOW_II, power, 0, duration, MOD_MND, tp / 30);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_SLOW);
    end

    return success;
end