---------------------------------------------------
-- Dream Shroud
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
    local duration = utils.clamp(180 + (chr + summoning) * 6, 180, 360);
    local duration = duration + tp / 10;

    local hour = VanadielHour();
    local buffvalue = 0;

    buffvalue = math.abs(12 - hour) + 1
    target:delStatusEffect(EFFECT_MAGIC_ATK_BOOST);
    target:delStatusEffect(EFFECT_MAGIC_DEF_BOOST);
    target:addStatusEffect(EFFECT_MAGIC_ATK_BOOST,buffvalue,0,duration);
    target:addStatusEffect(EFFECT_MAGIC_DEF_BOOST,14 - buffvalue,0,duration);
    skill:setMsg(0);
    return 0;
end
