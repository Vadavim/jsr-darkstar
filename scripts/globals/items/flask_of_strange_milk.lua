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
    if (target:hasStatusEffect(EFFECT_REGEN) == false) then
        target:addStatusEffect(EFFECT_REGEN,2 + target:getMainLvl() / 4,3,600);
    else
        target:messageBasic(423);
    end
end;

