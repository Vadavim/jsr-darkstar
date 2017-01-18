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

function onPetAbility(target, pet, skill)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local duration = utils.clamp(900 + chr * 30 + summoning * 30, 900, 1800);

    local power = 3 + math.floor(tp / 800);

    target:delStatusEffect(EFFECT_BLINK);
    target:addStatusEffect(EFFECT_BLINK,power,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_BLINK;
end