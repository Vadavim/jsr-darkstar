-----------------------------------------
-- ID: 18150
-- Item: Blind Bolt
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 95;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (target:hasImmunity(64)) then
        spell:setMsg(75);
    elseif (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_BLINDNESS)
        local duration = 60;
        if (not target:hasStatusEffect(EFFECT_BLINDNESS)) then

            local power = 20;
            if (player:hasStatusEffect(EFFECT_FLASHY_SHOT)) then
                power = power + 5;
                duration = duration + 30;
            end

            if (player:hasStatusEffect(EFFECT_TRICK_ATTACK)) then
                power = power + 8;
                duration = duration + 45;
                player:delStatusEffect(EFFECT_TRICK_ATTACK);
            end

            target:addStatusEffect(EFFECT_BLINDNESS, power, 0, duration);
        end
        return SUBEFFECT_BLIND, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_BLINDNESS;
    end
end;
