---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local duration = 900;

    local power = 50 + (level + chr + summoning) * 2 + (tp / 500) * level;

    target:delStatusEffect(EFFECT_SHOCK_SPIKES);
    target:addStatusEffect(EFFECT_SHOCK_SPIKES,power,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_SHOCK_SPIKES;
end