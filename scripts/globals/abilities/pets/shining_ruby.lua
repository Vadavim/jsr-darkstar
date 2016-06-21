---------------------------------------------------
-- Shining Ruby
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


    local duration = 300 + chr * 3 + summoning * 6;
    if (duration > 600) then duration = 600 end;
    duration = duration + tp / 10;

    target:delStatusEffect(EFFECT_SHINING_RUBY);
    target:addStatusEffect(EFFECT_SHINING_RUBY,1,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_SHINING_RUBY;
end
