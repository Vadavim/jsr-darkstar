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
    target:addStatusEffect(EFFECT_INT_BOOST_II,40,0,300);
    target:addStatusEffect(EFFECT_CHR_BOOST_II,40,0,300);
    target:addStatusEffect(EFFECT_MND_BOOST_II,40,0,300);

end;
