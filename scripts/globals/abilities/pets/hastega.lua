---------------------------------------------------
--
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
    local duration = utils.clamp(180 + (chr + summoning) * 3, 180, 360);
    duration = duration + tp / 10;

    -- Garuda's Hastega is a weird exception and uses 153 instead of 15%
    -- That's why it overwrites some things regular haste won't.
    target:addStatusEffect(EFFECT_HASTE,153,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_HASTE;
end