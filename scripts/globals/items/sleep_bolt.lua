-----------------------------------------
-- ID: 18149
-- Item: Sleep Bolt
-- Additional Effect: Sleep
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
    if (player:hasStatusEffect(EFFECT_TRICK_ATTACK)) then
        chance = 100;
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local duration = 25;
        if (player:hasStatusEffect(EFFECT_FLASHY_SHOT)) then
            duration = duration + 10;
        end
        if (player:hasStatusEffect(EFFECT_TRICK_ATTACK))  then
            duration = duration + 15;
            player:delStatusEffect(EFFECT_TRICK_ATTACK);
        end

        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,25);
        duration = duration * applyResistanceAddEffect(player,target,ELE_LIGHT,0);
        if (not target:hasStatusEffect(EFFECT_SLEEP_I)) then
            target:addStatusEffect(EFFECT_SLEEP_I, 1, 0, duration);
        end
        return SUBEFFECT_SLEEP, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_SLEEP_I;
    end
end;