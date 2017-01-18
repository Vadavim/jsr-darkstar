---------------------------------------------------
-- Crimson Howl
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
    local duration = utils.clamp(120 + chr * 3 + summoning * 3, 60, 240) + tp / 15;


    target:addStatusEffect(EFFECT_WARCRY,10 + level / 20,0,duration, 0, 200);
    skill:setMsg(MSG_BUFF);
    return EFFECT_WARCRY;
end
