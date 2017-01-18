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
    local duration = utils.clamp(90 + chr * 3 + summoning * 3, 90, 180);
    local duration = duration + tp / 10;

    local power = 1 + (level + chr + summoning) / 5;

    target:delStatusEffect(EFFECT_ENTHUNDER);
    target:addStatusEffect(EFFECT_ENTHUNDER,power,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_ENTHUNDER;
end
