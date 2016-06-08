-----------------------------------------
-- Item: Shiva's Claws
-- Additional Effect: Paralysis
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/weather");
require("scripts/globals/utils");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15;
    local power = 25;
    local dayElement = VanadielDayElement();
    if (dayElement == ICEDAY) then
        chance = 30;
        power = 30;
    end
    local diff = (player:getMod(MOD_CHR) - target:getMod(MOD_CHR)) /  2;

    if (math.random(0,99) + diff >= chance or applyResistanceAddEffect(player,target,ELE_ICE,diff) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_PARALYSIS, power, 0, 30);
        return SUBEFFECT_PARALYSIS, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_PARALYSIS;
    end
end;