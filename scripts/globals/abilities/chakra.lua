-----------------------------------
-- Ability: Chakra
-- Cures certain status effects and restores a small amount of HP to user.
-- Obtained: Monk Level 35
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local hp = player:getHP();
    local vit = player:getStat(MOD_VIT);
    local multi = 2;
    local merits = player:getMerit(MERIT_INVIGORATE);
    local body = player:getEquipID(SLOT_BODY);
    local hand = player:getEquipID(SLOT_HANDS);

    if (player:hasStatusEffect(EFFECT_POISON)) then
        player:delStatusEffect(EFFECT_POISON);
    end

    if (player:hasStatusEffect(EFFECT_BLINDNESS)) then
        player:delStatusEffect(EFFECT_BLINDNESS);
    end

    if ((body == 12639) or (body == 14474)) then -- Temple Cyclas (+1) equipped
        if (player:hasStatusEffect(EFFECT_PARALYSIS)) then
            player:delStatusEffect(EFFECT_PARALYSIS);
        end
        multi = multi + 1;
    end

    if ((hand == 15103) or (hand == 14910)) then -- Melee Gloves (+1) equipped
        if (player:hasStatusEffect(EFFECT_DISEASE)) then
            player:delStatusEffect(EFFECT_DISEASE);
        end
        multi = multi + 0.6;
    end

    local recover = (multi * vit);
--    player:setHP((hp + recover));

    if (player:hasStatusEffect(EFFECT_BOOST)) then
        local effect = player:getStatusEffect(EFFECT_BOOST);
        local subPower = effect:getSubPower();
        if (subPower >= 250) then
            local regen = 2 + player:getMainLvl() / 2 + merits / 4;
            target:addStatusEffect(EFFECT_REGEN,regen,0,30,0,0,1);
        end
        if (subPower >= 350) then
            target:eraseAllStatusEffects();
        end

        recover = recover + player:getMaxHP() * subPower / 1000;
        player:delStatusEffect(EFFECT_BOOST);
    end

    if (player:getID() == target:getID()) then
        player:addMP(player:getStat(MOD_VIT) * 2);
    end



    target:addHP(recover);
    if (merits >= 1) then
        if (player:hasStatusEffect(EFFECT_REGEN)) then
            player:delStatusEffect(EFFECT_REGEN);
        end
    end

    return recover;
end;