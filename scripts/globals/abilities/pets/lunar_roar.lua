---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(30);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local diff = owner:getMod(MOD_CHR) + owner:getMod(MOD_SUMMONING) / 2 + pet:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyResistanceAbility(pet,target,ELE_DARK, 0, diff + tp / 25 );
    if (target:isNM()) then resist = resist - 0.75 end;

    if (resist >= 0.25) then
        target:dispelStatusEffect();
        skill:setMsg(0);
    end

    local resist = applyResistanceAbility(pet,target,ELE_DARK, 0, diff + tp / 25 );
    if (target:isNM()) then resist = resist - 0.75 end;

    if (resist >= 0.25) then
        target:dispelStatusEffect();
        skill:setMsg(0);
    end

    return 0;
end