---------------------------------------------------
--Noctoshield
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(45);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local duration = utils.clamp(30 + (chr + summoning) / 10, 30, 60);
    local duration = duration + tp / 100;

    target:addStatusEffect(EFFECT_PHALANX,8 + (level + chr + summoning) / 3,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_PHALANX;
end