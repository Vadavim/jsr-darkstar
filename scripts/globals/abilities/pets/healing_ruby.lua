---------------------------------------------------
-- Healing Ruby
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(15);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);

    local power = 8 + level + chr + summoning * 2 + target:getStat(MOD_VIT) / 4;
    if (power > 48) then power = 48 + (power - 48) / (1 + power * 0.01) end;
    power = power + tp * 0.012;
    power = power * (1 + master:getMod(MOD_CURE_POTENCY) / 100) * (1 + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);

    skill:setMsg(MSG_SELF_HEAL);
    target:addHP(power);

    local diff = (target:getMaxHP() - target:getHP());
    if (power > diff) then
        power = diff;
    end

    return power;
end
