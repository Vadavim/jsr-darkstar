-----------------------------------------
-- ID: 18148
-- Item: Acid Bolt
-- Additional Effect: Weakens Defense
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
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_DEFENSE_BOOST);
        local duration = 60;
        local power = 12;
        if (player:hasStatusEffect(EFFECT_FLASHY_SHOT)) then
            power = power + 3;
            duration = duration + 30;
        end

        if (player:hasStatusEffect(EFFECT_TRICK_ATTACK)) then
            power = power + 3;
            duration = duration + 45;
            player:delStatusEffect(EFFECT_TRICK_ATTACK);
        end

        target:addStatusEffect(EFFECT_DEFENSE_DOWN, power, 0, duration);
        return SUBEFFECT_DEFENSE_DOWN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_DEFENSE_DOWN;
    end
end;