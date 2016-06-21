---------------------------------------------------
-- Spring Water
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(50);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);

    local power = 47 + 3 * level + chr * 1.5 + summoning * 3 + target:getStat(MOD_VIT) / 4;
    if (power > 340) then power = 340 + (power - 340) / (1 + power * 0.00125) end;
    power = power + tp * 0.10;
    power = power * (1 + master:getMod(MOD_CURE_POTENCY) / 100) * (1 + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);

    target:delStatusEffect(EFFECT_BLINDNESS);
    target:delStatusEffect(EFFECT_POISON);
    target:delStatusEffect(EFFECT_PARALYSIS);
    target:delStatusEffect(EFFECT_DISEASE);
    target:delStatusEffect(EFFECT_PETRIFICATION);
    target:wakeUp();
    target:delStatusEffect(EFFECT_SILENCE);
    target:delStatusEffect(EFFECT_SLOW);

    skill:setMsg(MSG_SELF_HEAL);

    local diff = (target:getMaxHP() - target:getHP());
    if (power > diff) then
        power = diff;
    end


    target:addHP(power);
    return power;
end
