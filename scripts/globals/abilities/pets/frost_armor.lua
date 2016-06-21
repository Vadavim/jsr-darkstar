---------------------------------------------------
--
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(35);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local duration = utils.clamp(180 + chr * 6 + summoning * 6, 180, 360);
    local duration = duration + tp / 10;

    local power = 1 + (level + chr + summoning) / 3;

    target:delStatusEffect(EFFECT_ICE_SPIKES);
    target:addStatusEffect(EFFECT_ICE_SPIKES,power,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_ICE_SPIKES;
end