-----------------------------------------
-- ID: 5437
-- Item: Flask of Strange Milk
-- Item Effect: Restores 500 HP over 300 seconds.
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
    target:addStatusEffect(EFFECT_PROWESS_CRYSTAL_YEILD, 1, 0, 900);
end;

