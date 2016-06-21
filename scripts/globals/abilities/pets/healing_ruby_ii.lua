---------------------------------------------------
-- Healing Ruby II
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(40);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);

    local power = 60 + 6 * level + chr * 2 + summoning * 4 + target:getStat(MOD_VIT) / 2;
    if (power > 680) then power = 650 + (power - 680) / (1 + power * 0.0008) end;
    power = power + tp * 0.15;
    power = power * (1 + master:getMod(MOD_CURE_POTENCY) / 100) * (1 + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);

    local diff = (target:getMaxHP() - target:getHP());
    if (power > diff) then
        power = diff;
    end

    skill:setMsg(MSG_SELF_HEAL);
    target:addHP(power);
    return power;
end
