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
    target:delStatusEffect(EFFECT_FAST_CAST);
    target:addStatusEffect(EFFECT_FAST_CAST,0,0,900);
    local fastcast = target:getStatusEffect(EFFECT_FAST_CAST);
    if (fastcast ~= nil) then
        target:addMod(MOD_UFASTCAST, 50);
        fastcast:addMod(MOD_UFASTCAST, 50);
    end

end;
