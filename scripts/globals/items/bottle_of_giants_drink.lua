-----------------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: +100% HP
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local duration = 900;
    target:delStatusEffect(EFFECT_MAX_HP_BOOST);
    target:addStatusEffect(EFFECT_MAX_HP_BOOST,100,0,duration);
    local effect = target:getStatusEffect(EFFECT_MAX_HP_BOOST);
    if (effect ~= nil) then
        local recovery = target:getMainLvl() / 10 + 1;
        effect:addMod(MOD_REGEN, recovery);
        target:addMod(MOD_REGEN, recovery);
    end

end;
