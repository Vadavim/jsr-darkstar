---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(25);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local moon = VanadielMoonPhase();
    local buffvalue = 0;
    if moon > 90 then
        buffvalue = 36;
    elseif moon > 75 then
        buffvalue = 30;
    elseif moon > 60 then
        buffvalue = 24;
    elseif moon > 40 then
        buffvalue = 18;
    elseif moon > 25 then
        buffvalue = 12;
    elseif moon > 10 then
        buffvalue = 6;
    else
        buffvalue = 1;
    end

    local duration = utils.clamp(80 + (chr + summoning) * 2, 80, 240);
    local diff = master:getMod(MOD_CHR) + master:getMod(MOD_SUMMONING) / 2 + pet:getStat(MOD_INT) - target:getStat(MOD_INT);

    local resist = applyResistanceAbility(pet,target,ELE_DARK, 0, diff + tp / 25 );

    if (resist >= 0.5) then
        target:delStatusEffect(EFFECT_ACCURACY_DOWN);
        target:delStatusEffect(EFFECT_EVASION_DOWN);
        target:delStatusEffect(EFFECT_MAGIC_ACC_DOWN);
        target:delStatusEffect(EFFECT_MAGIC_EVASION_DOWN);
        target:addStatusEffect(EFFECT_ACCURACY_DOWN,buffvalue,0,duration);
        target:addStatusEffect(EFFECT_MAGIC_ACC_DOWN,buffvalue,0,duration);
        target:addStatusEffect(EFFECT_EVASION_DOWN,36-buffvalue,0,duration);
        target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN,36-buffvalue,0,duration);
        target:setPendingMessage(277, EFFECT_MAGIC_EVASION_DOWN);
        target:setPendingMessage(277, EFFECT_MAGIC_ACC_DOWN);
        target:setPendingMessage(277, EFFECT_ACCURACY_DOWN);
        target:setPendingMessage(277, EFFECT_EVASION_DOWN);
    end


    skill:setMsg(0);
    return 0;
end
